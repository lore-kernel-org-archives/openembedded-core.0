Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7247E7FC1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b19so13874860wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RBHNZRh2R7utzphbZJvcj+YTY5yBaNWraZT9EgP5B3s=;
	b=h2CfxwzxvUIFUyH6UJB1ioPhD+dKYoOr+KKw4zMoMDLTjDxZxR5JLxzElLk62RkIlg
	+xUGx6aM65EFZQxWLO9YZoBNTbIY0NAUPJTlVUTJZBEkQZOkJJjRDOusfljRXI8J0sgW
	ZFw0xCcmNONl00Z/8Q0lm60hBA3f4r2yCBnu8/7Cn3b+9sWz28mHW69cbXXgNj/d8rEb
	gMvcAdfUqqRHOOJDukMf1P2KUjYq2QZoEg78rAhLi3sNfhTsIaJJcMePAjtqzsS6Felu
	y74uXPcT+yDJAvrYAeNQpGHVoDxT1Sc4yVEoCfY06sTZiRx9YNUy+8vrC7wwegTeLuLw
	e9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RBHNZRh2R7utzphbZJvcj+YTY5yBaNWraZT9EgP5B3s=;
	b=as/P9Rghxo6+fm6RRClwuWqdSojrXg0QlpEatbzhA9dHXmqDqBk8rWwWN5IFlE2++N
	PrF6M20U7SgrXH1p+QjHsJrrqTmHq+W0BgB3yf1OPIan9WkoY+t5wLO5x8XR57JIZAYV
	uabhNNbqRXRzTg9ior4HlF+/8vKy+g0Ewq7Q2FOsBWopdjpYn3ti2DD9cj+Mm7tTvmku
	j2+OP9DJHzb8zMU3VMk1uKr3Xolw+gdaFi7cOV5DhSlZkQO3bNwTDBX3QFfN2ZuvzpJd
	KvS8LMpuDsuWvtOKJqhQNU+V0uvl7ArJaB4hyE5xWGU1ve/pZLCBcpyO+rEDXOMANXt4
	FxCg==
X-Gm-Message-State: APjAAAU5NSTs9YA+CJN3qnCkyO/kGr6ELWkatA15Z+MOjiOeUN6xro62
	UBggQCM8QZO3oHeM8Kt8iE1uIMQj
X-Google-Smtp-Source: APXvYqyMRahDQsvTSbn9RtP/WI9pPYNvnCGKhmelcZjzb7R8/Wd6KLJXK+1Dz1FpxVczBEEDTvvaPQ==
X-Received: by 2002:a7b:c00c:: with SMTP id c12mr26953070wmb.174.1579010427884;
	Tue, 14 Jan 2020 06:00:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:03 +0100
Message-Id: <20200114140007.36622-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/20] iputils: resolve a name clash with latest libcap
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...riable-name-to-avoid-colliding-with-.patch | 51 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch b/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
new file mode 100644
index 00000000000..e106a0cf738
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
@@ -0,0 +1,51 @@
+From ab1aa2eb0097a7ef05ffccac058b06812deb2695 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 28 Dec 2019 17:16:27 +0000
+Subject: [PATCH] ninfod: change variable name to avoid colliding with function
+ name
+
+The sys/capability.h header has 'extern int cap_setuid(uid_t uid);'
+function prototype.
+
+Addresses: https://github.com/iputils/iputils/issues/246
+
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/18f9a84e0e702841d6cc4d5f593de4fbd1348e83]
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ninfod/ninfod.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/ninfod/ninfod.c b/ninfod/ninfod.c
+index badbf80..28f03af 100644
+--- a/ninfod/ninfod.c
++++ b/ninfod/ninfod.c
+@@ -454,7 +454,7 @@ static void do_daemonize(void)
+ /* --------- */
+ #ifdef HAVE_LIBCAP
+ static const cap_value_t cap_net_raw = CAP_NET_RAW;
+-static const cap_value_t cap_setuid =  CAP_SETUID; 
++static const cap_value_t cap_setuserid = CAP_SETUID;
+ static cap_flag_value_t cap_ok;
+ #else
+ static uid_t euid;
+@@ -486,7 +486,7 @@ static void limit_capabilities(void)
+ 
+ 	cap_get_flag(cap_cur_p, CAP_SETUID, CAP_PERMITTED, &cap_ok);
+ 	if (cap_ok != CAP_CLEAR)
+-		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuid, CAP_SET);
++		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuserid, CAP_SET);
+ 
+ 	if (cap_set_proc(cap_p) < 0) {
+ 		DEBUG(LOG_ERR, "cap_set_proc: %s\n", strerror(errno));
+@@ -519,8 +519,8 @@ static void drop_capabilities(void)
+ 
+ 	/* setuid / setuid */
+ 	if (cap_ok != CAP_CLEAR) {
+-		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuid, CAP_SET);
+-		cap_set_flag(cap_p, CAP_EFFECTIVE, 1, &cap_setuid, CAP_SET);
++		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuserid, CAP_SET);
++		cap_set_flag(cap_p, CAP_EFFECTIVE, 1, &cap_setuserid, CAP_SET);
+ 
+ 		if (cap_set_proc(cap_p) < 0) {
+ 			DEBUG(LOG_ERR, "cap_set_proc: %s\n", strerror(errno));
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 3f9e9917f0b..a672ccdb7c0 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils"
+SRC_URI = "git://github.com/iputils/iputils \
+           file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
+           "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


