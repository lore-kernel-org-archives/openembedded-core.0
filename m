Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2F0C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:22:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14087.1769008936255797513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 07:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I8FMZR4l;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso56739575e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:22:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769008935; cv=none;
        d=google.com; s=arc-20240605;
        b=UKKw1fDk8IAzJ22ah1o33kmL22j5DKKa7WO8QTgP8MaTAZcM1k4wI2TFpEJsMNg4mP
         2mncoWDrKJXzwaScZ9JuyMTmpZp9049Yf0LkH0TsOQNGMR4gRfdX/YIHYJCEDwZGp8aL
         znLKd0ke9uONFirTR4MuvbQrzYXY2t6MrMBrmpK9nUqudRFB50C7Uvu7y1FbJtaPWsQL
         hkMLuydrFr0i8zolIzax78p00Bi3YZXeZC/wDvcBJ1o1UZOgyel3cnmpmjpB9659NtXm
         FItO1kK2hMCUycwuVHHP9smziYcsvHwT+QU8jZJGDdZLBhq89va7GxlcOotOcHG3Fuum
         9kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e0EW32yYVlN3zZoG59mfmzAGUgd2og5/yTZMstR9lQg=;
        fh=RLdWsJKRQpqeXHYV/aOHUX7ma9NQ6JUzPt3Th0AIz+0=;
        b=JEQQ3fbP8hipdgH6n7BF2CVFYDP/yuDfd0bsNFMwlDgsigGXKq5XmVUd0wH5knvYxu
         w6hHK9w1ccNVn4ImNE4w/EOz39/36yqOx9Lvj+ws+grLqeBRLRl8xLy17L6bZry/r9VF
         cbZ76Rymt/PhwjPjbThrs7xsO2ber4jbychMCuFIV4Ijw+kYjspdj3k0Sqim+I6ksGkX
         mHdQBfZxYZl1eg9PlGZHw3Uq+u4NYGhwxeobPHKeia42+6F/Ong9hGCsYu89/7WGwY1e
         +x7kzGlEP33+041biz3WF7+9yZ6G2BHjGWxZNCVpiF48kWyRR73Ft5i40TYhVKWNnEMT
         fWuA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769008935; x=1769613735; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e0EW32yYVlN3zZoG59mfmzAGUgd2og5/yTZMstR9lQg=;
        b=I8FMZR4lYrFVf3eb3CCY6KdJbzKVGS3sdBNkFR9t2WWZSVJRFQV7EW8Xo1rHvs2ocy
         FgPb1CrfGkEQN9RagE3X4aaIWgCe2AY2rhlQujeW0nJWQ3AKDcWqoq8IOpgtIW/3jK8X
         vL12YVzutPBg8+DsynD1SRjDUm1ObvSWtpTyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769008935; x=1769613735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0EW32yYVlN3zZoG59mfmzAGUgd2og5/yTZMstR9lQg=;
        b=CiDPs8HpqClJ3FS455aLM96JhWjXlJgag6zc0fMx3SPL8FIq2506BcdxvrxmD9vLOx
         3Jl5kyEXyFon5QbjtCQhdDwkZz1cfta0WoITCIlAWaDtz7dcQkL+Z+aAWSo+5gUQZ5l7
         /LIV4iTwwiCOlpbOjD/34IGR13yWrjkQYg1SOrjjMuRe75vKV2qSUId0oITX16VRgbVA
         OYmPMhLWBw2Ez9Yucwdy5GzIU/Gy2ly3KlyFc8yeNyvwSS4lmXcoRa4HwWR/AttDqJW3
         UCaOtfjt0dJVUPf4snFCFsevKgNQoTUS5rmQ2OnG4wzoT1D2VAdv+yLSRSh8nZ+dYZOr
         vxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeMoIoXE5gkHIaVW20S22D9fM/AFfYk244l4y6c5O+A4B7nx1HNyvpwwOMxZfWbIQSfJgpXnVi+7W9gzEiekUemw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzI19I5mZ3l2Ojd6jXYpai922/l5wEijRDTtOyr7RA1ERVQmQvo
	ZWN3Xz43dD7MVu9UUI5AeA3OCKLV0ODOWAKnfajl2CwOfO61tlDBvbjOvTtNL1pKDLNSGmEe1KZ
	/HC4dsMHmQ+nTCJ+NABXl8/53HDKmaxYaS4epx0PWuUUuWohGx7V2Nls=
