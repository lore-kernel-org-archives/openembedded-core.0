Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4FB7D718
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:26:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so30679240wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 08:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=W1rgiTcL1AF8IQ/KjHd+TIty8LGAcggh4b5Be/HLq8g=;
	b=U0gp2Jq3VrFqQKpmEIcnqeR+0S0xXH0G9SWJbbGDQBnFPXVmfsQA+M+TdVdI4HIMwP
	53Ij6Wb8BlstQ2igHhSg9cSWZEwsbk4G8CJ+ZBxub99k7yWbRq2WFf604WWqrUy8VQSU
	1QAc3RYnzU8R4uy6bgxRBWIYIZzoaWKUH59q9HlR8vV8zK9QWtSQ2MYonCC3ergM/Oc6
	ywD660t2kGWJ/0F2sB8D2xmSByCvd3mWnoGhPRdGKM6AbhATpi64VmXNg0XxBqt2TFqx
	/02GAtEft4SF4RkBEN5JkAj27M2cyYpOxHV3J+hzibJh0Eq9aV/lPre1iAlyyFM6RtH7
	mITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W1rgiTcL1AF8IQ/KjHd+TIty8LGAcggh4b5Be/HLq8g=;
	b=mKbg9Cf/i++zUkEzVJFVXo6GEyJ6mQ5n0kVYdMHUGWqIIZLzWy5T0eo6JwzycXteWg
	djvCJyVuZyrLtciluBWQIe1XehgmPipieIqhBL0vv7N5JXwao4zvjSmthUcwIpAe+lDP
	U2SqQdqivISEqd6IRPbnREy3VYMdLOvbnzoeR073ZEgD1+5hhigccGvnMs8rXYfjIzJo
	syrewtfjmK35gV/aNPxqephbrzVu/qiNIRhY+rskeMJ1U9RKoP6z1XLiLvqiOzMPsAKi
	wr58HiL8j55nsTbDeYkOMJ0NKRkwlnndZUlxrWKlcWJ9tUBhu+sKKLcMKb7lU1ALhbVb
	Ngag==
X-Gm-Message-State: APjAAAUgzpohKZPiAJnblkzh6Z2qdsi6XgjbQMHjVm5buNiOAKyR1JTF
	mvB1Ao4qboWgLZcFd/EcjC4+N0iQ
X-Google-Smtp-Source: APXvYqzrJMnfz2/oeYjLg2GFDoW657GLh6btvBOifqsELe6j8iv8AfzDURv41A9mpshG+1BBJyo4wQ==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr62182872wrr.104.1577636818560;
	Sun, 29 Dec 2019 08:26:58 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v83sm17938011wmg.16.2019.12.29.08.26.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 08:26:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 16:26:55 +0000
Message-Id: <20191229162655.111198-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] linuxloader: Correct loader for glibc on armhf
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
X-List-Received-Date: Sun, 29 Dec 2019 16:26:58 -0000

Fix the naming of the loader on armhf to match what glibc expects:

  #define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
  #define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index c0fbf2683634..e2876cec7aad 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -41,7 +41,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader = "${base_libdir}/ld-linux.so.2"
     elif targetarch == "arm":
-        dynamic_loader = "${base_libdir}/ld-linux.so.3"
+        dynamic_loader = "${base_libdir}/ld-linux${@['-armhf', ''][d.getVar('TARGET_FPU') == 'soft']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
-- 
2.17.1


