Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id BB0CC72E30
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:20 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2410478pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3ayxXIY6Lf4U0s3hOQk4mt2Bcr9HAdpy8sqdLKEZnQE=;
	b=kG5dwA409XwqM7LKanAcBIPwnvV7eYOtj5HjGtFHsbnXPxx4MBigbZV7lre2qbh2wP
	aLYR69O8uneKXU30DmdzX0XCk+1X9AS3L/pZ2aT5LZkfbeSYi9+hVu3gIc9oiMhovvMx
	MhkHuR5Jc4KUORuHuNZnJZNv49lDt5ddM1+oRhY/RZpvqq5tB0tNoiGrzoQrRDakJ3DL
	uEO0ei/FZCrNUAETJUCGaVc9iXUAhazZSd8yEw/AtMAKDn1rois7AtCBLT+Ifioxg5ce
	h6Odf4DEG++GdO3XrYnNzjY/7UAbqWIDW+4i0gH2RgIMnDsUSzwvZouZ3PgUQ+Gkcyoa
	Tf5A==
X-Received: by 10.68.208.101 with SMTP id md5mr6996766pbc.28.1423152321708;
	Thu, 05 Feb 2015 08:05:21 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:42 -0800
Message-Id: <b34791e4e1c5cdb60f1c245015021d254f697464.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 34/61] perf: fix for rebuilding
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:20 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fix for rebuilding error:
make[3]: *** No rule to make target `/path/to/sysroots/qemuarm64/usr/src/kernel/tools/lib/traceevent//trace-seq.c',
needed by `.trace-seq.d'.  Stop.
make[2]: *** [sub-make] Error 2

(From OE-Core rev: 9dafa571ed0a40d21a886dec7704c31150b21942)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2a47f52..19772d8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -115,6 +115,10 @@ do_install() {
 }
 
 do_configure_prepend () {
+    # Fix for rebuilding
+    rm -rf ${B}/
+    mkdir ${B}/
+
     #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
-- 
1.9.1


