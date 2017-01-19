Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5824D71C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDCND002514; Thu, 19 Jan 2017 16:13:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DhrRaerDPCB8; Thu, 19 Jan 2017 16:13:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD6Yg002505
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000lC-8r; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:12:58 +0000
Message-Id: <1484842382-2821-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/11] sstate: Fix EXTRA_STAGING_FIXMES handling
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:14 -0000

The code wasn't working properly, tweak so that it works as expected and
the grep expression includes the right patterns. Not sure this code has ever
worked prior to this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index afdb4a3..34069c7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -518,6 +518,7 @@ python sstate_hardcode_path () {
     for fixmevar in extra_staging_fixmes.split():
         fixme_path = d.getVar(fixmevar)
         sstate_sed_cmd += " -e 's:%s:FIXME_%s:g'" % (fixme_path, fixmevar)
+        sstate_grep_cmd += " -e '%s'" % (fixme_path)
 
     fixmefn =  sstate_builddir + "fixmepath"
 
-- 
2.7.4


