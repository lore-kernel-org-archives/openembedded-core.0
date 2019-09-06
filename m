Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 46EC67F2EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 10:22:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t17so5917873wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lvCbOSFjAScv3CjyvW5kdqFfVo4Kbjd9aReNQGTkpNQ=;
	b=CRS/xvoELKUN28XA6LdRk/oMuYRuN5u277LUB197k8hhSYWj+ErZLlSaJVINQGqbY7
	pUgGH6Fl9cXKY3VvJeLKeTt5QpmDKk41iidk2w7HcDq01uq6CcO2z+5yxlHBMqUCr/Iy
	FMzcAmMfNieEQ5JrB5xZKSQ0tgk4zrQ0yeULbjUtXK+ZBJY4BkDrsXKLyHryHb0VpGQP
	e7h20YXDyLVYaHhuRcR8A4m5Qne7xtEqBOYovnh19A+ZY+mHMCuYTqg4IU8vOw0SY1l9
	RrnsrBpQrDqDJb9neNsDGiA77Vz0yVWvK5NssR4fKdaZPYspb8IpWtcLWOBsv+XSKdOG
	/hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lvCbOSFjAScv3CjyvW5kdqFfVo4Kbjd9aReNQGTkpNQ=;
	b=QhY7GsjEGUiCyfPo73HkzqblF1SdVo0YSm6J+cDaoGy0XAtqyPgUfq6BAgecJ1GjlU
	RElc3UxRMZ4jRRfP+/1NqgxKqTvCUi29/NsCNIe/56QuIUPyUoEaHahalppReCXIKMWr
	mPccmZEP9CcpSk5CmYQBtztXo0UC6pCSfu/6dSpNwFImF2YmZNvg/WZyTOLKU6HmiWxV
	WU1s3x2LRAAJyDu12Pzeb/n1dbsUSATsrs3Uk5vRRia3MIazO92ej00lBqI5lyF47XY6
	bODRX5dtZwr9376QVA5q0zzoGqrm//qI+QBHuV4Pr8kksT75I38mFewQ3eBhCdYAgZao
	jUJA==
X-Gm-Message-State: APjAAAUW+4v6HOuSlBua6TxbTg1boyAl0Sd+qYz2qzJZff8M2ENEbCaN
	IIvg7yx8uv7IeG1I/UDqIb+6nssk
X-Google-Smtp-Source: APXvYqyqUKyj/rdXU0UwXsOCmB5Ob/S804p7XxgRoFABV/+Xopql+AdAeXEk//hIlrtas4A7r24m1Q==
X-Received: by 2002:a05:600c:228a:: with SMTP id
	10mr7002291wmf.62.1567765335726; 
	Fri, 06 Sep 2019 03:22:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h2sm8328144wrb.31.2019.09.06.03.22.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 03:22:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 12:22:09 +0200
Message-Id: <20190906102209.74968-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Fri, 06 Sep 2019 10:22:15 -0000

PRIVATE_LIBS is used to exclude 'private' libraries from getting added to
automatic runtime dependency resolution. This variable currently has to list
all libraries by name, which becomes a maintenance issue if the list
of such libraries frequently changes, or is very large.

This change allows using shell-style wildcards in the variable, similar
to how FILES lists what gets packaged.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/package.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 114d6559f5e..aa8451ffe8b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1646,7 +1646,8 @@ python package_do_shlibs() {
                 prov = (this_soname, ldir, pkgver)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or this_soname not in private_libs:
+                    import fnmatch
+                    if not private_libs or len([i for i in private_libs if fnmatch.fnmatch(this_soname, i)]) == 0:
                         sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
@@ -1829,7 +1830,8 @@ python package_do_shlibs() {
             # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
             # but skipping it is still better alternative than providing own
             # version and then adding runtime dependency for the same system library
-            if private_libs and n[0] in private_libs:
+            import fnmatch
+            if private_libs and len([i for i in private_libs if fnmatch.fnmatch(n[0], i)]) > 0:
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
-- 
2.17.1


