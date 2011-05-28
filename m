Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ9ZX-00047t-Mv
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 04:48:15 +0200
Received: by pxj25 with SMTP id 25so407946pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=eEgZR09s3KiO3EA2QGJTRpZtxkSRcD+ROsGSjNhJSKc=;
	b=jEKMRpssU7Kn2Thwz+9Du2qc2Z2/RyIOijD4Z3K249l6BvvD0CFDR/v7i2QolhKj/D
	DZxJzG4wf+KTQpNeAU5TFzVT/gb7TIWlUuvOi2SzpQ+vpamaxg/l6GSWGlP2jR0BxxR9
	cGe8SU2y2dUl4ijCp50TcK1Yu0HZ57/+LJHV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OyPn/4E+Gg6v6jpemC2tK7uyM2SXGE7lJs1sGP6bTuObY1UY084v3GspYcW0QT0b2V
	jKxnhCVeRx5KgdEiL8yB1+RG9fIPB1mmnZrUaoOm9jz+s5sQFp3qTpRZp+4kPFyB/lFF
	tIofTrGcs1DIPkMcy5B9U6yJfhyeC/GPHvii0=
Received: by 10.68.15.102 with SMTP id w6mr1109573pbc.494.1306550705635;
	Fri, 27 May 2011 19:45:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g1sm378591pbj.19.2011.05.27.19.45.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 19:45:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 19:44:57 -0700
Message-Id: <7c83be4418db5dc23614761dd34a2887c44828b4.1306550616.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <59c5261bea00cac9498a176d40e1aaa05da15a55.1306550616.git.raj.khem@gmail.com>
References: <59c5261bea00cac9498a176d40e1aaa05da15a55.1306550616.git.raj.khem@gmail.com>
In-Reply-To: <cover.1306550616.git.raj.khem@gmail.com>
References: <cover.1306550616.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] package.bbclass, prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
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
X-List-Received-Date: Sat, 28 May 2011 02:48:15 -0000

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



