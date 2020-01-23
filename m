Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id EBDF87FDBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:00:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k3so1914998pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=ZRgrTUvnJ/yk7laAmkHD/gPgV5S4JzF7zo6+pehYHiMQ7KY7yAxrOBng7GC9EU+HMU
	/mxycNQuvwSlskWUyiel23tQS3+oQJccPzf27hl+w8L+kSe2W3gCULsLn2IhdllxVqXl
	A3zLpOoHKw+KRTH2dYk4e51vR70uK9pt8NUOhrjdtxPuqWEDbmZYrEYnoBi2um3ZcgGQ
	ynEtYTKKY/8MnU5UMtnAFwp8CvqqbBK2oXlCSyugZ/S+XgHQs47yqnSEqeqrDBj4GySV
	A+m3ayug13zaN3qmTPN6PGklQv5XLi+PreaP7QqDOwGDEVZJ2Pbwcuhg6HAIoPL2IvBq
	97kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sE7TSJOUYXTMzs2bctDRvRSiGd4A0vnqMEimPK4jjlk=;
	b=A+KpRkyendFJoYOhNKSSvbhhxmhjwDE9mjst1MbQDNicQVRtFPR7Lk+1hD+J2/gwOF
	0JZnVzkU68yi0s+Kt6BvEp0aNVw9Yv+ghlsHOJkLlLDo39BxWsw8AXjZ6Kr6CX8bB6U8
	50I5yPW9Fd8tRxFlI8mijYREve1q6ZVsajjZnpnQcugSXtDbDhhDQcMn6QPrj8zX5sKt
	O13A/KaHCtDSUsyo/7H83+XWdU0+9tjt4zE/8toL6genyNhOt6Hqk4LLPrBnPsq1gkou
	usf6K2Kg19VCODQrRQPIyDKAxo593y1SfruRlGZTVps9mxjxzIjpSPKjvj7tc/Q6d7iW
	dHmg==
X-Gm-Message-State: APjAAAUpK7K2GKabtvHPz2PTw5krUOkLYLOK+TNgmxSdixIS2Kp05n81
	A1znboAWGq7ltqU1GlyH/KRAPO4UqCw=
X-Google-Smtp-Source: APXvYqwGTfSXEDkDRn+J5K4CIHssPtU6PMlcaBufBCJHZtRPTznz3a4h0XdSPg4rbMoKdxBxHG+yjw==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr80781pgc.34.1579809640456;
	Thu, 23 Jan 2020 12:00:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	y38sm3806967pgk.33.2020.01.23.12.00.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:00:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 12:00:39 -0800
Message-Id: <5bbff3f65ae625a81068fadc339b423bac7fc1e5.1579809439.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579809439.git.raj.khem@gmail.com>
References: <cover.1579809439.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Thu, 23 Jan 2020 20:00:40 -0000
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


