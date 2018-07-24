Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9885F74BF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:12 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id v13-v6so1734485pgr.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FeiuvKxX3Y17YTsmE2kFSDDZ/5xsDrpU4cpDNtmv4Ns=;
	b=KkTFnA4BTfWorwi9X9ahG9Sf8ZWL9kl/2b1zjlcJBjniKKiK6Rnwn09biV3hAV6b/E
	pkhxx5T63AmJO60KhwFe51/zfK3CtVeZ4QTkc7zs1r3JjqCfQ9Hg0QP+70s/dbG1bbb6
	UXV8ylcufTxmyAf/mVVwCeyxWwWto9juj7OPK1mgpagC2p8ODQ18/H36T9x45FDGHv3O
	FKBPr9DAGIBWdBGi25zWVZLlDjFJqiTHZaBpHQ8Lh4IesnCoMq3H2DiVRfKLLaiUu6Vx
	wkclN4NcimzzGQgJ80fQ8yPKoqOJ42AXG3rr5ASZVkHhuuj14zI9B7FNHQZKw0V43w9u
	SFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FeiuvKxX3Y17YTsmE2kFSDDZ/5xsDrpU4cpDNtmv4Ns=;
	b=cnmxOo5rqZL+2zQgpaBkes9T/YqKVVPoFBiSZzWMItWxMYqgZjO2mogUSXe7nNHAn/
	bJszIFFw2ouaCcCCX3hIwlMPFnlYYnEmpSfRsgP56Jn0/Jp+xNpPavZJLkvYcHsFTpt6
	td1G9oasLHuQNgaHF2IwC+VZt88hHLUYPkd773J2VZmSV/iIzVNQ0LzQBkjehsLRgiOc
	B+POx5YhpnylV/+oYH1QCqlVb0L6z8LeUcnlIvxJunxIiR6+EyMJQcPOoaoeZyC79h58
	wZ5tyy2TmBFQKHu63Fxh6dYwKTT/IDRgkQoYXCI4OsxV4yKsm7Rc2O6VSOqUxqibQgdQ
	7+xw==
X-Gm-Message-State: AOUpUlHmhEk3m2u+71fQPjnaxNivNK7U34ST1kFbh6td440lSxwnJVFf
	EH9EYm/uq0NwL74O8/Lr6GPRVfci
X-Google-Smtp-Source: AAOMgpfQBV4JkI78pvAiL52Ja4TYqWHRbCAU1hZ9R/dtdZethtDyVS2XLJRp5GRBmEboGfmcQD7a7w==
X-Received: by 2002:a63:2644:: with SMTP id
	m65-v6mr14349287pgm.371.1532399953889; 
	Mon, 23 Jul 2018 19:39:13 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:54 -0700
Message-Id: <1532399935-32296-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 8/9] openssl: support musl-x32 build
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:13 -0000

Align the openssl 1.1 recipe with changes made to openssl 1.0:

  http://git.openembedded.org/openembedded-core/commit/?id=a072d4620db462c5d3459441d5684cfd99938400

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index a2f5d67..5dc2966 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -39,7 +39,9 @@ do_configure () {
 	case $os in
 	linux-gnueabi |\
 	linux-gnuspe |\
-	linux-musl*)
+	linux-musleabi |\
+	linux-muslspe |\
+	linux-musl )
 		os=linux
 		;;
 		*)
@@ -71,7 +73,7 @@ do_configure () {
 	linux-i686)
 		target=linux-elf
 		;;
-	linux-gnux32-x86_64)
+	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
 		target=linux-x32
 		;;
 	linux-gnu64-x86_64)
-- 
1.9.1


