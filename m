Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13A257ED57
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 05:23:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F5MrRh000933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 22:23:04 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 14 Jul 2019 22:23:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 13:35:15 +0800
Message-ID: <c383309fe15b52683ac90b50d4305922c338b470.1563168887.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1563168887.git.Qi.Chen@windriver.com>
References: <cover.1563168887.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] msmtp: fix postinstall to avoid do_rootfs failure
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
X-List-Received-Date: Mon, 15 Jul 2019 05:23:13 -0000
Content-Type: text/plain

When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
This is because they both try to create /usr/lib/sendmail link if
it does not exist. So we need to fix the check to avoid non-zero
exit status.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.8.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.4.bb b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
index 888c1bb..bd8552c 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.4.bb
@@ -25,5 +25,5 @@ ALTERNATIVE_PRIORITY = "100"
 
 pkg_postinst_${PN}_linuxstdbase () {
 	# /usr/lib/sendmial is required by LSB core test
-	[ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
+	[ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/ || true
 }
-- 
1.9.1


