Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C12E7DEF7
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:39:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55461.1770046749915431428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UrdCQmrM;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so33952045e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 07:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770046748; cv=none;
        d=google.com; s=arc-20240605;
        b=WQ0e52j7TORP+tvM74RThkqqM1hxg7m/rUmB4+gqEL2eYNCmJZadRqWITyJqMEe7md
         2G7Hb8RrR0fjaxU1lcrma/SkiEgFqPdOIdbLF3ks+kCI2NSDiyGIdy9S1xpyQ1ly6547
         VaEYa6cVExeeKw7dNK/gcg/LC4BOuFM++cJCoWOHooyNidwuTvmA8DU6oqAfd8Miq/Pr
         wUeICJfLs+P3OWJziJLEmRBPBFm4cToj835Kd9LEPmlD4u7c5R/O6IA5Ctk3liLt+1GC
         O7IhgodhoD/00XJGOk2KiSWclFduR1u/UC1rV+dAGfyLa3usuYtC8MZaeQyq5S7cGQR/
         UtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZrYjPkcnRs6HfanSOvuqcJVftoaqoGne2i3kVRHk6CY=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=FQt+Rgsla3iW+L0Ao3+TQxxNJ7wDHgHUoz1fS2VQtLx0irIiEdjBitMDIkNbQqZyG1
         Z+QL0Nw4UkXfIBlH+BsHeyalFNj9bzvwneId2U9OOWhv68TSL7eab66gG7C/s54iVXOE
         3dQ903SyAsdN6yurXpmVvgto/SE69myREg4O7mYx85Ry3ksM5bFUPfJIiWvsCiMnT1tC
         iNWqJqhEqE9pxXJ7gKZ7aAVlzNzV4HGNT1sb8V1k914WbuwH6n7TGCkuaBoP7sFkbFXN
         JUMaLajqfCZjyey9vACJR7Btp7Wzt5E14s1x9cBDn9a7PLknRAWGbF2v+1h2t+leXdFJ
         mmvA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770046748; x=1770651548; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrYjPkcnRs6HfanSOvuqcJVftoaqoGne2i3kVRHk6CY=;
        b=UrdCQmrMCQBL+UssJVPvYnyOPMnPjHLgy1+77ONAP3BTcbiFWRAV5ixAb//cx1P90i
         qp1MWkAzeCY9CEDpDzel814dnaV8gr0D5x9gnfzJYudvjwA/uMvAWTVrDcb6AznN760N
         nEjuc8/hQ9ibUmHuWF/2vYbu9KKhJ43LSFJ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046748; x=1770651548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrYjPkcnRs6HfanSOvuqcJVftoaqoGne2i3kVRHk6CY=;
        b=AQWDifbxL/BZxfcrra87DW0Tc6eT1I8/eGFeS8sHpr+KdMzMBH2JLKQ4ujPISropp2
         h3Ty9D8B+q2a5nnkESWbpbQgRnrxQw3y4D9nuD/7Yq9UwzoRb+z4LosC/EDPjxZs8aVd
         8IE+iyn3247oe9CufQ3tRDag3UM6hysf9VXVS3KZpNTGm+zh9K8tF2htltv4yC0/i91h
         blh1pdgoQaYc0w/3V6qiDjV/iEhix52uLaarUQNhTueXH5lm3cdrSZuyi+IwPWb9oSoE
         RY+lwtwkg0McPkvLRe5OmuOKUuWBfQXRI+cz0z+R7aalTNS1U3IyLOgqZosWtWRpV1S4
         N5Mw==
X-Gm-Message-State: AOJu0YyJTV1CMCQG7kBYKFfp8+3YywQ9cB44nlNyfO3k946lFTyG/pq6
	fUlYmId8u+iMHk9PrTPxAH0+IouTgt5dm9pitBoBTawls8xCy/rtDec+642IiwvvDbOMo3NDQj5
	BQXxUQSxlw2qWATBCRD2LDT0ZE3SI0tmDlQpsPKCC+G3XHvNfy+j1gEY=
