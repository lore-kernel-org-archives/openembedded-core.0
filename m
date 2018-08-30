Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2908C793C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r1-v6so3263877pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=riFdID8495wIp+0Ys3gtcU+GG8i13lWaEiTz+UPAFr8=;
	b=pmWUKIWoBxtqYnRBIsGOTRO5CZyABeXXiax+xlmjj6GzSMeCt7I2tOqb+1zstV8GhP
	8buJXQmkR3X50IGsdtZXESeD7H4MZBaoA5Xnadd0jrU3lkQeLhUftiIg8cerlhhJUmJg
	JZGp5nwDsM9kCuoHaX2PJJG7mYrD3e6qXSolwpebaws38G7UINlj68E4GZPhQtSikGx5
	/nFZaqBG3xVgCEfeJ5iKOw/el/Zyrqxk680O4Dn+FqwSu270LMtg034a+LTS3GyUtmGc
	AS1uxUEu1JzUzFyR+as68UoLFLiHPx5G5ZoWfxTNTxEdFci+jtkLTXkQcLAX7bzKYquj
	Y59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=riFdID8495wIp+0Ys3gtcU+GG8i13lWaEiTz+UPAFr8=;
	b=alktRKcogjRjBkTYn+A5eQyHyNPMro8tKsbIgU5l4P4g5ue3PVa3gj24Uij07gVzm2
	rIzgQYfX5p7KdXp1SHZ4+4RUteIotFf7bXA62+t3p+xqLO+2fl/WjNOfJxtaLi4y3RuK
	qJL6mdFeHPQjDvest1kesDHXOWOWqRBwKfkPQKEK4JqTxQS8pwC+33lV3LFodHwRFmHz
	WmuHJXxtfPioQ+3GWWwffqc4fKjpgwfYPWFLvjCL6NHKADCQ8tNmEWdTW7QaXH7pOlRe
	8fCduRwGTbakTJzw/FhLQNRDz2dTU2jqmTycYBSVKJf/KVNLpn0n4grqeW1XJdZ30U7g
	DJjw==
X-Gm-Message-State: APzg51B4V6Vr8cwDYVlbCLQcIPnlUPqW02S7WFzX6ECjBdcjj2znTmQt
	2bjANBs8bThQ/5oH0jzVYeyJjmZJ
X-Google-Smtp-Source: ANB0Vdbpc/1tBIQ7DZh2EfJg+CPDyESpqidCwak+5UgKBTl2T+Fx4pSU+9mzhnhSfViJ+qEGgJNSrA==
X-Received: by 2002:a63:1948:: with SMTP id 8-v6mr8126419pgz.192.1535601354032;
	Wed, 29 Aug 2018 20:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:39 -0700
Message-Id: <afa33cd5432f190437035624a5574ab1a7c47f13.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] gdb: Seprate out gold and dwp into a variable
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:53 -0000

This is needed for riscv64 to build target binutils fixes alternatives
creation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd864..b56fcd4cd0 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -38,6 +38,9 @@ FILES_${PN}-dev = " \
 # Rather than duplicating multiple entries for these, make one
 # list and reuse it.
 
+LDGOLD ?= "ld.gold dwp"
+LDGOLD_riscv64 = ""
+
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
 	ar \
@@ -47,7 +50,7 @@ USE_ALTERNATIVES_FOR = " \
 	gprof \
 	ld \
 	ld.bfd \
-	ld.gold dwp \
+	${LDGOLD} \
 	nm \
 	objcopy \
 	objdump \
-- 
2.18.0


