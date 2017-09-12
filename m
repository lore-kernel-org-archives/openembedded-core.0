Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1824478484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:59:10 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id m18so23767645wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9hv2XIU8US568hEkAuW2/6Y4Q7yGXfPUOI78G0YGdpU=;
	b=ZXYs4SrbUEDD/mPfGgWd3UVsCaoQzsGUmxEGiXan4RoSNO0IX88wV6WxQc0dxQjzXk
	v95ZWYUrQ/ko347AIne2caCTlNsnoTNnw62JVlLPhqdORMXs61yiNfFh5ybsxepavHCb
	JvjuW0F9vWOdpk2L7RPSTatSPytoGo9oIvEZTo9emzYmhxWrgogiFMXhvHrIGI4ghspS
	/pDQ1EZv7o2PwUmpuXe/06qCGIoJFq2vVypt6mEOnOMNf/Q2cWSBIpRgPadocqCFLxiw
	qAPiLG26JV50GNjvkFzWNo4fCCcwlgfqU7ALRP8bC50GIOqyDog1jMnD4TMPfIQMVWq8
	Wf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9hv2XIU8US568hEkAuW2/6Y4Q7yGXfPUOI78G0YGdpU=;
	b=JayKCpjS6VPE6//u00IONuLpQ78bPDz8V5RE8Jt2kpZqDnsHWt1LlVz8e1aYbJTdsO
	etINu3AvHehni65ncutbKbjMV8Z2B4CkKc/ePmokVQvJo0SAs/ihjhunHcU0/0u31Vd6
	BQ3/EGVIYO720LK/iDvKBAWgoaVMLUHaaMwuz31jPB9uqdLJ58rdK8zPTEllRrlXO54x
	Kz/4JAqy0y+G3BCAQ8koOwG9Ycq9nouLD0+Ldz7YynsdlSTGyHLjei4LZuG8chwrmTjL
	+uDSz6QeoRbKBms//RKn36aWvAnRRJryAiKd3DZ6GZ2g3lYuhK+T53st0JOFGGJgTEfg
	N+KQ==
X-Gm-Message-State: AHPjjUjopSJpCJBBrAjOUnkt0GPn7upZxc226SCihKd8snweTxl9hpT9
	WaSMiv00n6WIP9Bu8D4=
X-Google-Smtp-Source: ADKCNb5YEw8tuu1RUd8vncjdY3tcGwVO8Njqnb7cBkEs6t2oRiEI6Ep4hEAPNvZQ88V0ZzB+YjdcVQ==
X-Received: by 10.223.164.206 with SMTP id h14mr12360472wrb.221.1505231950969; 
	Tue, 12 Sep 2017 08:59:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f188sm13884603wme.21.2017.09.12.08.59.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 08:59:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 16:59:06 +0100
Message-Id: <20170912155906.29716-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] allarch: don't reset baselib
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
X-List-Received-Date: Tue, 12 Sep 2017 15:59:11 -0000

allarch currently resets baselib to "lib" in an attempt to keep allarch recipes
uniform.  However if the real value for $baselib is actually needed, for example
in a multilib environment where $baselib is lib64 for standard binaries and the
allarch package is using postinst intercepts which need to know the real value
of $libdir, then a non-existant or incorrect $libdir will be used.

Real world example: liberation-fonts is allarch and inherits fontcache, which
uses a postinst intercept to run fc-cache inside qemu-user.  In a multilib
configuration where normal libdir=/usr/lib64 and lib32 libdir=/usr/lib qemu will
try running a 64-bit fc-cache with a 32-bit ld-linux, and predicatably the
binary crashes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/allarch.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 51ba509cd0a..e0326039d0c 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -13,7 +13,7 @@ python () {
 
         # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
         # naming anyway
-        d.setVar("baselib", "lib")
+        #d.setVar("baselib", "lib")
         d.setVar("TARGET_ARCH", "allarch")
         d.setVar("TARGET_OS", "linux")
         d.setVar("TARGET_CC_ARCH", "none")
@@ -48,4 +48,3 @@ python () {
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
-
-- 
2.11.0


