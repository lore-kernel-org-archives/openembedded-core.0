Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C629CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:49:12 +0000 (UTC)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57647.1790599748717376302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fhV1w1j8;
 spf=pass (domain: mvista.com, ip: 74.125.227.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df958a8272so11014745ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790599748; x=1791204548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBtWDMjCnwpHm0xSqW9YnrIbyHMtzqdzBpQd5adrtO8=;
        b=fhV1w1j8rLOcqS/37cikdLBYkPa73B87XsxClGpiZV/4n7dXK4JevqINJBGdFfgmqo
         UQxVS8h3l9ggPlkl0G6l/qt2i2DX2VXzdHam4IZhr9/W2c9rJAPfhZaoDBj/96EpqqGs
         /8KmiGCNW+nnsORXKmqb8qlNtrZ5SQ2pmk4fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599748; x=1791204548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBtWDMjCnwpHm0xSqW9YnrIbyHMtzqdzBpQd5adrtO8=;
        b=1blMbO7TuHmZ2CIJJPbGZw3zTgwJKYfx4c4nznIYWQphXsXIyUoVma/4IDzW3nWfE1
         AHnqaWDHHDcg/ZiFULsvrBYmvz6iyLB/0PqHyOADH/1NClyQGi7hQEum+PZ/4J++PMuE
         r0ABO/YLR9exfLKvNxcL79H2o7fvCqRcCelG5hp1ORwmhuMvrQrcIsrWG11Qc3A4EEG8
         10MRVza3wUZ3vhujE74O2tfHQQAIzegygqf6fU4Agj+E5U/gCenqbqEAhxaxvv70SMBp
         bJr9xKhwXZyJ9yE3r+gdaR+lmgZyQvKQjL0bk5C+5GBHhqZ5ltjHQuKdfs7fy0/ozixa
         I58g==
X-Gm-Message-State: AFq9FYLMFjw6HxKm1WLd6ex2zmwBBTJmH1KLZjhGPRgDdqvEvrUTKbf6
	E95Rt7H4CiuSgCuL12xEGz6EvS5nhfQTknLqhYVQyBAT3fhxgDnLIhCOlBwmKyyhyiHIDwCuy5C
	MZ9sZHuU=
X-Gm-Gg: AYBFou3uZYdaVnWB+R4kr1X68q88Dqiva2jMX8kAZ5UZzvdyCFx+7isQFtBGSoG/wW/
	Vig2uue0AERIrqMEDsF8UD5JGVpiXmJvew+F+bHKUIfgY9yp6BbJHgEiRRW1FpuQHweuGTccJdz
	31Zh7F0g9/mnNHzcHJ4RvCSPPfomaeoeKajvhnomTm/r+59LQS0uLcU8QWVZGgloblY4r9VyYpo
	Tu61UFPz9wFb5DoFqjWsXUAySRpNNtnbFyUTKw54RefRAWTPRiMf9K3S5GaSsH+3EteHfb4wsBe
	9AltvCwwepOkVUyqQVUZlUXXd5E+Fsoohw7FFHfksOzA4dA1OX9QxkV27T2S3l/AuwZnthYk52c
	Gzh2iM1Cu5faPoTBDDYT0zrPdzZg0zZqNK/KXD7iJXnm/VoQm9taN0D8LWxlAHv3Rn+4epFHMaC
	UOrjEPl50hf2vP4XfXhpBprJvQzXsWLSBMfs9tcMRMIuMCJO7L9MGKmpDCqutauJt2HFL+rANUm
	vvO2DTvsgyOqwhO70k=
X-Received: by 2002:a17:903:17c7:b0:2dd:ad74:ac2c with SMTP id d9443c01a7336-2df7e43e233mr112265755ad.30.1790599747901;
        Mon, 28 Sep 2026 05:49:07 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfe98sm40971515ad.22.2026.09.28.05.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:49:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/2] tzcode/tzdata: fix upstream version check
Date: Mon, 28 Sep 2026 18:18:47 +0530
Message-ID: <20260928124848.1781687-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246761

From: Alexander Kanavin <alex@linutronix.de>

The webpage no longer lists tarballs directly, but the
actual directory with them can again be listed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1486d28e70af2e297ac0a9650e782481beaa16bb)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 47f9ac2855..a09da2617f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -14,7 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
 SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
 SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
-- 
2.43.0