X-Gm-Gg: AZuq6aKxo2+nKQhzf5ZbcvM0CnbBMrTVf6WP0OH3DjVqDzLH8mXVtLoXGHoiY+FWu13
	nZXsGiYzGwnv32S7e8IZMjv7r05OVDGUELSn4p1RppaLUo3b6j+bcrH7sCkDn1TzTsivSvBzq1x
	b04gnJis3KCpLFKYI2CvcwFIDo+Rf4xKB3fK98g/3kfyMPYG2IMfRBRn5GIanBoTg2lTCNm3CkF
	jkx/9ayCPsJB9icrzrxUb9ilKHMiPRFauxuO4wRQqlnGUdCAQVltIhTiXie0eDe/J5nl8j34w==
X-Received: by 2002:a05:6000:2c03:b0:431:3a5:d9c1 with SMTP id
 ffacd0b85a97d-4358ff5692cmr8527306f8f.30.1769008934398; Wed, 21 Jan 2026
 07:22:14 -0800 (PST)
MIME-Version: 1.0
References: <0101019bb476ef27-8b7fdc51-0e56-4f57-96dd-07d91ed02b9a-000000@us-west-2.amazonses.com>
 <188A35157A84AFC6.2436516@lists.yoctoproject.org> <SN7PR11MB7018229D5EA9755643B9A9B2F496A@SN7PR11MB7018.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB7018229D5EA9755643B9A9B2F496A@SN7PR11MB7018.namprd11.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 21 Jan 2026 16:21:48 +0100
X-Gm-Features: AZwV_Qhe7rtbA12_QnULQFfUIha1-fK-5gnQueZdn0zcn_uLb42v_uLjqgoTxf8
Message-ID: <CAMSfU+5peo127s=iAC5HHS9XTw3kW9wo8wxGcETL762dD6W=Dw@mail.gmail.com>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.1.rc2)
To: qa-build-notification@lists.yoctoproject.org
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="00000000000023c0ab0648e77da6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 15:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229816

--00000000000023c0ab0648e77da6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 janv. 2026 =C3=A0 12:56, Ghosh, Debal via lists.yoctoproject.org
<debal.ghosh=3Dintel.com@lists.yoctoproject.org> a =C3=A9crit :

> Hi All,
>
> QA for Yocto-5.3.1.rc2 is completed. This is the full report for this
> release:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults
>
> =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> No high milestone defects.
> No new issue found.
>
>
> Thanks,
> Debal Ghosh
>
> ------------------------------
> *From:* qa-build-notification@lists.yoctoproject.org <
> qa-build-notification@lists.yoctoproject.org> on behalf of Ghosh, Debal
> via lists.yoctoproject.org <debal.ghosh=3Dintel.com@lists.yoctoproject.or=
g>
> *Sent:* Tuesday, January 13, 2026 11:32 AM
> *To:* qa-build-notification@lists.yoctoproject.org <
> qa-build-notification@lists.yoctoproject.org>; Yocto-mailing-list <
> yocto@lists.yoctoproject.org>; openembedded-core <
> openembedded-core@lists.openembedded.org>; Pokybuild User <
> pokybuild@yoctoproject.org>
> *Subject:* Re: [qa-build-notification] QA notification for completed
> autobuilder build (yocto-5.3.1.rc2)
>
> Hi all,
>
> Intel and WR YP QA is planning for QA execution for YP build
> Yocto-5.3.1.rc2. We are planning to execute the following tests for this
> cycle:
>
>
> OEQA-manual tests for following module:
> OE-Core
> BSP-hw
>
>
> Runtime auto test for following platforms:
>
> MinnowBoard Turbot - 32bit
> Alder Lake-S
> Meteor Lake-P
> Arrow lake
> Bartlett lake-S
> Amston lake
> Twin lake
> Beaglebone
> BeaglePlay
>
>
>
>
> ETA for completion: 21/01/2026.
>
>
> Best regards,
> Debal Ghosh
>
> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <
> qa-build-notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> via lists.yoctoproject.org
> Sent: 13 January 2026 04:38
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3.1.rc2)
>
>
>     A build flagged for QA (yocto-5.3.1.rc2) was completed on the
> autobuilder and is available at:
>
>
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2
>
>
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3041
>
>
Hello,

There was a mistake in the branches used for some of the non-core repos:
for some repos, the master branch was used instead of whinlatter :


>     Build hash information:
>
> bitbake: 663021740bc086bd959a8457ad9ddb6da52a8278
> meta-yocto: 6973ca663aaa9c3ab517ee960ab7985a5bf54c07
> oecore: dd10706cfafb5574b7cf316fca2300d166ef71b0
> yocto-docs: 102a33294e63a5581c413555040f790161fc80ff
>
All of those "Core" repo are OK, the build was on the expected commit from
the whinlatter branch.


> meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10
>
On the "next" branch but that seems expected. (meta-agl does not follow the
same branch pattern)


> meta-arm: 955b1d8e6921d8e03388c5013dfaebbb0cfc5099
>
Problem: this is on master, not whinlatter!


> meta-aws: dde608c015c80442356bd180202f955cc9b61267
>
Problem: this is on master, not whinlatter!


> meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
>
Problem: this is on master, not whinlatter!


> meta-intel: 9182026daca13f7efca0bb6ff1eacb039946c476
>
Problem: this is on master, not whinlatter!


> meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
>
OK: on whinlatter branch

meta-openembedded: a4e768dcfae181dd99e39c4286fa0729ca7f4e47
>
OK: on whinlatter branch


> meta-qcom: dc5f692bff1032c40a19f4ab4cd7eb63afcfaab1
>
OK: on master but meta-qcom does not have a whinlatter branch


> meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
>
Problem: this is on master, not whinlatter!

I am not sure what should happen now :
* Restart the release from scratch with a new a-full -rc build with correct
branches used ?
* Or, if the QA teams do not use the repos that are on the wrong branch,
maybe we can keep the QA results and assemble that with the new -rc a-full
build to make this release ?

Regards,

This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>
>
>
>
>
>
>
>
>
>
>
>
>
> _._,_._,_
> ------------------------------
> Links:
>
> You receive all messages sent to this group.
>
> View/Reply Online (#642)
> <https://lists.yoctoproject.org/g/qa-build-notification/message/642> | Re=
ply
> to Group
> <qa-build-notification@lists.yoctoproject.org?subject=3DRe:%20Re%3A%20%5B=
qa-build-notification%5D%20QA%20notification%20for%20completed%20autobuilde=
r%20build%20%28yocto-5.3.1.rc2%29>
> | Reply to Sender
> <debal.ghosh@intel.com?subject=3DPrivate:%20Re:%20Re%3A%20%5Bqa-build-not=
ification%5D%20QA%20notification%20for%20completed%20autobuilder%20build%20=
%28yocto-5.3.1.rc2%29>
> | Mute This Topic <https://lists.yoctoproject.org/mt/117234373/4316185> |=
 New
> Topic <https://lists.yoctoproject.org/g/qa-build-notification/post>
> Your Subscription
> <https://lists.yoctoproject.org/g/qa-build-notification/editsub/4316185>
> | Contact Group Owner <qa-build-notification+owner@lists.yoctoproject.org=
>
> | Unsubscribe
> <https://lists.yoctoproject.org/g/qa-build-notification/leave/14721440/43=
16185/830777862/xyzzy>
> [yoann.congal@smile.fr]
> _._,_._,_
>
>

--=20
Yoann Congal
Smile ECS

--00000000000023c0ab0648e77da6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 21 janv=
. 2026 =C3=A0=C2=A012:56, Ghosh, Debal via <a href=3D"http://lists.yoctopro=
ject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;debal.ghosh=3D<a=
 href=3D"mailto:intel.com@lists.yoctoproject.org" target=3D"_blank">intel.c=
om@lists.yoctoproject.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div>




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Hi All,</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f">
<span style=3D"font-size:12pt;color:rgb(0,0,0)">QA for </span><span style=
=3D"font-size:11pt;color:rgb(0,0,0)">Yocto-5.3.1.rc2</span><span style=3D"f=
ont-size:12pt;color:rgb(0,0,0)">=C2=A0is completed. This is the full report=
 for this release:=C2=A0</span></div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(12,102,228)">
<a style=3D"color:rgb(12,102,228)" rel=3D"nofollow" id=3D"m_109600423917311=
411m_1940603072220605872OWA7c05aad5-8184-6376-208a-f0c39a63ea1e" href=3D"ht=
tps://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=
=3Dintel-yocto-testresults" target=3D"_blank">https://git.yoctoproject.org/=
cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=3Dintel-yocto-testresults</=
a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects.</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
No new issue found.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"text-align:left;text-indent:0px;margin:10px 0px 0px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
Debal Ghosh</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_109600423917311411m_1940603072220605872divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>From:</b>=C2=A0<a href=3D"mailto:qa-build-notification@lists.yoctoprojec=
t.org" target=3D"_blank">qa-build-notification@lists.yoctoproject.org</a> &=
lt;<a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" target=
=3D"_blank">qa-build-notification@lists.yoctoproject.org</a>&gt; on behalf =
of Ghosh, Debal via <a href=3D"http://lists.yoctoproject.org" target=3D"_bl=
ank">lists.yoctoproject.org</a> &lt;debal.ghosh=3D<a href=3D"mailto:intel.c=
om@lists.yoctoproject.org" target=3D"_blank">intel.com@lists.yoctoproject.o=
rg</a>&gt;<br>
<b>Sent:</b>=C2=A0Tuesday, January 13, 2026 11:32 AM<br>
<b>To:</b>=C2=A0<a href=3D"mailto:qa-build-notification@lists.yoctoproject.=
org" target=3D"_blank">qa-build-notification@lists.yoctoproject.org</a> &lt=
;<a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" target=3D"=
_blank">qa-build-notification@lists.yoctoproject.org</a>&gt;; Yocto-mailing=
-list &lt;<a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank"=
>yocto@lists.yoctoproject.org</a>&gt;; openembedded-core &lt;<a href=3D"mai=
lto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedde=
d-core@lists.openembedded.org</a>&gt;; Pokybuild User &lt;<a href=3D"mailto=
:pokybuild@yoctoproject.org" target=3D"_blank">pokybuild@yoctoproject.org</=
a>&gt;<br>
<b>Subject:</b>=C2=A0Re: [qa-build-notification] QA notification for comple=
ted autobuilder build (yocto-5.3.1.rc2)</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"font-size:11pt">Hi all,<br>
<br>
Intel and WR YP QA is planning for QA execution for YP build Yocto-5.3.1.rc=
2. We are planning to execute the following tests for this cycle:<br>
<br>
<br>
OEQA-manual tests for following module:<br>
OE-Core<br>
BSP-hw<br>
<br>
<br>
Runtime auto test for following platforms:<br>
<br>
MinnowBoard Turbot - 32bit<br>
Alder Lake-S<br>
Meteor Lake-P<br>
Arrow lake<br>
Bartlett lake-S<br>
Amston lake<br>
Twin lake<br>
Beaglebone<br>
BeaglePlay<br>
<br>
<br>
<br>
<br>
ETA for completion: 21/01/2026.<br>
<br>
<br>
Best regards,<br>
Debal Ghosh<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" targe=
t=3D"_blank">qa-build-notification@lists.yoctoproject.org</a> &lt;<a href=
=3D"mailto:qa-build-notification@lists.yoctoproject.org" target=3D"_blank">=
qa-build-notification@lists.yoctoproject.org</a>&gt; On Behalf Of Pokybuild=
 User via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists=
.yoctoproject.org</a><br>
Sent: 13 January 2026 04:38<br>
To: <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank">yocto=
@lists.yoctoproject.org</a><br>
Cc: <a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" target=
=3D"_blank">qa-build-notification@lists.yoctoproject.org</a><br>
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.1.rc2)<br>
<br>
<br>
=C2=A0=C2=A0=C2=A0 A build flagged for QA (yocto-5.3.1.rc2) was completed o=
n the autobuilder and is available at:<br>
<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a id=3D"m_109600423917311411m_1=
940603072220605872OWA3f4aa35c-4f89-3fe3-b227-74d1df5eedf6" href=3D"https://=
valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2" target=3D"_blank">
https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2</a><br>
<br>
<br>
=C2=A0=C2=A0=C2=A0 Build URL: <a id=3D"m_109600423917311411m_19406030722206=
05872OWA9a1eb706-d3d4-eeab-770d-a33dff605f77" href=3D"https://autobuilder.y=
octoproject.org/valkyrie/#/builders/29/builds/3041" target=3D"_blank">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3041</a>=
<br>
<br></div></div></div></blockquote><div><br></div><div>Hello,</div><div><br=
></div><div>There was a mistake in the branches used for some of the non-co=
re repos: for some repos, the master branch was used instead of whinlatter =
:</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div><div dir=3D"ltr"><div style=3D"font-size:11pt">
=C2=A0=C2=A0=C2=A0 Build hash information:<br>
<br>bitbake: 663021740bc086bd959a8457ad9ddb6da52a8278<br>meta-yocto: 6973ca=
663aaa9c3ab517ee960ab7985a5bf54c07<br>
oecore: dd10706cfafb5574b7cf316fca2300d166ef71b0<br>
yocto-docs: 102a33294e63a5581c413555040f790161fc80ff</div></div></div></blo=
ckquote><div>All of those &quot;Core&quot; repo are OK, the build was on th=
e expected commit from the whinlatter branch.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"ltr"><div style=
=3D"font-size:11pt">meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10<br><=
/div></div></div></blockquote><div>On the &quot;next&quot; branch but that =
seems expected. (meta-agl does not follow the same branch pattern)</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div d=
ir=3D"ltr"><div style=3D"font-size:11pt">
meta-arm: 955b1d8e6921d8e03388c5013dfaebbb0cfc5099<br></div></div></div></b=
lockquote><div>Problem: this is on master, not whinlatter!</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"lt=
r"><div style=3D"font-size:11pt">
meta-aws: dde608c015c80442356bd180202f955cc9b61267<br></div></div></div></b=
lockquote><div>Problem: this is on master, not whinlatter!</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"lt=
r"><div style=3D"font-size:11pt">
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871<br></div></div></div><=
/blockquote><div>Problem: this is on master, not whinlatter!</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D=
"ltr"><div style=3D"font-size:11pt">
meta-intel: 9182026daca13f7efca0bb6ff1eacb039946c476<br></div></div></div><=
/blockquote><div>Problem: this is on master, not whinlatter!</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D=
"ltr"><div style=3D"font-size:11pt">
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10<br></div></div></div><=
/blockquote><div>OK: on whinlatter branch</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div><div dir=3D"ltr"><div style=3D"fo=
nt-size:11pt">
meta-openembedded: a4e768dcfae181dd99e39c4286fa0729ca7f4e47<br>
</div></div></div></blockquote><div>OK: on whinlatter branch</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D=
"ltr"><div style=3D"font-size:11pt">meta-qcom: dc5f692bff1032c40a19f4ab4cd7=
eb63afcfaab1<br>
</div></div></div></blockquote><div>OK: on master but meta-qcom does not ha=
ve a whinlatter branch</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div><div dir=3D"ltr"><div style=3D"font-size:11pt">met=
a-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff<br></div></div><=
/div></blockquote><div><div>Problem: this is on master, not whinlatter!</di=
v></div><div><br></div><div>I am not sure what should happen now :</div><di=
v>* Restart the release from scratch with a new a-full -rc build with corre=
ct branches used ?</div><div>* Or, if the QA teams do not use the repos tha=
t are on the wrong branch, maybe we can keep the QA results and assemble=C2=
=A0that with the new -rc a-full build to make this release ?=C2=A0</div><di=
v><br></div><div>Regards,<br><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><div dir=3D"ltr"><div style=3D"font-size:11pt">
This is an automated message from the Yocto Project Autobuilder<br>
Git: git://<a href=3D"http://git.yoctoproject.org/yocto-autobuilder2" targe=
t=3D"_blank">git.yoctoproject.org/yocto-autobuilder2</a><br>
Email: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a><br>
<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
</div>



