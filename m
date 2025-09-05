Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6147CA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:12:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.599.1757092322273116215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kW6o/JiD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB89C43A1B;
	Fri,  5 Sep 2025 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757092320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pU/1sDKg+yBB8FfyJE96QL3xOn14wsA1gyISLErxGCw=;
	b=kW6o/JiDb/iKsZ0EsbPfycyjnWaVT13ZhTkr+Lf+3XFNbjzt4P28mjC10pfrcHZL1qUvG1
	M+lygWt2nyKii6KnwsHm6lkFPUhVuHVEPrODkw1I33gtvI2PXHcKAcGZb+wIBUNo0aliqS
	HoVS9vSPhhTSshAK0f8PeSxD3whrjMndJ0fPLv1PD/XoUShuLRLWVHMaIW6JTVAuh75AJv
	5t6thtdfHfVRnb5e5iiglVP/PS3c07T59xDVJnatnBp/pj8Da1pkxvg18w/HX/4KpnlwVa
	xrkUNOoikhcIiZkFOKbngjPrgIKtRW57/dKrA6f/gKwKH8Qv167uLv/mOalE8w==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH 2/6] spdx30_tasks: fix FetchData attribute in add_download_files
Date: Fri,  5 Sep 2025 19:11:50 +0200
Message-ID: <20250905171154.182825-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddukeekfeetgfeltdfgieeugeeggeejieejheekueevhffgffegkefgffeukedvnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghstggrlhdrvggsvghrhhgrrhgusehsvgdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223027

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

The add_download_files() function incorrectly accessed fd.name, which
does not exist on FetchData objects.

Change to use fd.names[0] to correctly retrieve the first filename.

This fixes AttributeError during SPDX document generation.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 52329760b6..f6e6e545dc 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -405,7 +405,7 @@ def add_download_files(d, objset):
                     name=file_name,
                     software_primaryPurpose=primary_purpose,
                     software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
-                        fd, fd.name
+                        fd, fd.names[0]
                     ),
                 )
             )
-- 
2.43.0


