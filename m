Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C1AE65296
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 15:55:01 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32030.1769961294899892803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 07:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Le95ci9B;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1233bb90317so3656120c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 07:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769961294; cv=none;
        d=google.com; s=arc-20240605;
        b=QKhOJKgQi0ypgz/Pxdf7Nxs5vRGryAd9XbNIG2MBA0LJqYlaU5MOYBnl3wZwPyY0wM
         4arDvLmqS9/nvybWZLtsvpvJ9KKCARVSC8vxtpL1gqoYOayYRKBjT37ZBMwHNPdxWz+6
         HA6odKkaU4npY96CvZrgAXK/rTva7I0vSonySYoP/JGaOnebo/F9S+B9Uhm7AcGnP34K
         XzKHJ3RX8jEWhGRecac+BnwoQRDGNWzWAHBdZC/tZ7cbATDIdKEXVn6+XwA9yWL8yxcc
         KmMXs7G0MuX87PBrltrvlsDB0M9AoSD03cATYhxPJMqqlVdZ1MpkNMawVNYVAGoTjcy0
         n+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SJqCS/pSb9GIReM/6ypVhlb9LPHlt/dz2IDzEQU/hPI=;
        fh=9U4BnAiEa7eItK9LVH7ymtwYlG2X5W224rxbeOh9R0M=;
        b=jpxqsk7lSdnY0HFhDAKc/D4C7hwB1kXlIy2fToIzK8LQhoDTtteletiykzNW16+RKj
         pewXe8vgeGclx++8R5v4NRauRrTOspKiVmoSp8hEinnitp95xpx5ETv9Qs+QnTej8YI2
         CJFVv6pOdW2QOoHDXsz6u14U9dMpSGbb9z9Dt26I9OwgtAir6HGY93PksKtMS1T9g3mo
         buZQtY+xh7a1KdIEsB8CsVOySbBialTjIrJW6igVvfwKnCuyAx7U2fWOC9JTwfAt/z6m
         t5riTCrCo0JvUvfRNvM/aFfNzk1dH7cj5PpwzkRMRH+OCay7vfnse7hv5lVB8Ao8rjtX
         NfJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769961294; x=1770566094; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJqCS/pSb9GIReM/6ypVhlb9LPHlt/dz2IDzEQU/hPI=;
        b=Le95ci9BsfbGLGHv8VcnikHirSuOTsTDn1XxQQQMt38JBev3sOVliUo02Trz4R4/fH
         RUigZqQv2FGW/g45QH+96PMKstYzS3tsVI9l6ccl/I+xDpTJtrHDNnIa4bXhdnzvY+QN
         ywXRsikiR26olR2GXKbEFXLJd2954tyEdTCQRVLfCKCIDpu6CqKWXwqFkkU+sfH6JTLR
         HMFGr88CYtauJ4LYn6sbFGhlWfTnvXJ5J3xmd/avoxdoTGgGv7pTIQEarsJA4G1KOPqY
         Xrghpf/MGrvwSZQ9k631gr9vwLP/y5Bnk49pKAdeug6oKQUIF89pokUJQayDikR5rbQu
         FabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769961294; x=1770566094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJqCS/pSb9GIReM/6ypVhlb9LPHlt/dz2IDzEQU/hPI=;
        b=m6SdITNoQQ7SNq9F938Q7eOdgRynPn+VH0/bBWatZo6MsSB0yTkro9FKQ6j1yxRdhg
         Pwp1HDul1e0f0Fa8+m+dS7bszdazJUIAEaj42bpyxQTyurgyntfOuvCCTbIwxJ9XdGvg
         mUyRtr7r6EjJrC1ksGhjdSIPNdbbq5Y+tlpU6MN5BjbHt1pOfIjoIlGhvZ+A0b0eD/zN
         v/IseY/Bk4yMR8C+ZGHTJiZI53AS5LL/Ouc/UkWLBRWMNHs0mGX5WN12BaLKvtmvszC9
         mfsz8VqBRFGrFIOLaBopqFTM/8q8F4s22f7Dlmf/mLEoM4r8iG9zDsXbP7tUuKe02kqw
         5cUg==
X-Gm-Message-State: AOJu0Yy1AGECW+2QU9lV/G/TlHyhMGCD5XuEiz52SW32VemapP4GCIXK
	onsoQBCSQxgLMDYplIYuV7dEDsQI8Rm7OGNl9E/i2dBLjOoLsm8Fssh9DP/wfvedEFLdqDnQx2c
	5r+qO2NFOxTdLsbVp1OqRj+2XIdUXqzs=
