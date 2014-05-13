Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f182.google.com (unknown [74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id C8B19605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 10:16:31 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id t60so130422wes.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 03:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IlwzvmKa8Cp0Cmu6JgwlQE4bFZEacBde8/q4shzDEPc=;
	b=V+Wg4GoSg8wUQ0JflydUvfrcptSOontR+8YGQwAV3E0woZxs2NecKXXg4Fs7Rza+jq
	Jla7SD7IvpbHtjf3IxyDfdiNECPEGgmS2VHuVYETCxRzemMZ7yiOahWMRnl7FWe1eZyP
	JWURG0S9AVH/Lp8Q7X0zzSO59D9t7wIPTvm5cdsKWdzPnxqXGNIR6UxXJhQ//zXBlVEs
	88/HLCGfkEgYBSbfn2tsZOhXC7FM6KnStqaQZVJUpE5SpraVQ3T4rTKcuUeCYzOKnqqe
	Y8ThhZFa7q6dq41nJiPX37BYTpAXH96qnQqku3AOG4TF0r8pouKYdSJQu9AcEbBA1hVc
	omqA==
X-Gm-Message-State: ALoCoQlZmX3oXIhk6VFLEt4MF9fL3tGVfJdh30ZI/FLwq59dFa0ELR1DNYs0JKjMNecSGZFD6IXa
X-Received: by 10.194.120.101 with SMTP id lb5mr944923wjb.74.1399976191929;
	Tue, 13 May 2014 03:16:31 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ej2sm21624518wjd.21.2014.05.13.03.16.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 03:16:31 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:16:29 +0200
Message-Id: <1399976189-1863-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] ca-certificates: generate CAfile for -native in do_install
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
X-List-Received-Date: Tue, 13 May 2014 10:16:32 -0000

Git-replacement-native needs the generated files in place for https:// URIs:

WARNING: Failed to fetch URL git://github.com/kernelslacker/trinity.git;protocol=https, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository '/build/linaro/build/build/downloads/git2/github.com.kernelslacker.trinity.git'...
fatal: unable to access 'https://github.com/kernelslacker/trinity.git/': error setting certificate verify locations:
 CAfile: /build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/etc/ssl/certs/ca-certificates.crt
 CApath: none

ERROR: Function failed: Fetcher failure for URL: 'git://github.com/kernelslacker/trinity.git;protocol=https'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/trinity/1.3-r0/temp/log.do_fetch.7843
ERROR: Task 1378 (/build/linaro/build/meta-linaro/meta-linaro/recipes-extra/trinity/trinity_1.3.bb, do_fetch) failed with exit code '1'

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
index 2dd3742..c9ef07b 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
@@ -67,4 +67,8 @@ do_install_append_class-nativesdk () {
     SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
 }
 
+do_install_append_class-native () {
+    SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
+}
+
 BBCLASSEXTEND += "native nativesdk"
-- 
1.9.0


