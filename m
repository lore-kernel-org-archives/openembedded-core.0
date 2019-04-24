Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3E77D5AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:32:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c12so19871392wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9NVAfQ6seIXFQqR8pCFmVv4a6+YKhW/wCyn7Py101Wg=;
	b=aV0XfTJ1q1F94WuG/F5wqq8qXYkSGS0qT4p1t9NnhWeIfCiBPp/wfTTQTcfTkrwHYw
	x3zh1tcx/PeQshZ08WGuAfgDRT/Bz3LMKkGInMZZPSjFQweNzuM6ohPyyrjL/oHCVbrG
	x5mZgepSp8EJtsvtFUVLAQLDBdjJkuR19SMlLva6mmLAHIOWUqOZ23XYmFOTiJIcc+KB
	zx/bmk9AdD8J+Na5yShkyDp07SMb6zZQl1M0rucOXzI+QsU3ktPH5bvNpQ9twQQV+xtS
	+p9TtgaW4OxSxSlwRI6kfYgchL0rQFJ0kJNapLNx4+E3WC+dR9k+0bmnrxQY1qdWVq6g
	kNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9NVAfQ6seIXFQqR8pCFmVv4a6+YKhW/wCyn7Py101Wg=;
	b=h62Jxr7xNLyBEfCgot5kGrwoyKX/2srH8jmYaKC1rEljYfNnQUueKl1ZNCgfaTekCq
	ArE3zGCgYgD5poPX+Sen7kKZcpamQerSzpfbNiCOo2hDFE9w/wIDWAtAM1Iv1wJzHTUb
	8x8cpOJB1bygifA8ufelYTCdOpBZXHbJvXKG8JI1q8q0HqgCfTVYZ1dB8Gg75fRufUvK
	Qah2koICopL9pntw3ZONWfjGN+zSBa6lE/7GkKmFsThWj5BtN0QS/i0IhyHO3PcU2G6n
	cPXmPi2Wa7pwOBFDdjFGuUcwUfDjQEiAvX2i3sEGS/xCdZ9wQuC4VHB/AgqIB48RNZOW
	+m5g==
X-Gm-Message-State: APjAAAWem8glj3yPGRtsmXrwgbuk2kwiTEjfFmpaG3hpqNNbTxBztdY8
	nw8aqnVUTDgGTmcGqJatQqan0tJ6
X-Google-Smtp-Source: APXvYqw6sLFoccdEfL7V0w1wBdSv7cYp2xThY3rgLwXDaJH7jCeh3y64Chkdu0n77UPBbd95Se3r2g==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr7267484wrw.24.1556123571545; 
	Wed, 24 Apr 2019 09:32:51 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o4sm24517678wmo.20.2019.04.24.09.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 09:32:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 16:32:49 +0000
Message-Id: <20190424163249.16077-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] icecc.bbclass: stop causing everything to be effectivelly MACHINE_ARCH
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
X-List-Received-Date: Wed, 24 Apr 2019 16:32:51 -0000

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
index 6d003dccef..edb0e10434 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -312,6 +312,7 @@ def set_icecc_env():
     # dummy python version of set_icecc_env
     return
 
+set_icecc_env[vardepsexclude] += "KERNEL_CC"
 set_icecc_env() {
     if [ "${@use_icecc(bb, d)}" = "no" ]
     then
-- 
2.17.1


