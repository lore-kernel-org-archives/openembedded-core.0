Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85405CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:48:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.5350.1761029314612457004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=dPAIyxJu;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.180, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b63148d25c3so3254834a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1761029314; x=1761634114; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cvqaVoQF1ZUFci9r95yWAvneKHeajbpGEOXKYJm5orw=;
        b=dPAIyxJuh36gPn7y6oJH1BpXWFG/n8czB6B50CXXbtsl4LL/jjq28ALwONPpe3T3kw
         HQokojKfX3yCWlZdPy/+tJTdNret78Oj8hI7vrFzMOgw5gawHkVlEF+MsxFhpURm2Qk6
         IiUXRZDyI0efNGZyC+4uT87/zGt1Eez48crHiIjcZ/iZxfhg0NH6PJdakIpAFIGx6C/A
         2mT1i0usQVBBrnHy163LS4x7vPsm0r4CBtNQGIhseKth9r8HKtfpe2Nu7wlkVgmyqQCd
         DXQfJtzuOxBeGkMVMcqK5ils7TSx4vTO2dgvUv0LSbIS0Wrb4BGwhw+4TRapzT9ClEve
         +bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761029314; x=1761634114;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cvqaVoQF1ZUFci9r95yWAvneKHeajbpGEOXKYJm5orw=;
        b=lAkJ29MChmKZDQe6Cl1fGj02BeOA8dInjUkeuvmHaz8RGRFWfuaowGCjzfeO8cwJKr
         ghL8Dkb70gNeJ4Sp41J4Q+/Qd+KCVzQtZDeX1Z+ehrUHeo3l7NeLkAQlmD/aRRl4AqD7
         DHLy54B0Dp/NdCozdfeljhLQI24MpAW5ux/7PRyotzHrtM+Z/UsDXNlh+PE3eiDMphF6
         fBuqUzo2QOJckaoCjt/OOqRGSb3IXfPYGQBCpTw7fPUs7ZfJHDWzpBt1/IKQgS2NzdSK
         d0yolMcKELF8YybohwB21+Ws0PClATXAg2Xtxld4T2SQJNZ+dgKg3TVTMgZl0FSleHfn
         k4LA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYvgo2uA16NTv2VhUYIICJ/z+KOvX2jw7FQRk9gOuyHIGktSGKJBWx7XmiRFZRtnOGYYJ3VWP4oPXbyWOqcpteQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFFAMD7s9k/TuP5TFqvpPxvMkXZWgXXXcshh9SBeRhRRnm+QWl
	eaCuX4IfnDhRJax7H40AE0v235qmyMzyZPWNQ8NCVFiFQzN4DqoJwzzZyQ6oXWqN/6MZfZiYlrb
	eD/tkoTWSfPPVi5pdWzQUKJNJznTc4BluC/dr7kF4Uw==
X-Gm-Gg: ASbGncvCCCnQAhtmKkUCX3k3Zb9bylyyjtZlNE30uoRHcFxMM2nPke+1nYo8IgIyQah
	A0dWXUG/hWlOmlOSa++4BfJEVgeonNMFFF+cn5/0dMmsfp7Sht9C9DBmgB+j2qU8hsBeHi7rP6k
	OWfZvm2I++N6i78FzDEgmSssoLwID8B+8XbFWXJ20QKzh5+dCxqu0QgZA8RdgkXNu1+W2jBRhuo
	noxwFbFhOf/ZBYi+QGGR++cSwx6BiG0dFoBNttVBengnjXIzipQ4iKdU6AmMpckgVcslW8rFsla
	KxWk
X-Google-Smtp-Source: AGHT+IHYgHU+NSyIkack+OKOos2WKaJuT+Vv9S3Vfvg9ohlz3sfem6Z45spzdHopWQnHKvEuPqI2vOEqPImL5nELuDw=
X-Received: by 2002:a17:903:1a23:b0:271:9b0e:54c7 with SMTP id
 d9443c01a7336-29091af3a9cmr270259095ad.11.1761029314019; Mon, 20 Oct 2025
 23:48:34 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 21 Oct 2025 08:48:07 +0200
X-Gm-Features: AS18NWDQ1ICZC2NQxyj7po85yviO0GwpDt736hA59chTbFoo4i62CGvOZF0eewU
Message-ID: <CAEt6NwpsO3gbHLJWs8mW7T7_4-GZKvxsDAs4m9R+8E8afxDSog@mail.gmail.com>
Subject: =?UTF-8?B?8J+rtSBXZSB3YW50IHlvdSAob24gRmVicnVhcnkgMikg8J+rtQ==?=
To: openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225145

What are you counting the days down to? Christmas? New Years Eve?
FOSDEM? The OE Workshop on February 2nd?

We're counting the days until *YOU* submit your learning, war story,
experience, plans for world domination to your wonderful group of
fellows.

Let us know at https://pretalx.com/openembedded-workshop-2026-2025/cfp

Josef

