Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6CAE9A776
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:46:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17878.1774352797774224395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=beknf4UP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so45031785e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774352796; x=1774957596; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p+HWzT8DOAoetgb2jJCVTnjkIUgUCESS5QLwNU9nSM=;
        b=beknf4UPRNVNx+0vRw+xdybF7Vgsf2IBhCr06r7h2OgNqDaC7wQkajYfInkUlQFqFm
         +p99dbSMyJLmrMJGl5AsFEc2s7jgNmveb8Uva2BdMd+wr91blvkrMKDFy1QVDFHFn0iM
         wUXDNYYrQGWXUSHMF8TXRUcJl2W+sJXyulYuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352796; x=1774957596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p+HWzT8DOAoetgb2jJCVTnjkIUgUCESS5QLwNU9nSM=;
        b=I4MYCEM5MtC/VqYT+GRVV2xQ9RIOyJiYscb9zbMZRB3w741gtTkMBHWu5L3G1LBRax
         8K2fgnJ1Bc0SKAmhjozf9CUy96Cod+0MSikEd6pDPJyM+Z6fwFsArwR15Hq/uBjt5aDO
         Rto6mqj1i9B879hB6bAVanYOaC8HnVRwr+RC2HDLnufSmqplY/rW3h585GoLqGS8Ka3w
         y1lWfF2IxEpfjPuzcpeoVBt5a0Uxy6oP8HVZrZVfSkWAHTBdXKrdUIH5ipNLgKxbeOsE
         GvakP0jSiboadgr+OzBXvbYCE1ZOQyYiV39uNitW3Kat/2Ov6rwBsKMiDlIxtF+u1Ti+
         WbZA==
X-Forwarded-Encrypted: i=1; AJvYcCVbFN5pKrPB3X7t3ktyohFYf0yiAD5DCfVQ1QgKA2mUKyOEixjoFPAZTlpTLfqKJpdMcEmzDNB0aaBhUteyRcJmyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVe0lD4B8f6Fs5RdmTyLQqsjThazMCyqhSjtZ2POylgfqiHDBG
	X3YavYu1o2gwCv1Z3Nj5KrYdc6mEFhjCUkt0D11XicA0/yJS+dv93IHoUcBXzuF8Vo0=
X-Gm-Gg: ATEYQzz6J3smoFKh6hqa4w2tU3FbPftZVRW0EjCfNh3/XdN5vYHbIh4jJRdgywmniXs
	ZFNcpWo0ONbdZBnMTweSB74vIfXRr48fcly26W4rXgaoAsiMELgBtyhdaaT38H/ZpUgW2WF9MNE
	xfP/HB+MVD2xZhUygjkoG5gdhKah7byKL/yie0r0AwMlfAOpAHuCtXw62n7a79fy57uCmZXnLUa
	E8bWZN+s3Yucsl30HY+lsA2ZOZA0KfT4HbqAvILcRPXruXQGY16f4f/gFSCEp2VJFkbc/oYJmjA
	0p+ytugvUO47OPX9BSEiVCUEDFyv6Pp0yYTCcXwIwGvT4Mvan6cDuV++NnWAdHgPz8OEVR15WU6
	U19ajRP9AOPWo91DH7zk1nv3ChLmBkpVaoMietp8ePez8I1r8NiUj2iiTNQTj+HxGy98DR8k5wv
	XLx8Ip2IyCapJDOY+RTFOpdhgQpxW1coWjUdyw4QeyndCO4vS1zTb1Rv3+fKr0HUXBb3yz4dMZm
	/9F8iSektIhIDpV
X-Received: by 2002:a05:600c:6383:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4870f1ed5fcmr41076075e9.3.1774352796104;
        Tue, 24 Mar 2026 04:46:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a42d:49b6:a690:7df7? ([2001:8b0:aba:5f3c:a42d:49b6:a690:7df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm89238095e9.7.2026.03.24.04.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:46:35 -0700 (PDT)
Message-ID: <a6b6254789bebfa3bedff02d74074bb519d4578f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] default-providers: use Mesa a a default
 provider for OpenCL and Vulkan
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2026 11:46:34 +0000
In-Reply-To: <20260324084454.2971108-2-dmitry.baryshkov@oss.qualcomm.com>
References: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
	 <20260324084454.2971108-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233796

On Tue, 2026-03-24 at 10:44 +0200, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> Without DEFAULT_RPROVIDERs for the virtual packages OE behaviour is
> not deterministic, it's not always obvious, which package will be
> selected to fulfill the dependency.

Can you be more specific about how it isn't deterministic? We should
fix that.

Ideally we shouldn't need to set RPROVIDERS, they're a source of issues
and I'd prefer not to have them at all...

Cheers,

Richard

