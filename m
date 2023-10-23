Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE83EC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:13:40 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.117879.1698059618954042564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 04:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CN9kOkgi;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so48097021fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059617; x=1698664417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0g/IekIVZo8hHXnMAotnnPt5OB2UuuSV8gw8yknYqU=;
        b=CN9kOkgikdLNKeR6JaEhqOy6NYB0o1rpsXrd82NvoLcPf8j2HiW+Bnc1ZJhGOwNvxi
         K5YF343gyx4PrvmlDDhmSpT3lkbhVAEH8jEBOcdmu88shWA8UycdeFygvYKOkoVzknM5
         g7snm39I5hLowbXcR1nnVt6mD+21yWJTET8kkS3Efggw9IcyVetGm1rrWSx9nZ8bvkbQ
         i90ChTfWmh41g1HupO2TV/sERDQMEzVu27uKc39Qzc2KhYD+dkQ1+dNXSflZ90eL4yew
         nwpTowej4ArDqL21KqDSDMWn4emIPOSpemjpNKUU8XvF+321sx+96jk1xkBC0rADs5PP
         pwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059617; x=1698664417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0g/IekIVZo8hHXnMAotnnPt5OB2UuuSV8gw8yknYqU=;
        b=gPq98mXJywnmvcM8pzGCUQ2eK5/SK/JVgpCL4G0nlr4jaVG3VWwlJroPoMNUOdpuyl
         Tett9j9RmxJH00O2hvRAC24EjvSTBYuC5vWWETp7O+I78hkQFVel/GbDrSJv5wq6aIQv
         a0AfYzr7Rm3POXAOz1zZf9/zHycAoJn1ufODghFz89FZXdsSImIfRPy8m1brFTwOtXWn
         iY16FTGa1Kmb93qKoFdCUiKkSHbfi4bXAV1S3h2khH9pfwEWNlkyLq3uWhjGJUU6SbLn
         YU6osUMwWEWzpXL1b4DAvu26sen01LZVsZFoU+W3q6ozHFvp7nnYVnStmAs/XBhyUXAj
         N/OA==
X-Gm-Message-State: AOJu0Yx3mseFNtlyz84r1RfYCTnFPkrJBpZ/mCIhYO581zY6vxOHhtWh
	0nH9auElbLxOTFsiyiiysMvJqIOqn8lB2Y9zhasJo8L7
X-Google-Smtp-Source: AGHT+IHk7R+xZDjYXQD7wN+6w91x3AJEgMSF+N09a8eaEhNkyY3I5sA7P3+MHNvpJ8nLfYn5k0+t6FvkRTgF8LrovVY=
X-Received: by 2002:a2e:7004:0:b0:2c2:9872:dfc1 with SMTP id
 l4-20020a2e7004000000b002c29872dfc1mr6210239ljc.42.1698059616742; Mon, 23 Oct
 2023 04:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <1698042855-3883-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1698042855-3883-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Oct 2023 13:13:24 +0200
Message-ID: <CANNYZj-KA6BnqWt4wU+EuqKiXDnLGZRE_1N17JKNxY0VFwivHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] cairo:Add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189622

Thanks for working on this. I think the ptest support should be held
until after we update to cairo 1.18.0 though, it's a major upgrade
with years of development work, and ptest support almost certainly
needs a bit of forward porting effort.

If you can do the cairo update to 1.18.0 first, I would really appreciate that.

Alex

