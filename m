Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D2B46605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 05:13:53 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so153538886pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 22:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AwLGJ6LPWuFiSCoMPxFDmi8N/x/IKo/BAxzFEc1FSjg=;
	b=XTpoMGkDUcc0y9JlifcfLAl8QSKwZaa3X7F5lK8IQwduDqHKRXroU0RNIG9xxCXOoZ
	cmBrwqlFl9IzOl6W52AQncULYO+V0zWY3pXCBUZR84TTrn44wKRJOkxSi4yqI1LjoJib
	Zp5za5hA+DcKpnWfNtAhCQLUw5FYY6IrFi94sA+WY/axQVsL3GgQjWFFyWVk3dccAWya
	GiqSQphPhTmHUjAQ4RM6c0TVdAp6eeTdE6o7DvyITC/EsnOhRitphVR/VPcyKCaJnn4J
	JFPzW9+IUiALpN2Ss4qBelBQDLLGs6FMalYWi412seQO9nIrXihjHuqqi83T9U047olH
	4blA==
X-Received: by 10.70.55.165 with SMTP id t5mr64740734pdp.102.1435036435060;
	Mon, 22 Jun 2015 22:13:55 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id q5sm21691781pde.56.2015.06.22.22.13.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jun 2015 22:13:54 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 22:13:41 -0700
Message-Id: <1435036421-7070-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [fido][PATCH] gdb: Add missing runtime dependency for python option
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
X-List-Received-Date: Tue, 23 Jun 2015 05:13:54 -0000

From: Andreas Oberritter <obi@opendreambox.org>

With python enabled, gdb refuses to start without core
python modules:

| Could not find platform independent libraries <prefix>
| Could not find platform dependent libraries <exec_prefix>
| Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
| ImportError: No module named site

It also complains if python-codecs is missing.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_7.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb_7.8.1.bb b/meta/recipes-devtools/gdb/gdb_7.8.1.bb
index 1abc9d8..cd52e27 100644
--- a/meta/recipes-devtools/gdb/gdb_7.8.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.8.1.bb
@@ -4,7 +4,7 @@ require gdb-${PV}.inc
 inherit python-dir
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 do_configure_prepend() {
-- 
1.9.1


