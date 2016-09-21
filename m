Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2541A60685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:30:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w84so6602508wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7BsLNdGGUqEbwCc3q5xx522DKL0BrpHbrbfugqkvpXU=;
	b=oCqYoCg68MuF5P0Ny+pg8TPgdytW6LNSCErvPuzxn2SgsdhV25mhwcKGbS2N63IGtq
	1RS2HBlRrhajmxts7jSQY+KV1ivdozMEBndG1B7Y3nukIjNP4dpue3uL0hVziWX4bhXB
	QMLJolAiHwRXDRteBStPF41W0FCBViytN5enzZb+JR7aBcT3uZqSIXsYjK+xmqaeuagr
	8c+94U1J1ofDGi/p5r4kyvM/UUNyztSrd4NQrOYC1xBV91wF4XeeCo21SXFSNGZORLqe
	igRfcKMJc0FqAC1K7B/r6Xsh5eJ00lRQo51PmyJZBgHS/hmDUXukBgaXX6Dyz7ikAWJV
	UiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7BsLNdGGUqEbwCc3q5xx522DKL0BrpHbrbfugqkvpXU=;
	b=SuGD5mgz98pP+wbKs3pgBeFaNXg8fu0DDBXfepg04XntBrfQt1W/bOqwfzbpnXujQ5
	5xrWLu2IVmn9OOskrHvRfITV8HOGA00eXJp2uRSdALEhwhiMGVHHMCqS6x2Byh31fyFS
	2/8cqTWZywOxuGRXsdUo7j0UZQRjRbP6jh0oce4ZsJN++cC8GTy8gfYZ5BLrjmRBTnn4
	1sPGj++EsRpeXtjxGFGdYr+iO/XYpbmFtvUq3mzeSyEDABf9X0VZ961qnZhnf+hKEaqW
	xb9N2O/NoItcBEDikQJuaH4Eb0L6lME+56ZGBfArrD9CLrlLsASCDJASHu4uANbfTxxe
	FhcQ==
X-Gm-Message-State: AE9vXwOtV8RlN98XZ+WtBesplSWE3ZUPQ0ORvCYNuQ3eP/IiCl6fgOox542S3QlolZMSjA==
X-Received: by 10.194.61.203 with SMTP id s11mr37134212wjr.141.1474435858947; 
	Tue, 20 Sep 2016 22:30:58 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	bk7sm31695802wjc.36.2016.09.20.22.30.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 22:30:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:30:43 +0200
Message-Id: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] libunwind: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Wed, 21 Sep 2016 05:30:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

works around:
<native-sysroot>/ld: error: Gperf-simple.o: cannot make copy relocation for protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libunwind-arm.so
collect2: error: ld returned 1 exit status
Makefile:1038: recipe for target 'Gperf-simple' failed
make[1]: *** [Gperf-simple] Error 1
make[1]: *** Waiting for unfinished jobs....
<...>
<native-sysroot>/ld: error: Lperf-simple.o: cannot make copy relocation for protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libunwind.so
collect2: error: ld returned 1 exit status
Makefile:1094: recipe for target 'Lperf-simple' failed
make[1]: *** [Lperf-simple] Error 1
<...>
ERROR: oe_runmake failed
<native-sysroot>/ld: error: Gperf-trace.o: cannot make copy relocation for protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libunwind-arm.so
collect2: error: ld returned 1 exit status
Makefile:1042: recipe for target 'Gperf-trace' failed
make[1]: *** [Gperf-trace] Error 1
<native-sysroot>/ld: error: Lperf-trace.o: cannot make copy relocation for protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libunwind.so
collect2: error: ld returned 1 exit status
Makefile:1098: recipe for target 'Lperf-trace' failed
make[1]: *** [Lperf-trace] Error 1
<...>
<native-sysroot>/ld: error: test-coredump-unwind.o: cannot make copy relocation for protected symbol '_UCD_accessors', defined in ../src/.libs/libunwind-coredump.so
collect2: error: ld returned 1 exit status
Makefile:1186: recipe for target 'test-coredump-unwind' failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/libunwind/libunwind_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index cd4cb89..4249430 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -26,3 +26,4 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
 S = "${WORKDIR}/git"
 
+LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.5.5


