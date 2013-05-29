Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 881C66A621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:03:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF3rRS014333
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:03:53 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:03:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:09:47 -0500
Message-ID: <1369840203-21898-6-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/21] libpam: Avoid wildcards in the SRC_URI
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
X-List-Received-Date: Wed, 29 May 2013 15:03:50 -0000
Content-Type: text/plain

Remove the wildcard from the SRC_URI.  This causes problems when you .bbappend
and add a FILESEXTRAPATHS entry.  The unpack task may be unable to find the
files to unpack leading to an error.

Avoid wildcards at all costs...

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c355634..73a8f88 100644
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
            file://fixsepbuild.patch \
-- 
1.8.1.2.545.g2f19ada


