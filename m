Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2057E35D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:49:21 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 4so12891602pld.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=6KDhRIqiw6n2S+kO3/47LmXu75SaFwrCQ3LnbyDYM+g=;
	b=EiMCraeSHMEGKMRZodcD5Mo3hhbjySwKQndKsJxUwmgB+67EvlcQx2WK+SvwbFsSOi
	6jVeO9syigjSmuiKmiE/ngMT7c4BYhBXKgccDHWhdD3ltrnDCDd49Ed+Qq56Vl730j3V
	efuNB8YTUCw6sPS1YlD+/r/FH3AtWSEWk3SeQetaHwAOQp8TeRNkcAbRXPX+zwC5VF8o
	wL1ZjLMJWYuQ2i/FKZImRPyA0owA3OnX9tXvkemG++8hDjQCUO4EeV2MIgQKndnqHaZ1
	PBfgJqhm0LNLP3Du7GSwai/RgjySE+X+TIlXSxRKDOwA9Qw/Mck8DtY3Wa9My1ionTnv
	2osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=6KDhRIqiw6n2S+kO3/47LmXu75SaFwrCQ3LnbyDYM+g=;
	b=NLbLv/5AAKBeOsZdPmTzoB5ae8ug3jY9Aq506Zy5qoduD1Xn8ODmrTqVg3WJo2KwkB
	YM0GQNI4dVyAV7T7Jho6tfX6X7QLLHG9QXCw8dWQPFQOzE4NLJ5PsDW6lYvKIHMNDcPq
	9Rxd0MWmWhxurkEGyKUbgnwhVdrvDsLNSF/ZKNQglWWZfeg2MTRY90WkD4rEhYOWPPDt
	VFWGpDR+teyThJc0C8cQNyQP0MRF9t9WISysiJ/yv7aWJEFRCtmOD2/ezJTk9azmIFWb
	ZzqsmVxSZahT/yEv/QLcMTecH7qf8lJ041hS1h2YTtqdQmUfGGI4/b2a3ZPjqr+Q2MDD
	1Big==
X-Gm-Message-State: APjAAAVZJG6evpd1qUit+IcfxBGh8CHywBuVW+GE/CurOl9zXUBOGSJi
	yBUhAPI4QJFGGsYk4lFs96FZHQ==
X-Google-Smtp-Source: APXvYqyUX+UdxMtHedIJ5oZPGnd8Rsz+eJVeTH3xB6VcMEl7S3RH+kdBPkvGw3/+D+q5J8wja4VBCw==
X-Received: by 2002:a17:902:8484:: with SMTP id
	c4mr47545554plo.223.1568360961986; 
	Fri, 13 Sep 2019 00:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	b185sm33595610pfg.14.2019.09.13.00.49.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 00:49:21 -0700 (PDT)
Date: Fri, 13 Sep 2019 07:49:10 +0000
Message-Id: <20190913074910.23384-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] glibc-testsuite: SkipRecipe if libc is not glibc
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
X-List-Received-Date: Fri, 13 Sep 2019 07:49:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

To prevent issues with parsing or dependencies, limit this recipe to use
only when the libc is glibc (and libc-locale is glibc-locale).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.30.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
index 64fa8d87df..657fd4dbc1 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
@@ -8,6 +8,13 @@ PROVIDES = ""
 # setup depends
 INHIBIT_DEFAULT_DEPS = ""
 
+python () {
+    libc = d.getVar("PREFERRED_PROVIDER_virtual/libc")
+    libclocale = d.getVar("PREFERRED_PROVIDER_virtual/libc-locale")
+    if libc != "glibc" or libclocale != "glibc-locale":
+        raise bb.parse.SkipRecipe("glibc-testsuite requires that virtual/libc is glibc")
+}
+
 DEPENDS += "glibc-locale libgcc gcc-runtime"
 
 # remove the initial depends
---
2.23.0

