Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EC5C3ABC6
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 05:08:11 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.7445.1746767288375782900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 22:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyDssQwb;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-606477d77easo1136743eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 22:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746767287; x=1747372087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kM0x/kwL/NEPR/36AhukrIhQog+Z2Km8uj6APx+ovA=;
        b=DyDssQwbTqtl15CXEHxuV2I7GKSVPA4KW2C5grMGirWzwGFLZrOYZfW2GW7LMmZM27
         orUeoWK36LFmqQs7VjR/7ir3p5jRdm1ROqVmIMzjRfX4+6ma0D7t4wAZdYyUz4OHCbYu
         EAbRpTItC+oCiTLVvhjRCxziUy7bpk5kU3WDLtPiIhEDSsR9nfY/HGKWVwAe/IaY6YOF
         bxMUwZsmn6ZsPDTjJcDBq8JnnFJNHqMuptR8YNSGcuaG3Ra9X6x4a/51pppoSX3E13pp
         s93KuMMvoY39VylVAFkyq0jHcHjBeeTut2n/o9EIMFHEAybn5q7TmEPtPHMJc4iiumoF
         Jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767287; x=1747372087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kM0x/kwL/NEPR/36AhukrIhQog+Z2Km8uj6APx+ovA=;
        b=dFCzjCS7OKq7GCBd7hJgMfcZgZxrLvZVzL2TaHxHyDWdTdfOmsnRrrOuGaSCGO62rK
         CS9Xtk6UJ7IdsFmq+aAflvYfD468PCJI/vImBIPOO0T4DCtD0WtXENjC+1ET94Sy/HgJ
         YvYdxjz2vmaUS/LiFbkrEd96Q96Owb9pIiRDdULU2yx6TuQ8vfP+FMYEOCx77bOALyF3
         3varfF/RkkbGR4vYTw2q9vLcfJGpfvrVZf88gu+AFrXNQMARsco1J0rbECV6JI5/Qi1J
         Zja+qCK36U9B836tgBoVnspUOaOfqMwl1JqYxgSo5JfxU3M2U9nxq3c1W5tqwjbUb9C8
         wznw==
X-Gm-Message-State: AOJu0Yw8c4eDOt8tNswzspCXElZtgsAMvtfebAtLSrmGnhWX3zNGjq1V
	ONqGw8Itj1V8PnZguqGh4usF3OwbQzq6GVmrbmOENSQgD6+zQGVLuyEyfmStKYaIppUZwS9ptB8
	WN/ihU5cyyfWpaqIBcrgU/bnKZp8=
X-Gm-Gg: ASbGncvcBbp4GLjcw0ZDx1rzMEU9w/1xXPHp2fMkQH26W/Ybfrs/KRmSOpwikW1JRyN
	RzmQQHdYwP/aVrxSlt4cs5iadtJ0P0eKoaoh8q0pxr/vrGC7uHizxj9yBpd82B8IiK8eeSWw2Io
	0DObsOlK43fv50jDBC0enJR8bAQP8AswkdsxKOrcyEdjEzkQmtw2pMP612V8dWlvS3AVg=
X-Google-Smtp-Source: AGHT+IGmIrYgMSNkDmBcsMekoXoFP/cHaxNwQkB13qO2rBBJMPzcm+wVFvgAHBPMdPTSw58BJdUCy80rgnOHBBghJD8=
X-Received: by 2002:a4a:d34d:0:b0:603:f521:ff26 with SMTP id
 006d021491bc7-6083339b557mr3812660eaf.1.1746767287396; Thu, 08 May 2025
 22:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250509043002.356672-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250509043002.356672-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 May 2025 22:07:56 -0700
X-Gm-Features: ATxdqUEvkdnVO0lUd0SxplXKzin0DfoZ00z9FYiA7kw1xzNrMaZ5_bKmVk1h-i0
Message-ID: <CAMKF1srCVwBVgj3eRizNKhBFiXh9r-EoW89HezipMXBPjwfFkQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000abaf660634acf3af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 05:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216184

