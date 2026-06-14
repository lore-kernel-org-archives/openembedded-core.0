Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C3CCD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105060.1781424267871569668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KTLG+pMp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be03d47bso23103305e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424266; x=1782029066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENsBGOc9IZ09iUEThmkDv08fi9NTRSL0YQQJ9/ADH1g=;
        b=KTLG+pMpebRcYgdYJVHQkvjIik1YzGboYi8cG9ljhJvE8fQ2itsZgr6PU6uCyjgip1
         YoiAkRM8+Vtsg4lVw5MCv9Pt66SXSZIQYsfDugXSPC4LeBT3Sr9e5+TivO0LVwODX0r8
         Mira7G2NjaIqV+zJPMEbZNb9uFEs9w7EQosAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424266; x=1782029066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ENsBGOc9IZ09iUEThmkDv08fi9NTRSL0YQQJ9/ADH1g=;
        b=Fff5vjG71rc/uIh5/pG4RR3wNjOKjjRlAKnCwm/6Z9RYVWAFwJuzpP5kKHTEmliXBU
         qCxB+JNaCPSBgaPKRbtdx1CHR210nzfiNbuXJ3IVi4fRql/eO77SdIuO9B3NrTVndDNt
         +6JX9NEucH9eLakvevGDWG9BJupfEGRxrNoETYqzYPlh8imC3MbNNJsFd3F4GwLmHk4H
         IuPnAGx4/0bQwwupVcA1VUKB2yC4MHewlSC0T5Svi2FwYV5rhL6IFIhNSPqns+9EZMCm
         zUsb/C05nhIJhq/Pmhpy8Z7xdj6wmjiDJOdujJ6HQNZ43YAlW6ZRLmJfr9bS1nzs7uEt
         NzfQ==
X-Gm-Message-State: AOJu0YyQMSNGyLSmYPdABGNXhqhNNSWw+S+ekhA8+8/p1qDhtij9FFjp
	JJqbn9K/c/RUU08kErxr9jBA3TGqtoi9Zw1ZrCsmyKYty4Q+qrLY63F+sJV44uF0L7qPkuK/z/M
	2nHKx
X-Gm-Gg: Acq92OFcIVb31qp1yWTyawfFHD2TfZOAZfv/clNJ9ZRqRU7PywJenczP4ZEQDivAwqi
	WibqNqqFQMtGoRC2Bm/8F6QyMFsyf2uRPt9s3JL3i67t+P1E06yOSAZEioiZg5n1seeFlYQBP//
	urnurGCxDOHYKgJE32yTpNs3NAqBh9HLxh9OFO+4VkdUpYDyNsi9m6kn66YObwvKphQHL29poZI
	owjauKurrW2VyCUMcACVkscPJu4gSJwxCJMIqLf+mPNCcH3OC8NnPr5BryMd9Hhth+ZAOZeSHXk
	opJ+iBKCECn6FG1QhcwSmgmSdz8uRTDr5Q+6QLwscLlUUz7DwqasJ+DIP0aIVP8cv+KyfVCqZ0b
	f2eG9lME2Mbz/vvQsvrmZkgqU9z9D4oVYzz+0pvlMU9Vx9HJazYHLguKsAs7a9onFu4RRlGiD2E
	eZW9Lb52ayzVY1yu+D52qj5DhJ6P0U8XGsLSzR1Qt/711UA2ZWJazn
X-Received: by 2002:a05:600c:c059:10b0:490:cf76:dea4 with SMTP id 5b1f17b1804b1-490ec4bfa54mr85529165e9.2.1781424266093;
        Sun, 14 Jun 2026 01:04:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 50/56] ttyrun: upgrade 2.42.0 -> 2.42.1
Date: Sun, 14 Jun 2026 09:03:01 +0100
Message-ID: <20260614080307.4017177-50-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238734

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ttyrun/{ttyrun_2.42.0.bb => ttyrun_2.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.42.0.bb => ttyrun_2.42.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
index 811a4da70a8..c9dd4d564dd 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "997343f8417ab0af0ceb869e7a34b23cae3061e3"
+SRCREV = "77083b1cbbd463a25cf1a94fc026b5401575bc5e"
 
 CVE_PRODUCT = "s390-tools"
 

