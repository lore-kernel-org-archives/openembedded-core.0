Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C587BD116F7
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:17 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10262.1764310752232266036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LihiJpVC;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297d4ac44fbso14553355ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310751; x=1764915551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5Z5N+85E/lRQu9HG8LeUlkjn1G6FZVwME4MbTckpMQ=;
        b=LihiJpVCVUrE9NAGDF77ReMropEgTl1P+SY+3W1vGyVq66yiY1KOjbcpQXkPO0Mfgv
         XItxOTMz2etry0l7W+CgrPmID0jkQlw3KSabnc4M2sNembABiKjljVy5bnWWX0EgQmhz
         JtiDvVI/Fk5VMRJDUiJ7Wpi5zy2/lDohFsc8BhsddeGcdo1vZLS+PxFsizSno3YxgIkL
         1zh4Gfq3wL/bSuzfrs4qUiq92NdfxW68uS9yLT5DaKW9rQspoyoGx9RsUD1VBLVZ5v79
         32HrWXFF/1giF7CvuWjI6gvT/RApJG0cJQ7L0PdcimgcrvizhHUszF7z6F46KCC4MqZ/
         zmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310751; x=1764915551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5Z5N+85E/lRQu9HG8LeUlkjn1G6FZVwME4MbTckpMQ=;
        b=I+AnM5oaLUmy+gic3SOYVHoF61dt2dvolMxLIBSCT+bvSUXqAYtfOyVn1KR2Yo5QtI
         eWoaEJeazul28smP2q7MigzO583obgg563Mx2x5EIWpLhwmFLHzl3y9cofOFBt9M2RHQ
         kS4/GKDTL83Nn8yenNN0c9TT8P83fym+LIGjPnQWmfjFse2xhHwu3kvTuRSQhwK+AWn0
         ZLuEYXsqlmZBZcPjJ6EGWVoY3QS4QGBNYVLxfEd87VOuK9HWvi0COl/ctay39lKfrjtr
         DLDXqC+jPsW2wIc8vbkfcS3PahvOqFLOirhZU66jD1oMB4HG52AdvQGj5nPcgU5gQ3I3
         poaA==
X-Gm-Message-State: AOJu0YxZFyC5k8RVwthIZCF8+HqANkHZ6W0yVbq/j68PobgxMpy012w2
	PRBTxxudGh0QpmY4KXfBoxsxVbTULVi/SrXsAbVUloBL7H13d89sYFNPa9DvAw==
X-Gm-Gg: ASbGncvmp4+YbRPDYC9nDO+M1nHwHcBklQbPAXjM7Yj/k9hwaE7mu5LFRw3NCuoZdNx
	WJ4YOwGpPyOPwLzVMa65UQJtMS/viOv6M9VM3ln86gdJ48D8vgPhEqnJb+GU5jTiqu244nIkgvs
	YzxFGb4hu63lOGHjJuNsjLhojGKHQxyRigNgpekWyY3AeeaZt+2tiZDigUBHJHwmhslpnUGTEKQ
	eJsANig+RoAkTSZd19UCafUOIynt1yXNVrM0JuSbKVhC91G0F2U8p/+CJn+u/wUh1dKO8nVZeW7
	KajyaWqxm3ElMvnFh1R98svQ74sDUJjLTeoshnOfTnDvD+CR2JcX2gSa0U3YNXjemArwy1rEVQy
	/iW1kWydQrYu0T9PyijHZQi3AC6YpTXaGlwBmZDrO+zxp3IQoNTsjCK6AlFskOJIF1kfuIGeifP
	R07JAcZkjHIwfiQfRCEqU5Tq7e
X-Google-Smtp-Source: AGHT+IGz675S7FCKpCqCNQHiPTYMOhGqde/0Q1ineGMO5k/KgOr3zUzqAFpEHxh4XZEcWGWpy91xFA==
X-Received: by 2002:a17:902:cf4c:b0:295:6117:c597 with SMTP id d9443c01a7336-29b5e2cdb65mr377100605ad.5.1764310751423;
        Thu, 27 Nov 2025 22:19:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 08/14] lighttpd: upgrade 1.4.81 -> 1.4.82
Date: Fri, 28 Nov 2025 19:18:45 +1300
Message-ID: <20251128061851.1634479-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226891

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.lighttpd.net/2025/9/12/1.4.82/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 40abef784b..8221d30283 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840"
+SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
 
 DEPENDS = "virtual/crypt"
 

