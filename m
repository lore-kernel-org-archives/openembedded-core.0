Return-Path: <net147@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 19D206072C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:33:51 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n5so80961702pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k7PaCheGW5BaIWfNLqyS+Gcb4KvYxSiHy+WoEMC0Dhg=;
	b=Y/waemzH7QTo/35cMQY03MqxR8FmojxsWb9y6LaymENM3afGKQ/e0TeWd60JdSS27d
	4ZHq6JfIU8/PWHKrnSbvjR6ChkBHJeBo+TQLsjcc+mi3rs2Ed0dA28TSr/H+F1G253Kz
	KeU0iYB8ha7LyziyJ7kqG+rNtXLQzUU9BnO6y6bFLkwRq1lvf1kH+Fw0iVQ8yCmH8wU3
	9TN52FMdbGdEf3JGOcxr1EQXZNipUBX0W4CMPhG2sqTjbSFN2pPplUi4YzH0Z70jcSoy
	Lfi+nj9XEJlHTMiMZkzQZwUJavktZk/gp8/JgOntKUGRjxgHPeNWrZ3UeEi55x27S2Wn
	f0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k7PaCheGW5BaIWfNLqyS+Gcb4KvYxSiHy+WoEMC0Dhg=;
	b=QxsMf0zHM8poNKP9Esrb3smlVwQrycN3ZzT4JEo+ZRXaZX/9iO6c0ghgFmtma0qREz
	q3zjEk5agSKhDPDiLRhPZS8srg+7kdqvAUhywMAn2ImyNcAJ5lHiMJoByLk1+fD0yTef
	AzxdlPOzoHkPjxO62Zbdx/ZsylkfrLWBD6quDlpKqP5uUUezeNJXx1C+SlBnBkTkjc9c
	P7lXxwYD4yS68LDWjkbPhENqOG2EeE/kBG2GFtam3RR6Gx3/1qZcKKViIfZdSsfudHIj
	vu0BLij6xglGqoCbO62tVcibkaOy7gIT/8T0H5N5HMC3QOenSdnq1kb/1GK99PgU2bay
	3ChA==
X-Gm-Message-State: AD7BkJJgdnpBg5+YFVRHtGW4x0E5NDq6LN9gfR1il7f1gJymjKVGoD7x3PpSeF/mzAJv6A==
X-Received: by 10.98.69.84 with SMTP id s81mr20063303pfa.125.1458905632783;
	Fri, 25 Mar 2016 04:33:52 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	l4sm15958216pfi.73.2016.03.25.04.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 04:33:52 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 22:33:26 +1100
Message-Id: <1458905606-21234-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb-cross: use PACKAGECONFIG for python and readline
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
X-List-Received-Date: Fri, 25 Mar 2016 11:33:52 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 6e44778..2468d23 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,10 +1,13 @@
 require gdb-common.inc
 
-DEPENDS = "expat-native ncurses-native readline-native python-native"
+DEPENDS = "expat-native ncurses-native"
 
 inherit pythonnative
 
-EXTRA_OECONF += "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
+# Overrides PACKAGECONFIG variables in gdb-common.inc
+PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG[python] = "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python,--without-python,python-native"
+PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
 
 do_compile_prepend() {
     export BUILD_SYS="${BUILD_SYS}"
-- 
2.7.4


