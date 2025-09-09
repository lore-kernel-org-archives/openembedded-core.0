Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CE2CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.902.1757438266136435104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWNgbp+Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b042cc3954fso989588666b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438264; x=1758043064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8b0pQqq+ZVeMhjwPdRqfDEnB7r/YlqdobkxH9/GdwM=;
        b=bWNgbp+YNRTBvbDlrm+R98HsXhlo2eUdZkQbCz5ptBjxI0SYQvaEuRrA0kaplPMJfh
         mlXarNoPM6A9acLhu8F3wAuv71s3uoPbM0n4ST0w/Da3ttHeyAIbu7eQ3pJJnuTjY2Zg
         kiT14PxTy7gNmy7qFpo2hJFkQjoSQdBiC2XuGGjL/o4OR1enPIPz6cfXn65WABTN6fHs
         WLTPLYbkioF8SG+98weCK6rdhTKCIXhf4MS21ODmL83f2hWUl5/k/ZacG1zRy9icSddZ
         S5o7MNQUqABZVKymZr9Q8GKL5JGZz+wpQsghAg85TendMO89ewmq7x9UK5T5pFzSfpVz
         +ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438264; x=1758043064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8b0pQqq+ZVeMhjwPdRqfDEnB7r/YlqdobkxH9/GdwM=;
        b=gnK4tzcHmfKbjc/lnH68aj5jAddlrbVoP2STQbzKONFIoNp8yDmPtZLfJjy5ex1uSH
         o3YeBZXBK7vJyrcm5jIt7hcm73SDbjswJsNj2uu0wTvaz6qrCgQ83H/4qianmsvXQAzT
         xjenHw1Lcz+wfXq/pGTZ7KpEpAKrQMS/IazlLRoCxNgYfi9rJUFdCo2o6xSTGX1dtsj5
         GlSFa6130AwxXcfD3q7QuxKocN43TSauKw7F5s0uq7cMiQNaOkY+8I2CA1RoSM5bbXWH
         cT8HZJGnF28U4fftw1UZvROADHwiBU137AD2pOO5yxEVYSqhUHRWfmJNZi9JvLs68LGD
         ApBg==
X-Gm-Message-State: AOJu0YySQeGK40ytCIxZbemyWA+jITke1YPTXwa87D7wle2byJ6nA79r
	QZJdd378ZErBvU9Q4PigfO//0IQw/OJrvi+d08LL295Ypm4mptYQkv/DU3OtDg==
X-Gm-Gg: ASbGncvthOZvdX8TpiGAW+idlBJnoJXP2JaLou1HIbXxkF3hR1FYdpbk2kS+855hs/4
	4BrGnoDoFFzkiSSpAoVEHio1MaWR04lRYNyANkLKXwS1lCaTxdYxgcql7/6kTfcVBqPwQEps2hZ
	1BlX2Xr0zbMchYYNnc6zV6VoK/eYzt90nJcf2HexnzSGmuj0MtAjKkVP3yoCjxM71x63HONANnI
	jSe/EEoyn93cW3X+ClUfdqUotFd0bujvm5Q1+hpp9cCyYDQMGU5BSrHvioTcoUBOTzQS4hAR8Fg
	GFopSUHMV0u1na7zovTA7tiThcVWCwyAk/D6NxsufLT/I9K58HA/dRxV4tpXpihNuORqUY3OgLR
	bMyojpw/SppKiroSdl8RRd/P2X0CUfJ1D36Kg
X-Google-Smtp-Source: AGHT+IEmZDrW50QmXnL7457idzVeAl9ncQhwphuohY1xMkBwhfz6zhSTp9AfbrVg46uWlBl+OFTCIg==
X-Received: by 2002:a17:907:97c9:b0:b04:1a1c:cb5b with SMTP id a640c23a62f3a-b04b13fd491mr1249756066b.7.1757438264376;
        Tue, 09 Sep 2025 10:17:44 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07830ac2b6sm21212566b.27.2025.09.09.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:44 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/3] lib/oe/utils: use multiprocessing from bb
Date: Tue,  9 Sep 2025 19:17:35 +0200
Message-ID: <20250909171735.1588343-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909171735.1588343-1-martin.jansa@gmail.com>
References: <20250909171735.1588343-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223129

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build with python-3.14

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

[YOCTO #15858]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index c9c7a47041..437a2d51c7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -5,10 +5,11 @@
 #
 
 import subprocess
-import multiprocessing
 import traceback
 import errno
 
+from bb import multiprocessing
+
 def read_file(filename):
     try:
         f = open( filename, "r" )

