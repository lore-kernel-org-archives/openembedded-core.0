Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 75D1B79E96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 16:34:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j4-v6so18607622ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=s7AXUoOjtGaaG70ojmlzJkRnSEw1/41Dn2nVAKp0T8I=;
	b=tjSyzm7x2ZadtclDiY2q/0d8bcLUkhbYNKPlNB3eauWkmvXwHocW3JMPlwQb+ppi3W
	ATpTM/U10sgba/COx2IEdusPzaK15mF7GvmyrzA4aFDodqNoJUqYyuEkYmKL++KnRGFn
	2Qm+O/GsVGWrm2YJJcAttqIRVbqDSXXd6Kf01gnvVun30SDUECoF+hehX+5OFV86P044
	aw+Us2wKCAqovA24AndTrUD5Okh3x1p05OVzC6Q4Gvnu5FKHysoALj4mOVNMlBG3CJw9
	33mGMvP3BptIqvkM21lBL5Cz1LTcntEJzqfPdUiWkgHS3V/HgmUMgmnAycJgoyomr9AE
	2+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s7AXUoOjtGaaG70ojmlzJkRnSEw1/41Dn2nVAKp0T8I=;
	b=tCtTNo3gqoUjcDRJS+m1DvKPVSRtHlYTpDXaCr/mt9+08iZUAkxUDUxtPPEEa6mTv3
	mgJf4T98jq6faRbCpYzs7oeyXr4NLWDyjElSg2NbWQJ9hoAsDEkl8lDVN/6rLqvJEnyj
	5wc9UUoQRZpgh8uNmWmilkqeEG0oHcNCn9N3SZSyDY+vQQs0OYKC9UqO8l5SWrs++3W7
	8jZVgwBqMUuFvJveB5sEFAXzzSTPtkxox7/KNVFx5ZOWzEacaftbyjHAnFdYU6CdjrHM
	ZvSbJBce/hPcd+p6NOGivnS2X4g49Dcq89F4Cb9nIjT6d8YLIwDqVXW0kVvlPLnF2ria
	Y3hA==
X-Gm-Message-State: AGRZ1gJQsrM40GsM23MM5rkUPxmN5sbWRATPAqYsN7fK3RYCgRG3VLso
	DMdv+6wfg3osn/hTsg30oimmFi07
X-Google-Smtp-Source: AJdET5eyQAVsewkK/2q0gNeya0wnZSYQJVVxaZ3tNbs2oMGmg65FUIb8Bhsce6RNG4C8ELSdnmLtWA==
X-Received: by 2002:a2e:3e06:: with SMTP id
	l6-v6mr2204495lja.148.1541090085719; 
	Thu, 01 Nov 2018 09:34:45 -0700 (PDT)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	e4-v6sm4640129ljk.92.2018.11.01.09.34.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Nov 2018 09:34:44 -0700 (PDT)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 18:34:13 +0200
Message-Id: <1541090053-1643-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [[PATCH] libgpg-error: Support build for native on ppc64/ppc64le hosts
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
X-List-Received-Date: Thu, 01 Nov 2018 16:34:45 -0000

Both RHEL and SLES uses ppc64/ppc64le for powerpc 64 bit big/little
endian targets instead of powerpc64/powerpc64le in libgpg-error.

Also libgpg-error provides common target system names in form like
<arch>-unknown-linux-gnu.

Add mapping for ppc64/ppc64le targets to their libgpg-error equivalents
to fix native builds.

Cross build for arm64 tested on IBM Power 8 machine with RHEL7 for
ppc64le variant only, but should work for ppc64 as well.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 4f3e3d8..8fc95cc 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -48,6 +48,7 @@ do_compile_prepend() {
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
+	  ppc64*)     TUPLE=powerpc${TARGET_ARCH#ppc}-unknown-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
 	esac
 
-- 
2.7.4


