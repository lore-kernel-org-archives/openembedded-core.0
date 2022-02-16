Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D051C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 09:58:04 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web11.9954.1645005482553474425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 01:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=XqB7K1TF;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161,
 mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4JzD0l2LcYz9sTt
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:57:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1645005476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYb0C7HXoTqVfDoQOWb842iFqlkiI/bsBqmw2OpE6s=;
	b=XqB7K1TFCXgJ8VC5TDjR5ytarp1DvXCecPATlBF/ZH5JJvP8re0bJ+IXE/3Av8dwPnPeq+
	Ac6ReAf/7GFlnUEv19pFMBZbbYbqoTX5/ADYSYhYZYdX+wi0CNCQxS6/+Sxy4AtICMr9t9
	qQ0/Lv38roLriJ2s6AOlMUV11A9PwelfNXDGh+XCi+EO0I3BJQUedP7bEd9lFA1qJpMSwy
	O3Y4W7LBu7RzkpXxtXq6SWZrObnCOB1RpO9cEiFu1nP3+KLqavLCD5bCO3VPHb451sdbIN
	QTVP9poqMfF3x2aKArkz9eWaKPR/o8tic0xrR5TBYMKDJ8VvF2nBY7RWZLQxzQ==
Content-Type: multipart/alternative;
 boundary="------------4nfi90zPhc0wFlctEEQ6thAW"
Message-ID: <ac1db1b0-fe6a-995d-344a-ebd39b9ab72e@mailbox.org>
Date: Wed, 16 Feb 2022 10:57:50 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH v2] libsdl2: Fix build when libunwind is not
 used
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220107192255.3128781-1-raj.khem@gmail.com>
 <CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=oXfrPg@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: 
 <CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=oXfrPg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 09:58:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161773

This is a multi-part message in MIME format.
--------------4nfi90zPhc0wFlctEEQ6thAW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

"MACHINE=3Dqemux86-64 bitbake libsdl2-native" still fails with a similar=20
error:

| CMake Error at=20
/home/test/yocto-master/poky/build/tmp/work/x86_64-linux/libsdl2-native/2=
.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig=
.cmake:890=20
(message):
|=C2=A0=C2=A0 None of the required 'libunwind' found

This is triggered by the "pkg_search_module(UNWIND REQUIRED libunwind)"=20
line right above the one that is modified by this patch.

Any idea what is going on?


On 07.01.22 21:34, Alexander Kanavin wrote:
> Thanks :)
>
> Alex
>
> On Fri, 7 Jan 2022 at 20:23, Khem Raj <raj.khem@gmail.com> wrote:
>
>     clang provides libunwind.h and cmake adds a check to
>     find libunwind when this header is detected, which was
>     not the case with automake. The check however is expecting
>     specific unwinder implementation which provides libunwind-generic
>     solib, this is not a standard library that all implementations
>     will provide, therefore make this check optional.
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>     ---
>     v2: Udate patch status to submitted
>
>     =C2=A0.../libsdl2/optional-libunwind-generic.patch=C2=A0 =C2=A0| 18
>     ++++++++++++++++++
>     =C2=A0.../recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>     <http://libsdl2_2.0.18.bb> |=C2=A0 1 +
>     =C2=A02 files changed, 19 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.pa=
tch
>
>     diff --git
>     a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.=
patch
>     b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.=
patch
>     new file mode 100644
>     index 00000000000..757b99a5f68
>     --- /dev/null
>     +++
>     b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.=
patch
>     @@ -0,0 +1,18 @@
>     +Do not error when libunwind-generic is not found, Not all
>     +implementations of libunwind will provide this library therefore
>     +do not make it hard error if its not found.
>     +
>     +Upstream-Status: Submitted
>     [https://github.com/libsdl-org/SDL/pull/5194]
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     +
>     +--- a/CMakeLists.txt
>     ++++ b/CMakeLists.txt
>     +@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(HAVE_LIBUNWIND_H)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We've already found the header=
, so REQUIRE the lib to
>     be present
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_search_module(UNWIND REQUIRE=
D libunwind)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC REQU=
IRED libunwind-generic)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC libu=
nwind-generic)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND EXTRA_LIBS ${UNWIND_=
LIBRARIES}
>     ${UNWIND_GENERIC_LIBRARIES})
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0endif()
>     +=C2=A0 =C2=A0 =C2=A0endif()
>     diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>     <http://libsdl2_2.0.18.bb>
>     b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>     <http://libsdl2_2.0.18.bb>
>     index 893386343a7..1559d5e9425 100644
>     --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>     <http://libsdl2_2.0.18.bb>
>     +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>     <http://libsdl2_2.0.18.bb>
>     @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
>
>     =C2=A0SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz
>     <http://www.libsdl.org/release/SDL2-$%7BPV%7D.tar.gz> \
>     file://0001-Fix-build-against-wayland-1.20.patch \
>     + file://optional-libunwind-generic.patch \
>     =C2=A0"
>
>     =C2=A0S =3D "${WORKDIR}/SDL2-${PV}"
>     --=20
>     2.34.1
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160266):https://lists.openembedded.org/g/openembedd=
ed-core/message/160266
> Mute This Topic:https://lists.openembedded.org/mt/88269209/3617253
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
crg7475@mailbox.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------4nfi90zPhc0wFlctEEQ6thAW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>"MACHINE=3Dqemux86-64 bitbake libsdl2-native" still fails with a
      similar error:</p>
    <p>| CMake Error at
