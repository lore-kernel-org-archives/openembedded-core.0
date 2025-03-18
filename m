Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF45C35FFF
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.4270.1742272733767527568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AD0clXQ3;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225e3002dffso52414525ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272733; x=1742877533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=AD0clXQ3QH0Jjdhq/3kDWm3OdZuf+U8ITR0neq+sUt1B0eAV4QSGSkbScpglXcS4xi
         hAud0MqW+6spiXNLLEsvIUITxcoRYNZ83QB0RHnTuFKMXeCKTre/ISCkTMVr1CNdQuMQ
         Osg3LitgtNZJ1BAUOR2VPg0aEqzcbGeH6hIKbzMcZldE3if/x1h45knme37mce16GCX4
         iJmgYZKCw8vCiw4O95E0FnUN9WsdT4VL4nN8AJdCFEgVVKZXGaaHsqfdgTS5OTszcPkN
         LRamLJbfiZCX8iSx94LCy/gNl19EbEaIEFKYeZ911lwYVBqs8nOOo5ewdG4nfXXCBCH2
         aE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272733; x=1742877533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=uhEsQQ9gsFHg6cZoUIDJmpoJgneUzEv86ifePh1rmHBElrwaT8BeGvGS2++gRajeB1
         faIM9Uawh4Ryc0K+CpSdHhL31+xmKTDR69sysrZc48Rs+dWL7b1rGkpC2o8xgecgdbcg
         wJET9zvBmjcZgluLQqhRF9ii7t0rx64o5/UTsKKJQ3ViYn5d9jO48hVODU4yRKOafOF6
         srWWOnO4pUlKIbT59V+Pbk+InOoheIbQsM9xydLHArpP2e1iHkIknd/1SdkMgRTVfcV1
         gIw0XtnYpnC8dJalgFhbROtHY1uc0vsHHmgFXwgYD6EQjXXVqgvlSrIJYP9f1CS5yvPp
         AHbA==
X-Gm-Message-State: AOJu0Ywum3Gx4DLAjja4RbctA4JnSCEtWBsLlZy4kKJJt3C5O3Ls5FxX
	xYPKKCmap1TuXaHTD9avIq65rNET3+nt27qAfM9LF1UVLgjRzBUupvhe/uoM
X-Gm-Gg: ASbGncug29C9JrAhCBiwEoGNIZtayFn4tQUd8c/FPGNtRSL4sIM5KZxxE6X0C6+pSu6
	A3fUv186zMObAZxoAKxBAx4eXIyBF1EFGgREN+JJqn8xGUkamVNEvuyiKRpYUNKXb9MvXByz+y+
	zzeIQ/+tyXicVzrjCM8WSnsR8xXiTMycJbGwYyYSQe8jmbqY8ofzNZIrOcZtBb0Uaq7G8AWXC5H
	NP/m/qyLMSTBkbPtnYYr0BFymzPLUHJFJiK/kQ2oywBUOHKXY57KHC0vby205ciWvflWntDo5sM
	UoqkqXMky6FgKP+iCkmpY6x19fXHOL9WzRtO
X-Google-Smtp-Source: AGHT+IGZc4Er86E+8hftoP5ZApgxkmO/elA1q2a3Y80Bd9lcMrWAkBLgkL9Fg1Zh8hIRRuGRBiyyHg==
X-Received: by 2002:a17:903:188:b0:224:1d1c:8837 with SMTP id d9443c01a7336-2262c554bc8mr26073045ad.19.1742272732952;
        Mon, 17 Mar 2025 21:38:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/24] libpam: add ptest cases back
Date: Mon, 17 Mar 2025 21:38:24 -0700
Message-ID: <20250318043846.2422141-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213138

From: Kai Kang <kai.kang@windriver.com>

It removes the installation of ptest cases when upgrade libpam to 1.7.0.
Add them back to make ptest work. And 2 more cases in libpam 1.7.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 1be3c9e2bb9..4abc52bd93b 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -142,6 +142,12 @@ do_install:append() {
 	fi
 }
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests
+    find ${B}/tests -maxdepth 1 -type f -exec cp {} ${D}${PTEST_PATH}/tests \;
+    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
+}
+
 pkg_postinst:${PN}() {
          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                  /etc/init.d/populate-volatile.sh update

