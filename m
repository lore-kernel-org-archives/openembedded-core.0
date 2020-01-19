Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 948B07FBEB
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:28 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id bg7so6090176pjb.5
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+kqmPZrQoVgcvTL+Qw+8qOwvzvIdwkT1eVI09tHuBfY=;
	b=jFZWsBxBatkA0BCmnTiWyhO+DKddLONlG0zKjPqCF9Sfrm7pj7bBqy/Kbh3pJoBFo+
	0D4tmrnPNT4a2BWCgxpHeNiHolZYLMlZnQCGN4qLs3z53SI2HWvrRQUPsA7LJHtbMVqG
	JhnLdJDH4aBIyGhcNjKZCDz9SEKgEGYlioHvP/bCLTQVjlEcQtim9oBccZ6m6mbqtkVb
	ppwWIgv04pC7yJb9enT84ri9TA7Y4lI4bshfAc4w9NcSQ1YdL9hr+cKi2SNniEJrHxWY
	vFePwhAT7jSBprEfLUi0l1jUAgkLHwK+Nj9zZVttmrYcoAboCS9L3gLXcy3/zjPtFCG8
	7BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+kqmPZrQoVgcvTL+Qw+8qOwvzvIdwkT1eVI09tHuBfY=;
	b=ky/1Wv1TN4Gj/IxFMHdKXdatE7WkBGxlDoISTqzP/x3EnyCRbc5mZjkn+8Al4M5JTS
	V/nQNpwnlUKC7nVSyYKx3Qub+DflvwXAhYZktfPXy7NIptzFOxov9M1wHDgdHLJE9tGT
	LBMJ9uS79tLj2iIaHkpmQm/19m8sdj46uPDQtlyMjTgyPify2PWnA/S2bdSCA6T1UIYx
	h1lhUelIw5j6JliaFLnvUjgJkQTrozPpU89FQT3yc/MqFTWi0ElkbyAaFTtszarsEr2g
	T2dEU6WbjqiGvhnAs4vI+Ybb4R3EBftURtPLCYhExPj1Zu7TBZLx0QhpDmGEtcXyZPWf
	V/3w==
X-Gm-Message-State: APjAAAWB9gbYHNQ5D4GQHLZY+fHTMvzjOS9+TpOWFDmJmZu3w3AAAJC4
	lZRbme8uSNtRlx9oqeJzjejZoQkI
X-Google-Smtp-Source: APXvYqwjOmrBqcX98LiGNO9jue/APvnUa3Z68leR2uqiUL+5wmiIeg/IIQ9l2Xn0KNqLml/tzgJSxw==
X-Received: by 2002:a17:902:9a84:: with SMTP id
	w4mr11966528plp.324.1579469849482; 
	Sun, 19 Jan 2020 13:37:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.28
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:21 -0800
Message-Id: <996013b4e5d3cd1c054e87539ac1a8d95581a87f.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 3/6] wic/filemap: If FIGETBSZ iotctl fail, failback to os.stat
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:28 -0000

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


