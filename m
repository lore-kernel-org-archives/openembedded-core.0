Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id CB24791460
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:24 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r11so2870894pgf.1
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+kqmPZrQoVgcvTL+Qw+8qOwvzvIdwkT1eVI09tHuBfY=;
	b=vRKkwYgKxFPA0ey3FgtbIk37U6AaGYsbsIeh7ueZpbvA6u3j1fWjPed4DxeoAzXbVt
	eimBpstC4ZBV9wXO1TJdobZdoD/n6mQ1VcSEa4qbnrSN+t7oq0GOC0Do0/Hj8PwzF2GD
	FFQ7CEXNDM9zVxUOfnV4kaODHmEffNvcj08QW+aAgIOFAIKTadHZ43ZrX5cOutdZRKUD
	sz6AltMDTwUA42D8hyT615QEvKre5J0jkpZhz2ay2Wx4Brj4L06K3Ni3BEmsnsPMaTjs
	tbCFvvrai4kyTMj2ezPXeFpzYgWtrMCeBcwac3cwN/dCOp300DCkTTCuHTv15hyNgXpo
	Ar3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+kqmPZrQoVgcvTL+Qw+8qOwvzvIdwkT1eVI09tHuBfY=;
	b=dqt+8nOKiZWZx6gLSSzegBgYheFJ+8UlaowqGxbYz19WHzznrJdqmVhvidRwpKwpDv
	OVTfvm2s+xXPFcQn7vNAp9VS1pDp0WLB9MOGfb0zvH7Jhjd0WJxqlYNufsVG8DcxQ7M7
	EN6SmjEeDHRAgc/m5LdGK6CQiRffAho6bOK4ETUFDSbejlgXAKiD0oaWroVUUztFPBq9
	6V2mJtqwFGzWGFo6BVUPMC/wPP+HL1aYLjqaJNg8/6CNLedqeiuplgb4ZNwxoFK5OUpv
	FBjuELMLHxeNHcheHkGEghekAVXbc20Uh/e2MR62a80wp2vpSnycNyZqszzl4gSu9K1f
	g4tQ==
X-Gm-Message-State: APjAAAVOXy7uVwYQ/WO2Z/Xx3dvSOv+ZCR4dZMvLOxwQDnG5FvuPggKY
	Tccbos7k6bve0ljIp2akjMvHcUN4
X-Google-Smtp-Source: APXvYqxBYqcUFNsJxXyHTQaLlRTnYxjHICJuOykyJm0GyWWCfSoeoDmNJT5uEwOzodi3PKoJNmEh9A==
X-Received: by 2002:a62:3892:: with SMTP id f140mr1086176pfa.190.1579672105694;
	Tue, 21 Jan 2020 21:48:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.24
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:13 -0800
Message-Id: <996013b4e5d3cd1c054e87539ac1a8d95581a87f.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 08/11] wic/filemap: If FIGETBSZ iotctl fail, failback to os.stat
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:25 -0000

From: Kalle Lampila <kalle.lampila@lempea.com>

Some file systems don't support fetching the block size (notably the
file system Docker uses for containers), so if iotctl() fail, try to use
failback via os.stat() to get block size.

Signed-off-by: Kalle lampila <kalle.lampila@lempea.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e219f5175177a640dd62833082ea19adc1c13d42)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/filemap.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index a3919fbcad..c53147c2f1 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -34,9 +34,11 @@ def get_block_size(file_obj):
     # the FIGETBSZ ioctl (number 2).
     try:
         binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
+        bsize = struct.unpack('I', binary_data)[0]
     except OSError:
-        raise IOError("Unable to determine block size")
-    bsize = struct.unpack('I', binary_data)[0]
+        bsize = None
+
+    # If ioctl causes OSError or give bsize to zero failback to os.fstat
     if not bsize:
         import os
         stat = os.fstat(file_obj.fileno())
-- 
2.17.1


