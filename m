Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id ADE9A6B076
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:11 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id s10so8139283plp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xE2RL7vUkd3zcu93Yyii0G4R/7OQuVWpt1Kwvc0D4oM=;
	b=WWgymyNLpn6S9Ejkc1lxLlonZyfFUPjDbZmMC9tNZ/GFaCKDdwj5c1qm8PGXfZL69Z
	QafJIRsToj9ngWgLb4rHqgJc7dh0ufzfGtaQojC5l1gaA6IEMhkNrr8aKficXGy6OMPt
	VqSCJvwW5SZMUc29plWEZBDSS9P3Ng9YWm766oBqok9FrxMpNgm0Wbq5Ttav1gAAwB2U
	TG5sYfyjXAWlgIWx8c8DKGTfFYl48tplyHxdzSmmmzSqp8HBr2XCrUdTpCz1VMcPZV3X
	s/aJq8ZiJ5mhkt8Y6b9M6IgKht7Sg3ftEB6+fUSYL+BytO3/MYpvLeuhxeTP2pVQ8bHs
	xEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xE2RL7vUkd3zcu93Yyii0G4R/7OQuVWpt1Kwvc0D4oM=;
	b=bT9qjG+VJJwdqIU84OZLZp/CavL3vzXWtVzD8tPRoZLeVWwutQcgcEZVuB0G2CW20H
	7MJapdQQk+CIeiUotXcf/bNVxgODFhkaz6UXTMXJ9U/ZwBUUhFXH1Q9zw75S04hMwbVm
	sm0xoUO3HFvGDsvMRbEWmgQKKDKuD44e7XxLLrdbWqHxezhLqs7qYSXw0MtRaPlyuc6G
	se0t6RQACFkYWqgQNWWcXqY/0wHaOLk3RFrtRGV9Lfx5G8vaAe1GgyK0RtweLVGuSQWr
	kfzPx5Me/iW2nJKfZWj9RtfnR8kv6hvHaHC7DfJrS2BdbzBDtQcPnYRHiGnpW+awsfdY
	mjQQ==
X-Gm-Message-State: APjAAAVYkUlb6fG4YtZsz+R5e7XSpjnxE6U3bTnOJX5OUZkasMhuy3cq
	Gn4zFzZIxGpldRJU/zt3VNgBKrgD
X-Google-Smtp-Source: APXvYqzp1fsX7Nfxckqd3I4STRI3+Qja2GEcQK4B7AS7ouHnY9WezEpz82+rWEfOJS0ACdfMhdtsCw==
X-Received: by 2002:a17:902:8a87:: with SMTP id
	p7mr27536274plo.42.1573497012643; 
	Mon, 11 Nov 2019 10:30:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:46 -0800
Message-Id: <f02e9f46ce54fed3c7ddfad7d1003a2fb7ba3a67.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 04/21] sudo: Fix fetching sources
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:11 -0000

From: Ferry Toth <ftoth@exalondelft.nl>

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 8b3be55..0a11a1b 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.7.4


