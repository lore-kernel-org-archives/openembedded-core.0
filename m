Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 06577783DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:00:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b129-v6so2095308pga.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p7jp2SHNpBsBuOaptcYVCZniYl/nJM58j5EGePe0h/s=;
	b=OY5XFli6PdDxqu9WgiA2VYv2AZzliEFyl4cyao9TKqTjtZDiHDcvdBwtrUCZK6tx66
	5vMsPohKSzrtjlfPpBgpnuY+2WYVFcM6mZpWuD89WJqiwe7EX4MHGidG827AFLY8KC36
	w8oQyRPHkCzHdFiWLFkJnhdj/yK3YZYdDly+Xrm8klWGJrvk5eMSokAsLrygLunVQi73
	pLwozdjiM+PHl3riyeWOKLm6XIlYTfrStWer+ENRdqLdK+DIsqWiKpurWeCUGKEqA2Zy
	qcQ81YDyxriEOwnDRgsoeXHdeN0LySCyKEMqZG3QnU5iril6Ri5onQvL5TnGat9Q93hj
	A6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p7jp2SHNpBsBuOaptcYVCZniYl/nJM58j5EGePe0h/s=;
	b=dFwaH4n96PgleVwJ8Vnz4g99uuQnQRyeRpinyrYUzi9cGQs7dTyZPONbOjs1RlboUx
	Stf3BSIKhxo1HKpS8hYWmfsiCZDFuFFBxMzaRngGF6di8HbZWQ6NIBxceEplb6guDtzG
	ZjwQU4UZgGv3jwhSBzDzRveJTNLRSAPNbux1RQZTYm6HTLIhAITTVKUH+H8O/EmCyPUd
	qkpmeTuYA++nO814HtyL445WrXN475UlHZMxIBC7378gHQ46I8RFKdK5WenIUTwcuhlK
	A1IeAaz6K7D7aXgdfJ5lRgqjiqGqR/SYAqPPEo1qaRG1azn4M3w9pPfkBmYQ3EoftkI3
	ZrMg==
X-Gm-Message-State: APzg51DvwJnzRK7v0Gdedih6xF8N8QPBGh7ZE8B1odH7k5SjmvxZfJe5
	EDdQEJ+y0wyhHqGr5ZjTXv2/9+EH
X-Google-Smtp-Source: ANB0VdZOvsIZqpzjODHD0DNXuX5PLVnEKzSuMJ1+Kl41IlcY6VWDrYO5ZTl2PORWPrSrquGWEEdFCQ==
X-Received: by 2002:aa7:84c2:: with SMTP id
	x2-v6mr36422007pfn.220.1536087635480; 
	Tue, 04 Sep 2018 12:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	i20-v6sm29364805pfj.82.2018.09.04.12.00.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 12:00:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 12:00:26 -0700
Message-Id: <20180904190027.1410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/2] openssl_1.1.1: Fix Musl build by disabling async during configure
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
X-List-Received-Date: Tue, 04 Sep 2018 19:00:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
index 7122cfcf02..c13731feac 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
@@ -31,7 +31,7 @@ inherit lib_package multilib_header ptest
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
-CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
+EXTRA_OECONF_append_libc-musl = " no-async"
 
 # This prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-- 
2.18.0


