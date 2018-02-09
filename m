Return-Path: <jsbronder@cold-front.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id DBC15784F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 21:06:03 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7A62820E69;
	Fri,  9 Feb 2018 16:06:04 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 09 Feb 2018 16:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=mbKFx2luMSo4qEN1yuNKO3QW3q9tILdLkSNawM
	ZgGnY=; b=EtjsHRSYc/Ua/Za+WYAZi/MHdGL/G3bcHrZONDYKWfB6Kchh80Qy4u
	woJ4/n8LDaG1IW3ZfV29WAHTsfAxLqmfpjqtS/lyr8QtfcWyWc2NcJH9NCs4HjCd
	4qnP2DOPb2xOgiHH3/5O5IG/+mZmxBKs8r6NyT3p2QMszKbJmz630=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mbKFx2luMSo4qEN1y
	uNKO3QW3q9tILdLkSNawMZgGnY=; b=SFQPM331YpBrPtgyuzIlp1lQQgLk/eN6z
	zlmIn1pJFKw5KIzoLkurS/uPs9N6b3zxdvMZtGCcDRT3hma46Z0sUTGOmUJL+NFD
	kniFLaOD0zBGS6JhsuerG659MgxbP1EJTM5o8UbgEhYKBH9HhCs9PerDBSJhxl1u
	aj+f8vYJPZEcgFdsuv/T/lL+Unc30LZ9mQajA/G8sZ6eBaF9uUJ+DgoCxZAAIzt/
	tp4nAsgwUasPN4M0tqqGM48vD1ozFXr71oL1r/ycslLZV5FAhj9Bw5JM6TIIhTNv
	U56ecmwbQkXo0AgpMrFdRkNRBaTymhPpjhxyi/bQ/T238+EI/I83Q==
X-ME-Sender: <xms:PA1-Wlw5MtjM4VBue2gTyQaSYAjdJaVEjqdsUNpY3UeXMPDfpf5Nug>
Received: from localhost (unknown [72.12.91.223])
	by mail.messagingengine.com (Postfix) with ESMTPA id 39466246D5;
	Fri,  9 Feb 2018 16:06:04 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 16:05:52 -0500
Message-Id: <20180209210552.7498-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-yocto: check git config during checkout
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
X-List-Received-Date: Fri, 09 Feb 2018 21:06:04 -0000

Initialize the git config prior creating a git repository in a plain
directory.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 60979a218f..0eb631cfb1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -247,6 +247,7 @@ do_kernel_checkout() {
 		fi
 		rm -f .gitignore
 		git init
+		check_git_config
 		git add .
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
-- 
2.13.6


