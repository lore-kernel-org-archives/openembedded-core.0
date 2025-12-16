Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C17D5E138
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:38:35 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20359.1765885110129974730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmZ8iE/x;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-888310b91c5so38070896d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765885109; x=1766489909; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R63b1hm+q5/RED+gbPANqjhm5u6is2mDVk2LfAzZcl8=;
        b=HmZ8iE/x0XeOnPbOCyf6bDd2N0hJn/ftiw0P1vD3txqya4C0L9iLHx/9f0Q1G5GUhG
         JPeyn6aEtpl3I1ARIiD5qY7YJXsDON1KoxxA7qHIfCGwCAFAQqhWCcaJVW72Av0vD40v
         0BX2rDA/J5PDdMGYe0Spai3pXzSqkDiKLVbEjh75R1/x8Pg2M+ESK3jVHVADBFbAoz4a
         vPawdKLUSDl0rnyeXGVSV3iq6n7MyxRri9gGxpzV8CxU1xWjxIdjzIZ7Fx38xD+7PrWd
         cVQlhxm7a+UHRweOZk1chNrVbNu4rppeuLEnRVHm8Ac3XjgIVdU5h54ZUU1+0niFHc0o
         KRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885109; x=1766489909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R63b1hm+q5/RED+gbPANqjhm5u6is2mDVk2LfAzZcl8=;
        b=RB2FFMqRYoGJmnyKr7TgC9wtZiuL/emcmK1bVoSE0GUHSdDyTvVNWssbUoEsCDwjmW
         0Fw1W8k78ksCp6wJ9/zjhyaTRKDIxx7XPtJg9U/l6UmDGCK+tQSIUNLm/JCRDs4W/3Jq
         TSPDnjOCyBo8eG0g6Eugwt2HOyZ7L1LVXkh1fQcL9Toqy6ZwNFmOzM+UqBjYTvIlSknK
         y7YfdocAf5FAKGu5QWgaIg1gUJlzzuJjfJSWYJpZGJXEBeXlKb3XZsqjeYt4nCA2XF72
         cghrZDik8kEjZWxkjxnc8xMXCzWSJiHqwlPnVQ6uRAh3i+Z+VGe3eF9zvh/d9fNpCV8y
         tOOA==
X-Gm-Message-State: AOJu0YzwQMln0+1akg4QEh+kAs1mbEO54mBkSY5qNBMPtgijhtYLgV/X
	ueDzl1f35RBus6hDv6p+qN1+zhyFrqWodCuYjpGA6fU4dfD0c5nE79VNpuFSXjWWVMcEPWJkf1l
	6AG5FROzZlUT7WHvBGp0ViBy7AYsgqVCwag==
X-Gm-Gg: AY/fxX54m8qPEqgkouHX/ZUtJ17mGjEdWp/PPIDNqRpK1k2sN7BXDjUEWcRTGWHybVb
	YTg1JfnBFDoGWo4tSwKhVk3nzKn0OvrVTdijP/Ryn1UtG582NMRKrhlOJiVhxqd0HarDX6pblvG
	JsNIiydryAGGSjVUMUThF7rEHqY1PVWFPiqFdub2bD9HdiOgW5S9+/gVIdFu8kSvJS0aSja71Sv
	q5ulXnw2oTT+1vzyMD0IWbJ0016ZwBCTKfJk2c+MdESND+M7ba8vbfi6yWv6CNSyewk//E/cQvs
	7PgByfIJjG8XO2IaImLgOi6fWBijtw==
X-Google-Smtp-Source: AGHT+IEItgdb/YWHfFjI9tNho4vYAKA4SdG4C23xcfvkoQRgsncZFWQURWIiquqqNBygzQK1/c2YRmvGVDyhl7KC110=
X-Received: by 2002:a05:6214:d67:b0:88a:2ed6:252 with SMTP id
 6a1803df08f44-88a2ed60350mr113458556d6.5.1765885109087; Tue, 16 Dec 2025
 03:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com> <20251216095459.3551985-2-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20251216095459.3551985-2-koen.kooi@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Dec 2025 12:38:18 +0100
X-Gm-Features: AQt7F2o2vu2F3e0RtxymlsemZXcVJqpD5ZI9Uicr35Z5nn22bA5-Gp6in2o_AaU
Message-ID: <CANNYZj8xx5Qn7Wj2JzdjXyUzysppG3DB5usZTjswfOeYbcfiGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-pyzstd: import 0.17.0 from meta-python
To: koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227944

On Tue, 16 Dec 2025 at 10:55, Koen Kooi via lists.openembedded.org
<koen.kooi=oss.qualcomm.com@lists.openembedded.org> wrote:
> +-requires = ["setuptools>=64,<74"]
> ++requires = ["setuptools>=64,<89"]

The upper limit should perhaps be dropped altogether perhaps?
Setuptools gets bumped in oe-core all the time, this patch shouldn't
stand in the way.

Alex