--000000000000abaf660634acf3af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lgtm

On Thu, May 8, 2025 at 9:30=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> d2febe7c40 math: Improve layout of exp/exp10 data
> 20b5d5ce26 AArch64: Use prefer_sve_ifuncs for SVE memset
> 9569a67a58 AArch64: Add SVE memset
> 59f67e1b82 math: Improve layout of expf data
> 904c58e47b AArch64: Remove zva_128 from memset
> 8042d17638 AArch64: Optimize memset
> be451d6053 AArch64: Improve generic strlen
> 8b3d09dc0d assert: Add test for CVE-2025-0395
> 29d9b1e59e assert: Reformat Makefile.
>
> Testresults:
> Before update   |After update    |Difference
> PASS:  4832     |PASS:4833       |PASS:  +1
> FAIL:  132      |FAIL:132        |FAIL:  0
> XPASS: 6        |XPASS:6         |XPASS: 0
> XFAIL: 16       |XFAIL:16        |XFAIL: 0
> UNSUPPORTED: 200|UNSUPPORTED:200 |UNSUPPORTED: 0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index d98b6a4911..34b199c02b 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.35/master"
>  PV =3D "2.35"
> -SRCREV_glibc ?=3D "549d8315791aa8176ff1537db3e09c185c6e602f"
> +SRCREV_glibc ?=3D "d2febe7c407665c18cfea1930c65f41899ab3aa3"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216183):
> https://lists.openembedded.org/g/openembedded-core/message/216183
> Mute This Topic: https://lists.openembedded.org/mt/112893496/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000abaf660634acf3af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm</div><div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 8, 2025 at 9:3=
0=E2=80=AFPM Varatharajan, Deepesh via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mail=
to:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)">From: Deepesh Varatharajan &lt;=
<a href=3D"mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank">Dee=
pesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
d2febe7c40 math: Improve layout of exp/exp10 data<br>
20b5d5ce26 AArch64: Use prefer_sve_ifuncs for SVE memset<br>
9569a67a58 AArch64: Add SVE memset<br>
59f67e1b82 math: Improve layout of expf data<br>
904c58e47b AArch64: Remove zva_128 from memset<br>
8042d17638 AArch64: Optimize memset<br>
be451d6053 AArch64: Improve generic strlen<br>
8b3d09dc0d assert: Add test for CVE-2025-0395<br>
29d9b1e59e assert: Reformat Makefile.<br>
<br>
Testresults:<br>
Before update=C2=A0 =C2=A0|After update=C2=A0 =C2=A0 |Difference<br>
PASS:=C2=A0 4832=C2=A0 =C2=A0 =C2=A0|PASS:4833=C2=A0 =C2=A0 =C2=A0 =C2=A0|P=
ASS:=C2=A0 +1<br>
FAIL:=C2=A0 132=C2=A0 =C2=A0 =C2=A0 |FAIL:132=C2=A0 =C2=A0 =C2=A0 =C2=A0 |F=
AIL:=C2=A0 0<br>
XPASS: 6=C2=A0 =C2=A0 =C2=A0 =C2=A0 |XPASS:6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|XPASS: 0<br>
XFAIL: 16=C2=A0 =C2=A0 =C2=A0 =C2=A0|XFAIL:16=C2=A0 =C2=A0 =C2=A0 =C2=A0 |X=
FAIL: 0<br>
UNSUPPORTED: 200|UNSUPPORTED:200 |UNSUPPORTED: 0<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index d98b6a4911..34b199c02b 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.35/master&quot;<br>
=C2=A0PV =3D &quot;2.35&quot;<br>
-SRCREV_glibc ?=3D &quot;549d8315791aa8176ff1537db3e09c185c6e602f&quot;<br>
+SRCREV_glibc ?=3D &quot;d2febe7c407665c18cfea1930c65f41899ab3aa3&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;794da69788cbf9bf57b59a852f9f11307663fa87&=
quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.git=
</a>&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216183): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216183" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216183</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112893496/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112893496/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000abaf660634acf3af--

