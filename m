Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19F0960043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 00:41:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V0fRgb006295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 17:41:28 -0700 (PDT)
Received: from pek-lgao2-l1.corp.ad.wrs.com (172.25.34.15) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 17:41:27 -0700
To: Joshua Lock <joshua.g.lock@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1472562256.git.joshua.g.lock@intel.com>
	<5e6cdf1c7dc3acf0c262a6c34318e4bb103a2129.1472562256.git.joshua.g.lock@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d59ac9ac-f01a-685f-7315-efae6806ae80@windriver.com>
Date: Wed, 31 Aug 2016 08:41:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5e6cdf1c7dc3acf0c262a6c34318e4bb103a2129.1472562256.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH v2 2/3] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Wed, 31 Aug 2016 00:41:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/30/16 9:05 PM, Joshua Lock wrote:
> Pass appropriate options to tar invocations in copytree() and
> copyhardlinktree() to ensure that any extended attributes on the files
> are preserved during the copy.
> 
> We have to drop the use cpio in "Copy-pass" mode in copyhardlinktree()
> because cpio doesn't support extended attributes on files. Instead we
> revert back to using cp with different patterns depending on whether
> or not the directory contains dot files.
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
> +        if os.path.isdir(src):
> +            import glob
> +            if len(glob.glob('%s/.??*' % src)) > 0:
> +                src = src + '/.??* '
> +            src = src + '/*'
> +        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)

'cp -a' is a gnu-ism.  I'm not sure if this will cause any problems, but it has
in the past when people have used non coreutils 'cp'.

(I'm not sure if we're using 'cp -a' anywhere, but I know most of the time we
try to use the discrete set of arguments instead as they're more POSIX.)

(Otherwise the change looks good to me.)

>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>      else:
>          copytree(src, dst)
> 


