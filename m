Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAEC7706C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:48:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7QFmx6v007238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 08:48:59 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 26 Aug 2016 08:48:58 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <921e5cf0-9980-1133-ec0b-bc874ae9c4fb@windriver.com>
Date: Fri, 26 Aug 2016 10:48:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Fri, 26 Aug 2016 15:49:01 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/26/16 10:43 AM, Joshua Lock wrote:
> Pass appropriate options to tar invocations in copytree() and
> copyhardlinktree() to ensure that any extended attributes on the files
> are preserved during the copy.
> 
> We have to drop the use cpio in "Copy-pass" mode in copyhardlinktree()
> because cpio doesn't support extended attributes on files. Instead we
> revert back to using cp with different patterns depending on whether
> or not the directory contains dot files.
> 
> [YOCTO #9857]
> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/lib/oe/path.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 3c07df3..631c3b4 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -65,7 +65,7 @@ def copytree(src, dst):
>      # This way we also preserve hardlinks between files in the tree.
>  
>      bb.utils.mkdirhier(dst)
> -    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
> +    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
>      subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>  
>  def copyhardlinktree(src, dst):
> @@ -77,9 +77,14 @@ def copyhardlinktree(src, dst):
>      if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>          # Need to copy directories only with tar first since cp will error if two 
>          # writers try and create a directory at the same time
> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
> +        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> -        cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' % (src, dst)

The reason why cpio was originally used had to do with filenames that had spaces
or other special characters in them.  (this is why the -print0 was used)

I don't object to the change, but we need to make sure that that will still work
properly.

(Also I thought CPIO -could- do xattrs in the current versions...)

--Mark

> +        if os.path.isdir(src):
> +            import glob
> +            if len(glob.glob('%s/.??*' % src)) > 0:
> +                src = src + '/.??* '
> +            src = src + '/*'
> +        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>      else:
>          copytree(src, dst)
> 