X-Gm-Gg: AZuq6aIuaLIGevamLimOD5j06Lf/FyC6zzGEF+ePHc3i/Fp+K5BRKuDl5kcdAuYMOtW
	Mse2iUDovFsK6VVRx8/9U81Ac2ycmxoA7ifac79k9Wv3CCOj/8Us1VyP9UlHaiJYHoFWLvgbfqD
	oqCOs/XhPOXgJ7975oDSPS7ZfL+ZiT38xrhELA3ZZs/h1HK/F1qeqjvvfQnEfrGT6sF9T3Ub33Z
	DOBR9QiZFc0SE/LNWNjwGUwVvMe5h20xkohpwbF8rGcmT1UzXsG1X3lhppZ4WKnYgWxcVM/0jiA
	0LYaCosW5yCcBKc0/D+MnhdGB8Y=
X-Received: by 2002:a05:7022:128c:b0:123:3673:8459 with SMTP id
 a92af1059eb24-124b106a7e8mr5431159c88.12.1769961294025; Sun, 01 Feb 2026
 07:54:54 -0800 (PST)
MIME-Version: 1.0
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260128163827.386933-1-valentin.boudevin@gmail.com> <PA3PR07MB10721FE43E226CB23A078A1C18A9EA@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <1014278.1769704485995392702@lists.openembedded.org>
In-Reply-To: <1014278.1769704485995392702@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Sun, 1 Feb 2026 16:54:42 +0100
X-Gm-Features: AZwV_Qh8BHagGCcE5KF78ly04TOEtl8PpzamuohkWq3W3VyczNTcR2UH4ewiYyY
Message-ID: <CAApg2=TFaG1kNe0UZJuZbV9Qka7SaRPpXpT0VUzK4z6+pOgL3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/2] improve_kernel_cve_report: Add a bbclass support
To: valentin.boudevin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000325a3e0649c53af2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 15:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230337

--000000000000325a3e0649c53af2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Please take into account that the VEX class is using the same file names
for results as the cve-check. The reason was to avoid duplication
of all intermediary files, and also the final files. This was a design
decision, as not many people are expected to switch between cve-check
and vex classes, instead keep one.

Kind regards,
Marta

On Thu, Jan 29, 2026 at 5:34=E2=80=AFPM vboudevin via lists.openembedded.or=
g
<valentin.boudevin=3Dgmail.com@lists.openembedded.org> wrote:

> Hello Daniel,
>
> I made some tests with the new vex class. I may be wrong, but it doesn't
> seem like an issue linked with improve_kernel_cve_report bbclass.
>
> I tried to clean the build, remove "inherit improve_kernel_cve_report",
> and keep "INHERIT +=3D "vex"" . But, the cve-summary file is still empty
> after the rebuild.
>
> If I change back to "cve-check" (still without improve_kernel_cve_report
> class) cve-summary seems correct and not empty.
>
> It looks more like a vex class issue. Also, VEX does not seem to recreate
> a new .json file at every build, which is strange.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230139):
> https://lists.openembedded.org/g/openembedded-core/message/230139
> Mute This Topic: https://lists.openembedded.org/mt/117510774/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000325a3e0649c53af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div>Please take into ac=
count that the VEX class is using the same file names for results as the cv=
e-check. The reason was to avoid duplication</div><div>of all intermediary =
files, and also the final files. This was a design decision, as not many pe=
ople are expected to switch between cve-check</div><div>and vex classes, in=
stead keep one.</div><div><br></div><div>Kind regards,</div><div>Marta<br><=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Jan 29, 2026 at 5:34=E2=80=AFPM vboudevi=
n via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;valentin.boudevin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>Hello Daniel, <br><br>I made some tes=
ts with the new vex class. I may be wrong, but it doesn&#39;t seem like an =
issue linked with improve_kernel_cve_report bbclass.<br><br>I tried to clea=
n the build, remove &quot;inherit improve_kernel_cve_report&quot;, and keep=
 &quot;INHERIT=C2=A0+=3D &quot;vex&quot;&quot;=C2=A0. But, the cve-summary =
file is still empty after the rebuild. <br><br>If I change back to &quot;cv=
e-check&quot; (still without improve_kernel_cve_report class) cve-summary s=
eems correct and not empty.<br><br>
<div>It looks more like a vex class issue. Also, VEX does not seem to recre=
ate a new .json file at every build, which is strange.</div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230139): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230139" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230139</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117510774/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117510774/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000325a3e0649c53af2--

