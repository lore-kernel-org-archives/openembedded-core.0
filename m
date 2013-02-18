Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7aLm-00087U-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 00:42:42 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1902662pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 15:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=uwKp6SyLaLL26Z+0KSMerApIydbxeZVit5yVWbP8COQ=;
	b=N6RPpKwOBKtHq9pq3ZZTXxT6O5keUSru3Lix6aHPGhH1SZJPM9mP1UMeb4I15juRpl
	UhOP7r842F9PYxhaHtxwoVHXTpEcnOT7cJYVtebYxbGwYkHBDz19Vat3o9j5qHaU7xi+
	WuoA9OEz8utEkdgP9XSpa1b9yKWKQx78ktIIdLIr3hT6eYqdOIMXtL+qleDkm9gf9XOp
	7KZHNmjNYI+/eCau1xI00UyNtxd+uZ8Md+eTtXUmuFc/hJ3K5eyj5AJJ17ee8+Qs9+2l
	E8SZ9cmME+r/jZKgT3q0KTwG1tPTHRF2bSfItssjmEwz+YuK0nfmgLGsnKe4bPmmGvqn
	aXog==
X-Received: by 10.66.81.166 with SMTP id b6mr40252349pay.7.1361229973200;
	Mon, 18 Feb 2013 15:26:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ri1sm15805105pbc.16.2013.02.18.15.26.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 15:26:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 00:26:08 +0100
Message-Id: <1361229968-9068-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [RFC] sanity: use lsb distro_identifier
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
X-List-Received-Date: Mon, 18 Feb 2013 23:42:43 -0000

* distro_identifier returns lsb_data['Distributor ID']-lsb_data['Release']
  which in some cases is different then lsb_release -d -s, e.g.
  Distributor ID: Ubuntu
  Description:    Ubuntu 12.04 LTS
  Release:        12.04
  Codename:       precise
  But we probably don't need to sanity list each point release in LTS
  and sstate is already using distro_identifier as prefix for native
  sstate archives
* This will need update to SANITY_TESTED_DISTROS (at least
  s/Ubuntu 12.04 LTS/Ubuntu-12.04/g etc), that's why sending as RFC
  first.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d3bf05a..94c6ce3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -280,11 +280,8 @@ def check_supported_distro(sanity_data):
             f.close()
     else:
         # Use LSB method
-        import subprocess as sub
         try:
-            p = sub.Popen(['lsb_release','-d','-s'],stdout=sub.PIPE,stderr=sub.PIPE)
-            out, err = p.communicate()
-            distro = out.rstrip()
+            distro = oe.lsb.distro_identifier()
         except Exception:
             distro = None
 
-- 
1.8.1.2



