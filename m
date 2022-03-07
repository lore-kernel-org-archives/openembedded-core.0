Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D1FC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 08:10:32 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web12.24016.1646640629374108035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 00:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Cs5YTyp2;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4KBrjt0nNPz9sWS
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:10:26 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------A0b36EttfVGamJIU07SEC7Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1646640623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nH4D6B8R8Mty3E9LVnK5An2xx+EnkWqsoxS0q7PfMPc=;
	b=Cs5YTyp263YPLiThEyjoO6wbW6oTTl66cQtaq2bXgWZjjve19EI/8nGbp8R7JiAG2GyD+o
	v6Ynn3qeica6zjpP/Jibxx2NvEY0Wdgj3rOYmpExYcARPVVOvEqpmzT0U/nWErqpwJubmK
	aLh9b53DUQ8IlxtfGVAWVP3HVmiHo003xVxOUwTmp+rlIygot+wD9khCE4iqdXXzV9OXE2
	rz9c4Im9AHj7qmf+tEGmhDBn7OpX/hgAtwAmQ+vBeR4BsdLzQ4f8yP956qtuWxWf25DXVS
	4V9tLishe4pUcTqY6nhmEBSmnPUdtvIqXQkmpm2lrmp/7aLkSOlRcekCTWQdpA==
Message-ID: <80a90c7f-bde0-2aaf-a2e8-02c0193907fb@mailbox.org>
Date: Mon, 7 Mar 2022 09:10:18 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional for
 native builds
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <16DA0ACF872045DF.28939@lists.openembedded.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <16DA0ACF872045DF.28939@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 08:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162799

This is a multi-part message in MIME format.
--------------A0b36EttfVGamJIU07SEC7Ku
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This is another attempt at fixing/circumventing the existing libsdl 
problems. It adds another patch file that is on top of the existing 
optional-libunwind-generic.patch since this new patch file is only 
needed for native builds. I was able to successfully build 
core-image-weston with this on an Ubuntu 21.10 host.

On 07.03.22 09:07, Carlos Rafael Giani via lists.openembedded.org wrote:
> Signed-off-by: Carlos Rafael Giani<crg7475@mailbox.org>
> ---
>   ...ependency-optional-for-native-libsdl.patch | 37 +++++++++++++++++++
>   .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> new file mode 100644
> index 0000000000..00f3486194
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> @@ -0,0 +1,37 @@
> +From 78078bcf00f0ad13d93b1dc525ee0a666c30f246 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani<crg7475@mailbox.org>
> +Date: Mon, 7 Mar 2022 05:09:08 +0100
> +Subject: [PATCH] Make libunwind dependency optional for native libsdl2 OE
> + build
> +
> +This is a workaround for this build error:
> +
> +| -- Checking for one of the modules 'libunwind'
> +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> +|   None of the required 'libunwind' found
> +| Call Stack (most recent call first):
> +|   CMakeLists.txt:1367 (pkg_search_module)
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Carlos Rafael Giani<crg7475@mailbox.org>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 64f9fbf..eda3112 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1364,7 +1364,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROID AND NOT RISCOS AND NOT HAIKU)
> +
> +       if(HAVE_LIBUNWIND_H)
> +         # We've already found the header, so REQUIRE the lib to be present
> +-        pkg_search_module(UNWIND REQUIRED libunwind)
> ++        pkg_search_module(UNWIND libunwind)
> +         pkg_search_module(UNWIND_GENERIC libunwind-generic)
> +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
> +       endif()
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> index 90724ab8b7..d8211165d4 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -20,6 +20,7 @@ SRC_URI ="http://www.libsdl.org/release/SDL2-${PV}.tar.gz \ 
> file://optional-libunwind-generic.patch \ 
> file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \ "
> +SRC_URI:append:class-native =" file://0001-Make-libunwind-dependency-optional-for-native-libsdl.patch "
>   
>   S = "${WORKDIR}/SDL2-${PV}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162798):https://lists.openembedded.org/g/openembedded-core/message/162798
> Mute This Topic:https://lists.openembedded.org/mt/89607589/3617253
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------A0b36EttfVGamJIU07SEC7Ku
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">This is another attempt
        at fixing/circumventing the existing libsdl problems. It adds
        another patch file that is on top of the existing
        optional-libunwind-generic.patch since this new patch file is
        only needed for native builds. I was able to successfully build
        core-image-weston with this on an Ubuntu 21.10 host.</font></p>
    <div class="moz-cite-prefix">On 07.03.22 09:07, Carlos Rafael Giani
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16DA0ACF872045DF.28939@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
---
 ...ependency-optional-for-native-libsdl.patch | 37 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
new file mode 100644
index 0000000000..00f3486194
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
@@ -0,0 +1,37 @@
+From 78078bcf00f0ad13d93b1dc525ee0a666c30f246 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
+Date: Mon, 7 Mar 2022 05:09:08 +0100
+Subject: [PATCH] Make libunwind dependency optional for native libsdl2 OE
+ build
+
+This is a workaround for this build error:
+
+| -- Checking for one of the modules 'libunwind'
+| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
+|   None of the required 'libunwind' found
+| Call Stack (most recent call first):
+|   CMakeLists.txt:1367 (pkg_search_module)
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 64f9fbf..eda3112 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1364,7 +1364,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROID AND NOT RISCOS AND NOT HAIKU)
+ 
+       if(HAVE_LIBUNWIND_H)
+         # We've already found the header, so REQUIRE the lib to be present
+-        pkg_search_module(UNWIND REQUIRED libunwind)
++        pkg_search_module(UNWIND libunwind)
+         pkg_search_module(UNWIND_GENERIC libunwind-generic)
+         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
+       endif()
+-- 
+2.32.0
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index 90724ab8b7..d8211165d4 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -20,6 +20,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.libsdl.org/release/SDL2-${PV}.tar.gz\file://optional-libunwind-generic.patch\file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch\">"http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
            "</a>
+SRC_URI:append:class-native = <a class="moz-txt-link-rfc2396E" href="file://0001-Make-libunwind-dependency-optional-for-native-libsdl.patch">" file://0001-Make-libunwind-dependency-optional-for-native-libsdl.patch "</a>
 
 S = "${WORKDIR}/SDL2-${PV}"
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#162798): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/162798">https://lists.openembedded.org/g/openembedded-core/message/162798</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89607589/3617253">https://lists.openembedded.org/mt/89607589/3617253</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------A0b36EttfVGamJIU07SEC7Ku--

