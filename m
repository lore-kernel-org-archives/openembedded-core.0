Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7052E6B24D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88507.1766436302277440083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXfcYkEx;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso936184666b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436301; x=1767041101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adK4Neak3qQte1pC8rfLX4lyT+Shv+4mJNchsy4IaOw=;
        b=LXfcYkExhF5Y21fcZXMygE8AREQNkMogr60hkwt3vtCtSaZXKV3sa8wf7tWCMNOvCa
         ih+FpXvW72lVYeqRgBgGPHI7haUlXpHSDgdvBUkGKfmjcOXchoDen2TFl+e2SK/ra8l7
         92j6cYlZVmgUJ3bEfKHMzUIZH+kEpPNloE4HN+dhkvpuAZ+jraD88WYomZpNp9glCCq2
         wMfUWFs7fCbNuYqxy+U/H544XL2F4YSJHJZgKa087ORrYeRaN9f7HuCtPRWG5lAxkz4L
         e/q79GGZ7FmumCl/+xegBrzMrZn9yrY1+uBrKTJKgJJqDvll7NSx+UXi8Rprjq9eiKEx
         HzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436301; x=1767041101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=adK4Neak3qQte1pC8rfLX4lyT+Shv+4mJNchsy4IaOw=;
        b=uXa1BPdvSAcdrFGbgRpCkDUqczlxLtAvozVsnEU0iDCJxaKhsuABcHCX9MipIZEWcJ
         QkbR/uYYtTJqmhH+/+EYQ3KkUv8oqfqNfj66c2CXHYRiq4+TFdjkYhv3HlNfgwYFesQH
         BIWrIvq6yL1ii8hHKYG1YLJGTANiVWZN1iRjMaP5cFpdggrlxAH4VCohp+nkH8WgTvzn
         aqgU4LQhy+UelWKu4I0/PkP2kI/p9ei/O2xiTWvoOB4LeZUp4ll4nE3rBwav/t/z0c22
         Gu+kMgoBfXbnydcAz0lVm1X38v7wQWdurMlxdyu3Uo3VxlOLcXuTEZJAJYSm15o/QdaU
         ToqQ==
X-Gm-Message-State: AOJu0YySGorrNNcR0ev58NbEwQ8IRy0bxGs02bOF4lb89HkE/3JD8FeT
	zf6BBXgv/CZ3uvrEAl0xd8M12ztlVxMAH1HS8DwwuKNJS2BUgJWqjvU5kEkLEA==
X-Gm-Gg: AY/fxX6zfnN7eD/lnJCeRBy1icMqn2FzluF2ykUpbFHJj3KbdjbqMU0qSnXQRjQ5STz
	AI4jWHHegmMnZ01ZWGB3ry4a7PiQZ+4b79A+f/yx5q6xOEMhYFzO2eCxJECc0Zg7ojVii4fN/5n
	bOx0NF6jqcMBXc0fVCX40BIhwEPKHoW0cZvbtZO3Wn1+QLAbVZ1hmFKv2x5F4Mtt1ykUzZbPzJ+
	6++nICqBWCM2oylCaJkH32fVEtvwvZDXnqsAixNh2Xg7Zu7415BEblZ3yBm5HsDzOvSHWeBS1Mn
	w0W+gMqvVpO6IdzF/ORNRePOFXkb19fXIYzbUwjqUQEP73P7boj35UxoyegqkkR75allshxO0O4
	L3UhEOZZNTNF6Fo7GdjoxHbv5NrzOkCxXg1M8sqrrwtYdI2Er2G+gGwig5PivmjsgDAiEwUo1xI
	jTLkJD9Z1g5K3AcD+HBrj23Drq7wdDUt8MuzptDzmwKJ55UVU=
X-Google-Smtp-Source: AGHT+IFpB+rN5avu8meIwfVUhblQ//woVYV5ScFYPJyidqkjWTehGL4yqdTq9OuDsECb0VISMVS+SA==
X-Received: by 2002:a17:907:a45:b0:b81:ec7c:31fd with SMTP id a640c23a62f3a-b81ec7c321bmr124683066b.13.1766436300530;
        Mon, 22 Dec 2025 12:45:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/15] vte: upgrade 0.82.1 -> 0.82.2
Date: Mon, 22 Dec 2025 21:44:22 +0100
Message-ID: <20251222204455.2284529-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228429

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vte/{vte_0.82.1.bb => vte_0.82.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.82.1.bb => vte_0.82.2.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.2.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.82.1.bb
rename to meta/recipes-support/vte/vte_0.82.2.bb
index b5d6f2fb62..d5dced4ce6 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.2.bb
@@ -21,7 +21,7 @@ SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
 "
 
-SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
+SRC_URI[archive.sha256sum] = "e1295aafc4682b3b550f1235dc2679baa0f71570d8ed543c001c1283d530be91"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.47.3


