Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D26870632
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6MGXYjo003395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 09:33:34 -0700 (PDT)
Received: from msp-dhcp53.wrs.com (172.25.34.53) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 09:33:33 -0700
Message-ID: <53CE925D.4000503@windriver.com>
Date: Tue, 22 Jul 2014 11:33:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406041513-9294-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1406041513-9294-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] package_rpm: only claim ownership of empty directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 16:33:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/14, 10:05 AM, Ross Burton wrote:
> Previous every package claimed ownership via %dir of every directory, which lead
> to e.g. every package claiming to own /usr.  This destroys the concept of
> directory ownership, so instead only use %dir to ensure empty directories are
> packaged.

This was intentional.

RPM5 has a feature where all of the directories are 'dependencies' of the files 
automatically.  This ensures that the directories are all owned and have 
suitable base permissions.  Otherwise what happens, if a directory is NOT owned, 
it gets a default root root 0755, which is often incorrect!

In the Fedora world, they resolve this by having a specific "filesystem" package 
that is installed first, it lays down the default LSB style filesystem and sets 
the base system permissions.  Then each package is responsible for owning the 
directories that it adds on top of the default filesystem configuration.

Since we don't have any equivalent to the default filesystem package, the 
alternative was to sync up the filesystem directory permissions (in part of 
do_package) -- and then have each package own each directory it uses.  This is 
what actually PRESERVES the concept of the directory ownership and permissions 
syncing across the system.

By doing this we don't end up with empty LSB style directories, but instead we 
have a compact filesystem where all of the files are owned, packages can be 
removed and added and the filesystem directory permissions are maintained 
accordingly.

Making this change will break the system behavior -- the only alternative is to 
create a base filesystem package, seed it with the base system directories -- 
and then only have the packages provide the directories outside of the base 
filesystem package.  This was rejected back when it was suggested a few years back.

So I strongly suggest a NAK on this.

--Mark

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/package_rpm.bbclass |   45 +++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0a32b3e..9e6b103 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -186,28 +186,33 @@ python write_specfile () {
>                       array.append("%s: %s" % (tag, dep))
>
>       def walk_files(walkpath, target, conffiles):
> -        # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
> -        # when packaging. We just ignore these files which are created in
> -        # packages-split/ and not package/
> -        # We have the odd situation where the CONTROL/DEBIAN directory can be removed in the middle of
> -        # of the walk, the isdir() test would then fail and the walk code would assume its a file
> -        # hence we check for the names in files too.
>           for rootpath, dirs, files in os.walk(walkpath):
> -            path = rootpath.replace(walkpath, "")
> -            if path.endswith("DEBIAN") or path.endswith("CONTROL"):
> -                continue
> -            for dir in dirs:
> -                if dir == "CONTROL" or dir == "DEBIAN":
> -                    continue
> -                # All packages own the directories their files are in...
> -                target.append('%dir "' + path + '/' + dir + '"')
> -            for file in files:
> -                if file == "CONTROL" or file == "DEBIAN":
> -                    continue
> -                if conffiles.count(path + '/' + file):
> -                    target.append('%config "' + path + '/' + file + '"')
> +            # Ignore the CONTROL and DEBIAN directories, created by ipkg and
> +            # dpkg during packaging.  As they can be removed while this is
> +            # running (and so the isdir() test fails) ignore both files and
> +            # directories.
> +            for n in ("CONTROL", "DEBIAN"):
> +                try:
> +                    dirs.remove(n)
> +                    files.remove(n)
> +                except ValueError:
> +                    pass
> +
> +            # When rootpath is walkpath the replace will return "" so handle
> +            # that and set path to /.
> +            path = rootpath.replace(walkpath, "") or "/"
> +
> +            # Packages own only empty directories, but handle / specially as we
> +            # don't want empty packages to contain a %dir / entry.
> +            if (path != '/' and not files and not dirs):
> +                target.append('%dir "' + path + '"')
> +
> +            for f in files:
> +                f = os.path.join(path, f)
> +                if f in conffiles:
> +                    target.append('%config "' + f + '"')
>                   else:
> -                    target.append('"' + path + '/' + file + '"')
> +                    target.append('"' + f + '"')
>
>       # Prevent the prerm/postrm scripts from being run during an upgrade
>       def wrap_uninstall(scriptvar):
>


