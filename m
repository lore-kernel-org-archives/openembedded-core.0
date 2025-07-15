Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56932C83F35
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5492.1752611790607976793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IQO9R6zk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3226307787so4772900a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611790; x=1753216590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFLzPJ8EtDyma4sXBu7x6Lc4LbWvkugj/cBI2KdhL1w=;
        b=IQO9R6zk41LgIykxvERA5GFfbpSm4IteVscTXeaIZY3ZqjHf+gizTT1A0/15RUc5o/
         IxuKqVsU/uMcFD1wbLg5ruAO5XU0+Ku5/0Af1dhyGkfP/oX+PfxLeUCzxLzw7BYtoSVR
         OrHWv0i9ylw788+xB890N39+2HBAOTH/YGvWB8btT0Ad8PgMU8nWMzKUOgv0gSAQ2Rxw
         UdwGzRpQ07VXY20vtxPTGL+GkWEA6ukfG/Uv4Bi+Be5bypfSMe5xDn8AMKpmLaHmrUwi
         NA9JnAl6uCTTFv2iAn+4xlATrVxbUm7HFEufiypPTbeqzvLJjZCl+vv+rDzvJ3OxXrAD
         3sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611790; x=1753216590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFLzPJ8EtDyma4sXBu7x6Lc4LbWvkugj/cBI2KdhL1w=;
        b=xC8opfqAaNRz4hcMynWbl9IW3xhCk4bTofaEH3IejqpIZ33BqD17qb431JN3yuDKpI
         i1AAIbCM5AHUGAfPJk1Lh1nZVL726iJim5kBs0k6585EmMfNcfNdXQAQrjEqXhYZKpBC
         GVVcoNb/Bpq1lhP2Nk1m6diFuAKYN54OHr3VXQGeYLhPHHSPsUo5F2mx3bDxUv/vtwov
         hazKJHNQiL2+KUGO6zBn4+twT4LGZDdIhBgryvyOl53OGzGqDckI7hI6Z1FjYyTTv4/P
         bgiB6maYhIDBZQevq2nZuMUC5/A2R8dD6ARJdWgqIAeLcnhZxsyLxnZ8Kmfupd4zzDYT
         WGVw==
X-Gm-Message-State: AOJu0Yy4YM3WsMUQeSzYvK3bapf/qObkelwGustKz8rM/7ay49epSnYf
	9eFutNXd7NLwpWT/FfrS6JJf8DzPAWwFcQSi3OFoEl8kU3Zpf4QA8dp0qcRwlcwCfgd536FV/NG
	yokxe
X-Gm-Gg: ASbGncsWwptheArEoU2xp12Jn6JXIn2vK3OmAtQojIL4pE0Ae93wk7OYOga0FlzxuIK
	cXUmXOs19W+Gzv7xe1WWoVeEUgTWmwf6WpGTKQ+1qnxBmArOXZ7b9scChca32CTsSHFXlM5cdQD
	SXJgPskrb8QA7k1PzGYil5fIn863uTdPH2AtVmCJW6/CQ14jbrAf6R9p1B5gKqhE5vkvzAWioSr
	OkqvfsBDhGVrqn/9j8X1Cy5Cd1dAoYlhsFEP2ZvBqPJSk7Y3SWLeZewdarkwmJ+/T5srU4KLVs2
	vRIBmFC1rsYvn2/ueICSQLoNE0cahIQt6YyQDVCKQu4bbmrwQnuG3s5Hyai9smBAB10LmEc2p+7
	EL2FJWU5jQZWbAg==
X-Google-Smtp-Source: AGHT+IHZHCgiZEtiTO45zREqtHQj3hAr9RKUNGTB6+Z2H3QUAFzpHmTpxIqvfI2I3AWAe2+6gVWN/g==
X-Received: by 2002:a17:90b:2683:b0:31c:913e:b121 with SMTP id 98e67ed59e1d1-31c9f4c477emr12745a91.19.1752611789821;
        Tue, 15 Jul 2025 13:36:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] python3: update CVE product
Date: Tue, 15 Jul 2025 13:36:05 -0700
Message-ID: <06f615e6939a22bc8f12b30d8dea582ab3ccebe6.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220413

From: Peter Marko <peter.marko@siemens.com>

There are two "new" CVEs reported for python3, their CPEs are:
* CVE-2020-1171: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
* CVE-2020-1192: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
These are for "Visual Studio Code Python extension".

Solve this by addding CVE vendor to python CVE product to avoid
confusion with Microsoft as vendor.

Examining CVE DB for historical python entries shows:
sqlite> select vendor, product, count(*) from products where product = 'python' or product = 'cpython'
   ...> or product like 'python%3' group by vendor, product;
microsoft|python|2
python|python|1054
python_software_foundation|python|2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.18.bb b/meta/recipes-devtools/python/python3_3.10.18.bb
index 0b57a0ebee..875b52cde9 100644
--- a/meta/recipes-devtools/python/python3_3.10.18.bb
+++ b/meta/recipes-devtools/python/python3_3.10.18.bb
@@ -51,7 +51,7 @@ SRC_URI[sha256sum] = "ae665bc678abd9ab6a6e1573d2481625a53719bc517e9a634ed2b9fefa
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
-CVE_PRODUCT = "python"
+CVE_PRODUCT = "python:python python_software_foundation:python"
 
 # Upstream consider this expected behaviour
 CVE_CHECK_IGNORE += "CVE-2007-4559"
-- 
2.43.0


