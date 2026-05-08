Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3326CD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8239.1778224355654854542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FvO/ogJ2;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d734223e4so1101522f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224354; x=1778829154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onhHnfX7JxEm9CzESn7tVzM6AUIlUdA/6nw7v4U0VJs=;
        b=FvO/ogJ2lr7Y9r8+1m8nsvF7goElL3yoT5dzgl8UsQqsS3OVNFhFr+Nsab1Tb+8nkL
         Ic/3oZh1iUfL2mO9hcuU27epswgj1msiKoHIKYJ3e3krtcH6JRqTU1Mwr++BfqyYu9rQ
         QGfCHV4IGAZPf5RiNmVL0DznLu9At1Lsz65FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224354; x=1778829154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onhHnfX7JxEm9CzESn7tVzM6AUIlUdA/6nw7v4U0VJs=;
        b=NWZbVf3icXKDGL+yE/7EINlidaGOAvPMhE6qwNwjBO5bGYpt8E+QY3P8MofoLHZiHv
         xjtFpIelAporGfDrZWzwQPEBENZlvOaqkE6hDz4UYqqv0CnS3mU8wLGd7W4SFXSHUERP
         N8tWJWg/FsNlcsvJ31nZP4hw5jsmgq89bltzA06yLPwshLrNUp7cM4kKSktCruST5ks1
         w41fXeyDi3nFWuSc6BJC1f7Yuj7xLXjFZa69uMKhEL9QOqXJrIo5AfbgDNqPdklyKPJO
         dzBYdfRk9nJAYIrhsBfd3fdxMb5eBHZR/+L4an8usrxCNB16/KUkS8HtxFVnER+7u0Bq
         Vl6w==
X-Gm-Message-State: AOJu0YzJQ2jfWeh6q3hygBHCNnF3Qrv9L4ojtzohQStQ2c/p0zNXkAo1
	de7ufEMPu0L9/mKOvkeW63HTCT8i2RM1Ik9TlVVD2ghbcC2fiO8HEL2DCdIH/CTyIw0GGL6qrcq
	xFnq1Il0=
X-Gm-Gg: Acq92OGTwA6wd9RLSI5lryTlih96kbsU5F79i4SDgqdfvlF8R2Rqk1GuTBQciXdqHco
	8EFcjwE7Pq6dgXYzXHIpmH1psLMVqYx4m8o0Vc6UKXuaI+Wglvdvrud1huP7T0gDpM23vPHK+z7
	X2P3dgiykAX4G1iejIO6TIMJlf7yzweJG42maVE6R9tLeaf31gimNjCHRNKS5g8Brdu6w6JZENI
	+l9Rp+/K2LxJhI7W6xI5whQQJbwclIkegrYnAr+f+PIDLatcmRi4KWSchCRaGzLyqAUzZYaEhAC
	2FIpnrlilOZEE0MGUuecnLGRjrFYXAuPhri5RHr3NPA7AGevkb/CF7UOk86s5LWbisAZSZZnq3Z
	a5oPZ+nw4OokVaayuarUqmn4QroybJzJzSOLxjUKPazBVckdcDZ42ECMQCRWP9U8VPiVmOM33zd
	pXi9IEZxGX+DceCyuPDLysP4N+nM9zArA3FeDzQn+HUNJ5YW6l8W3NxRkNVfzsmoMrWnN1+BpBa
	kXVSLJFBNrAR0uRPKJKthQM302kQr/L8GKnfQ==
X-Received: by 2002:a05:6000:2181:b0:44f:b82f:2d18 with SMTP id ffacd0b85a97d-452e81764a0mr6831983f8f.11.1778224353702;
        Fri, 08 May 2026 00:12:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/52] scripts/cve-json-to-text.py: simplify getopt argument parsing
Date: Fri,  8 May 2026 09:11:25 +0200
Message-ID: <7b16c77e448e1b4ee367e708b0e5793a44749b3c.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236674

From: Bin Cao <bin.cao.cn@windriver.com>

Remove unused long options from getopt.getopt() call. The long options
"help", "input", and "output" were never handled in the option parsing
logic, so they are dead code.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a92dfe569844189344fbb5ea0521b2bf7dbf0623)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/cve-json-to-text.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index 8d309b37e59..f3386722696 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -42,9 +42,7 @@ def parse_args(argv):
     """
     global infile, outfile
     try:
-        opts, args = getopt.getopt(
-            argv, "hi:o:", ["help", "input", "output"]
-        )
+        opts, args = getopt.getopt(argv, "hi:o:")
     except getopt.GetoptError:
         show_syntax_and_exit(1)
     for opt, arg in opts:

