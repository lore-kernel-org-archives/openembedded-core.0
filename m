Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 12A2B609AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 10:03:26 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id w62so4908061wes.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 03:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vF3EHsM/BrkgOVVK/mSnAb1NVx4sVIyIdUyc353jg64=;
	b=TC1CgVMD9xQH7KMjXdtWlNCmyDW8GaFRFhOS11CXb5mupF/XrXN9T85RRbmSCt+3xp
	yX3NMOWLrqEWcrzrtH1UepXB/QfQwR74TI9JkwZRFNNg7iqDzcdbNSfgKl+bFLahuF8N
	P02fxSnGerXg3bYYslDWkTdWWLQoFPzhXHoCaVcxsJHuXKNjG8IDllBIDE3I8uG2Qkg/
	BWrtfRcVo/JY2yDvJRGqCIBzDWvLTOZE2rgrMFUV50o++IBpkX+k9nJaV143pOM6w0BL
	3zZFa2q0UJ1DjkzAkJslPDOFUobqX5zBtU3mRjBIAG4zN2E/Ke5w2unBdzyLFGclKa48
	Ds8g==
X-Gm-Message-State: ALoCoQmLGOdkhJnPyPRbNIjysTwtpmvFPnAgRMw1apdEU6m5KZ7gdnIJ7TkOL6nUqNP/JBDg7f+0
X-Received: by 10.194.60.49 with SMTP id e17mr15099375wjr.7.1401703406838;
	Mon, 02 Jun 2014 03:03:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	en6sm31215003wib.11.2014.06.02.03.03.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 03:03:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 11:03:19 +0100
Message-Id: <1401703400-31541-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] diffstat: fix autoheader warning due to missing AC_DEFINE template
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
X-List-Received-Date: Mon, 02 Jun 2014 10:03:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../diffstat/diffstat/aclocal-popen.patch          |   20 ++++++++++++++++++++
 meta/recipes-devtools/diffstat/diffstat_1.58.bb    |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch

diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch
new file mode 100644
index 0000000..d95561b
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch
@@ -0,0 +1,20 @@
+Add a description to the HAVE_POPEN_PROTOTYPE AC_DEFINE so that this define is
+included in config.h.
+
+Upstream-Status: Submitted (via email)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 3f20573..ec5ca51 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -931,7 +931,7 @@ ac_cv_td_popen=no,
+ ac_cv_td_popen=yes))
+ AC_MSG_RESULT($ac_cv_td_popen)
+ if test $ac_cv_td_popen = yes; then
+-	AC_DEFINE(HAVE_POPEN_PROTOTYPE)
++	AC_DEFINE(HAVE_POPEN_PROTOTYPE,[1],[Conflicting popen prototype])
+ fi
+ ])dnl
+ dnl ---------------------------------------------------------------------------
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.58.bb b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
index 204473a..15fb423 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.58.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0
 SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://dirfix.patch \
            file://aclocal.patch \
+           file://aclocal-popen.patch \
            file://run-ptest \
 "
 
-- 
1.7.10.4


