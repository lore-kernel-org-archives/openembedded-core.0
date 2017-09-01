Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39F5E7848B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 07:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v817hJ3k007548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Sep 2017 00:43:20 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 1 Sep 2017 00:43:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Sep 2017 15:42:31 +0800
Message-ID: <20170901074231.22477-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] acpica: use update-alternatives for acpixtract
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
X-List-Received-Date: Fri, 01 Sep 2017 07:43:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

acpixtract is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:

| file /usr/bin/acpixtract conflicts between attempted installs of
  pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20170303-r0.i586

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/acpica/acpica_20170303.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
index 12dfc6da3f..e712ca008d 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -27,6 +27,11 @@ UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "acpixtract"
+
 EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
 
 do_install() {
-- 
2.11.0


