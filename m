Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58F0165C91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 03:37:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAA3bg1a024154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Nov 2014 19:37:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 9 Nov 2014 19:37:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Nov 2014 19:37:41 -0800
Message-ID: <43a231dd40dea2c983adbdad32f3cfc4bf22a918.1415590624.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415590624.git.liezhi.yang@windriver.com>
References: <cover.1415590624.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr-native: Set CONFIG_SHELL to /bin/bash
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
X-List-Received-Date: Mon, 10 Nov 2014 03:37:47 -0000
Content-Type: text/plain

The apr-native provides usr/share/build-1/libtool which is required by
the recipe such as apache2-native. If we don't set the CONFIG_SHELL to
/bin/bash, then:

1) If we build apr-native on a host which is "/bin/sh -> bash", the
   interpreter in usr/share/build-1/libtool would be "#!/bin/sh".
2) When we re-use apr-native's sstate on a host which is
   "/bin/sh -> dash", there would be errors.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr_1.5.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index 17dddbc..49a08b0 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -86,3 +86,5 @@ do_install_ptest() {
 	cp ${S}/test/testall $t/
 	cp ${S}/test/tryread $t/
 }
+
+export CONFIG_SHELL="/bin/bash"
-- 
1.7.9.5


