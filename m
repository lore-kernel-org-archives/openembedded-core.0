Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id F0021792BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d12-v6so3242862pls.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pqiXdvS1f+0VEn6CBhOEjtsCBeC4av4AMBd7e1OkBXg=;
	b=aEcKYAM2jIVcTyzObATC/7/QYYP3AF/8O7U5SFGgqg4JNFQqh8AnuTvrLMfoilGfdQ
	BVoiHhNQDLXVa+2v5Y+eDaYAaUOh1Xg5J5skSq2rxI2ixzPGe0ASBA6r3sNRpBuKnkER
	GHCqII9YnyvCgt27vrgVMebmcEwVhK/pt3sZKDKl0bwDzru2yZuigUUz9V8O1cHI0/xx
	TTvSj98BKSLmfRX9ioKH7GuePPUYjq4C86EMI4rbDeoV4gqngBqQUxRXzFPwMYe8lTcC
	KLhSIWOwx9OKqloZxN2gzhcb2Ty6xwEDWME02rcoqPBAFmv12mxv53rL7hkUQftw0zUx
	zyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pqiXdvS1f+0VEn6CBhOEjtsCBeC4av4AMBd7e1OkBXg=;
	b=oS2U4EmtNg88dXI1JR4fPKvoOJnnSGoZZY2H8YS2bbS5Yo+An4Mae4yKdipL5HVB/8
	qStcmKZ6lLkZSUm+tUvjQq1MzG9Ox3n1gm4/uc84FR+/qwsinKJ637bitHjIIWp0eG4Z
	twkDIWgncz8mYrfWqrY8fmtn5gYlYq83HinO6QzkJDFqDU39EOEJbLVK/YIS2ilX2v/Z
	dYlcfL2XoCz+ToW72iixEgrnK5psrGpXUr9ljs13cv/EBjjcceIVwRo1rlfpFdGiNYhD
	WKKzVmL4LZ8QwzMM88Zdj0g86qubpgqfqNAYByYj9q/4WxSvIs8Zl0a39W7BnIGSv6Td
	DD6w==
X-Gm-Message-State: APzg51CUm7/Bwss60Iy7GVOS1HeLoq4J0V2tA0cXZVnF+prWAf1+d7pS
	dUgLA3Fahz6AEzYbpN4VgLl7yxm3
X-Google-Smtp-Source: ANB0Vda7CbmEH8PcnX0VXWGArC3caRip4EEoySzV+RWsqw1OksD/rz76EnwXRE1jIXPMwxNXPqCw2g==
X-Received: by 2002:a17:902:bccb:: with SMTP id
	o11-v6mr6229552pls.167.1535601349693; 
	Wed, 29 Aug 2018 20:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:35 -0700
Message-Id: <fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] sysklogd: Use update-alternatives
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:49 -0000

busybox also provides klogd and syslogd, this change makes it coexist
peacefully. Currently rootfs fails in situations where both of them are
providing these binaries and busybox postinsts fail

update-alternatives: Error: not linking
/mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-cmdline/1.0-r0/rootfs/sbin/klogd
to /bin/busybox.nosuid since
/mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-cmdline/1.0-r0/rootfs/sbin/klogd
exists and is not a link

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index fc4e67c18e..2a8bed00f3 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d systemd
+inherit update-rc.d systemd update-alternatives
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -70,3 +70,9 @@ python () {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "klogd syslogd"
+ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
+ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
+
-- 
2.18.0