X-Gm-Gg: AZuq6aLqVjLm0Sl+iF5/BKBnRvNHQq3X7nYZDtIpoT1aB56JxtbC74kY52NnuvUCG91
	rxyDKPmB1vNr5CcGZlR3YTMScL22oo3c+ElKykUldXVzmWKSjtarbSQKV6HJRm1PUbr3j5sQMOS
	BHOme/cQTMj0ZWsyEin5WnHE1WXdFPliGVqQfo0QWbSrYzsDbfglgaSaDgsqEKfpYN1QCmovxq2
	+p7+5hwcXzUuGpVWeXIo+QmW74OsDmBeD0OX3Nn9ovyHzE7N2spZFzboi34cji6coAayZ2vFw==
X-Received: by 2002:a05:600c:a01:b0:480:462e:d640 with SMTP id
 5b1f17b1804b1-482db4b53f0mr155276025e9.36.1770046748121; Mon, 02 Feb 2026
 07:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20260123123336.41126-1-peter.marko@siemens.com>
 <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
 <CAMSfU+5RvtaRei8Kt=-=rRi77ch=3dFJ0DzNLDdmjfpnmTzonw@mail.gmail.com> <AS1PR10MB56972C585270289D148F9261FD9CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56972C585270289D148F9261FD9CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 2 Feb 2026 16:38:41 +0100
X-Gm-Features: AZwV_QhliYrcH8fMOJiNzTmIavE8DM0i4js-g7gc2Jrd_vJEgkV8SQFuHU39d5Y
Message-ID: <CAMSfU+6_7HFFW-_yiea028+oK=yz2mkanYVPBXTwC-EqaiZO4w@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 -> 3.5.4
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a867bd0649d91f3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230375

--000000000000a867bd0649d91f3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 janv. 2026 =C3=A0 19:47, Marko, Peter <Peter.Marko@siemens.com> =
a
=C3=A9crit :

> I have checked the m2crypto build issue and found out that I had to fix
> this for newer Yocto releases already.
>
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Df9158ce32fffa=
6f18eed4008c3295146c81d55ea
>
> Applying this commit to scarthgap works, so I have submitted it.
>
> https://lists.openembedded.org/g/openembedded-devel/message/124019
>

 Thanks Peter,

I've put that m2crypto patch on a branch and ran a full meta-openembedded
world build (every layers under meta-openembedded)
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/1285
=3D> Only warnings (reference to TMPDIR [buildpaths]) that are most likely
not related to the openssl upgrade


