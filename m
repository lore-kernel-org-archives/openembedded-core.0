Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762A6C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 20:44:41 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web09.37.1634762680326728784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 13:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 14BC4E0462;
	Thu, 21 Oct 2021 09:39:20 +1300 (NZDT)
Content-Type: multipart/alternative;
 boundary="------------R4zzgP4aGpGtH0lehmnp00m0"
Message-ID: <3ea9624c-c603-5fbf-2514-e68d2c92f7f5@taitradio.com>
Date: Thu, 21 Oct 2021 09:39:20 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be
 extended with extra classes
Content-Language: en-GB
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 "Richard Purdie (richard.purdie@linuxfoundation.org)"
 <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211019170321.18270-1-pkj@axis.com>
 <CANPvuR=noMymOncORwNan6-D-DCkSKQDXYjjWR+8yhqx3JxY=Q@mail.gmail.com>
 <16AF9916496D59D2.6466@lists.openembedded.org>
 <0618e0381622433f86303a2d5d6968cd@axis.com>
From: Douglas Royds <douglas.royds@taitradio.com>
In-Reply-To: <0618e0381622433f86303a2d5d6968cd@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 20:44:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157269

This is a multi-part message in MIME format.
--------------R4zzgP4aGpGtH0lehmnp00m0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

We do "wrap" classes in our own proprietary layer.

In a layer called meta-abc, we name the wrapper-class=20
classname-abc.bbclass. For instance, we wrap cmake.bbclass as follows:

    # cmake-abc.bbclass

    inherit cmake

    # Additions to cmake behaviour go here
    ...

Our meta-abc recipes inherit cmake-abc. In this way, the wrapper-class=20
behaves very much like a bbappend.


