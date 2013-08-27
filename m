Return-Path: <pabigot@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id E337C61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 19:59:24 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so6300885oag.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SgSfQwPv5lDD4OE1nnFwGrVT9X6IB7vBdlRlNMFxRa8=;
	b=OUs8IQ63yoOJoOTYSXBD1k/nXmSpmXRuX161oTZTIJEMo9mYXg49yDfXIBcknci/T4
	5dslfPKQrNKm+WsoqtVOZ6Gw6z4NytYBrpSwULsQYDPfWL3KhiYtEYzYUiCvRwM1xXkm
	YaNM3nFF8yEpFtOWGhDboQN43qjcTMPoGBPIadSyPGWaXRVCYD/cVRmyd9aSRWJnHA+o
	w2OlG/naEgdr8SILz40JrUVC5n8P6ICBafgAw1AMqOcyc2v3xtssnygO9+pnBeSzrsp7
	52rt3z4w3r24Z90SFFzqoKhn0HzXYM3xE5n60g8zLvEAM6XJeL1ewZTpQo+CkRpf8UKr
	HC6A==
X-Received: by 10.60.44.193 with SMTP id g1mr7908802oem.47.1377633565249;
	Tue, 27 Aug 2013 12:59:25 -0700 (PDT)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPSA id ru3sm21692208obc.2.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 12:59:24 -0700 (PDT)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 14:59:11 -0500
Message-Id: <1377633551-11880-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] oe-setup-rpmrepo: add native sysroot so nativepython can be found by env
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
X-List-Received-Date: Tue, 27 Aug 2013 19:59:25 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

This avoids the following new behavior resulting from the create_wrapper
fixes:

  llc[11]$ ../poky/scripts/oe-setup-rpmrepo
  /usr/bin/env: nativepython: No such file or directory

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 scripts/oe-setup-rpmrepo |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index ea885f6..917b98b 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -90,6 +90,7 @@ if [ ! -e "$CREATEREPO" ]; then
 	exit 1
 fi
 
+export PATH=${PATH}:${OECORE_NATIVE_SYSROOT}/usr/bin
 
 $CREATEREPO "$RPM_DIR"
 
-- 
1.7.9.5


