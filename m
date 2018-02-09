Return-Path: <jsbronder@cold-front.org>
X-Greylist: delayed 583 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Feb 2018 20:03:22 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 3A410784EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 20:03:22 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 288A620BDF;
	Fri,  9 Feb 2018 14:53:40 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Fri, 09 Feb 2018 14:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=GRRk+8yYEgjg+ki+Pt8WyCWl8KjOrGYEEObcSq
	DpBj8=; b=JbmkwbFmVPwHaz9ttJtQYHy7QoCATbjKMEhZMs0Hv97oIh0fvlLa/C
	CzofSv9jFQF7yKrm2QoyyH5cX2JTn41F5D8SSN4vY4b6L4TNdSzFNY8SQULAm6B0
	EgkLMhrkfLlKH8tH0y68PJ5msuPHNwk+uDy+DfcLiycayWSFqNWXY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GRRk+8yYEgjg+ki+P
	t8WyCWl8KjOrGYEEObcSqDpBj8=; b=JZHYs8HI4NdnJDXlT/oUlB53ZTQUbPbIg
	mca31+nzsLXBgOoySfe/iG4Q5sDQbFAkIWsY/XtGJFrNo6dnqFGmBzuWV8DV7ZxS
	VAc3bgS8fd5fVHIki67JUCd5B7wAtcSvj2ET0tMijnyT7SFG6GKJvxPvsUYxOQ3G
	KB3NByehYHJr9SuB3w9BYoaUTW06nODC34C+d1QHoSpvra+5O41quu+HSb8al7F7
	gA/2FzpRreaKtlqXAUP7yMW/zxFEodftLGOmYmpgYZQQBouFbWU9ylrs4P5tX8Em
	EP8EIdgNem5knV91vhrZB46SYaShYuhRFkYjOr+YeLHyvrxTevpwg==
X-ME-Sender: <xms:RPx9WsXlsVyUpJSnIblC0bAP3XENosFATFfE3y42tAIIQdvlcLVVuA>
Received: from localhost (unknown [72.12.91.223])
	by mail.messagingengine.com (Postfix) with ESMTPA id D7B197E46B;
	Fri,  9 Feb 2018 14:53:39 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 14:53:37 -0500
Message-Id: <20180209195337.27617-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-yocto: create dummy git user if necessary
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
X-List-Received-Date: Fri, 09 Feb 2018 20:03:23 -0000

The user's global git configuration may not have the name and email set
and git autodetection can fail.  The initialization commit for a non-git
kernel directory doesn't really need to be tied back to them anyways.
Instead, create a user and email that's clearly tied back to
kernel-yocto.bbclass.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/classes/kernel-yocto.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 60979a218f..dbf01f86b6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -247,6 +247,8 @@ do_kernel_checkout() {
 		fi
 		rm -f .gitignore
 		git init
+		git config user.name 'Yocto Kernel Git Initializer'
+		git config user.email 'kernel-yocto.bbclass@invalid'
 		git add .
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
-- 
2.13.6


