Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEF8C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 06:56:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7613.1672901759721416054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 22:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQko2ns7;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id x11so13423197ljh.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSFTVlB3Wo/BStJ+3i6PdTgPKx05IB/E2d/9/zNPTA8=;
        b=bQko2ns7DAMZMJVk6YDpwqqXOmWR4gfNXhWvIjVwM4Zv1PGaocFEoEMdlhKWsXPltC
         TsAzUHnwuvoTrHf1NKI5iVWu09/OSsLfPWxyUztFyS4LxpYXC2pBd78Tc1xroPn4iXt8
         fGnvQgtgQZ+X6S7R04jzGy8pJuihE/b/pdzLiLNqM2QfllfXF2UOOPZCWAOBjG7IGXG6
         cXkosePAYk8TttNxGEn/+v8S/BHIoStmr89dPCJfs0qKwsh6BN6UcgmvzeV/46g8kVGv
         A8QlxfRp3Far4ld8iqYIs4zDlpxDgQAtHEXpx6EbpJm0TfkP6LWLs2N45il04iN3eXBO
         rpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSFTVlB3Wo/BStJ+3i6PdTgPKx05IB/E2d/9/zNPTA8=;
        b=zNyIye8OGKQg/5FMIt84XInzLyTrnJE0Gdhcz5Dr0otNS/Qtsn23kKy26U2RY3sB9M
         6nNtU2ZnqBjxBH467XcH9XtCOFhoJy48wFSYkDFt/5oYatH604oe+U1tESx2hmXBSC/y
         CfKB4K9P+rSd8Kr++zcUQzNnxV1pCaFabfeWFVJ6OkUdbwkG9+FO/Fimw9TOwGCb1wet
         t/TwPsguN2gV2y7Lou1m+R2IC858iAs7MsXEeuWtPuMvnmTjBsOf6f/Er9ci7AuNeFYT
         P3tL+72BxZeyv2uFK/nTqjhWp2U5PuGlAh1OOftQ219LtSRbL3GShPoTDvG/m1SPtkKD
         OGuA==
X-Gm-Message-State: AFqh2krGneLDlUxLSzVdTqRVbYRUHPlSMgsCAiRU+zIw1sS69JiVPoA9
	c6OwEcVfsQZQE/WSYGpgqNM7b0YAyo7jFQS5VTM=
X-Google-Smtp-Source: AMrXdXsho+qqPpBrwpznJQoDbZAPW31DbcjKK2l43tHNhPvfRi0WI/VUegIdL9NCaKrT4z1ssmmMa5djE+ZhKpsUECs=
X-Received: by 2002:a2e:a4b3:0:b0:27f:ed42:72c5 with SMTP id
 g19-20020a2ea4b3000000b0027fed4272c5mr1170281ljm.217.1672901757697; Wed, 04
 Jan 2023 22:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com> <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 07:55:42 +0100
Message-ID: <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000304a505f17ecb0f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 06:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175515

--0000000000000304a505f17ecb0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But does this mean we now have to insert required distro features statement
into everything that depends on gtk4? That doesn=E2=80=99t seem useful; it =
should
be enough to say that only in the recipe where the requirement originates.

Alex

On Thu 5. Jan 2023 at 3.10, Yu, Mingli <Mingli.Yu@windriver.com> wrote:

