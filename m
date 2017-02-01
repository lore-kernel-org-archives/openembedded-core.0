Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 854846FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11BNHdo009165; Wed, 1 Feb 2017 11:23:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Gy8LZKYOjtP3; Wed,  1 Feb 2017 11:23:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11BNEAX009162
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 11:23:16 GMT
Message-ID: <1485948194.14144.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2017 11:23:14 +0000
In-Reply-To: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
References: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] sstate: Fix make_relative_symlink() for RSS
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
X-List-Received-Date: Wed, 01 Feb 2017 11:23:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:
> Recipe-specific sysroots broke make_relative_symlink(), which
> turns absolute symlinks in sysroots into relative ones. Use the
> difference between the (in-sysroot) paths to construct the relative
> symlink.
> 
> This fixes links in openssl-native, fontconfig-native and bzip2-
> native.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> 
> sstate is not an area I'm familiar with, please take a good look.
> 
> As far as I could see outputpath (based on state[2]) was never really
> needed so I did not use it in the new version.

I don't think we can hardcode workdir into here as for tasks like
do_deploy, this makes no sense. I think we removed most of the absolute
links from the deploy tasks so we currently don't need this, at least
in the common case but the sstate code is meant to be generic.

I am wondering if we need to pass in anything at all, can't we just
call relpath on the original path and turn it into a relative one
directly without referencing it back to TMPDIR/WORKDIR?

Cheers,

Richard
> 
> Thanks,
>  Jussi
> 
> 
>  meta/classes/sstate.bbclass | 35 ++++++++++++-----------------------
>  1 file changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> index aeb7466..7f99cd3 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -583,32 +583,27 @@ python sstate_hardcode_path () {
>  def sstate_package(ss, d):
>      import oe.path
>  
> -    def make_relative_symlink(path, outputpath, d):
> -        # Replace out absolute TMPDIR paths in symlinks with
> relative ones
> +    def make_relative_symlink(path, workdir, d):
> +        # Replace absolute sysroot paths in symlinks with relative
> ones
>          if not os.path.islink(path):
>              return
>          link = os.readlink(path)
>          if not os.path.isabs(link):
>              return
> -        if not link.startswith(tmpdir):
> +        if not link.startswith(workdir):
>              return
>  
> -        #base = os.path.relpath(link, os.path.dirname(path))
> +        directory = os.path.dirname(path.rpartition(workdir)[2])
> +        base_link = link.rpartition(workdir)[2]
> +        rel_path = os.path.relpath(base_link,directory)
>  
> -        depth = outputpath.rpartition(tmpdir)[2].count('/')
> -        base = link.partition(tmpdir)[2].strip()
> -        while depth > 1:
> -            base = "/.." + base
> -            depth -= 1
> -        base = "." + base
> -
> -        bb.debug(2, "Replacing absolute path %s with relative path
> %s for %s" % (link, base, outputpath))
> +        bb.debug(2, "Replacing absolute path %s with relative path
> %s for %s" % (link, rel_path, path))
>          os.remove(path)
> -        os.symlink(base, path)
> +        os.symlink(rel_path, path)
>  
> -    tmpdir = d.getVar('TMPDIR')
> +    workdir = d.getVar('WORKDIR')
>  
> -    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" %
> ss['task'])
> +    sstatebuild = workdir + "/sstate-build-" +ss['task'] + "/"
>      sstatepkg = d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
>      bb.utils.remove(sstatebuild, recurse=True)
>      bb.utils.mkdirhier(sstatebuild)
> @@ -620,18 +615,12 @@ def sstate_package(ss, d):
>              continue
>          srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
>          for walkroot, dirs, files in os.walk(state[1]):
> -            for file in files:
> +            for file in files + dirs:
>                  srcpath = os.path.join(walkroot, file)
> -                dstpath = srcpath.replace(state[1], state[2])
> -                make_relative_symlink(srcpath, dstpath, d)
> -            for dir in dirs:
> -                srcpath = os.path.join(walkroot, dir)
> -                dstpath = srcpath.replace(state[1], state[2])
> -                make_relative_symlink(srcpath, dstpath, d)
> +                make_relative_symlink(srcpath, workdir, d)
>          bb.debug(2, "Preparing tree %s for packaging at %s" %
> (state[1], sstatebuild + state[0]))
>          os.rename(state[1], sstatebuild + state[0])
>  
> -    workdir = d.getVar('WORKDIR')
>      for plain in ss['plaindirs']:
>          pdir = plain.replace(workdir, sstatebuild)
>          bb.utils.mkdirhier(plain)
> -- 
> 2.1.4
> 

