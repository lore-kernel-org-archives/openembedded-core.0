Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BAFCD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 08:08:42 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5554.1780042119395547018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 01:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HaE31s3y;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8acae26e564so171238156d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 01:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780042118; cv=none;
        d=google.com; s=arc-20240605;
        b=e7c4yCyfdQUYmNufDWI6w8QLC9+0hTqzH09LrHyQIUVxzJlEVE9/qAVmKstQ/KqbBc
         yKOtneBpuPxMVmfGVjBLQnjQZzeqaADZR6EBt71Rge/bdeAtn9LSeDrZM9c37O8F9bOw
         UKrgPOzPuVWyhSus+U69SRqWm8aOByzgK0dHO+DhdjexXo9c3Wt+bUJzKdG7c/jBcd4D
         NkHddCToXLyPYIaTXRDSjh+H7W3jLrVmmWtRCJEa6qIroyen/UYq3/mrnTvJ99ke54Ci
         QD2g6h3XirPBeeZs0sBCFwEenz55q2YwDdYL/fV2tF5vNBfNxnwR3apJ5wAfteqfqDLr
         /EJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1xxDrJ/wzmxIzUn3AEqll0WAZC1VEivkEnVoc3iOUSQ=;
        fh=VqOO6LLKHOmH4PYmWY0CsMQszqArPnFQxnKYBAoRL6o=;
        b=SLXlq1RVTx4KLakhLJlYwGW4Th+tDbPsWlORhXW57tN0hJJMjvE2Q5DQpbHrOcp00O
         B25NwPfIpR3WybDrollK1kjZ7lVNjMP+avAidgW4ds8LsWEW1/re5jU9FqdW58A0AQuk
         o+jxUYLTvQRVZVSl42A/TGCx4brW4rpF7chZ282PrK9XSpdtdEDTeJ+tVs9/YSxBq2kH
         hDfER0Jn7PKrH2DBJFt5D0EQNF4ZcegLxqd97riLyQ/xS1QA7zPTotc7c/71XDAgQdaN
         wqNbyiPVOceFZM/AVvmeF0Vhik8iCsugu1c5rZx0+QiEoIts2U8Li+vQa9QpWmSQRodW
         abSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780042118; x=1780646918; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1xxDrJ/wzmxIzUn3AEqll0WAZC1VEivkEnVoc3iOUSQ=;
        b=HaE31s3yM0/cHG7WbhcQ5l5Ja3MYvC2Q/oaCMPr7MqrhSKNsKEFClvt/L1LeNSO4b/
         GJMM1Z/WfZ8Za3qY5ejqSqbki5jnOnKgYQ8S2R+pPp7IEzMufRd/blHik5LUEKIalYsr
         rIixZYpBwLqNNvvMwoEfJEMIXQB/HrAN9YDeVt+mCN/9esC+NYLQ8cNATI6apK2QQ4XV
         YrU0A3YR8lKEqV0WYwG3T+oIFyBsYet2BKd45RzKbeAzaMOruo5jwuQASJ5q6mtB0oFi
         7Ef/WhVBN0CubEd5wFGlNKrTbDMdYYRw8KDNe9JGdshhc4vjinAdEFbgZJlF7QN+zJNf
         84lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042118; x=1780646918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xxDrJ/wzmxIzUn3AEqll0WAZC1VEivkEnVoc3iOUSQ=;
        b=mBCByCpa9gHr3saR6gSIDJRUGWX0yYtUlIrEmtsVApaUZoGDqwrobKVo1rl0P1d3pu
         5zgAF18zml98egnqnsTsENXb2iMnMNpF1l/6MIRABYcgYu4JLAed6sTAfl+Aqlyo3wp/
         MBcREQVfmkp/FiA2aXKo7RidVTlcU+tejAydux30GsvMkvkkBaIBMc4hjQ6wOyhdqMxb
         AI2k+K+/VqjynrpzyxLCvkluNUqF1fbpcgSyq8yAQ4KMlPqGUofucjioeOUDAU+pZ99m
         FNUnGiz/7M83wzIC346pCva2Sr+4Sn1x/5C988JJ+vobBWrQZvbDV7cIR2vtsLxGnJdl
         Gx1w==
X-Forwarded-Encrypted: i=1; AFNElJ8JtaOQUsrhuWYToSKDYJSuMTSvdJyIn5HFbweM/UqDwhfLS5onHtcBjsB0xq0X7q4rG1CcmrvK5YkKKhMOFHc+Bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyV8o3NJajq0csTxiUuEGA5Z5NZ6OaimVPWcd0EGzE0pWs4h4uo
	FPQlY8lUPzrTcd4JQJIWq4U6Wmx4BnehtXsSTWguBPNityCfx3NZcX4+4lQtzvQ5kfqltt9VfkO
	Adxi/9IavLfCvus8rCTqIjgNedYLh2wg=
X-Gm-Gg: Acq92OGrjRLwkwM49gsVXaHjaYL1nRDAZC8yhI4ddmC6DWu3LrF/RTWt64rIWPJDbhA
	2MQLwOSrVjHqnQ0EFycOQbIv6pV+X6rT3cIXiVraXdhuvEZRGs6d4Boc4uVHipgB6sYZo88hCQW
	EFccj7n7ve7Z449MRAg2S6Tlssd3V1iDOXA4upiR/jqag97OrToh25cVX8Ng7T79M9aZWX3TK0p
	6iVaoX1HulXYrp8NvnwocDoRDGP3lxZmWpH9nDwYpaGlI+x3ckml/9SdShKhizhXp9+8CFTxrRA
	mbtw/tX/gTmdQlvulOkmzPKzGnLynzp7BlKIQT0VavOMXfh5VLdkp3ctWlSgJ7I=
X-Received: by 2002:a05:6214:598d:b0:8cc:e25a:674f with SMTP id
 6a1803df08f44-8cce83eb2e0mr20054626d6.46.1780042118408; Fri, 29 May 2026
 01:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260528184427.517-1-adityags2004@gmail.com> <0101019e707f4f5a-9a72d5d4-6549-4b7a-bfd8-88596d80a968-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019e707f4f5a-9a72d5d4-6549-4b7a-bfd8-88596d80a968-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 10:08:24 +0200
X-Gm-Features: AVHnY4KRjyM1Eb6hvmVWDxjEE6P0U-6AWCSydMLGVAsC7ba0qfRvIsvHeRJAogU
Message-ID: <CANNYZj9hMofg4Z1z9=kZotBXy3f4nZ_qZ-Ov7O3OYeDpCSdymQ@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH] gawk: backport randtest
 stability fix
To: patchtest@automation.yoctoproject.org
Cc: Aditya GS <adityags2004@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 08:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237746

On Thu, 28 May 2026 at 23:30, Patchtest via lists.openembedded.org
<patchtest=automation.yoctoproject.org@lists.openembedded.org> wrote:
> FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'randtest-fix.patch' (test_patch.TestPatch.test_signed_off_by_presence)

Right, this needs to be addressed too. Now you can use a -vN when re-sending :)

Added Signed-off-by must always contain your identity, and not anyone else.

Alex

