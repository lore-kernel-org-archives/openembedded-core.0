Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A657751D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:48:54 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m24so875885ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aIDWVa89M/TbcD5h5vsORsia3J7n2HU1k++z9DTFBI=;
	b=XC7pr91ExzVwfOMsCCjOF0aZtSEmmrv86+OxwytPRNpdw5tgKCSOqhPAgIU6yFUI+b
	BIjmwH98B0jVlbqev+OBFDXTe/AjQG9n3Wnin/fJ08Ayf6kWUF5o1MUiSYCRJOXuvPBI
	zE1NbB3gBjpBvXkP2DO1eM6KuZ0NxzaFvrDpVw+r4XSEN7jbL62EHKVpkSGrhcrukeJS
	1maIFycJhrvper1kv4aJoSVGcuYhYchfjDdaLKSlNGNvNxSy70AVOR8R+3R9eIJDYNo1
	L9HuYKR3TXTJnX+/Dy7tlbpwhf62oEkOG0F0o4+vnWMD/UGzMsYkt30IG3HjN/7cy2/u
	L4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aIDWVa89M/TbcD5h5vsORsia3J7n2HU1k++z9DTFBI=;
	b=AsUe0xfvQykGV/ezj0gPeBRUXidk0pvZ18b+eSCdr3gVZbpwqRj92QsLa9uC8gmf0O
	6/Mz/5OXG8cBIii7talK3kxZVp8+F2D+5uHykSErNF36vLoDr1D+/VImB6snSnhhrhaZ
	pbKDINEUSC6TTNQk3LxpkhcY4RxPgVUdckRZeMMD1Po3ro/Jlsl8C5Y0x2itXQpChj7j
	so5n1yqBGlqz9gH+HPLf7nvEv+Hj8v57Fmn1VgI6hiifgKUQBncIuawvjFnHqyL61sun
	9biRU2dalJoI3Y26N9dANTmceR41sqKd90lFLsBlPY6YvMm5ECfEwEWUTB1y0ZbaDo0Q
	gCrA==
X-Gm-Message-State: APjAAAWty29FyVPyh92DsvmbwquhJYZquiAgR7pGCjAyaDbgUihNdKor
	gE8skhV4kEa+zUJPYV/d75scMFkj
X-Google-Smtp-Source: APXvYqz0VyQeR/sLAmcP43qa6LjvJFKNz/0YH9pLG1YtB/0+DwUsAbFa64uUabZbTSy//8K3ZdmCjQ==
X-Received: by 2002:a02:bb83:: with SMTP id g3mr47657775jan.139.1561045734928; 
	Thu, 20 Jun 2019 08:48:54 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id z17sm112612iol.73.2019.06.20.08.48.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:48:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 10:48:44 -0500
Message-Id: <20190620154844.14119-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] perl: Improve ptest package reproducibility
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
X-List-Received-Date: Thu, 20 Jun 2019 15:48:54 -0000
Content-Transfer-Encoding: 8bit

Fixes a few reproducibility issues in the perl ptest package:
 1) config.log has a lot of paths encoded in it. This file is
    unnecessary for ptest, so it is omitted from the package
 2) Makefile.config has a lot of paths encoded in it. This file should
    be fixed up using the same rules as several other files that are in
    the package
 3) Paths in DEBUG_PREFIX_MAP are not being correctly removed from files
    because DEBUG_PREFIX_MAP is now several command line arguments.
    Instead of requiring an exact match for all arguments, remove any
    matching argument.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 9dd9b7da57f..7152057762f 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -2,6 +2,9 @@ inherit ptest
 
 SRC_URI += "file://run-ptest \
            "
+
+DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
+
 do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
 	sed -e "s:\/usr\/local:${bindir}:g" -i cpan/version/t/*
@@ -13,7 +16,7 @@ do_install_ptest () {
 	    --exclude='win32/config.*' --exclude=plan9 --exclude=README.plan9 --exclude=perlplan9.pod --exclude=Configure \
 	    --exclude=veryclean.sh --exclude=realclean.sh  --exclude=getioctlsizes \
 	    --exclude=dl_aix.xs --exclude=sdbm.3 --exclude='cflags.SH' --exclude=makefile.old \
-		--exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
+		--exclude=miniperl --exclude=generate_uudmap --exclude=patches --exclude='config.log' * | ( cd ${D}${PTEST_PATH} && tar -x )
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
 
@@ -21,12 +24,12 @@ do_install_ptest () {
 	find "${D}${PTEST_PATH}" \
 	     \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
 	     -o -name 'h2xs' -o -name 'h2ph' \
-	     -o -name '*.h' -o -name 'config.sh-*' -o -name 'pod2man'  -o -name 'pod2text' \) \
+	     -o -name '*.h' -o -name 'config.sh-*' -o -name 'pod2man'  -o -name 'pod2text' -o -name 'Makefile.config' \) \
 	    -type f -exec sed -i \
 	       -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
 	       -e "s,-isystem${STAGING_INCDIR} ,,g" \
-	       -e 's|${DEBUG_PREFIX_MAP}||g' \
+	       -e 's^${DEBUG_PREFIX_MAP_REGEX}^^g' \
 	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
 	       -e "s,${STAGING_LIBDIR},${libdir},g" \
 	       -e "s,${STAGING_BINDIR},${bindir},g" \
-- 
2.21.0


