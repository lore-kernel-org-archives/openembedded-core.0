Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCBC7D431
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 11:59:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g3so16008797wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gMfyllPZTao99dveLZ+eh2A6h9eon/6DCO1+MTSx/NU=;
	b=XSBs6RnAPiqqcHC5BkwV+yhzdES5l5HadWv/154Wtt9g+IIEEvGUwcLtO2bB4rG6ny
	jWthNbTNDv6w6yEdsO/zh+eoPrpQKdawK63K2e/kBjNLlkpShW/l5KT2TN/jNb+hZgBo
	TglVV2caNpyZzVTKbJTleSJ7Y/XqHCRHXHCfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gMfyllPZTao99dveLZ+eh2A6h9eon/6DCO1+MTSx/NU=;
	b=dvTlB2Zg5OgHydrZVZZQaRZsXudFOk+KyJgVZcVQ1dKs4Vzj1u7gVMjIMSIL804lQ2
	TGfBMI85iZes1IWqx1VKorBEYK99gCofqA117Pq40QOcw4x5+KJl3AIHXNQJnzjTKVLM
	TRImcp3LKRrs32ZNhin4mlY2lLoqsl2E1/xGPsAQ5YGUFUEwZSWYS6Q+rEd/5SeXA8aB
	bpde+q1WNJbM86bMCv+CTTPDtuUd2l++RLsmDJfylPCaV2gLvN/2P9XISCaA+pYGduhX
	RNV+FNqmRO3l9x348TF7CM+RGTOVmm0uN59l83UG3rxe0PnvaL45n0SyFnJdwKvmxaCo
	jvUw==
X-Gm-Message-State: APjAAAX5yxRXlAIYbDi807ktnjgfqG72DluMN/STVHYgJxv0vXgeEGJp
	mnJaOocRU1ei1ermYfhYqOQoNiUC+Vg=
X-Google-Smtp-Source: APXvYqwykq/C/6T8AumygDDsqmj8ju+FgNpPJNNZ/X6tMXyZkkL/aVOpwywCn963EIaYSecXGSbV2w==
X-Received: by 2002:a5d:69c1:: with SMTP id s1mr18332059wrw.245.1554724778525; 
	Mon, 08 Apr 2019 04:59:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s1sm21654036wrt.43.2019.04.08.04.59.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 04:59:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 12:59:34 +0100
Message-Id: <20190408115935.16945-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
References: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] openssh/util-linux/python*: Ensure ptest output is unbuffered
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
X-List-Received-Date: Mon, 08 Apr 2019 11:59:38 -0000
Content-Transfer-Encoding: 8bit

We need to run sed with the -u option to ensure the output is unbuffered else
ptest-runner may timeout thinkig things were idle. Busybox doesn't have the -u
option so we need to RDEPEND on sed (which is a good thing to do if we use it
anyway).

Alex Kanavin should get credit for discovering the problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb  | 2 +-
 meta/recipes-core/util-linux/util-linux.inc         | 2 +-
 meta/recipes-core/util-linux/util-linux/run-ptest   | 2 +-
 meta/recipes-devtools/python/python/run-ptest       | 2 +-
 meta/recipes-devtools/python/python3/run-ptest      | 2 +-
 meta/recipes-devtools/python/python3_3.7.2.bb       | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 36a3d2a7b7b..daf62cca5b1 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -5,7 +5,7 @@ export TEST_SHELL=sh
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
 make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
-        | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
+        | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
 GDB=`which gdb`
diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index 2a23f64b894..6260135d5b2 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -144,7 +144,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
+RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 18c3af240eb..c7ba8c446f1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -142,7 +142,7 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN} sed"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index fbc2f9b56a9..8c57bd20740 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -16,7 +16,7 @@ res=0
 count=0
 for ts in $comps; 
 do 
-   $ts | sed '{        
+   $ts | sed -u '{        
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
diff --git a/meta/recipes-devtools/python/python/run-ptest b/meta/recipes-devtools/python/python/run-ptest
index 13dfc99efd5..c7002a4560c 100644
--- a/meta/recipes-devtools/python/python/run-ptest
+++ b/meta/recipes-devtools/python/python/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python -mtest -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python -mtest -W | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 20c9274dfa7..50f92916eb6 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 -m test -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python3 -m test -W | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 3d44bdca911..4ff8cff3a1f 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -285,7 +285,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index c459af06f10..62051a227b8 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -176,7 +176,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils sed"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
-- 
2.20.1


