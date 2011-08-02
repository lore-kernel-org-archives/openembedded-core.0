Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jD-0005dg-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:21:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720Gcnj020014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:41 -0500
Message-ID: <82c3b4ef661c4df6a6df45692d9587fd31bda589.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/5] package_ipk: SDK generation workaround
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
X-List-Received-Date: Tue, 02 Aug 2011 00:21:00 -0000
Content-Type: text/plain

During SDK generation the multilib_sanity_check function is being called,
however it is not available unless we've been called from the image.bbclass.

Disable the check if MULTILIB_CHECK_FILE (also set in image.bbclass) doesn't
exist or is empty.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_ipk.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 3768889..8ecf511 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -127,8 +127,10 @@ package_install_internal_ipk() {
 	fi
 
 	package_tryout_install_multilib_ipk
-	#sanity check
-	multilib_sanity_check  ${target_rootfs} ${multilib_tryout_dirs}|| exit 1
+	if [ ! -z "${MULTILIB_CHECK_FILE}" ]; then
+		#sanity check
+		multilib_sanity_check ${target_rootfs} ${multilib_tryout_dirs} || exit 1
+	fi
 
 	if [ ! -z "${package_multilib}" ]; then
 		opkg-cl ${ipkg_args} install ${package_multilib}
-- 
1.7.3.4



