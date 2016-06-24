Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B60AA731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:58:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c82so4002953wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i+IFObYHBSTN4OvO+ufTcCEjrlUXLwpOckkOvL+bFik=;
	b=AObjyTYmIBAZko8ekym31L4XOqr6kt8VaWXW7qxMZHJP7LBdS/AZpVMKXfBq1bTyUc
	AYPEjUmMceLSJ+eGm9M7PDTIrga1x48SJIyToOE6uoZMVdUW7aFV+G/yZYKfGX/4S817
	ksm/hPbweI6BybOtT45rTemzGKPo9L8jihHwQQYx84/fRk2z5jZifDJpTZSN0MUpGULJ
	vIViJzFiuOoChOuaiaF+5ohmOjm0/CDEJA3jExxK4kSzlgu/N7hScqNqX2KTWjwCtDmD
	KNGRbrYa9PeUI3TFZGWcIohX8bUJxiaM4xde98hL+aGJ+ezknIMIRiZqG3L+mJ7TJD0x
	L6Wg==
X-Gm-Message-State: ALyK8tIduZu54BGwuS60k3xcyGwJ2v4vgAkOy50d+9GqdZGPq68B7gNZgQpgjLCR2okNeQ==
X-Received: by 10.28.71.74 with SMTP id u71mr5734776wma.0.1466765914531;
	Fri, 24 Jun 2016 03:58:34 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id q69sm2574157wmd.4.2016.06.24.03.58.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:58:33 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:58:29 +0100
Message-Id: <1466765910-22989-3-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765910-22989-1-git-send-email-git@andred.net>
References: <1466765910-22989-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/4] libffi: don't compile in mips16e mode
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
X-List-Received-Date: Fri, 24 Jun 2016 10:58:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

libffi contains hand-written assembly which is not compatible with
the MIPS16e mode.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-support/libffi/libffi_3.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 72e25fb..42ab108 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -23,4 +23,8 @@ inherit autotools texinfo
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 
+# Doesn't compile in MIPS16e mode due to use of hand-written
+# assembly
+MIPS_INSTRUCTION_SET = "mips16"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


