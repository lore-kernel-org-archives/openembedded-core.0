Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14054D74942
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9468.1766114565791379402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1GI95gh;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1148872b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114565; x=1766719365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueKtgkCEoWQsMJCFgU8KmXMC4cyRBhsS4RQaC3gv4DM=;
        b=O1GI95gh0cQqd6NLoDD1V75KkE4OWJyu4d29FQo1wAHe5ycWhkGr1XVMZqrYPQ0lAq
         QW1mBjOZbUcZgNZN0tpTUyyOXcNFRl/TGM3GYMC5kludFpN1+VyfbSpZ/HcvNW+Jy+b6
         VxUlcWbfYoRBMj+0Fj+7Kvmglfjz6B0IMDWw+BVcEaU2yUADB+vPF7MM5lwxWCcOdVu6
         9yvFHT8hkjvfjjBngN/7eYMxBTytVaF3ROC09YIgnl5IA4Jxnkbl/jkKlB+QSuvzU1Im
         kBGmNxbn26QVKir6sgwmZmFXINMsXN+gl7PS21ymZNkcG2VQplWMvpueD/jq/QBA9do8
         bVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114565; x=1766719365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueKtgkCEoWQsMJCFgU8KmXMC4cyRBhsS4RQaC3gv4DM=;
        b=hAL2E9M6kdnp8DgMLLxTU3YFrWi7/uvbRVj4XjrTfOqAMLNPH+G0ViPPmy65t3A83U
         zdxH2XCNxeiB5X1rILjgjFDY4x1PgKeE7uV5k2L9ojllmT6H71PgzBjqCjytnsQ6LDld
         npfpIvJ4NU5POTkZsJIt/81ZEteGeHgGjN7XbFZd0E8/YogYR2xGiKxqTtCT5qQ/cMEH
         6n2DKhGalMUu+D77YT8BeNJn+dgxc+oXYWrTPEPDpI/ieTJ5TFWGGz99V8q/W9gk1+UB
         8ko61XxqpQq3X1uN/F8q7AhSAD6bfqv+elTgl+4hW19y0CoC6423m4mI8B+T07DavcQ/
         Duog==
X-Gm-Message-State: AOJu0Yxvoe4iiGjxuHQxyudpu3zfcFemxPW19HY5HZqxbkzUoU52H5BM
	45UPSph2BRswerOcMJneWLTgTEV9A1x0RTmHVrK66koE3sgGaujYofw/bqHbeA==
X-Gm-Gg: AY/fxX7KJKYyXeU/cZBhMlvfCsuoJxobDCEf7B1If1A29a1eoPpOGzYsrl5FFkoQwer
	cfrPE8dj6ehNzUAYpymZNfhbB08aTjsRAqFZPjCCK6DjGBSVkSyJKeLaVVjHqPIXzXMSS/pB36s
	uCWA8cU3BT0RrM9Gu1w9VYqolmNPm55ROLKXHrrhWExTPe1JvmJZztE71aVXUodexcW9TwJVy08
	jqHAIfKhAwt8DbaVG7iCPhTLxfkOhQLMhjDANIXxr6L+qBexK7QCtkOd21nroEu4khmufCrblnp
	xA3qss9tTg7G2Uh1YlNNkruR+6+Ge+GY+ni0KvU4fFSb9rOlELu7SSK88ed931WTyqEIUG/Gb8+
	AtI1f0WcdwC8lt3SG2HppAepk5pHDchZZ18CMNyTQlLueqMdmS39Ackj72eIMwSLDOBh9zBBpTQ
	Rq5jvN2xYtIHjqxM4gLZQGJuju
X-Google-Smtp-Source: AGHT+IFhZMzdLb0XlxtoCfu3SuBa0a4LFzH/PE/iJsznrUtpsOXY1j42sZYxxWxo5TE2VfsT/hcxJQ==
X-Received: by 2002:a05:6a00:3021:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-7ff648edfe0mr1451625b3a.23.1766114565025;
        Thu, 18 Dec 2025 19:22:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 11/29] gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:50 +0530
Message-ID: <20251219032209.960840-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228179

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03b4d82e774796a5b89f435af0d26f532bfbf962)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
index 4adbc982b7..9ba288a410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 

