Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGqcJ-0007cj-Nq
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:21:27 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGqD2-0006ON-0m
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:55:20 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 12:55:19 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348660520.31293.104.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] package_ipk: Remove spurious '-i' in grep command for log_check
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
X-List-Received-Date: Wed, 26 Sep 2012 12:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ipk_log_check uses a case-sensitive grep (which is correct) when deciding
whether there were any errors or not.  But if it decides that there were, it
then uses a case-insensitive grep to display them.  This results in a large
amount of irrelevant and confusing output which makes it hard to see the real
errors amongst the noise.

Suppress this by removing the unwanted -i.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/package_ipk.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index efe299e..59cb856 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -182,7 +182,7 @@ ipk_log_check() {
 		then
 			echo "log_check: There were error messages in the logfile"
 			printf "log_check: Matched keyword: [$keyword_die]\n\n"
-			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
+			echo "$lf_txt" | grep -v log_check | grep -C 5 "$keyword_die"
 			echo ""
 			do_exit=1
 		fi
-- 
1.7.10.4





