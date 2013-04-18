Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1USqBJ-0005GA-7S
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:51:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYJNv009828; Thu, 18 Apr 2013 15:34:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id voXrJi40QMBD; Thu, 18 Apr 2013 15:34:22 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYEef009803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Apr 2013 15:34:15 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1USpu2-0001Dq-QF; Thu, 18 Apr 2013 15:33:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:33:30 +0100
Message-Id: <1366295611-4646-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] psplash: Fix multilib build
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
X-List-Received-Date: Thu, 18 Apr 2013 14:52:09 -0000

The update-alternatives for multilibs are broken and nothing provides psplash in a
multilib build. This fixes the multilib code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/psplash_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 2d0cae3..bbeaa0b 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -56,8 +56,8 @@ python __anonymous() {
         ep = '%s%s' % (mlprefix, p)
         epsplash = '%s%s' % (mlprefix, 'psplash')
         d.setVar("FILES_%s" % ep, "${bindir}/%s" % p)
-        d.setVar("ALTERNATIVE_%s" % ep, epsplash)
-        d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, epsplash, '${bindir}/%s' % p)
+        d.setVar("ALTERNATIVE_%s" % ep, 'psplash')
+        d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, 'psplash', '${bindir}/%s' % p)
         d.appendVar("RDEPENDS_%s" % ep, " %s" % pn)
         if p == "psplash-default":
             d.appendVar("RRECOMMENDS_%s" % pn, " %s" % ep)
-- 
1.7.10.4



