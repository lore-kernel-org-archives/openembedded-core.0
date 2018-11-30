Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6BA6BD11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 21:55:39 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m8so3002913itk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SaFG+2wAFEyaAE1CbjdwMFzZtGjQitcGov3Fr1J/MSs=;
	b=EUGus7G7rlUUONCwuIvQkFLWipAZ0Fz55IabT2gh3WzxO1eJJ8QJ3iBmWezbdMShaN
	RRyPt0CdZQq/3gzAZTrb6SCXi0FNdN7XafgBsoDiqUI1fGph7F1remUrd6htVqi8t+7k
	GeK0+7elCmVj07gZVws0lH84tB6EsYFmYyfMwxhhKQhFsP2vZvTSvjlTFfcvQ1DVfzgE
	ZrHhlUoZWQt+PcZcuSKsLlVwXEcSCy7aI0X95/KwO/h8z517R+7CqgGUdgItZVjkLMWM
	dUcazwBG7v++fKr+UXTB8SeYN8wdbRoktO46IdqnxEBpNcSiiGyT/p2yyQQ6gNpGRHL0
	ilnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SaFG+2wAFEyaAE1CbjdwMFzZtGjQitcGov3Fr1J/MSs=;
	b=PjDpfmmgXGiReixuGb8LoeUOBN6C9cIGqqKGXi8PgO7b/PK1feEExTlH+f3Pu2W6p9
	kD3ZuQfeBAjgTU81WSTaPyvAVnmVKGBOMAfrcDvwCEhibi++2o3tjtmxeXgNhNiPkoux
	DgP6eFfjDvG5v4nqOGq/Z0dJlgtHge3p5kG1+U/q1h7K6ljb8ewBQ9Vk9dCOTtdg6Unc
	lJ5YVqJKr1T3zEvFF+tmfkD1fro8crWnN1+16yKDw98ovSuYfhjkmfHb7L9jN4d5Qu4u
	lVbhAkSjToGWgQIHw1TKRLmFFvXB47qUtajMum3GnyqP8AO3uLUI8CyQMQ7v15BEVAl1
	V3IQ==
X-Gm-Message-State: AA+aEWbnIe76ySX+ZjDKzfpMmqPyj7rJuhMCsOVxd0iIVIywoujevZ1v
	lqa8bB5JXds5Sw2cMMosSSYh3Bvm+bo=
X-Google-Smtp-Source: AFSGD/XXvji8fmVoguzXMrrds1PdTwrbfPBlU0q4auQi27kvBPGjl2rOI0efcduD55k6/BIYtfuJrw==
X-Received: by 2002:a24:a141:: with SMTP id n1mr483624iti.31.1543614940722;
	Fri, 30 Nov 2018 13:55:40 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id j1sm2197512ioq.85.2018.11.30.13.55.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Nov 2018 13:55:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 15:55:37 -0600
Message-Id: <20181130215537.29981-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Fri, 30 Nov 2018 21:55:40 -0000
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
index 19e93761b39..9cb5b68f449 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,6 +1,8 @@
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
+B = "${WORKDIR}/${BPN}-${PV}"
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


