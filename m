Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5627361219
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 12:59:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a141so1775384wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 04:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rpWgyJqMzwiJtV96VnBWMHAw2DFLmaUOKYfgIHWjkVs=;
	b=DTUMhc2RTZ28+B7NKB18c5zLUCTEAf2sfUJpIL97QKMTB0FbB/2UfA9M1B4DGsO4H+
	x5fCTx1g1DrSnfXM67fxzMq2WFUOFkYzw6bh3/d8wDjB3sc5J3LzVm9YM9xtSgZgPqEf
	Nnoj98TXVV3Op/3YyfzxlvmGhcMkE+QckIn9dEkiyZ0bcpTeYPakYoxlmOpXZSwD7pSl
	7yaL3ESQx+0PVLWycEuEbnlnS3fFpbL+HCT7PQ40wuH+t8LbIIItMq35jsXGe3kQ6bNd
	I5+cZK7+7ZwhIvcEdzr/Gb794LxrqEMHM3E+p9bxT87QxgdBSsrr32llFu2MV6rTkNf0
	pPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rpWgyJqMzwiJtV96VnBWMHAw2DFLmaUOKYfgIHWjkVs=;
	b=gmwvbF0s6+iNImEtgwBycA7B94JzkNBhOX29KeXvjHSuW8AqXaHAd5f4v7Cr9Bb/uN
	jGoMKf3hd2UitGV7+hQIujcotVb4B2L5YaU3RJYTsOSfpv774jl9vER29f/Vys4uU0pX
	qERK3qHqtLz2Nu+nvsQQehjClMikcYAJZCmYgWbLqiPHSl8QnQYraU9yAi/ahrS7Km4K
	8Bysy6Eman0lShCASUamGWdfeENHiXaUHeAN3WQUnOhNwxBMYrO7I7Ui91X9fOfaV0Zc
	+j8VOlOaCvqTfmchJjLwZqATHYaJq7PMVyO8fSSAM2VPiFx9wWJ+Iqb1zPhsUVc4hOT6
	G38g==
X-Gm-Message-State: ANhLgQ3y+iBEOXkQYaWHQq5NGZog+XJ3SHs23nwq1ix6VIy/LyPf4Ewl
	nM/KRhffBJ3kfJoN4r8Iy3RWdZnn
X-Google-Smtp-Source: ADFU+vv/1ECLxvoMBUh9asMsaLNesBbJeo/oS/Omy//2ywqsuoeJ4NUfRJ4lSn3MIkhLl8F65RrRzA==
X-Received: by 2002:a05:600c:20e:: with SMTP id
	14mr3510178wmi.108.1583326748628; 
	Wed, 04 Mar 2020 04:59:08 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	e1sm25761506wrx.90.2020.03.04.04.59.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 04:59:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 13:58:43 +0100
Message-Id: <20200304125843.917-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] libmodule-build-perl: make it reproducible
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
X-List-Received-Date: Wed, 04 Mar 2020 12:59:08 -0000
Content-Transfer-Encoding: 8bit

Particularly, delete html docs as they have sysroot
paths in them, and adjust build configuration to not
refer to host paths either.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../perl/libmodule-build-perl_0.4231.bb           | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index b1967c7b03..a6fd7b1c07 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -33,13 +33,26 @@ do_patch_module_build () {
 
 do_patch[postfuncs] += "do_patch_module_build"
 
+EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
+
+do_install_append () {
+        rm -rf ${D}${docdir}/perl/html
+}
+
 do_install_ptest() {
 	cp -r ${B}/inc ${D}${PTEST_PATH}
 	cp -r ${B}/blib ${D}${PTEST_PATH}
 	cp -r ${B}/_build ${D}${PTEST_PATH}
 	cp -r ${B}/lib ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
-	sed -i -e "s,'perl' => .*,'perl' => '/usr/bin/perl'\,,g" ${D}${PTEST_PATH}/_build/build_params
+	sed -i -e "s,'perl' => .*,'perl' => '/usr/bin/perl'\,,g" \
+               -e "s,${STAGING_BINDIR_NATIVE}/perl-native/\.\.,${bindir}/,g" \
+               -e "s,${S},,g" \
+               -e "s,${D},,g" \
+               ${D}${PTEST_PATH}/_build/build_params \
+               ${D}${PTEST_PATH}/_build/runtime_params
+        rm -rf ${D}${PTEST_PATH}/blib/libhtml/site/lib/Module/
+        rm -rf ${D}${PTEST_PATH}/_build/magicnum
 }
 
 RDEPENDS_${PN} += " \
-- 
2.25.1


