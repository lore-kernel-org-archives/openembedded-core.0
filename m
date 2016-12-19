Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B06477367
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 19:12:15 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g1so7496952pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8gaAV8d4eoagloXhBwwpVKegvZ17bk888w2oVa3r+Hg=;
	b=mxRaA6Xik6bPkhbuKAxtF7/x3nPoHeNcgTaDwdlyrna+AXo5VJEtpuQnDADfQQnEeM
	UL/aV+gBfmYC+pmEZ9/UeiNkpRdM5Mc8dGab/rR+eNAKi3fhFucZIf6D3rkiU8CuAo9V
	KMiyyN3UAWGqVAfof55E7bHY0uGHQmoAUxfGzKG9aBaI836P5tBAIQlSoerD9QLqXrPT
	UH7IfYuBcmOj9eVjygqj+VyW22CV1Mm8EOddWGWpGatAMzDbVjZxFhIKcOPa2bolXn6c
	o8qwXDdlFiPmoVDXNVVmmEXOsLz4lW7VlWGrcpa158myvv8ggrv9OAO1DN+hwr9qRqg2
	+Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8gaAV8d4eoagloXhBwwpVKegvZ17bk888w2oVa3r+Hg=;
	b=kQRKBKxnR7JoAp74mcbjHusxGq6Fmqa3twzR3UomoG0OHRlANzoaEIt1i5oOsx9csc
	DBnq/idjGnFUUbBPA2KgGx5zKX5WaF1+8TNB7wQhGuHunkAGmAqmIyqyZJWfUu7DAnqf
	n1m+EX0AFwL+8hzjmjwxd7gi+PsGQMRso8Sv5Omv2Oav7lDfaJaCpnossCAmgLLdjPz4
	xa7mxKTubBv9sPv0wBNU4RjTGv5NP+zxSPRR7WtybdlPH1PxewyVkeI9bNPDGqEC4Y3I
	2TKcwKKLVmuIbqgN0DqhWliKLa5DI5LO9x25Rq6FkILcJ35Pbce83BBpZ314p9S+D+rq
	QMWQ==
X-Gm-Message-State: AKaTC03Yqd1P1DMunhZJ+u/ih4HSyttaWC4ogVX2BDofm/rqfy95iPd2VUtpi+swRc0egw==
X-Received: by 10.84.167.2 with SMTP id c2mr37012384plb.56.1482174737557;
	Mon, 19 Dec 2016 11:12:17 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s8sm33291047pfj.45.2016.12.19.11.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 11:12:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 11:12:10 -0800
Message-Id: <20161219191210.18407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gnutls: Do not use libunistring prefix
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
X-List-Received-Date: Mon, 19 Dec 2016 19:12:16 -0000

when using clang, configure it poking at build host
if we do not use it then it falls back to sysroot
which is what we need here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 184a50f6e1..003dc55a38 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -37,6 +37,7 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.11.0


