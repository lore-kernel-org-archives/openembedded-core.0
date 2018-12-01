Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id BB66B6C68E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 03:01:52 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id z7so1597709iti.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 19:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MIgyym7Yks1KCNnTcRD41Wi3th7e36tZqtaowaNhLos=;
	b=DQarfBcV/7a9aIBWM/n2nVdqecB+mc+xk9790LRwLrbAmA1ChOkGeFs8gx9X5HNqTF
	+X3YbCoFabazq7z7h7aOM+WDrRQhgrM3EPLpTa+AxsoVs2Xo3JSH4YD6M7OCJ+eNEylM
	DFuzhd8ZLuA+ZNfav1fV92X+Cl+1AjztX31E586lVkpBVtc3mMvjTDrf/jPXCktW5JdR
	6VxtvqxmqDB2FC0tv3Jc9KZVkt+bEk1B+2JQ09qtjpqQUGl4NS1mfZSjRt/MesJD1JAc
	RzVme5rrScSJ3zeN9kzwl+Rv8o6WdVCLa0RORI+H+U3y4uK+klP8qJTSeD9ZUYWouDIO
	dHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MIgyym7Yks1KCNnTcRD41Wi3th7e36tZqtaowaNhLos=;
	b=WjKlS4uN7LCcvUXBhOWj6tR0W2s628WIdZI/6I8n52/pHkUrLHm8iRrb+8TuBNPTF/
	ssX5WaHk+PKY7fTHvWWMj8xXbYh1BRjxd2RAs+lvg6aab8w0eFiwxutJzcOnrLSupnyo
	VnrQgHbnm+hQNhdm+531xVYF8pdWU2US0AtPrbWourlzXsVt7NYXPgLRnBG1J+mn6WtW
	FUX7DFgcP6XnRAc8iZiMT8HpL0I+B1iGiSCl/paSfglMC2sZqUoEJ0+dhAPC0zcDrLeZ
	15fE5tkMvqjOL6HZSbGTgfsPucEzmLpqKpZWsCj0qM1BaQj27gTpNsI3UBXd7vCyotYJ
	CYcQ==
X-Gm-Message-State: AA+aEWZdFupV6uWz2bXihe4jpUvR2aCqcz7zFjq5iUi+5Lcwo3l5X87c
	yMk0trVrhgVa1bC+NZlz4yobcpPzRVk=
X-Google-Smtp-Source: AFSGD/UKI9auJAxKgrsGR+zg9iOn0fL603X7z/xcYeYfgviUjabefLPOsxGx4ySgdw2S63oWIZj8Ow==
X-Received: by 2002:a05:660c:a50:: with SMTP id
	j16mr1039742itl.52.1543633313442; 
	Fri, 30 Nov 2018 19:01:53 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	z133sm464756itb.36.2018.11.30.19.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Nov 2018 19:01:52 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 21:01:42 -0600
Message-Id: <20181201030142.9385-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181130215537.29981-1-JPEWhacker@gmail.com>
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Sat, 01 Dec 2018 03:01:52 -0000
Content-Transfer-Encoding: 8bit

Waf requires that the current working directory be ${S} (the location of
the wscript) when building. Most of the time, this was true only because
B defaults to S. However, anything that changed that behavior (notably,
using externalsrc) would break the recipe. Remedy this by explicitly
changing cwd to ${S} when running waf commands. As a happy side effect,
B can be set up for "out of tree" builds to keep the source directory
clean.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 19e93761b39..8e6d754c299 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,6 +1,8 @@
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
+B = "${WORKDIR}/build"
+
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
 python waf_preconfigure() {
@@ -22,16 +24,16 @@ python waf_preconfigure() {
 do_configure[prefuncs] += "waf_preconfigure"
 
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
+	(cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
 }
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
+	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
 }
 
 waf_do_install() {
-	${S}/waf install --destdir=${D}
+	(cd ${S} && ./waf install --destdir=${D})
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.19.1


