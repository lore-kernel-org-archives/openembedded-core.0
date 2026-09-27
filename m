Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5EFCA5FAE
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:57 +0000 (UTC)
Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32860.1790495034127456022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hmn9aEx4;
 spf=pass (domain: smile.fr, ip: 74.125.225.106, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so977403f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495032; x=1791099832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6O/N06EjLtCPF8Ketii4RCS6BFjKTnB6CTS2RQgIe8=;
        b=Hmn9aEx43emmmqBPDXKJnAyGNF7xRrD/b1O/eCTXk/LOufSIyZzS2/ys+YKHY5L74W
         rWx+RsniArqYRb7z1HRZtCf0g6WYRL+GMPyysyqe+5gubuZctNMfEmBz+DemCb31QXRW
         RZUIQ/7vahUybsg1co3QiCHLa3ChQ+cbswWdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495032; x=1791099832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D6O/N06EjLtCPF8Ketii4RCS6BFjKTnB6CTS2RQgIe8=;
        b=CCyA2Q7tnfocUmYcOMWvoLo0QGLOgfNRxTKMick8RmDAcRUlWS9hhexf3ggNxj/jb7
         z2lmjYzbQl2j7i0uR+1UVNY4TvjMx4R9SUCUZ4u1LJoGZwXXI6mM3rqrPCiI1V/dg5Yc
         zJkOdwBeFX76orV08v9A0LYBK9ENoaFCdSJsqk2N30Us5W2y4tdVsltS7fnnrEirvAcf
         7jJkPw7UfNPvPXde6oBN59i9b/JUpp2rXmciw5vd1LXpbVbeIcePynG4Q+WzTQ9FNYrs
         +lIfEBhYZhml1y+jr1HpitJm65SzhuK06/xemuvC9v1gzbK5yLzWQJjLW9mXcm1MWtN1
         QMAw==
X-Gm-Message-State: AFq9FYJtlOXYiEqZI0l5YGI4rMrBSmsd7XakKv29Bs2QJtNOeJ4OMyQO
	81e5xP9cDBIr0aqGR6WfY9YH9x8mjxtMk7Uj686M0sEZdc2I6PY1OdImecXY5aIODBlvqeLZges
	OljyM4Wk=
X-Gm-Gg: AYBFou1pevXC4+dJCkHaEcKspnvc79EkNR/v+YiXoaU0C7nEDrtuNcFakREU0phmvCs
	9FcNf1aOxbQcgaFbGkU9tb50Z9kuIv6HN5GbOHRCZ09MWMKNt/Q0sCNOepQ/XIg2/AfddI7GkQS
	NKQcMkBY5rOSbDN9NhnEOMR5BJQFbLJkAKIZGrqzJHj0rdqJ28QR/gInXnCrihkm6oRcIcm6Ido
	nhb0FBXzfohOEmdnSObLBIyVPhPQJLGMFSr2bZMu0dJWAEA1la9dMlXeH1hk9yOC4K+SagjBG/h
	R7wWq2w46dUcoFbUL/un/449hUrTw25vzZcT/g0ThsleNTbe+nttIwt0bJGgQrIgUXLVED4s7DD
	bZLT3kfqxEDVWCoiuFUdFJ9cDA7jzTo66k453ay0cLW4zHCtukmU2NYLGbHOhSN/WcY5+UES5Au
	Gkn+qMxtZkEDbSKKLOlCppeUtbUmqM5N62YBgZFyFgEUxLDtJjTAGZ6Cm/Dj+FZwCjx99WpEgAv
	PfUJD5/6iuUdWFw8BDzRQQ5AViX1+4QdcM5cZfP7o/FMDNIoMBr6y+ppEyjcMkcTGCU02F7Ow==
X-Received: by 2002:a05:6000:40d7:b0:488:78ea:184e with SMTP id ffacd0b85a97d-48878ea18e0mr9780211f8f.11.1790495032395;
        Sun, 27 Sep 2026 00:43:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/28] bitbake.conf: pseudo add rootfs-dbg to PSEUDO_INCLUDE_PATHS
Date: Sun, 27 Sep 2026 09:43:10 +0200
Message-ID: <a71888b3757735f10bdea871915db4f47b2afb01.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246669

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a fix for commit 2502da8170 ("bitbake.conf/pseudo: Switch from
exclusion list to inclusion list"), which forgot ${WORKDIR}/rootfs-dbg.

oe/rootfs.py's _setup_dbg_rootfs() builds the debug tree under
${WORKDIR}/rootfs (already included) and only renames it to
${WORKDIR}/rootfs-dbg as the very last step, so the rename itself
doesn't lose anything: pseudo's database is keyed by (device, inode),
not by path. But PSEUDO_INCLUDE_PATHS also gates whether pseudo
intercepts any *later* access made through the new path prefix, and
rootfs-dbg wasn't covered.

That silently broke image-combined-dbg.bbclass's combine_dbg_image(),
which runs under fakeroot in do_image:

  tar -C ${IMAGE_ROOTFS} -cf - . | tar -C ${IMAGE_ROOTFS}-dbg -xf -

The extracting tar's chown() calls into ${IMAGE_ROOTFS}-dbg fell
through to real, unprivileged syscalls instead of being faked by
pseudo, so files copied into rootfs-dbg silently ended up owned by the
build user instead of their correct target ownership.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2dd3a54134c04147a863ada4997edab3e8afc6fa)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 24e095632e9..c5f84124f0e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -748,7 +748,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/rootfs-dbg,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"

