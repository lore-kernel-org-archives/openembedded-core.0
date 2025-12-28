Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF68D3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 11:49:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23354.1766922568575359778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 03:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VvDD0Qt9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c363eb612so8310161a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 03:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766922568; x=1767527368; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNAWHMFA5YJJczmfPXYxdeDSjnp+F/CH5okDVaZT1RU=;
        b=VvDD0Qt9f/5SlSk7Tuu4p5ZP0IADoFfhI+2Dpw4NEdhEOxGmrhbyhyBqTF25wlJA/T
         gFpG7CcD0UZzCJEolqiusp8SUG5sI3hIi6z1yJiso+ZPzhIRgwxCc2ymXkf5pCeQNYl7
         rjUIecbZjpSBPMrmqf/uP98fUJ+AWnpdI2iuZizM7y3vjAawqhS0Zq6B5hdVH2gIdJur
         SHWoScSlDfp8KEfs/pjD3zZ8/QvKC9tCW3I487ba4tH4dyvZUttrCeL0KOyaSVjRRfiM
         MH7ni5F+H18518iORD79DLJOUOBRMpWzSklb2MQEY9nrJjdcfNrKULMxArQjAHqoi6qP
         yH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766922568; x=1767527368;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNAWHMFA5YJJczmfPXYxdeDSjnp+F/CH5okDVaZT1RU=;
        b=lxKvh/BH+G5ErL+RjaM99VD/NZAT39izw+t2z2N8UUlHRzRrVMd+AaH1TweP24dIxM
         FSa+z0pJQeYdZUfg7N+YwsuSKZuC0HXPShGnnQCBrc2glsLyuwUODfZ+lSCxfZ9UjlXg
         JGL5/axN9G8BzZ/VQu/7o9GIls6/NP1N0Oihg014jdLtPiOCx80yg1O/BmdHqfneN53p
         /MR9UEUeS3uAzkVyVk9JCpAUVWTixAMGY2nlJz1zQ9iG1Zfvag16ODA4jU+5Fa+EYqMV
         H10sedSVy8AenvRx8KuLITzxm+2Extfz0meg7KP3CN4e8DNvcueAbGwZK8qZmSUl6sE3
         1YTQ==
X-Gm-Message-State: AOJu0Yx2r9DeRqGDsj5/hXQeGPbBh6odfo+VghM0X6ZLUYiLYWiZNZIA
	A0j1ii2g5AClvJfK8+yrFIhWIn0tce0FW9Lfc4gKWMtEIITU11o4lHkqZihejmHTETnc6uTfd90
	aHPNLN0w=
X-Gm-Gg: AY/fxX6g10928fB+gj+jWOliVXK5aZ10SG5mKqj0c9prhIc9uGMrdbnftMIZl41tjv3
	zisXoTnfEVVUI9bopWj66zJuMoTmTXXOWrdskZobwXcVH4H2xh9+FDB9XggumLbLsz0jhGNSU93
	y2KfoORY0HpBiRR5Y0vka58RC70wLcdepBGj/NGIG18N763Wm6JAlaobPXp29gwWcSP7Uan4x8m
	G2qkkA6oWlEJZaB+53r8OTjikpb0lKeyo8Ho233VKg3v4N9iemYFMtz6Vu/7L4nrtach0NDuqbQ
	JgODJDfdxtnlQmeBYJb6rY0k4XBC41FvJQZ2xgk5Gqc3BPiL4KNc/jIIHH4wGQoEG0rLO0nHmkx
	o1+TGjOg7VK/jiFV9ccI/Mbe5RGVuHNBs3EyDnd745ZakLGQSL9d8eKSegmpdHBLJbvMMSak7mE
	c4nv/N8iTPeFSiwxM=
X-Google-Smtp-Source: AGHT+IERMdZY2nl9E8/SXS+AzKYNRRg5Fmb8OaPq9xmaT7VTKS/XjKu6sh7jbWwk7pZFQEF6KdD/nQ==
X-Received: by 2002:a17:90b:1e42:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34e92137f6fmr22278029a91.3.1766922567845;
        Sun, 28 Dec 2025 03:49:27 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7c8sm27827267a91.15.2025.12.28.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 03:49:26 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8DBFC1004AB; Sun, 28 Dec 2025 01:49:26 -1000 (HST)
Subject: OE-core CVE metrics for whinlatter on Sun 28 Dec 2025 01:47:22 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Dec 2025 01:49:26 -1000
Message-Id: <20251228114926.8DBFC1004AB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 11:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228585

Branch: whinlatter

New this week: 0 CVEs

Removed this week: 3 CVEs
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-61727 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61727 *
CVE-2025-61729 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61729 *

Full list:  Found 35 unpatched CVEs
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
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libpng:libpng-native: 5
  sqlite3:sqlite3-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  cups: 2
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  expat:expat-native: 1
  python3:python3-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

