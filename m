Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51ADC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 16:51:35 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.27947.1740156694350326628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 08:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QlpEOhMB;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5dd7b439e3so2065946276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 08:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740156693; x=1740761493; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXgMsmnRqETWa11b410qTkCDjpgbSG57k/GBrInbx8I=;
        b=QlpEOhMBisKCKasoHSZii8+h7u79LP0OQgmA6pOZu0KNFOEzZvDQBh5g+c/rzdh0il
         FZmKcUQ4A50kwloczcITplbwdUN4jdseMuuZpHWtuG8Tokwd4pGUs34RYZcEO2fxh/3y
         Wkfvyf/loY9HPtSC8iJTdQMTCFXZGOugUErzZK7MPVE0io0U/Gk5NYD+wROEuXTQKBTL
         Nl/bSMJqQu/Tra+SMjlMVcjuadXhrxoSYsyKuD9HiD1h7IcFP2GSOWbgh8j1Gz0zsEBM
         doi7lQcP77yyNtO9ij9V6l32CqnwPwFOKZpJ2NGK9XuPzF/sSqe31bdeDtTvQOjgJBrg
         MYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156693; x=1740761493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXgMsmnRqETWa11b410qTkCDjpgbSG57k/GBrInbx8I=;
        b=LPJqM/BKl1JKgd6DCIKp3S+n7BYfEjq918FLjxAVUzQxz5tvXK4KRLfgplG4j4qYNY
         CLLsSXIRcEKo+JdSyVEhDt8V+rsJvIKoaYrdIO4zWlr/EQRnMRiP6YNqj3vtd7KptGUp
         ufnuLN+jPm+KFGtjxUe6ZcnJqplC3klkfary7HD+BYjrv9n5yS4pzqDv95Obn+kt7mJG
         8xTmM7NyHH0jeS26w1eHTKz77J7CZpUvlz483TLp92c9w4XB3N9GBJtBcbQtB+i8X1b4
         X9Aqnr9r2knpRlL4jSlIek3zcZKZhBa69eWBJBtLVbQ5oqoYU1ZRwbXCHE+WqCPp2G/F
         z9vA==
X-Gm-Message-State: AOJu0YxOkUqGLS384zKVypdGEtF74E+zYkyW0nfVIKWrnP9wMURh+Njo
	PDpz5+eW1c2CBfwh//YWPQQGUMUZntyMp1oeFZiZi8UyxFcK4nRGSMKZ0FWw1k3BkTs/PNK5zh7
	I9vnPHVUg1Rgj8XJVKPsrV2AfqoEW/g==
X-Gm-Gg: ASbGncs3kQkcW/5IIDYq5ii9JnNekofkz8nxHmLFUzTsvnTstFFBFPP07reXZD3qx00
	XqFZElW8+Jk1rvxBUecb6EiOsH0pn8zWJeFU9e3ETRrvNGPARoktV8BqH1HPpV7FcqhnaMtolSu
	WJseH0RH62
X-Google-Smtp-Source: AGHT+IGMa7r9ZR1MerB5sPVHV8aYNN+f3mJjWumxhQzSq/0Dee1DGaBk5PNJcHX2hkInqPP7hyIRJV4DQtsqaWsVzBI=
X-Received: by 2002:a05:6902:2104:b0:e5d:c0e9:9a7d with SMTP id
 3f1490d57ef6-e5e8afc784amr2397748276.17.1740156693420; Fri, 21 Feb 2025
 08:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20250221143811.2072024-1-rob.woolley@windriver.com> <CANNYZj-c3Uv51tALMvSy_WPPxHQWikPrW0OOAKsYx7FYhHbEWA@mail.gmail.com>
In-Reply-To: <CANNYZj-c3Uv51tALMvSy_WPPxHQWikPrW0OOAKsYx7FYhHbEWA@mail.gmail.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Fri, 21 Feb 2025 11:51:29 -0500
X-Gm-Features: AWEUYZk3tOhe12k9KJkP_peDnr_7d3jFGB2rveSN6C3rrC1kgCwNB-xFzsGyKl4
Message-ID: <CAGAhMBwaGTkH=_hMzJufR16Rznm0-TwX2WtMrUkOtp2CMHE8yg@mail.gmail.com>
Subject: Re: [oe] [OE-Core][PATCH 0/2] Backport glvnd support to Kirkstone
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000090a34b062ea9cdcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 16:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211811

--00000000000090a34b062ea9cdcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That is fair.  I wasn't sure what the criteria would be.

Regards,
Rob

On Fri, Feb 21, 2025 at 10:36=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> I don't think this patchset is eligible for a LTS backport. It is not a
> bugfix.
>
> Alex
>
>
> On Fri, 21 Feb 2025 at 15:38, Rob Woolley via lists.openembedded.org
> <rob.woolley=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Applications built with CMake use FindOpenGL.cmake to find suitable
> OpenGL
> > libraries. GLVND is reputed to be "the only way to get OpenGL 3+
> functionality
> > via EGL in a manner portable across vendors"
> >
> > The mesa release in Kirkstone already supports glvnd, however it was no=
t
> > exposed through the recipe until later Yocto releases.
> >
> > This backport allows glvnd to be enabled as a PACKAGECONFIG for mesa.
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211808):
> https://lists.openembedded.org/g/openembedded-core/message/211808
> Mute This Topic: https://lists.openembedded.org/mt/111309001/556952
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000090a34b062ea9cdcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">That is fair.=C2=A0 I wasn&#39;t sure wha=
t the criteria would be.<br><br>Regards,</div><div>Rob</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Feb 21, 2025 at 10:36=E2=80=AFAM Alexander Kanavin via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">I don&#39;t think this patchset is eligible for a LTS backport.=
 It is not a bugfix.<br>
<br>
Alex<br>
<br>
<br>
On Fri, 21 Feb 2025 at 15:38, Rob Woolley via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&lt;rob.woolley=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" t=
arget=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Applications built with CMake use FindOpenGL.cmake to find suitable Op=
enGL<br>
&gt; libraries. GLVND is reputed to be &quot;the only way to get OpenGL 3+ =
functionality<br>
&gt; via EGL in a manner portable across vendors&quot;<br>
&gt;<br>
&gt; The mesa release in Kirkstone already supports glvnd, however it was n=
ot<br>
&gt; exposed through the recipe until later Yocto releases.<br>
&gt;<br>
&gt; This backport allows glvnd to be enabled as a PACKAGECONFIG for mesa.<=
br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211808): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211808" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211808</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111309001/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/111309001/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com" t=
arget=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000090a34b062ea9cdcc--

