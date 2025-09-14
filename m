Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FDFCAC582
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 11:48:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7864.1757850530232315803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 04:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WqzuHJED;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2639bffd354so3588885ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757850529; x=1758455329; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQfsjSm13tGDYYt29U10bqGrpq+ElvwzttJXh7v+UI8=;
        b=WqzuHJEDSHZAwwq10cZTxONsQ1HB+9hTTKq7/Ghb6PoK/ZNknOhvFDMxBHuJbMI3IB
         yQGn+Nn6mBy8Tiojj01yQX+2brnG2qBFNGfzR+Zb2DaVyNypEACcoAgp/X8j8Sd2CNSM
         a1RMmHtA3417pk7SVzPkLgD49BVBfTWNejFIt1S6xW4yDbTFWgTcpMo2NT2xRLQKBpCm
         yrljvJ+Dwy9/EJ7/5/OI/Rc4q+yha4SLFc5Uu+Xo1sGVtR8e6hINee+ah9RzhuIKwsjc
         aEB4wh3xRnqiVCJbnHErPBf7fYEsB7+Gc1ZD5Wvta/5N8/6DCLvHyHSpt47HsnFfAPVA
         9iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850529; x=1758455329;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQfsjSm13tGDYYt29U10bqGrpq+ElvwzttJXh7v+UI8=;
        b=QzHkfwTogBkuc0WlpXAKCXGL+RDIGGXPLijYF8KFOU70DO4cAXkmj7KkJ0NJpm/E7i
         I2yRBUhLKKSoFkoRWW0vX8UIMflsiR/ctHyEq9uZfcZYxEtwBhAwXXtD7j7Bgxfp1Ffk
         F1wvYwY759c09S8iqH0oipH8nly5VpONjPiYfz9vCd8h5n9eng4uH/3JP2vjl3Zsc7z8
         nvCSVTm6mss+wR/gV7WnhRwD6UOLUh+aNBusE7nc3tVOKCItqQndjUIofIwzNlzliAp9
         Gf1kBgoc0IAhioVaFm50e9U5r9zSQCccSxDnfhaUKWn0AktTjG9NswTiMlKxx9+JOrWH
         7E6w==
X-Gm-Message-State: AOJu0YyG2s0CAVRHMcUZh0HiS4e5GcxXHo69x1lfPmCrY9inf/oSkwQ1
	xeMp9xvZXw1D6Bdz+R5waGR43K2BAO+0uOmYl7btvbiyDSi42xCQ1VSX3xpNopASVgw3JvS6SGL
	+lf8E9no=
X-Gm-Gg: ASbGncsRhRJVnPUbMesHUPa/gVBzORnjCUE5f0z2H9tIIEig0/pjV2BvmDHCQhH2fpW
	5NBeFBquri2aYGIa0EAWARzrWatOWgCXGZoz9v68MwbsDkrzdeogL0NEKkYjgBdifbcPPu6VrQ7
	qHmtDnfdFdh/FwOQbNBqT4DcUQqDUba/d7jiPBDqY+mtNqSh+Uk+MTqHyNl+8eTXqc7uUKdoSHA
	eqYgB6DKbfuXtR5xn6uDXYJ2HrKZegPAcsh/9ITV169VsMsAzzvhGYpntINQKKcJ2OEL4/YEJoE
	gnt0BUzFy7F+VIZjJz54Jzo46hixt6S64S6Khnk4j50NiySBrq9ou4ru1oIpwBGImdKOm5Xc/s8
	S8HqoVmhphb43Q0uTDrUnPd9nujyokrB+VfOD9A==
X-Google-Smtp-Source: AGHT+IFDNA2iEFfIzvvNJ9gLi7OIbHGCgRu9yyFXieV+o1yQC2mIolNtvoLmWPWgZb1A3/V2LoxfNA==
X-Received: by 2002:a17:902:dac7:b0:250:6d0e:1e4d with SMTP id d9443c01a7336-25d243e7eddmr118226885ad.4.1757850529452;
        Sun, 14 Sep 2025 04:48:49 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2631e29e60fsm27269395ad.137.2025.09.14.04.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:48:49 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id A699E1003BD; Sun, 14 Sep 2025 01:48:48 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 14 Sep 2025 01:46:16 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 Sep 2025 01:48:48 -1000
Message-Id: <20250914114848.A699E1003BD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 11:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223350

Branch: walnascar

New this week: 5 CVEs
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58050 (CVSS3: N/A): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58050 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Removed this week: 1 CVEs
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Full list:  Found 45 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58050 (CVSS3: N/A): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58050 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  gstreamer1.0: 7
  tiff: 3
  grub:grub-efi:grub-native: 2
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  libpcre2:libpcre2-native: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

