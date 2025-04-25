Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B9FC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 13:42:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6771.1745588535352237990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 06:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gWVn1BA5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D5D543946;
	Fri, 25 Apr 2025 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745588533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QtqoIQzxm17/9I9Ldgpf2yFZRW8jS4PPmoF0rtwpl8=;
	b=gWVn1BA55Gos5dbH4gjH01tl3J3IfKYee3tN2ybybSGYrwJejJgRHndRQQQSo89y8stKVU
	T2eNtfqI5YgDw/petukZb0/w2veNH6m/Qdpi8gOtYzS23SyggwG+uoy2EWfgqX1NPKtW48
	wxEJjwbpkS4Ts51dOS2mkqV7pLD0iUA4QhwIuNvqsOONVmSRsHzcrgmiG4r08dxGnJT1Iq
	4iU+8cmC4CJNPJKnnfqF67BTaI2bdNZ89k/JqHZ7chbx8wdVkN/IZlfofk4opiG9eGhlt2
	hE1InRGkLdk40mgrX20/1bopkewRxp5rZqBahHkcWsbzOgm45XA0bjdzDdF96A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 2/2] scripts/cve-json-to-text.py: fix missing -o option
Date: Fri, 25 Apr 2025 15:40:42 +0200
Message-ID: <20250425134137.4148001-2-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250425134137.4148001-1-antonin.godard@bootlin.com>
References: <20250425134137.4148001-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhgfetkedvhfegveegkedtfeevffegkeejfefhvdfhhfeuhfevffegvdfghfefnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhin
 hdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 13:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215474

Add the missing condition on '-o', which allows changing the output
path.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/cve-json-to-text.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index a2eb592f5f..8d309b37e5 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -52,6 +52,8 @@ def parse_args(argv):
             show_syntax_and_exit(0)
         elif opt in ("-i"):
             infile = arg
+        elif opt in ("-o"):
+            outfile = arg
 
 def load_json(filename):
     """

