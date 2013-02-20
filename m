Received: from mail1.bemta8.messagelabs.com ([216.82.243.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Javier.Viguera@digi.com>) id 1U8Be5-0006KO-3O
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 16:31:45 +0100
Received: from [216.82.241.196:32097] by server-10.bemta-8.messagelabs.com id
	42/FA-24231-127E4215; Wed, 20 Feb 2013 15:09:21 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-46.messagelabs.com!1361372960!34626611!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28685 invoked from network); 20 Feb 2013 15:09:21 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-2.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	20 Feb 2013 15:09:21 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Wed, 20 Feb 2013 09:09:20 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.297.1; Wed, 20 Feb 2013 09:09:20 -0600
Received: from log-cln-jviguera.digi.com (10.101.1.79) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.297.1; Wed, 20 Feb 2013 16:09:18 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 16:09:17 +0100
Message-ID: <1361372957-38860-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.1.1
MIME-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>
Subject: [PATCH] base-files: fix 'dash' expanding '\n'
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
X-List-Received-Date: Wed, 20 Feb 2013 15:31:45 -0000
Content-Type: text/plain

Dash's 'echo' command expands '\n' by default, so the '\n' is not
included in the '/etc/issue' file.

Use 'printf' for portability between different shells.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---

Probably also worth to be cherry-picked to 'danny' branch.

 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6a3db50..e7a9d82 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -129,7 +129,7 @@ do_install_basefilesissue () {
 			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
 			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
 		fi
-		echo "\n \l" >> ${D}${sysconfdir}/issue
+		printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
 		echo >> ${D}${sysconfdir}/issue
 		echo "%h"    >> ${D}${sysconfdir}/issue.net
 		echo >> ${D}${sysconfdir}/issue.net


