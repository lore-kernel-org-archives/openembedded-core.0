Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D844C25B7B
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12951.1715774187350003834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfvVMXB2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-420180b58c5so21728565e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774185; x=1716378985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2W6cbgstq4kRlLl7FCi15OIkuYXA+a5K4cqPt42yks=;
        b=TfvVMXB2y7CpDn4LqNWVn5clwrELOnVu/5lSdHFznYAB+wVSzJLu8NpRLND0C9HI/s
         hh3qrH5rG+ddgcr2rmabfvjalfqE8rf6BXHpDBE7eqstDHyiEpHear+GAP1lqkeFn1Cq
         EdejOytCRIt8ePkNR39KoHyP9JBdDrztloFqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774185; x=1716378985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2W6cbgstq4kRlLl7FCi15OIkuYXA+a5K4cqPt42yks=;
        b=wzVioo5b+fek8jJhumqmdt7T5e/AYeXwB1K6hemm+irnPB7sMg11rhKjenEUVnZQ2R
         +r+ujDPUnHO/B8iwDH/e0aGQ7evXYWm7rPPMMbh7ZojPW2tClBr8l2lT4cTjeOdq8Gg6
         BQJucO8Myb5TcE/v6dEem/6yXuy1J5DfGAa8bsAn0zO1eoqDbey+T2vHc5rja0WWQM2P
         q/0apCs3TkwGc3qnnyvzkTTX+ygZvVH0UehDe/HXgkONqIzuM5uoNi4JPvU8uEa+YSnX
         k4LUhbPtiC0Sz3iHgkCd/8DJLXQfaGS5/ac2vmuUkmLUzp4Q+MEjrrjkOFtM042X9v6t
         FPpA==
X-Gm-Message-State: AOJu0Yz2eJSf7NA+I7v8t9PE5wVRtEmlZGQhvBjfZu/Q45uY7prTVbfx
	Oivtkjlly9vtJIJ4z+U34UvF+vyrgARrEB6s9Bi/D/zK4HAkFiXz8xZ+4ZR/DN6+m4fA9Jd7dgq
	I1aY=
X-Google-Smtp-Source: AGHT+IHWlUdRZ0IkGJpfKg/A0CHDFIG3/Mv2g3kVHBHU8DyXKpelydimFhfPobh20YksNWTmF94neA==
X-Received: by 2002:a05:600c:1d21:b0:41a:c592:64ff with SMTP id 5b1f17b1804b1-41fead61bfbmr120255395e9.35.1715774185633;
        Wed, 15 May 2024 04:56:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] base: Switch UNPACKDIR to a subdir of WORKDIR
Date: Wed, 15 May 2024 12:56:15 +0100
Message-Id: <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199281

Change do_unpack to unpack files to a subdirectory of WORKDIR instead of WORKDIR
itself. There are several good reasons for this but it is mainly about being able
to isolate the output of the unpack task and tell the files apart from other things
which are created in workdir (logs, sysroots, temp dirs and more).

This means that when the do_unpack task reruns, we can clean UNPACKDIR and know
we have a standard point to start builds from.

It also makes code in tools like devtool and recipetool easier.

To reduce the impact to users, if a subdirectory under UNPACKDIR matches
the first subdirectory under WORKDIR of S, that directory is moved into position
inside WORKDIR. This preserves the behaviour of S = "${WORKDIR}/git",
S = "${WORKDIR}/${BPN}" and other commonly used source directory setups.

The directory is moved since sadly many autotools based projects can't cope with
symlinks in their paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 21 ++++++++++++++++++---
 meta/conf/bitbake.conf           |  2 +-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 066f3848f7c..cdce0538273 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -153,20 +153,35 @@ python base_do_fetch() {
 }
 
 addtask unpack after do_fetch
-do_unpack[dirs] = "${UNPACKDIR}"
-
-do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
+do_unpack[cleandirs] = "${UNPACKDIR}"
 
 python base_do_unpack() {
+    import shutil
+
     src_uri = (d.getVar('SRC_URI') or "").split()
     if not src_uri:
         return
 
+    sourcedir = d.getVar('S')
+    basedir = None
+    workdir = d.getVar('WORKDIR')
+    unpackdir = d.getVar('UNPACKDIR')
+    if sourcedir.startswith(workdir) and not sourcedir.startswith(unpackdir):
+        basedir = sourcedir.replace(workdir, '').strip("/").split('/')[0]
+        bb.utils.remove(sourcedir, True)
+        if basedir:
+            bb.utils.remove(workdir + '/' + basedir, True)
+
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('UNPACKDIR'))
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
+
+    if basedir and os.path.exists(unpackdir + '/' + basedir):
+        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${BP}
+        # as often used in S work as expected.
+        shutil.move(unpackdir + '/' + basedir, workdir + '/' + basedir)
 }
 
 SSTATETASKS += "do_deploy_source_date_epoch"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b2c500d8739..75c850760f6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,7 +405,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-UNPACKDIR ??= "${WORKDIR}"
+UNPACKDIR ??= "${WORKDIR}/sources-unpack"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
-- 
2.40.1


