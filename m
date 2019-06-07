Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9832A7E4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 20:26:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45LDZm0K6Jz40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 22:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559939200;
	bh=ZXuQiL8AFPoW8EhVfdXb73WaXwRxOGTCDqYZum7ZOVw=;
	h=From:To:Subject:Date:From;
	b=N9qjIxUNUW7y7AjcW17gAAszMTy8YMleFm5lg81ytUm2snlbnf70gCGBsBTRMdjZw
	PIeGSjK2KJE76h6PfBNx8WhSPlCsZVoArhRzNkGq39ghvHuB1g5UJrcuTcA5IS7oWT
	hv9gEBqFMS3IH9dAi/w8gyyGqNA5M8A7QRRTjcegEChpk6fOEw3ZwR9cPLoiyUVgkk
	vuFhdqi1Fde0/R5E1LPlZYWPau0sDANazPzrcKde9m4chq7PAUamVQmAIj0sTzEwna
	tch1lIdKa0ZjzFREGfucJP7Dh9LhH1qZ8ZC0qz9zNMu7TTgfUjl6wngk59YWncuTu8
	ie1Ted+2pRnshz4w7uZvmiS/qdvM3KXRHB6DeCcjXjEdVC0cWSB4CzeLeUzrL5c3of
	RLyvlhg8oQkaSY995/nbmPAvGzdhK5+gMwzVMOMp2w1ldl8V89yUCEFD5fBG4YQ9Qt
	mPBR3lC0ZqvSbp9XyG3Rvd1ySjwx0LQ5ZQE86MrttGKS89K9TlOK78lIXypOG4KNAH
	tcmvr+ECmm/9GDt4C1k6FZ9htOQ/egI9MdrjoUxsCshghgtc9NbNtKN1I8v+MAwbfj
	oC5Nl+OrBajEG3k0UetE2Bw3mECWdptc4Monruzy6Xurx8alDmHs3Ex8v81BI4TNao
	NWjRPDrZF8puxJeea0MjW/2o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 23:26:39 +0300
Message-Id: <20190607202639.20286-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 07 Jun 2019 20:26:39 -0000

From: Chen Qi <Qi.Chen@windriver.com>

systemd upstream only care about glibc. We made musl specific
patches so that systemd could work. But currently these patches
contain potential security issues.

So apply these patches only when the libc is musl.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_241.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 3a58f44a3b..eb3242d624 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
            "
 
 # patches needed by musl
-SRC_URI += "${SRC_URI_MUSL}"
+SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
 SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
-- 
2.17.1


