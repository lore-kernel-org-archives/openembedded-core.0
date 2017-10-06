Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAB9719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:00 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b11so7813832pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Lhb7GEaraRxoyCGH8LNxt2+utziEWnlfOpsaiIn7ZJ8=;
	b=cnJEUkoldWbzixV1Sn8zaV0GA5VdJv6pV1FTfpm7wcJvRojUPSuRbOm/pbmlw4gxbT
	8U7Z1gTByZhouaOJmelZQ0yKMPmYwQYlWdQxZ8qZZtnU1qxh1zvZHJB9lF2Wlg4PaFfx
	oZAiMhKOyH3DLZPnrRr8S8VR0SKDknHXu4x9SIuVgkouwY75X+scw9awoKNZDNBgSzeh
	h1sUDgDffWWakO6NvO+HjfFi34NOfQ2oEbpEQUtjo2e1j6ZCX3FW/NqpItfN8OFWEOR5
	+WUGTCmjbvGfLL8HpPOjANskdulHYycyMQiKgsxCojWy7h0Qp7NudOII4z+NRS/qFaDH
	5CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Lhb7GEaraRxoyCGH8LNxt2+utziEWnlfOpsaiIn7ZJ8=;
	b=KiLaWSdVMuYKH8EekEAAcZ4o6Z4ZqUS7vRH8D4zNbBKsM6PZ6DSqU9ie7vqVcO45Y9
	Wt9Gw6tIOBAjQ130NQDTsBIxFmizlCF4TEEj8ARX68hkwwxXne9Na9a3BtALfsGozVSb
	hoyfsMtLQO2Sww+HdYN/4HGCZbORgaNJ657pdHdriwBfsopfJPVU5tuHLOCuPaAfge74
	LhK0nF1vmUNvnEk1tgQoofkEK7+y9w6Y9C8IUr+vyphKhF4+wr1koxCve1SavHq6Jrr6
	0XRLexx+jQKYyMhX+rrcoIOnubs/YLLIBCCvBVUYs3iY0CjkIGsBXQIVjSrIcmyuKQq/
	wJfw==
X-Gm-Message-State: AMCzsaXyzbsQ2A6v6sgOBIOeBu7louSR3qII2URghmKJr1gScxu4HcdA
	88far70UeGPPF6fyDU607kNaeQ==
X-Google-Smtp-Source: AOwi7QCAC6RwH/NFS3lp1wqmU41dlWbVJbgN+83axuk2J01M1L/Q7guk+Q1ysar+Pof/rBNJkNSGiw==
X-Received: by 10.84.194.226 with SMTP id h89mr422466pld.54.1507251061540;
	Thu, 05 Oct 2017 17:51:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:44 -0700
Message-Id: <66bb5b1b170108f30415956f22607bb16d02350c.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] runqemu: Add riscv support for qemu machines
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index df76270904..9dc6a05c57 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1077,6 +1077,10 @@ class BaseConfig(object):
             qbsys = 'mipsel'
         elif mach == 'qemumips64el':
             qbsys = 'mips64el'
+        elif mach == 'qemuriscv64':
+            qbsys = 'riscv64'
+        elif mach == 'qemuriscv32':
+            qbsys = 'riscv32'
 
         return 'qemu-system-%s' % qbsys
 
-- 
2.14.2


