Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7D7C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:08:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.8095.1666793319830353402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m2PIPjah;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id sc25so21499826ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unBXmBcoDxXW0/i7EnZ/IBFXZS99K+1AJAG/5OMymz8=;
        b=m2PIPjahtBC6FvIWwElqfKDvv+K77fW784Fru+PZcRwoM6ht0Xn3IVdmr4Tu0uIwxQ
         ZdJPavrU5wouIcb4NcvH3fFXj+BrAtIdFjbCTYxorY7oi4nfUVECoIt0LIxt2SLPfjNt
         KMtrrproOj0lIPqkGwad9m8NyBKo21liBhQ2HE9cPDC2XDqq46a3r0JssTREs2Lw71NM
         ZGKYA0QUkyhEn6xm0ZuMSKixMtQn/VgBhOEWjOXyx+YTbPABZ20oiywMoRL3r0ghDfM3
         5X0+4BpjSDGFhG8X+ef4Me82L0e3m1oHjxITcO/5rPTEJxIW0gK4NMgEmQDr3oZzw/gO
         jREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unBXmBcoDxXW0/i7EnZ/IBFXZS99K+1AJAG/5OMymz8=;
        b=WIXYIhm6fXWcQrf2JeE9FDQBunuMxt1meWu0Hk8O84Rghn/StSbdl7XKkae8/c72U4
         d+kHP/uzMnypTBoxsWxlxoqI0gHHyPYFGB7JXYEGEONeTzYsjFkWt4j4KwY3LLqeIKRI
         911pFax35ZvpQv3NE3LGX4Weyz6OoynY/4pLODKy+bHZW34BpzvAKRBbaLgGsSn3hKHX
         MfS18RV6fPAB3NYsn2zyJLh6B6N7S5/a5nn8WjeO609QKmyYMpTNUbwRb5ldeI5Ny3y0
         xa41apdTkAFrRIO60aEAfPuz/gSnkvPQaqbS5DQ8Yhok5WJXZEQXNmSUaH8DJsWOF/v1
         KKJQ==
X-Gm-Message-State: ACrzQf1oOem938Hy36t6ez+7sX4sDVO8xuQ+fOE7rUdA7a2JsginCELY
	+JtrcuFsC+b7AmIZOe+TqWPYMx5FFtG5xRlcWprXbxIn
X-Google-Smtp-Source: AMsMyM4aEguRoXXJ9OvPDebC3nna3jneH5JM6RdcBQFqjYIEZJj5Rd3XS0n4FpPOUQ4Kb7x3f4ymr50yu7I7If64IiI=
X-Received: by 2002:a17:907:2c4a:b0:78d:ee99:a06b with SMTP id
 hf10-20020a1709072c4a00b0078dee99a06bmr36271806ejc.578.1666793317879; Wed, 26
 Oct 2022 07:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221021192344.147477-1-JPEWhacker@gmail.com>
In-Reply-To: <20221021192344.147477-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 26 Oct 2022 09:08:25 -0500
Message-ID: <CAJdd5Ga5WD_A-HurDPkrsyW_h3gb2hoC6hHDXBdm310zf2z9Ew@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: Do not perturb script environment
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172157

Steve,

Please backport this to kirkstone at your convenience.

Thanks

On Fri, Oct 21, 2022 at 2:23 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Instead of changing the script environment to affect the child
> processes, make a copy of the environment with modifications and pass
> that to subprocess.
>
> Specifically, when dri rendering is enabled, LD_PRELOAD was being passed
> to all processes created by the script which resulted in other commands
> (e.g. stty) exiting with a failure like:
>
>  /bin/sh: symbol lookup error: sysroots-uninative/x86_64-linux/lib/librt.so.1: undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
>
> Making a copy of the environment fixes this because the LD_PRELOAD is
> now only passed to qemu itself.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  scripts/runqemu | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 189fc3da91..a6ea578564 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -210,6 +210,7 @@ class BaseConfig(object):
>          self.mac_tap = "52:54:00:12:34:"
>          self.mac_slirp = "52:54:00:12:35:"
>          # pid of the actual qemu process
> +        self.qemu_environ = os.environ.copy()
>          self.qemupid = None
>          # avoid cleanup twice
>          self.cleaned = False
> @@ -449,18 +450,19 @@ class BaseConfig(object):
>          # As runqemu can be run within bitbake (when using testimage, for example),
>          # we need to ensure that we run host pkg-config, and that it does not
>          # get mis-directed to native build paths set by bitbake.
> +        env = os.environ.copy()
>          try:
> -            del os.environ['PKG_CONFIG_PATH']
> -            del os.environ['PKG_CONFIG_DIR']
> -            del os.environ['PKG_CONFIG_LIBDIR']
> -            del os.environ['PKG_CONFIG_SYSROOT_DIR']
> +            del env['PKG_CONFIG_PATH']
> +            del env['PKG_CONFIG_DIR']
> +            del env['PKG_CONFIG_LIBDIR']
> +            del env['PKG_CONFIG_SYSROOT_DIR']
>          except KeyError:
>              pass
>          try:
> -            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
> +            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True, env=env)
>          except subprocess.CalledProcessError as e:
>              raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
> -        os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> +        self.qemu_environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
>
>          # This preloads uninative libc pieces and therefore ensures that RPATH/RUNPATH
>          # in host mesa drivers doesn't trick uninative into loading host libc.
> @@ -468,7 +470,7 @@ class BaseConfig(object):
>          uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
>          if os.path.exists(uninative_path):
>              preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> -            os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> +            self.qemu_environ['LD_PRELOAD'] = " ".join(preload_paths)
>
>      def check_args(self):
>          for debug in ("-d", "--debug"):
> @@ -482,8 +484,8 @@ class BaseConfig(object):
>                  sys.argv.remove(quiet)
>
>          if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
> -            os.environ['SDL_RENDER_DRIVER'] = 'software'
> -            os.environ['SDL_FRAMEBUFFER_ACCELERATION'] = 'false'
> +            self.qemu_environ['SDL_RENDER_DRIVER'] = 'software'
> +            self.qemu_environ['SDL_FRAMEBUFFER_ACCELERATION'] = 'false'
>
>          unknown_arg = ""
>          for arg in sys.argv[1:]:
> @@ -1369,7 +1371,7 @@ class BaseConfig(object):
>          # need our font setup and show-cusor below so we need to see what qemu --help says
>          # is supported so we can pass our correct config in.
>          if not self.nographic and not self.sdl and not self.gtk and not self.publicvnc and not self.egl_headless == True:
> -            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True)
> +            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True, env=self.qemu_environ)
>              if "-display gtk" in output:
>                  self.gtk = True
>              elif "-display sdl" in output:
> @@ -1393,7 +1395,7 @@ class BaseConfig(object):
>                  if self.sdl == True:
>                      self.qemu_opt += 'sdl,'
>                  elif self.gtk == True:
> -                    os.environ['FONTCONFIG_PATH'] = '/etc/fonts'
> +                    self.qemu_environ['FONTCONFIG_PATH'] = '/etc/fonts'
>                      self.qemu_opt += 'gtk,'
>
>                  if self.gl == True:
> @@ -1514,7 +1516,7 @@ class BaseConfig(object):
>          if len(self.portlocks):
>              for descriptor in self.portlocks.values():
>                  pass_fds.append(descriptor.fileno())
> -        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
> +        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
>          self.qemupid = process.pid
>          retcode = process.wait()
>          if retcode:
> --
> 2.33.0
>

