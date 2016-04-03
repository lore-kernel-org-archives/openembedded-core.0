Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB5477029
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 21:37:37 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id c4so33258401vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=UzW6CRVpCwJ5uPTjVrtMZiRHz/OlrTwxKNcocC6ZiEM=;
	b=FQWnFv3SndmINKSEybMbmQEfn+w+JgPkuVIYvN0UbApGfpMLcOejy9FyDt2Cf48EVR
	f0ogUVBVKIBcDOCTtuGg+KWn0ib1SYp8G4dz8MELxYss4scOy7RMdCKHtnHjAhGA8yaS
	uNV4y31Napr9687KTCy8uVP50hz6ObFdIPTvVSYdJ4uKPX9487BkfjuSS/P1tOpY9FEw
	DuptDDX4A3OekFA3DSw8EdYafhVwnahdG+HJvZVdho6R3vLkXuYW3Ndrt2/I7uQnmeCD
	FgAVpy8r7RqCYlhOSCJl8MRZH73bI83WacoD4QTU4wYAx3dbuzxh+l9GFBXEN+crYxYn
	Ldjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=UzW6CRVpCwJ5uPTjVrtMZiRHz/OlrTwxKNcocC6ZiEM=;
	b=YG0ES0AMBne3HCTC3zNiBsFvrQwPzLRuUcOJTtT423pF13t5G5J1dUfkWcpP5BU/Wp
	xnzjsv6ZAOg7ZcSxdjOXotDBpeViziB7EEbasY/U5tHiSRXjj7WFpiDoeBTe2JdJgZ/G
	0+zpwU5EV2o/G7Och3Uw+GzFGP2tESfMVW27f8jUP2zjA2C4I5NK0XzLJQJJkDXg5rsu
	/+Dokejlz2CTzfOpL7BDc6btDKCRQgaz7b4kxemCdiObJzYkKEi/5htQXDCrY9fXNIuc
	3yBYnDr8EFaK672+1LVRs+PZ6eFWpXDVTwyjjuQeDtmiXNXCOz2jtJcmpFVgsPDcZcoL
	cF8g==
X-Gm-Message-State: AD7BkJLMlcg6tNcqSEA/NJkVB47Bc3B1pQ3/d3PSmgVGTZ/aZoL3uSefTB84mSJxVI1MhUOgo12JK585jAgffQ==
MIME-Version: 1.0
X-Received: by 10.159.36.120 with SMTP id 111mr7830591uaq.29.1459719458111;
	Sun, 03 Apr 2016 14:37:38 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Sun, 3 Apr 2016 14:37:38 -0700 (PDT)
In-Reply-To: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
Date: Sun, 3 Apr 2016 23:37:38 +0200
Message-ID: <CALbNGRRGTw29HjrjAXT_TgS-opJEj=ek+XCh8iL7G51G-5b0ZA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 21:37:39 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 3, 2016 at 10:57 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
>
> Source files deployed with the *-dbg packages are owned by the user
> running bitbake leading to warnings as the one below.
>
> WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> ...
>
> The files are copied as part of the do_package task.
> The patch chowns all file in packages/usr/src after cpio copied them into the
> package directory.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>
>
>  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index bdbe96d..d9ef62c 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
>      # and copied to the destination here.
>
>      import stat
> +    import subprocess
>
>      sourcefile = d.expand("${WORKDIR}/debugsources.list")
>      if debugsrcdir and os.path.isfile(sourcefile):
> @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
>          if retval:
>              bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
>
> +        # cpio --no-preserve-owner does not create the destination files with
> +        # owner root even when run under pseudo, chown them explicitely.
> +        fakerootcmd = d.getVar('FAKEROOTCMD', True)
> +        if not os.path.exists(fakerootcmd):
> +            logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
> +            return 2
> +        # Set up the appropriate environment
> +        newenv = dict(os.environ)
> +        fakerootenv = d.getVar('FAKEROOTENV', True)
> +        for varvalue in fakerootenv.split():
> +            if '=' in varvalue:
> +                splitval = varvalue.split('=', 1)
> +                newenv[splitval[0]] = splitval[1]
> +        kwargs = dict(env = newenv, shell = True)
> +
> +        cmd = "find '%s%s' -not -uid 0 -exec chown 0:0 {} \;" % (dvar, debugsrcdir)
> +        if fakerootcmd is not None:
> +            cmd = "%s %s" % (fakerootcmd, cmd)
> +        retval = subprocess.call(cmd, **kwargs)
> +        if retval:
> +            bb.fatal("debugsrc chown failed with code %s (cmd was %s)" % (retval, cmd))
> +
>          # The copy by cpio may have resulted in some empty directories!  Remove these
>          cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
>          (retval, output) = oe.utils.getstatusoutput(cmd)
> --
> 2.6.2
>
Thanks a lot - I've applied and started a test build.

Andreas

