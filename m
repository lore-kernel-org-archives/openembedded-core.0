Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33201C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 07:53:23 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web09.4073.1648540401351345626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 00:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Qv35Bot2;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4KSMHx4xN1z9sT4
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 09:53:17 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------hEEZcqe0Vn7HYoh6Iz4irkOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1648540395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulLhe+mEpbS0caio6ZQGq23cm1HcGt8XuWBKr0qmyfE=;
	b=Qv35Bot2uLl4RBqFejFZtkxO8gQpTUZgQqfVXsFHFucNZj+qRx9d1H1xiRXcoeqycmG3z/
	GvpLTaNwX+KQz7z/S2U3AKsMgWXIslk2BZv7y3tv0m4rNU4xliphuO90ZMp+G05h55DJfF
	Tl+jRyj+5efJm1Fv9ZjXRuZ3PnwPeQe0euOvw8qZW1kzym6M7K8qeODwnhOq0nhecYri3e
	Ny6DFYJMzptr1MM0KfYFfAGeoKPJ8XCnz+fsoXIkBGdgWnR7mHdrXu7iXe5zDWF6ibJQQM
	PePuAutZGtl7mMTEYbCPM4vzmzGoxwgh/Ydsbj8AX1/MOfVy5m6XdHEFB8T+AA==
Message-ID: <8819327c-2daa-5f05-12c8-47c2eb75ae38@mailbox.org>
Date: Tue, 29 Mar 2022 09:53:09 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libsdl2: Disable libunwind dependency in native
 builds
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <16E0CAAF959988FC.3733@lists.openembedded.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <16E0CAAF959988FC.3733@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 07:53:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163740

This is a multi-part message in MIME format.
--------------hEEZcqe0Vn7HYoh6Iz4irkOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I wish to emphasize that this is meant as a plan B in case the libunwind 
problem cannot be fixed in time for the Kirkstone release. Plan A would 
be a fixed libunwind.


On 29.03.22 09:51, Carlos Rafael Giani via lists.openembedded.org wrote:
> libunwind-native currently cannot be added to the class-native DEPENDS
> due to the following problem:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio
>
> And without libunwind-native, libsdl2-native config fails errors like:
>
> | -- Checking for one of the modules 'libunwind'
> | CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> |   None of the required 'libunwind' found
> | Call Stack (most recent call first):
> |   CMakeLists.txt:1367 (pkg_search_module)
>
> Ideally, the libunwind issue would be fixed, and then this could be added
> to the libsdl2 recipe:
>
> DEPENDS:append:class-native = " libunwind-native"
>
> However, the libunwind problem is not trivial to fix, and requires a
> specific setup to reproduce. As an alternative workaround, turn off
> libunwind support in the native SDL2 build by disabling the unwind.h
> check in the CMake script (this subsequently turns off all the other
> libunwind checks). The main user of libsdl2-native is qemu-native, which
> does not need libunwind support in SDL2.
>
> Signed-off-by: Carlos Rafael Giani<crg7475@mailbox.org>
> ---
>   ...d-in-native-OE-builds-by-not-looking.patch | 38 +++++++++++++++++++
>   .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
>   2 files changed, 39 insertions(+)
>   create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> new file mode 100644
> index 0000000000..214664f621
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> @@ -0,0 +1,38 @@
> +From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani<crg7475@mailbox.org>
> +Date: Fri, 18 Mar 2022 12:06:23 +0100
> +Subject: [PATCH] Disable libunwind in native OE builds by not looking for
> + libunwind
> +
> +This is a workaround for this build error:
> +
> +| -- Checking for one of the modules 'libunwind'
> +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> +|   None of the required 'libunwind' found
> +| Call Stack (most recent call first):
> +|   CMakeLists.txt:1367 (pkg_search_module)
> +
> +By not looking for the libunwind header, the rest of the libunwind
> +specific bits in the CMake build script are disabled.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 64f9fbf..12a4d8f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -862,7 +862,7 @@ if(SDL_LIBC)
> +     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
> +     foreach(_HEADER
> +             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
> +-            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h libunwind.h)
> ++            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h)
> +       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
> +       string(REPLACE "." "_" _HAVE_H ${_UPPER})
> +       check_include_file("${_HEADER}" ${_HAVE_H})
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> index 58bc94cc86..4ba22c1fe6 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -20,6 +20,7 @@ SRC_URI ="http://www.libsdl.org/release/SDL2-${PV}.tar.gz \ 
> file://optional-libunwind-generic.patch \ 
> file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \ "
> +SRC_URI:append:class-native =" file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
>   
>   S = "${WORKDIR}/SDL2-${PV}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163739):https://lists.openembedded.org/g/openembedded-core/message/163739
> Mute This Topic:https://lists.openembedded.org/mt/90103750/3617253
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------hEEZcqe0Vn7HYoh6Iz4irkOP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">I wish to emphasize
        that this is meant as a plan B in case the libunwind problem
        cannot be fixed in time for the Kirkstone release. Plan A would
        be a fixed libunwind.</font></p>
    <p><font face="Helvetica, Arial, sans-serif"></font><br>
    </p>
    <div class="moz-cite-prefix">On 29.03.22 09:51, Carlos Rafael Giani
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16E0CAAF959988FC.3733@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">libunwind-native currently cannot be added to the class-native DEPENDS
due to the following problem:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio</a>