On 20/10/21 10:09 pm, Peter Kjellerstedt wrote:
>
> I thought of another problem with the wrapper class solution: if we=20
> need to actually backport a newer version of the class from, e.g.,=20
> Poky master, then there is now no natural place for it since it is=20
> occupied by the wrapper class. That means we would either have to=20
> rename the backported class, or put it somewhere else than in=20
> =E2=80=9Cclasses=E2=80=9D. It also means backporting a class requires t=
he wrapper=20
> class to be modified.
>
> Here is a question for Richard: what do you think of an idea I had to=20
> add support in bitbake for extending classes? I do not mean to add=20
> something like bbclassappend, as I know that is troublesome. My idea=20
> instead is something like the prefuncs/postfuncs that we have for=20
> functions. I.e., before actually doing the inherit of a class foo,=20
> bitbake would inherit anything specified in BBCLASS_PRE_INHERIT:foo,=20
> and after inheriting the class it would automatically inherit anything=20
> in BBCLASS_POST_INHERIT:foo. =C2=A0That way one can simply extend a cla=
ss=20
> through normal variable operations, making it easy to do, e.g., in the=20
> distro configuration.
>
> //Peter
>
> *From:*openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Peter=20
> Kjellerstedt
> *Sent:* den 20 oktober 2021 03:32
> *To:* Jose Quaresma <quaresma.jose@gmail.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] externalsrc.bbclass: Allow=20
> externalsrc to be extended with extra classes
>
> Well, I had not considered that option. I can=E2=80=99t say I am to kee=
n on=20
> having wrapper classes with the same name as the upstream classes as I=20
> think it leads to confusion. And the solution doesn=E2=80=99t scale ver=
y well=20
> (what if two layers want to override the same class?). But on the=20
> positive side it works for any class without requiring changes to=20
> OE-Core. And I guess the latter wins. I wish there was a more bitbakey=20
> way to add to classes though (bbclassappend anyone? =F0=9F=98=89).
>
> //Peter
>
> *From:*Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* den 19 oktober 2021 19:15
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] externalsrc.bbclass: Allow=20
> externalsrc to be extended with extra classes
>
> Hi Peter,
>
> require the class on the new one will do the same
>
> and we don't need any changes for that
>
> but I may not be seeing everything
>
> require ${COREBASE}/meta/classes/externalsrc.bbclass
>
> Jose
>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia=20
> ter=C3=A7a, 19/10/2021 =C3=A0(s) 18:03:
>
>     The EXTERNALSRC_EXTENSIONS variable holds a list of additional clas=
ses
>     that will be inherited when externalsrc is inherited.
>
>     Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>     ---
>
>     We have had a local copy of this class for a long time since we nee=
d
>     to make it suppport a local class when checking BBCLASSEXTEND. And
>     now we wanted to add some more functionality that should be active
>     when externalsrc is in use. So instead of forking the class even
>     more, I thought it would be better to make the upstream class
>     extendable. The solution was inspired by USERADDEXTENSION in
>     useradd.bbclass.
>
>     =C2=A0meta/classes/externalsrc.bbclass | 5 +++++
>     =C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0| 1 +
>     =C2=A02 files changed, 6 insertions(+)
>
>     diff --git a/meta/classes/externalsrc.bbclass
>     b/meta/classes/externalsrc.bbclass
>     index abfe24bace..488d75760f 100644
>     --- a/meta/classes/externalsrc.bbclass
>     +++ b/meta/classes/externalsrc.bbclass
>     @@ -265,3 +265,8 @@ def srctree_configure_hash_files(d):
>     =C2=A0 =C2=A0 =C2=A0return ' '.join(out_items)
>
>     =C2=A0EXPORT_FUNCTIONS do_buildclean
>     +
>     +# Use the following to extend externalsrc with custom functionalit=
y
>     +EXTERNALSRC_EXTENSIONS ??=3D ""
>     +
>     +inherit ${EXTERNALSRC_EXTENSIONS}
>     diff --git a/meta/conf/documentation.conf
>     b/meta/conf/documentation.conf
>     index 80ad8e10d5..6d5b734b02 100644
>     --- a/meta/conf/documentation.conf
>     +++ b/meta/conf/documentation.conf
>     @@ -160,6 +160,7 @@ EXTENDPE[doc] =3D "Used with file and pathnames
>     to create a prefix for a recipe's
>     =C2=A0EXTENDPKGV[doc] =3D "The full package version specification a=
s it
>     appears on the final packages produced by a recipe."
>     =C2=A0EXTERNALSRC[doc] =3D "If externalsrc.bbclass is inherited, th=
is
>     variable points to the source tree, which is outside of the
>     OpenEmbedded build system."
>     =C2=A0EXTERNALSRC_BUILD[doc] =3D "If externalsrc.bbclass is inherit=
ed,
>     this variable points to the directory in which the recipe's source
>     code is built, which is outside of the OpenEmbedded build system."
>     +EXTERNALSRC_EXTENSIONS[doc] =3D "A list of additional classes that
>     will be inherited when externalsrc is inherited."
>     =C2=A0EXTRA_IMAGE_FEATURES[doc] =3D "The list of additional feature=
s to
>     include in an image. Configure this variable in the
>     conf/local.conf file in the Build Directory."
>     =C2=A0EXTRA_IMAGEDEPENDS[doc] =3D "A list of recipes to build that =
do not
>     provide packages for installing into the root filesystem. Use this
>     variable to list recipes that are required to build the final
>     image, but not needed in the root filesystem."
>     =C2=A0EXTRA_OECMAKE[doc] =3D "Additional cmake options."
>
>
> --=20
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157255):https://lists.openembedded.org/g/openembedd=
ed-core/message/157255
> Mute This Topic:https://lists.openembedded.org/mt/86444902/4454501
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
douglas.royds@taitradio.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------R4zzgP4aGpGtH0lehmnp00m0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>We do "wrap" classes in our own proprietary layer.</p>
    <p>In a layer called meta-abc, we name the wrapper-class
      classname-abc.bbclass. For instance, we wrap cmake.bbclass as
      follows:</p>
    <blockquote>
      <p><font face=3D"monospace"># cmake-abc.bbclass</font></p>
    </blockquote>
    <blockquote>
      <p><font face=3D"monospace">inherit cmake</font></p>
      <p><font face=3D"monospace"># Additions to cmake behaviour go here<=
