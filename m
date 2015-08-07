Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 609B676599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:54:38 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so23371924igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iGm1r0WjUIibK9o3HOCfObVwChK3P6h5hPtdEifB9iI=;
	b=POBs8keaQWKkd3D9SfBPYEwZ09nCQB9ciFiKyjwbh95tKKVMeHTNwC8KytWAbfPGyH
	6Nh6swvj41SBqPAHI3Nh8kKEv6dsicSBX2DorXsI4Zxl8CbaEQ4t6arlFoInY8GW0HM4
	LVcK4PPCHYU1Hu6CHvRbg63ZFs5oKCtivnoyVRDbJ3Lq4XuNE5a/wN8giwNXG5Qrv2A8
	SQ5CTvgx5bbhWIGGvCOb6VJZztrQJUPECE4+dlrGNGouuX6RiG2C77l/YzVL8iKjOOCW
	v6i4UrzGlJBsFTD7z1hRLgi1laXhTZd5IlW/L/NHqzNqWWOKZ13YqMmW5vqH0nN3EBhb
	AFmA==
X-Received: by 10.50.78.133 with SMTP id b5mr891840igx.32.1438912479121;
	Thu, 06 Aug 2015 18:54:39 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j3sm2740140ige.0.2015.08.06.18.54.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 18:54:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:54:18 -0700
Message-Id: <1438912459-7242-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 01:54:39 -0000

If immediate variable expansion is used, then UCLIBC_EXTRA_CFLAGS can
sometimes be derived from a partially expanded value of CFLAGS.

One specific problem case occurs when security_flags.inc is used: CFLAGS
is evaluated before the SECURITY_CFLAGS_pn-uclibc over-ride has been
applied and therefore UCLIBC_EXTRA_CFLAGS ends up being based on the
default SECURITY_CFLAGS instead of the uclibc specific value.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 969c35b..e20fa5c 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -59,7 +59,7 @@ export V="2"
 #
 CFLAGS_remove_arm = "-fno-omit-frame-pointer"
 
-UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
+UCLIBC_EXTRA_CFLAGS = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
 do_compile_prepend () {
   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-- 
1.9.1


