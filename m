Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvpGL-0003iM-Dj
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 14:12:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0HCukxR006573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:56:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 04:56:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 20:56:38 +0800
Message-ID: <68cbbc6c0e944c842f603609e5b40ebb5f7001fc.1358427029.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358427029.git.hongxu.jia@windriver.com>
References: <cover.1358427029.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] update-rc.d:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 13:12:43 -0000
Content-Type: text/plain

updatercd_postrm failed at image creation time because "-f -r ${D}" is not
used as update-rc.d's option.

[YOCTO #3633]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/update-rc.d.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 3364269..83816d6 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -28,7 +28,11 @@ fi
 }
 
 updatercd_postrm() {
-update-rc.d $D ${INITSCRIPT_NAME} remove
+if [ "$D" != "" ]; then
+	update-rc.d -f -r $D ${INITSCRIPT_NAME} remove
+else
+	update-rc.d ${INITSCRIPT_NAME} remove
+fi
 }
 
 
-- 
1.7.10.4



