Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FF0C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:07:54 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1789682873200990348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q9DtB+T5;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso866645e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682871; x=1790287671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w8mCTDQIkb5Tu25Elw1GbAxfMnSsKJTMce7Unioq8uo=;
        b=Q9DtB+T5OJ5Nnt80i2V+4Rgiv7Pxsk1s5fQYluNyP9aCsrJAgBJkzddlbaPmm27SLD
         EnqXggsNUiTX2yA/UxgXg04tIigk6DNG35CJRCV+MvyVsL3uIH0ZE9meGfd22NAwd44w
         QV6XbhIlqrsykXDCP2iYAHcBChk1a7Dwk1L2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682871; x=1790287671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w8mCTDQIkb5Tu25Elw1GbAxfMnSsKJTMce7Unioq8uo=;
        b=hzNghjOsvtsCQ2Vgm1c+YXuqkE2OCrO1ddx6WIkspy++9Lx0OCer4310+MafcOzoZZ
         5ctjclwUPcd2e/eHjYhKrM2o5buoKXYma4obHrOxT77RgmNJeWvjcxJWI7FCyZPBQHa2
         pU2OfhpvBVGit1uE04a0paSs/M8t6AS3rMvTDDVMyIo2/DS5xLq9CYtVmxMQzc2DDe4K
         n03hK5RZ2Dlpq4pxRGlT2JlvJlNY/1P2dwalC+UcopdD5lfIVxrlKfABDgN0kZLro4GA
         VH8y2JINlj1kqC6b5Q8Qy4kkjjVZq+plUsAEwZbeIehpTqb3YrG/fv0nj6cLhJHzi/KV
         u/+g==
X-Gm-Message-State: AFuF++nRNydA5a1/HAy8580hWgJyKJQ92OEg7eAo5otnDxc4fVgMeiyr
	YcOqMXCttXIAXDqe8JrmgG42X2T3DCLRlgO1gW/dfzC7PwrjV9xuHQ76qquzu9SqNnlDJ1MCNHR
	S4OZouek=
X-Gm-Gg: AYBFou3bIb+uO8mI+CkMWSqB6lB9KPWoF4GKSbzciJPxkYHhfT7XPnp2NORUT78QV7L
	3+/SAmoSrpSxL4dEqvVE2MzNwPsXnCd55RVxPwGMbywsMr29Ll1LhqqrZI92ynWCy7wO1H8+O2k
	S7RUmYsK6TFjnjhc38Tl9ZqITbj0grPD5K8kw6noapYCNMxMJV9cVxzhzRs8TIutOLYY1jS5Nql
	TaSPQtg1Dcs8X80ClVAOIUVsI7TolKL3VdAHMqjWkfENC3fBRJXrKIcHpw3n4IRr9gDcsyjCQ4d
	J0GsFStCfZ49iov8RGGn1xm3R3Gv55hhtDz7RTgzMrIXj2pLlN7OzfPIp8niCE04500uyQ3/8TM
	eDc+4n1LccTcnNDdunr+Jt4sM1B3ebig6Iwn3vmLpgQ3+rOJxgmjUbSurhJEHaeHQZ8P//l3X+R
	41phUI05lMpX+I8qMgEzVwdz/GD8EbhAW1BNW0MUPLsPOj0idXI7bBLj6TYVQofpAfH60xAqa/Z
	WsDNMOu+VyZAFav9rp3TQZT3uAGpopQwlhYvQkRZawD81x2tFgW8XiAA6qVJamTSWTIIAs0qr8=
X-Received: by 2002:a05:600c:8b03:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fc566e609mr3143925e9.3.1789682871415;
        Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/79] cmake-native: use bundled nghttp2 with bundled curl
Date: Fri, 18 Sep 2026 00:05:49 +0200
Message-ID: <8553003ffbed5f3f16d10373dae9672db9bfa417.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246098

From: Himanshu Jadon <hjadon@cisco.com>

cmake.inc enables system library lookup through
CMAKE_USE_SYSTEM_LIBRARIES=1. cmake-native already keeps curl bundled,
but it did not also disable system nghttp2 lookup. With CMake 4.3.1,
the bundled cmcurl configure can enable nghttp2 when headers are found
on the host. The later compile uses only the OE native sysroot, so the
build can fail with:

  fatal error: nghttp2/nghttp2.h: No such file or directory

Disable system nghttp2 lookup for cmake-native also. This keeps it
consistent with the existing bundled curl setting instead of adding a
new native dependency because the host happened to expose nghttp2
during configure.

Add the bundled cmnghttp2 license checksum because the native build now
uses that copy explicitly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
Backport note:
CMake 4.3.1 used by Wrynose has the same behavior: with
CMAKE_USE_SYSTEM_LIBRARIES=1 and system curl disabled,
CMAKE_USE_SYSTEM_NGHTTP2 defaults to ON. If the host provides nghttp2,
configure records the host include and library paths, while do_compile
uses only the OE native sysroot. Therefore this setting is needed for
Wrynose as well.
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
index a859cef1517..911155773cc 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
     file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
+    file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
@@ -34,6 +35,7 @@ EXTRA_OECMAKE += "\
     -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_NGHTTP2=0 \
 "
 
 # Ensure e2fsprogs isn't found on the host to remove a build dependency and reproducible builds.

