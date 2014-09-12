Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F278C70EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 09:54:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8C9sJmO012528
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 02:54:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 12 Sep 2014 02:54:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 02:54:18 -0700
Message-ID: <239165de545458a5d1e7fb4a49b6037340de5c69.1410515355.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410515355.git.liezhi.yang@windriver.com>
References: <cover.1410515355.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: fix sstate_hardcode_path()
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
X-List-Received-Date: Fri, 12 Sep 2014 09:54:25 -0000
Content-Type: text/plain

The "grep -e (x|y)" doesn't work, for example:
$ echo xy | grep -e '(x|y)'
No output

We can use "grep -E" (extended regexp) or "grep -e x -e y" to fix it.
It only affected the cross recipes.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 67e0c1d..6a02891 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -418,7 +418,7 @@ python sstate_hardcode_path () {
         sstate_grep_cmd = "grep -l -e '%s'" % (staging)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIR:g'" % (staging)
     elif bb.data.inherits_class('cross', d):
-        sstate_grep_cmd = "grep -l -e '(%s|%s)'" % (staging_target, staging)
+        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIR:g'" % (staging_target, staging)
     else:
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
-- 
1.7.9.5


