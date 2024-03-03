Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CA1C5475B
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 13:17:22 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.72658.1709471832057901451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 05:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=JtuP6cyG;
 spf=pass (domain: smile.fr, ip: 209.85.208.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so5487651a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 05:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709471830; x=1710076630; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GdlwvKmJcei1fpnJFiVFRikk3FrpV9mc+Ooawb42JXE=;
        b=JtuP6cyGA3Y3/ajPNKl4V97/FgS/s//MDmga0IO6nxgU3IWK6yKIxP1Y0yNsVGLQUH
         juO0C207huBg6KPpprzgbk5bfqK6GLcXWwK8NS30Df3xhTuKQR2EP4FB73DXd0ROkkTu
         tdB9ZWIwSf6aiKI0fObWew3dp4cIAk3hoVy+8r+uS86+FtG5xAl97vAPAwWXug8Msf/L
         cna8+yE0g/8zYgqlf4zk10Vx2LXHqolbNT22z2lM3BVAK6PX8Qlc0vXbvnoyfKgGWVjG
         7FtWo1UdxjyhFLT3Jt08CyZBw7FX+wSgQFzNHEPi1aDIqNT0QfmuiGZ6luT8mtOKtvpP
         lBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709471830; x=1710076630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdlwvKmJcei1fpnJFiVFRikk3FrpV9mc+Ooawb42JXE=;
        b=kjCPMklCLHzU5GPzLq18h7kOViDwdphZ5EJCx4AMBzPuPs2RJJh9xqH1NP2Ef+ffhn
         PRbJoPllkN+EK/v/rWA7U98vIaXK7Ce6O7gCufTuS8i/MsC35QKYwLiqvhC0oB1H9hAF
         ocXjdGE8oZCbPMqyOPm+XeOdrgosLA2mfMZ1qLYvelPDyw9tMYmUlBrXt29WSOMZd0+C
         lFgRW4+4VNwJW0h9q+hkLrkIy0nir56moqHaL1GABzHo/N92AoeV6kqNUcdAP7mizceU
         4vymkAp1jZxS5aaR47LMUHgpmsHceLMY4D/AP+vHcShg/cJI9bNYsI5CS8hKrfNjCZx4
         O60A==
X-Forwarded-Encrypted: i=1; AJvYcCVg6825FoXQpVMhZnXVxJ4L1iqQ2L7bprUA5BoGVOELqolqxt2mxN/wpSsgonXPBR0bMJ4DZJDfAPVD2dmRF08oiKHqTVBPaBLHM3gGp2fj//42btBqDjb2
X-Gm-Message-State: AOJu0YzPQDjE095cjgXKYrwA8Fk7+aA/Fnl+PZA7ujrwy9pHL6W1Otom
	oUgjDqdq2eiJ0tQvf6sAOQxQDCWZkqMSbwbyu7po3t2D7QXkb3LJ8YAyp5KkTDm7L9SJFquviSJ
	8Km5FlNs8CjzFp7rGxmH0frw2sPkOCBywgkMifw==
X-Google-Smtp-Source: AGHT+IFwKTTV2ieAUI+zAiP2OZWycEqAfK92OVXcfmgrO6kAK2OUknBphMwFHPofaD3v9VuIwZC3Qu5EU60/GdPrC+s=
X-Received: by 2002:a17:906:a454:b0:a45:3113:e875 with SMTP id
 cb20-20020a170906a45400b00a453113e875mr503126ejb.29.1709471829937; Sun, 03
 Mar 2024 05:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20240303111845.7A4DE106912@builder.sakoman.com>
 <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net> <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
In-Reply-To: <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Sun, 3 Mar 2024 14:16:43 +0100
Message-ID: <CAMSfU+6k3a8VW=j7bQGY7ebc+ZexshmQLJAV_9oXwTYa2AdJuQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002d65390612c16d96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 13:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196561

--0000000000002d65390612c16d96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 3 mars 2024 =C3=A0 13:36, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Sun, 2024-03-03 at 11:49 +0000, Simone Wei=C3=9F wrote:
> > > Full list:  Found 41 unpatched CVEs
>
> I'm a bit puzzled/worried that our patch metrics page says 50 rather
> than 41:
>
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-mast=
er.txt
>
> :/
>
> Does anyone know why?
>

Weird...

Here is the added CVEs from Steve's run to the AB run (
https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/1275/ste=
ps/15/logs/stdio
):
+CVE-2022-3563: bluez5
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563 *
+CVE-2022-3637: bluez5
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637 *
+CVE-2023-28736: mdadm
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28736 *
+CVE-2023-28938: mdadm
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28938 *
+CVE-2023-3180: qemu:qemu-native:qemu-system-native
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
+CVE-2023-3354: qemu:qemu-native:qemu-system-native
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354 *
+CVE-2023-4135: qemu:qemu-native:qemu-system-native
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
+CVE-2023-6918: libssh2:libssh2-native
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6918 *
+CVE-2024-24806: libuv
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24806 *

