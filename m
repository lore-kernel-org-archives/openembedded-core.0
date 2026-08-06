Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B95BC55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:11:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13319.1785996655205330156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SYqNHGtB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC4454E41105
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 06:10:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91332603D7;
	Thu,  6 Aug 2026 06:10:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44CAA11C359BB;
	Thu,  6 Aug 2026 08:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785996648; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jGfcKguJPkkErct0pZrd9TmgITbSepb4WoMrR3kbYec=;
	b=SYqNHGtBt/2+IcFuub0dgopBwg9j0aSsRnRJ/IuX8JAZVCXX8lTzipYjFaVtMqOiudwD1t
	smPT+SL023nNExikW4leXS/HJc7z5klpdIQZFBAdwll0QctNeNJ7shpFsBAUnPoyJOlE2X
	JVTHsmOuN1ZH5QF8g6tirN2SdxEBWqRVF4ktR5i2cdGR6KgFHY45ybDupdy7UwsRUNTk6J
	ULWnGk5JjfWHurmnnXvw5PuHtPIsW+vz+nDoY8dHaVwHumtwZGDZLU5a7prmF9e3ZVTE7X
	1zz6X1YYr3AZMIGVag4UNt5l1l3Kzjrh+hfD8g6KWIOAvwYGJagAfbvCIFa/1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 08:10:45 +0200
Message-Id: <DKHMZ0CQ9GFM.3BVI3AS9841HO@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ruby: scrub build host paths from rbconfig.rb
 in every class
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260805070009.3498678-1-twoerner@gmail.com>
In-Reply-To: <20260805070009.3498678-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242900

On Wed Aug 5, 2026 at 9:00 AM CEST, Trevor Woerner via lists.openembedded.o=
rg wrote:
> rbconfig.rb records the full configure invocation, which contains the
> recipe sysroot, the hosttools directory and the debug prefix map, all of
> them paths on the machine that did the build. The recipe removes them,
> but only for class-target, so a nativesdk build ships them.
>
> Nothing noticed because nativesdk-ruby has not been installed into an
> SDK before. Doing so fails do_package_qa outright:
>
>   QA Issue: File .../rbconfig.rb in package nativesdk-ruby contains
>   reference to TMPDIR [buildpaths]
>
> Drop the class-target restriction so the same scrubbing runs whatever
> class is being built. The variables it substitutes are defined for every
> class, and for a target build the result is byte for byte what it was.
>
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

Hi Trevor,

It looks like this is breaking webkitgtk build:

ERROR: webkitgtk-2.52.5-r0 do_configure: Execution of '/srv/pokybuild/yocto=
-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/webkitgtk/2=
.52.5/temp/run.do_configure.610119' failed with exit code 1
...
| -- Using source list file: inspector/remote/SourcesGLib.txt
| /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-=
poky-linux/webkitgtk/2.52.5/recipe-sysroot-native/usr/lib/ruby/4.0.0/did_yo=
u_mean/core_ext/name_error.rb:11: warning: getoptlong is not part of the de=
fault gems since Ruby 3.4.0. Install getoptlong from RubyGems.
| /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-=
poky-linux/webkitgtk/2.52.5/build/WTF/Scripts/generate-unified-source-bundl=
es.rb:27:in 'Kernel#require': cannot load such file -- getoptlong (LoadErro=
r)
| 	from /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-=
64-v3-poky-linux/webkitgtk/2.52.5/build/WTF/Scripts/generate-unified-source=
-bundles.rb:27:in '<main>'
| CMake Error at Source/cmake/WebKitMacros.cmake:30 (message):
|   generate-unified-source-bundles.rb exited with non-zero status, exiting
| Call Stack (most recent call first):
|   Source/JavaScriptCore/CMakeLists.txt:1719 (WEBKIT_COMPUTE_SOURCES)
|
|
| -- Configuring incomplete, errors occurred!
| WARNING: exit code 1 from a shell command.
NOTE: recipe webkitgtk-2.52.5-r0: task do_configure: Failed
NOTE: recipe lib32-xf86-video-vmware-2_13.4.0-r0: task do_package: Started
ERROR: Task (/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openemb=
edded-core/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb:do_configure) faile=
d with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4346

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


