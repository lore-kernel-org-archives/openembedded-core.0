Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id C135679229
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:49 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s17-v6so5944857plp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=nRb3kj8Uri4JZxo6g6f7x8yCQ760oZB+kAA8IQwnZvuZC7IxSpc8hAb8yOvY2TyDTY
	KRcwwz15RC7Lv3ftzdkjGKzT4WcRmibgsvsvMyX2RPyLyZUSgPxIsZ3q0B6VP+NYzPP9
	WLkSlNlaP8QKKfgrmCe/s4JkK+NGSyqErL5doeGRmZmZnwCIN/S3/SW/ldGLMwRLbaOM
	ljuDlUe1dZeBlYl/u4IrITRmNcgZsK4tErFs/0c9lTGHQc9E9Hiav1n5B0BzJ7RD8PHb
	Nzol3x8tSZrrIPbtTpbPCECPact7iZYsaCX+A/HWh7YTG7V4BHgCj9BQU9Sgq9Tzmrtp
	px5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=KvE7wEMLFJ1w9FRZtMS+Okw8nxYnkcu9h700zv5YspvosV7ca1KIP4AVihcI1UyTfy
	pZs0u1YlCQEIUH2/ce/vw/MyRy4CLM9Vyf+AzJq+Jxs/VAVZymwB32BEgwW2nHffUFuT
	QVc/SUvHkO+yAvpJ0x8c40hvrsEvC7L3PfC38zYGWDk6wpMDmeBrd9glfrthLxwqFEVZ
	j2PTF9S8HieggdxoLL0cNHkUReRixaV6wVUl/SeLbhT21rZvemBiAOz4s78KTX2b7F+O
	+A7mJ+pmYpHqdyDjZ/5BpKwaZzTvbyXHDxbmo+5lXvw4P6a0bVAexDPjvF8UWslfQJw6
	iLDA==
X-Gm-Message-State: AOUpUlHhtht05/uh3V/q9UtbtiPIoP1TcL37+kG7Y91POsg2uGngXHyc
	rBQryuvEDKAlmd3bZ0baavmtiH76
X-Google-Smtp-Source: AA+uWPzmlMfS+KUgxwyxg6OxdnD4N0bSLm8cpFMz+ygD+BDE875gEi+VfmaYZyameuQpeLGTm2f+gw==
X-Received: by 2002:a17:902:724c:: with SMTP id
	c12-v6mr41497663pll.326.1534699430846; 
	Sun, 19 Aug 2018 10:23:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:34 -0700
Message-Id: <93fb315a5076ddc79d1dc113c8f099db2d3f61b2.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 2/9] powerpc: Remove pie flags from compiler cmdline
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:51 -0000

Original approach to add -no-<pie> flags cause link time behavior changes
where packages start to lose the -fPIC -DPIC in compiler cmdline and this
list keeps growing as we build more and more packages,

Instead lets just remove the options we dont need from SECURITY_CFLAGS
this makes it more robust and less intrusive

This also means we do not need to re-add pic options as we started to do
for affected packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 52e1e4ebc5..4e20a4d0f8 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,13 +28,10 @@ SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc_powerpc = ""
-SECURITY_CFLAGS_append_powerpc_pn-libdrm = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-libinput = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-at-spi2-core = " -fPIC -DPIC"
 GCCPIE_powerpc = ""
 GLIBCPIE_powerpc = ""
+SECURITY_CFLAGS_remove_powerpc = "${SECURITY_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
-- 
2.18.0


