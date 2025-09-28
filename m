Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226C6CAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 11:02:36 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.30449.1759057353622184359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 04:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rx14P+/R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27d2c35c459so29302615ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 04:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759057353; x=1759662153; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIec7WpFNok2osx5JghgWr7Ex1dWkoxPprW/62KQmNQ=;
        b=Rx14P+/Rz6B6wXr4lQ162dBkb1t8wEZbjeU+PQmpFdk3BVGsb8zz16dYgKlnqt+847
         tWvYlfBmaqUp55abhKqVOBuumV8jHmMyNeteS64fXu6xl1CdY6gKxmewKrIz+kkfWjz8
         UsLLSsmpK8nfTmdxk1eR81WCYXNSbU8lmIC05HQhO0Tr77F/PbG7VsMtKiRCT56hIZXh
         vQ5sFRqZtGy1z2SDaWMTpcVjDrYtH/cjcuwvtf+3WkQa1Cb0Nv7giLKKCgtRBHPj0syr
         Xr4Q9+WU/AYzQSk0I/CdA+XWCf8WuRWkWUDVF2Vzoa5e7uc+Lb5T7SaqoKdlYfN7NXCS
         6fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759057353; x=1759662153;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RIec7WpFNok2osx5JghgWr7Ex1dWkoxPprW/62KQmNQ=;
        b=jVvZzlHJjbjRqLhDNlYHzi2uH4RJJo6KJNzaOaVvYBmADfsuvB7nRtHGYOdq3O6n87
         nrKvxmVrGf6hcXTH0OYZ8zvisMKrzqgidNjhZ/825eGYAfHMoqH3l9ono8hcQXGHxcQI
         MYuTF7PCFWhbsDuScXsVLmz3/7ejEVssHcvOjq8uFDnm9dl+w5crXQdKGqwNwf+1v636
         uEBsBxIk5qVu2q/2G5gcGiQZnRPHUuzHnAxyOkTk7TkP4XIBGPIAGkK4Voppy9A3jBN5
         JyqU/MgHMCTbWSzmOvb/Cr5jyKY/niPlc3/a/IdRTiEweVj2z80bDukkhhwWaPPYUmy0
         8UDA==
X-Gm-Message-State: AOJu0Yy4jCCMWkNPWptgeWVISDxhdcogiGLlexx3/l5B+2e6UZpQu0DB
	jJoKuwPXfLqCUjXMorpI0ULUxQ1fLrLzJ/NwQoPeB8mbkaZvs6MDG283yftsV4tQKwb4UJkstMv
	rSzdl
X-Gm-Gg: ASbGnct79WaRyuQeLQ4QotauVHHHce2iGT8mYO4Z0vwI7ouml4Qx7umey+isTtSZMiE
	PbD3TcSl1xc5NoF+rzqfUwDHlYI7wFsV140IxKrCkOoVrJtImlu1LFQDLRNc9Sn/jRISM46o0fQ
	pm4oFlYIyI68x6HDil7XE/lErdz1djdY2njWlVq3Kybkkj9dh2l+hlVkESBKnRTR1nfv6rueHu5
	Mr1tTh6/NILPlHjb1E1lT1Au0lIKidfbuOnM4LdaPNinsCFLUFFkDT5Sr8AzOnfuGX4ENJrD87Y
	psVrUQfqIyO0pEPq18uEDvsWGM9AmRH5HoNR0w3uJuS0fcVFuN7yNYuV1+rSuIj4sAfGJ9XIrUF
	4wL1EIGgd7+X6mIRw3QUqPZI3SvrwitPbkLn57AUNQHqACZUy
X-Google-Smtp-Source: AGHT+IFKj35i3UIpDbzf0g4XVXeGGBQEaCsQYXiUFD26M0wyUtkB4qHfBgjTBpiz8BFTLhDrPd/vBg==
X-Received: by 2002:a17:902:f711:b0:267:f121:6a88 with SMTP id d9443c01a7336-27ed4a464f4mr154374835ad.42.1759057352540;
        Sun, 28 Sep 2025 04:02:32 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6712214sm103370955ad.41.2025.09.28.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:02:31 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7BA6910031D; Sun, 28 Sep 2025 01:02:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Sep 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Sep 2025 01:02:31 -1000
Message-Id: <20250928110231.7BA6910031D@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 11:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224098

Branch: master

New this week: 4 CVEs
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Removed this week: 0 CVEs

Full list:  Found 30 unpatched CVEs
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
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  ghostscript: 3
  sqlite3:sqlite3-native: 3
  tiff: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

