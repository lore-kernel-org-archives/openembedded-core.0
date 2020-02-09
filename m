Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4321A60CD4
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:09 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id j17so3101329pjz.3
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GhbQcd+dOfJEJ1oE9SFJz1YU4MWxRtY5Vq6mYE/WGl0=;
	b=rvmdPyfhPgfEwVkcoBeS0Wgu8OUFa0a62Y8FGMoD3BQvrcaI5e6tMZModIIBocxZqV
	dFqsKOz+wDmd2NUAxaBIF2YHJbajSNT3vZZ2r3stCUucXy+XI4kAA+ViC26VKJWcXGjk
	sx8nY4TIsfndjLQHjZjcmnCXjTjsIEzmq8lHrUyfE1J2d3D0FQxA030UF7iaUg9GLc8w
	Ceyy6WWVetsJhtL3dKkQ9jKybnhmTpK7KHUG1FovaQLTwqFQ/+Fd+TmrXySliIlUh2Lc
	6sANT7DxzqtfM+18oajZQZ5qhb4Llrah5oO79kSPS+ggYnClgosIdmMQf2uDsoTgqUjK
	bj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GhbQcd+dOfJEJ1oE9SFJz1YU4MWxRtY5Vq6mYE/WGl0=;
	b=ijJxU4+R3Uj/UIg5tLjQPxAGe31oHCSZqBXlSnn7ZcvCVmyp3HYR92DtwE2xYErR01
	ZihErlsgwlg8pKZDiu9bYgdk3AjRIWwne7Z45sD6kkRpUXiW6c6Wbu1lXKqZmy+q4BN7
	iJBQpdQvSLQxfzMvms955VPI2KcRMfrv7ENS18WQOZparuQcjxQ6hV8Sa+cdMADSskRN
	SYDpPPayRGe8MoYsRiPCBcBaacBUKp/MQQOCM3TBEtZXMI0YzeNDXNOfvuognQbBOAX8
	CH8WJemDBuM8vQv4PTAdT7ZBaKtBBlOcTj+adwHauMGayOGVxU0d/D3/v8gVLtWYKmmI
	V39g==
X-Gm-Message-State: APjAAAWTBQb6IKUs6E1seu+n7vORT+1NEue8KSLbzNe7CMWFeR0lxUkK
	xt2c2Qeua2onbca4lM3WyDUGJPW+
X-Google-Smtp-Source: APXvYqwxnb93Yzwc+HmW6ROWkTXPPLbgF4NdqyZYVdZszGBwGA7iidAHOLJCzaLuit7AP5ODN3Xvpg==
X-Received: by 2002:a17:902:462:: with SMTP id
	89mr8824431ple.270.1581264610195; 
	Sun, 09 Feb 2020 08:10:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:36 -0800
Message-Id: <7a222381df431a46dd0898c2b90a1d2dda2e0a43.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 08/29] opkg-utils: Fix reproducibility issues in opkg-build
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is a sorting problem with opkg-build where the ipk generated is depending
upon the order of files on disk. The reason is the --sort option to tar only
influences the orders of files tar reads, not those passed by the -T option.

Add in a sort call to resolve this issue. To ensure consistent sorting we
also need to force to a specific locale (C) else the results are still not
deterministic.

(From OE-Core rev: a9b8287984c63420e10329a69f7ac5125f1687f8)

(From OE-Core rev: b577a6d923042cfc04e67d470e0987488ea61412)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opkg-utils/fix-reproducibility.patch      | 32 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.2.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
new file mode 100644
index 0000000000..945979bc8a
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
index 6495726500..042eec7e0e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
+           file://fix-reproducibility.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-- 
2.17.1


