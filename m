Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id B701060C6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m10so4363560wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=crM80J1C+5tPn5UbP0dBbwY8Ekw08yEVHWJ43WQ5Hmo=;
	b=bnOPH8m4cfHqo6VuOJCoSN4jKqSQlWTg8wExSJJQZHTjHml4+I6suZUBt2VbbHIgrp
	PSSjiP0bSSLg5ICplZtGGYGkVap4FYI7VqRu0yMMlys0Y8PVbHYpdCFMY0Mzo2ujIiHu
	AcRWJAXftMLnYrK3e6SG2UsLr9ZJkvmSP4epQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=crM80J1C+5tPn5UbP0dBbwY8Ekw08yEVHWJ43WQ5Hmo=;
	b=iNig+nhrXZDruNWos0OhuO4fCN+8JplspG57dCWsr+L7jOErApn8WSeiKcxPR5qOFD
	uD8QbaMxfVeo4628Wg3ynbIKcofdWJnTuai7HsnrY3HsHL4qg66b18ffd3hSTtu2rXEN
	SzzpgHuTjYTCwGFxcMKqPyc7cMY6xoPzXBNUyarDCNZ3gVgzIvh38L/T6eJlotwzjbsO
	mWJc7/WrPx8gHEkfokVMX95WnKeNognYm5J77RPDWdPHyC9FTKhv0BqCYWA1zPQel1Ru
	LMDETs00FNPkftOl4xL7MV80tegHt/zr+YmsTKqG1W1bAdp7Ch+25FvLAfaw5zQKoeBm
	CypQ==
X-Gm-Message-State: APjAAAVTSxMDNWy5oDx+PmhkFo1p0RhYHDFgkEBJQl/blsXbf0Id/HDk
	ky2SDwNedqwJ2faxYGJoGzXaqqfio3A=
X-Google-Smtp-Source: APXvYqyshz1m+Jgz8/BEcas1Sm3D3Wl8DUoO8VEfyex2tSIQDTjH5c7lWVvj2LZgD1zSJQoi9AUEnQ==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr5307457wme.148.1580904713714; 
	Wed, 05 Feb 2020 04:11:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:46 +0000
Message-Id: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] opkg-utils: Fix reproducibility issues in opkg-build
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
X-List-Received-Date: Wed, 05 Feb 2020 12:11:54 -0000
Content-Transfer-Encoding: 8bit

There is a sorting problem with opkg-build where the ipk generated is depending
upon the order of files on disk. The reason is the --sort option to tar only
influences the orders of files tar reads, not those passed by the -T option.

Add in a sort call to resolve this issue. To ensure consistent sorting we
also need to force to a specific locale (C) else the results are still not
deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg-utils/fix-reproducibility.patch      | 32 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.2.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
new file mode 100644
index 00000000000..945979bc8a7
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
@@ -0,0 +1,32 @@
+Fix reproducibility issues in opkg-build
+
+There is a sorting problem with opkg-build where the ipk generated is depending
+upon the order of files on disk. The reason is the --sort option to tar only
+influences the orders of files tar reads, not those passed by the -T option.
+
+Add in a sort call to resolve this issue. To ensure consistent sorting we
+also need to force to a specific locale (C) else the results are still not
+deterministic.
+
+RP 2020/2/5
+
+Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/opkg-devel/YttZ73NLrYQ]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: opkg-utils-0.4.2/opkg-build
+===================================================================
+--- opkg-utils-0.4.2.orig/opkg-build
++++ opkg-utils-0.4.2/opkg-build
+@@ -305,8 +305,10 @@ if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
+     mtime_args="--mtime=@$build_date --clamp-mtime"
+ fi
+ 
+-( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
+-( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  > $tmp_dir/file_list )
++export LANG=C
++export LC_ALL=C
++( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
++( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | sort > $tmp_dir/file_list )
+ ( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
index 8e7ef00b087..eda73db6a4b 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
+           file://fix-reproducibility.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-- 
2.20.1


