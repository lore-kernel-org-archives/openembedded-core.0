Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 835FE7DF94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g12so46188wro.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aqcjJTVv8nqhsVhQRu16iJhlwySkua2k84gaqbzcJAM=;
	b=hq2ONYa+ljTHUeivrxoJk13Oy/zZ16SU0TL0No/5ocWg9b9UJO2AOzMj1oN/J9uqI5
	Ij7ht5V1r5SWThSOsl3En+/albsdDDlgkdkL67sDYEUOOO0pzZ4KB5bUhuOpw2+y4SRE
	7q2f1ezZp94hunjZwozsJHGcHs7OvBmTR9ww0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aqcjJTVv8nqhsVhQRu16iJhlwySkua2k84gaqbzcJAM=;
	b=DQBEmFGj9KI11QV9YZEJ0E6YgMbq48Er+rlU/vvbkE30+5BD6xD2QEjyb4l1W+TLDU
	/JV2ilnv5q7vZ/oUysQ5ldDwxb2EwhBFU0lkPZRawR3yBPTP1LUngXrqiXyqoqzW5EUp
	WtfJ1dpf0AKlcEOF+8GPUESnNYshWumyilTNgbh7swelqWohYD00PeNKldgNDNgMXGVR
	Pd1Z36ZQLSJJ4tnFFo7WI2qZt5z+3Hr0WMqfrJ5TbKRF8o1/wwFDBL7mZkJ3Sh+3MwyO
	3rUm76X44amiMCThj5aUbBnY+i1op/q/kUoMQ4NdYJ5fWq83dirMr5klEu45L/n2ZKZ9
	ZgIw==
X-Gm-Message-State: APjAAAW/JuSHq99/nXai+JiO8gyjX41LtX4Jj01lCtU5ZeXhnIDapxsK
	EgLRPSw2cyrdsv5XzLJVhmGyVl0k7vE=
X-Google-Smtp-Source: APXvYqw60MyfWkSZXhn2MlAfdh+OAA6SBmS9nYeSo3W6+QJ9nJFW6ZwENRBLvRH8XkVgl2d8dWJ23g==
X-Received: by 2002:adf:cc8b:: with SMTP id p11mr36683077wrj.13.1558477717994; 
	Tue, 21 May 2019 15:28:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:31 +0100
Message-Id: <20190521222835.23928-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/6] bash: Fix bash-ptest dependencies
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
X-List-Received-Date: Tue, 21 May 2019 22:28:37 -0000
Content-Transfer-Encoding: 8bit

Bash's ptest needs glibc-utils (for locale), some extra locales for various tests
it uses options busybox doesn't support for some tools, hence coreutils and also runs
perl for some tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2e7f261a2e7..4b3692c6139 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,10 +23,10 @@ ALTERNATIVE_PRIORITY = "100"
 
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make coreutils perl"
 
 DEPENDS_append_libc-glibc = " virtual/libc-locale"
-RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr locale-base-de-de"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us locale-base-fr-fr locale-base-fr-fr.iso-8859-1 locale-base-de-de locale-base-zh-hk.big5-hkscs glibc-utils"
 
 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
-- 
2.20.1