br>
          ...<br>
        </font></p>
    </blockquote>
    <p>Our meta-abc recipes inherit cmake-abc. In this way, the
      wrapper-class behaves very much like a bbappend.<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 20/10/21 10:09 pm, Peter
      Kjellerstedt wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:0618e0381622433f86303a2d5d6968cd@axis.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"Segoe UI Emoji";
	panose-1:2 11 5 2 4 2 4 2 2 3;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">I thought of another problem with the wrapper
            class solution: if we need to actually backport a newer
            version of the class from, e.g., Poky master, then there is
            now no natural place for it since it is occupied by the
            wrapper class. That means we would either have to rename the
            backported class, or put it somewhere else than in
            =E2=80=9Cclasses=E2=80=9D. It also means backporting a class =
requires the
            wrapper class to be modified.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">Here is a question for Richard: what do you
            think of an idea I had to add support in bitbake for
            extending classes? I do not mean to add something like
            bbclassappend, as I know that is troublesome. My idea
            instead is something like the prefuncs/postfuncs that we
            have for functions. I.e., before actually doing the inherit
            of a class
          </span><span
            style=3D"font-family:Consolas;color:#943634;mso-fareast-langu=
age:EN-US"
            lang=3D"EN-US">foo</span><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">, bitbake would inherit anything specified in
          </span><span
            style=3D"font-family:Consolas;color:#943634;mso-fareast-langu=
age:EN-US"
            lang=3D"EN-US">BBCLASS_PRE_INHERIT:foo</span><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">, and after inheriting the class it would
            automatically inherit anything in </span><span
            style=3D"font-family:Consolas;color:#943634;mso-fareast-langu=
age:EN-US"
            lang=3D"EN-US">BBCLASS_POST_INHERIT:foo</span><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">. =C2=A0That way one can simply extend a class
            through normal variable operations, making it easy to do,
            e.g., in the distro configuration.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US">//Peter<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span
            style=3D"color:#943634;mso-fareast-language:EN-US"
            lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
        <div style=3D"border:none;border-left:solid blue 1.5pt;padding:0c=
m
          0cm 0cm 4.0pt">
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span>=
</b><span
                  lang=3D"EN-US"> <a class=3D"moz-txt-link-abbreviated" h=
ref=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-core=
@lists.openembedded.org</a>
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:opene=
mbedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembe=
dded.org&gt;</a>
                  <b>On Behalf Of </b>Peter Kjellerstedt<br>
                  <b>Sent:</b> den 20 oktober 2021 03:32<br>
                  <b>To:</b> Jose Quaresma
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:quare=
sma.jose@gmail.com">&lt;quaresma.jose@gmail.com&gt;</a><br>
                  <b>Cc:</b> OE-core
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:opene=
mbedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembe=
dded.org&gt;</a><br>
                  <b>Subject:</b> Re: [OE-core] [PATCH]
                  externalsrc.bbclass: Allow externalsrc to be extended
                  with extra classes<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
          <p class=3D"MsoNormal"><span
              style=3D"color:#943634;mso-fareast-language:EN-US"
              lang=3D"EN-US">Well, I had not considered that option. I
              can=E2=80=99t say I am to keen on having wrapper classes wi=
