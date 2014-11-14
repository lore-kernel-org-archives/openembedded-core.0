Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6019165C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:33:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE8XHov010591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:33:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 00:33:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 16:35:16 +0800
Message-ID: <d3cbb9c8c3bbd91fceb64ce2b645d3d0b342eb7d.1415953970.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415953970.git.Qi.Chen@windriver.com>
References: <cover.1415953970.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] shadow: use ALTERNATIVE to manage 'nologin'
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
X-List-Received-Date: Fri, 14 Nov 2014 08:33:17 -0000
Content-Type: text/plain

Both util-linux and shadow provide 'nologin', so use the ALTERNATIVE
mechanism in OE to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 14c7281..81924e2 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -146,18 +146,23 @@ do_install_append() {
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
 	ln -sf newgrp.${BPN} ${D}${bindir}/sg
+
+	# mv nologin to nologin.${BPN}
+	mv ${D}${base_sbindir}/nologin ${D}${base_sbindir}/nologin.${BPN}
 }
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr su"
+ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr su nologin"
 ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+ALTERNATIVE_LINK_NAME[nologin] = "${sbindir}/nologin"
+ALTERNATIVE_TARGET[nologin] = "${base_sbindir}/nologin.${BPN}"
 
 ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
1.9.1


