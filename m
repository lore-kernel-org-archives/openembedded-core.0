Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899B6C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 21:44:04 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.1650.1633729443920669609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FSrTqPJf;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id q12so3611660pgq.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iuhyMOlfBPMJ7drOzfynZHmveakDTn323ssuKlGOnE=;
        b=FSrTqPJfKbTDc1Xb6iBBerESnGRCVgakHeEeDdmTQei8+4GQXwOtk7MnoJNGoYRYAx
         +kKWhY1FjYx6GvDYaXWZpwnnAXmVd1PYhfpSQbJiCkUZtKwwOYAbVeig9fM4rwPS/7Qt
         al4Be20L4kYU9mXaZFMpUzqeV60n8HRgUqGjP5T1yWTw6u1lA/omMyikz0l+r2c2q7ep
         7XUYKc8CYLq0d1iVD4mEHcjp8D7eI9RtKJ6Gc3Ue5Sx1NnbFtYmMCwDW0ZbXcHAhzA3X
         k9BrCVY98eOK+2+CJQUEdtbQW4UpP1Zgg/oFuGMMwvY6iB9xy2joFNbz+6AfVZhZuhmt
         +XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iuhyMOlfBPMJ7drOzfynZHmveakDTn323ssuKlGOnE=;
        b=1+ZTmbd94ELPLUlMqppoRBzxczL4txN5v4EZrLyE5EZvgcYvn4ysLOE2Xh/DiCiTAS
         DmSXT330i6ovizmJaKIGTynhpov55ziJ7HHpIn6frnd7pl9V2sa3eS8LvltVwJnsENyv
         wMqcHW/ko0UlV8K7LSHJc71wc89l4yZS620a1XUEeKA+n3MY6sftCX331ydmZMIkkPIE
         REIIjjxWEqMJOjAzMwwHvO+FyPodaTe3uuloB+n0f5lR+mGRsCOmIOFL+jlc5QRyQW8E
         j7ufwVMfkXRceBd5d6PpkIkaE5djD7GziVDBVpVno+P/hA5mdoRdoFbANEKdqsxHNVi+
         INDw==
X-Gm-Message-State: AOAM530mdOPQVDKnq/dMunaeIkhGqynneVWPrdtk2wxOuTj7VEtU7yFo
	11mCWCkdl+OknOVhlhzLtstQdS+c57FUPQ==
X-Google-Smtp-Source: 
 ABdhPJwHy8gd6tSybmrcSe+jzk3ymVGs9vjImtp1q+eq3iGOn7qiT5/4EIeIqU40oi/EbNxSUaSUhA==
X-Received: by 2002:a62:3383:0:b0:438:4b0d:e50e with SMTP id
 z125-20020a623383000000b004384b0de50emr12600321pfz.9.1633729442820;
        Fri, 08 Oct 2021 14:44:02 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1830:1ecf:6056:d182:298e])
        by smtp.gmail.com with ESMTPSA id
 nl18sm180846pjb.3.2021.10.08.14.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 14:44:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] ptest-runner: install -collect-system-data script
Date: Fri,  8 Oct 2021 14:43:48 -0700
Message-Id: <20211008214348.2013232-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 21:44:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156786

When ptest-runner times out or otherwise fails, it tries to
call ptest-runner-collect-system-data, so install the script.

The script currently calls dmesg, df, free (which are provided
by busybox, etc.) and pstree (which is a sub-package of psmisc).

Add pstree as an RDEPENDS.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 1d3c24a177..23ab48ba2b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 
 S = "${WORKDIR}/git"
 
-FILES:${PN} = "${bindir}/ptest-runner"
+FILES:${PN} = "${bindir}/ptest-runner ${bindir}/ptest-runner-collect-system-data"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS= CFLAGS="${CFLAGS} -DDEFAULT_DIRECTORY=\\\"${libdir}\\\"""
 
@@ -25,6 +25,10 @@ do_compile () {
 
 do_install () {
 	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
+	install -D -m 0755 ${S}/ptest-runner-collect-system-data ${D}${bindir}/ptest-runner-collect-system-data
 }
 
 RDEPENDS:${PN}:append:libc-glibc = " libgcc"
+
+# pstree is called by ptest-runner-collect-system-data
+RDEPENDS:${PN}:append = " pstree"
-- 
2.30.2