> Peter
>
>
>
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Wednesday, January 28, 2026 12:05
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6
> -> 3.5.4
>
>
>
> Le ven. 23 janv. 2026 =C3=A0 18:02, Yoann Congal <yoann.congal@smile.fr> =
a
> =C3=A9crit :
>
> Le ven. 23 janv. 2026 =C3=A0 13:33, Peter Marko via lists.openembedded.or=
g
> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
> Intention of this RFC is to run full autobuilder job matrix to see if
> there are any failures not detected by my local testsuite.
>
>
>
> I created a poky branch with this patch :
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/open=
ssl_3.5_upgrade
>
> (above my -nut branch to decrease the probability of an unrelated AB-INT
> failure)
>
>
>
> I've started the build :
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118
>
>
>
> Hello,
>
>
>
> As discussed during the tech call of last tuesday, I've started builds:
>
> * a new a-full with rebased branch on the latest scarthgap (now, the
> branch is only scarthgap+this upgrade)
>
>   *
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3133/
> failed on a unrelated AB-INT issue (#15945) but is otherwise OK
>
> * a meta-oe build (which includes a world build for meta-oe, meta-python,
> meta-networking & meta-filesystems):
>
>   *
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1277
>
>   * *Failed on python3-m2crypto* (log.do_compile =3D>
> https://gist.github.com/ycongal-smile/4c6501ecd81c9f475b793234cceb7a74)
>
> * to compare, I've started the same build with a vanilla scarthgap branch
> (without the openssl upgrade):
>
>   *
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1278
> =3D> success (albeit with warnings)
>
>
>
> Can you investigate this python3-m2crypto failure?
>
>
>
> Also, the "meta-oe" build does not cover every layer in meta-openembedded=
,
> I think I will increase coverage to all the meta-openembedded layers for
> the next run...
>
>
>
>
>
> Topic for discussion is especially what should be the final form of this
> upgrade as some users may want to stay on openssl 3.2.x originally
> shipped with Yocto 5.0 Scarthgap.
> Current form was chosen to easily review recipe/patch differences.
> Is it fine to overwrite or do we need to keep both version and make one
> the default and other optional? Which would be tested on AB?
>
> Peter Marko (1):
>   openssl: upgrade 3.2.6 -> 3.5.4
>
>  .../openssl/files/environment.d-openssl.sh    |  9 ++-
>  ...ke-history-reporting-when-test-fails.patch | 19 +++--
>  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
>  ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
>  .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
>  .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
>  .../{openssl_3.2.6.bb =3D> openssl_3.5.4.bb}    | 76 +++++++++++++------
>  7 files changed, 116 insertions(+), 94 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-time=
out.patch
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb =3D>
> openssl_3.5.4.bb} (75%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229884):
> https://lists.openembedded.org/g/openembedded-core/message/229884
> Mute This Topic: https://lists.openembedded.org/mt/117416674/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
>
> Yoann Congal
>
> Smile ECS
>
>
>
> --
>
> Yoann Congal
>
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--000000000000a867bd0649d91f3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0sam. 31 janv. 2026 =C3=A0=C2=A019=
:47, Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Mark=
o@siemens.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gm=
ail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 class=3D"msg1347808835790301069">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1347808835790301069WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I have checked the m2crypto build issue and found out t=
hat I had to fix this for newer Yocto releases already.<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><a href=3D"https://git.openembedded.org/meta-openembedd=
ed/commit/?id=3Df9158ce32fffa6f18eed4008c3295146c81d55ea" target=3D"_blank"=
>https://git.openembedded.org/meta-openembedded/commit/?id=3Df9158ce32fffa6=
f18eed4008c3295146c81d55ea</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Applying this commit to scarthgap works, so I have subm=
itted it.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><a href=3D"https://lists.openembedded.org/g/openembedde=
d-devel/message/124019" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-devel/message/124019</a></span></p></div></div></div></blockqu=
ote><div><br></div><div>=C2=A0Thanks Peter,</div><div><br></div><div>I&#39;=
ve put that m2crypto patch on a branch and ran a full meta-openembedded wor=
ld build (every layers under meta-openembedded)</div><a href=3D"https://aut=
obuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/1285">https://auto=
builder.yoctoproject.org/valkyrie/?#/builders/81/builds/1285</a></div><div =
class=3D"gmail_quote gmail_quote_container"><div>=3D&gt; Only warnings (ref=
erence to TMPDIR [buildpaths]) that are most likely not related to the open=
ssl upgrade</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg1347808835790301069"><div lang=3D"EN-US" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_1347808835790301069WordSect=
ion1"><p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quo=
t;Arial&quot;,sans-serif"></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Peter</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">=C2=A0</span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;
<br>
<b>Sent:</b> Wednesday, January 28, 2026 12:05<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.=
2.6 -&gt; 3.5.4</span></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0</p>
<div>
<div>
<p class=3D"MsoNormal">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A018:02, Yoann =
Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann=
.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:</p>
</div>
<div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A013:33, Peter =
Marko via <a href=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@=
lists.openembedded.org" target=3D"_blank">siemens.com@lists.openembedded.or=
g</a>&gt; a =C3=A9crit=C2=A0:</p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Intention of this RFC is to run full autobuilder job=
 matrix to see if<br>
there are any failures not detected by my local testsuite.</p>
</blockquote>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">I created a poky branch with this patch :=C2=A0<a hr=
ef=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/=
openssl_3.5_upgrade" target=3D"_blank">https://git.yoctoproject.org/poky-co=
ntrib/log/?h=3Dycongal/scarthgap/openssl_3.5_upgrade</a></p>
</div>
<div>
<p class=3D"MsoNormal">(above my -nut branch to decrease the probability of=
 an unrelated AB-INT failure)</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;ve started the build : <a href=3D"https://auto=
builder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118" target=3D"_bl=
ank">
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118</a=
></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">Hello,</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">As discussed=C2=A0during the tech call of last tuesd=
ay, I&#39;ve started builds:</p>
</div>
<div>
<p class=3D"MsoNormal">* a new a-full with rebased branch on the latest sca=
rthgap (now, the branch is only scarthgap+this upgrade)</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 *=C2=A0<a href=3D"https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/29/builds/3133/" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3133/</a> failed o=
n a unrelated AB-INT issue (#15945) but is otherwise OK</p>
</div>
<div>
<p class=3D"MsoNormal">* a meta-oe build (which includes a world build for =
meta-oe, meta-python, meta-networking &amp; meta-filesystems):</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 *=C2=A0<a href=3D"https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/81/builds/1277" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1277</a></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 * *Failed on=C2=A0python3-m2crypto* (log.do_c=
ompile =3D&gt;=C2=A0<a href=3D"https://gist.github.com/ycongal-smile/4c6501=
ecd81c9f475b793234cceb7a74" target=3D"_blank">https://gist.github.com/ycong=
al-smile/4c6501ecd81c9f475b793234cceb7a74</a>)</p>
</div>
<div>
<p class=3D"MsoNormal">* to compare, I&#39;ve started the same build with a=
 vanilla scarthgap=C2=A0branch (without the openssl upgrade):</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 *=C2=A0<a href=3D"https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/81/builds/1278" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1278</a> =3D&gt; su=
ccess (albeit with warnings)</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">Can you investigate this python3-m2crypto failure?</=
p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">Also, the &quot;meta-oe&quot; build does not cover e=
very layer in meta-openembedded, I think I will increase coverage to all th=
e meta-openembedded layers for the next run...</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0</p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Topic for discussion is=
 especially what should be the final form of this<br>
upgrade as some users may want to stay on openssl 3.2.x originally<br>
shipped with Yocto 5.0 Scarthgap.<br>
Current form was chosen to easily review recipe/patch differences.<br>
Is it fine to overwrite or do we need to keep both version and make one<br>
the default and other optional? Which would be tested on AB?<br>
<br>
Peter Marko (1):<br>
=C2=A0 openssl: upgrade 3.2.6 -&gt; 3.5.4<br>
<br>
=C2=A0.../openssl/files/<a href=3D"http://environment.d-openssl.sh" target=
=3D"_blank">environment.d-openssl.sh</a>=C2=A0 =C2=A0 |=C2=A0 9 ++-<br>
=C2=A0...ke-history-reporting-when-test-fails.patch | 19 +++--<br>
=C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-<br>
=C2=A0...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 | 32 ++++++++<br>
=C2=A0.../openssl/openssl/CVE-2024-41996.patch=C2=A0 =C2=A0 =C2=A0 | 44 ---=
--------<br>
=C2=A0.../{<a href=3D"http://openssl_3.2.6.bb" target=3D"_blank">openssl_3.=
2.6.bb</a> =3D&gt; <a href=3D"http://openssl_3.5.4.bb" target=3D"_blank">
openssl_3.5.4.bb</a>}=C2=A0 =C2=A0 | 76 +++++++++++++------<br>
=C2=A07 files changed, 116 insertions(+), 94 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-ext=
end-check_cwm-test-timeout.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024=
-41996.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.2.6.bb" target=3D"_blank">openssl_3.2.6.bb</a> =3D&gt;
<a href=3D"http://openssl_3.5.4.bb" target=3D"_blank">openssl_3.5.4.bb</a>}=
 (75%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229884): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229884" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/229884</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117416674/431=
6185" target=3D"_blank">
https://lists.openembedded.org/mt/117416674/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
</p>
</div>
<p class=3D"MsoNormal"><br>
<span class=3D"m_1347808835790301069gmailsignatureprefix">-- </span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Yoann Congal</sp=
an></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Smile ECS</span>=
</p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
</p>
</div>
<p class=3D"MsoNormal"><br>
<span class=3D"m_1347808835790301069gmailsignatureprefix">-- </span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Yoann Congal</sp=
an></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Smile ECS</span>=
</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a867bd0649d91f3d--

