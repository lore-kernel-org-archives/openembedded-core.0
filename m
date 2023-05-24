Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193C4C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 12:11:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6991.1684930258183196557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EdwffeDK;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so7266865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684930256; x=1687522256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E9b8W9+mjxSugf/tVqkx6TJIM807r8Hi+oe7WDbxOyk=;
        b=EdwffeDKNepwQDfSwFDfx+zyfEIUrirAag+gaN5YgUHjhvHJeMBjRaqOR7oUPGteGx
         ZkiwKWcq+9F5JUJfJcon48/Q3aOpLsD6ssXvzpO2naVC4EOBM6Y3wKkFd2T5VVH9KbmD
         QS7FW5IPSxlSjUJEVdd28UrG6NC+5KzKWbNSlDfFbrwhCOrEq8qSSdj77E/6DndFCIz5
         Awcldyrf6kDDAL7pErgcm4znHs0Mf+w9mVxhKweRLNqZ61A7GnATTJhryfe9W3bLBGaU
         Vg8APtcbnncb/gffe4KqDXCOns16TvMk19RlW7cZttvhz2HK7tLbAyj+sKS0LbCeLOBa
         hjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684930256; x=1687522256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9b8W9+mjxSugf/tVqkx6TJIM807r8Hi+oe7WDbxOyk=;
        b=G9wtc2IUP3/mXhO2+d1/MFQb/qTJYkQ2vOITzqtlfwg1NY/bbDBtV+TBo+3/mCGj2I
         Yhp0HsSFV+5LCh6zyH3crqyDX5TzErMavPr0lQdRNsvpksTKdrJRd9VcbCNatuTpcwX9
         ASF/b7Z6XRmSYwHi31ikF2n6Bh/gF/KvYQ421GgTFutZSSgr2KaTLYqbgACZ/q/MdO3z
         Y9uSgvi24GdTQWDHiBfuCOpymAlrnHvWyPmARFiuj+cz6J8znrP6iNHWvDPLPPw2BKyG
         DyM9koigC7bsRDP7AuSKBeBoVEtWOmL8WLnkAcn660ssgH/1TzPXjUqTGow0AQNr8M2y
         rqqQ==
X-Gm-Message-State: AC+VfDz6+0lOLFpsrGhkivqvmmr0f+bcm7linT+UqsfVrTGWR4Jh2cjb
	GmaLPm87x2T8iBdWhx6YHTFA1rnAnF1S+40QKQY=
X-Google-Smtp-Source: ACHHUZ5DxcCc025tD8UCUAmbWUqEzfOugqROydky562T+lA64cWVRRW0D5cRoCBce/DotKnmqZ+hhTkJ1BIdPsTvDyY=
X-Received: by 2002:a1c:f715:0:b0:3f4:24c8:f7c6 with SMTP id
 v21-20020a1cf715000000b003f424c8f7c6mr13275551wmh.16.1684930256435; Wed, 24
 May 2023 05:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230516184031.2255171-1-ross.burton@arm.com> <20230516184031.2255171-6-ross.burton@arm.com>
 <DB4PR02MB10030D5405A91EAD95AC68552E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <9FD419B3-F0FF-444B-9277-C8D34460427F@arm.com>
In-Reply-To: <9FD419B3-F0FF-444B-9277-C8D34460427F@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2023 14:10:41 +0200
Message-ID: <CA+chaQeGNYAJT5MqO6oXWod4Zhz_0vee5Na-2VsO_pNt78ad2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] python3-pygobject: mandate
 gobject-introspection-data DISTRO_FEATURE
To: Ross Burton <ross.burton@arm.com>
Cc: =?UTF-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <kubiznak@2n.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000067fd7805fc6f6597"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 12:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181671

--00000000000067fd7805fc6f6597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross, are you going to add REQUIRED_DISTRO_FEATURES =3D
"gobject-introspection-data" to these as well?

ERROR: Nothing PROVIDES 'python3-pygobject' (but
meta-oe/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
DEPENDS on or otherwise requires it)
python3-pygobject was skipped: missing required distro feature
'gobject-introspection-data' (not in DISTRO_FEATURES)

ERROR: Nothing RPROVIDES 'python3-pygobject' (but
meta-oe/meta-networking/dynamic-layers/meta-python/recipes-connectivity/fir=
ewalld/
firewalld_1.2.0.bb,
meta-oe/meta-networking/recipes-daemons/networkd-dispatcher/
networkd-dispatcher_2.1.bb, oe-core/meta/recipes-devtools/python/
python3-dbusmock_0.28.7.bb, meta-oe/meta-python/recipes-devtools/python/
python3-pydbus_0.6.0.bb,
meta-oe/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb,
meta-oe/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
RDEPENDS on or otherwise requires it)
python3-pygobject was skipped: missing required distro feature
'gobject-introspection-data' (not in DISTRO_FEATURES)

There are probably few more, e.g. python3-pydbus-manager which rdepends on
python3-pydbus.

