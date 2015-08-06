Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA16A766D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 19:41:49 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so51647775pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jVTCtDTFkojY0/S84XZ5Lv8okE8RnWUGSyIgT2OJTiE=;
	b=v3E9tZdQwzpZn5zZhdnwmTyQOs6QpynjGcTKkpl5UG17KyqDKxopA3lp++yISMcVy7
	VlPXxB5hhJxAkH5WV9CHhdKSGPbV6ehrt5SG3Xg1grvicZpHYlnmBopKfSPMBbaA2URN
	+1VrBk8Vdmtq+2I3JBurpxHnprIJl52QeUlB0MJPqp7Oxpr97xUmYQbCZNNUcKQKj2V8
	tLERtalURetKw5X+oI04ge/mPUL8kBx7ayTjjufhuWTJvcb4aJfuLXXAoc/YyGQmI3qi
	HVkUOojohSJo2lsWJ5B/D+fnIGTxauD1sCOEH/lYfXRlNnRSDT6zDwn2xMCJNN5p7EtV
	uzGA==
X-Received: by 10.66.63.70 with SMTP id e6mr6574511pas.62.1438890110129;
	Thu, 06 Aug 2015 12:41:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	aw16sm7491315pac.29.2015.08.06.12.41.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 12:41:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:41:26 -0700
Message-Id: <1438890086-2710-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS
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
X-List-Received-Date: Thu, 06 Aug 2015 19:41:50 -0000

If immediate variable expansion is used, then UCLIBC_EXTRA_CFLAGS can
sometimes be derived from a partially expanded value of CFLAGS.

One specific problem case occurs when security_flags.inc is used: CFLAGS
is evaluated before the SECURITY_CFLAGS_pn-uclibc over-ride has been
applied and therefore UCLIBC_EXTRA_CFLAGS ends up being based on the
default SECURITY_CFLAGS instead of the uclibc specific value.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c483228..3ed8b60 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -57,8 +57,8 @@ export V="2"
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
-UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
+CFLAGS_arm = "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
+UCLIBC_EXTRA_CFLAGS = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
 do_compile_prepend () {
   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-- 
1.9.1


