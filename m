Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 87E6277143
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 16:10:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l6so30304247wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SkDC5kcz6RfHIkwLma3YbCeycE+F5d4Zs26yE8+nK0I=;
	b=NwKdPpP1OZ9q+Chh4c/eXfrA4AkRTTTCx26Adeeq3Nlz9AJuQNjBX+5blZ/g32/Zzn
	+TBuULgFunxkCT2EY16axS0X6ElBORmIaph8fg4sbyz4jVDMvCtl1KZRlBKOGioXY7/j
	3bQ/l38Ma4ibbL0yfI4ub+IP6MUx2ZmqMiGvlw6Wau4GI/hisRJPChY1i+TkwgalJDct
	bCYlhzZ/NHhMYprxtHP6/4MNLJLjiNyLuCSGa2F44M0LFvHYluBaTlKZQmlAFCuE0gd+
	72zcwlayFOZ/wa7+Zvki0fTkPFX8896csrovDsqG/w3jyMvGZkf2C/IFNXK+QPnHG2CG
	MLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SkDC5kcz6RfHIkwLma3YbCeycE+F5d4Zs26yE8+nK0I=;
	b=JWUR0fJcXXSOUa+x5ZyyskTj8LEwvf4kZZjHnsh2Jp5IsHP7ccYloult0f4XdGsq3b
	OW5R8JpXdoB2GZO85ZVADkeH3xB8rFFC8lecDCxqdqtyPm43+4iVQucm+dgKYkAJ8GZu
	WY0SmMN8UG+iDp93nghsXrXjytKh8vCL9/3MYTwQo2cxep7/Tnxr1Bzqs3ltQFoc9HBh
	ogsDdzbVeCz9FHe01UlUFUR2ys4IqgZjMVAN33KzC0s7Lw+qTIXdI1RP6oZPxXYS2Ly+
	mPlwF2467n6VesqEIpGMbZ2JZQJ6qPLqmJSVXZWMQGewGMugzid1d5eCUXAVRdfOG2qw
	eiZA==
X-Gm-Message-State: AD7BkJL6JEe0UbHQSGzQdRZrs1hqKeRIV25pSxiq8GfLgCGCE3litBi/z7uwg/8TljpoY/KC
X-Received: by 10.28.65.137 with SMTP id o131mr19546248wma.54.1459872648328;
	Tue, 05 Apr 2016 09:10:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	wr2sm35479664wjc.49.2016.04.05.09.10.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Apr 2016 09:10:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 17:10:43 +0100
Message-Id: <1459872644-6381-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] package: do_split_packages: expand variables in extra_depends
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
X-List-Received-Date: Tue, 05 Apr 2016 16:10:48 -0000

If a recipe passes for example extra_depends="${PN}-dev" to do_split_packages()
then it isn't expanded, so the check for the multilib prefix doesn't work.
Solve this centrally by expanding extra_depends inside do_split_packages().

[ YOCTO #9381 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdbe96d4..4452e2f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -123,6 +123,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     dvar = d.getVar('PKGD', True)
     root = d.expand(root)
     output_pattern = d.expand(output_pattern)
+    extra_depends = d.expand(extra_depends)
 
     # If the root directory doesn't exist, don't error out later but silently do
     # no splitting.
-- 
2.7.0


