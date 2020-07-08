Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4715.1594242487239518066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Axzap9vU;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjK3KPyz5b
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242485;
	bh=zernJ5UUoA9NCB0MzPymxOwriRk9s9lywjSkHX3MjPw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Axzap9vUY5nI4/9qXzdIv6XhLvbGET/NrUEUfx0/ByNeNecA9USOFRKYq1DqePwRY
	 DR6OO0VNLDrCqQEunhND2L4GeakTOYMA9MNqhsR+gIrZvmHehXaQarxsP6N6FGZp8c
	 FE4nqadi0JhxkyceADF1MrY2BNbGRfO2044C2AANFmveZ9a0QtRFfcsT3qDSvqmE8g
	 2WiI4RuE6zYRz6s4f+DjVpeWQJd/S6g1pGToKZDEjXYo0V7skPwV3ETCaurKEqEh1W
	 BwJntYWwzjvblE6wQYUEK174zrze5924BaFqivzG6NBlDlf35uuQRHtZMllNj6VX7T
	 PNFCytRSel/UOEhvCiJySgoqWrgTCTCLSJ/odhInS/z7ccmLBuas/VrA89iCaFEm/c
	 3gQryt97C4QzeXjJWW8YL6AOHw3wfyBNSYCBth/DaTUFB+qNxwc9RSBRaTJ21jN2tq
	 k/0+nPRf1osAUSYNXfWLO6VoWkVqzP4+qyBlfyHgBGBMkcMY8hCvq1LoQs8QI0CW12
	 w3+3To5j94hm9P14LR0/Z0NrS9F7Zj2Usyvco8PVAW+p+Cg9Ilb9tMtpTjE+zZjZjh
	 so5WSJyGbvo+GvVYGJ3odywURBYiipdB49O8NzoiNQVekMrvn5qngMCYxrt17tq3mj
	 9hFUgkJNvNB7wDj+W9cN2RVM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 05/19] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
Date: Thu,  9 Jul 2020 00:07:47 +0300
Message-Id: <20200708210801.5553-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Jan-Simon Moeller <dl9pf@gmx.de>

file-native when built on a Debian 10 host will embed a dependency to
'libbz2.so.1.0' (instead of 'libbz2.so.1'). This can cause issues
when sharing the sstate between hosts e.g.:

 recipe-sysroot-native/usr/lib/rpm/rpmdeps:
      error while loading shared libraries: libbz2.so.1.0: \
        cannot open shared object file: No such file or directory

To avoid this situation, let's add the bzip2-replacement-native to the
file recipe's DEPENDS_class-native .

Details in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13915 .

(From OE-Core rev: 5a2bc3bfa9e1a4f37b6e26a5c40a4a9c025d03f1)

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
(cherry picked from commit 4a996574464028bd5d57b90920d0887d1a81e9e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/file/file_5.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 60fc66131e..eb0f40b54d 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdda1b"
 
 DEPENDS = "zlib file-replacement-native"
-DEPENDS_class-native = "zlib-native"
+DEPENDS_class-native = "zlib-native bzip2-replacement-native"
 
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
-- 
2.17.1

