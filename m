Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A378D5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:12:04 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45306.1765793516664565277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwygdgKy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso15249146d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765793516; x=1766398316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+S0M2AGkoh8bYZ7wOeomTyrd3cgSMBDYIlC6U83//g=;
        b=MwygdgKyj5V1MdiEnP44UvQSsG4rhXNn4Y0TK1lYFkWiebvCDIsqkrgLd3rGBUaD18
         xIKffE7mZvRtT8DU1OrjwXdNLviX1ACDlkw8ctfbfkgH6Av2RIFmt3OCx5e9NsyPzdXv
         dSkRYh+EsscTzAG1E7M23d7iWvLwiGUba/1//uHDJMLPDcSCKwPEJWBYBmgdyJBjy2Dw
         teEj6TnVJ9AaGFRAYuQtIwWJvDH7TXkeBuwGn57mb5MvDwsIBnKdYHeaZgYXtGj34fmy
         CjtDM51LIagiB/ZIRZRsX/drZfFkDclSrMjwXO+ovEe4JWq0LQlgl5uhRKDMHn+wFPfj
         WLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793516; x=1766398316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+S0M2AGkoh8bYZ7wOeomTyrd3cgSMBDYIlC6U83//g=;
        b=Wnyo5J/v2IkpkBKuVALAxETyvf4lxqVtVtaWwEOTXkhwxk6dG8f/HTnXkn7JaloikB
         fZQRCwzSLlFENJu6GeVZqJq3NsRIyhkL8nplio/d0gheS4cipw2ZObnacpkLiqZl4haK
         uO/GaAm7GGGp/aipcqSvf2XVa6Hs68/6up9R5mgyjbvTSgKHfSNd7qcdtQ5R16nTJZDm
         JpSXLAzPJvOpxeUgX0uNWxtpZVcLWIgf9zKwHyZGcBArAYMMdi9NK0UNSHmD5W5TSO4c
         38Uun2kLpHOTn5eRkn21VvW7EhhvF5cqpmRKl/YbSdu0JGH9iEdm24yUMEHsyEJwW+oC
         iEpg==
X-Gm-Message-State: AOJu0YzI30iuapjZ+W+cmmJr2MRPEf0+IIysaWHmPGTGK4mntM0NY/JU
	zaP7oKWi93HgTb+VUJArfhefom0Uj851eWm2uIC9bkVspB0vcbXgDB1GgaUaF4MHxXzYc5lnW2m
	JMTlFF1XXZUS72WFP+ObA697VP9QNqqY=
X-Gm-Gg: AY/fxX6gFq5VELAETnKjXUiTZfNqF/Xl1sVIOGSEfaG2ozXKh0puD36wK1x/42WZ8ZJ
	NNiBOZGRhuSGYu+ItGlrln1RadCvbHfA4NCQqGWfXv5xhQ845gAG4i/A5unffenvbVb1LFt8bef
	XAShnP/T3pBhXXDzDpNemfgDkML+AeeGSHQDL+YwcffAst94z6Ur/aftgsRHQHIIlSczZSVXnY4
	DUOFFioE9K4JD5iz8aXa5FArUDO/Duuuvop/SG+0kAB1H3yY6yFI9NfRf13Zf1M7U5QTPhoByqy
	KBwPztGjCVP/zKIkrOl7MqBcfUaC/g==
X-Google-Smtp-Source: AGHT+IGWQriUWYHKLsyA3DQPZGLFBFpDk3tFn26n85F4ErjpMuOal44DWU3zgpSYxcgfp7RjB0kRzA8wkhNGFQ/5RZE=
X-Received: by 2002:a05:6214:495:b0:888:6227:3e77 with SMTP id
 6a1803df08f44-8887153bdf1mr225972496d6.4.1765793515674; Mon, 15 Dec 2025
 02:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20251214202547.3918638-1-raj.khem@gmail.com>
In-Reply-To: <20251214202547.3918638-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 11:11:44 +0100
X-Gm-Features: AQt7F2qzhRaW9LBVJwd4lFz0Hwc2Q6g7gewGvMA5g9Pzyy2j0QzVxui4_Togthk
Message-ID: <CANNYZj_OQxRJUoaAgiEXcszfq6bUWj1bSEP_NYO3adBXgW0fwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-tools,spirv-headers: Upgrade to 1.4.335 release
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227714

On Sun, 14 Dec 2025 at 21:25, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>  # These recipes need to be updated in lockstep with each other:

They do indeed :) Vulkan stack must be updated all at the same time.

Alex

