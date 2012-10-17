Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOVOR-0004GY-EH for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:18:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HF5SUB006951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 16:05:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06675-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 16:05:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HF5Ie2006944
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 16:05:19 +0100
Message-ID: <1350486326.2185.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2012 16:05:26 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] diffutils: Remove rather bizzare gettext macros
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
X-List-Received-Date: Wed, 17 Oct 2012 15:18:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diffutils has a rather confused set of getext macros with different names and
strange conflicting version requirements. This patch removes the problematic
macros allowing it to 'gettextize' to the latest standard gettext code without
issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
index 74c371d..dc87190 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -3,6 +3,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 require diffutils.inc
 
+do_configure_prepend () {
+	# Need to remove gettext macros with weird mix of versions
+	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
+		rm ${S}/m4/$i
+	done
+}
+
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://remove-gets.patch"




