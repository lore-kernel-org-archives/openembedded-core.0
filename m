Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id A2963791FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:21:38 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t22-v6so18737467lji.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6guDv1EaPY3CBNjhZPdrfR0prQIzJqCYLpOIEIyV7zs=;
	b=pcmc/ASBLqcTetYDt0DTNftA9BPVbWcxf94RAMHi1d7RXYYdQzlKYfNEOQAb99Ahar
	ZRGykXydeqoWoVO64PMwZceLo19MwufBTXyZDmk/e1bP4s+bzZaFjaFu9dsXsA8zjtYT
	CcEGJ+EWnFufex/N38yHvEK5E2qPY5yFtaTf6gFVwqBb2pPq8kzHQSsc5PNxWpQmYia2
	lxn4fmSN5qUc8bo6VA2xx0aPEzTJakIYrKFX/zXYIRHVp2J6Gre0UCgd7ayv7ue2dKt6
	2Ay1zkXSRoijkUm+1OoABqt5sW6cJPD+Ogp7W2mGQeWJ+Vt97T7fsl/HcItYL13zIe+e
	YiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6guDv1EaPY3CBNjhZPdrfR0prQIzJqCYLpOIEIyV7zs=;
	b=oWTjq1hXP92bKMwhVMA0At5JJcSLvus3lG95ly0pohGO2XbYZr84fpTgL3lZrSiTqh
	mfiq3JqAga/R4Ux6mr7MlID7CalijncLn64I+lRLuz30alhiFPpDQwKqVLFqWGjAtIH3
	nt0DMCHRnpZIJjOExWUT+U30xfNCV70rzxrn4hehd/0vMXLrz6fCchDgUPPFf/Vu6dHj
	9nOBTslcMUjnv5BQ9y662N9ULBBDxYFzcv2M6WMNhRwktZVJsWJq7nrOiptiBc2tJYEN
	hi8lW9WJyUdIn4QLQ/TwBzqiF3w/0U8KTNDw77fqpef/or9kY9ISpmKsidKj37UHOd84
	V7FQ==
X-Gm-Message-State: AGRZ1gKTf5kdiO9T8ArXpO9SCu0+hdTo9F6cJokVmkE+OUDDRTOZ+pne
	N/Xc+waY/bgHTbN5YNfN3UUbIKA9
X-Google-Smtp-Source: AJdET5dxfWlDJEDet8dZ9shxdd1GXcsRbBU0kx+pxXSfNLWGw0EX9ugYZ7ZC7t74+dYnti5Psq34uw==
X-Received: by 2002:a2e:83d7:: with SMTP id
	s23-v6mr1463870ljh.139.1541092899002; 
	Thu, 01 Nov 2018 10:21:39 -0700 (PDT)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	1-v6sm4651797ljc.46.2018.11.01.10.21.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Nov 2018 10:21:38 -0700 (PDT)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 19:21:10 +0200
Message-Id: <1541092870-5181-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] libgpg-error: Support build for native on ppc64/ppc64le hosts
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
X-List-Received-Date: Thu, 01 Nov 2018 17:21:38 -0000

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
 meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 2 ++
 1 file changed, 2 insertions(+)

v2:
  Make thinkgs explicit:
    ppc64   -> powerpc64-unknown-linux-gnu
    ppc64le -> powerpc64le-unknown-linux

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 4f3e3d8..7655106 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -48,6 +48,8 @@ do_compile_prepend() {
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
+	  ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
+	  ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
 	esac
 
-- 
2.7.4


