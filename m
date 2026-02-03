Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BE0E8784C
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:57:06 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21683.1770137821723378451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 08:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hokEyeg8;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso8086127a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 08:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770137820; cv=none;
        d=google.com; s=arc-20240605;
        b=Vy3DYMM09TyU0iRGAV6LimCJjlzVsKUI9CKXmn3AUPh8B0tuD2yFQt1WeAmCvy7s1u
         +c1lLVEswLpBXRST8VL/vWC/xmPF6yQanUtDGvCEj/Clh9BEGKRJmT4qTa2X4tNyaHts
         uHoSh1JLXQg+JI2QtsRMeiWVKBuaAr6A56lrqBZjLmcHPcWWVUqoClqUtSCNjs0Keu1f
         ayjh6bhNpcRZejOotDqqa0kEosecVc0NWzzazOjfJFJt0E52uEBpB9tXjn8aLkyVNz5U
         dLwKW7PvpvKEfQO9Q+JQ0Uz0JrabPg88aM/MwROFysFhRg9mMH/QCUQALneqKLksQMQh
         Xd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1tynsBKV7XiDP622nNZ/OBQnULwTN/BaxjeJqWklix4=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=g24dI7vnnM3hpIykKoQMFLl/QlYtnuI/nKp/0Dx4d50qNiJ30RNpQEaOnV0L+EHc8k
         sQ4WbZWVqfZ7W11rimvd2/joxJG8nr1vWYEyu83zhDr4tMaiuReCLyJcx+PvDxYVXhpe
         kWZPXpDLLNUAMjfXrT5yxs4pDC2ErmbaSU6NSCmtZAPSBpVCcgWcTlqKkj9XuiCg+ZIV
         2cPiuk8mxPOcvqqUjK5zkMSqo9klHupMWAiLNcbWTIDOEmtQkDUduNsC2sHJsc4A/E2e
         Cv/yl9FdKTvbv+W9/MpxeLAQzIK+xj2ngvphgngb6kbU0h3kA0HMIw7f7CiMZXwaAOOy
         Y1xA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137820; x=1770742620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1tynsBKV7XiDP622nNZ/OBQnULwTN/BaxjeJqWklix4=;
        b=hokEyeg85yti84bKA5dkO9P5O3sbd6ziNKpqQg3fpd3yyJkY5KMEnGdo4/8E6Q7Krj
         sQvv7Y1k59mMXALdcdg+huTZk8HX+9loERvgyoSZu1c+ZpKo7gDfzZowtm+0tsGLzKfk
         3vja06Dr/0fU4Eg88WQTHOlCk5Vv0aogtj1v2B3MRXwUtpqN2k8+NnRYsa9tG30R4aDq
         Tg7I69EUvAB/uVmiUjSYrsSL7j5+pza6PfsHU1VPJynDPaItNabqxrwthK1MGNsn75Gs
         wtwNCS6w9uqLWpJJzkhvjeKaiizS/oiS3UBpv7Rc19wyw1pOerMIDJHz+mhLGh47lHkE
         G28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137820; x=1770742620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tynsBKV7XiDP622nNZ/OBQnULwTN/BaxjeJqWklix4=;
        b=pte+FbVUpt0aQBMYBa5DK2N7iMvFPutdKhvNDLD+qfQd2nOzstUQ4gdt0QA/VyeADd
         mkeICNxhmWfdu8tf3fXcdIOUCl31s6lc7XFYM0bnQJ+3aGL57uz3KyhXp4p7m6+8/aHT
         qTNox//DdIp6jws7cqdxjq673JRJ02jNfjzSpNprO2s+SedQwLh7V9LtUu+v2vbL0Vpz
         HwPOK8cHCD+HgC6VFQIn6HH91P33VDnx2HE7pBXDvFwrxtpvVL7raj3HfQRS7jwJ4BWq
         Lu0eSwJmXViUpKEV/VpQIWmD7iG+2DIwYBul8r14cFNYrWZfzuW/r+Uy9/YuFrP1/Ejr
         R8bw==
