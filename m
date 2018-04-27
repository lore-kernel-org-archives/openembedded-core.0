Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 622DC74559
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 15:58:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i3so3757816wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hTroKJzLuTpn8xYXHHpbsPeMSiUIx1COB+MXcAu8yZQ=;
	b=jin22o2mOGqEPf1FHeKUA3F4LwkZkwrXjKC5mpK+uJgAh+jBg/Ri6Awm3LuXHHDjpp
	OLetqqQiBS9JFnLSSn9bLEEqMFjRfW9PIzTcadvAWwxazEFxqZzZZgIIPBCi3ckDjgtS
	Lb04CMaXwRuREt9wEEnlGqtiY/HRKuXuijy66DfR/SqwyMRKfFXxDNvYzb2aRZp1jwe1
	aFwL0oDs9gYDlZ8SReVriw2VYeZdiPFxATSqhJ19w+zPvh6rl/+NUm3CSS+vsS4q63HC
	sHQQ2G6B+qlxl9HFBDAddNHXJnS+dMHCzuElY2DwczZicC0gO8SkTYXvWvdHEZhMtoZS
	/N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hTroKJzLuTpn8xYXHHpbsPeMSiUIx1COB+MXcAu8yZQ=;
	b=XggtCDj5k4GgGaZ7+5YoNzwxUytnVlX64lsJH9bZLmc7VqjAPcRlAQs6CGuN0jshkL
	d6oAeIz5cPUrFl/gJffGXI9e3qRwtmja+rxKL+PtlmmJZsjMNvVVtsFLmQtN4U428Jh2
	RTLDQY0gpBIZxneltNMd42ShVqPR0e73FNYSiJRVb4HUbBVD21oV9zGk1rAFZehxL+pa
	mfl1vcpvNFh3kiYZtvgCu7ovcatFn4zsSjvUmC+DJq/Gk/YyygEXCoDwDtBLbRgZJ9wk
	mNjPlV0bFMxvySccWZLYowb/oq8xxu90DpUowx1eSEraLeANtZgBybPYjClm5B4ebfKc
	1w5Q==
X-Gm-Message-State: ALQs6tBLrAQ6gyCOXk+j3FuSycYHmgP796jfiIi+RHrP/pZXodYNk3Pg
	hb/tmey70m97sQMEwFhUpT70uDVs
X-Google-Smtp-Source: AB8JxZoEab4Kba0e/wv0vn8Ky1COW5BulanFa9VNtdwDbUKsiXtykZZZWl8bCILjvBp9wVQk3MZp+A==
X-Received: by 10.28.24.11 with SMTP id 11mr1898128wmy.21.1524844707007;
	Fri, 27 Apr 2018 08:58:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q138sm1724000wmd.1.2018.04.27.08.58.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 08:58:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2018 16:58:23 +0100
Message-Id: <20180427155823.30464-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180427155823.30464-1-ross.burton@intel.com>
References: <20180427155823.30464-1-ross.burton@intel.com>
Subject: [PATCH 2/2] rootfs: only use dnf to cleanup if package management is enabled
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
X-List-Received-Date: Fri, 27 Apr 2018 15:58:26 -0000

If package management has been disabled then we've already removed all the
state, and running 'dnf clean all' again will simply recreate a lot of the
files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f8f717c0505..c51e76ddfcb 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -472,7 +472,8 @@ class RpmRootfs(Rootfs):
         self._log_check_error()
 
     def _cleanup(self):
-        self.pm._invoke_dnf(["clean", "all"])
+        if bb.utils.contains("IMAGE_FEATURES", "package-management", True, False, self.d):
+            self.pm._invoke_dnf(["clean", "all"])
 
 
 class DpkgOpkgRootfs(Rootfs):
-- 
2.11.0


