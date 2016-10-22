Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4C771B99
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 18:38:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so3540673wma.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iJEKGbynSsSRIIrxyuzvGZ4wKNQ5B/PMltn7y8G+WZQ=;
	b=mKRa0Yprm3zQwggZQNAEwiqSOvTbQ0gA+mCBnNu00TWYCUg7u3rl2ECAvTqjHDH9e9
	5ler9AAYjJd5t8r9pc+IyZwL8+HGreC4xaT/+9G2Nvf9kYotkut+y5OWDd/EiXVdNDGC
	IPsFea2oGsxhOHTw9KsjcR/pEC59bV0RHCDVlF0l+8jOChXCyvS5etuFphpZEgo/cy/M
	lOhJvzX3zHqOCN0TU/ybqNEIja/s4cqYDv78KC0RqrvmBiRqifkn6L+gOk7RJMDH2cEe
	Mw+yNRbT+VncBzPbUvQorlND4okG/4OYVGUtmNrYLiZGh+LcaM+OnHdXuNZqbhnYnEqb
	Z+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=iJEKGbynSsSRIIrxyuzvGZ4wKNQ5B/PMltn7y8G+WZQ=;
	b=dEu4+EQu8RJFxIA6AGYtOy2hZ1+o1VIP3mWgrpKZbJ1/PanGQA1z1hFwsELA8cAqmf
	EdERVKklBLy4vV/uXD0R7suxDIxQvkWamrfsY6TVqSQpvhO42wZxIFMR0zqFrgcuMvMC
	J3iXH0yDzu3vziDxeoacjpIy65NsVcNPs9H0RisJ5T4fPJ5KHrENygOKj1seBIMiNJiq
	tHIQEJppACW9FUUNYT3QV//mf1OJIoFoU5Xji8aETHWUnykczAYWXMGeGgCZRndwyOrL
	lCtvfdzpOeqE54laFpNisxqTV23Xunsrdl9/UknDSO+57447NU18HEPCW8OwEbLVPcng
	dOAg==
X-Gm-Message-State: AA6/9RmFwew8/e2Bkm7I3F6a2z89XfNfrkcgc09+cAFZtxLbOTOyrbIXABdWXQUtLguJ2Q==
X-Received: by 10.28.227.11 with SMTP id a11mr7770220wmh.88.1477161498456;
	Sat, 22 Oct 2016 11:38:18 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id y2sm9603359wjx.20.2016.10.22.11.38.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Oct 2016 11:38:17 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Oct 2016 19:38:00 +0100
Message-Id: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Sat, 22 Oct 2016 18:38:18 -0000

For kernel recipes which fetch sources from an archive instead of git, it's
necessary to point ${S} at the extracted sources. In kernel.bbclass there is
already logic in base_do_unpack_append() to link ${KERNEL_STAGING_DIR} to ${S}
if these aren't the same, so we just need to be able to override ${S}.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 25a153c..a7d467b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -3,7 +3,7 @@ inherit linux-kernel-base kernel-module-split
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
 
-S = "${STAGING_KERNEL_DIR}"
+S ?= "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
 KBUILD_OUTPUT = "${B}"
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
-- 
2.1.4


