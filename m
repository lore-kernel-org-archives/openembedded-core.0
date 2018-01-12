Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id AF22B78889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 16:24:43 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p124so9872279ite.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u20mmp/STMhl2iEq6QrwzkdN9PUodc2nIm15Wxhuj7s=;
	b=N4r89caRVDry823lH06vKI+EWFK4ApIQyY3p5pu8qx+e91Bdhww8LJOCCJeqoPKVZM
	HRj9/V8qtzNMMecguuBxhbGU3YSmwYDGnSYSuKa+K3tCdm/kDgekAf7GB6cc33HgcHOx
	Ys/kCaW00zlfXWUu8PadieK5n35Ix5LKD0qxmjUWmO5UIm9/2kY7OtDnXDVGJFsm6laI
	Z2f7QS4+Z5GvD5X7YpGGIbYIa7F6ffgsp0YJ3Sx6CCfDs+/YNrWhJSXDz6d8qwUa6klE
	OABDZcGJgwBY6PcvdPmmIyW7lqgx3qnZiXq9DrRgV5uFGWjTzBXzldxQNc17q+WopJrx
	GAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u20mmp/STMhl2iEq6QrwzkdN9PUodc2nIm15Wxhuj7s=;
	b=aCRUcKNh9HdIsNbc56oHZUfSu7avHQNGOm/nBiB1VPOCNuhrtolElOhHWBaE+74ZgL
	hkpjR8utaVt9/iCH9xoKkWHMxL2upijUstnKqp5cJyhWKonNJs6YzIMAGXv4ZvtdmXSV
	R6Q7VGPUyJ5wvZaBPc3Auhzq8vzp/g+vaYPjcgoOIzGep2J1YXwL+w2ojOp8qIGy3IZN
	hkHh1bsnI8oiXpN+erTuUS7hOZUzEeuN0t3tBOMvJaih9np0qRk5WnOl0rozYiHPiLi6
	YIFKsn5kNzx1EqgcWImPph+of09tKj08Iut7s4EO1lmRDjtaZ28552NuirytrsLHZfOe
	Ib/g==
X-Gm-Message-State: AKwxyte3oJryoBfDeFpyUvlx0l4GjUjZNi9qxmePaL/4dCaYLdKRH8yg
	vQ1VANN0qYolJCf1UIhhlR0Ee6M/
X-Google-Smtp-Source: ACJfBovHmmpBFwVhYAvQXbGrMCsQXIDVntx8IsE8fZebnwwDaiiYAq6GR0wCKBVm2AKCeC6sBcrhsw==
X-Received: by 10.36.65.203 with SMTP id b72mr5600255itd.148.1515774285089;
	Fri, 12 Jan 2018 08:24:45 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	c62sm4081724ioj.28.2018.01.12.08.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Jan 2018 08:24:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Stefan Stanacar <sstncr@gmail.com>
Date: Fri, 12 Jan 2018 10:24:42 -0600
Message-Id: <20180112162442.8524-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] classes/externalsrc: Don't delete tasks
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
X-List-Received-Date: Fri, 12 Jan 2018 16:24:43 -0000

Set the noexec flag to prevent tasks from executing instead of deleting
them. This allows inter-tasks dependencies on these tasks to still
function. For example, perf has the line:

 do_populate_lic[depends] += "virtual/kernel:do_patch"

which will break if the kernel uses EXTERNALSRC and the do_patch task is
deleted.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 65dd13ddc1f..12046d74e17 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -102,7 +102,7 @@ python () {
         for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
                 continue
-            bb.build.deltask(task, d)
+            d.setVarFlag(task, 'noexec', '1')
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
-- 
2.14.3


