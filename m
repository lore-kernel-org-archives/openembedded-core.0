Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBBECAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 06:55:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.45739.1758524101088974164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 23:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Enwt6LJG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 05E59C8F46F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDD1060634;
	Mon, 22 Sep 2025 06:54:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB7E7102F18C8;
	Mon, 22 Sep 2025 08:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758524098; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FWvkItbEOMsi90gg9Xuzzy7tXkTom/vKQqUHYfjTeEw=;
	b=Enwt6LJGUDGYV0MEW2JX0fqdcdQ9QGeFZjfbxga6EfqS7/8RsuOkvbC8rp90Q45+SHgyD6
	c5iJyc0NPGKnhA/Wyh8mI3+l7AaK4awGZx9vKeN67Gr8Pc+PXZlPCOwUvAj2wKv8vglvFL
	LUtFZItN14B3TO+sVF/a7RfgQp7ilZkF4A77FTr/BV9wy4mUyVhv2JGFH4pkIPkt6sCLkw
	qTv8y4bn5n0b/GZzn4Zx5AvMwkac8lRjcGp+wV5KFTOhCWGYcCeyK8EC5FxUyh3u/UBKUq
	miGRt6quN/PJ6L1h8rrewkGuJo4p0EaCM3kZKvfaQfgnhiMJLir1S0ycd9uteg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 08:54:55 +0200
Message-Id: <DCZ4RL3U1UMW.1FEE83HBDH2TU@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] classes/cmake: don't put RPATHs to the
 build tree in binaries
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250915145134.192581-1-ross.burton@arm.com>
In-Reply-To: <20250915145134.192581-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223807

On Mon Sep 15, 2025 at 4:51 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> By default, CMake will compile binaries with an RPATH pointing at the
> build path, and then on install will "relink" the binaries with an
> RPATH pointing to the install path.
>
> However, when CMake says "relink" it actually means "edit if possible",
> using an internal copy of chrpath. This introduces non-determinism in
> several ways:
> - The build path is used to generate the build-id. We've worked around
>   this previously by ensuring that RPATHs are relative to the binary[1].
> - Not all upstreams respect this option, so some recipes need extra
>   tweaking to stop them injecting absolute build-time RPATHs[2]
> - Whilst the final RPATH may be empty, using chrpath is _not_ relinking
>   so different length build paths can result in binaries with different
>   amounts of now-redundant padding. These binaries are non-reproducible.
>
> Instead of using relative build-time RPATHs and then dealing with other
> issues one by one, we can just tell CMake to not use built-time RPATHs
> at all. We don't execute binaries directly from the build tree, so they
> don't serve any purpose and are just a source of non-determinism.
>
> [1] oe-core 44e77d3f97a ("classes/cmake: Use relative RPATHs")
> [2] oe-core d96e0458b69 ("lldb: don't build rpaths into binaries")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I gave a try to this patch, even if it's still an RFC. We have a few
build issues.

One on clang-native:

ERROR: clang-native-21.1.1-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemux86-alt/build/build/tmp/work/x86_64-linux/clang-native/21.1.1/=
temp/run.do_compile.3920753' failed with exit code 127
...
| FAILED: [code=3D127] tools/clang/tools/extra/clang-tidy/misc/Confusables.=
inc /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-lin=
ux/clang-native/21.1.1/build/tools/clang/tools/extra/clang-tidy/misc/Confus=
ables.inc
| cd /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-li=
nux/clang-native/21.1.1/build/tools/clang/tools/extra/clang-tidy/misc && /s=
rv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-linux/cla=
ng-native/21.1.1/build/bin/clang-tidy-confusable-chars-gen /srv/pokybuild/y=
octo-worker/qemux86-alt/build/build/tmp/work-shared/llvm-project-source-21.=
1.1-r0/sources/llvm-project-21.1.1.src/clang-tools-extra/clang-tidy/misc/Co=
nfusableTable/confusables.txt /srv/pokybuild/yocto-worker/qemux86-alt/build=
/build/tmp/work/x86_64-linux/clang-native/21.1.1/build/tools/clang/tools/ex=
tra/clang-tidy/misc/Confusables.inc
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-linux=
/clang-native/21.1.1/build/bin/clang-tidy-confusable-chars-gen: error while=
 loading shared libraries: libLLVM.so.21.1: cannot open shared object file:=
 No such file or directory
...
| WARNING: exit code 127 from a shell command.
NOTE: recipe clang-native-21.1.1-r0: task do_compile: Failed


One on libical:

ERROR: libical-3.0.20-r0 do_compile: Execution of '/srv/pokybuild/yocto-wor=
ker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20/tem=
p/run.do_compile.2809930' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: warning: libical.so.=
3, needed by /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/c=
ore2-32-poky-linux/libical/3.0.20/build/lib/libical-glib.so, not found (try=
 using -rpath or -rpath-link)
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: /srv/pokybuild/yocto=
-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20=
/build/lib/libical-glib.so: undefined reference to `icalparameter_new_from_=
string'
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: /srv/pokybuild/yocto=
-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20=
/build/lib/libical-glib.so: undefined reference to `icaltimezone_get_builti=
n_timezone'
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: /srv/pokybuild/yocto=
-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20=
/build/lib/libical-glib.so: undefined reference to `icalparameter_get_x'
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: /srv/pokybuild/yocto=
-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20=
/build/lib/libical-glib.so: undefined reference to `icalparameter_get_sched=
uleforcesend'
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/libical/3.0.20/recipe-sysroot-native/usr/bin/i686-poky-linux/../../=
libexec/i686-poky-linux/gcc/i686-poky-linux/15.2.0/ld: /srv/pokybuild/yocto=
-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/libical/3.0.20=
/build/lib/libical-glib.so: undefined reference to `icalcomponent_new_xstan=
dard'
...


https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2405
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2426
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/2429

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