On Mon, 23 Oct 2023 at 08:34, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
>
> From: Qiu Tingting <qiutt@fujitsu.com>
>
> Add a ptest for cairo
> - It is taking around 65s to execute with kvm, so added it to PTESTS_SLOW
> - It contains 429 cases
> - Below is parts of the run log:
>   START: ptest-runner
>   2023-10-17T05:56
>   BEGIN: /usr/lib/cairo/ptest
>
>   TESTING cairo-test-suite
>   Compiled against cairo 1.16.0, running on 1.16.0.
>   Compiled against pixman 0.42.2, running on 0.42.2.
>
>   TESTING a1-bug
>   a1-bug.image.argb32 [0x1]:  PASS
>
>   ...
>   TESTING fallback-resolution
>   UNTESTED: fallback-resolution
>   402 Passed, 13 Failed [0 crashed, 13 expected], 14 Skipped
>   DURATION: 65
>   END: /usr/lib/cairo/ptest
>   2023-10-17T05:51
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
>
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-graphics/cairo/cairo/ptest.patch | 58 +++++++++++
>  meta/recipes-graphics/cairo/cairo/run-ptest   | 20 ++++
>  meta/recipes-graphics/cairo/cairo/skiplist    | 97 +++++++++++++++++++
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 24 +++++
>  5 files changed, 200 insertions(+)
>  create mode 100644 meta/recipes-graphics/cairo/cairo/ptest.patch
>  create mode 100644 meta/recipes-graphics/cairo/cairo/run-ptest
>  create mode 100644 meta/recipes-graphics/cairo/cairo/skiplist
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 680b01b3b5..aa8aeaaa1b 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -89,6 +89,7 @@ PTESTS_PROBLEMS:append:riscv32 = " qemu"
>  PTESTS_SLOW = "\
>      apr \
>      bzip2 \
> +    cairo \
>      coreutils \
>      curl \
>      dbus \
> diff --git a/meta/recipes-graphics/cairo/cairo/ptest.patch b/meta/recipes-graphics/cairo/cairo/ptest.patch
> new file mode 100644
> index 0000000000..cbbafb1f0f
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/ptest.patch
> @@ -0,0 +1,58 @@
> +change cairo-test-suite output with ptest formate.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> +
> +diff -rNu a/test/cairo-test-runner.c b/test/cairo-test-runner.c
> +--- a/test/cairo-test-runner.c 2023-10-13 15:51:25.986798896 +0800
> ++++ b/test/cairo-test-runner.c 2023-10-16 13:57:41.323640064 +0800
> +@@ -1011,9 +1011,9 @@
> +                   }
> +               }
> +               targets[len-2] = '\0';
> +-              _log (&runner.base, "\n%s: CRASH! (%s)\n", name, targets);
> ++              _log (&runner.base, "\nCRASH: %s (%s)\n", name, targets);
> +           } else {
> +-              _log (&runner.base, "\n%s: CRASH!\n", name);
> ++              _log (&runner.base, "\nCRASH: %s\n", name);
> +           }
> +           runner.num_crashed++;
> +           runner.passed = FALSE;
> +@@ -1033,9 +1033,9 @@
> +                   }
> +               }
> +               targets[len-2] = '\0';
> +-              _log (&runner.base, "%s: ERROR (%s)\n", name, targets);
> ++              _log (&runner.base, "ERROR: %s (%s)\n", name, targets);
> +           } else {
> +-              _log (&runner.base, "%s: ERROR\n", name);
> ++              _log (&runner.base, "ERROR: %s\n", name);
> +           }
> +           runner.num_error++;
> +           runner.passed = FALSE;
> +@@ -1055,20 +1055,20 @@
> +                   }
> +               }
> +               targets[len-2] = '\0';
> +-              _log (&runner.base, "%s: FAIL (%s)\n", name, targets);
> ++              _log (&runner.base, "FAIL: %s (%s)\n", name, targets);
> +           } else {
> +-              _log (&runner.base, "%s: FAIL\n", name);
> ++              _log (&runner.base, "FAIL: %s\n", name);
> +           }
> +           runner.num_failed++;
> +           runner.passed = FALSE;
> +       } else if (xfailed) {
> +-          _log (&runner.base, "%s: XFAIL\n", name);
> ++          _log (&runner.base, "XFAIL: %s\n", name);
> +           runner.num_xfailed++;
> +       } else if (skipped) {
> +-          _log (&runner.base, "%s: UNTESTED\n", name);
> ++          _log (&runner.base, "UNTESTED: %s\n", name);
> +           runner.num_skipped++;
> +       } else {
> +-          _log (&runner.base, "%s: PASS\n", name);
> ++          _log (&runner.base, "PASS: %s\n", name);
> +           runner.num_passed++;
> +       }
> +       fflush (runner.base.log_file);
> diff --git a/meta/recipes-graphics/cairo/cairo/run-ptest b/meta/recipes-graphics/cairo/cairo/run-ptest
> new file mode 100644
> index 0000000000..7ee3e26954
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/run-ptest
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +
> +# Define tar test work dir
> +WORKDIR=@PTEST_PATH@/tests/
> +
> +# Run test
> +cd ${WORKDIR}
> +
> +# Clean old logs
> +rm -rf cairo-test-suite.log
> +rm -rf output
> +
> +CAIRO_TEST_TARGET=image ./cairo-test-suite -l > caselist
> +for case in `cat skiplist`
> +do
> +    sed -i "s/${case}//g" caselist
> +done
> +
> +CAIRO_TEST_TARGET=image CAIRO_TESTS=`cat caselist` ./cairo-test-suite
> +
> diff --git a/meta/recipes-graphics/cairo/cairo/skiplist b/meta/recipes-graphics/cairo/cairo/skiplist
> new file mode 100644
> index 0000000000..1dabffd88a
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/skiplist
> @@ -0,0 +1,97 @@
> +clear
> +clip-operator
> +clip-text
> +culled-glyphs
> +extended-blend-alpha-mask
> +font-matrix-translation
> +font-variations
> +glyph-cache-pressure
> +get-path-extents
> +halo
> +halo-transform
> +inverse-text
> +large-font
> +mime-data
> +negative-stride-image
> +operator-clear
> +operator-source
> +overlapping-glyphs
> +partial-clip-text-top
> +partial-clip-text-bottom
> +partial-clip-text-left
> +partial-clip-text-right
> +radial-gradient-source
> +raster-source
> +record-select-font-face
> +record1414x-select-font-face
> +record2x-select-font-face
> +record90-select-font-face
> +recordflip-whole-select-font-face
> +recordflip-select-font-face
> +select-font-face
> +show-glyphs-advance
> +show-text-current-point
> +smask
> +smask-text
> +smp-glyph
> +stride-12-image
> +text-antialias-gray
> +text-antialias-none
> +text-antialias-subpixel
> +text-antialias-subpixel-rgb
> +text-antialias-subpixel-bgr
> +text-antialias-subpixel-vrgb
> +text-antialias-subpixel-vbgr
> +text-glyph-range
> +text-pattern
> +text-rotate
> +text-unhinted-metrics
> +unbounded-operator
> +user-font-proxy
> +user-font-rescale
> +pthread-show-text
> +bitmap-font
> +ft-font-create-for-ft-face
> +ft-show-glyphs-positioning
> +ft-show-glyphs-table
> +ft-text-vertical-layout-type1
> +ft-text-vertical-layout-type3
> +ft-text-antialias-none
> +clip-image
> +clipped-surface
> +composite-integer-translate-source
> +composite-integer-translate-over
> +extend-reflect
> +extend-reflect-similar
> +extend-repeat
> +extend-repeat-similar
> +filter-nearest-transformed
> +mask
> +mask-transformed-image
> +mask-transformed-similar
> +subsurface-image-repeat
> +text-transform
> +trap-clip
> +xlib-expose-event
> +pixman-downscale-fast-96
> +pixman-downscale-fast-95
> +pixman-downscale-fast-24
> +pixman-downscale-good-96
> +pixman-downscale-good-95
> +pixman-downscale-good-24
> +pixman-downscale-best-96
> +pixman-downscale-best-95
> +pixman-downscale-best-24
> +pixman-downscale-nearest-96
> +pixman-downscale-nearest-95
> +pixman-downscale-nearest-24
> +pixman-downscale-bilinear-96
> +pixman-downscale-bilinear-95
> +pixman-downscale-bilinear-24
> +record-text-transform
> +record1414x-text-transform
> +record2x-text-transform
> +record90-text-transform
> +recordflip-whole-text-transform
> +recordflip-text-transform
> +
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index ffb813d290..8eedc73717 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -84,6 +84,30 @@ do_install:append () {
>                 rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
>  }
>
> +# add for ptest support
> +SRC_URI += " \
> +    file://ptest.patch \
> +    file://run-ptest \
> +    file://skiplist \
> +"
> +
> +inherit ptest
> +
> +do_compile_ptest() {
> +    oe_runmake -C ${B}/test/
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/test/.libs/* ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/reference/
> +    install --mode=755 ${S}/test/reference/* ${D}${PTEST_PATH}/tests/reference/
> +
> +    install --mode=755 ${WORKDIR}/skiplist ${D}${PTEST_PATH}/tests/
> +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
> +
> +}
> +
>  PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
>
>  SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189614): https://lists.openembedded.org/g/openembedded-core/message/189614
> Mute This Topic: https://lists.openembedded.org/mt/102130424/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

