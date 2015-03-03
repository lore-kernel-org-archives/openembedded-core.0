Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 091347387A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:46:49 +0000 (UTC)
Received: by yhai57 with SMTP id i57so18815550yha.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YFWXja6eGEti4fz3mvTEoqLGcVO6UpD6FzBrkjbpq+k=;
	b=PRZiqBNvnxo1KUFtZqRfWSjjEO4uEHof1t9BR2QjGqo/vHuYXphqdqKmjENnZV+kJ/
	mb9wSxUjRCp/LKZaEs/9N/09/1E/H2k7589c+b22iJrbmmS4F8kyYYtBE65EY2WcSvFp
	amV0Mm/QQKprje1z1YT/vtEvcBx8pUgJ8YQUF2Y5WZTafx2rRPU1pgsXSfnH4nbq3Z1U
	jFGaTO0S0Yuks1UR1/1dkR+Bqko9pgxT2jsznW/GhyJ2GZCBoFiDilR6XKzL4Mq4LywI
	a/ybrkCjDJ5gteHZofM/XuWuNgLtE24ZBh28CHH7S/nJcZjX9d7GjSQUGn1WiQ5J4Rxf
	6R7g==
X-Gm-Message-State: ALoCoQlVdG1dA7Sa7n4hslhYjG7WRNZqw4sxTKfcQWbqO9vgt10a+IH/ZcbWnboS0TqcyR+AvD2T
X-Received: by 10.170.176.87 with SMTP id s84mr33985196ykd.43.1425397610852;
	Tue, 03 Mar 2015 07:46:50 -0800 (PST)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id n22sm831796yho.1.2015.03.03.07.46.48
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Mar 2015 07:46:49 -0800 (PST)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 21:16:23 +0530
Message-Id: <1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Tue, 03 Mar 2015 15:46:50 -0000

Build iso image required syslinux package.  We have already skip the syslinux
package.  Hence just skip the iso image build too.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Reviewed-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/classes/bootimg.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index a8e0c19..2edba3a 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -266,7 +266,11 @@ python do_bootimg() {
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
-    bb.build.exec_func('build_iso', d)
+
+    if [ "${TARGET_ARCH}" == "aarch64" ]:
+             return
+    else:
+            bb.build.exec_func('build_iso', d)
 }
 
 IMAGE_TYPEDEP_iso = "ext3"
-- 
1.7.9.5


