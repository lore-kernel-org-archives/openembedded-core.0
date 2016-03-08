Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4445731E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:49:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u285nv6E017764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Mar 2016 21:49:57 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 21:49:56 -0800
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Mar 2016 13:50:18 +0800
Message-ID: <1457416218-21537-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] avahi: restore rlimit-nproc tweak for avahi discovery
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
X-List-Received-Date: Tue, 08 Mar 2016 05:49:57 -0000
Content-Type: text/plain

Looks like we are still falling victim to:
   "chroot.c: fork() failed: Resource temporarily unavailable) = 57"
So we restore the removal of rlimit-nproc in avahi.conf, and could
receive return value from daemon process to start avahi-daemon.service
successfully.

The original patch is from
<https://github.com/WindRiver-OpenSourceLabs/overc-installer>
<commit 1ee34b64b676c79d71e1a9f2fb5dfa80d3616714>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index faa8ee8..65bdf6b 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -63,6 +63,7 @@ LDFLAGS_append_uclinux-uclibc = " -lintl"
 
 do_configure_prepend() {
     sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
+    sed -i "s/^.*rlimit\-nproc=.*/# rlimit-nproc=3/" ${S}/avahi-daemon/avahi-daemon.conf
 }
 
 
-- 
1.9.1


