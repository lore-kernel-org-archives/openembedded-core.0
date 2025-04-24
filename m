Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B9BC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:51:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.17173.1745506288662867362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MfOjetVg;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1082368f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745506287; x=1746111087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tkZsCw088/n1efWmS8WHa3ckE5xIWnyVID+xXRsixbE=;
        b=MfOjetVg3nUhxf/2PEF07QxcX4YV3r1eUTK1sjleBcigVHEvMH/gbZ6BNpSxY60mM8
         2mp+vbpEDEvH7h5f3Iirqs+Dq3dWa0n0C3ia9DmmGk9sDW2v8Pk455zk2LpipGtd5LUB
         rzbhZa2/Dw1NmppCJCuRfNIAEPlnNzRTAugXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506287; x=1746111087;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkZsCw088/n1efWmS8WHa3ckE5xIWnyVID+xXRsixbE=;
        b=lrRIZV/fQrC41FBqjOKYjZLt07o8H5i/vLZvZrtNKb/5i6NrIloAKffWkxjOjvoH3k
         lTIHTKrs1o7vavBR2Po5r7CVC6wX4SuIUVdvThxNMqf3sckOJmtLyOpgezq0VZOtAMPp
         W3jk/OAd+x3M2eOxX9M+MWWPpz1it4bKWlf3r0VR/ZhsITFZQH+foirlcpHxlrPx8YhM
         mDb3Xr1zClP7TlaXCvH94Zmww44Etmc+Y/LdrjpVebmTfFoRXMDPVNdxS2TezFDWcJgJ
         tJWrq2/sJ4N7WvpTcyau5coqEAUYILc9AAojiTGW9X+e1rxQkAbJj9cL1s9PBxPhrcQl
         xdKQ==
X-Gm-Message-State: AOJu0YzaC0W7Glp3tdPaPA97Rw/Q9Q5Kk3SgkFViRhJMPeO/OLpQYCG7
	DAvZD9FrihCJ/ub/6ok2OxYTFkJAuulz2dOTPp5eCIbK/6NaYfCgdDVxJEiU99yOT/jpYy8qfTn
	SakNHmfzpNKzjZx/8LzK1KkHlduLSTmip0TbKwA==
X-Gm-Gg: ASbGncvW/TJ481NDzmx6DbACP9Wp9C8LxtZhb2BA+ZUVIgldtPJNW+W8E9v4V423GsH
	JZL7p6rylJBnr2qc7tjHLdukJyqKr1odi10cnub6c+3x449Frjrf8Q/eyD+b1LC6Q7vmv8iYtMh
	k1RpQzjI+WTr7ez6I1y8HOSliiei5hlqVTxFTW5FgrOgUExqlkaY8ex3asyzTLLfTVA34=
X-Google-Smtp-Source: AGHT+IGTp51Qa5Eq/a+GiuTrDU4pB2nArPaIlCu2cKsNtaPEVuUVVu0Q7CeAZIF34KwA1/JjCsQIIlJk+1XkpihsD54=
X-Received: by 2002:a05:6000:228a:b0:39f:6d3b:f136 with SMTP id
 ffacd0b85a97d-3a06cfa5a86mr2321485f8f.41.1745506286587; Thu, 24 Apr 2025
 07:51:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:66c6:0:b0:390:d73f:69ef with HTTP; Thu, 24 Apr 2025
 07:51:25 -0700 (PDT)
In-Reply-To: <20250424122815.884740-1-ines.kchelfi@smile.fr>
References: <20250424122815.884740-1-ines.kchelfi@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 24 Apr 2025 16:51:25 +0200
X-Gm-Features: ATxdqUGP2prwkbL78AeRtSDQ6Ue-iu622V_ODybZK-M5Fh9f5KfJvyGX8OBIIfs
Message-ID: <CAMSfU+4dQS7uwGoX0bHdOUEWxai55ctQTCpfL=KmSStHPyGXwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] CI: Remove useless "upstream" check
To: "ines.kchelfi@smile.fr" <ines.kchelfi@smile.fr>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a6a560633875af2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215383

--0000000000002a6a560633875af2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 avril 2025, <ines.kchelfi@smile.fr> a =C3=A9crit :
> From: Yoann CONGAL <yoann.congal@smile.fr>
>
> ---
>  repos_list.sh | 6 ------
>  1 file changed, 6 deletions(-)


This is for an internal repo and should not have been sent.
Please ignore.

>
> diff --git a/repos_list.sh b/repos_list.sh
> index 03c1f49..0f6eb78 100644
> --- a/repos_list.sh
> +++ b/repos_list.sh
> @@ -130,12 +130,6 @@ update_layers_to_mr(){
>                         if [ "${mr_project}" =3D=3D
"${repos_smile_git_sub_project[${layer_i}]}" ] ; then
>                                 local_layer_path=3D"$(get_layer_path
"${layer_i}" "${cooker_menu}")"
>                                 switch_to_mr_ref "${local_layer_path}"
"${mr_ref}"
> -                               ## control MR_REF is upstream to MR targe=
t
> -                               is_mr_base_parent=3D"$(git -C
"${git_local_path}" merge-base --is-ancestor origin/"${MR_TARGET_BRANCH}"
"${MR_COMMIT_SHA}" ; echo $?)"
> -                               if [ "${is_mr_base_parent}" !=3D 0 ] ; th=
en
> -                                       printf "MR is not properly
upstream\n"
> -                                       exit 2
> -                               fi
>                         fi
>                 fi
>         done
> --
> 2.43.0
>
>

--=20
Yoann Congal
Smile ECS

--0000000000002a6a560633875af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 avril 2025, &lt;<a href=3D"mailto:ines.kchelfi@smile.fr">ines.k=
chelfi@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br>&gt; From: Yoann CONGAL &lt;=
<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;<br>&=
gt;<br>&gt; ---<br>&gt; =C2=A0repos_list.sh | 6 ------<br>&gt; =C2=A01 file=
 changed, 6 deletions(-)<br><br><br>This is for an internal repo and should=
 not have been sent.<br>Please ignore.<br><br>&gt;<br>&gt; diff --git a/rep=
os_list.sh b/repos_list.sh<br>&gt; index 03c1f49..0f6eb78 100644<br>&gt; --=
- a/repos_list.sh<br>&gt; +++ b/repos_list.sh<br>&gt; @@ -130,12 +130,6 @@ =
update_layers_to_mr(){<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${mr_project}&quot; =
=3D=3D &quot;${repos_smile_git_sub_project[${layer_i}]}&quot; ] ; then<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_layer_path=3D&quot;$(get_la=
yer_path &quot;${layer_i}&quot; &quot;${cooker_menu}&quot;)&quot;<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch_to_mr_ref &quot;${local_layer=
_path}&quot; &quot;${mr_ref}&quot;<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0## control MR_REF is upstream to MR target<br>&gt; -=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0is_mr_base_parent=3D&quot;$(git -C &quot;${git_local_pa=
th}&quot; merge-base --is-ancestor origin/&quot;${MR_TARGET_BRANCH}&quot; &=
quot;${MR_COMMIT_SHA}&quot; ; echo $?)&quot;<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ &quot;${is_mr_base_parent}&quot; !=3D 0 ] ; then<br>&=
gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf=
 &quot;MR is not properly upstream\n&quot;<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 2<br>&gt; -=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fi<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 done<br>&gt; --<br>&gt; 2.43.0<br>&gt;<br>&gt;<br><br>-- <br><div dir=
=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=
=3D"Raleway, regular">Smile ECS</font></div></div><br>

--0000000000002a6a560633875af2--

