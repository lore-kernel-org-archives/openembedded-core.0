Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ8Pp-00038N-QV
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 03:34:10 +0200
Received: by pwj9 with SMTP id 9so1087796pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=eEgZR09s3KiO3EA2QGJTRpZtxkSRcD+ROsGSjNhJSKc=;
	b=vU5PBwYtk2Jp8+aVQ4cCdWSnuDyP9tqEm2+E/vnPWjAlcqBl/bKv7ST0nIz5fehwSK
	8pT7ZRvp8DDri/UPCTddlh8tnEdjLys1+1QJJzsDRr9NI1ycUAn9eLPNvYt5YjWK5eGZ
	32vGOfTm6NUCNugZInf9LHCHaIx1VANQswDeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VoyIHetr4RZDSWBKBJsqEhKRHm17bdQPo1ve4GWp5j1ANnfbiE/mnmup53L7o2Q31O
	megFrGLy/Bv8kFDjjBd4LWjt/Ne3iQNVtaW5P2JUw+OanKXsfpWtMDkCqa1463CdN1HE
	9jH5F1+LXCDx9U6M/yN33JzE4uhRSqdDUMbJM=
Received: by 10.143.21.42 with SMTP id y42mr425397wfi.294.1306546258911;
	Fri, 27 May 2011 18:30:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k9sm924996pbc.54.2011.05.27.18.30.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 18:30:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 18:30:51 -0700
Message-Id: <1306546251-8236-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] package.bbclass, prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 May 2011 01:34:10 -0000

Value of USE_PR_SERV is either "1" or "0" looking at
settings in bitbake.conf
USE_PR_SERV = "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) or (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
So we compare the strings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package.bbclass |    2 +-
 meta/classes/prserv.bbclass  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a1b9482..1e6a872 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -330,7 +330,7 @@ def runtime_mapping_rename (varname, d):
 #
 
 python package_get_auto_pr() {
-	if d.getVar('USE_PR_SERV', True):
+	if d.getVar('USE_PR_SERV', True) != "0":
 		auto_pr=prserv_get_pr_auto(d)
 		if auto_pr is None:
 			bb.fatal("Can NOT get auto PR revision from remote PR service")
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index de46ff6..18b8589 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -12,7 +12,7 @@ def prserv_make_conn(d):
     return conn
 
 def prserv_get_pr_auto(d):
-    if not d.getVar('USE_PR_SERV', True):
+    if d.getVar('USE_PR_SERV', True) != "0":
         bb.warn("Not using network based PR service")
         return None
 
-- 
1.7.4.1