> Hi Alex,
>
> Yes,  The setting REQUIRED_DISTRO_FEATURES =3D "opengl" is in gtk4 recipe=
.
> Apart from that, gtk4 depends on libepoxy which also needs opengl distro.
>
> Thanks,
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Friday, December 23, 2022 17:43
> *To:* Yu, Mingli <Mingli.Yu@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] gcr: add opengl to
> REQUIRED_DISTRO_FEATURES
>
> * CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
> Is OpenGL really mandatory for gtk4?
>
> Alex
>
> On Fri 23. Dec 2022 at 10.32, Yu, Mingli <mingli.yu@eng.windriver.com>
> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   $ bitbake gcr
>   ERROR: Nothing PROVIDES 'gtk4' (but
> /build/layers/oe-core/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> DEPENDS on or otherwise requires it)
> gtk4 was skipped: missing required distro feature 'opengl' (not in
> DISTRO_FEATURES)
>   ERROR: Required build target 'gcr' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['gcr', 'gtk4']
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> index 264069ffd1..22edd386fc 100644
> --- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> <https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_X=
F2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4Cu=
XgAucUmL4$>
> @@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
>  inherit gnomebase gtk-icon-cache gi-docgen features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
>
> +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'opengl', '', d)}"
> +
>  SRC_URI +=3D
> "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
>  SRC_URI[archive.sha256sum] =3D
> "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174976):
> https://lists.openembedded.org/g/openembedded-core/message/174976
> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-core/message/174976__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAA=
nzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgJaHBHwR$>
> Mute This Topic: https://lists.openembedded.org/mt/95842308/1686489
> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/95842308/1=
686489__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBz=
XRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgFA08ADx$>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-core/unsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$>
> [alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000304a505f17ecb0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But does this mean we now have to insert required distro =
features statement into everything that depends on gtk4? That doesn=E2=80=
=99t seem useful; it should be enough to say that only in the recipe where =
the requirement originates.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Alex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu 5. Jan 2023 at 3.10, Yu, Mingli &lt;<a href=3D"ma=
ilto:Mingli.Yu@windriver.com">Mingli.Yu@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">




<div dir=3D"ltr">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">Hi Alex,</span><=
/div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;background-color:rgb(255,255,255);color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">Yes,=C2=A0 The s=
etting REQUIRED_DISTRO_FEATURES
 =3D &quot;opengl&quot; is in gtk4 recipe. Apart from that, gtk4 depends on=
=C2=A0libepoxy which also needs opengl distro.</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;background-color:rgb(255,255,255);color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-siz=
e:12pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">Thanks,</span></=
div>
<div id=3D"m_-7193453025957777169appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-7193453025957777169divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk" style=3D"font-family:Calibri,sans-serif">alex.kanavin@gmail.com</a>&gt;=
<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Friday, December 23, =
2022 17:43<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Yu, Mingli &lt;<a href=
=3D"mailto:Mingli.Yu@windriver.com" target=3D"_blank" style=3D"font-family:=
Calibri,sans-serif">Mingli.Yu@windriver.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a> &lt;<a hr=
ef=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" st=
yle=3D"font-family:Calibri,sans-serif">openembedded-core@lists.openembedded=
.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH] gcr: add opengl to REQUIRED_DISTRO_FEATURES</font>
<div>=C2=A0</div>
</div>
<div><strong>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background-color:=
rgb(252,252,3)"><span style=3D"font-size:11pt;color:rgb(0,0,0)">CAUTION: Th=
is email comes from a non Wind River email account!</span></div></strong><b=
r>
<span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click links or open =
attachments unless you recognize the sender and know the content is safe.</=
span><br>
</div></div><div dir=3D"ltr">
<div>
<div dir=3D"auto">Is OpenGL really mandatory for gtk4?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div>
<div dir=3D"ltr">On Fri 23. Dec 2022 at 10.32, Yu, Mingli &lt;<a href=3D"ma=
ilto:mingli.yu@eng.windriver.com" target=3D"_blank">mingli.yu@eng.windriver=
.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">
From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_b=
lank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Fixes:<br>
=C2=A0 $ bitbake gcr<br>
=C2=A0 ERROR: Nothing PROVIDES &#39;gtk4&#39; (but /build/layers/oe-core/me=
ta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://gcr_4.0.=
0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXR=
ulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=3D"_blan=
k">gcr_4.0.0.bb</a>
 DEPENDS on or otherwise requires it)<br>
gtk4 was skipped: missing required distro feature &#39;opengl&#39; (not in =
DISTRO_FEATURES)<br>
=C2=A0 ERROR: Required build target &#39;gcr&#39; has no buildable provider=
s.<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;gcr&#39;, &#39;gt=
k4&#39;]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__=
http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnz=
q3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" =
target=3D"_blank">gcr_4.0.0.bb</a> b/meta/recipes-gnome/gcr/<a href=3D"http=
s://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx=
6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUm=
L4$" rel=3D"noreferrer" target=3D"_blank">gcr_4.0.0.bb</a><br>
index 264069ffd1..22edd386fc 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
=C2=A0inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-ve=
rsion-is-even vala gobject-introspection gettext mime mime-xdg<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;gcr-(?P&lt;pver&gt;\d+\.(\d*[02468])+(=
\.\d+)+)\.tar.xz&quot;<br>
<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;, &#39;x11&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
=C2=A0SRC_URI +=3D &quot;file://0001-meson.build-correctly-handle-disabled-=
ssh_agent-opti.patch&quot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;c45855924f0ee7bab43e2dd38bfafd2a=
c815c6e9864341c0161e171173dcec7c&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174976): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/174976__;!!AjveYdw8EvQ!=
aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPyc=
XwXHb4CuXgJaHBHwR$" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/174976</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/95842308/1686489__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcY=
aA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgFA08ADx$" rel=3D"=
noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/95842308/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmL=
cYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$" rel=
=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>


</blockquote></div></div>

--0000000000000304a505f17ecb0f--