/home/test/yocto-master/poky/build/tmp/work/x86_64-linux/libsdl2-native/2=
.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig=
.cmake:890
      (message):<br>
      |=C2=A0=C2=A0 None of the required 'libunwind' found</p>
    <p>This is triggered by the "pkg_search_module(UNWIND REQUIRED
      libunwind)" line right above the one that is modified by this
      patch.</p>
    <p>Any idea what is going on?</p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 07.01.22 21:34, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=3DoXfrPg@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>Thanks :)</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 7 Jan 2022 at 20:23=
,
          Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.=
khem@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
clang
          provides libunwind.h and cmake adds a check to<br>
          find libunwind when this header is detected, which was<br>
          not the case with automake. The check however is expecting<br>
          specific unwinder implementation which provides
          libunwind-generic<br>
          solib, this is not a standard library that all implementations<=
br>
          will provide, therefore make this check optional.<br>
          <br>
          Signed-off-by: Khem Raj &lt;<a
            href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.=
khem@gmail.com</a>&gt;<br>
          Cc: Andreas M=C3=BCller &lt;<a
            href=3D"mailto:schnitzeltony@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">schn=
itzeltony@gmail.com</a>&gt;<br>
          ---<br>
          v2: Udate patch status to submitted<br>
          <br>
          =C2=A0.../libsdl2/optional-libunwind-generic.patch=C2=A0 =C2=A0=
| 18
          ++++++++++++++++++<br>
          =C2=A0.../recipes-graphics/libsdl2/<a
            href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsdl2_2.0.18.bb<=
/a>
          |=C2=A0 1 +<br>
          =C2=A02 files changed, 19 insertions(+)<br>
          =C2=A0create mode 100644
          meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generi=
c.patch<br>
          <br>
          diff --git
          a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gene=
ric.patch
b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch<=
br>
          new file mode 100644<br>
          index 00000000000..757b99a5f68<br>
          --- /dev/null<br>
          +++
          b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gene=
ric.patch<br>
          @@ -0,0 +1,18 @@<br>
          +Do not error when libunwind-generic is not found, Not all<br>
          +implementations of libunwind will provide this library
          therefore<br>
          +do not make it hard error if its not found.<br>
          +<br>
          +Upstream-Status: Submitted [<a
            href=3D"https://github.com/libsdl-org/SDL/pull/5194"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://github.com/libsdl-org=
/SDL/pull/5194</a>]<br>
          +Signed-off-by: Khem Raj &lt;<a
            href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.=
khem@gmail.com</a>&gt;<br>
          +<br>
          +--- a/CMakeLists.txt<br>
          ++++ b/CMakeLists.txt<br>
          +@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT
          ANDROI<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(HAVE_LIBUNWIND_H)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We've already found the he=
ader, so REQUIRE the lib
          to be present<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_search_module(UNWIND REQ=
UIRED libunwind)<br>
          +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC =
REQUIRED
          libunwind-generic)<br>
          ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC =
libunwind-generic)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND EXTRA_LIBS ${UNW=
IND_LIBRARIES}
          ${UNWIND_GENERIC_LIBRARIES})<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0endif()<br>
          +=C2=A0 =C2=A0 =C2=A0endif()<br>
          diff --git a/meta/recipes-graphics/libsdl2/<a
            href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsdl2_2.0.18.bb<=
/a>
          b/meta/recipes-graphics/libsdl2/<a
            href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsdl2_2.0.18.bb<=
/a><br>
          index 893386343a7..1559d5e9425 100644<br>
          --- a/meta/recipes-graphics/libsdl2/<a
            href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsdl2_2.0.18.bb<=
/a><br>
          +++ b/meta/recipes-graphics/libsdl2/<a
            href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsdl2_2.0.18.bb<=
/a><br>
          @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"<br>
          <br>
          =C2=A0SRC_URI =3D "<a
            href=3D"http://www.libsdl.org/release/SDL2-$%7BPV%7D.tar.gz"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>http://www.libsdl.org/release/SDL2-${PV}.tar.gz</a>
          \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://0001-Fix-build-against-wayland-1.20.patch">f=
ile://0001-Fix-build-against-wayland-1.20.patch</a> \<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"moz-txt-l=
ink-freetext" href=3D"file://optional-libunwind-generic.patch">file://opt=
ional-libunwind-generic.patch</a> \<br>
          =C2=A0"<br>
          <br>
          =C2=A0S =3D "${WORKDIR}/SDL2-${PV}"<br>
          -- <br>
          2.34.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160266): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160266">https:/=
/lists.openembedded.org/g/openembedded-core/message/160266</a>
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
  </body>
</html>

--------------4nfi90zPhc0wFlctEEQ6thAW--

