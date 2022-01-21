Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17490C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 00:01:04 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web08.4764.1642723262526954207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 0B3F814CAD;
	Fri, 21 Jan 2022 01:01:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.38.111]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAhMG-375uHR0; Fri, 21 Jan 2022 01:00:48 +0100
Subject: Re: [OE-core][PATCH 2/2] libical: build gobject and vala
 introspection
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220120234129.4160546-1-f_l_k@t-online.de>
 <20220120234129.4160546-2-f_l_k@t-online.de>
 <CANNYZj-f-NSn-TD0vkRetUVTPdu560TyFjNfboR0-rfCjd=sVg@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <b355f7bd-4572-9d06-717b-0f2bdcbda7cf@t-online.de>
Date: Fri, 21 Jan 2022 01:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj-f-NSn-TD0vkRetUVTPdu560TyFjNfboR0-rfCjd=sVg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------23249DD6743CB77A49C2FC77"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642723248-00010BFA-4E7CFFE9/0/0 CLEAN NORMAL
X-TOI-MSGID: ef77d70b-2a43-4f68-856b-d6b025572931
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 00:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160808

This is a multi-part message in MIME format.
--------------23249DD6743CB77A49C2FC77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

> This needs to be conditionally enabled similar to webkitgtk recipe:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.con=
tains('GI_DATA_ENABLED', 'True',=20
> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \

Most Gnome Projects meanwhile consider gobject-introspection to be=20
mandatory. Are you sure this needs to be optional. The generated files=20
are really small in size and you just cant build the complete Gnome Code=20
if you allow to make it optional.

> This needs to be done with a patch and not by patching generated files=20
> with sed after the fact; the binary names should be provided from=20
> calling pkg-config.
Yes, i know, you are right. But that whole introspection thing is to=20
some point a big mess. Found that hack in the evolution-data-server=20
recipe. Not sure if i'm able to sort that out, but i'll have a look at.

Am 21.01.22 um 00:50 schrieb Alexander Kanavin:
> On Fri, 21 Jan 2022 at 00:41, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>
>     +EXTRA_OECMAKE +=3D "-DGOBJECT_INTROSPECTION=3DON"
>
>
> This needs to be conditionally enabled similar to webkitgtk recipe:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.con=
tains('GI_DATA_ENABLED', 'True',=20
> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
>
>
> +do_configure:append () {
>
>     +=C2=A0 =C2=A0 # fix abs path for g-ir-scanner-wrapper
>     +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${bindir}/g-ir-scanner-wrapper:
>     ${STAGING_BINDIR}/g-ir-scanner-wrapper:g'
>     +
>     +=C2=A0 =C2=A0 # fix abs path for g-ir-compiler-wrapper
>     +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${bindir}/g-ir-compiler-wrapper=
:
>     ${STAGING_BINDIR}/g-ir-compiler-wrapper:g'
>     +
>     +=C2=A0 =C2=A0 # fix abs path for vapigen
>     +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${STAGING_BINDIR}/vapigen:
>     ${STAGING_BINDIR_NATIVE}/vapigen:g'
>     +}
>
>
> This needs to be done with a patch and not by patching generated files=20
> with sed after the fact; the binary names should be provided from=20
> calling pkg-config.
>
> Alex

--------------23249DD6743CB77A49C2FC77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>
      <blockquote type=3D"cite">
        <div>This needs to be conditionally enabled similar to webkitgtk
          recipe:</div>
        <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains('GI_DATA_ENABLED',
          'True', '-DENABLE_INTROSPECTION=3DON',
          '-DENABLE_INTROSPECTION=3DOFF', d)} \</div>
      </blockquote>
    </p>
    <p>Most Gnome Projects meanwhile consider gobject-introspection to
      be mandatory. Are you sure this needs to be optional. The
      generated files are really small in size and you just cant build
      the complete Gnome Code if you allow to make it optional.
      <blockquote type=3D"cite">This needs to be done with a patch and no=
t
        by patching generated files with sed after the fact; the binary
        names should be provided from calling pkg-config. <br>
      </blockquote>
      Yes, i know, you are right. But that whole introspection thing is
      to some point a big mess. Found that hack in the
      evolution-data-server recipe. Not sure if i'm able to sort that
      out, but i'll have a look at.<br>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">Am 21.01.22 um 00:50 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj-f-NSn-TD0vkRetUVTPdu560TyFjNfboR0-rfCjd=3DsVg@mail.gm=
ail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Jan 2022 at
            00:41, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"
              moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt; wrote:<b=
r>
          </div>
          <blockquote class=3D"gmail_quote">+EXTRA_OECMAKE +=3D
            "-DGOBJECT_INTROSPECTION=3DON"<br>
          </blockquote>
          <br>
          <div>This needs to be conditionally enabled similar to
            webkitgtk recipe:</div>
          <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
@bb.utils.contains('GI_DATA_ENABLED',
            'True', '-DENABLE_INTROSPECTION=3DON',
            '-DENABLE_INTROSPECTION=3DOFF', d)} \</div>
          <div><br>
          </div>
          <div><br>
          </div>
          +do_configure:append () {<br>
          <blockquote class=3D"gmail_quote">
            +=C2=A0 =C2=A0 # fix abs path for g-ir-scanner-wrapper<br>
            +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${bindir}/g-ir-scanner-wr=
apper:
            ${STAGING_BINDIR}/g-ir-scanner-wrapper:g'<br>
            +<br>
            +=C2=A0 =C2=A0 # fix abs path for g-ir-compiler-wrapper<br>
            +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${bindir}/g-ir-compiler-w=
rapper:
            ${STAGING_BINDIR}/g-ir-compiler-wrapper:g'<br>
            +<br>
            +=C2=A0 =C2=A0 # fix abs path for vapigen<br>
            +=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's: ${STAGING_BINDIR}/vapigen=
:
            ${STAGING_BINDIR_NATIVE}/vapigen:g'<br>
            +}<br>
          </blockquote>
          <div><br>
          </div>
          <div>This needs to be done with a patch and not by patching
            generated files with sed after the fact; the binary names
            should be provided from calling pkg-config.=C2=A0</div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------23249DD6743CB77A49C2FC77--

