Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1507DC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 20:28:06 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.4268.1738268882367537547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 12:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGt+Mh77;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e3eb8d224so394693a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738268881; x=1738873681; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wd4utYNHxMBNpI79BjbUrblTUSntofcXHOBoDlO6NU=;
        b=FGt+Mh77Xkss+CH2vHCFj1Xw4iF9fMPE8cR6SE2/+bmK8l+i3r2TVFo2V/UtrAc41R
         QaI9TGigZD8IffaMmAjdqUK4BXwobX/U7Xo1fJ2V1znbjFLGNCTQCsgQF0LBSVKYg/ue
         esqq/D8c4C1b4e/5CRNlZEMOMn3WupIfTUtQvSbXTf24sEU7mLfYCqxUYbYDb0UyM5wY
         o6Njo3fIWsjk+hfgVKBx6xNc6RyIdm2MrduRgbW6P44n56W+GbLDuAM74/rO5WDR86XU
         wEChIHsRrdcHdx4pxNWSYQkDxsX+UdMp2sbB6O53Rp9nhl+nT4Pk4AUgj7HayQ40NBPj
         wiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738268881; x=1738873681;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wd4utYNHxMBNpI79BjbUrblTUSntofcXHOBoDlO6NU=;
        b=tZVbxaXkz/vOj40z0wBigsWWvLU9JF4ji4WwuMe4WjLUcwMsUSOJbUpe4mjKmjgT3H
         bIm2gLXY4CZzsw0MlmX1UWI6BLKgKxWS+8aM5fXOLL3IVuNfmRhdr2yUpJJKsIl9kphi
         fXmU9eH/OY7YlxO777t64Sp+q+6DuvlbHRx4Pm82s/0MLWZMNZ9RsvCRrJMDDOiNXbcL
         VDBEu1i0Oj8xfRWmJHb6SDx5PS2ouSs/tqWUOBo87wDYoYq0KFW0pJDTCLOSanL7mQ0n
         Mv4T34kCRGZdX3K4P0Hy91KwdQ43hFSJwPDW3lUcKEKB5A6ZXKxa/IZ5X5iZ+zEwDTw0
         e3HA==
X-Gm-Message-State: AOJu0Yw8gCqo/QjFebYW3VkTI+PHZnJEzxhNc6A9YXPCdbeSqnwEqtRN
	whWx2OVSFfKhTMZgvY86w/V6KTb5AUhZhRIspliEhu6osIM6+FzaOZ/6/w==
X-Gm-Gg: ASbGncuZMtgnBqgV6dobU59zzXGyZX4uWutqsSSrxMYAIbIzOWt2vQ3/oeHgl+Kxech
	jmHrfkkGYXaQK7acea8TlqCE3DANDy5h03AAoSW5lCUVsGgwY8Hw16BDQPNRCQAWaLStUnXhJPi
	wsMdcybY6atVBjYD0LN283Nx50pnOZbpI0SHA84VdNL2g7nkre528wLw42Oq901IjBF55SQJ3Kf
	j13LqHwNNHtJHxdJKXyswI/o8WHSZelyW1shUrP41gz1PvVojV8TcDZteAPakkJmLFQt1joIdDC
	LmJgebYHVyZEsxy2RpERNagRirj92l3T7vth/5IZ+Vkzj4x/3YFxRGQu
X-Google-Smtp-Source: AGHT+IGiD8FXwEM1AfbRklO3figW3m5NHmzR1vpVs1gysY85zTaXL1FOTprpfWnMvYr39U2xrJzomw==
X-Received: by 2002:a05:6830:3741:b0:71d:f239:c0b7 with SMTP id 46e09a7af769-726567609aamr6111177a34.12.1738268881083;
        Thu, 30 Jan 2025 12:28:01 -0800 (PST)
Received: from 204-83-204-148.prna.hsdb.sasknet.sk.ca ([204.83.204.148])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617eb636sm484476a34.32.2025.01.30.12.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 12:28:00 -0800 (PST)
Date: Thu, 30 Jan 2025 14:27:59 -0600 (CST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] util-linux-libuuid: use util-linux's
 CVE_PRODUCT value
In-Reply-To: <181F36C8D7A37026.21193@lists.openembedded.org>
Message-ID: <f4b379ac-920b-cfe7-341f-3f1e8aea95a0@gmail.com>
References: <181F354F7FEC52AE.31881@lists.openembedded.org> <181F36C8D7A37026.21193@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 20:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210467

The only difference between the various versions of this patch the 
authorship. v3 (daniel.mcgregor@vecima.com) is correct.

On Wed, 29 Jan 2025, Dan McGregor via lists.openembedded.org wrote:

> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> util-linux and util-linux-libuuid should use the same CVE_PRODUCT
> since they're the same product. They're just split off for package
> dependency reasons.  Prior to this patch the libuuid recipe gave the
> wrong CVE_PRODUCT value, causing some CVE check tools to fail on it.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
> meta/recipes-core/util-linux/util-linux.inc | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 56162ab1479..580ff488e42 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -43,3 +43,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>            "
>
> SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
> +
> +CVE_PRODUCT = "util-linux"
> -- 
> 2.47.0
>
>

