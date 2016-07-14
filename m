Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 432AB6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:43:31 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id o80so118386715wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vn2AVQObaHsWuJ9mHnAYEQ44rUpvc10KJmdPgtXCYuI=;
	b=N6o0X+/3Vta3bn7QkZCTmdNycRIEqSZBg/XhaxLWWEFVdVC+5MQh8CPS8k2q+MyGa8
	QCcdjNJ12lVf89eORERxVaMMbXtpBPKOfYSpxfToVNKk3m0bU/lWDjoyETxId0EN5EnD
	dXSWhpKyeqYL9HzlAggfEFI/wuV3jsfJeWPZMu+KEm7guCuB3qM91fPAZWaTxQ2qzpiR
	ejtfMFssF+ybydirM84aNVOOoEb8LahPhkMRO/0jNKlUen/BuP7jjw8FCYEuICisEWrp
	rdHnUbooA1yCW/LfD82/dx5U1FJ5U4MmBvqRGmv/YoJ1qBqaMuecLuwnrwlWy+9Qo4v9
	zFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vn2AVQObaHsWuJ9mHnAYEQ44rUpvc10KJmdPgtXCYuI=;
	b=QYDA7SnWvFx2OOPtgrPmsaymfFYj+VfBhGUvKFz7MKEgxKa/oAyOz6Pzs66wqSephg
	RNCSN67qe6KpOxOyaa6UiBeuVofEOGAqaYDpetqZFuwAlL5/1ktaXT5Qm2Vgj8zga/rh
	w4xNRNOZpyUZ7+LjVLKlNkmWAtqc7bOS/rmkR8w46BaLHBdWgjBoHhop30hesvrCEqNA
	7sMBt7uRWBeVOS/L05kB/LuPnjQUZbp/pKtE8BmP3DtQC4XQv7aVuIqCI9ISMgmwNAsV
	+Qda8ai4gCat7EV7NZJv2Ze0BJYMec5bL8U2ByApUZyTClzWhlA14CcWp4GAlrjSss1Y
	MWBQ==
X-Gm-Message-State: ALyK8tLCdnGjMZnKUmcVaJ0xxYBj2BozvAy2sIzJ/8TEtqMbw5u08hnUyf45txN9CUzTINgt
X-Received: by 10.28.127.198 with SMTP id a189mr16583189wmd.16.1468511011161; 
	Thu, 14 Jul 2016 08:43:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z5sm2558819wme.5.2016.07.14.08.43.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 08:43:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 16:43:26 +0100
Message-Id: <1468511006-4514-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] bash: fix string format errors when enabling security flags
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
X-List-Received-Date: Thu, 14 Jul 2016 15:43:32 -0000

If security_flags.inc is included then bash 3.2.48 fails to build:

| ../bash-3.2.48/print_cmd.c:1152:3: error: format not a string literal and no format arguments [-Werror=format-security]
|    cprintf (indentation_string);

Backport a patch from upstream to solve this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../bash/bash-3.2.48/string-format.patch            | 21 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb           |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/string-format.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/string-format.patch b/meta/recipes-extended/bash/bash-3.2.48/string-format.patch
new file mode 100644
index 0000000..eda3964
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/string-format.patch
@@ -0,0 +1,21 @@
+Fix a string format warning when using security flags:
+
+| ../bash-3.2.48/print_cmd.c:1152:3: error: format not a string literal and no format arguments [-Werror=format-security]
+|    cprintf (indentation_string);
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/print_cmd.c b/print_cmd.c
+index d1dfd1a..956db53 100644
+--- a/print_cmd.c
++++ b/print_cmd.c
+@@ -1149,7 +1149,7 @@ indent (amount)
+   for (i = 0; amount > 0; amount--)
+     indentation_string[i++] = ' ';
+   indentation_string[i] = '\0';
+-  cprintf (indentation_string);
++  cprintf ("%s", indentation_string);
+ }
+ 
+ static void
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index d42b292..6b4028d 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://test-output.patch \
            file://run-ptest \
            file://dont-include-target-CFLAGS-in-host-LDFLAGS.patch \
+           file://string-format.patch \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-- 
2.8.1


