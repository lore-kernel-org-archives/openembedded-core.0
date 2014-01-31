Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4586E98A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:15 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id l4so3193429lbv.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=OQgEtGh7Ee6Lzb0Hl93+/DL6Y0li4Jryl79ztQwHGF4=;
	b=onD2lm6G99MxAs7LfK+iPm6tq/io9KU72YJs2lnsgIIB6izfKT3n4+POZVTkyuihO6
	RKIzO+wQf8Tod7ZAjVdXf4uYAI9ukqkUKM8eW3xgJOTX/8/C5fncU4tKqjpyq0f5EA6t
	oDJ0ENdp2PgrICwasYw1zf4+jZ+oRDiBFJoZxWlYWJs6YHWeK420jXe+urtW/it+Ce06
	qvPwljqR8Gwm4zfuh85dhd/dviFSPvW8nYxXomY0rHibPB9RSKKuuTf6aXbfCewKuyky
	NEsEv0JE8uGVTVqAiXbPVNegI4enfqa6oRmnmb8w+v77vAgHdtZKYMwCG5jr/kF9QJb6
	BvwQ==
X-Received: by 10.152.27.133 with SMTP id t5mr96580lag.66.1391160616556;
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id wt2sm9534799lbb.2.2014.01.31.01.30.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 734BC1C6024; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:30:03 +0100
Message-Id: <1391160604-23629-5-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 4/5] nss: Add nativesdk to BBCLASSEXTEND and bugfix
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since shsignlibs is used
from the nss postinstall hook. It should be included in 
nativesdk to make offline rootfs construction possible. 

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/nss/nss.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 9a21976..a6aeed8 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -37,6 +37,10 @@ do_compile_prepend_class-native() {
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
 }
 
+do_compile_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
 do_compile() {
     export CROSS_COMPILE=1
     export NATIVE_CC="gcc"
@@ -73,6 +77,11 @@ do_compile() {
         OS_TEST=${OS_TEST} \
 }
 
+
+do_install_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
 do_install() {
     export CROSS_COMPILE=1
     export NATIVE_CC="gcc"
@@ -193,4 +202,4 @@ FILES_${PN}-dbg = "\
     ${libdir}/.debug/* \
     "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


