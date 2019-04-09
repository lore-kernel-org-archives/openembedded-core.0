Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC4D7D537
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 05:44:32 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id j132so12549274oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 22:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=mACFS0tFY5M15Du57KTSWv2tT+u4f+C1uS2xoQHg6wxZHJEusFBHnQvN6WDjUDWxko
	IaR5BgZbTLeIe7dYAHsYGvU4RsDcyOciVQkCtAHDtlWs02iEY+UL/1z0mw5fvz4pwZy3
	bKLt0IlmHu9FcVDhTFAEFywLHArDNjJ98yg2/xY743JWoq+32zBE84Vq3xbqgjZNFawa
	rpe2g8dKLZan5fuDwqgbz1ueo3U3+RQBN8zF97ROSyzKPPzndgCQ/mK7FNvyA6KctJIW
	DdXqNanNWNxhdGX0R+XY29vdKUl577wzpwv9U1pASOAMRI9ASeiyGtcyOmIDJFj84suN
	+1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=ql2ZBaylb2JQ8oZvZATCHcMozpcTJMhltE8Isij6viiG4woGfdsrllpspxOwZoC7nx
	s0p9mNDssL9l2Z3zzbQ1zAbvUelJvTWjAZK9ZU1+SiyHSQU9zyTlmo6CLRl+YswzlSMP
	BSA80WAejaT7tBXbs/ljRg6xdLIqzBS2yD74Pbs2yHnezN14IZR42VSpYYeiW5DK9aIS
	tFMq0FkHnv4RqBGvIpUIv9nxX+2r6KPAlsx93PfudypoCbEJ0JEEwk8M07AkvAPtO6dE
	LcC+Fnqyq87jwxPQi+c+XW2sz9FeAShNimNVFD1YY58z73rBgkrYhvZVcWJfdQmzLTwW
	BCxQ==
X-Gm-Message-State: APjAAAV9kHJc3tXrpRhABTIqSY2AIGc7tx74tNh5Zd9dpElvEGGDVwd0
	Sc8oSJyTLSMlRt2fnl24DTuevy/o
X-Google-Smtp-Source: APXvYqw7BSIAKeEcO1lQykOBarEMgqba/zFWYCk+5aJIwB9UM1FlcMd97Q7APSWQg3Mgfhy2T7T9Yg==
X-Received: by 2002:aca:df09:: with SMTP id w9mr17458366oig.94.1554788673116; 
	Mon, 08 Apr 2019 22:44:33 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	n16sm11787705oic.7.2019.04.08.22.44.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 22:44:32 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:44:15 -0500
Message-Id: <cfb0203279505b6f3392353e05d2e86ab37bf096.1554787765.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554787765.git.just.another.mariano@gmail.com>
References: <cover.1554787765.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4 4/4] busybox: Use PTEST binary directory
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
X-List-Received-Date: Tue, 09 Apr 2019 05:44:32 -0000
Content-Transfer-Encoding: 8bit

This will generate the symlinks in the ptest binary directory using the
ptest class functionality instead of generating them manually. Because
the ptest class uses update-alternatives to get the metadata for the
symlinks it will respect the use of BUSYBOX_SPLIT_SUID automatically.

[YOCTO #12597]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c9d25ff1ca..174ce5a8c0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -347,24 +347,12 @@ do_install () {
 	fi
 }
 
+PTEST_BINDIR = "1"
+
 do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-
-	mkdir ${D}${PTEST_PATH}/bin
-	if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
-		while read link; do
-			ln -s ${base_bindir}/busybox.suid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.suid
-		while read link; do
-			ln -s ${base_bindir}/busybox.nosuid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.nosuid
-	else
-		while read link; do
-			ln -s ${base_bindir}/busybox ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links
-	fi
 }
 
 inherit update-alternatives
-- 
2.19.2