X-Gm-Message-State: AOJu0YwuQ4QYfN3dXf4zCQ980OoEGcf2+biXaWHzfsqRqga3JgyzL3d9
	65fELqlhe05xuvawyVMMrLU5I+42ahDoPWhjAL6HfNZhL7lUeH0HS30aRWjrKZ4y+7hONnVpVzV
	Pe7iRXIQiW1ses8h4uEZr88wV5mhk0Zc=
X-Gm-Gg: AZuq6aKlH0ThDqJrAIKlqEgdmoy3pX4gzDbHIHDWobw7PS0JhLznd6y5GW6ZcVS4sl/
	0COv8DeBD1jHc0uJLG3Qkw1B0NGkVmg7r+cq+4MQwtqmdM2K1L2ZDWRxWshj++t2ZXhAeqB/K2A
	qrxrzV9TV08/SdfbST1gyQ1GWbfsfk2RVk+f4BlktMhXiyx5QXNkBrXoC8Rz4Z8dhy+adpnAh6N
	S4v9tqwJ/ZImEQ/EwrlT8hE7EqM2aGgWom/F3ZSI4Q1vapUsXZqsgMp3hB72ejidRXXpA==
X-Received: by 2002:a17:907:3fa4:b0:b88:73ea:a1d5 with SMTP id
 a640c23a62f3a-b8e9f4363e3mr9051466b.51.1770137819645; Tue, 03 Feb 2026
 08:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20260203143434.3117764-1-samuli.piippo@qt.io> <CANNYZj_WD666FjyPdrrrWCGqsSb+cgLen+y2K8rD-Vhx-UcpYg@mail.gmail.com>
In-Reply-To: <CANNYZj_WD666FjyPdrrrWCGqsSb+cgLen+y2K8rD-Vhx-UcpYg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 3 Feb 2026 18:56:48 +0200
X-Gm-Features: AZwV_Qhw7AXGR-8XYvgdEkgBccTk-lCVcLE86biJVsLeD0UQBM_Gtp_g7NrmzBo
Message-ID: <CABXoSoVRGebfQDmN8Sc2X7v93gbxkZ7dY5u8tXLdPGfFs-MBYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe/utils: filter license packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1893f0649ee530f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 16:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230464

--000000000000f1893f0649ee530f
Content-Type: text/plain; charset="UTF-8"

The function is used at least in PACKAGESPLITFUNCS to filter out all the
system packages
and then settings rdepends/recommends/etc for the remaining dynamic
packages.
Without this commit, the *-lic license package gets pulled in
unintentionally.

-samuli

On Tue, 3 Feb 2026 at 18:25, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 3 Feb 2026 at 15:34, Samuli Piippo via lists.openembedded.org
> <samuli.piippo=gmail.com@lists.openembedded.org> wrote:
> > Make packages_filter_out_system() filter out also the
> > license (-lic) packages.
>
> Why? What does the function do, and where is it used?
>
> Yes, it's possible to spend time, read the code, and find the answers,
> but you would really help the review by writing those things into the
> commit message.
>
> Alex
>

--000000000000f1893f0649ee530f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The function is used at least in=C2=A0PACKAGESPLITFUN=
CS to filter out all the system packages=C2=A0</div><div>and then settings =
rdepends/recommends/etc for the remaining dynamic packages.</div><div>Witho=
ut this commit, the *-lic license package gets pulled in unintentionally.</=
div><div><br></div><div>-samuli</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Feb 20=
26 at 18:25, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, 3 Feb 2026 at 15:34, Samuli Piippo via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a><br>
&lt;samuli.piippo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; Make packages_filter_out_system() filter out also the<br>
&gt; license (-lic) packages.<br>
<br>
Why? What does the function do, and where is it used?<br>
<br>
Yes, it&#39;s possible to spend time, read the code, and find the answers,<=
br>
but you would really help the review by writing those things into the<br>
commit message.<br>
<br>
Alex<br>
</blockquote></div>

--000000000000f1893f0649ee530f--

