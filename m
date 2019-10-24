Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4450F7F9B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:40:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r1so16107794wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=f3VK8Cxv6jToFd/wrW9pnLEJoj+5f8VQbzZLhL8Nm8k=;
	b=RKgc9odskfkI1hJn8ikDU0EwzKWk9vVEi26mLocz4PUDNNlqe43fDwflrxVj4UkoMU
	xtdfu1T3WJWJW5hE9rLQkJZSnNDzQEQhC9iTCa/TEOw7oe8Iyc9kz81uwvINMqv2uMAy
	KeHd7DbQ66BCIIIf1yhl/pZu6Ljn2GqXTmBOfpghG8qVdE/OlR8aoykjSD03aQeG85IO
	H0BISBJZgs0IuuxUIjhBiJJnwUT7ys+jNMgWrMSge2DbdN7yxNQ30+zOqHq1ZPvREUuR
	S2hD7ksWZvdwlyApDPTxZf60U5YE5kCQJ2lF+coAbzGfVAmjcG97ytvY4G1NfvnZCWkJ
	SNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f3VK8Cxv6jToFd/wrW9pnLEJoj+5f8VQbzZLhL8Nm8k=;
	b=qfdeNq5wpxxXzjeLBvzT7Y4duzw9qkKjlUGQm/IF06Q/kl9QQb/MDO+7g0DJCzejs6
	aIR0p8kc5bpPkBg5qxiFnN5jgTntQFJf1vbY84urSNWJ80U7L5gwVgCw3isYI8rorWcj
	ijf4prKeRZs+QiBcLmXGYujBKWteX9jer5WIa3cX0PRooznUUAYi+ykjL3THHy7MPXOX
	LNn9HOvA/pRGs1T4erMgkuDDA1cW4ayAd7is6JKihdQAJgrC9wHblJNejXaQaQeCo9fK
	twYJVp3xc4VjcK2pcDGc8nBoznOQl+Dbt77mY7f/ean5+lQQXX1seqiV5eylLZN6oJLF
	CrOg==
X-Gm-Message-State: APjAAAXxc92lS9I7Em36+7o4Xeqrnm1mBNPyHZXPrDsBnelZ2kI0yQZo
	l7INr5OxUIVz//gWP8dKs4TqEALl
X-Google-Smtp-Source: APXvYqxaIBNAcuvRSsBjAARRDgssHgImKMcvOBFnbTC1jAP1uDD72SK6XSWgPnoUaHJBEp7pibH1ag==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr3677130wrr.98.1571920827588;
	Thu, 24 Oct 2019 05:40:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	r3sm41449205wre.29.2019.10.24.05.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Oct 2019 05:40:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 12:40:22 +0000
Message-Id: <20191024124022.2251-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] icecc.bbclass: stop causing everything to be effectivelly MACHINE_ARCH
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
X-List-Received-Date: Thu, 24 Oct 2019 12:40:27 -0000

* since this change:
  commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
  Author: Douglas Royds <douglas.royds@taitradio.com>
  Date:   Thu Dec 20 11:59:47 2018 +1300

    icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time

  the set_icecc_env function depends on KERNEL_CC variable even for recipes
  like linux-libc-headers

* KERNEL_CC variable depends on STAGING_KERNEL_DIR:
  Variable KERNEL_CC value is ${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}
  List of dependencies for variable KERNEL_CC is {'STAGING_KERNEL_DIR', 'HOST_PREFIX', 'DEBUG_PREFIX_MAP', 'HOST_CC_KERNEL_ARCH', 'KERNEL_SRC_PATH'}

  which depends on MACHINE:
  Variable STAGING_KERNEL_DIR value is ${TMPDIR}/work-shared/${MACHINE}/kernel-source
  List of dependencies for variable STAGING_KERNEL_DIR is {'MACHINE'}

* as detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets=glibc --analyze

  ERROR: linux-libc-headers different signature for task do_configure.sigdata between qemux86 and qemux86copy
  NOTE: Starting bitbake server...
  basehash changed from 3146f4ffeb002bd69fed7656a4b896365b2e2a00071c69e1afbb672889e754ee to f1a5160e39912e61389b6f9fe68d61146a2be91716ac37e4a32ecf4c09b2b5fa
  Variable MACHINE value changed from 'qemux86' to 'qemux86copy'

  $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1556122458/qemux86*/*/linux-libc-headers/*do_configure.sigdata*
  NOTE: Starting bitbake server...
  basehash changed from f1a5160e39912e61389b6f9fe68d61146a2be91716ac37e4a32ecf4c09b2b5fa to 3146f4ffeb002bd69fed7656a4b896365b2e2a00071c69e1afbb672889e754ee
  Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 7d94525d31..7d7ce811dc 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -302,6 +302,7 @@ def set_icecc_env():
     # dummy python version of set_icecc_env
     return
 
+set_icecc_env[vardepsexclude] += "KERNEL_CC"
 set_icecc_env() {
     if [ "${@use_icecc(bb, d)}" = "no" ]
     then
-- 
2.17.1


