Return-Path: <fred.w.bacon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD57D2ECE1
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 20:35:23 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44218.1768854915238720376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 12:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7ipoyJh;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: fred.w.bacon@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a32bf0248so33690016d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768854914; x=1769459714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+SGl1ajY1MQr87GZEA8TV/dve+U72SlqQU/EaBZk80=;
        b=l7ipoyJhoLW+4YKe437TVCz/LdPOcOJnJ0bVQlumSeL/dssEW6UceOgaNY1swrFHEE
         dkAWzfWwljUQjbnZW4RvQDPiBZakBm4+3UN6E9xOJhi834uq9FebdQqExuxN2Wtkw5/n
         HjwWaQeumGVqiaRS8+4GkaGFUbH4y70aok6oxPOYI0JwoHGHkQBtwM6L/hMr7ew+zMVI
         z6jwLzri45pnxGrjMjZRjcn3aV7z7tmYLgcG3q+ftEFM4bmhXjcqaZAT99ROpbyb8xAb
         ZT3Jwd6rbQNQCO3SI7t8L/CPdrLsWb1RXQQaUZ86Y4Bf5IKeCMrvx0BO6xhIjNkbg/Eo
         uVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768854914; x=1769459714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+SGl1ajY1MQr87GZEA8TV/dve+U72SlqQU/EaBZk80=;
        b=ZtLjIESo863CO5/UGDMUZtXU4tMd/dwKdix3+OJLb5lWE4x8sjXplgIxBm/w4oqg2b
         GqnDmDhZZjIiasf/nbA55Z+vj9FcGiuVaA7SBlI76+vFnu4wwm/BEhXyZ0THi/xWyQOs
         5Y2Af7nJFTOlRQ1G6jWrp/VCs5cknz4z+pNN5ybBBxNtAMQMMWmj1+WuGYmO/UDU+S27
         wzHxYybjPWMTuCzGWojHUQ0s23o4j3jYNhyAthYCg1N3/WmzVHvhQcgmPI/NTLo0W/zj
         +6cIncMIg8Gs56AvNlYNvEzu40JGlofq4hWXJhN37reHirm6wtb/NGW+d0eo6kzbwlPP
         KKug==
X-Gm-Message-State: AOJu0YwYNtCLUjg1SZRxi67HVuUwG/Bp4d7KC6N1gtk7MzuwHvAP61h0
	Kj4Ie93PW7bLFcyZ/JeUzAtA+/HPwoQyKD9MZNw/KciCOljcJ0odREGT+gxFKA==
X-Gm-Gg: AZuq6aIkoZ9Wunny6KcBrRphelrg5RINmk71fiOsTBy26KF9vTeOpBRYRs9BRO0RFMb
	YA/WMXPyhVDhLfNrUrIxJC429Sc3T1le0CBs+RZ4+4VXLPAHJicqc5Hf3oTJBwGY7tk376lx4ch
	IKx4YHkHjHPCALrjsxdBGjvCvOhzxyuire0Fo0oDB23OspNYxzjFy3XAJJvg0kYEobFgrQTR3l6
	IX3o6dXzZjOhI2WZUoVxQIvUTv8AxaXzc58QC72XVVvoH+2LI/tz9QtnrNm9+gr8sQFvjWh4L64
	Eapsx+U98dR1UaqMIZH0ZFreeCNgSrC2n9TF7P74d/sxEeAQA4UuJM3q4gLhFxen3VMrpYCNHIG
	lu43J8bQaj/ypL+2YnKmdn5+kpTJQebrP1Y3sN2XbkEx122olfaV8zoL/posZ9qMEozmnEcwCjq
	ei4jUHKfg+Fi8bAZr+F7rGtiGY8BMXi29SaA==
X-Received: by 2002:a05:6214:2301:b0:890:9420:99bd with SMTP id 6a1803df08f44-8942dd9eb54mr149194896d6.57.1768854913985;
        Mon, 19 Jan 2026 12:35:13 -0800 (PST)
Received: from rl80220dt-bacon.aerodyne.com ([208.211.193.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm91719516d6.21.2026.01.19.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:35:13 -0800 (PST)
From: fred.w.bacon@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Fred Bacon <bacon@aerodyne.com>
Subject: [PATCH 0/1] lighttpd: fix trailing '/' on files in dirlisting
Date: Mon, 19 Jan 2026 15:35:08 -0500
Message-ID: <20260119203509.3960946-1-fred.w.bacon@gmail.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 20:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229634

From: Fred Bacon <bacon@aerodyne.com>

Backporting an upstream bug fix for lighttpd's mod_dirlisting. 

Fred Bacon (1):
  lighttpd: Fix trailing slash on files in mod_dirlisting

 .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.74.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch


