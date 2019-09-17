Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 102927F770
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 09:18:43 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i18so2250494wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Yr3Y5R+zIShNMRtDw5pSS5a9ShULsUGcoIfd1xAzk8=;
	b=cbv90CIJq6gL+xYbeYRrkFcTwTHt84eKxYEbwkHU0f1AlbKdo3irk/PnD2vWvOHcCN
	4YqZNjOCIImnPmfj5CtSnjCMM3b6yJKU0Tl1D6ISO51MKYpoUB4eNwOV28htsOqu22h8
	AmqD96EgVQNZIi3Mi9gXZ0uJy/EyZWsMkeU6sHzZl6TOcG0rDzS5KrS94SBWX0i5jNk3
	2h2gcY30DC8/H50AsJp9V65LvVWws2Kz64h7BtIMCVY8aBV7ZHd499JfaDzESpmdT1dK
	UmVv8LAHge4nVgNm+Aytrn1IBprpEzLYyM5Zxf1g4AhSWFYKeK7HOmtHhgfVZn4Xg5rJ
	RpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Yr3Y5R+zIShNMRtDw5pSS5a9ShULsUGcoIfd1xAzk8=;
	b=lXygcRPMq6nZpFOMPDxfnEhSHrL4czm7DMvUMuemTY5NdbDqCaqQF6uTkFBKslALwV
	ZwfVkAcwyiuyzV+zrVuc1p19kl3iQj4zB5HTu365qGHykW+1kbVCpnWWTSeAptOqVQeV
	1HYceNquPRUPLwjwN1LpS0VHxEbZsfph+IR7iH+np+3jaWoK1h6CuxRyjzjUk3z3yMEf
	3Qu6C66XtmjVZ2fvVqLjG3H+3y+r/wUpj8IzFILUeUluNfcxHV4osefvRI7GoFgQqljs
	htb/Wlwk6VElYd+XS7x8YszPXvv8ykjn/0jG0Qq1uotfoLgEr1coVBX3jSdA8yP+fZh4
	QRLg==
X-Gm-Message-State: APjAAAWBhuwvQzKwIyz6B39MmKb2wyq51Z7/+xVP2qVkks+zHHPL+tVT
	L5ILchm8ovSZfEY36nVAiQakwLfELzA=
X-Google-Smtp-Source: APXvYqybr1cm3ApO/o13vHxfJXMl6H3TfuP7YgINFYjLjznNfcxAsZpLdJDYPi6YJvgVk6+ZMl3wUg==
X-Received: by 2002:adf:ef44:: with SMTP id c4mr2239208wrp.216.1568711924192; 
	Tue, 17 Sep 2019 02:18:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f83sm1668782wmf.43.2019.09.17.02.18.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 02:18:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 10:18:39 +0100
Message-Id: <20190917091839.3280-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: respect SOURCE_DATE_EPOCH when building ipkgs
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
X-List-Received-Date: Tue, 17 Sep 2019 09:18:44 -0000
Content-Transfer-Encoding: 8bit

Backport a patch from upstream to respect SOURCE_DATE_EPOCH when building ipkgs,
to ensure reproducible archives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ld-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch | 44 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.1.bb            |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
new file mode 100644
index 00000000000..a181169d476
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 59da5577bf8df441c6ca958e50fcb83228702764 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Thu, 12 Sep 2019 10:24:58 -0500
+Subject: [PATCH] opkg-build: clamp mtimes to SOURCE_DATE_EPOCH
+
+For reproducible builds, clamp mtimes bigger than SOURCE_DATE_EPOCH to
+SOURCE_DATE_EPOCH (build generated files, usually).
+
+Fixes bugzilla 13450
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ opkg-build | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/opkg-build b/opkg-build
+index dcd2d68..2517a2b 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -297,9 +297,16 @@ mkdir $tmp_dir
+ 
+ build_date="${SOURCE_DATE_EPOCH:-$(date +%s)}"
+ 
++mtime_args=""
++# --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is set, to avoid having a generic case dependency on tar > 1.28.
++# this setting will make sure files generated at build time have consistent mtimes, for reproducible builds.
++if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
++    mtime_args="--mtime=@$build_date --clamp-mtime"
++fi
++
+ ( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -print > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index 4be7b16d8a2..cf1e4670c65 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -9,6 +9,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
+           file://0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-- 
2.20.1


