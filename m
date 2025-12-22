Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD376E6ADEB
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87826.1766434123569911814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6nFS0ge;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b804646c718so342016966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434122; x=1767038922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ughn9bVKMMl01jdDZ0iY8pXZ57PzuBndI90x02q4Xhc=;
        b=j6nFS0ge6Kew2NGDrZVZUhcy6ZgWzU7dRkFREXxQP450BkPGgh90r1Bh0D5wf3dGev
         qK2qGGQZwxwc/pRI2Epqwi9wegAJQ5PoklFbVjKb7Q9VGfte+iKnQdiNplRvL5QZpw91
         WKiZ0557AGtenIYfxaTh9+l0trK/nmq4BnlNokpIW4F1k2D+UeenXCIlv+0oDZgSpXVy
         qI99Uvz46ex+ax/PDW9ao+EUXKPezrFEI52EfPEVKD36vSYEAqgcu0KJveZhjEtVbcsu
         acmbzgyVa82w/fbK5UKWda2VxEQ+a4zMW0bKz9VIh6KJ2KoV7Fj9h+mo4ruNGsaIhc8h
         Ib6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434122; x=1767038922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ughn9bVKMMl01jdDZ0iY8pXZ57PzuBndI90x02q4Xhc=;
        b=ga8/Duo2iRLaxCwmdlhLx6/L+xp45WumlMW24K/8PsfXMP2JN+iWQZhzg0GHWhl+Z3
         x5LTt0+MYXsE5DtrQnlrNmKaY/5x42KjzfbEB9tqOtH0891iFRAPMAcK8l9sK+U0OWMz
         yj1hmW4snuPTE6KZEKmVJA+NWDq09QfqoM7a3dGQR93xaeNj+epfcEJBTyvaLrbYt1/t
         fLAJTusft/Pn89cvWxJvCoTQGX0mxKT7LZXMAY4PbhTWOGCCqgT5Qt5a1tXeTRnInbEr
         13E2XHiOEKt2pOnaJevM//CSEAl8vy56ReT/H0k50GBAZHCe1oODAPrNyMcvb/YPKpWt
         BBVw==
X-Gm-Message-State: AOJu0Yz94Cydy9ZWskhJf5KswGNfwVK93cKQPTvl5NffKyy3thQBWhlw
	1wpC/zYf4SaNyA8M+zQNum9GxXgKURsHSMoAxDGKqaTjL6yHuHr9Rb1eFk8Jrg==
X-Gm-Gg: AY/fxX7jxoiNj3W2oTAEROBYkKLVUuGG134WvQj0GRwdPVJ7wh8CkAjcllw3RY+nZDn
	n5kooqjDLpJxViduc1PYXfJaiNqNfD/iRtYntDcG3CB42dkCzQSfKaKxKEDkgAoRLVA1txqMv1p
	RSGIWE9goyr4D6koAhqDWt+Z0SWO3gDxpTzdfJoqC0HVkNCD0OmelMIROcxGnL5PsoB9b7LbGNr
	o7iEIddLg2BGKkoP/KNYj25X2skUhAxwxWAULYyZAakk98wCMzIf0EOzaGCotHxo6O2g3RwTL1f
	KUUplqgkZHNr07dRHQh9zLNXoIYF4N8hMJA44xJuEwNml+3dIZ3eznm35qpOC0TbXIaDoNijMUx
	o1fdIO9xDxgj0MaJhzFbCHa3FU2zP1t+i/vUa+bI+8GnpxHubcd1yKR5hidvzaid6U7da/JUUpM
	gwp2IQvMbAa8i7gve4zlGfVic+Y+xQrFKbx6kNbm+vHWdqA6d6b8mVgx8TzQ==
X-Google-Smtp-Source: AGHT+IGb2BA76DJxsLDaLXiOUo7XAJbKEg0syMQGFTiDFc8JJosD2EUh0yVtneAxO0url1r9tDGODQ==
X-Received: by 2002:a17:907:3faa:b0:b79:fcc9:b00d with SMTP id a640c23a62f3a-b80371f353bmr1384352666b.59.1766434121718;
        Mon, 22 Dec 2025 12:08:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 082/114] python3-sphinx: upgrade 8.2.1 -> 9.0.4
Date: Mon, 22 Dec 2025 21:07:04 +0100
Message-ID: <20251222200739.2278706-82-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228407

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_9.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_9.0.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
index 614566b8f4..00384b40e9 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "594ef59d042972abbc581d8baa577404abe4e6c3b04ef61bd7fc2acbd51f3fa3"
 
 inherit python_flit_core pypi
 
-- 
2.47.3


