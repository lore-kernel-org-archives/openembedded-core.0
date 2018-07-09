Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7B760722
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 10:49:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s11-v6so10470635wra.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QxDmp4+ictQmHRcHjWdVzepSgWHlHrUKUAp04XrgEno=;
	b=EvkpbxrZ8wM53ynwy7pMj7eb107xXm2yZQLtYE4Do7b4CHaQSAftYxNCFaM1g/WmJG
	tecxcPLzE/dcDxSE/t5CqmD1T4xLxV3/Z5WtqU36Dfp/81FKHGxfv7RksZVG0Ub3TTL9
	gKFdy2z1icxOxlI+QVqwglauqdKnelrhdKfPj/+oHJtvRjy/RrmR64fngq+uhhQQpr3H
	q8+6Un+uJjRgbfjuUpXKJUX4BsvemYmDh3WaqWdoYp+u9yRLQPpnOx9+j2fajs50SE/l
	FCQ0ENDHOW9ZzOG7XbKOChhmJ/doJQum73YmbwdFWlxHSFae8eZ0+U/n8VaGHtnDKTmg
	7SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QxDmp4+ictQmHRcHjWdVzepSgWHlHrUKUAp04XrgEno=;
	b=fXGmk138cI1ZeQlT3Zt40bDpHpwGPLJ3uGzc9phC1wyDSB+5N3PFs10gxtzZClxDKD
	NiG+A1ay00RGu6qtzZ9ikXFbH28rYpe7xexqIsxO9jRFX5Y3sHLUfCyWVyVXEtQojl+a
	dpLG3XEznhIdQElFVRMO8X228oukxPZ+SmxGQsXGCneYbyo3HCcgh56EFt/veWWMQsSY
	+PBCl7Xe465irndKb29eBo+nwySoZ/0UDIPsNfvXK0oSGYbfh9I3LjK9JNPeD3YJ/B9W
	vOE8S306yowhb8sZm4SBGFwgEfJ7sMmOBEFzi2wCgrtfC1ofRG4gRUx2RZ/x8QsWYucd
	rOTQ==
X-Gm-Message-State: APt69E0QlO6XFW1y6TEILUlMX/nsp2RFLUqO5o+WPfx2QyEJBd+Yqodo
	e4/CMYzDpXFvKez2KJ2WnzeO1Eng
X-Google-Smtp-Source: AAOMgper9F/qaX6rNaNIq29t7G1RmeaKtvvn2Qw3ggT5aP54QDgZgFS0dOPLeVXZXlR0AP3i/xmAXg==
X-Received: by 2002:adf:a86a:: with SMTP id
	l97-v6mr14800720wrc.164.1531133346705; 
	Mon, 09 Jul 2018 03:49:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j11-v6sm11008775wrr.37.2018.07.09.03.49.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 03:49:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 11:49:03 +0100
Message-Id: <20180709104903.24496-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] distutils3: pass build arguments when doing a clean
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2018 10:49:06 -0000

We should pass the build arguments to setup.py when doing a clean, because
sometimes the arguments are required for setup.py get started.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/distutils3.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 99ad64d287d..d4b92a3bb26 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -10,7 +10,7 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
 
 distutils3_do_configure() {
 	if [ "${CLEANBROKEN}" != "1" ] ; then
-		${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean
+		${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean ${DISTUTILS_BUILD_ARGS}
 	fi
 }
 
-- 
2.11.0