And without libunwind-native, libsdl2-native config fails errors like:

| -- Checking for one of the modules 'libunwind'
| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
|   None of the required 'libunwind' found
| Call Stack (most recent call first):
|   CMakeLists.txt:1367 (pkg_search_module)

Ideally, the libunwind issue would be fixed, and then this could be added
to the libsdl2 recipe:

DEPENDS:append:class-native = " libunwind-native"

However, the libunwind problem is not trivial to fix, and requires a
specific setup to reproduce. As an alternative workaround, turn off
libunwind support in the native SDL2 build by disabling the unwind.h
check in the CMake script (this subsequently turns off all the other
libunwind checks). The main user of libsdl2-native is qemu-native, which
does not need libunwind support in SDL2.

Signed-off-by: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
---
 ...d-in-native-OE-builds-by-not-looking.patch | 38 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
new file mode 100644
index 0000000000..214664f621
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
@@ -0,0 +1,38 @@
+From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
+Date: Fri, 18 Mar 2022 12:06:23 +0100
+Subject: [PATCH] Disable libunwind in native OE builds by not looking for
+ libunwind
+
+This is a workaround for this build error:
+
+| -- Checking for one of the modules 'libunwind'
+| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
+|   None of the required 'libunwind' found
+| Call Stack (most recent call first):
+|   CMakeLists.txt:1367 (pkg_search_module)
+
+By not looking for the libunwind header, the rest of the libunwind
+specific bits in the CMake build script are disabled.
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 64f9fbf..12a4d8f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -862,7 +862,7 @@ if(SDL_LIBC)
+     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
+     foreach(_HEADER
+             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
+-            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h libunwind.h)
++            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h)
+       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
+       string(REPLACE "." "_" _HAVE_H ${_UPPER})
+       check_include_file("${_HEADER}" ${_HAVE_H})
+-- 
+2.32.0
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index 58bc94cc86..4ba22c1fe6 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -20,6 +20,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.libsdl.org/release/SDL2-${PV}.tar.gz\file://optional-libunwind-generic.patch\file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch\">"http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
            "</a>
+SRC_URI:append:class-native = <a class="moz-txt-link-rfc2396E" href="file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch">" file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"</a>
 
 S = "${WORKDIR}/SDL2-${PV}"
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#163739): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/163739">https://lists.openembedded.org/g/openembedded-core/message/163739</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/90103750/3617253">https://lists.openembedded.org/mt/90103750/3617253</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------hEEZcqe0Vn7HYoh6Iz4irkOP--

