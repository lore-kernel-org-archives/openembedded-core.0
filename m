Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id E5C29771C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:05 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id b35so9306417qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uJajWkZkeoq2TD8VqmwMxzl1jniLDlD4RJCDuF5e3Fw=;
	b=iMcvHWvhuZvv+ZH4jysIqbfOYn8g3p7GgWaGD5bPM1mU+ZJI+tXUBplfaP1AiVRlxz
	uGLL7AHFQIKlr2aUg5yrpwXGiQOQi64PDlrehTD7dLILC68cBPGn1fnmT+0uIWQUcSHZ
	vAA2ZEBVLY4yH4thvgrAitxkDGgcXJTus0v5Wap+1FQ7+QxI4w8bUvkEaxTdHuwRx+Y7
	7QpyMstJAgPnSp9TUrAt8rTQDHKjghy0NxWFEC7+YKoMKS0FrSViTBABummkHBhbiey5
	FToNVZhY2gtEmp6qQ7xWFXq3woh/yfcu4goWX9sP3SRWeOS3qnwujjOADtuUxpVFhLpR
	Mrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uJajWkZkeoq2TD8VqmwMxzl1jniLDlD4RJCDuF5e3Fw=;
	b=kPzWqf+5Z5P0VTPPMhd2mODQA9q2n/ZeLZDODNvruLyXVQxoCrrsuBiVBGGcyBRYDT
	7Lrn4lmBcwH7sL8oRE/N8JEG76mG4wmuNev8cVuNK8BgjZbhWEWd8ddTV1fboOC9Y1xX
	0Sy4hIeuzgyyskloqPgF9qwQ/ytKMDdw0oPRFYjhNKWIYVpOa3g0ymy6CaVGZ9BOC6Lk
	WrzEiftynL+TTFY7gTwVX1r7UOF6JgrX9HcvfOUZnCKAPUZP98jt6x9SVBwzKz2YZG2n
	c1xR9sn0VgGUq9YkdO9Wj2C5OdbQzbi2VcHz3h6JMrFHRo3qKJfmxOpqlC62JtKg+ioE
	m1rg==
X-Gm-Message-State: AG10YOQEk+ZcYuc0dF1uJHXYAd1hCA/N6CSx+7CrpnKuecw6dtEiKJIm8c2fJzENTQcgVw==
X-Received: by 10.140.218.135 with SMTP id o129mr18566997qhb.1.1454480886241; 
	Tue, 02 Feb 2016 22:28:06 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:56 +0000
Message-Id: <2c95643405e6126cf536b7b2ed2155efb25eabcf.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
References: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] security_flags: Disable fstack-protector for gcc runtime libs
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:06 -0000

it causes a catch-22 situation where we build libssp in gcc-runtime
but also pass -fstack-protector flags which require libssp, these
libraries are special as well.

also flush out ldflags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ac4fc65..37570a6 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -39,8 +39,8 @@ SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gcc-runtime = ""
+SECURITY_CFLAGS_pn-gcc-sanitizers = ""
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
@@ -59,7 +59,7 @@ SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc = ""
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
@@ -90,6 +90,9 @@ SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
 
+SECURITY_LDFLAGS_pn-gcc-runtime = ""
+SECURITY_LDFLAGS_pn-gcc-sanitizers = ""
+SECURITY_LDFLAGS_pn-libgcc = ""
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-- 
2.7.0


