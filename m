Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1E6C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 07:53:46 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web10.4722.1646380423150717039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 23:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=rXu3SuTU;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4K90Tv65RNz9sWQ
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 08:53:39 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------I4amE8tWna6foGDQetCi9E82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1646380417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QuhM2spUMKwp5WVpZ3U2LaXZUEWSEgNC9zJLxL7zeIw=;
	b=rXu3SuTUyQGsGPl2wUnlefIMcFCG03nWreUxIdH1gClEAGEP90AgOsGIpmRjQUlyH7/4sT
	udD7s3xZli2qRTcOmBGqtjsPObYVcUd96MPYX9C0vGe9LKJneQElUnLOwqM/6ufwggWa+9
	wdt4HD72uvjsNVk13HMAeH2FQWXk2VBeq19pzCncRMxG4bHyqmU3CWSmg/zS0A7MSu8Z4H
	MoYV+mXtKFgvs/GUYtuiLPD2NBzNeLJV0cHmCWcvgdBwi+SPO89AzCcClXWgtuFQHz7xKf
	x4fmbuonPvQRU91E0XYpRD56AsDSW6UCjhE7B232CXpsOPljlBqxDYiZPj5p7g==
Message-ID: <166d4bfe-d235-1c5d-7fac-fb3e41521ee6@mailbox.org>
Date: Fri, 4 Mar 2022 08:53:34 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH v2] libsdl2: Fix build when libunwind is not
 used
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220107192255.3128781-1-raj.khem@gmail.com>
 <CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=oXfrPg@mail.gmail.com>
 <ac1db1b0-fe6a-995d-344a-ebd39b9ab72e@mailbox.org>
 <CAMKF1srz=EjFE5u_msij_EFNbtksS21dRAkoBcBkMSR881tRtA@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: 
 <CAMKF1srz=EjFE5u_msij_EFNbtksS21dRAkoBcBkMSR881tRtA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 07:53:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162709

This is a multi-part message in MIME format.
--------------I4amE8tWna6foGDQetCi9E82
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

libunwind is installed on the host, complete with its -dev package. OE=20
still does not find it.

I'll submit a patch that adds libunwind-native to the native DEPENDS.

On 16.02.22 18:30, Khem Raj wrote:
> On Wed, Feb 16, 2022 at 1:58 AM Carlos Rafael Giani via
> lists.openembedded.org<crg7475=3Dmailbox.org@lists.openembedded.org>
> wrote:
>> "MACHINE=3Dqemux86-64 bitbake libsdl2-native" still fails with a simil=
ar error:
>>
>> | CMake Error at /home/test/yocto-master/poky/build/tmp/work/x86_64-li=
nux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/M=
odules/FindPkgConfig.cmake:890 (message):
>> |   None of the required 'libunwind' found
>>
>> This is triggered by the "pkg_search_module(UNWIND REQUIRED libunwind)=
" line right above the one that is modified by this patch.
>>
>> Any idea what is going on?
> I think its looking for libunwind on your build host.
>
>>
>> On 07.01.22 21:34, Alexander Kanavin wrote:
>>
>> Thanks :)
>>
>> Alex
>>
>> On Fri, 7 Jan 2022 at 20:23, Khem Raj<raj.khem@gmail.com>  wrote:
>>> clang provides libunwind.h and cmake adds a check to
>>> find libunwind when this header is detected, which was
>>> not the case with automake. The check however is expecting
>>> specific unwinder implementation which provides libunwind-generic
>>> solib, this is not a standard library that all implementations
>>> will provide, therefore make this check optional.
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> Cc: Andreas M=C3=BCller<schnitzeltony@gmail.com>
>>> ---
>>> v2: Udate patch status to submitted
>>>
>>>   .../libsdl2/optional-libunwind-generic.patch   | 18 +++++++++++++++=
+++
>>>   .../recipes-graphics/libsdl2/libsdl2_2.0.18.bb |  1 +
>>>   2 files changed, 19 insertions(+)
>>>   create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-l=
ibunwind-generic.patch
>>>
>>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind=
-generic.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind=
-generic.patch
>>> new file mode 100644
>>> index 00000000000..757b99a5f68
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generi=
c.patch
>>> @@ -0,0 +1,18 @@
>>> +Do not error when libunwind-generic is not found, Not all
>>> +implementations of libunwind will provide this library therefore
>>> +do not make it hard error if its not found.
>>> +
>>> +Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5=
194]
>>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> +
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
>>> +       if(HAVE_LIBUNWIND_H)
>>> +         # We've already found the header, so REQUIRE the lib to be =
present
>>> +         pkg_search_module(UNWIND REQUIRED libunwind)
>>> +-        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic=
)
>>> ++        pkg_search_module(UNWIND_GENERIC libunwind-generic)
>>> +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC=
_LIBRARIES})
>>> +       endif()
>>> +     endif()
>>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/r=
ecipes-graphics/libsdl2/libsdl2_2.0.18.bb
>>> index 893386343a7..1559d5e9425 100644
>>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>>> @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
>>>
>>>   SRC_URI =3D"http://www.libsdl.org/release/SDL2-${PV}.tar.gz \=20
>>> file://0001-Fix-build-against-wayland-1.20.patch \ +=20
>>> file://optional-libunwind-generic.patch \ "
>>>
>>>   S =3D "${WORKDIR}/SDL2-${PV}"
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161780):https://lists.openembedded.org/g/openembed=
ded-core/message/161780
>> Mute This Topic:https://lists.openembedded.org/mt/88269209/3617253
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[crg7475@mailbox.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------I4amE8tWna6foGDQetCi9E82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Helvetica, Arial, sans-serif">libunwind is installed
        on the host, complete with its -dev package. OE still does not
        find it.</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">I'll submit a patch
        that adds libunwind-native to the native DEPENDS.</font><br>
    </p>
    <div class=3D"moz-cite-prefix">On 16.02.22 18:30, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAMKF1srz=3DEjFE5u_msij_EFNbtksS21dRAkoBcBkMSR881tRtA@mail.gm=
ail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Feb 16, 2022 at 1:58=
 AM Carlos Rafael Giani via
lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
crg7475=3Dmailbox.org@lists.openembedded.org">&lt;crg7475=3Dmailbox.org@l=
ists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
"MACHINE=3Dqemux86-64 bitbake libsdl2-native" still fails with a similar =
error:

| CMake Error at /home/test/yocto-master/poky/build/tmp/work/x86_64-linux=
/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modu=
les/FindPkgConfig.cmake:890 (message):
|   None of the required 'libunwind' found

This is triggered by the "pkg_search_module(UNWIND REQUIRED libunwind)" l=
ine right above the one that is modified by this patch.

Any idea what is going on?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I think its looking for libunwind on your build host.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

On 07.01.22 21:34, Alexander Kanavin wrote:

Thanks :)

