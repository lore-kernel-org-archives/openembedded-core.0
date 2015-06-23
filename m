Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA0660132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 05:13:27 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so153488093pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jqGqIbhHUVGT+7xcKpMXMSoNS37w17c9DyFGcXXXEoY=;
	b=ji9a8DiR1MKstVrB1wSoX5Xb3ExjLR4gqynyK78sFbn+R8N4JPhlC5yB4efKfEAezC
	SA/Q+colfHEeQr5FASceVGa1TX6DD7ag3fGjVXgQP3DnlJCsuojfLqycMcOsC9wMLYQ0
	N3AqtC0DxOR7JFj1Tg4wvtPwl+3LX4YoGVqVnJW7mMN1bkqhZYhmkFXlwutwXzN5Nub3
	hiAHjWwjjyWYV7xFd5jScfMZv1wgK38bPCEFnjwk7Dal9v3Q4oSQXeyIICTyB5GGxa/u
	/88DDk6CQ+6IonHDIZihksdUOH3Vgtw3Pkx1+ZnKNmcEFcGpp73FwkXNamJaZZoLzdDE
	oRfA==
X-Received: by 10.68.57.239 with SMTP id l15mr66211897pbq.130.1435036408315;
	Mon, 22 Jun 2015 22:13:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id e2sm21701416pdi.14.2015.06.22.22.13.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jun 2015 22:13:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 22:12:58 -0700
Message-Id: <1435036378-7022-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gdb: Add missing runtime dependency for python option
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
X-List-Received-Date: Tue, 23 Jun 2015 05:13:28 -0000

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
 meta/recipes-devtools/gdb/gdb_7.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb_7.9.1.bb b/meta/recipes-devtools/gdb/gdb_7.9.1.bb
index 1abc9d8..cd52e27 100644
--- a/meta/recipes-devtools/gdb/gdb_7.9.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.9.1.bb
@@ -4,7 +4,7 @@ require gdb-${PV}.inc
 inherit python-dir
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 do_configure_prepend() {
-- 
1.9.1


