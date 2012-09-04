Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T8j7y-0007kK-2x
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 04:44:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q842WBvl022193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2012 19:32:11 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 3 Sep 2012 19:32:11 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Sep 2012 10:32:17 +0800
Message-ID: <cd7f775fed1c56e909480087dda6d54849e83a31.1346666634.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346666634.git.kai.kang@windriver.com>
References: <cover.1346666634.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] msmtp: disable libidn support
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
X-List-Received-Date: Tue, 04 Sep 2012 02:44:34 -0000
Content-Type: text/plain

When libidn has been populated to sysroot but rpm packages are not
created, build msmtp will check libidn support automatically and then
depends on libidn. But package libidn doesn't exist, build image which
includes msmtp will fail with:

| error: Failed dependencies:
| 	libidn11 >= 1.25 is needed by msmtp-1.4.24-r3.i586
| 	libidn.so.11(LIBIDN_1.0) is needed by msmtp-1.4.24-r3.i586
| 	libidn.so.11 is needed by msmtp-1.4.24-r3.i586

Disable libidn support to fix this issue.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 08566ca..13de167 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
-PR = "r3"
+PR = "r4"
 
 
 #COPYING or Licence
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "f19f3fcc67da448420b3adbd5add09f8fe110664dd64f3c2cd693ef0cb
 
 inherit gettext autotools update-alternatives
 
-EXTRA_OECONF += "--without-gnome-keyring"
+EXTRA_OECONF += "--without-gnome-keyring --without-libidn"
 
 ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
-- 
1.7.5.4



