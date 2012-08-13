Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12BM-0005eh-Cp
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:28:16 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 689063042E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:16:18 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:15:04 -0700
Message-Id: <e82c2f0b91611f3e755985bb8d1608ca5792e825.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 689063042E.5450A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 23/32] utils.bbclass: add helper function to add all multilib variants of a specific package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2012 21:28:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is useful for the scenario where we want to add 'gcc' to
the root file system for all multilib variants

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index fde8f44..cc3acfa 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -351,6 +351,15 @@ def extend_variants(d, var, extend, delim=':'):
 			variants.append(eext[1])
 	return " ".join(variants)
 
+def multilib_pkg_extend(d, pkg):
+	variants = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
+	if not variants:
+	    return pkg
+	pkgs = pkg
+	for v in variants:
+	    pkgs = pkgs + " " + v + "-" + pkg
+	return pkgs
+
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
 	"""Return a string of all ${var} in all multilib tune configuration"""
 	values = []
-- 
1.7.9.5



