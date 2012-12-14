Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TjL24-0004C4-QT
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 03:30:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBE2FCWf010834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 18:15:12 -0800 (PST)
Received: from localhost.localdomain (128.224.170.79) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 13 Dec 2012 18:15:12 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 04:15:03 +0200
Message-ID: <1355451303-1014-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.170.79]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 1/1] chrpath.bbclass: Normalize rpath only of it doesn't contain ORIGIN variable
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
X-List-Received-Date: Fri, 14 Dec 2012 02:30:03 -0000
Content-Type: text/plain

If we normalize a rpath which contains ORIGIN variable, the binary will end
up without those rpaths at all. So check first if rpath contains ORIGIN variable
and if not, move on and normalize it.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/classes/chrpath.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 82329d1..0c7ab77 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -49,10 +49,10 @@ def process_dir (directory, d):
             new_rpaths = []
             for rpath in rpaths:
                 # If rpath is already dynamic copy it to new_rpath and continue
-                rpath =  os.path.normpath(rpath)
                 if rpath.find("$ORIGIN") != -1:
                     new_rpaths.append(rpath.strip())
                     continue
+                rpath =  os.path.normpath(rpath)
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
                 if rpath.find(basedir) != -1:
-- 
1.7.9.5



