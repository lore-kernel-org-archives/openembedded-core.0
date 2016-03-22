Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 211936FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:13:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2MCDV18031018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Mar 2016 05:13:31 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 05:13:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Tue, 22 Mar 2016 08:12:44 -0400
Message-ID: <6939ceb54a8286cd10b36abdceb703f3c551bc32.1458638728.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/16] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 12:13:32 -0000
Content-Type: text/plain

The build paths come from debug mode, and GConf is effectively
unmaintained these days anyway. So explicitly disable debug
to fix build paths QA issue.

The minimum still keeps Glib check and assert which can result in
crashes if bad data is passed to the API.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index feaf080..76fca14 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 
 S = "${WORKDIR}/GConf-${PV}"
 
-EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
+EXTRA_OECONF = "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=no --disable-gtk"
 
 # Disable PolicyKit by default
@@ -27,6 +27,7 @@ PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_libc-uclibc = ""
 
 PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
+PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=minimum"
 
 do_install_append() {
 	# this directory need to be created to avoid an Error 256 at gdm launch
-- 
1.9.1


