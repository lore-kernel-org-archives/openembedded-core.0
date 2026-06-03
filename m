Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78469CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:01:51 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25347.1780506054630173363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mRxXd2rm;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: leoreis.costa@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8cceaacd07bso54940906d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506053; x=1781110853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZdqB3Bct9N9JOXAq/NMfglVKSK/DgvcspRkJx+PAUQ=;
        b=mRxXd2rmmbKzRziQYkAn7I+ZVSELIpEGdfCA3jRM4nu43wYN7L6tItkzc7lv9XjeP1
         ZzY6hOXqpKGpEFGZFX2SHiwcVrD5k9cvPNQWfvXjcbbBgV6X9d+sXjcH87b6L4dydRsh
         f/5qKhRXUkkZ46nJLO19X+tsFAJu9PZxybemt5VmZIXVJIIECXIQmM2W6LovMla9kDuI
         HoK8NiS5RAVi8yr36JjKyN9IcrLZybiE3nrCqWmTZZyDO7zzwL8KulJ2ryH4zVuP0uHr
         7WF9nPVqGW0VTDpkYxc/lskJqkEkOUxwl+UAGSGt3sqtBVPVU0SpFBrjfmVBEilHjycR
         1qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506053; x=1781110853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qZdqB3Bct9N9JOXAq/NMfglVKSK/DgvcspRkJx+PAUQ=;
        b=je0TPSKa5M4+5A33VXYdUjt7Y9QBjaKSwShP79cYvQVPOcO+ktz7467aVEpis6NXJ8
         ULZhgiFcoG9P4gwh9KUWSW8vOX9FlDJYxlj1iFoupox9WdchV5U65kL60psDIOk5WyzR
         P54MTqLA/eeGLdQi/Jyupx8Ija+ajGW5xSiNP3sHt/llMPe7KsU+BOLfXWpJznXL+6oI
         fK9hv3Xpb3iZ9DihJqGyPhs18w/KhBqMqdFU8P3RAYtSHESCZB46M+EDywX6pRZTrr2I
         uxaFdTRYH/JR4Qzd4eWdg7kFW6GbIm2f3pZmlMIZnn2pr7xWssHjhpp+9D+ciJRHtPeC
         k98Q==
X-Gm-Message-State: AOJu0Yw4tGTjzXxeyft/aHGB/0h1pfhymXQVz3qnYXh3UkwZgIKaxi0/
	CcB3TY2b7qO6ZYdOgoT3QToghj3ZZa3Oy2/s8rfPArEWtnm4iuQ3MDV9PpjL/j5q5L0=
X-Gm-Gg: Acq92OHcknNkaDGjfXRqIlfV4yV2vcTITImJ3REsNx7ubyhiSQ+rHd44v81ulzX9T4X
	3+oJdqBOlWkRbiG6Pk1TnFsnpRBuxkKPqVQS/LIHd889ClC5A0nqttWtubnScX/6uNLFIPPMru6
	5Od6TczjEtrC2xssI8AH1KRCCAluGQUyO0wJ+MsqCAIn0koBptMt6O29dG1J5kMs7GZ/M46tWMI
	ITtdVJjCL51wIEjvDBfon603UcX9ZwT0EFdwQwezr38W2I/mkE8RqibRaec2NlzxnYeyWH0XdZ6
	+HcaybfKg/EPMZBV2I+2qlxtdb1RDsl/ju18gMeHlKf3rkXRgiZqOJZ5Y42Ub1jLTfudxhdOG5I
	bIOyJspdXNwE+5Mox6jdkBEvNwt9Ur6mRcDtAdhlZFpH6nobyREzf5W7S6OTdsfDna0GtvwWJ3M
	JSfGEO5EYuLp3vRc/ajaaqgzKoan8NAufVUgFWTPwAXDaUbu7qtdwALq3LJ8n+3yxtzUB8TQdBu
	QbnzKspuEtXfYAZ3aXlG2JOz4LUaAF3/kcvrxlPFedeprKfgB4vxHQuegcEgzXERY3VaA==
X-Received: by 2002:a17:903:1a4e:b0:2c0:f807:a760 with SMTP id d9443c01a7336-2c163a5a5cdmr42829515ad.13.1780505627763;
        Wed, 03 Jun 2026 09:53:47 -0700 (PDT)
Received: from leonardoc-nb (200-100-209-26.dial-up.telesp.net.br. [200.100.209.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm30172245ad.71.2026.06.03.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:53:47 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: leonardo.costa@toradex.com,
	benjamin.robin@bootlin.com,
	jpewhacker@gmail.com
Subject: [RFC] Bootloader components missing from image SBOM
Date: Wed,  3 Jun 2026 13:52:21 -0300
Message-ID: <20260603165336.2775725-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526185633.24403-1-leoreis.costa@gmail.com>
References: <20260526185633.24403-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 17:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238105

> We are planning to release SPDX SBOMs along with our images to provide package
> information about the software components that make them up.
> 
> As it currently stands today, bootloader components are not included in the 
> final SBOM generated for the image. In particular, for our machines based on
> i.MX SoCs, the imx-boot container, along with boot components (ATF, SECO, SCFW)
> have their SPDX files generated in spdx/, but not included in the image SBOM.
> 
> If I understand correctly, the SBOM is generated by looking at the packages in
> the rootfs, and recursively adding their SPDX entries along with the ones for
> their dependencies. In our builds, I found that U-Boot does get included in
> the SBOM, but in our particular case this seems to be due to the presence of
> libubootenv in the rootfs, which has the U-Boot recipe in its dependency chain,
> so the inclusion of U-Boot in the SBOM is only a side effect.
> 
> I have not seen anyone raise this as an issue, but my intuition is that this 
> information should be included in the SBOM. Despite not making it to the 
> rootfs, these boot components are still part of the image. CVE information
> about them, for example, is relevant to users.
> 
> My question is, is there any configuration that should be set to include these
> components? I couldn't find anything about this in the documentation or in the
> code. If there is no configuration regarding this, would a contribution to add
> components such as these be welcome?

Following up on this, I just wanted to know if this behavior is intended to
stay as it currently is or if it's worth working on a patch to add components
beyond the ones that are in the final rootfs.

Kind regards,

Leonardo

