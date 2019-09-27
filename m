Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0396D7EBD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 13:54:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b9so2878919wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 06:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7CxsfFv7znsCngzh1OUZ2VF5LWWAIP+WFnSVKuMcLnI=;
	b=obnkiVnB5guaoCRpsNtiZ9B0w1UnqlDa0xcmzgyzZ1pYJ0NiL3Zu0qx/b3KTPyLGlu
	+DkmzstOIEPLdh5FUg9NsUrtNUvLTWvsb+0eEjYCAroyZEhNLCQLnlJegk4bOmDYs8fh
	efGaK/8rnJUXM2YYE/5H5YA3LFCWcc5xoB5ivcc2n2AwlBclWzs9sB3TlCM6U+vJ4SuC
	8HIKruzREr6F2zeIq3obf0HofG0D2h/hof7Lz8PDY3FTeFavn+DFR6eoCpQA3NxnazwL
	ZhilCayXt2aONAU0bk7WGUllw9lVOQWqzq8CL/GSDwFy5DuToLwMBhhjIL5VCdukX2Jq
	yesw==
X-Gm-Message-State: APjAAAWyiHeO3zJ+APt9qjBudsTL347C7CdktvFVg6rgmHt+GH0kMrC+
	9MY5fBrvj1UGHMttRPoHYKd61zfq
X-Google-Smtp-Source: APXvYqxnCSVcfBUlQxpVfTWE1OcStsgvV72YUTWwiGOxFkvTrM1Z+98dMwBLCPd7qr/2XFLVqcYM6Q==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr3055790wrv.261.1569592485936; 
	Fri, 27 Sep 2019 06:54:45 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q19sm5051223wra.89.2019.09.27.06.54.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 06:54:44 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 14:54:42 +0100
Message-Id: <20190927135443.15407-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH 1/2] ruby: configure mis-detects isnan/isinf on musl
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
X-List-Received-Date: Fri, 27 Sep 2019 13:54:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The configure script does not detect isnan/isinf as macros
as is the case in musl.

Help it by providing the correct result via
CACHED_CONFIGUREVARS.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/ruby/ruby_2.5.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 8ad59a7657..fdd3852a78 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -32,6 +32,9 @@ EXTRA_OECONF = "\
     --with-pkg-config=pkg-config \
 "
 
+# the configure script does not detect isnan/isinf as macros
+CACHED_CONFIGUREVARS_libc-musl += "ac_cv_func_isnan=yes ac_cv_func_isinf=yes"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.23.0.rc1


