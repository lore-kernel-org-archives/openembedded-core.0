Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA9CC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.167.1686329687375583478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YN/wF//a;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-650352b89f6so1594341b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329686; x=1688921686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgFmN9ISwvgoDOsMTV4YXm7DL+zEAuxoIsXfrxPTPOQ=;
        b=YN/wF//aW5LyImKxxrs7VjyLWxVKFFXMc/PVQIDlSzw6jxGgxNY8s1CfitSWFT+Lj/
         5Okl1LJta5ghIeV2y8tFYUx0R75+S7BBJppj1UhEen/xFYIAJO2LhW6CzUKSTYQ9dTjh
         xW0wgEjAQfuF2+KL+F+teLUnH3UMpjVCDvjKLuCWRQQoJbWAMJW8spy1QSLLJAjJZVAm
         mWfBX1JY048JYYwrwhbJGbUMnjs/Msp3NJj/qBXHQKStU+3qOmYsntMq+BEfiFnJp8Cb
         0hetultRIdwZaR+h/ZCarCiloRA3Jqr/YP1EvBB8jT2cSrE0/dKE7hP8QfItqpSbv13K
         HwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329686; x=1688921686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgFmN9ISwvgoDOsMTV4YXm7DL+zEAuxoIsXfrxPTPOQ=;
        b=NtCaGXSadSegS9cMcTUDnUAO1O9IQATvnZZ/ggJg5yc5D9ro3rOCBHE0sJt02GCIw3
         qxkmZsCOm6ZzZKnD3H3naG2wAyAm30nY2Iqr7eN1avl9XASI+piKRvu7aIEKD8cTu3Et
         iF+rIF56PHqc4Yn7jrSKKCyt8e7gAJdKpI7tvP0dx5q2ym60XNn4F3HP9SLJJZzHR/7Y
         xlUygNRLK2xy/7/A7LB8P1i08LwOToLb5Vr3sBRIb+k7yT57oGZiLxoNy8qzOY+pQ6kB
         gfFVDo+dwzv9xMTQAhJRwGC9hPupT0I05aAIOtgfXE7oAOvd7ZhJQcg9AMTxn13QGF+8
         gAjw==
X-Gm-Message-State: AC+VfDzlLGKDB9qsJ6MZp/AjwuXjkYtjoitWh+ySqB/ShYX+MyU57u8y
	JZzf74WbbEcNNIg/43evYl/8f1uM5FaejP8GKUU=
X-Google-Smtp-Source: ACHHUZ6yhIsxgb1fUgjyzKY7Oq7rpFfjEEqJVXuztjTdXpbtrBKU6LhqwJHiAKz6EsqtSskeFN2DSg==
X-Received: by 2002:a05:6a00:997:b0:657:2f01:6078 with SMTP id u23-20020a056a00099700b006572f016078mr1755727pfg.28.1686329686447;
        Fri, 09 Jun 2023 09:54:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/30] rpm: drop unused 0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
Date: Fri,  9 Jun 2023 06:53:53 -1000
Message-Id: <c7324d03ebd58c247611a9955b6029bf66f05826.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182592

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was removed from SRC_URI in oe-core commit:
  commit 67257ca87c6fa8e6050a20ecea50daf834c7e869
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Sat Apr 25 19:28:00 2020 +0200
  Subject: rpm: upgrade to 4.15.1

  and it's unused since then

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c801a215fb2d53bdec7f4c9a20ff7969e8071e5c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...support-for-unused-MD2-and-RIPEMD160.patch | 81 -------------------
 1 file changed, 81 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch b/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
deleted file mode 100644
index 734e38bb39..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 2d53d1e308a5bd15a16cc289fa7e1f264ea706be Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Tue, 26 Jun 2018 10:46:14 +0300
-Subject: [PATCH] Rip out partial support for unused MD2 and RIPEMD160 digests
-
-Inspired by #453, adding configure-checks for unused digests algorithms
-seems nonsensical, at no point in rpm history have these algorithms been
-used for anything in rpm so there's not even backward compatibility to
-care about. So the question becomes why do we appear to have (some)
-support for those unused algorithms? So lets don't, problem solved...
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/ff4b9111aeba01dd025dd133ce617fb80f7398a0]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- rpmio/digest_beecrypt.c | 7 -------
- rpmio/digest_nss.c      | 2 --
- rpmio/digest_openssl.c  | 6 ------
- 3 files changed, 15 deletions(-)
-
-diff --git a/rpmio/digest_beecrypt.c b/rpmio/digest_beecrypt.c
-index 597027e25..653a39491 100644
---- a/rpmio/digest_beecrypt.c
-+++ b/rpmio/digest_beecrypt.c
-@@ -132,10 +132,6 @@ DIGEST_CTX rpmDigestInit(int hashalgo, rpmDigestFlags flags)
- 	ctx->Digest = (void *) sha512Digest;
- 	break;
- #endif
--    case PGPHASHALGO_RIPEMD160:
--    case PGPHASHALGO_MD2:
--    case PGPHASHALGO_TIGER192:
--    case PGPHASHALGO_HAVAL_5_160:
-     default:
- 	free(ctx);
- 	return NULL;
-@@ -292,9 +288,6 @@ static int pgpVerifySigRSA(pgpDigAlg pgpkey, pgpDigAlg pgpsig, uint8_t *hash, si
-     case PGPHASHALGO_SHA1:
-         prefix = "3021300906052b0e03021a05000414";
-         break;
--    case PGPHASHALGO_MD2:
--        prefix = "3020300c06082a864886f70d020205000410";
--        break;
-     case PGPHASHALGO_SHA256:
-         prefix = "3031300d060960864801650304020105000420";
-         break;
-diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
-index e11920e3e..b3d2b5595 100644
---- a/rpmio/digest_nss.c
-+++ b/rpmio/digest_nss.c
-@@ -117,7 +117,6 @@ static HASH_HashType getHashType(int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return HASH_AlgMD5;
--    case PGPHASHALGO_MD2:	return HASH_AlgMD2;
-     case PGPHASHALGO_SHA1:	return HASH_AlgSHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return HASH_AlgSHA224;
-@@ -217,7 +216,6 @@ static SECOidTag getHashAlg(unsigned int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return SEC_OID_MD5;
--    case PGPHASHALGO_MD2:	return SEC_OID_MD2;
-     case PGPHASHALGO_SHA1:	return SEC_OID_SHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return SEC_OID_SHA224;
-diff --git a/rpmio/digest_openssl.c b/rpmio/digest_openssl.c
-index 18e52a724..0ae48dd1d 100644
---- a/rpmio/digest_openssl.c
-+++ b/rpmio/digest_openssl.c
-@@ -172,12 +172,6 @@ static const EVP_MD *getEVPMD(int hashalgo)
-     case PGPHASHALGO_SHA1:
-         return EVP_sha1();
- 
--    case PGPHASHALGO_RIPEMD160:
--        return EVP_ripemd160();
--
--    case PGPHASHALGO_MD2:
--        return EVP_md2();
--
-     case PGPHASHALGO_SHA256:
-         return EVP_sha256();
- 
-- 
2.34.1