Regards,

On Mon, May 22, 2023 at 6:11=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> On 18 May 2023, at 11:49, Petr Kubiz=C5=88=C3=A1k - 2N <kubiznak@2n.com> =
wrote:
> >
> > With gobject-introspection in DEPENDS, PyGObject builds always, even if
> gobject-introspection-data is not in DISTRO_FEATURES. Is this conditional
> approach better?
>
> Builds is not the same as is useful.
>
> PyGObject uses G-I to interface to GObject itself.
>
> Without qemu-usermode, gobject-introspection is a stub, as can be shown b=
y
> comparing gobject-introspection with and without qemu-usermode:
>
> Changes to packages/cortexa57-poky-linux/gobject-introspection (sysroot):
>   /usr/lib/girepository-1.0 was removed
>   /usr/lib/girepository-1.0/Gio-2.0.typelib was removed
>   /usr/lib/girepository-1.0/GIRepository-2.0.typelib was removed
> =E2=80=A6
>
> The target gobject-introspection recipe should also refuse to build unles=
s
> GI is enabled.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181598):
> https://lists.openembedded.org/g/openembedded-core/message/181598
> Mute This Topic: https://lists.openembedded.org/mt/98932959/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000067fd7805fc6f6597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ross, are you going to add=C2=A0REQUIRED_DISTRO_FEATU=
RES =3D &quot;gobject-introspection-data&quot; to these as well?</div><div>=
<br></div>ERROR: Nothing PROVIDES &#39;python3-pygobject&#39; (but meta-oe/=
meta-networking/recipes-connectivity/blueman/<a href=3D"http://blueman_2.3.=
5.bb">blueman_2.3.5.bb</a> DEPENDS on or otherwise requires it)<br>python3-=
pygobject was skipped: missing required distro feature &#39;gobject-introsp=
ection-data&#39; (not in DISTRO_FEATURES)<br><br>ERROR: Nothing RPROVIDES &=
#39;python3-pygobject&#39; (but meta-oe/meta-networking/dynamic-layers/meta=
-python/recipes-connectivity/firewalld/<a href=3D"http://firewalld_1.2.0.bb=
">firewalld_1.2.0.bb</a>, meta-oe/meta-networking/recipes-daemons/networkd-=
dispatcher/<a href=3D"http://networkd-dispatcher_2.1.bb">networkd-dispatche=
r_2.1.bb</a>, oe-core/meta/recipes-devtools/python/<a href=3D"http://python=
3-dbusmock_0.28.7.bb">python3-dbusmock_0.28.7.bb</a>, meta-oe/meta-python/r=
ecipes-devtools/python/<a href=3D"http://python3-pydbus_0.6.0.bb">python3-p=
ydbus_0.6.0.bb</a>, meta-oe/meta-networking/recipes-connectivity/blueman/<a=
 href=3D"http://blueman_2.3.5.bb">blueman_2.3.5.bb</a>, meta-oe/meta-python=
/recipes-devtools/python/<a href=3D"http://python3-asyncio-glib_0.1.bb">pyt=
hon3-asyncio-glib_0.1.bb</a> RDEPENDS on or otherwise requires it)<br>pytho=
n3-pygobject was skipped: missing required distro feature &#39;gobject-intr=
ospection-data&#39; (not in DISTRO_FEATURES)<br><div><br></div><div>There a=
re probably few more, e.g.=C2=A0python3-pydbus-manager which rdepends on py=
thon3-pydbus.</div><div><br></div><div>Regards,</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 22, 2023=
 at 6:11=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">=
ross.burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 18 May 2023, at 11:49, Petr Kubiz=C5=88=C3=A1k - 2N &=
lt;<a href=3D"mailto:kubiznak@2n.com" target=3D"_blank">kubiznak@2n.com</a>=
&gt; wrote:<br>
&gt; <br>
&gt; With gobject-introspection in DEPENDS, PyGObject builds always, even i=
f gobject-introspection-data is not in DISTRO_FEATURES. Is this conditional=
 approach better?<br>
<br>
Builds is not the same as is useful.<br>
<br>
PyGObject uses G-I to interface to GObject itself.<br>
<br>
Without qemu-usermode, gobject-introspection is a stub, as can be shown by =
comparing gobject-introspection with and without qemu-usermode:<br>
<br>
Changes to packages/cortexa57-poky-linux/gobject-introspection (sysroot):<b=
r>
=C2=A0 /usr/lib/girepository-1.0 was removed<br>
=C2=A0 /usr/lib/girepository-1.0/Gio-2.0.typelib was removed<br>
=C2=A0 /usr/lib/girepository-1.0/GIRepository-2.0.typelib was removed<br>
=E2=80=A6<br>
<br>
The target gobject-introspection recipe should also refuse to build unless =
GI is enabled.<br>
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181598): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181598" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181598</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98932959/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98932959/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000067fd7805fc6f6597--

