Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A84DC35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 13:35:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.7996.1742391301047962757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B40SYG4T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso4232582f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742391299; x=1742996099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTBLVO/r885qFdY4dJTi4Gq5CZtbUG61uqEWdZuFCwQ=;
        b=B40SYG4TR0c07YcwB9UxSP0bR5/Zpdvmp/yDybNt5lTaKKtfXJjHGDBvHI71q8Qy+r
         diBy6qay/1rZoQ8UZbPRekkv8l1UCZi9A3dsrIayGd2MflHni8g3criWnE+wBMs8ysGM
         gF5P6cUrVIV6vjAAun2Ck+n1uZLXO4A4PB3Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742391299; x=1742996099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTBLVO/r885qFdY4dJTi4Gq5CZtbUG61uqEWdZuFCwQ=;
        b=oJ3ksx8D+JgHQclleCDObQ6TlUIP15+mi7loUjoKBXc5ektPWoWTsWadA8zEUohdeZ
         4ci9Lmv9fK8Tcx95HFxn67XDdkJHTeNCREAaoI/zaFrvwSLZYn4XN/GAJ3GbdJG/ZjKb
         58f8RT0b1FeFsBPtKv1/Get6s7PHiLekne6GpKUE+0HkWyISSlVweaAVwEim7pbPUJbk
         z9ghdFb1X7GGYkiGlQLBIONTuSm4lj9QuA1SgyOoTWNRgW/FZX7YBq7qaSH6Q9fu8NGY
         OvbE+CbPD2s8mBw6phbuMrQlV689X3dXTUtimYlN18DkJvH/uGf4tXZcuYBYpRGy06zi
         6pCQ==
X-Gm-Message-State: AOJu0YwM9GTr6Z2qanR0Eth4JOH3YGF/HpJWY7ZHFJiJyXnqnPQoHITg
	s0L8vn48XsATiBlhWe/g+GphfpIm8pQzE9DYeKSpRUkML2ITO+2LET8veyzzdQAeTZQGikvC3Vk
	d
X-Gm-Gg: ASbGnct9tCL4vycW8yU7xy+oYWBaOMADGtYLTPMrCq8vcw/cRGoWRqUpwfvO2iI0Gr/
	R2vMSR8tlAtM260O1H10G76uPNOiUWz9xqoBksFHXjTuBt02NdVy1DqzDZoLuzQRx9ddq5P58Ep
	uJIcAhzPqlkI4nNfxyZGN4CL3fKWL2lWjoVH92aiAWKJrvTGvBT3kmVCreWSMXEDM+NgweQvIqx
	nqDUTYVET7ImD6D5RVuzStTdUKR/w9rdMzL+jRYj3thbQxHjn6DiPu/UxjMi0JbUP4oMpDTyfse
	cBu1xIDC/QMXNzgIEcY/t4EY9J8r7H3TB0PFKJFrOIZbuSwlKagYA1xqr85kqdlDMhW2Z5Bs
X-Google-Smtp-Source: AGHT+IF1k971iAk/OkCUHYjPR6V8ti0NxPADnJ6CIzLuyAzs9VGOlRqJ/EXODIolOSjec1FeKfP1Iw==
X-Received: by 2002:a05:6000:18a3:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39973af6c15mr2729657f8f.41.1742391298658;
        Wed, 19 Mar 2025 06:34:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm21218833f8f.55.2025.03.19.06.34.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 06:34:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] breakpseudo: Add demo of breaking pseudo with symlink creation
Date: Wed, 19 Mar 2025 13:34:57 +0000
Message-ID: <20250319133457.806384-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213331

We sometimes see https://bugzilla.yoctoproject.org/show_bug.cgi?id=14957 on
the autobuilder. This recipe replicates that failure. Usually it occurs in
pciutils in creation of libpci.so.

The issue is the makefile can result in multiple calls to ln -sf in
parallel which race and confuse pseudo.

We have two issues:

a) it would be nice to fix the picutils makefiles so they don't race and call
this multiple times

b) pseudo should fail like this

I'm sharing this reproducer since it moves the bug from "I can't understand
or reproduce this" to a "there is a reproducer".

I commonly get complaints that bugs aren't reproducible, this one now is. I'm
hoping that means I will get some help on it.

To reprocude, run "bitbake breakpseudo" and watch the inoode mismatch errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../breakpseudo/breakpseudo/run.sh              | 16 ++++++++++++++++
 .../breakpseudo/breakpseudo_1.0.bb              | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100755 meta/recipes-devtools/breakpseudo/breakpseudo/run.sh
 create mode 100644 meta/recipes-devtools/breakpseudo/breakpseudo_1.0.bb

diff --git a/meta/recipes-devtools/breakpseudo/breakpseudo/run.sh b/meta/recipes-devtools/breakpseudo/breakpseudo/run.sh
new file mode 100755
index 00000000000..dc500894ca9
--- /dev/null
+++ b/meta/recipes-devtools/breakpseudo/breakpseudo/run.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+
+D=$1
+
+function run()
+{
+	for run in $(seq 10); do
+	    ln -sf file ${D}/file2
+	    ls -la ${D}/file2
+	done
+}
+
+run &
+run &
+run &
+run &
diff --git a/meta/recipes-devtools/breakpseudo/breakpseudo_1.0.bb b/meta/recipes-devtools/breakpseudo/breakpseudo_1.0.bb
new file mode 100644
index 00000000000..6c35b93112e
--- /dev/null
+++ b/meta/recipes-devtools/breakpseudo/breakpseudo_1.0.bb
@@ -0,0 +1,17 @@
+
+LICENSE = "MIT"
+SUMMARY = "test to break psuedo"
+DESCRIPTION = "test to break psuedo"
+SRC_URI = "file://run.sh"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+FILES:${PN} = "/file*"
+
+inherit allarch
+
+do_install () {
+	touch ${D}/file
+
+	${UNPACKDIR}/run.sh ${D}
+
+	sleep 2
+}
\ No newline at end of file

