Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UUyI2-0008Sf-E1
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 13:55:23 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3OBbN30020761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 24 Apr 2013 13:37:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UUy0p-0004r7-E1; Wed, 24 Apr 2013 13:37:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 13:37:21 +0200
Message-Id: <1366803441-18633-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9575
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] systemd-systemctl: parse unit files more correctly
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
X-List-Received-Date: Wed, 24 Apr 2013 11:55:28 -0000

Old script failed to parse unit files containing comments like

| #Alias=some-alias

or whitespaces like

| WantedBy = foo

correctly.  Patch changes script to interpret keywords only when they
are at the beginning of a line and ignores whitespaces before the '='.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index d71c7ed..8abbdf6 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -78,8 +78,7 @@ for service in $services; do
 	echo "Found $service in $service_file"
 
 	# create the required symbolic links
-	wanted_by=$(grep WantedBy $ROOT/$service_file \
-		        | sed 's,WantedBy=,,g' \
+	wanted_by=$(sed '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		        | tr ',' '\n' \
 		        | grep '\(\.target$\)\|\(\.service$\)')
 
@@ -97,8 +96,7 @@ for service in $services; do
 	done
 
 	# create the required symbolic 'Alias' links
-	alias=$(grep Alias $ROOT/$service_file \
-		        | sed 's,Alias=,,g' \
+	alias=$(sed '/^Alias[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		        | tr ',' '\n' \
 		        | grep '\.service$')
 
@@ -114,8 +112,7 @@ for service in $services; do
 	done
 
 	# call us for the other required scripts
-	also=$(grep Also $ROOT/$service_file \
-		   | sed 's,Also=,,g' \
+	also=$(sed '/^Also[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		   | tr ',' '\n')
 	for a in $also; do
 		echo "Also=$a found in $service"
-- 
1.8.1.4



