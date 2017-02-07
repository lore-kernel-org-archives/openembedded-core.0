Return-Path: <dev@codyps.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 05B9465CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 20:22:55 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l66so99651312ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Jta4nYy4w4Jr/zD07597EjdOtf13P36+meH593skxQY=;
	b=Y5i3N9TUDByGzBWOHnvE3VYK8AQLqc+Gx75SzgqX5nTLJOHOXnjIiq5hj1C6+aA/+J
	Xl5hhaLaAflU6G20kGn2lbIh7c24HDGvNirvLcKvWiL1BLO2e2SdYaPgCdO82S6t2QQo
	OQG7O2Z3x3bXn6IAIJlVunaKn2hHoNVsCyyRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jta4nYy4w4Jr/zD07597EjdOtf13P36+meH593skxQY=;
	b=niP0iiCMYejbTBcHByhZh4N8Vzo23Yp94spFblhyy/GQsTDtxE0BsHUeuDIwofAENP
	WD3vcBju2hQG1tlSBgByH0lDd5kqMWE6JBhbQMb2imH++c06gMoYgT3C3niR+KBpCuar
	QyKiZfNaXGPwJ24nKbv9fR6BrGE3+oXDwvY3kxKynX34WxkO35/VM0XLoi/Avyye2ptq
	oJQk+DkjCyew9P7oYtbnJ4gp/8nx5pKj28haG3yFs6MMOSBa/ALcV5B6l6azU5til97i
	/t/lCaGRUadlS1LCz/qwjJquSjnkrfrhIU0Dej0/bz+VOrCCFQvdSZISY2nK1jWTTGgU
	5Shg==
X-Gm-Message-State: AMke39l9ZTK5EJyTxMsUn7vbKSgad6l/xbDhZSSTHgwqj3Whf9SuapHAdamyu6J3VRDHVQ==
X-Received: by 10.107.189.197 with SMTP id n188mr6370015iof.88.1486498976167; 
	Tue, 07 Feb 2017 12:22:56 -0800 (PST)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id k6sm10086943ioe.1.2017.02.07.12.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Feb 2017 12:22:55 -0800 (PST)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 15:22:47 -0500
Message-Id: <20170207202247.853-1-dev@codyps.com>
X-Mailer: git-send-email 2.11.0
Subject: [morty][PATCH] gdb-cross-canadian: Depend on nativesdk-python3-importlib
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
X-List-Received-Date: Tue, 07 Feb 2017 20:22:56 -0000

From: George McCollister <george.mccollister@gmail.com>

Add missing dependency on nativesdk-python3-importlib so the imp Python
module is installed.

Before this patch, running gdb from the sdk would give the following
error:

Python Exception <class 'ImportError'> No module named 'imp':

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: ad00a31fbe93e073a2d83616efcd08c5a7ef37c9)

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index e53081d0c0..3ff1989538 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -14,7 +14,8 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
-                         nativesdk-python3-codecs nativesdk-python3-netclient"
+                         nativesdk-python3-codecs nativesdk-python3-netclient \
+                         nativesdk-python3-importlib"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.11.0


