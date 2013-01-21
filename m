Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxM5G-0004Jc-4M
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:27:09 +0100
Received: from mail-wg0-f71.google.com ([74.125.82.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 10:11:31 -0800
Received: by mail-wg0-f71.google.com with SMTP id dr13so6808214wgb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=Rtp1ZLN78WwybWtFLFzcB8esiJKhCaDtx5rUvwj4Dv0=;
	b=YJnR0wG8g4rUBBBVIu09W7Qyq5P9IHBnSpP/7+BvW0mc5bp/e9k/sqwy0yiQKyXqy9
	PQOqFpAYjWm8QmAB0SfsTCEiPZpbsgtd3zBXM85ZbzNdDdLjzUL9mwIcQrugWe/7pQf/
	pmXAd5ObuSpy2nmUuuyP46avo5wC5rXXmzmnelPuoCQrBH/Z19/e0q9bRtsLDPrd2nHq
	ozNgfr5zkJe4lntGWg0/wPUrKvJfAZM0tf/9aUWu4xnUBnhmNeZbtvZALiQACUj1mfhx
	a0nOZx/XTukIP65daI8QpIKDi6vnNIEppMVOtaG0MbfmAn4iwnGUW872uuVX3klr8+BP
	zUgQ==
X-Received: by 10.194.143.35 with SMTP id sb3mr27867834wjb.30.1358791885973;
	Mon, 21 Jan 2013 10:11:25 -0800 (PST)
X-Received: by 10.194.143.35 with SMTP id sb3mr27867828wjb.30.1358791885915;
	Mon, 21 Jan 2013 10:11:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm19814796wiv.6.2013.01.21.10.11.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:11:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 18:09:20 +0000
Message-Id: <c48cd0ac77f9856938b27489ff9278ddc127bab8.1358791697.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
References: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
In-Reply-To: <cover.1358791697.git.ross.burton@intel.com>
References: <cover.1358791697.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmy8uiaQu6S/IUFj7KCdeQAPpVNIw7m1KfkyAo3O7RzD/+Q9fLb1+H5ODKgzTrQnNs5WCmphbGhUPzRPUhh6YvBgpqI2wrLBZ7opi6WNyQJ23rSv8BG3pKAyQoORdrhyYTe42+Jka5zA2ozx6UtQIcHz93FB+b42PuaDGesc6sT28TaJZKbIQvbc1dZ7WWXN6sHiV+q
Subject: [PATCH 3/4] systemd-serialgetty: skip package when not using systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 18:27:14 -0000
X-List-Received-Date: Mon, 21 Jan 2013 18:27:14 -0000

As this package RDEPENDS on systemd it wants to build systemd, but if systemd
isn't a DISTRO_FEATURE then that package is skipped so world builds fail.  Solve
this by skipping this package too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 3e2a0e3..96cbf31 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -40,3 +40,9 @@ RDEPENDS_${PN} = "systemd"
 # This is a machine specific file
 FILES_${PN} = "${systemd_unitdir}/system/serial-getty@.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# As this package is tied to systemd, only build it when we're also building systemd.
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
-- 
1.7.10.4



