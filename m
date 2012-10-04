Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlcP-0000jm-Gy
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:37:37 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so408192wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rQwMRIfNgtMdTa41VI08B0ez9KzMVzvhq6ZOW5vroyQ=;
	b=Mq+fGJabskBQCBzVEW0UZlRwKU8y7t/9WagAUCHOhCYokhTtjnYyH3Ftem7giZZyXf
	rHDlu21FowtSxYiiv1xHzjPp/Z6vs8V94NmtIDhTZzUC4Ai2ta3Rlzia6LunCdRaJG1G
	zvSAs/aZP0m2+tIwDSrRTyiafVZDngQLfA/T5A7Kq6yAw3nWNjnDoIhtnPaL2k8zux92
	B0sAmgL5JyAt4AGiXgBy6Ylwu00j7CplPH1Fd2ull9LPdOQ0je8emWpswEb8kPER1r2Z
	B3NpfX+mK6+Y1yzAfuMm14V29B+kuTzN7FbAxIPOVRK8DrXF2+8P0my1icJVUMhZU8Ck
	05cw==
Received: by 10.180.94.226 with SMTP id df2mr38101751wib.11.1349357076840;
	Thu, 04 Oct 2012 06:24:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm14648392wiy.5.2012.10.04.06.24.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:24:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:41 +0200
Message-Id: <cc05da7f236a0c8367c3cff3b4a0d297fe6a8dd7.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] scripts/sstate-diff.sh: add simple script to compare sstate checksums between MACHINEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 13:37:37 -0000

* it's not very universal, but works with default oe-core setup and
  shows basic HOW-TO, because many people still don't know how to detect
  machine specific sstate checksums
* someone can improve this with bitbake -e calls to detect BASE and to
  specify MACHINEs and TARGETs in parameter instead of hardcoded values
  in script..

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff.sh | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100755 scripts/sstate-diff.sh

diff --git a/scripts/sstate-diff.sh b/scripts/sstate-diff.sh
new file mode 100755
index 0000000..2d256e8
--- /dev/null
+++ b/scripts/sstate-diff.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# Used to compare sstate checksums between MACHINES
+# Update MACHINES, TARGETS and BASE
+# Execute script and compare generated list.M files
+
+# $ diff stamps.1349348392/fake-cortexa8/list.M stamps.1349348392/fake-cortexa9/list.M | wc -l
+# 538
+
+# Then to compare sigdata use something like:
+# $ ls stamps.1349348392/*/armv7a-vfp-neon*/linux-libc*do_configure*
+#   stamps.1349348392/fake-cortexa8/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.cb73b3630a7b8191e72fc469c5137025
+#   stamps.1349348392/fake-cortexa9/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.f37ada177bf99ce8af85914df22b5a0b
+# $ bitbake-diffsigs stamps.1349348392/*/armv7a-vfp-neon*/linux-libc*do_configure*
+#   basehash changed from 8d0bd67bb1da6f68717760fc3ef43171 to e869fa61426e88e9c30726ba88a1216a
+#   Variable TUNE_CCARGS value changed from  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 to  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
+
+MACHINES="fake-arm1136jf-s fake-arm920t fake-arm926ejs fake-arm9tdmi fake-cortexa8 fake-cortexa9 fake-cortexm1 fake-cortexm3 fake-cortexr4 fake-ep9312 fake-iwmmxt fake-strongarm1100 fake-xscale"
+TARGETS="dhcp"
+
+BASE="/OE/oe-core"
+OUTPUT=${BASE}/stamps.`date "+%s"`
+
+for M in ${MACHINES}; do
+  find ${BASE}/tmp-eglibc/stamps/ -name \*sigdata\* | xargs rm -f
+  mkdir -p ${OUTPUT}/${M}
+  export MACHINE=${M}; bitbake -S ${TARGETS} | tee -a ${OUTPUT}/${M}/log;
+  cp -ra ${BASE}/tmp-eglibc/stamps/* ${OUTPUT}/${M}
+  find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
+  sed "s/om_gta0/om-gta0/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+  find ${BASE}/tmp-eglibc/stamps/ -name \*sigdata\* | xargs rm -f
+done
-- 
1.7.12



