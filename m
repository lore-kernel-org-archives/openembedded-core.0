Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0B17C034
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 09:23:01 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so15001714ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IWPAuGnNhRU1Gut01LD+kGFa4/8w/vPrquQGUBtlkPo=;
	b=p7Zt1seV/cs8NKomfNstOy5aj/HxocKdjFgmB5FMSr1cQG61EGHskL89z+Eqo66ToO
	Xjo+tMde9VI99o13Uk3SwblOa8iVQgB3gtPdvVeMd2Mi6LCSVJdfyCZwUBl7SNJ50meP
	AI4rnlOAtWCqh2P/4Ki3oAuXjXclFiKcu4NxsWkLBJ3tRLnqKytiW7hvSYaii5w/5Ikc
	sbNyqaTVNK2MCJpPVGIkFlS4SitKL+DTclJwFORFruzKUe4O4wkdJ3mg5l13XRHdg7SU
	p29X4DyWd/mfC2xUABKDPm1Y+VjvXJTA6jAsRiZKydGK7KYN0TnHsHNIzx7Zv3IWkQ3B
	OQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IWPAuGnNhRU1Gut01LD+kGFa4/8w/vPrquQGUBtlkPo=;
	b=pKgJZ1zPXDA5AzO/9vlXTjcdUUgE2GlgDkPDaTsS9ccmv1iJQ/p9EO5s3HEI84rihi
	aakAm5n+3lt1H4myyji4Ek5XgGhNv5HzceKfPjGh5SQCA/XFTqDXiNDJbYYxBBzze7QY
	keYYnrEVBgXPw30gOpLYxQO+jzitlF4JwUG8XC9axvrwzNXGwX1ddfTNTxWZLV7bk/H8
	MoAH3WY5GjBuNqYSPcRGLmW6YnDBlzzEfiIgqwzZDX2fcumiFrQx4JwgB6lKEMLg6oqL
	uxSSDaFVRzYZKog4pa9sEx8UgpL8QX62DeWI0l1G+1raOgsxvRpTO+9qJOTLl+PzTC1D
	8MeQ==
X-Gm-Message-State: AJcUuke9bN2h7+11+Y0IHvC6RtmgsdDNf4mxpXV1nmFj56chKnA1HUSY
	wZN7GuAYstRVate1Pa0VzAuXZf7Z
X-Google-Smtp-Source: ALg8bN7ZdQ+EZiAE2uNSOBzMdRnuTrqWj6cgKJIdqJlfIyWkBqDIQUBJJBTxIn5jDj33SKcuDPT3oA==
X-Received: by 2002:a2e:3012:: with SMTP id
	w18-v6mr10093883ljw.75.1547284981749; 
	Sat, 12 Jan 2019 01:23:01 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	q11sm14933726lfc.92.2019.01.12.01.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 01:23:01 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 11:22:50 +0200
Message-Id: <1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 4/4] valgrind: Mark powerpc64 with musl as incompatible
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
X-List-Received-Date: Sat, 12 Jan 2019 09:23:01 -0000

Building musl for powerpc64 enforces elfv2 ABI since commit 68c964185519
("arch-powerpc64.inc: Use elfv2 ABI when building with musl") that is
not compatible with valgrind.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 4d15a50..d882319 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -58,6 +58,9 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 COMPATIBLE_HOST_linux-gnun32 = 'null'
 
+# Disable for powerpc64 with musl
+COMPATIBLE_HOST_libc-musl_powerpc64 = 'null'
+
 inherit autotools ptest multilib_header
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-- 
2.7.4


