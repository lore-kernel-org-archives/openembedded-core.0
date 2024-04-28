Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F8CC4345F
	for <webhook@archiver.kernel.org>; Sun, 28 Apr 2024 13:19:24 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.9827.1714310363573416243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Apr 2024 06:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=004ImJ1+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ed3587b93bso2203457a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Apr 2024 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714310362; x=1714915162; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15toveWrgbzqpwPDBKBmEapu2d/8dlhnApOJYNTRho4=;
        b=004ImJ1+8Aqr7la//4iembZOQvGH73h+915bnmGRb+PhJG98GqKk1WFYtlQN7oB49/
         VZM3/miSgCGaPr7KEDwDCA4R+7kh/CJFSyaUtXlyBaIF8DQwGiWyFZLEdlOjJoG8ICAs
         W05W8ZtShFafqHj9oci4b5/RKHUYpA9+cuW7IZsR/v77NiVNTbd+EmshwYa11kKEZIK9
         84PbWWwDvV8Gg3gsSAHNSML4iBnPaCZC3O565WVAQdutuBh3LajsAcBdEpq/7mkAo23H
         axY7cVV/6ruDFM5KmPfon/shzKR3w4A4PM8msTipmtnPxdJx7NFariN5UBxseJXzGMZH
         d+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714310362; x=1714915162;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15toveWrgbzqpwPDBKBmEapu2d/8dlhnApOJYNTRho4=;
        b=v4FwIwYYxE0UgFOMdPCJnSWy9xh7Ki1L1lNza0nnxHECdtN+lpQnsrndVrL65lRza/
         dHB209HDRZsnCBbc0l1IxW3sPtEjiu1X2qGckEwcrQVdt5ACmP9RXzo0qFGT7PKWGHOb
         +v7DZTdt2U9E7daCV/MBla5A4NuUjNvALeA5Tgluan1InvvFgxYpMSAqR/L80zRYoheQ
         F39V3YjcSzd2ohR3x+jUPVyAnPQ4otGmSzxkb8m5fHuddS4frlozg9hgvN/CLIV7ERNN
         ISaWtjejdIu/hlSKBuIYK2nj2tZM9827uz6TDWJA7qQm4+MMtUe6FnNyvIf3K1lwjvNy
         /5jA==
X-Gm-Message-State: AOJu0Yx8+gtYrfgL0hcvqcOfBMsjGfSbyVxE5+O4XeO87Vzup6iH6R6y
	CElFnrmQdHmg0wCy0jch4rGCNP+GspHQnu3bJjrviaVWrJBmw63SO0OWjflAL7YaNoT43X7t/1n
	o8XQ=
X-Google-Smtp-Source: AGHT+IEU3nNFGWKuivMMNp4+/p9CnfKFmSGAc0svoIj4qVziU20NpQ5QGKM1L4EG6Gi8Mq/3DukSew==
X-Received: by 2002:a05:6830:1248:b0:6ee:d62:8415 with SMTP id s8-20020a056830124800b006ee0d628415mr2494906otp.17.1714310362376;
        Sun, 28 Apr 2024 06:19:22 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id xb17-20020a05620a5ad100b0078edc0a447dsm9663067qkn.68.2024.04.28.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 06:19:21 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D6AB51001B8; Sun, 28 Apr 2024 03:19:20 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 28 Apr 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Apr 2024 03:19:20 -1000
Message-Id: <20240428131920.D6AB51001B8@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Apr 2024 13:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198729

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *

Full list:  Found 33 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *

Summary of CVE counts by recipe:
  ffmpeg: 5
  go: 5
  qemu:qemu-native:qemu-system-native: 4
  rpm:rpm-native: 3
  tiff: 3
  webkitgtk: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  cpio: 1
  expat:expat-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

