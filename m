Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Inj-0005dE-V9
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 22:33:15 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so416557dal.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eMHAQL5cDCAFbInSZhiwkum3aTQdKgpwvUkHh7D9nvs=;
	b=bIZpew6MPIDkV2Hy2JnLVRa2fPGYTh5FkunVe2rn/7BN6YqhPxhFGY1FQFA2De2ugm
	O0/WejtsTaum8VGieCTIE1otfCfaFw+jQCCS34mDkOkTB1nDXDzg7nZdTzNLMUgWJ2A+
	boKthVPbtqlzYV9HOB39Vs7YetF8Q2U7cHdT00wJtUc4vSx2WaO3D8rkonSJ2v8gADbo
	4yaSjMNRcUJ715OSMV9uiAceBNm+9al9nyBKKENJ2ncAgF6bNmHLmvwmH+CHR+Gnn4dl
	6NWj77P1J1VvPLeZ/bMs4ZyW6iprpzOZzjYcgfc3Trw4jvlNYuCR935KAyhAGSU38o0M
	CvoA==
X-Received: by 10.66.77.200 with SMTP id u8mr6006386paw.43.1359494246989;
	Tue, 29 Jan 2013 13:17:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d1sm9755202pav.6.2013.01.29.13.17.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 13:17:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 22:17:20 +0100
Message-Id: <1359494240-11040-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 21:33:16 -0000

* as reported by Enrico on #oe
  11:06:50 < ensc|w> JaMa: might this be caused by dc78ef91a2bf01efb8028c9afbe69e506e016265
  which checks for 'd.getVar('LICENSE_CREATE_PACKAGE', True)' evaluating to 'True' for every
  string (including the default 0)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d4ebb26..170bdd9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -7,6 +7,7 @@ LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
 # Create extra package with license texts and add it to RRECOMMENDS_${PN}
+LICENSE_CREATE_PACKAGE[type] = "boolean"
 LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
@@ -102,7 +103,7 @@ python do_populate_lic() {
 
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
-    enabled = d.getVar('LICENSE_CREATE_PACKAGE', True)
+    enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
     if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
         lic_files_paths = find_license_files(d)
 
-- 
1.8.1.2



