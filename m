Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 20B116A65D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 06:41:09 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf10so1063905pab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ngin4L3oGN9H5tlieMV8VMjSUef50OoWHrjxRxKaBVM=;
	b=qioGDmxLERdUPKk5CCw1GP7kCW0HeQCYflZ+BIj3UUcfvJLD0FzL+rI5d3GXX6EIrl
	8V7hIuT6LAzdrnonweRYTg0ZtYbD+s5846HahOJNhS0lbFzj6EhnYtCiV+ITynfW2qYr
	INyPELmYcyW2/uAP9sJaRhND/MIZqcuiF+tdhQpHcdE+8SMPVSvpqa7kHz3b839UoT10
	q3DH5NuZhy5RnBYFZTujDpXyGOufbQ1/gJPJp05ZTxl1GibMW2LCuVmNXzQVOzT0wnzH
	VHXIJGD20cdcxJlg8yvUh9DlKa3QroM4TBy8/6oshTtqf/hNpuvMTzbsm9MYX0Lg7lLb
	tSfg==
X-Received: by 10.68.129.100 with SMTP id nv4mr36688321pbb.178.1370500869983; 
	Wed, 05 Jun 2013 23:41:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 6sm18463846pbn.45.2013.06.05.23.41.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 23:41:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2013 16:54:44 +1000
Message-Id: <1370501684-26590-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] classes/qmake2: export QMAKEPATH
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
X-List-Received-Date: Thu, 06 Jun 2013 06:41:09 -0000

QMAKEPATH is exported so that qmake is able to detect the webkit module,
load it and add it to the QT_CONFIG variable. The detection is done in
mkspecs/features/qt_config.prf which reads the qmake QMAKE_MKSPECS
builtin. qmake will read QMAKEPATH, append /mkspecs to it and prepend it
to the QMAKE_MKSPECS list builtin returned. qt_config.prf will then load
modules matching modules/qt_*.pri inside each directory in QMAKE_MKSPECS.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
index 8b9861c..03ad2f1 100644
--- a/meta/classes/qmake2.bbclass
+++ b/meta/classes/qmake2.bbclass
@@ -5,6 +5,7 @@ inherit qmake_base
 
 DEPENDS_prepend = "qt4-tools-native "
 
+export QMAKEPATH = "${STAGING_DATADIR}/qt4"
 export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
 export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
 export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
-- 
1.8.2.3


