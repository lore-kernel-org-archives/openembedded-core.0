Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB54C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:42:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35.1784475732820953629
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2PCdElCt;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10377185e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784475731; x=1785080531; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9f4ZR1kD+xdU4wX6Oskrgb2AF9w5JgZmRlrDbRlVb4=;
        b=2PCdElCtI4Q6xy0B0do7zlpFA9BQBwH+8hYRGLolW1Dl6YPAlR0TGAVUDTZDaPWtgt
         Curp5r+RSnmWtj09rDItOMVDnIl+uCk8No0/kbdj97/Wp+La/WvZhkPEssHsecPE3tzh
         cFhHT5rlbIKKtPTR80NLedx89Jx+S6Tczkgzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475731; x=1785080531;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9f4ZR1kD+xdU4wX6Oskrgb2AF9w5JgZmRlrDbRlVb4=;
        b=iYY5UNfVQLcKHEZcyqEwZhH6cLtUgiK0XssaFJ4rG77jY38r2lwOJbTzx335SiC91j
         3tdWGhiV4vwTjXoXdd2hECdmOLNZZNbgHcdmEwvS0+9EoaEGV4dY3j968dMVWrHH3dl3
         Tr5FYruqvH90KKO+uAPYk85KbJuakD+mfunwIbwygWqmb5/nFvIFW8CQv4IXshpTsNv6
         eXXsPhUuHe8sgUSKtfmmCd2jlz3FCY5o6F9YomV8woao4QG3iUcpRdWrnQBqDzpAbsIM
         uG5MpNIoEYkBivz5+oFtO0nNzgRHOft25XPcSDdTYr2Vd4likS2pT9l0b3Q/A7gROyIk
         fRkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmJMASrJDsTC0f17SvVQLrUGsoHd+tmQ7iu73sNPODfh3qmOGCJ8ZqOLmxXu4qFWz+K8cEpFm8sbaCsK6ayIy5YA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6AXcreGFDG9AVDbf0ZQxhPcyfS/nSkR2WMrCrng302lxIWSep
	8BrKij8FboXMp1OJL3ugUfdwv/thj3EdkHeJE+CcGrKlRy7Ifp2cw2uGxY4P8i9GRJI=
X-Gm-Gg: AfdE7cmvSD5Y2BK8Y4lzU0RAv8FLIpSdfDfKvHyJjmarDUNq7AvIjSlpsNMr/aRWlaV
	ODqy2WYl2wBx727HJX3xx1cJSlUYXefMfQfbTl7aMwE2y8Q1yEYDu45y/8AXNaOa/FM+jCKOEQv
	7cxm2qrDrIiB3f6CsEifqLSCfTYhK/UyV7yBuygVf/oSS4h9F8gBzx+rIRXjfT5yFkkJ0og4DWN
	od1g3iwBNDztxgVv68Q8K/olW8tQnyfv4IMsrQXMr3g/t+HlyUt24cZsR1eEmzJv8+kh0QaUaUN
	6FMZ3iMZ+8h68efb2cIceMi9ThUBup92abIcj5vLWtD+V/uJdx0p45jCmY4LPz7CgNf3Vb4qO5g
	PstcZ5HrB2Ii9yiGqyFVtDpfEMSQHH6dTtjXwN/OetMOI9td46hpCbwy++u7y32n3Oy7UqLR70N
	pTCyFWdwoq6wkL77spGA0Q83F3+ZjafOIuo0JRvW9rdiX9WwIWQlixLLGw2e+X8CnLnq8=
X-Received: by 2002:a05:600c:19cc:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-4954a402fcdmr134938115e9.21.1784475730977;
        Sun, 19 Jul 2026 08:42:10 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm22416475f8f.21.2026.07.19.08.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:42:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:42:09 +0200
Message-Id: <DK2NUOTFYQWN.2IHL8N8ZLUMN3@smile.fr>
Subject: Re: [OE-core] [poky][scarthgap][PATCH 1/2] libarchive: Fix
 CVE-2026-5121
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bhabu Bindu" <bhabu.bindu@kpit.com>, "Sana Kazi"
 <Sana.Kazi@bmwtechworks.in>
To: <jeremy.rosen@smile.fr>, <bindudaniel1996@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260522101808.175426-1-bhabu.bindu@kpit.com>
 <DJ5ET6KPB9Z6.3IBVM148858ON@smile.fr>
In-Reply-To: <DJ5ET6KPB9Z6.3IBVM148858ON@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241293

On Wed Jun 10, 2026 at 3:39 PM CEST, J=C3=A9r=C3=A9my Rosen via lists.opene=
mbedded.org wrote:
> Hello Bindu
>
> The hunk you removed from archive_read_support_format_iso9660.c is the
> actual CVE fix, so what is left is the test only... but that's kinda
> normal
>
> As you mentionned, the fix is already included in CVE-2026-4426.patch
>
> upstream fixed both CVE with the same code in two separate, parllel but i=
dentical
> commits then merged them. Thus complicating backports
>
> please rename CVE-2026-4426.patch to CVE-2026-442_CVE-2026-5121.patch
>
> and add the new CVE tag and related test there
>
>
> please respin and send a version where both CVE are fixed in the same
> file
>
>
> thanks a lot for looking into this
> Jeremy

Hello,

Gentle ping for the above

Regards,

>
> On Fri May 22, 2026 at 12:18 PM CEST, BINDU via lists.openembedded.org wr=
ote:
>> Fixes CVE-2026-5121, adds regression test for
>> zisofs 32-bit heap overflow
>>
>> Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
>> ---
>>  .../libarchive/libarchive/CVE-2026-5121.patch | 1271 +++++++++++++++++
>>  .../libarchive/libarchive_3.7.9.bb            |    1 +
>>  2 files changed, 1272 insertions(+)
>>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026=
-5121.patch
>>

--=20
Yoann Congal
Smile ECS


