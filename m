Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9811B72701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:41 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5962025pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AofBZ8TuSb7bGkR2nzmdu/YiLZAkWGJC/RWKD/j73ww=;
	b=bxtwKekAEj+q3zL7dmEqatQ2HRXTivWpYOlBiNhKmVei4iKW+h2VyuooNZZXzysT+F
	7Ve2MPwbHay19cuYt60bDfYLner9/gr+31Fkwi9XidzCg8Kp/pzA8MIHD0Sptr4BydHh
	HQgvG1RqBg53k6bhKnxfkNcq2+Tm5d9nOvEoAuvoBum1xgW1S16Nth0/nV6fRWsfKbsE
	EKI4d/+lq4i9U1NFI1HWQWFqR92FDk7y6GsAEhEiVHKeAhaO5NcoLHkOrru8tvcZ/mpz
	n8VD7bKBWM/Zoj+NsO/DJA95sBLrWMF+KpJV+q8hZb852ZnSjKhGu1nx83VqjS5ctXRc
	eXTw==
X-Received: by 10.66.55.74 with SMTP id q10mr5337665pap.94.1423152282821;
	Thu, 05 Feb 2015 08:04:42 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:23 -0800
Message-Id: <b41f83f1e1064a00ec4f02136d1796435eba83bd.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 15/61] security_flags: disable pie support for libaio, blktrace and ltp
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:41 -0000

From: Saul Wold <sgw@linux.intel.com>

libaio when built with pie and fpie does not link correctly with blktrace or ltp
so we need to disable those flags until a better solution comes along.

(From OE-Core rev: 4fbf13a6c28fc1170a4defbf50032546a14eaa59)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 840f68a..d6f7e9c 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
 
 SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
 # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
 # to CPPFLAGS it gets picked into CFLAGS in bitbake.
 #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
@@ -43,6 +44,7 @@ SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
@@ -51,6 +53,7 @@ SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.9.1


