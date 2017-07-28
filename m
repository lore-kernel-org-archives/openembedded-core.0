Return-Path: <net147@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id DEA9B784B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:44:24 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id d67so28851018pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CxhoqHkITIFzYV7pR/dChw2fvT3EYB/4mAsm4j86WEg=;
	b=dsyiCbLxwwAzj2JKCpR4h8C14vVOLOsOb15bnj2q3RLm0cJWo6MbTT1WCOeyXvO1BW
	oh0fFXrujH7LuM1aU/3khAHkwSRSjqd+G0pv/eCjPPvqcmb4tL+z7noEIs/i7R/xnHAe
	314yo/+ozsqCzEcFIN2AhOZWZPVpv4IFM7Ui6GymuLGiq+FOWeT7ga4AYCaI+iAfyyKD
	Un7VCJf7nQLBZ32D4QInqBw0zR3WsyB/E4IxnljZH29IqB/KzPR/sdNqpj7NVNXZgzor
	Nol1ygh5RSTcf7CexjBx6Pxst3lnoK6dvrZXyfzJft9qtVSRANje+OE00EBhrS2UX6q0
	tWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CxhoqHkITIFzYV7pR/dChw2fvT3EYB/4mAsm4j86WEg=;
	b=blx/FG6bW7eK06E9FqSJJYiFwhHBwXhRXq8kD7jo5V1j1OZpRmdoxPSmeETjpYRjj4
	ftUBC/BKDlJ4HCFsQ0UaLzuEon5p3g5weTNhtAlO62acLiPiIA/lB/7tLlaNCxKAdd90
	s//tL7oup8eQkmXMTdyJYWe2OTWMHfmw6dA/y1q32t0Pwo7wesxktKPfFVtfNZZ6fBXx
	dSthAbXgv0U1PRsP///NfJk1njuYlHJa3QwJ6cXYNNedoUp7q7nnOzXflk0cb4je6R5I
	Gz3q1Rq9ooMxSF7OPtq02t4STsyKwGJsYDtwWFs8L8Kjuwqs2jMkPrGYkURp9Bsu/fQn
	DC0g==
X-Gm-Message-State: AIVw111J/t718vp9h4aqyhGzm0E0Z3roDDlaRSC59Z+OlN/9xWgKlVyr
	TRUugyDOLz+2nA==
X-Received: by 10.84.231.8 with SMTP id f8mr3694971plk.405.1501253065945;
	Fri, 28 Jul 2017 07:44:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	c7sm37622346pfa.174.2017.07.28.07.44.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 07:44:25 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 00:45:27 +1000
Message-Id: <20170728144527.24322-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH v3] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Fri, 28 Jul 2017 14:44:25 -0000

Zero may be interpreted as no MBR signature present and another
partitioning program might install a new MBR signature.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f20d8433f1..fe9b688ab0 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -297,7 +297,7 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format = ptable_format  # Partition table format
         # Disk system identifier
-        self.identifier = int.from_bytes(os.urandom(4), 'little')
+        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
 
         self.partitions = partitions
         self.partimages = []
-- 
2.13.2


