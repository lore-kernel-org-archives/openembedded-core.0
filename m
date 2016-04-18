Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A57960123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 08:09:01 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so21792823vka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BZWcCktdxQoZ8AghMcbfKK6rokPZ0PnpBSQpduQ7Gno=;
	b=1KTzicWWkh3jEmgCHvOZ/mxtJ1decaFuw0x/qR3slcSlV0+64+QRWPd+PKdQn990+R
	NS1WIEMTykCvxc9Bo+wy+2qRJV/vDK38+okUpx68JAiTdxRwlUN2KOV0azRPqX2ORja+
	X6GfNyDca5Dph8Tgf8MPBwN/jCRUoygNRIw9Hh7MnghGWDDNquV3CikMx1DJPIYobdNd
	EDS9laMu/ksVQdiFhFG/MCcxH/X8wn00ru97t0c4MxPc0uuc00d7XKxfDaYvWGkdXJhS
	7BO9NAaKbTvcaTXk7uECjFw8F1iG55W2kyr7cTsrCgk73lDJiJnhXW1CZ/6szEehWiw4
	fEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BZWcCktdxQoZ8AghMcbfKK6rokPZ0PnpBSQpduQ7Gno=;
	b=XUSwtS122adlpfB+cNnNWiThxicMninU+zchFjlsPNKe2QWi5Wg6QalZE9I4cAwA6P
	NC9LP0rmeC7ri/54enqy3zX1E49Wn8eHgqQYRmX//lXcIQtsPrZWmDReds4j8LpjJMqi
	gVD5jWuOv9bE3DzhWIq4GKPeWAQ9+z6QSNKjUddFT/KFNwsfyykWoCAfbuBkMuOjXBhk
	7hzRaB1M124rnoGhUgqUiyCmUDWvjqbDxbTMT7im7A5H26p8cAOmAACNOKX24u/7wVqn
	wEcTPgTO/MROKmzyFkMvZ491COWD/ft7l3UV4+5h1lSZyEXHE25S2rnb9pQeUp/+YK4H
	vyug==
X-Gm-Message-State: AOPr4FVxsPB0OXiNLBoaJouBZLVKKBX32O5sIqRwsP345LCeEN+J42xvaw2+SwgDpPCjRUcfrSIOjnAMhYqwpw==
MIME-Version: 1.0
X-Received: by 10.159.55.172 with SMTP id q41mr7111820uaq.29.1460966941805;
	Mon, 18 Apr 2016 01:09:01 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 01:09:01 -0700 (PDT)
In-Reply-To: <62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
Date: Mon, 18 Apr 2016 10:09:01 +0200
Message-ID: <CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 08:09:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 28, 2016 at 10:18 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Tweak DEBUG_FLAGS to use "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
> as source target path in DWARF. While use gdb to debug binary, it could
> work with sources in dbg package.
>
> While -fdebug-prefix-map is used for compiling, we do not need invoking
> debugedit to edit DWARF at do_package time, but list where sources files
> are.
>
> The copydebugsources uses the list to copy sources to dbg package. It
> works whether -fdebug-prefix-map used or not.
>
> [YOCTO #9305]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/package.bbclass | 24 ++++++++++++++++++++----
>  meta/conf/bitbake.conf       |  3 +--
>  2 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 5a84255..bdbe96d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -300,6 +300,15 @@ def get_conffiles(pkg, d):
>      os.chdir(cwd)
>      return conf_list
>
> +def checkbuildpath(file, d):
> +    tmpdir = d.getVar('TMPDIR', True)
> +    with open(file) as f:
> +        file_content = f.read()
> +        if tmpdir in file_content:
> +            return True
> +
> +    return False
> +
>  def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>      # Function to split a single file into two components, one is the stripped
>      # target system binary, the other contains any debugging information. The
> @@ -312,8 +321,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>      dvar = d.getVar('PKGD', True)
>      objcopy = d.getVar("OBJCOPY", True)
>      debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
> -    workdir = d.getVar("WORKDIR", True)
> -    workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(os.path.dirname(workdir))
>
>      # We ignore kernel modules, we don't generate debug info files.
>      if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> @@ -327,7 +334,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>
>      # We need to extract the debug src information here...
>      if debugsrcdir:
> -        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
> +        cmd = "'%s' -i -l '%s' '%s'" % (debugedit, sourcefile, file)
>          (retval, output) = oe.utils.getstatusoutput(cmd)
>          if retval:
>              bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> @@ -366,6 +373,13 @@ def copydebugsources(debugsrcdir, d):
>          workparentdir = os.path.dirname(os.path.dirname(workdir))
>          workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
>
> +        # If build path exists in sourcefile, it means toolchain did not use
> +        # -fdebug-prefix-map to compile
> +        if checkbuildpath(sourcefile, d):
> +            localsrc_prefix = workparentdir + "/"
> +        else:
> +            localsrc_prefix = "/usr/src/debug/"
> +
>          nosuchdir = []
>          basepath = dvar
>          for p in debugsrcdir.split("/"):
> @@ -379,9 +393,11 @@ def copydebugsources(debugsrcdir, d):
>          # We need to ignore files that are not actually ours
>          # we do this by only paying attention to items from this package
>          processdebugsrc += "fgrep -zw '%s' | "
> +        # Remove prefix in the source paths
> +        processdebugsrc += "sed 's#%s##g' | "
>          processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
>
> -        cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
> +        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
>          (retval, output) = oe.utils.getstatusoutput(cmd)
>          # Can "fail" if internal headers/transient sources are attempted
>          #if retval:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e3db504..0eb288e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -550,8 +550,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
> -                -fdebug-prefix-map=${B}=/usr/src/${BPN} \
> -                -fdebug-prefix-map=${S}=/usr/src/${BPN} \
> +                -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
>                  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>                  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>  "
> --
> 1.9.1
>
Has anybody tried remote debugging with this patch applied? For me the
source files are no more found and I think this patch looks
suspicious...

Andreas

