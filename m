Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B7F9C60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 19:48:15 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id s21-v6so3448863pfm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pQcSlBCnA+/dI9aLyxjjC41QweKBkhjNc98yDyuFZwc=;
	b=B6xComefI9qZKRCCDdiX9q4X8CR+UQw3tsCY3zL+7RY76gmNKz+ErmTijDcgUhdvgt
	gJCLK1DefA5dB/RTiovuAqzmFXLHZ5wT7ZZg34pTuXkWR9a6FvKRsNcxw9qRkrS5HA2Q
	rtLtF4qkKSCoKIO2U3KgjxE7NhLCCz0/2xJMIQuN3RyeLz+sDovjpJgJv3b50SgDhffI
	Ypcw5hT/71JJsS6TFBRg4WsTHo3mzTFjjTGxIBeWAvQYkj52vh5ZbWyBWk2Gtrmb30Yq
	nN6KVLGPUUScC4npKH6YNmLFCmiwtrhSa22nuO8xgnv626uM1WaIs+G1p+uBYiNK0O+u
	LrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pQcSlBCnA+/dI9aLyxjjC41QweKBkhjNc98yDyuFZwc=;
	b=HHvQIcM8xQWA9xFT9zGztrFEs0lTwY5nwSxgSrJVdY6Do7Z0oBrPR5AYr9/4ZEK9jU
	CpqlwZmaZ9tYlcH2zYukiwCjws17m4G0KnGR7Hp8+XWseplFo6aJZEvKlqNz3MwsbgvR
	U9qUMfcKi3X4jl0epL+xWUZY4TLgEq+ZOiWDqWZF26r5Q6Bp3Alt+Hp4QxlHDs1cTx0w
	i84a0bfwU4e6nIuM6Nf6qqmdrkSyXTP2q5WFwZvDW6Xv9ByTRJvR05PAUavK6d4/OOuh
	Vh/0X9kEG/mjJkxIpvPPLVFz1Ihsy2WlpVHRWASdUHEYnr3O8D+0JE3hR8xlHJAk/NJp
	1bwg==
X-Gm-Message-State: APt69E1QdACZRrJKCLE8o7QGzea/5SKokyrl8MPK8QbDeeXpTA5swe+p
	Mt4ojdH+T40lO0p9EnbeuNDF/Q==
X-Google-Smtp-Source: AAOMgpfqNw+bwY0PeCLVtx/i3clFSfSMd7YawminsqbbF2E1Qr2p2mvFaPVAGEGNf6bBByyajvyTOQ==
X-Received: by 2002:a62:170c:: with SMTP id
	12-v6mr2835109pfx.139.1530042496751; 
	Tue, 26 Jun 2018 12:48:16 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm4823400pfj.173.2018.06.26.12.48.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 12:48:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 12:48:11 -0700
Message-Id: <1530042491-25646-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: handle cmake -dev files packaging with default rules
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
X-List-Received-Date: Tue, 26 Jun 2018 19:48:15 -0000

Move packaging rules for cmake -dev files from cmake.bbclass into
bitbake.conf to handle recipes (e.g. harfbuzz 1.8.1) which build with
autotools but also install cmake -dev files.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/cmake.bbclass | 2 --
 meta/conf/bitbake.conf     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fcfd5dd..fd40a98 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -54,8 +54,6 @@ EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
-FILES_${PN}-dev += "${libdir}/cmake ${datadir}/cmake"
-
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d9f7b66..f0ac614 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -308,7 +308,8 @@ FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                 ${datadir}/aclocal ${base_libdir}/*.o \
-                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
+                ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
+                ${libdir}/cmake ${datadir}/cmake"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
@@ -318,7 +319,6 @@ SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
 FILES_${PN}-dbg = "/usr/lib/debug /usr/src/debug"
-
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-- 
1.9.1


