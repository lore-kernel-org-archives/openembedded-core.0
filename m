Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.2311.1591056798363007929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Bfx2Lz+a;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id b201so100633pfb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Stn0MFH4GH97gFz/tTT5SCAVZanrjKVmiYphTXGhsfs=;
        b=Bfx2Lz+aGy7VHAyr/hzyjCumD3viA/6fvlisKmmT6kCTFtF+FByQbWmUiuiCYtfsGF
         lP7UCunL+I6hQLmrwteYMmJnMf+Bgr4MmFOnaRqmtfq8S7c5TUiQKIlHgxuLn2TYbMeE
         qj3Bx2Nhubo6VELf39b4JJPr69qEmZIOiSi+qV3CYDDdhiwF6jLC5GG4blRil0B07xiI
         nPpHkbAGjZL0GCjcBmJfcvCFp0eKTkgmVOCvfcdsh4Ax5K2woSFwQ5aQFt3DhKWsG+vf
         AAPccQVcFgqZwooy7Il5pEnMKTVcqmBfppPVqF2Uho3ocBGQBf9isAO6JUfCFpLclje+
         a9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Stn0MFH4GH97gFz/tTT5SCAVZanrjKVmiYphTXGhsfs=;
        b=PAaL/TfggYY8v/fAhnbY2ZOarx19zvE3CwBJ52hG3XqCmRw9IaFzAVXbGAkoAWvW76
         1mEV097w63wUwdX9yOrVNFTKvpaxdUuM9NppyphkSS34sLITFeAVLPNONgUOpuTXvJBx
         ceoosUJy3xAVNkCA0ey8nws+hamuhYK3peAdQ9Lbbe7K9D614IvH/UsGDljA0ordDqIU
         OJN5+W+TAXsiwbAURjgPIC0AhNsdaCI1lymzxXDC48QeZa7tqyMdnwjoTMkDRDbMvFf4
         TQ52ZLU3gLZjqy01xZQS/SsyfKwVUHLs8gqNGQX73HS1qsFXreHLCSrqdE54Mfj068zU
         bY3A==
X-Gm-Message-State: AOAM533VjEJWvyOkQ8ZZ0936cNWIfCiwfbcmqn1BApuBaWhbV/7TZIhP
	kMeCFWEf6KorJ34wbwOHZBKAtoFjCx4=
X-Google-Smtp-Source: ABdhPJyb+C6o5lcN/TyHfeiP1s3ai0bdKA9oRPQasrphd+bfZyHGXd+cbzUwEmAllB+8WfUaTZtL0A==
X-Received: by 2002:a63:f601:: with SMTP id m1mr21129060pgh.205.1591056797194;
        Mon, 01 Jun 2020 17:13:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] kernel/reproducibility: kernel modules need SOURCE_DATE_EPOCH export
Date: Mon,  1 Jun 2020 14:12:41 -1000
Message-Id: <f511d78164581f80e7b8c592fe88ffbf38738150.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591056239.git.steve@sakoman.com>
References: <cover.1591056239.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If CONFIG_IKHEADERS is set to =m, then reproducibility issues creep
into the modules build, since the variables we are setting for the
main kernel build are not present.

Since the source code must be available for a possibly git query
on the timestamp, there didn't seem to be an easy way to move the
environment variable setting to a common routine. As such, we
duplicate the block of code that exports the required variables for
reproducible builds. There is a maintenance risk to this, but any
issues should be easy enough to catch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 82cdfcdccfedd320ebc0cdc778c7d4966198b96f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..a3990aaf59 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -331,6 +331,21 @@ kernel_do_compile() {
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
+		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
+		# be set....
+		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
+			# The source directory is not necessarily a git repository, so we
+			# specify the git-dir to ensure that git does not query a
+			# repository in any parent directory.
+			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
+		fi
+
+		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KCONFIG_NOTIMESTAMP=1
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		cc_extra=$(get_cc_option)
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-- 
2.17.1

