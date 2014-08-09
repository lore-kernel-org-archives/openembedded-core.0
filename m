Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6290160CFC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 09:11:34 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so6628991wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 02:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+rWb42OMPIqGdFYtdErXdBPTAqqkzKHnLNj8BvGrVZk=;
	b=KVf3nkrqu3Om3iveNAqPMGGNVSF4KY5e8fx8CfBnUk0/j9U2aDnrr/O71CKx6rZPQE
	DiUaLiGYxvqcs5Nr+9OEFyZbICMT9zkBp5dEG8w61nzOuBv7xtJYawtt6Ox/J8G2VF0H
	MRpSjBF7pvwzIba9o/jpyRcJsrEYMjeFZOOtZNLClX6MlZh2QMMbyK8kGFhhIXF7PKSM
	W3BCPiCwPxgACvawDpPFBK47xNlKzmZKFZijUgfc8pfMt1mwM7IK6I3Xvc56349LtY7D
	qae0xQxNdvcbpVpph0jCB9rfnIO+91CLBMzjLVZaQ+DVWmHFi5TOXFA67xF2ULqa62eg
	Ba2w==
X-Gm-Message-State: ALoCoQmaaelCodHV9Hc2rpOIacxskEHBS9QK6ZSaujgKrtu0S6Nb9jy7+vpwAIOLIRnM+4k5nJtM
X-Received: by 10.194.91.228 with SMTP id ch4mr37899130wjb.59.1407575495326;
	Sat, 09 Aug 2014 02:11:35 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	v14sm23264706wjw.38.2014.08.09.02.11.33 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 02:11:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 11:11:16 +0200
Message-Id: <1407575476-15945-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Subject: [dora][backport][PATCH] kernel: don't copy .so.dbg files into kernel source install
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
X-List-Received-Date: Sat, 09 Aug 2014 09:11:37 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

In 3.16+ x86-64 kernel builds produce a vdso64.so.dbg file. If this file is
copied into the kernel source install multiple QA failures are triggered.
Specifically, this file triggers a debug package split that results in
files installed but not shipped, and invalid .debug file errors.

By ensuring that .so files are not copied, we avoid this incorrect split
with no impact on future build phases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b2e9d4c..1289873 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,7 +232,7 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
-- 
1.9.0