th the
              same name as the upstream classes as I think it leads to
              confusion. And the solution doesn=E2=80=99t scale very well=
 (what
              if two layers want to override the same class?). But on
              the positive side it works for any class without requiring
              changes to OE-Core. And I guess the latter wins. I wish
              there was a more bitbakey way to add to classes though
              (bbclassappend anyone? </span><span
              style=3D"font-family:&quot;Segoe UI
              Emoji&quot;,sans-serif;color:#943634;mso-fareast-language:E=
N-US"
              lang=3D"EN-US">=F0=9F=98=89</span><span
              style=3D"color:#943634;mso-fareast-language:EN-US"
              lang=3D"EN-US">).<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span
              style=3D"color:#943634;mso-fareast-language:EN-US"
              lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
          <p class=3D"MsoNormal"><span
              style=3D"color:#943634;mso-fareast-language:EN-US"
              lang=3D"EN-US">//Peter<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span
              style=3D"color:#943634;mso-fareast-language:EN-US"
              lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
          <div style=3D"border:none;border-left:solid blue
            1.5pt;padding:0cm 0cm 0cm 4.0pt">
            <div>
              <div style=3D"border:none;border-top:solid #E1E1E1
                1.0pt;padding:3.0pt 0cm 0cm 0cm">
                <p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</spa=
n></b><span
                    lang=3D"EN-US"> Jose Quaresma &lt;<a
                      href=3D"mailto:quaresma.jose@gmail.com"
                      moz-do-not-send=3D"true"
                      class=3D"moz-txt-link-freetext">quaresma.jose@gmail=
.com</a>&gt;
                    <br>
                    <b>Sent:</b> den 19 oktober 2021 19:15<br>
                    <b>To:</b> Peter Kjellerstedt &lt;<a
                      href=3D"mailto:peter.kjellerstedt@axis.com"
                      moz-do-not-send=3D"true"
                      class=3D"moz-txt-link-freetext">peter.kjellerstedt@=
axis.com</a>&gt;<br>
                    <b>Cc:</b> OE-core &lt;<a
                      href=3D"mailto:openembedded-core@lists.openembedded=
.org"
                      moz-do-not-send=3D"true"
                      class=3D"moz-txt-link-freetext">openembedded-core@l=
ists.openembedded.org</a>&gt;<br>
                    <b>Subject:</b> Re: [OE-core] [PATCH]
                    externalsrc.bbclass: Allow externalsrc to be
                    extended with extra classes<o:p></o:p></span></p>
              </div>
            </div>
            <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
            <div>
              <div>
                <p class=3D"MsoNormal">Hi Peter,<br>
                  <br>
                  require the class on the new one will do the same<o:p><=
/o:p></p>
              </div>
              <div>
                <p class=3D"MsoNormal">and we don't need any changes for
                  that<o:p></o:p></p>
              </div>
              <div>
                <p class=3D"MsoNormal">but I may not be seeing everything=
<o:p></o:p></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
                <p class=3D"MsoNormal">require
                  ${COREBASE}/meta/classes/externalsrc.bbclass<o:p></o:p>=
</p>
              </div>
              <div>
                <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
              </div>
              <div>
                <p class=3D"MsoNormal">Jose<o:p></o:p></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
              </div>
              <div>
                <div>
                  <p class=3D"MsoNormal">Peter Kjellerstedt &lt;<a
                      href=3D"mailto:peter.kjellerstedt@axis.com"
                      moz-do-not-send=3D"true"
                      class=3D"moz-txt-link-freetext">peter.kjellerstedt@=
axis.com</a>&gt;
                    escreveu no dia ter=C3=A7a, 19/10/2021 =C3=A0(s) 18:0=
3:<o:p></o:p></p>
                </div>
                <blockquote style=3D"border:none;border-left:solid #CCCCC=
C
                  1.0pt;padding:0cm 0cm 0cm
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt">
                  <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">T=
he
                    EXTERNALSRC_EXTENSIONS variable holds a list of
                    additional classes<br>
                    that will be inherited when externalsrc is
                    inherited.<br>
                    <br>
                    Signed-off-by: Peter Kjellerstedt &lt;<a
                      href=3D"mailto:peter.kjellerstedt@axis.com"
                      target=3D"_blank" moz-do-not-send=3D"true"
                      class=3D"moz-txt-link-freetext">peter.kjellerstedt@=
