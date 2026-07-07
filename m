Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA4C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:00:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168980.1783407602708596128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QvayEsD4;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383adaa461fso2021597a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 00:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783407602; x=1784012402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1mOPSqFFM1akz0qsMdK7kbpwsnjhjKbzNzMjjXUofk=;
        b=QvayEsD41JU5g2nEu/VJCK8u9CMXvWCffDyaVaNDkG6y8JsWKVKlYAnVhnt55B/516
         AX5GmYm5uUV59wSaj9esON9kM1U1iWA1M9h4zdVVWYj5DtJWB0MFLOG2tGr18tW9Hpl1
         ucosdERimogF0yS5THvlLG0Afr1NAKzDVgnEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407602; x=1784012402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1mOPSqFFM1akz0qsMdK7kbpwsnjhjKbzNzMjjXUofk=;
        b=oJJK/8j7obTO4s3wrv4DWQBVfuSrG7bJGZajVcQ9mKEuYDx+PDt04lN2QsCO4Xk4xR
         L3B5iWFwUf9C+qCJ/0G0MUEuV+zUCXuA84OJXbhALgh6F2AhzEDuEevNlHRWeHfNLtBn
         SjUvdPcFx9TacYpUAt/KyiFCOeumqr6sOocYr1UcHxIoTZO40ebhvxOyYg9K+aqen6+Z
         hJsAocB3bkHdJgq8hvxgy+VDH9h/i/qEB2O/XVozR9PFq1i5wz8VGN3yFEirbu4bMH8d
         QMgoBxdMLzUGDrTIyZGMHIQaStzz0qkX9P9SlVgWDna6J6XCHePA/s75VWzKSxgGyhyU
         TdBg==
X-Gm-Message-State: AOJu0YyOU4K3Ar0UdXgtAOue2ceb3UzDIEWBSsiVW4MKSZ0/tlKos3lt
	O37NJwWqHauXaKzLeksXZDvt0PGNFKkho4h/wRMYL0HOqs5EvDJIWfNmxvo/Knlb1L61X0topE1
	377jiaw8=
X-Gm-Gg: AfdE7cnNZjh+A4VVihmnF1l3tz0nY/LBtiOOB3ZXWffkxE4bHWr/e0vBMhV2jzp5rWg
	dkGl1EJ7tNYWPSe4CzxTVNqizc0XDp2nBJD5FPNNiJ5NBRDzTtLyMNkC4VgJKbF5onZK6ERXqhL
	R1dhMhYpKz014eURFgOi5awsCFnGAFC0STPYJqpCbecstTZcrcqdQirWxSywmACRT7+DWUdMFBh
	Jvu8eNWRmq+AaCLhhB2EqYsiXVct0E8QY7x3RayAB2MzEXUPbHZ1hCIDZgehD1ai0OMD33n3yfp
	5urvIUz0uJdXlTk6YNBr/wuIjVKf+EMT9PxVUIlZkzpUYH+TiYN6y6tetUq/9ZatdJZsAYePooD
	VOmHaH76wIqGbTLitMt1N4xd1OeZ+GlzZgpzJskPLi5ZaAXJOOWqgn2c8YbWWZUdkvF0iWmRTsb
	NPO2ES/2tmpm/OqCDCJd2D5gY=
X-Received: by 2002:a17:90b:5350:b0:37f:9cdf:f03d with SMTP id 98e67ed59e1d1-38757894fc7mr4017224a91.32.1783407601995;
        Tue, 07 Jul 2026 00:00:01 -0700 (PDT)
Received: from MVIN00030.mvista.com ([49.34.103.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm5420255eec.5.2026.07.06.23.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:00:01 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] openssh: upgrade 10.3p1 -> 10.4p1
Date: Tue,  7 Jul 2026 12:27:51 +0530
Message-Id: <20260707065751.162157-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240360

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
[1] https://github.com/openssh/openssh-portable/compare/V_10_3_P1...V_10_4_P1
[2] https://www.openssh.org/txt/release-10.4

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssh/{openssh_10.3p1.bb => openssh_10.4p1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.3p1.bb => openssh_10.4p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.4p1.bb
index a050475532..7d316eec76 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
+SRC_URI[sha256sum] = "ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


