Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 8074B6C7E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:06:51 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id B3201940225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 10:06:49 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 10:06:59 +0200
Message-Id: <1379923619-27142-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH/RFC] autotools: handle dependency on intltool-native
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
X-List-Received-Date: Mon, 23 Sep 2013 08:06:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

autotools' class can use intltoolize but has no dependency on it
which can leads to :
/test/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/cortexa9hf-vfp-neon-oe-linux-gnueabi/gnokii/0.6.31-r0/temp/run.do_configure.7559: line 179: intltoolize: command not found

This patch fix this problem by adding the dependency on
intltool-native which can be tricky as it triggers
circular dependencies very easily.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/classes/autotools.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 883eb06..eb988cb 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -16,6 +16,7 @@ def autotools_dep_prepend(d):
                         and not bb.data.inherits_class('cross', d) \
                         and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
             deps += 'libtool-cross '
+            deps += 'intltool-native '
 
     return deps + 'gnu-config-native '
 
-- 
1.8.4.rc3