axis.com</a>&gt;<br>
                    ---<br>
                    <br>
                    We have had a local copy of this class for a long
                    time since we need<br>
                    to make it suppport a local class when checking
                    BBCLASSEXTEND. And<br>
                    now we wanted to add some more functionality that
                    should be active<br>
                    when externalsrc is in use. So instead of forking
                    the class even<br>
                    more, I thought it would be better to make the
                    upstream class<br>
                    extendable. The solution was inspired by
                    USERADDEXTENSION in<br>
                    useradd.bbclass.<br>
                    <br>
                    =C2=A0meta/classes/externalsrc.bbclass | 5 +++++<br>
                    =C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0=
| 1 +<br>
                    =C2=A02 files changed, 6 insertions(+)<br>
                    <br>
                    diff --git a/meta/classes/externalsrc.bbclass
                    b/meta/classes/externalsrc.bbclass<br>
                    index abfe24bace..488d75760f 100644<br>
                    --- a/meta/classes/externalsrc.bbclass<br>
                    +++ b/meta/classes/externalsrc.bbclass<br>
                    @@ -265,3 +265,8 @@ def
                    srctree_configure_hash_files(d):<br>
                    =C2=A0 =C2=A0 =C2=A0return ' '.join(out_items)<br>
                    <br>
                    =C2=A0EXPORT_FUNCTIONS do_buildclean<br>
                    +<br>
                    +# Use the following to extend externalsrc with
                    custom functionality<br>
                    +EXTERNALSRC_EXTENSIONS ??=3D ""<br>
                    +<br>
                    +inherit ${EXTERNALSRC_EXTENSIONS}<br>
                    diff --git a/meta/conf/documentation.conf
                    b/meta/conf/documentation.conf<br>
                    index 80ad8e10d5..6d5b734b02 100644<br>
                    --- a/meta/conf/documentation.conf<br>
                    +++ b/meta/conf/documentation.conf<br>
                    @@ -160,6 +160,7 @@ EXTENDPE[doc] =3D "Used with file
                    and pathnames to create a prefix for a recipe's<br>
                    =C2=A0EXTENDPKGV[doc] =3D "The full package version
                    specification as it appears on the final packages
                    produced by a recipe."<br>
                    =C2=A0EXTERNALSRC[doc] =3D "If externalsrc.bbclass is
                    inherited, this variable points to the source tree,
                    which is outside of the OpenEmbedded build system."<b=
r>
                    =C2=A0EXTERNALSRC_BUILD[doc] =3D "If externalsrc.bbcl=
ass is
                    inherited, this variable points to the directory in
                    which the recipe's source code is built, which is
                    outside of the OpenEmbedded build system."<br>
                    +EXTERNALSRC_EXTENSIONS[doc] =3D "A list of additiona=
l
                    classes that will be inherited when externalsrc is
                    inherited."<br>
                    =C2=A0EXTRA_IMAGE_FEATURES[doc] =3D "The list of addi=
tional
                    features to include in an image. Configure this
                    variable in the conf/local.conf file in the Build
                    Directory."<br>
                    =C2=A0EXTRA_IMAGEDEPENDS[doc] =3D "A list of recipes =
to
                    build that do not provide packages for installing
                    into the root filesystem. Use this variable to list
                    recipes that are required to build the final image,
                    but not needed in the root filesystem."<br>
                    =C2=A0EXTRA_OECMAKE[doc] =3D "Additional cmake option=
s."<o:p></o:p></p>
                </blockquote>
              </div>
              <p class=3D"MsoNormal"><br clear=3D"all">
                <o:p></o:p></p>
              <div>
                <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
              </div>
              <p class=3D"MsoNormal">-- <o:p></o:p></p>
              <div>
                <div>
                  <p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
                  <div>
                    <p class=3D"MsoNormal"><br>
                      Jos=C3=A9 Quaresma<o:p></o:p></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#157255): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/157255">https:/=
/lists.openembedded.org/g/openembedded-core/message/157255</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/86444902/4454501">https://lists.openembedded.org/mt/=
86444902/4454501</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:douglas.royds@taitradio.com">douglas.royds@taitradio.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>
--------------R4zzgP4aGpGtH0lehmnp00m0--


