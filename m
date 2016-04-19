Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D8FD56FEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:22:21 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id e201so20280766wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=P8JTfg3lx+cPShkQxLnIXMmKsT4VWKByDIuPnnteuEY=;
	b=h1XmYbaed2IHbxD68RRgVK0sDbmH1XroF/orzmnFYsc7gslFQ1G0eNRy02bk64jp7i
	iObke59JvJ0h3FsfQZQfUTZFJWwJWD9My2zmgT3KfCmmlNo69vutFifDNMkm6a8VyCgS
	89e51YVkSxC+xsNLNRJoYVEJvA72DWJCIlTBqLZLLfV6ZGUDJmjm2bdiFh6IJxiwTh/a
	d5GzCQw7fnKdME7YNMI5PIw3BYJB3fXYm1O4fXsFZa5zI2uxj/9IuSOnbg7ZKDkZ7+dZ
	oSrrtBePR0awqYFpL5+ktFA+bGhSv5fwUp7fS1IOy7wooWTbTIJzrrQGH36/XDFZz8ou
	96Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P8JTfg3lx+cPShkQxLnIXMmKsT4VWKByDIuPnnteuEY=;
	b=U6NQNgDbZG4VakbTEpu01jqJaydWBBstKyKtsEqkPdV7DbWobvh1l2A2z4qrw/yyet
	nEZ2tk11vX2aCFSR3PkGNdivCw7czeXSW3PW8i5B70bhqFMkyvQnQloQVZXa/CiCxA04
	Z8/PGceopkqc+1LBcioi/rJ9tdIiwqaL46bJK/7RsQiyKGzpkaC4e2md/quHHNcxbj3m
	0VjXH5shW7hBDg59cCyX25wlK8ioycEnqwb/3NRmWwlmzFN5yryQxwJwrjfuJPjAMevz
	pAQgv/X5PL5Rn0DU/xl45xeqf+dw3EDlhRwhhAOwl/Irp5LIw1Jf/Y3WiUsm+56Y4ZNL
	Sd8A==
X-Gm-Message-State: AOPr4FXpnGOjZGjjjCSaZsCnkGPlSioWln3Oa0AAK5DNh+aHo/R+ixrDzYQaDPen195LzzAY
X-Received: by 10.194.3.20 with SMTP id 20mr4679485wjy.59.1461082941977;
	Tue, 19 Apr 2016 09:22:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm1046271wjb.20.2016.04.19.09.22.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 09:22:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 17:22:16 +0100
Message-Id: <1461082937-23752-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] boost: delete the build directory before rebuilding
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
X-List-Received-Date: Tue, 19 Apr 2016 16:22:22 -0000

If there is an existing build directory when do enter do_compile() then delete
it, as it contains the previous build.  If the rebuild was caused because
dependencies have changed we want to ensure that a rebuild actually happens.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 982446c..92c7bcb 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -169,6 +169,7 @@ addtask do_boostconfig after do_patch before do_configure
 
 do_compile() {
 	set -ex
+	rm -rf ${S}/${TARGET_SYS}
 	bjam ${BJAM_OPTS} --prefix=${prefix} \
 		--exec-prefix=${exec_prefix} \
 		--libdir=${libdir} \
-- 
2.8.0.rc3


