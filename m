Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 51ED679ED8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:53 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v28so1641732pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bx5+MA8Yr3IWmbs/9DSvW2Vw6mWufwNVDzh5d2s6BgE=;
	b=J4ZSeDucYlDfGjkdcs5/HYmnCSFV5ZRTmvEVcksQGneshb7lPpIdMGe4J6tbjEl/gO
	0hZfF4nPaza2cD9+934bOCn+S52sDDUgvELDVd6nbi6+Q8PMLsRTYCotx5vTpot+YmFj
	HVGjiJmBmeHgSgdTJV/GSDwoy+FFI/VOxYryTlVJ4rGwM2OhiZ8sb0Kl61+wvQThiC6M
	6/nEey2C0PWrhgGU4jOIp2Oo1cnpvAL+7e0AVrUj5LxMksh/ruoLqSjw+/qpdm9JA0BN
	7UVLE/r9yzAwaDeKh0UFwDj/bgfnWDIFxU8YHQWoTlcaGAYKwA6yC9c9rLkbM9HfiCd8
	qXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bx5+MA8Yr3IWmbs/9DSvW2Vw6mWufwNVDzh5d2s6BgE=;
	b=H/upVxj5Cu5kKp9NdeWfLEkgFrsTvCJywTYjSvNF5J+XhRNGMMgsDnAkUg/mb72kX7
	ut6WJvEpkCHWJeMnFaz+RvUrA8teWKLUJ4t7XGVmO953PGCSwf722XsTpLbSjW3E38u6
	7nbMh8cBE49P/B37SnqMKnF1nBx4QPYAOfN+3WeNUh6dYqMtIOpw/9zZaA8ndRh1mb4q
	t/T/t148BA4f/wbqewTL/b4hGoitAi9kiWVUpBJHPcqZgt3D9PS341muOn2OtUJOlH3/
	9xfG+Bsay/AX3T3/sUKTGatw51rjApvA5AOLJJYF7TTjTbMM+zZah9eJwl5mmwF+rg36
	s+pg==
X-Gm-Message-State: AA+aEWZgQ10YlspTNcKBWiVOeZL9iYS4nnrqMac/hKisicDq/gF5L2YG
	i0eKyXYNMCpiYesAndJTCMft7Px/
X-Google-Smtp-Source: AFSGD/UZCXB7weU81G6rhiskzJp0SMzAOlDYIusVPwZly8cCBZYwbXQnPIA8UprltMtUTSb/SYLbNA==
X-Received: by 2002:a63:a16:: with SMTP id 22mr417859pgk.318.1544737194229;
	Thu, 13 Dec 2018 13:39:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:53 -0800
Message-Id: <a60034e8896d4d74047fa7c93616ec3155fcaa39.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 45/45] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:53 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently these are in ${PN} and ${PN}-syslog may get replaced by
other packages but update-alternatives would error in the postinst
if other files were installed first. Avoid the problems by putting
the links in the correct package.

(From OE-Core rev: ef11c54ba99af261a70ec31091216cdd1556da24)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f1b09d9..c8919ce 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -368,7 +368,10 @@ python do_package_prepend () {
             # Match coreutils
             if alt_name == '[':
                 alt_name = 'lbracket'
-            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+            if alt_name == 'klogd' or alt_name == 'syslogd':
+                d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' ' + alt_name)
+            else:
+                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
             d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
             if os.path.exists('%s%s' % (dvar, target)):
                 d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
-- 
2.7.4


