Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id DBF8073243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:04:51 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so1182084pag.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aU/qIyjxdvCPwvZcHj9ypDqp84Sb7vty+CzAa4VQ0oQ=;
	b=fpqXmnVj90Ogk0p/mCef6e16mNzwkWWkyyigFChT6eMp1ka9dIMD+PLNwy9jDwb4P6
	P18MQRNkXnEyiZVoCA/Ym+gXuWS/KX9A2Hek2RO+LZcl4XvP2Bk9yKuorTvTLhZSUxYB
	OS8EW9gRdSvC5YM7oKTOezjJIpWzT4R6DyxiPAQnJ09MSSntO14Zj5GCNXsDiVsjkA+6
	BGc/O2XregVkpQo/fPftr3uQHMIIk1y3MdNvROwwtiv8ektpRbXNYun/0ne7WA6aw9DF
	qUCfqJ3A4fia0wVVwa5lg0378mFspuA4cZRVKbjwFkpDmErFhMC8ShA0G88b3wVfNN4V
	6FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aU/qIyjxdvCPwvZcHj9ypDqp84Sb7vty+CzAa4VQ0oQ=;
	b=mT+A+duLcDtmy+j5+xfXSK6gu7Ce1ygZMIIwNZxwSgM92VsUp6cQLUgC14NwJ4Pie8
	VCXibLNrOuZHJ+HKHZjPdAp+O/7RdxD1Vd3I7x8941kkYyCr10gNnhLaAEV9UzbJMZTC
	d1tWOM6ZAdrnfjwmoF+qwm1IJmHiktWckQbAPHJyAZPE/9+arhGK9tOcqyHKAnsgqFra
	KpqEceDy4E3QdikpALdYzr2XHhj+kzx1uo+XipHgpjywhJtW+SXkzCVm8IodY6Q6nYn6
	m8a09uoHUxzIcMLS2Z6HIUv6fq8knSp5t622xAo+Ic1UMFTH4kKAoIbJH66JsLbk1rMw
	1wQA==
X-Gm-Message-State: AOPr4FV/9aJ479NnHYDTyrKWJlyTulAt8CrdR2OeBY/0s3hScRqblj8xiZ2fQgEOGFtJbg==
X-Received: by 10.66.41.107 with SMTP id e11mr59694718pal.15.1462896292288;
	Tue, 10 May 2016 09:04:52 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ez6sm5569097pab.12.2016.05.10.09.04.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:04:51 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:04:47 -0600
Message-Id: <1462896289-15644-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
References: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
Subject: [master][krogoth][PATCH 3/5] openjade-native: work around bug exposed by GCC 6
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
X-List-Received-Date: Tue, 10 May 2016 16:04:52 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Simply turn off the optimzation that is causing this breakage. I had
originally used -fno-lifetime-dse, but -fno-tree-dse works at least
going back as far as gcc 4.8.

This isn't a real fix, but it allows openjade to work enough to complete
a build.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index bc25008..afcb8ca 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -44,6 +44,7 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
 oe_runconf[vardepsexclude] += "CONFIGUREOPTS"
 
 CFLAGS =+ "-I${S}/include"
+CXXFLAGS += "-fno-tree-dse"
 
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
-- 
2.8.2


