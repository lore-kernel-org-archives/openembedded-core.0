Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 629257CBDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 18:37:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x185so1935729pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=C01P0+IhiP5jJfgrV+EoNL4cLzh41QDbrn7kFu/MvsNXCf/SOMoXh5QYjptC9e6sgW
	UuAHT7IlNMXc1E5QNpnPovkQFbT/rT7/79U3OLg+od+IlMuru8kfPNA6l4Wq/oSZi1MW
	I6iPE6WEqHChL/b/tzbusdbf0xOPP/jeWVBc2DW4FEVRjoD6SVMnCDhHkDzJkQJdPXeN
	smkAYVJEhDcmk3LkD3veeA2bKZBISTnOiXcEU8tWlmJtQoPY7P193qX+04K6KHMykxdf
	BTXEKy+z7mCqIPyEJLgJnIgf8tozWRqGkcT4YQDMBu+zHAcEYiJb8R2J/67YcwCROFvy
	srIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=QEWhN5AzSNwZqNvIkmv9lHTV/mCAN9lBiHbWo3Tq5uZcJ5pKiHbpo21EUWT/a9xhBz
	AeKRhIMqagOAQPhxDjqHrHXwR/81sm98cAzO10ZyfaerOOWuDT0uwywalb2RGltDJDnE
	1yTfdcdqaja5Otk9/RWYt/TAEWKUq1yhYhyUkOp807a9BRvjk19Tu34Fd1Nk2OqVbudB
	nadWk6F0Bv+lVYoFuseKKUEL7P1pOkPpGGwZpFQN4PtDSyRWf4tD5lWTPFydplczJSoD
	TRkA/oKHAPOoeIhx7Weq3jJNgDutvwQQ09kEmmaotq3b1E5AB2CcYZ7oAnpibuNOdhzS
	wI1A==
X-Gm-Message-State: APjAAAVliaEllRMK3uhQeuxsipPNl0CQYVJnnMNZF9TCHI7UOhZ9yuc+
	/MV9EiFtAsiE3BTEckTECiUyMcVhTK4=
X-Google-Smtp-Source: APXvYqxSs8JSeF0ovyVy9zVZg8/F2ZpiAayDmEaBGzpAqvg1tjKSdcWEMrmEm6n9Gve/XKdVg911/w==
X-Received: by 2002:a63:fc01:: with SMTP id j1mr176451pgi.220.1579804662808;
	Thu, 23 Jan 2020 10:37:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id i11sm3744829pjg.0.2020.01.23.10.37.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 10:37:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:37:43 -0800
Message-Id: <20200123183743.2066575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Thu, 23 Jan 2020 18:37:42 -0000
Content-Transfer-Encoding: 8bit

one of the build steps ruby has is that it generated rb_mjit_header.h
during configure using gcc preprocessor using -dD which emits built-in
defines as well, problem happens when this header is later included in
subsequent compiles, where compiler errors out stating that an existing
internal define is redefined

| /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot be used as a macro name
| 13849 | #define __has_include __has_include
|       |         ^~~~~~~~~~~~~
| compilation terminated due to -Wfatal-errors.

Since compiler already will take care of it internally we can edit it
out from this header file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index ce1b02f012..d5cd329e65 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -38,3 +38,10 @@ do_configure_prepend() {
     sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
     rm -rf ${S}/ruby/
 }
+
+do_compile_prepend() {
+    if [ -e ${B}/rb_mjit_header.h ]; then
+        sed -i -e "/#define __has_include __has_include/d" ${B}/rb_mjit_header.h
+        sed -i -e "/#define __has_include_next __has_include_next/d" ${B}/rb_mjit_header.h
+    fi
+}
-- 
2.25.0


