Return-Path: <allenwild93@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 784876BC17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 19:24:52 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id d187so3638095ybb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FFU+celbHkQ++O6vqTZE4PvCFT3XzSgAoY+ahSRmjBs=;
	b=mQpAE4zIO077LLYV1Dhumve8RX9Tn084w7cVYcaAAso2vcuDtJDauajhy1lDcc0hxr
	mKJ3lckOC+D+JfwiLbzAOTSNWhousI7PNGF69stKkETTv6JXob+v1eaNv0V3xQFO99Zl
	0ZDR0vjaiJeDfgClwh6o7hpBPrGB7S59lHjyFZuudsakQlMq02i2dO9XY0CqbojnLtDx
	FyyekM/Wy3GimpVJFMHdOxFiH3QmFRWO8sH5AUnI5OEE7uLeZTLM3zAlViaCjJOXz7lA
	1Y/gg2WKN145aYu1bORdItYuuMX1DtNpt8RsN3dhOX+ZiBbv315RSUwIc6a+sr853sqf
	MZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FFU+celbHkQ++O6vqTZE4PvCFT3XzSgAoY+ahSRmjBs=;
	b=CfURF4AAqSFDiPvZ+hXFmy0uQ4BOGmP8MoCqVAbKpIk0G/6pn/PAWHiWNolrFQLJco
	NeCdPuhgkVNylTyV1HfRA+W+f4VLybxOB5vUyi/jvajI/7J7bhXmhnw5T/WYYZVvmt+d
	ebz82NBgSS6GRmaIT+chjBiH9QmaZMIBrmBcJbccfC22hcNmz0y9hR/jSVLao0CkdxWJ
	EU6UB3QpQKRCac68QO4qt9MsVI2f8KICT2NqHc19NXM8w33Zsp+bnxmQnGDI9sZRKoGZ
	dJHs8DPI/fy7cLaUa1X9rAStgnVJOR5TqzlqLH8qd9+t30cHJCtJjaOaj1NZ44WSFueJ
	yU+w==
X-Gm-Message-State: AA+aEWbg+9YZOF83tT+ac3jmceeWlZ/SvSPIGgnO2DdnR8QuiCtIT914
	ZeQeQFLTldGfX1F4zVW9S+iWoeWX
X-Google-Smtp-Source: AFSGD/WDN6w+/XnJYy5ENvmuKt5bgPYNzK8iTH/QQvkQz8pK44N0ChpbXoScq3M5HnqSz6XJqNVrwg==
X-Received: by 2002:a25:6844:: with SMTP id d65mr7922003ybc.217.1544901893222; 
	Sat, 15 Dec 2018 11:24:53 -0800 (PST)
Received: from puma.home.awild.cc ([2600:1700:3d10:2821:80b2:9fd3:6a1f:c80])
	by smtp.gmail.com with ESMTPSA id
	n16sm2716590ywn.31.2018.12.15.11.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Dec 2018 11:24:52 -0800 (PST)
From: Allen Wild <allenwild93@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2018 14:24:45 -0500
Message-Id: <20181215192445.30330-1-allenwild93@gmail.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: fix usrmerge install path
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
X-List-Received-Date: Sat, 15 Dec 2018 19:24:52 -0000
Content-Transfer-Encoding: 8bit

Update /lib to $nonarch_base_libdir to fix package QA errors when
usermerge is enabled in DISTRO_FEATURES.

ERROR: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: kernel-devsrc
package is not obeying usrmerge distro feature. /lib should be relocated
to /usr. [usrmerge]

Signed-off-by: Allen Wild <allenwild93@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 361ad21e1f..87347fa969 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -32,7 +32,7 @@ B = "${STAGING_KERNEL_BUILDDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-KERNEL_BUILD_ROOT="/lib/modules/"
+KERNEL_BUILD_ROOT="${nonarch_base_libdir}/modules/"
 
 do_install() {
     kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
-- 
2.20.0


