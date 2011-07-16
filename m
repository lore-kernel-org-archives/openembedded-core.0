Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhyVH-0001L5-MK
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 08:37:32 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so1714106iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6g65QEbnlDzEzVBfkAyvGURNntC69t+WYhHOWGqy4fM=;
	b=lwBq6y3EhTL6FwheRG2hvn44lTWpbxQw1aW/3jaI9q+Cqu0kcVipkZzdi/Ka9BntiG
	lO+1slr6bc92em/C5SQkDqTVx9aXp+bVjRRRNybpgWQdigRZsZ13BAI/QCd0gYV71v4W
	vAJVoWl9H+0gOowBJHXC9Yqjn+rKQJRf1okNw=
Received: by 10.231.70.2 with SMTP id b2mr3798294ibj.23.1310798012314;
	Fri, 15 Jul 2011 23:33:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d5sm1339185ibi.62.2011.07.15.23.33.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 23:33:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 23:33:19 -0700
Message-Id: <30308e331ef00eba28108718bd16c400c6430658.1310797743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e286a25378756398463d3bf34174005a8cef8841.1310797743.git.raj.khem@gmail.com>
References: <e286a25378756398463d3bf34174005a8cef8841.1310797743.git.raj.khem@gmail.com>
In-Reply-To: <cover.1310797743.git.raj.khem@gmail.com>
References: <cover.1310797743.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] classes/gettext: Do not disable nls for non target recipes
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
X-List-Received-Date: Sat, 16 Jul 2011 06:37:32 -0000

nls disabling is target specific but USE_NLS=no will
disable nls even for other kind of recipes. We should
let them build with nls

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 86b505b..d5b3d70 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -7,7 +7,7 @@ def gettext_dependencies(d):
 
 def gettext_oeconf(d):
     # Remove the NLS bits if USE_NLS is no.
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
-- 
1.7.4.1



