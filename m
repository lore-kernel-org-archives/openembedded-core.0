Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.7086.1589379882956376293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jxn0uscl;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n14so17472486qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppFnAiNMwmQdVtnmEjcMME3teN6YTsRwbvfjAu4Zf3o=;
        b=Jxn0uscl1OSGXIoCC6UVXCr+3nsQfKOI5ibSwL1K9Z/Llqy+Xs6GEQDsl05HouREnX
         JGU2lnXRX69ezyhlxRmEAnvatF7AK3QP0v5munXIEYETfqKLocrQuSzDGTE4SNI6nd/G
         YtM0/457pNPfm3vPXHI8Fp7F1zcR1KmxNNFCh6hu06OA15EQ1aJo61fvCjXawFSKqM1a
         rHOMHOdY3+6eEbNdLunn6+nu6G39iaTjejfAhQvwC492CiSUXud45Q/2PAoI3s8WM2A9
         NF5TeVLDih+9zteYfbP7nY2uG6rQS0skM+xS5lutb1srLvskwQy2qZEE5gQ+vkNYxIYM
         xJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppFnAiNMwmQdVtnmEjcMME3teN6YTsRwbvfjAu4Zf3o=;
        b=FMeF/0oVrq5NUethAEwI4MhTYYinMA6kIZVl7fJ1J2+zbsuIuMwOgtUYz0FkBCvkR4
         3wB1HjPbDir7VygEzUMWkO3lLe5uqzadr4bqyPWbim+YLUu8IHmVBPsAaEBj8gusyycI
         5HS+bn8iA9+fSZKSXDKwRj/56PxkdQmUHS+71S2JLLO3IQRQW06j/XQg0Svzcw18nM/D
         E8K/FjOSN2UoJTCCtAWXLLO9adBp8aHzJBRvYK7aU5zZfeqUGxkL2Xz0LhZFp/DbQIXZ
         lEZJm7sdkE6zouYoZfQg1TcS8Dvo1kC2CgH5w/dqFW/q1Ny19sPSM1Sc6zm/S97ZrHZ4
         q/xA==
X-Gm-Message-State: AGi0Puawq+1PU51V8eCrxPi+PnWSuwvgsn7QnAFpgadfyD/Pi9hPOPjj
	gBGsClLGhtbxUAMnAdlPAo8=
X-Google-Smtp-Source: APiQypKKXqH7EU/YJvFPvT2mA8bZ9uFcnoBHbhC6UMPN6IAMBR2f/uzWsP1sliywrNCRD1ipXTi9cg==
X-Received: by 2002:a05:620a:14a1:: with SMTP id x1mr25507332qkj.92.1589379882055;
        Wed, 13 May 2020 07:24:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 5sm10138445qkl.101.2020.05.13.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:24:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 3/4] kernel/reproducibility: kernel modules need SOURCE_DATE_EPOCH export
Date: Wed, 13 May 2020 10:24:35 -0400
Message-Id: <31f44396d55e977adeed95f7047f4ec0d02a5dda.1589378829.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1589378829.git.bruce.ashfield@gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.19.1

