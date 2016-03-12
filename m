Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 59B7D65CC2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 02:49:11 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id m184so167624679iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=As0L1Qc6Ip5DVorjUeTprFoDeQ+6/EDN4RpG8dW/Pms=;
	b=zJH8lM/p1McIfYK8Jt8bNcE6DcK2Rx4B3BhTTwGK+pxi4kJ54w13u37sLE/aqVnSDn
	i63ry5AJiD23mldML6Ax8ljN42sWJhV4iKIdNmyqawpocrFhcC5Y+HAhA75cLfikUmrx
	G3jFzeDan/FLOSCa9g2jmWVfsBgikbB23/ucy4TwK2aSPESojWzMUyKboBaGe8TsZi0L
	X2sSNJ95FVbczPdIJ6zAww8SSV17FHScuVS1tpmpW0dZpmSVf0HlmSMYjeSZqr5YNS/8
	ocXAgdZwu8ySDhxw2kKYyPDLKkKhOVaLS3KSVtYD7simIJNiBYX8pehIDlLNCL/ttih1
	AbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=As0L1Qc6Ip5DVorjUeTprFoDeQ+6/EDN4RpG8dW/Pms=;
	b=f7kaJ1OGQwDRsxc8ERH6OzLpXbSG+uFwrX0CzARM3ZeyGeCBp1ne4/MSaa6v2M8pEG
	zh2qlEh1U1gKX9/+RqCTVGE2WJ2XomyNeSl7yNBm8vZxwkBRjX2T+EGTqZH9pCg3Q7OI
	Yycu1fWIsuXnP5/ywYWllCrf4MDDkywwW32DpFL+NXAS+ar5sqVRspQwQON+HCfpSxf2
	0qzjjKHLzOzEcsXBFofDO9S5aGLPbnDrfQn7AZcXVOD4YUC1V2pwznuONTz1PVny9qwV
	wwAscCuQy1mQIBrsuDf8p1k6QLF6OpV1lYTjxfQLi7SR2Q44ibFpyI15RTTF3Ok5+Isx
	Qo+w==
X-Gm-Message-State: AD7BkJLv3nNQN6c805lRalMGpLFaU+vAZZ3pnJs/hjnKjv5lRXp1EaX+m7bmApvtJwF4zg==
X-Received: by 10.107.148.202 with SMTP id w193mr16113464iod.82.1457750952679; 
	Fri, 11 Mar 2016 18:49:12 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b13sm1898398ign.0.2016.03.11.18.49.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 18:49:12 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 21:49:14 -0500
Message-Id: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 02:49:13 -0000

Currently my build shows two "meta" repositories: one from meta-poky and one
from openembedded-core. Have the code which prints the repositories into
metadata-revs show the parent directories when repositories with multiple
sub-layers are used.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index fac7fed..b6b4324 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -616,7 +616,7 @@ def buildhistory_get_build_id(d):
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
     layers = (d.getVar("BBLAYERS", True) or "").split()
-    medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
+    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
             for i in layers]
-- 
2.7.0.rc3


