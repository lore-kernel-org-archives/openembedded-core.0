Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1R3RHk-0003JG-PN
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:36:16 +0200
Received: by fxi1 with SMTP id 1so437242fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0J6yUOJK13cWIWcRPKjRCQIcL2fblxG6M2Jw+eN/7kg=;
	b=p3npz+cUsHadZWu8fv2BWPirn67HSKgTMhi269F6rpXEbPRdjMCeOOUlSP6JwlTyJ4
	+4guegukLtIWXmYoGAJqAM49z8lyjKb5KxvDSdbJw4nn0JwaD2rDDEqWQAYFyjQLWhvw
	I5BcPgjq7su3fR7zBGeAVId3ksEftDVA3JjNo=
Received: by 10.223.76.15 with SMTP id a15mr1226714fak.35.1315913467789;
	Tue, 13 Sep 2011 04:31:07 -0700 (PDT)
Received: from localhost.localdomain (ip-95-223-249-66.unitymediagroup.de.
	[95.223.249.66])
	by mx.google.com with ESMTPS id r3sm99206fam.26.2011.09.13.04.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Sep 2011 04:31:07 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 13:30:32 +0200
Message-Id: <1315913433-32608-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] patch.py: fixed message domain errors
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
X-List-Received-Date: Tue, 13 Sep 2011 11:36:16 -0000

The dynamic message domain was introduced by Richard Purdie with the following patch:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a6c48298b17e6a5844b3638b422fe226e3b67b89

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/lib/oe/patch.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1406e19..9768be0 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -358,7 +358,7 @@ class UserResolver(Resolver):
 
             t = bb.data.getVar('T', self.patchset.d, 1)
             if not t:
-                bb.msg.fatal(bb.msg.domain.Build, "T not set")
+                bb.msg.fatal("Build", "T not set")
             bb.utils.mkdirhier(t)
             import random
             rcfile = "%s/bashrc.%s.%s" % (t, str(os.getpid()), random.random())
@@ -376,7 +376,7 @@ class UserResolver(Resolver):
             os.environ['SHELLCMDS'] = "bash --rcfile " + rcfile
             rc = os.system(bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
             if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) != 0:
-                bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual patch resolution - '%s' not found. " \
+                bb.msg.fatal("Build", ("Cannot proceed with manual patch resolution - '%s' not found. " \
                     + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
 
             # Construct a new PatchSet after the user's changes, compare the
-- 
1.7.4.1



