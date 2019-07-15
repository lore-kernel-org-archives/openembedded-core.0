Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75DB77ED65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:23:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F8NOia005618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:23:40 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 01:23:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 16:35:38 +0800
Message-ID: <dd3704e36450d2ee53f1b62d77763ff68c882907.1563179644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1563179644.git.Qi.Chen@windriver.com>
References: <cover.1563179644.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] msmtp: use alternatives to manage /usr/lib/sendmail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 08:23:49 -0000
Content-Type: text/plain

There are several packages which all provide /usr/lib/sendmail
when lsb is enabled. So use alternative to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.8.4.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.4.bb b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
index 888c1bb..0f10500 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
@@ -19,11 +19,10 @@ inherit gettext autotools update-alternatives pkgconfig
 EXTRA_OECONF += "--without-libsecret --without-libgsasl --without-libidn"
 
 ALTERNATIVE_${PN} = "sendmail"
+# /usr/lib/sendmial is required by LSB core test
+ALTERNATIVE_${PN}_linuxstdbase = "sendmail usr-lib-sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_TARGET[usr-lib-sendmail] = "${bindir}/msmtp"
+ALTERNATIVE_LINK_NAME[usr-lib-sendmail] = "/usr/lib/sendmail"
 ALTERNATIVE_PRIORITY = "100"
-
-pkg_postinst_${PN}_linuxstdbase () {
-	# /usr/lib/sendmial is required by LSB core test
-	[ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
-}
-- 
1.9.1


