Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0472ACCF2CE
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4618.1792236253139185971
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ImeLEaVP;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso342257f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236251; x=1792841051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtCDaxGuuo2TgiX6VvOMfwPKUNOvqntvfcwsSCZ/5mw=;
        b=ImeLEaVPT6DXcGDx4mWauCp8LxDZ0zsOpUbEC94LxALn4RnHa2MRDdpnQ5DPAhqEMD
         zR432l53NetDM8qGwBFMXN7jfS5QVdxcqsGLPqeTOIz1KLymjxiWLbgSEKX8osUJeRtn
         CPcAXDITcV0hWVyXzmZLrjXiKhrCKyRvowcUV6ez87NCoKsJkJdRX15phOzK9JMXJ/Yk
         1RY1wKcp7/xCZOSqMqouGQXXfM+KkXy6cHswJB/KOSVVecW7t2TrJctXDgEVPc4OTCqB
         QEctlURUvyAPTZ16dfVKexAlSj9JAxf/Uo4y+kU5GMVCCcmGMqZ374Y46YxunXTPuSkx
         TvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236251; x=1792841051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtCDaxGuuo2TgiX6VvOMfwPKUNOvqntvfcwsSCZ/5mw=;
        b=nqe0CkBJZAburJTsbsls8jXSNUrVkO5FzlwyqRH6kgBEAuz74ZN3NpEsOQsh+8G3M+
         QelMx8bvYwU/7gU2X6M4tFYCBd7nbH5s4iC2FN0jj6lwZlEe8Gy+sCxQZrnqNEZQ7EWT
         mwH9X+JifoQe4xKFs6sge2UZPcteWEOGlK3VUUN9ibNUcpZ8sNZUfHwHRQytLjY29CG4
         7Oj0md1udfYKJ/tLASbQUfZqMCaYuZjZiIxf1aa1Lo2z400VMslxzml6GxuxtAqjw3aM
         MD2aJ4QXQlerDrmZtAVKARI77Siy1xBSxKmjvbdE978ds1HbRa9+4oExtkjhzQ75N5Wy
         af9g==
X-Gm-Message-State: AFq9FYJWPS5MOgwRE/1gTNNHaRQRW4Hp4pU0xcwWbxbNMuAC4obyocYq
	IOMGRQt2NNV0Axt/DcUYM1zDVL8uDVHyyfD0zklOFJ+k1EpaoqkEeY9hl+gBFipl
X-Gm-Gg: AYBFou0/jprHpdo0/Elu69HrCfN0qWLTdysvTdkSiENO5sIueHRyj5WgHRhPq6WEurQ
	PBmi4QFofp91B7a16VVYLCcMvnhPOsUHFGl52cy9fOvxLN/jYQF9+pcULG4BeIV5dqGSon0JYcJ
	hDXBMyCpMnWzU9VOBPsWe6yhBdXx+ZyIwgBmV09gAoLp1ChIfLrsGJThb8YhFQ4C8D5BbgzPf0L
	Q8j4hkTmAY9Z/JpAeoEFO6P6ubBxg5nrlfxff8tnVj4maPxdqmV0nGuJMoCrlqwnXfqefWwh3do
	XGH1KNZ9xd1t74PsQ0okW87Q5aWpWgMvZhfJ0oZunDsTXGknlxiw7NIA9ic6DShOaloHIRg9NI4
	/y4vzgyBqVmjP55U28J8gAR2Iw32jkr6YIDHpkshDuGnL+FF5u6nL6n0MPKwcgy5EWq1Z1RM3eZ
	8hOSm1gbHxkU7nqCn7MFYNbBaVmBY6/CRVRQloYH97aEQbgh5Eubukl9b04omKO+cF1ZamISrXP
	N3a
X-Received: by 2002:a05:6000:22c1:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48e07f9f421mr4431559f8f.26.1792236251170;
        Sat, 17 Oct 2026 04:24:11 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:10 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 5/8] tcl, tcl8: anchor the musl unixInit-3 skip to top-level SKIP lines
Date: Sat, 17 Oct 2026 12:23:54 +0100
Message-ID: <20261017112358.77434-6-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248084

On musl, do_install_ptest adds the unixInit-3 skip after every line of
run-ptest containing SKIP="$SKIP. A SKIP set inside a case arm then gets two
lines between ;; & esac, & run-ptest fails with a syntax error before running
any test. The next commit adds such an arm.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb    | 2 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
index 6e8a97c729..77b6270f22 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
@@ -85,7 +85,7 @@ do_install_ptest() {
 
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i '/SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
+	sed -i '/^SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 2094c9935a..9199f635f4 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -86,7 +86,7 @@ do_install_ptest() {
 
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i '/SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
+	sed -i '/^SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
-- 
2.43.0


