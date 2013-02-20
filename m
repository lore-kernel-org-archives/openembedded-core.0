Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U7xd8-0004DE-A5
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 01:34:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K0Hdx4011608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 16:17:39 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 16:17:39 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 18:47:32 -0600
Message-ID: <1361321252-14982-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1361321252-14982-1-git-send-email-mark.hatle@windriver.com>
References: <1361321252-14982-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] libpam: Avoid wildcards in the SRC_URI
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
X-List-Received-Date: Wed, 20 Feb 2013 00:34:16 -0000
Content-Type: text/plain

[ CQID: WIND00402802 ]

Remove the wildcard from the SRC_URI.  This causes problems when you .bbappend
and add a FILESEXTRAPATHS entry.  The unpack task may be unable to find the
files to unpack leading to an error.

Avoid wildcards at all costs...

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 93c98c0..011769a 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -11,7 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3"
 
 SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
-           file://pam.d/* \
+           file://pam.d/common-account \
+           file://pam.d/common-auth \
+           file://pam.d/common-password \
+           file://pam.d/common-session \
+           file://pam.d/common-session-noninteractive \
+           file://pam.d/other \
            file://libpam-xtests.patch \
            file://destdirfix.patch \
           "
@@ -30,7 +35,7 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
 
 CFLAGS_append = " -fPIC "
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-- 
1.8.1.2.545.g2f19ada



