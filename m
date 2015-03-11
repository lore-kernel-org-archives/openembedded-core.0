Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6148573A05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:12:22 +0000 (UTC)
Received: by wivr20 with SMTP id r20so37542752wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 03:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1gnTd/pCnPr7GJrbZX+OTRTTnfIwfXCk1O6e3wDQYTc=;
	b=Ilu11doKx29c95zVRWjnUQZ3Rs1AGA4cO81mGD0djXqh7VlpOjgBFgrop4NTJD+gaO
	cdvriG7IhR8+FSCuv39qJRO+wkiIN3FoSvMgLlmN+OSVrv3JEXo7qgMKQoa6KI57EouW
	yYDdilVpIKO0dt4j3b1Eiebf0pfV2McwvnpeicfErpwfgPaJMmmHpAONZf06DOIIubL7
	nvUNY8jT3kMp3VW3EufZ7778G3WhcVFC8DuU7EbCpxZJHXsLRROJMwXbDO1qPwt9cKMK
	5+DHCi5Irj/yID6W23Gf2QnMyb4xn6m92ULZP+NLWcmdAdKx/v2V3zJgx5E1//vbU1YD
	i9Sw==
X-Gm-Message-State: ALoCoQlCE6DqNKoeImwo+AuqlkmfeF/st3tEdNGb+ivs/o1oS5buk3R4dyhmpxz68FEyo5PtTASZ
X-Received: by 10.180.108.177 with SMTP id hl17mr119797301wib.35.1426068743513;
	Wed, 11 Mar 2015 03:12:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm4755879wjc.12.2015.03.11.03.12.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 03:12:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 10:09:42 +0000
Message-Id: <1426068582-4103-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] devshell: allow the starting directory to be overridden
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
X-List-Received-Date: Wed, 11 Mar 2015 10:12:25 -0000

Some people like to have the devshell start in ${B} instead of ${S}, so allow
this to be overridden.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/devshell.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 41164a3..8ae3dc3 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -17,7 +17,8 @@ python do_devshell () {
 
 addtask devshell after do_patch
 
-do_devshell[dirs] = "${S}"
+DEVSHELL_STARTDIR ?= "${S}"
+do_devshell[dirs] = "${DEVSHELL_STARTDIR}"
 do_devshell[nostamp] = "1"
 
 # devshell and fakeroot/pseudo need careful handling since only the final
-- 
1.7.10.4


