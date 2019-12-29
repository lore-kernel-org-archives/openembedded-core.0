Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id A8ED27F7BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 6so17011218pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Biw9SMTCtcNY0Nt2RJ0levHZuB6d5Wv0kxGjTPa178Y=;
	b=VA0ucwKdn3+KhQ06Q2BHskQnY21/kYRQburxMcaVRrr3ShalQGNZA3xew8YhddBv1u
	R+SgKiGEX9hAVDIrvY5bXfacnQJlCk79VCbwA3y4jYZUd+JoNzcXJizqPri+sc7WfxVA
	7cUzMYqGNc+YMhiIg9VRt2qolpf0wwKdHJswRB3FKExWeKzwICKoGTFr74EmjShe+K4q
	b8na8pukSldeY3OvCf6B5koVBTmeD50DW+VIdurl7Kr8C3b996bwPerggdkG4cH+2MG7
	9JPCgAQK3lXn5dEYW6ES/t9yB8SUDGgpW62/Sec7jiDR/pQF8I6CATL/fLgcIca9gcz5
	TldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Biw9SMTCtcNY0Nt2RJ0levHZuB6d5Wv0kxGjTPa178Y=;
	b=rDvMZnm3QeaJbwlSLMJiN9jOIU1bOUxBtAU3p1ii7bPJTaidHx2dT+t+NefDEwnaMt
	k0//OhzmD68sunKrM1mslVG0iFT1gn6ekC63DaDcWLEJYKKGeudt5MYvbl7cfxyF9Ly4
	zz1ULPAZMs7SOYHyqtqSpiFq6Sm3FIbiJ/ga6ONqfxSeqVD/gkUIEtJmxWdf7Qt1pHV7
	d0ahCtAcyMcTZQFDXnKhUnsCvHDSQ0orlqrx1t99ySw1ZR2cHCCrpGLEbeUO2P5MsCkK
	n5T4qs6RNU3aEZyc7RsdcCgRYJxJOe4wWMlFE83w4jfZCVrpOWMbf2liU5cLmDgmIv8L
	Yc5g==
X-Gm-Message-State: APjAAAVNJ4D4WcOYTsiw5PphL3Oftiufj42CtmRv893b/eWN0En50cZr
	PgLmmCFn/jgtpIW5aa76pckmpmtnRAA=
X-Google-Smtp-Source: APXvYqzC9Lh08tFXlnN7BAE1IGM6qcgW37SYisL5b/CbL4fnvGi5NoUJ4kj0q2r5QWJcfp8ufQ3O5w==
X-Received: by 2002:a62:1552:: with SMTP id 79mr66933743pfv.156.1577645070469; 
	Sun, 29 Dec 2019 10:44:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:43:58 -0800
Message-Id: <20191229184415.19514-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/19] systemd: Fix time_t size assumptions
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ead-of-TIME_T_MAX-for-timerfd_settim.patch | 31 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.2.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch

diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
new file mode 100644
index 0000000000..76a1c7364d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
@@ -0,0 +1,31 @@
+From 6bcf562bd1e541c7aa46923d9a14201c7f785261 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Dec 2019 12:49:07 -0800
+Subject: [PATCH] Use INT_MAX instead of TIME_T_MAX for timerfd_settime timeout
+
+kernel prior to 64bit time_t support might not entertain such large
+timeout therefore reduce it to INT_MAX which would set timer expiration
+event after 68 years of uptime, should be good for all practical
+purposes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/time-util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index bfe2c60da1..8cf682b36a 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -1486,7 +1486,7 @@ int time_change_fd(void) {
+ 
+         /* We only care for the cancellation event, hence we set the timeout to the latest possible value. */
+         static const struct itimerspec its = {
+-                .it_value.tv_sec = TIME_T_MAX,
++                .it_value.tv_sec = INT_MAX,
+         };
+ 
+         _cleanup_close_ int fd;
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/systemd/systemd_243.2.bb b/meta/recipes-core/systemd/systemd_243.2.bb
index ac7a5f86b3..3f68604a5c 100644
--- a/meta/recipes-core/systemd/systemd_243.2.bb
+++ b/meta/recipes-core/systemd/systemd_243.2.bb
@@ -46,6 +46,7 @@ SRC_URI_MUSL = "\
                file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
+               file://0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch \
                file://0024-test-json.c-define-M_PIl.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
-- 
2.24.1


