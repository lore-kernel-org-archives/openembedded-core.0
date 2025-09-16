Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21695CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:26:47 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.3026.1758040005103690027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iC3aT/uq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-78393b4490cso22904316d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758040004; x=1758644804; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JHO6Io94UGY97XVB+UPtHiZUlIUUn+GngtvzPBnlwdU=;
        b=iC3aT/uq5id3Bw7yOSvMpdpd6KuZ9MArJ8ZRm1UBeKEYt18DYcvFP8sGu8ZYtjo50S
         NIpg+5W2LQPkmhCd88hI9gVuaWboOWBU4xTvZpWe2k4kD4XMLfSEifx3j17z99mftrTk
         C1n/sb4g+TRn7IGqsvd+yGgHD2hHUBwDIYgCPpwVPaLdixMgOo5Cgb9kfREAnPi/ZLWp
         KuuLMq8sP/23zqdngqwvx7MK58kqyRIvC3/FYKFLutZiryCywVNiG5x59Jnb9EHAl1gO
         npixa2cLIoM6Xl6hmMsEbizVjN7Yk38qlbwu/Pbqjt+PbRSmddWAIk2Mv+3Lzhhkezd7
         jgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040004; x=1758644804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHO6Io94UGY97XVB+UPtHiZUlIUUn+GngtvzPBnlwdU=;
        b=XoMWXCw4K0FIZARYcwaDkPb7JmkNKHDnP8eLncaWe6vHzKY9Ape+ph8gI3cdIgFEHB
         2xrWugMoXIVM8Qnlx605dWsF4sM7JKgWYB1z4cu30Cy2GFnwsy2zjQ0NMbm3B1J1Vc+S
         vOHnSjqgGLkZVR05chlluzs4SNnpIHpai4/Ym+T8CqCeLqIQOuPgirWCxU+PkpjKs52K
         AW1DQfCRSmxCrPbhTiyOenwvb4BjMBNm4tpkfVeIlv3joee2lzjPfs/KDYo0tSe4ZTke
         FWZRNxyIw5iQGkgZdzAXO9WfnPykTLKJEYfRdn9SOrRjyD1Yo5xH3Tac52Gn3KFB2O8h
         b4og==
X-Gm-Message-State: AOJu0YwcGut4YAApM6SFQnRUHmPOIGa2/ZXSyXtbP5t7ZlmLjG7d/NRP
	iSHIVqBhdW5APvziITys5jiG+Mw5yegTLtG/BLsX8uexZk/eMq+YKus8EL9SKG1UxtGDsFyja4/
	/xwonBE6p0n3jKWMkXFspyC4E+Lrdgqg=
X-Gm-Gg: ASbGncvuHN6s50ZBDgIIHdvkrxhkEWy/ltbLirE5kQm/f0JT2e06he55VX76+sW3wP3
	64cZG8pDpfT44dSMboGalDZEyI/ipRLzjOxOYleekCiHHt1SGU7WjewZvt1iGJO4RTUlKJZ6ehg
	MIgs5ICNHbu3+Tm3XmSlRP3lNB2CBv1Z0IqE3yin2aAworZc6AVNKGM5r8FbUggk5bLfaRobSsK
	2GwYhSw/W9uw0gOnBen/u72xwl38EYaeSq6pTsOP3uFknj3DfLM53UMb7mctfUHggXKvGVvbV/V
	0W/LEPDlNE/nuPFiTWoRcWkswMyBSvl5RIKe0VhgAHGGFtIm1bA=
X-Google-Smtp-Source: AGHT+IExKkYanizj8+K4REFttnfgPByCP3RVG1yNhnzQYXuVnO1YkKMS+drubaTUP/TcOMMVgUwRSzDWXTYTN1MxFU4=
X-Received: by 2002:ad4:5943:0:b0:78d:4a9e:e95f with SMTP id
 6a1803df08f44-78d4a9eec1bmr33775596d6.13.1758040004158; Tue, 16 Sep 2025
 09:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250916155800.3860178-1-f_l_k@t-online.de>
In-Reply-To: <20250916155800.3860178-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 18:26:32 +0200
X-Gm-Features: AS18NWC6Ao3S0hhQAXg20sYdv_SwlrgoLNc2jCgHXq_ZWmw8O7Lo6rP3sqO1MH8
Message-ID: <CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 16:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223575

On Tue, 16 Sept 2025 at 17:58, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
> - add 'ffmpeg' as the preferred provider for virtual/ffmpeg
>
> Using virtual/ffmpeg can be useful for recipes that require a different version
> to that provided by oe-core (e.g. kodi)

This needs more detail. What else would be providing virtual/ffmpeg,
other than ffmpeg itself? Why the justification is talking about
'different versions', and not different providers?

Alex