<div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div>

<hr>


Links:<p>


 =20
    You receive all messages sent to this group.
 =20
 =20


</p><p>
<a href=3D"https://lists.yoctoproject.org/g/qa-build-notification/message/6=
42" target=3D"_blank">View/Reply Online (#642)</a> |


  <a href=3D"mailto:qa-build-notification@lists.yoctoproject.org?subject=3D=
Re:%20Re%3A%20%5Bqa-build-notification%5D%20QA%20notification%20for%20compl=
eted%20autobuilder%20build%20%28yocto-5.3.1.rc2%29" target=3D"_blank">Reply=
 to Group</a>
 =20
    | <a href=3D"mailto:debal.ghosh@intel.com?subject=3DPrivate:%20Re:%20Re=
%3A%20%5Bqa-build-notification%5D%20QA%20notification%20for%20completed%20a=
utobuilder%20build%20%28yocto-5.3.1.rc2%29" target=3D"_blank">Reply to Send=
er</a>
 =20

|

  <a href=3D"https://lists.yoctoproject.org/mt/117234373/4316185" target=3D=
"_blank">Mute This Topic</a>


| <a href=3D"https://lists.yoctoproject.org/g/qa-build-notification/post" t=
arget=3D"_blank">New Topic</a>

<br>




<a href=3D"https://lists.yoctoproject.org/g/qa-build-notification/editsub/4=
316185" target=3D"_blank">Your Subscription</a> |
<a href=3D"mailto:qa-build-notification+owner@lists.yoctoproject.org" targe=
t=3D"_blank">Contact Group Owner</a> |

<a href=3D"https://lists.yoctoproject.org/g/qa-build-notification/leave/147=
21440/4316185/830777862/xyzzy" target=3D"_blank">Unsubscribe</a>

 [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@s=
mile.fr</a>]<br>
</p><div width=3D"1" style=3D"color:white;clear:both">_._,_._,_</div>

<p></p><p></p></div></blockquote></div><div><br clear=3D"all"></div><br><sp=
an class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Co=
ngal</font><div><font face=3D"Raleway, regular">Smile ECS</font></div></div=
></div></div>
</div>

--00000000000023c0ab0648e77da6--

