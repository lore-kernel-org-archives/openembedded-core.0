Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id E7CC173190
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:36 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id t125so125241026qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IHYSlC96/tQwNdhtjXT/aeyuTMCBVSA81FhLIiiuCfg=;
	b=zv27eegp09HYQ4h/0PKVQ8uEVJfd5O6dFb564hegpj7ggvHSNH6iQcqztmC6kPKWA6
	Cmb00bQ7FgvVMg+Smq5txbd/IMgWBjFzYVzJxll2nbuceJ9E143Yu6Vs86P8g+87sXLa
	4BPYGXy4NEh7rqgPav/m8cymgzExMoAaRNKoaH+BZ7pzCRvBSi/Y7gpT3V7O/x7q7tsZ
	3F9LUmRqDspY8ceqe57X8Ix/Uqz6/SlI+slJgsLxuJT22l4gJBMTuzsnS0XNLWrbnmV8
	V2lWD/lamz1t4zAljYhvTE6A32JnCkV0iCWv0Jdq2jYjrOsBM/j9TmO2H+0WIGh3RH1U
	a15Q==
X-Received: by 10.55.212.92 with SMTP id l89mr15531081qki.70.1450569157785;
	Sat, 19 Dec 2015 15:52:37 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:18 +0000
Message-Id: <ab5e796a793f112dbfb186d31d9006c6ed78d03b.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 09/17] valgrind: Define __UCLIBC__ for uclibc based systems
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:38 -0000

Helps configure valgrind for uclibc targets otherwise it tries to assume
funcitons that are implemented in glibc like __free_res

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index c38a07b..c1c11d4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -44,6 +44,8 @@ EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpi
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
 EXTRA_OEMAKE = "-w"
 
+CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
+
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
 }
-- 
2.6.4


