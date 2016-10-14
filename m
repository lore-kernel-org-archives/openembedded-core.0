Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6C570719E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 17:04:31 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id c78so8867013wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7zMxr/2gQus9J3uQLYY5c0dwqBAw8mxvZJ0ftemeVJU=;
	b=fw0lG7Fx6gDIHfr8p9vY9RDiRDNb8soFaA3OdrU9dpAB2vkjLVIIgVnK3u4t0R42kD
	wwqgEuB9pXeisB10PRLV0c/usVaGCHqWyHOuBbo4h91UAR4lKwZluvr8diAwT8pWWVHJ
	mAyT7Aa9Zx3rUBbeaBy2GHUpDQtzlu/cPzVfYp8ASU4iPZia2fSAGwp4nAbp6QEDze/1
	/fSRRDtPXpkJfyNEeqqNPEGtWNgYgmF3JUCOYTYZpk0dwytT4umAQYmQDudPDpklziWm
	xb8iSE+Bs/dyaMHQ4CXLifzJdGwq9QNWgXUCmeOjILJ8efQ5V5ERfa+zAqZnohg0i9hu
	AXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7zMxr/2gQus9J3uQLYY5c0dwqBAw8mxvZJ0ftemeVJU=;
	b=WMvHvsd/duDAbJm5yujzi8Oh2mKDs9vzxg9GvIf7+hNy+NKh2y9D0Fr9jtWmDKkHFW
	Fl8T5rd5E1HT24DyIHoM8D6118R7NK8odNfx/31DKBZPfCqAN4D+e4XL8N8ecUKl9scr
	vVuWRMFf4g6kw88WbLwARnWpqS/hZBGQ3rZD91ia4Zj+atRUsufB2wICTNaRZYVHYkj/
	OObAonR5KqPpHS8V6zDNFO5l9VUCLOUYt7faeZcoD/teppsbfOHMnoJPRX15Lo7GndgF
	Cpe3Ya1lGmucahEP8pGiQfNKswtw0Q2YMQ7qNkGp0qvsDUnE6xvRWwB1p9uiWB0QxG/e
	e2yA==
X-Gm-Message-State: AA6/9RkWsIcJQahPiOQ8ZEWBM967H7f4uwiA/IVYopPei/nWLY2RT6WJNpMCn0SDkrWGhciY
X-Received: by 10.194.22.103 with SMTP id c7mr2695817wjf.34.1476464672857;
	Fri, 14 Oct 2016 10:04:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r195sm727769wmd.14.2016.10.14.10.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 10:04:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 18:04:28 +0100
Message-Id: <1476464668-18886-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] populate_sdk_ext: explicitly set DL_DIR
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
X-List-Received-Date: Fri, 14 Oct 2016 17:04:32 -0000

The eSDK generation assumes that DL_DIR is downloads/ under the build directory,
and puts files such as a freshly buily uninative tarball in there expecting
bitbake will find it later.

Whilst ${TOPDIR}/downloads/ is in fact the default value for DL_DIR in
bitbake.conf, and any instances of DL_DIR are removed from the original
local.conf, there is still the possibility that other layers could contain a
site.conf that assigns DL_DIR.

If this happens the errors are quite mysterious as it fails to find the
uninative tarball and so the hashes all change, and eSDK building fails.

Ensure that this cannot happen by explicitly assigning the DL_DIR that we
require, instead of assuming that the default value will be used.

[ YOCTO #10439 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ddf3962..0f0525d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -282,6 +282,8 @@ python copy_buildsystem () {
             # Write a newline just in case there's none at the end of the original
             f.write('\n')
 
+            f.write('DL_DIR = "${TOPDIR}/downloads"\n')
+
             f.write('INHERIT += "%s"\n' % 'uninative')
             f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH', True), uninative_checksum))
             f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
-- 
2.8.1


