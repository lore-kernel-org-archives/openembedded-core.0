Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6B7E77A54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2SChhxJ008051; 
	Tue, 28 Mar 2017 13:44:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lwpH32fatH0Z; Tue, 28 Mar 2017 13:44:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2SCi3JG008184
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Mar 2017 13:44:04 +0100
Message-ID: <1490705043.13980.277.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 13:44:03 +0100
In-Reply-To: <c03b3d4d91d37d2b620230fe29158478fe985afe.1490704144.git.pkj@axis.com>
References: <cover.1490704144.git.pkj@axis.com>
	<c03b3d4d91d37d2b620230fe29158478fe985afe.1490704144.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] fetch2: Create/replace symbolic links atomically
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
X-List-Received-Date: Tue, 28 Mar 2017 12:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-28 at 14:30 +0200, Peter Kjellerstedt wrote:
> Under rare circumstances, creating symbolic links could fail because
> the link already exists. At first glance the code seemed to protect
> against this, but there was a small window where two separate tasks
> could decide that a symbolic link needed to be created and then the
> first task would create it and the second task would fail.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  bitbake/lib/bb/fetch2/__init__.py | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

As Ross says, this needs to go to the bitbake list. I'm also curious
why not watch for the "AlreadyExists" exception (whatever it really is)
and then simply pass over the error assuming the symlink points to the
same place? That saves messing with temporary files.

I also worry a little about the locking? Why have you two fetch
processes which are changing the same files but not covered by the same
lock file? :/

Cheers,

Richard

> diff --git a/bitbake/lib/bb/fetch2/__init__.py
> b/bitbake/lib/bb/fetch2/__init__.py
> index 464e66b98a..f891e34eab 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -25,7 +25,7 @@ BitBake build tools.
>  #
>  # Based on functions from the base bb module, Copyright 2003 Holger
> Schurig
>  
> -import os, re
> +import os, re, tempfile
>  import signal
>  import logging
>  import urllib.request, urllib.parse, urllib.error
> @@ -946,6 +946,16 @@ def rename_bad_checksum(ud, suffix):
>      bb.warn("Renaming %s to %s" % (ud.localpath, new_localpath))
>      bb.utils.movefile(ud.localpath, new_localpath)
>  
> +def atomic_symlink(src, dst):
> +    """Create/replace a symbolic link atomically."""
> +
> +    tmpname = tempfile.mktemp(prefix=dst)
> +    os.symlink(src, tmpname)
> +    try:
> +        os.rename(tmpname, dst)
> +    except OSError:
> +        os.remove(tmpname)
> +        raise
>  
>  def try_mirror_url(fetch, origud, ud, ld, check = False):
>      # Return of None or a value means we're finished
> @@ -983,7 +993,7 @@ def try_mirror_url(fetch, origud, ud, ld, check =
> False):
>                  open(ud.donestamp, 'w').close()
>              dest = os.path.join(dldir,
> os.path.basename(ud.localpath))
>              if not os.path.exists(dest):
> -                os.symlink(ud.localpath, dest)
> +                atomic_symlink(ud.localpath, dest)
>              if not verify_donestamp(origud, ld) or
> origud.method.need_update(origud, ld):
>                  origud.method.download(origud, ld)
>                  if hasattr(origud.method,"build_mirror_data"):
> @@ -991,11 +1001,7 @@ def try_mirror_url(fetch, origud, ud, ld, check
> = False):
>              return origud.localpath
>          # Otherwise the result is a local file:// and we symlink to
> it
>          if not os.path.exists(origud.localpath):
> -            if os.path.islink(origud.localpath):
> -                # Broken symbolic link
> -                os.unlink(origud.localpath)
> -
> -            os.symlink(ud.localpath, origud.localpath)
> +            atomic_symlink(ud.localpath, origud.localpath)
>          update_stamp(origud, ld)
>          return ud.localpath
>  
> -- 
> 2.12.0
> 

