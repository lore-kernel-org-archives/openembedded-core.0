Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA5CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:22:49 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8307.1779268966645750908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fodQNY5a;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-911796e9885so451207585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 02:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779268965; cv=none;
        d=google.com; s=arc-20240605;
        b=Zj/Pe0bj8+IXYU39mJQ4aSSAUDEoYueW8zPRrZcmPSswZRSoRkpVhnhgrrGTgKSUq9
         y+op2rH5xQniGUtgcntZeyKL8/7wRrF1HfM0qbDvwi2GsCMC9sq1rbla1630EeyQYv3o
         HNKEwrC5ngvuRw4pR34X37YVXazFTDjxx3lzo/vgtS/nFHIn4KQCl9heTOQVnSjmOqYr
         P78GagWlQdsZo5W7NbSa3+jXOI91t6xSE6Whz1bziCB2clfwcD+80t8HJ0Xel4F08f9c
         vmfaYVz5Y3TgHx2D4lskFz+6r/Z9BbKjFTlfONS/qJRRnxeD7/A+sRZMfIk06ATIv9Wu
         aOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wwwrGbBwd+I0BxgpzoqjUntKea5fK563r/RYJKd84sc=;
        fh=2g77jmzMeeeKwlc9zUuxPxl8hf+d5CfRSFj3oaiN6uI=;
        b=Hmhe7+bwnduK+21c/F7+I9z4MFln3XA1uW8cOCpfbgMAxE3mtUwRXUWba3PSAgQK0l
         z8GvKvJuUbPsVOqfCZ7fpjrzED30Z4AtMDsxM7Z0gIKeujbradTGrOJoreCodYK7yRVn
         A4FvF/KsP4FQ07jgB66i1ubjQb5w5rfo4N/zzqpRcMV7GzXMpJW3qtKwr/HuCwmFOLPH
         pLVR7czo+tAczYwV3mAloxjfNNHF5HYg+aW8g6W5gxzw+QLfEfCPvHlUFp7iWlBcapfL
         xEoy6Nm8iLhcpfsbAvnADxojRveDSmRfjVHViUZRk4gdpHg36SV8J0n3bzwS2tbR2Pim
         PAzg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268965; x=1779873765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wwwrGbBwd+I0BxgpzoqjUntKea5fK563r/RYJKd84sc=;
        b=fodQNY5aesYJVnVqEuWVNeMbPtoY2P2+kE4e6r/HOT7Bvw4/ZPRciA6NLQlYl/2HMR
         onbNdvQRgGdcUQHrz0u3GxLylpYIwfCPMEyAymGpKIZeNLv/NazG/ENcOFf/d4QKRfNO
         VHRw6SguvslA5htXH/qDZXuxmAncp6EolzTARKwRLba96nYcllcSvcW6vDae1at371Y9
         CSQVQulQTLb2OxDM3XemoYXUFDP9TmnsR2m0MS89qMcbDDohqWfuyl7vj1TMuu8kw/Js
         CcAR/ZCyva7j7kGApSM7WhAqOJ26OjUZDjEf0d1B3JwzWZZsGY335HJI6TpXTohAkD1W
         qWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268965; x=1779873765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwwrGbBwd+I0BxgpzoqjUntKea5fK563r/RYJKd84sc=;
        b=ZKPXAXjuC83LRWzI8yKybGQZ+kKlzVOH4IBrRR/l8doWmJk0dWSKSEnBcGpMMMQLen
         9lI49R/XbVedXcuWQmNLOFwqn1NDlDCY+7iFBzDywA4vOweUQ1SuaKAYSYJ4OwIR3OfL
         oVcYtEI6kVSGq/rrhGj9dixcTqjbUXTci0JCxdnNd37aBlkLX7l0pzSIip4GmQwSzUtj
         JnVMXLMhe8yozsjO0jRxT47XzkVctcuSNZRUFpo3uReqYLzl32XrwRCHnsmJrOl7kXUA
         m/M7pyr9NVm2bmikxD4dVvBQyd/Or0vMrwFktQ0OSIxQXIoKA3qiHm1xZmKiozGUkmyB
         9Y/w==
X-Gm-Message-State: AOJu0YxUPjx5MAIIYnSKHPn1ISU0LIp4Hyvf5WZm96/BhVZRil0wHOAp
	I3bf8eMIT8VRNOK4oFHD75YnWPktVNeAF8dleFBCjJPqoGkCh1J+jyQOSFsKSaaL7GeF3dTMAw/
	W103rCHAa74NejH15+wyJmjItwb6EVXXQzw==
X-Gm-Gg: Acq92OGocCojKGPHs37MyqcXUZGtc/zESIW43eUvroTv/gZUu32jt9LGVQ2G9/rR3qh
	FnbWWMnfxlUC1HNMT8qFFn3kn2eRupYvDLqWGnDZuFzzO0ibm9PQO7WSN8ZlNnuotNrvxoqtik6
	puKW8N66VoLbg3baf8SgfSiYcBAmsnI5jHxhiKd543wBwR9WoDlp1WnL5J1gnyHrJHD5RLjwM5k
	YkeCOjdRePIVIJfP1yXpdxi7kcayw/p6Rm1H++A06e4N8EX6cSeDSBUA9MlaAiTIlJT1+bj0ZyX
	bXxG7Mz4N6ekkP8UOk4OEYfqFAdPGhKvNy01rtTJ4g==
X-Received: by 2002:a05:620a:26d1:b0:8f0:f1a5:680d with SMTP id
 af79cd13be357-910b11022eemr2659720185a.36.1779268965474; Wed, 20 May 2026
 02:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260520023754.2076160-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20260520023754.2076160-1-haixiao.yan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 May 2026 11:22:33 +0200
X-Gm-Features: AVHnY4IVaHcz82v5mrP_cRc71p9MvS1lao0JjEX9YqNoo5dlmrafIiTZ7ec5Bdg
Message-ID: <CANNYZj_1Fd1c2FY_34-=Yin+D2HMws=Uc6Ms1BKS4NDXsyZnbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] subversion: fix svn-revision.txt conflict
 when building for qemux86-64
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237437

On Wed, 20 May 2026 at 04:38, Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Pending

There needs to be an explanation why this is 'pending', or patch needs
to be submitted upstream, or an upstream ticket needs to be opened,
and the patch marked as Inappropriate [upstream ticket link].

Alex

