Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A71446072C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 00:45:30 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id td3so71218398pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yS0qh/cXJP5E4Qb4cecE1afV+e+Deea0GU0GTs/+yxE=;
	b=nNzzvn+Q+TJUGTy8a8TA+4rxUJuCWwoSzJF8E71m+JJVqnPKB4cei8h5SSE/g7xr6u
	z/sf/oLtjZaou1gB/TH0Sp/4kmzzqC70LH5+6ysHuR1+s/0HRPhkCD91A+CfMDeX8vT6
	rxnZgEuusZHzYwXuOWS3H3XZ9CDOTpwyPkaSkfh7mJxSwM/EvjG46ZHKgjFqAoyV5/pa
	8VD6GMeM4UZftspZIZHOEhWw9pTO7pF99DsR8xdjLi8yl4duUwJz3fVz7keHOnhB0V67
	6/+GpKlvW27ppGfKvfxWPyJAfzIrP5rjQgmrLX7HhZfxn3pqsLTJdH5d1zDcT5SGs6nY
	tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yS0qh/cXJP5E4Qb4cecE1afV+e+Deea0GU0GTs/+yxE=;
	b=dF7uH4DNszLEBWst9cnBqnypd773S4P/6NX/uMd9qjrXZ75oEMFYr2nyrR83oUzI39
	wsC5uXqWVLo049e25jGQB85Qrc2VS5k+EVeSV1SikeKIvnaYIPxizPvuJ3ywa+IGubo0
	bIU2fXkfvLpU1Up3lVlc3xzdz6hk790WRX3h3J5lihKjLuyRgRSA82fs1edrK6r8LRky
	DRMF/GD/h4mPJbJevtDEmKCAGO281pGsr6lFkstCegjaHbBjmjf0+ulgkWfu2HxH6PX8
	pFDSrBRgWAJxhPXevpsv4++h7VRJiSGm+8/6H32UthpUtU+5khK1+M7/Qyoc33sfBQ4x
	vmow==
X-Gm-Message-State: AD7BkJLhIGL8NNImPlojYmm1HFWaRZXw1whMBxIgX+Kq1drsnlg59m4RwLZEKybeWx6nbw==
X-Received: by 10.66.154.233 with SMTP id vr9mr31990038pab.66.1459039531912;
	Sat, 26 Mar 2016 17:45:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	wh9sm25582584pab.8.2016.03.26.17.45.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Mar 2016 17:45:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Mar 2016 11:45:03 +1100
Message-Id: <1459039503-5526-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb-cross-canadian: disable conflicting PACKAGECONFIG variables
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
X-List-Received-Date: Sun, 27 Mar 2016 00:45:32 -0000

The PACKAGECONFIG variables in gdb-common.inc don't work correctly for
the cross recipes so they need to be disabled.

Python support was not being enabled because the python PACKAGECONFIG
added --without-python to OE_EXTRACONF.

The recipe depends on nativesdk-readline and the readline PACKAGECONFIG
just adds an unnecessary extra dependency on readline. The
--with-system-readline configure argument is explicitly added
to EXTRA_OECONF to ensure we link to nativesdk-readline.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index ae97759..952f28f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -13,7 +13,12 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
-EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
+EXTRA_OECONF += "--with-python=${WORKDIR}/python"
+EXTRA_OECONF += "--with-system-readline"
+
+# Disable conflicting PACKAGECONFIG variables in gdb-common.inc
+PACKAGECONFIG[python] = ""
+PACKAGECONFIG[readline] = ""
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
 
-- 
2.7.4


