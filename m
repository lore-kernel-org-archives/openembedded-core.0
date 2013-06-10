Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3D06A9CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:39 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so2067595pbc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AiKDbsWraUOLwQpjhyDZEmDk8mBO4l1A5yoK8QUNTTQ=;
	b=WuRsHXcXnxbdZCBiIphFzWmsN1HZM4MsK53dSlUMMYEuHHE8E9P2wkZVHV2F0DhI4j
	feyS3maOQ3gt/EPC8AqIhi/YtPaUtUvymkVaOy5NOVM05AYFQyZLXtNRXa6snnbWuYSb
	Mp5if6XQwWwscTiQ8IUAe/h/dKHVt2ArC//plJK7QfeWlFbkj52KnYnAA2WJX7kMzVvZ
	Xpx0YZGuWKr9awu0QLAsCYJsUpRUeHyOVKrs7rrRZBlHnbzqBNpxjF2H6rVY8izxbQde
	BDJik6yRd3scCPGmBx5UjFLvv0h7ZmP7d4BcN/a0AD5iXhitlxPRNLiut5WVKkExpNJT
	Z5Mw==
X-Received: by 10.66.230.130 with SMTP id sy2mr15716242pac.75.1370897200639;
	Mon, 10 Jun 2013 13:46:40 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	cp1sm11526369pbc.42.2013.06.10.13.46.38 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:40 -0700
Message-Id: <c3ed12567db9ac351e056b428db4ef2783181ecc.1370896976.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896976.git.chris_larson@mentor.com>
References: <cover.1370896976.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896976.git.chris_larson@mentor.com>
References: <cover.1370896976.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] copyleft_compliance: set 'dirs' flag on task
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without this, due to bitbake defaulting to ${B}, it's possible to get ${S}
inadvertantly created before do_unpack, breaking the unpack of git sources,
which expect the destination to not exist.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index adb48be..6b30b87 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -63,4 +63,5 @@ python do_prepare_copyleft_sources () {
 }
 
 addtask prepare_copyleft_sources after do_fetch before do_build
+do_prepare_copyleft_sources[dirs] = "${WORKDIR}"
 do_build[recrdeptask] += 'do_prepare_copyleft_sources'
-- 
1.8.3


