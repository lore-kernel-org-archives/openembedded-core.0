Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 087F170100
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:58:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r201so4030530wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UnSGWsIdcPEYNnhaFEeBp+lafC67yduhoakThfFJO/0=;
	b=KrDyxMzIMi3gv608sauQLF+K7p/Ut1gh1EKLbAqX1/EjSCvH+muXKV9e3AbQ1n1KKt
	E2ytBLD70iIx2vB6E7jBAqHjWJ0DKa4kIhCTF9aYp5Dg8X9WpqEpp51p+KQVaEuTgz4p
	INnaT02fvkPnlXLwTyf0EcCwqfxrQZZCVjYgj1fXAz65MauCXfKydeZaiuIHU9ojKjlc
	4Zr0miu4y/lRf+TzBWLGbsv82Mz/r1LI/n3fZDkAA4R3eGUySghgfWvqW2IOC3I0Xs/V
	kc9ii2Q4uB+6La79I2PC1qYhq/NkkeYY9JeR+Ec0xIY+xaWvn1vX+EEUUZOhfAn1gp+8
	i4xQ==
X-Gm-Message-State: ALyK8tIYhRUJKy1bdWRF+tImkB/3bxQ529/OrD6Vy15InA+8srmOg43vA5GhPLE59s9TDQ==
X-Received: by 10.28.111.215 with SMTP id c84mr5162656wmi.21.1466765913467;
	Fri, 24 Jun 2016 03:58:33 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id q69sm2574157wmd.4.2016.06.24.03.58.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:58:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:58:28 +0100
Message-Id: <1466765910-22989-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765910-22989-1-git-send-email-git@andred.net>
References: <1466765910-22989-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] uclibc: don't compile in mips16e mode
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
X-List-Received-Date: Fri, 24 Jun 2016 10:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

uClibc contains hand-written assembly which is not compatible with
the MIPS16e mode.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 57f87fa..02cd8d1 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -63,6 +63,10 @@ EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 CFLAGS_remove_arm = "-fno-omit-frame-pointer"
 UCLIBC_EXTRA_CFLAGS  = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
+# Doesn't compile in MIPS16e mode due to use of hand-written
+# assembly
+MIPS_INSTRUCTION_SET_pn-uclibc = "mips"
+
 configmangle = '/^KERNEL_HEADERS/d; \
                 /^RUNTIME_PREFIX/d; \
                 /^DEVEL_PREFIX/d; \
-- 
2.8.1