I've started looking at this at the top:
CVE-2022-3563: bluez5
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563 *
=3D> Fixed in >=3D 5.65 (last NVD update November 2023), bluez5 is 5.72 in
oe-core but cve-check says Unpatched :
https://git.yoctoproject.org/yocto-metrics/tree/cve-check/master/1709449295=
.json?id=3D851f9dd3bf9faccb85796b45e62139cc50cbbcb7#n12305
Locally this CVE is not displayed as unpatched.

The rest of the list is in similar state:
* oe-core is updated enough for the CVE to be patched as per NVD data
* all NVD updates are at least a few weeks old (except CVE-2024-24806:
libuv : 4 days)
* locally these CVE do not appear as Unpatched

Something is weird on the autobuilder. Maybe keep the build directory
around and a copy of the current CVE database for analysis
($DL_DIR/CVE_CHECK/nvdcve_2-1.db) ?



> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1089):
> https://lists.yoctoproject.org/g/yocto-security/message/1089
> Mute This Topic: https://lists.yoctoproject.org/mt/104700791/4316185
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000002d65390612c16d96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 3 mars 2024 =C3=A0=C2=A0=
13:36, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2024-03-03 at 1=
1:49 +0000, Simone Wei=C3=9F wrote:<br>
&gt; &gt; Full list:=C2=A0 Found 41 unpatched CVEs<br>
<br>
I&#39;m a bit puzzled/worried that our patch metrics page says 50 rather<br=
>
than 41:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-st=
atus-master.txt" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octo.io/pub/non-release/patchmetrics/cve-status-master.txt</a><br>
<br>
:/<br>
<br>
Does anyone know why?<br></blockquote><div><br></div><div>Weird...</div><di=
v><br></div><div>Here is the added CVEs from Steve&#39;s run to the AB run =
(<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/138/bui=
lds/1275/steps/15/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/=
#/builders/138/builds/1275/steps/15/logs/stdio</a>):<br></div><div>+CVE-202=
2-3563: bluez5 <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2022-3563">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
22-3563</a> *</div><div>+CVE-2022-3637: bluez5 <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637">https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-3637</a> *</div><div>+CVE-2023-28736: mda=
dm <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-2=
8736">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28736</a>=
 *<br>+CVE-2023-28938: mdadm <a href=3D"https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2023-28938">https://web.nvd.nist.gov/view/vuln/detail?v=
ulnId=3DCVE-2023-28938</a> *<br>+CVE-2023-3180: qemu:qemu-native:qemu-syste=
m-native <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2023-3180">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180=
</a> *<br>+CVE-2023-3354: qemu:qemu-native:qemu-system-native <a href=3D"ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354">https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354</a> *<br>+CVE-2023-41=
35: qemu:qemu-native:qemu-system-native <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-4135">https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-4135</a> *<br>+CVE-2023-6918: libssh2:libssh2-na=
tive <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-6918">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6918</a>=
 *<br>+CVE-2024-24806: libuv <a href=3D"https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2024-24806">https://web.nvd.nist.gov/view/vuln/detail?v=
ulnId=3DCVE-2024-24806</a> *</div><div><br></div><div>I&#39;ve started look=
ing at this at the top:</div><div>CVE-2022-3563: bluez5 <a href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563">https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563</a> *</div><div>=3D&gt; Fix=
ed in &gt;=3D 5.65 (last NVD update November 2023), bluez5 is 5.72 in oe-co=
re but cve-check says=20
Unpatched :=20
<a href=3D"https://git.yoctoproject.org/yocto-metrics/tree/cve-check/master=
/1709449295.json?id=3D851f9dd3bf9faccb85796b45e62139cc50cbbcb7#n12305">http=
s://git.yoctoproject.org/yocto-metrics/tree/cve-check/master/1709449295.jso=
n?id=3D851f9dd3bf9faccb85796b45e62139cc50cbbcb7#n12305</a></div><div>Locall=
y this CVE is not displayed as unpatched.</div><div><br></div><div>The rest=
 of the list is in similar state:</div><div>* oe-core is updated enough for=
 the CVE to be patched as per NVD data</div><div>* all NVD updates are at l=
east a few weeks old (except=C2=A0CVE-2024-24806: libuv : 4 days)</div><div=
>* locally these CVE do not appear as Unpatched <br></div><div><br></div><d=
iv><div>Something is weird on the autobuilder. Maybe keep the build=20
directory around and a copy of the current CVE database for analysis=20
($DL_DIR/CVE_CHECK/nvdcve_2-1.db) ?</div></div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1089): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1089" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/yocto-security/message/1089</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104700791/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104700791/4316185</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D=
"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--0000000000002d65390612c16d96--