Alex

On Fri, 7 Jan 2022 at 20:23, Khem Raj <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
clang provides libunwind.h and cmake adds a check to
find libunwind when this header is detected, which was
not the case with automake. The check however is expecting
specific unwinder implementation which provides libunwind-generic
solib, this is not a standard library that all implementations
will provide, therefore make this check optional.

Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Cc: Andreas M=C3=BCller <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:schnitzeltony@gmail.com">&lt;schnitzeltony@gmail.com&gt;</a>
---
v2: Udate patch status to submitted

 .../libsdl2/optional-libunwind-generic.patch   | 18 ++++++++++++++++++
 .../recipes-graphics/libsdl2/libsdl2_2.0.18.bb |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-libunw=
ind-generic.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gen=
eric.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gen=
eric.patch
new file mode 100644
index 00000000000..757b99a5f68
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.pa=
tch
@@ -0,0 +1,18 @@
+Do not error when libunwind-generic is not found, Not all
+implementations of libunwind will provide this library therefore
+do not make it hard error if its not found.
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/libsdl-org/SDL/pull/5194">https://github.com/libsdl-org=
/SDL/pull/5194</a>]
+Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
+       if(HAVE_LIBUNWIND_H)
+         # We've already found the header, so REQUIRE the lib to be pres=
ent
+         pkg_search_module(UNWIND REQUIRED libunwind)
+-        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic)
++        pkg_search_module(UNWIND_GENERIC libunwind-generic)
+         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIB=
RARIES})
+       endif()
+     endif()
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.18.bb
index 893386343a7..1559d5e9425 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"

 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://www.libsdl=
.org/release/SDL2-${PV}.tar.gz\file://0001-Fix-build-against-wayland-1.20=
.patch\+file://optional-libunwind-generic.patch\">"http://www.libsdl.org/=
release/SDL2-${PV}.tar.gz \
            file://0001-Fix-build-against-wayland-1.20.patch \
+           file://optional-libunwind-generic.patch \
 "</a>

 S =3D "${WORKDIR}/SDL2-${PV}"
--
2.34.1




</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">





</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#161780): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/161780">https:/=
/lists.openembedded.org/g/openembedded-core/message/161780</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88269209/3617253">https://lists.openembedded.org/mt/=
88269209/3617253</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------I4amE8tWna6foGDQetCi9E82--

