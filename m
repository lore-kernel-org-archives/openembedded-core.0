Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C373EC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YOsgnyFJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8167065wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p69E+wqsfUlNoswaoYig1ZFvdcCMgL9nvwUPkXY/LOA=;
        b=YOsgnyFJsOP40RK8kgJsfbrb7fLCDVON2mCy6cRfcZ9lEz2OtSo/RmfPnE1NkSUaDY
         iw0fEH01xVrBJZdmR5Zh9w6wcmMJjQBts264i0uoWg0PN4oXQzg6llDs2R/L+lYYybi7
         dl5bNCBZNh1vMm8T+r+VprTj85MeCPwgVXuwt6X1MRRjPm3YsliYbRdbWFvQ6/t9OMk5
         /yqRhmQP4hmkuiYjJ0tBDuhutDN+jtA6pxjQAFS27+hep2ASAtd0n7KwCtHrt1sjlcXD
         WMwKPdjggxfJ+Bv3OkeaFBJ9lzTHLTrOgcQ7h68Xp2BHvixdPeo0FOff1oEExto+gBS4
         1Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p69E+wqsfUlNoswaoYig1ZFvdcCMgL9nvwUPkXY/LOA=;
        b=Y/z8iN06kqRRd8fmYAGX5fac8lsFIr+ahmQ5UlgAPR+XsRDjaIXvkp1HTc3eSwcy8a
         Bbqevhe7ihjMFw7fr/k7htDH7TTgPApUrBjlW5DfeXeD/WYl7EeucrwoNsHrNZnW3YM8
         bKxJHArVxvgG6FjJ2DMUCF2Ql87O+H+hVrpNs+3QGmZFwrkzTWrazJXA61HEkg6hueCb
         ztQTUq15cPTLLvAP3iptqXdqPTcJPzl3elofOFN1n/+ToFHeidcnSPzYTpukjLay4WnK
         ngkxd2671fph3RLfO+BQc5eec5Ipf6e7qTaW/5poVeMfK89xQYWwwq4360VnuoiqTWYa
         d7hA==
X-Gm-Message-State: AFqh2kp509siBwK/PxY5I0BE8SqnxigrmYZ8UuCqJ10M+s+uJgu3HERn
	B2aqTkC4hXl53oDZw7XhvYY88d7UWlM=
X-Google-Smtp-Source: AMrXdXsUSqqEMOTnoKO0GlU9F5/Yki+Qy8YuPVURdcP4EVJHk1HQrtKobr+1PHezX/Nni0rsF+kmkQ==
X-Received: by 2002:a5d:4e92:0:b0:2a9:5b5d:2156 with SMTP id e18-20020a5d4e92000000b002a95b5d2156mr390878wru.23.1672830377365;
        Wed, 04 Jan 2023 03:06:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/77] sqlite3: upgrade 3.40.0 -> 3.40.1
Date: Wed,  4 Jan 2023 12:05:03 +0100
Message-Id: <20230104110548.2537259-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175416

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.40.0.bb => sqlite3_3.40.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.40.0.bb => sqlite3_3.40.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.40.0.bb b/meta/recipes-support/sqlite/sqlite3_3.40.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.40.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.40.1.bb
index 82718432b5..c9b6ca1c5f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.40.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.40.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "0333552076d2700c75352256e91c78bf5cd62491589ba0c69aed0a81868980e7"
+SRC_URI[sha256sum] = "2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


