Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC47739BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:34:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3Yu21024378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 20:34:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 9 Mar 2015 20:34:55 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 11:26:45 +0800
Message-ID: <441b7aef921d395c5049b74af98d875e98c0943c.1425957496.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425957496.git.kai.kang@windriver.com>
References: <cover.1425957496.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 3/3] msmtp: add link file /usr/lib/sendmail
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
X-List-Received-Date: Tue, 10 Mar 2015 03:34:55 -0000
Content-Type: text/plain

Link file /usr/lib/sendmail points to /usr/sbin/sendmail is required by
LSB core test according to Linux FHS: "For historical reasons,
/usr/lib/sendmail must be a symbolic link to /usr/sbin/sendmail if the
latter exists."

Create the link file /usr/lib/sendmail if it doesn't exist.

Refs:
1 http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/normativerefs.html#STD.LSB
2 http://www.pathname.com/fhs/pub/fhs-2.3.html#SPECIFICOPTIONS13

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
index c9ad1da..d6f3a15 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
@@ -23,3 +23,8 @@ ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_PRIORITY = "100"
+
+pkg_postinst_${PN}_linuxstdbase () {
+	# /usr/lib/sendmial is required by LSB core test
+	[ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
+}
-- 
1.9.1


