Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7596D6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:56:04 +0000 (UTC)
Received: by yhnv1 with SMTP id v1so12048124yhn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mY2DC60qYMYcFUmJkRFVPwaJA5wT5p7HFAbG9Y5unUE=;
	b=CEOXrjzoh/OpvX59fZRnXtFqkQ5X5zj6v3UMlVLTQoWZeP1LhB9jXQSIHjsvnIOGlt
	hkJAiB+Mpjk8vNY6WcOdtgfBiPE78MDm+Z5QbUM1UjLKOJNIjgzxYGCnvXY1STvx4KgF
	KhSzWS8Y+OHHsX9J5ocJFypwCqjKUUL8OIYEwUC2wdvhwzrm1i+8y3DK5+XbWQnkit9O
	iFsKPSGW6T5esaHbj/Y4688TXE8x5JNjnHpmQ2q+g6YXaFFym5IhqnxXL4NnUQ7KBaY7
	KUQU3j+jseLAYV+HTWaJ3z/UBUAy7je4lpVpKAwNUzlwotDlGn0xmpx4m3oZhMJgKuZW
	VQzw==
X-Gm-Message-State: ALoCoQmmIeOKW83kTY/VXk9AOnsPk+meMksW+8GG1e+sM80GDMQGE/CnFX/Ny4tLlDBuw1ET64HD
X-Received: by 10.236.140.163 with SMTP id e23mr47343628yhj.155.1426258566083; 
	Fri, 13 Mar 2015 07:56:06 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.56.02
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:56:05 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:25 +0530
Message-Id: <1426258527-2329-4-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 3/5] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Fri, 13 Mar 2015 14:56:05 -0000

Build iso image required syslinux package.  We have already skip the syslinux
package.  Hence just skip the iso image build too.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/bootimg.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ed7b32f..d8c2a59 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -265,7 +265,11 @@ python do_bootimg() {
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
-    bb.build.exec_func('build_iso', d)
+
+    if d.getVar('TARGET_ARCH', True) == "aarch64":
+            return
+    else:
+            bb.build.exec_func('build_iso', d)
 }
 
 IMAGE_TYPEDEP_iso = "ext3"
-- 
1.7.9.5


