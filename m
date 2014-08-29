Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAF070EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:36:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7TIam0K005367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:36:49 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 11:36:45 -0700
Message-ID: <5400C83C.3020306@windriver.com>
Date: Fri, 29 Aug 2014 13:36:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1409333952.29296.195.camel@ted>
In-Reply-To: <1409333952.29296.195.camel@ted>
Subject: Re: [PATCH] package_rpm: Add optional improved directory handling
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
X-List-Received-Date: Fri, 29 Aug 2014 18:36:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 12:39 PM, Richard Purdie wrote:
> From: Ronan Le Martret <ronan@fridu.net>
>
> During spec generation, ideally directories should not be auto
> packaged under the %file section of rpm packages but take ownership of
> specific directories.
>
> * packages only empty directories or explict directory.
>     See:
>         - http://www.rpm.org/max-rpm/s1-rpm-inside-files-list-directives.html
>         - "The %dir Directive"
>
> * This will prevent the overlapping of security permission.
>     For example, in Tizen the directory /etc have smack label 'System::Shared'
>     So Only one package should own and set the label of /etc to prevent
>     the overwriting of the smack label.
>
> Existing behaviour is maintained if DIRFILES is not set. If it is set,
> the modified behaviour is used.
>
> [RP: Modified to allow optional usage of DIRFILES]

I'm not sure I understand what is trying to be accomplished here.

Within RPM (4 and 5) it's completely legal for two packages to contain the same 
directory and permissions entries.  This is preferable for our environment as it 
allows the necessary directories to be generated as packages are installed that 
use these directories.  (Otherwise we have to have "directory" packages that 
install common directories -- or base packages that own directories for a group 
of packages.)

I think it's a bug in the SMACK labeling that it doesn't support packages having 
multiple directory support.

With that said see below..

> Signed-off-by: Ronan Le Martret <ronan@fridu.net>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0a32b3e..eecfcb2 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -185,7 +185,7 @@ python write_specfile () {
>                   if not len(depends_dict[dep]):
>                       array.append("%s: %s" % (tag, dep))
>
> -    def walk_files(walkpath, target, conffiles):
> +    def walk_files(walkpath, target, conffiles, dirfiles):
>           # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
>           # when packaging. We just ignore these files which are created in
>           # packages-split/ and not package/
> @@ -196,11 +196,24 @@ python write_specfile () {
>               path = rootpath.replace(walkpath, "")
>               if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>                   continue
> -            for dir in dirs:
> -                if dir == "CONTROL" or dir == "DEBIAN":
> -                    continue
> -                # All packages own the directories their files are in...
> -                target.append('%dir "' + path + '/' + dir + '"')
> +
> +            # Directory handling can happen in two ways, either DIRFILES is not set at all
> +            # in which case we fall back to the older behaviour of packages owning all their
> +            # directories
> +            if dirfiles is None:

So if dirfiles is none (the normal case) it -will- package directories, correct? 
  So what happens when you have a recipe that you don't want to package any 
directories?

Having to define dirfiles seems to be backwards to me.  A blacklist behavior 
seems more sane, as a way to say "I use this, but I don't own it."

Along those lines (blacklist vs include list), the system directories should 
already be defined in the meta/files/fs-perms.txt (or related perms files 
configured by "FILESYSTEM_PERMS_TABLES".

The purpose is to capture system directories that are shared between different 
recipes to ensure they have the same permissions.

It should be possible to (safely) extend this to include additional common 
permissions [might violate SMACK security] or directories that should not be 
packaged because they are 'system' directories.

(Note in the later case, we definitely need at least one 'directory owner' 
package to handle those -- or they will be generated on demand with default 
system permissions of 0755 root,root  -- which is not always what is desired!)

> +                for dir in dirs:
> +                    if dir == "CONTROL" or dir == "DEBIAN":
> +                        continue
> +                    # All packages own the directories their files are in...
> +                    target.append('%dir "' + path + '/' + dir + '"')
> +            else:
> +                # packages own only empty directories or explict directory.
> +                # This will prevent the overlapping of security permission.
> +                if path and not files and not dirs:
> +                    target.append('%dir "' + path + '"')
> +                elif path and path in dirfiles:
> +                    target.append('%dir "' + path + '"')
> +
>               for file in files:
>                   if file == "CONTROL" or file == "DEBIAN":
>                       continue
> @@ -311,6 +324,9 @@ python write_specfile () {
>           bb.data.update_data(localdata)
>
>           conffiles = (localdata.getVar('CONFFILES', True) or "").split()
> +        dirfiles = localdata.getVar('DIRFILES', True)
> +        if dirfiles is not None:
> +            dirfiles = dirfiles.split()

(tabs and spaces mismatch? or just a mailer issue mangling spacing?)

>
>           splitname    = strip_multilib(pkgname, d)
>
> @@ -367,7 +383,7 @@ python write_specfile () {
>               srcrpostrm     = splitrpostrm
>
>               file_list = []
> -            walk_files(root, file_list, conffiles)
> +            walk_files(root, file_list, conffiles, dirfiles)
>               if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
>                   bb.note("Not creating empty RPM package for %s" % splitname)
>               else:
> @@ -474,7 +490,7 @@ python write_specfile () {
>
>           # Now process files
>           file_list = []
> -        walk_files(root, file_list, conffiles)
> +        walk_files(root, file_list, conffiles, dirfiles)
>           if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
>               bb.note("Not creating empty RPM package for %s" % splitname)
>           else:
>
>


