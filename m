Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.487.1587509726340933088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 15:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LAQuTVrq;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id t11so113910pgg.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f44eXSWgLFmeu4uaTRCKTHdXE7nfd/mNaKPk02EYOk=;
        b=LAQuTVrqAw4aqDvffVD4sw9lt0S1YfL5Dcl9Sr7gVGi6MJ0u2/BxjqcdYc2v0RnTRT
         AtrxAyqGkNryftfHV0u2C7/A49ZqZn+WsT8dutXnYx48pLGsbKVfyaLI5gKuA04w4s+J
         BUeZ82sEZjKdTgMzDHodwLdJYxQYF0aTJb/ePcOmyjvcIpo6oP5CaVn9lIvsILFFhMQA
         zyO4WokIQytZK1XrUdh5kLgfG570vsg1UG60rxnkodgxcc8GHCYLEdRfKvsJu9/Ob7F3
         3tZ8w0qMkJ9DFD3FlT1edUcnCv5/yX1O9gnXnxKCX0hIgJXTAOR3c7iAJPqShwuxwrSY
         KEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f44eXSWgLFmeu4uaTRCKTHdXE7nfd/mNaKPk02EYOk=;
        b=erd3D1F+IMdPtF+QArunE7JCVwp7b3fbGw1xgUZt+HdAIJnSXkBQ4YGgloXNFJfDYi
         z0PmzwHkc3JuNZHr/UJ9KOR4Xfs/nkGkQdNUNFKpi0Dk2kJ6sU6iIVcqZbtyqS+qwpCL
         6lI+3jhu6U1dteP4+UKwXe+6wjFoGoAoVpE+hENepfLcUPj4+efHg8u2NHfrST++U5Zp
         uImuAt3yPKXGGoXrJoNlchsXHUkhTIzYWThWjpXjNKnF0Xlad5gs6U4CGJPzZUGOjoGb
         dGiQ2l9t/vUmt225HUVG2qCt4UW2CoerNMaB6IS3gzJFYmCq+1vQ9WIjRF7WEHHPpQVN
         vsZg==
X-Gm-Message-State: AGi0Pub2ljPDhQbb1byLgsfchI2rzP3wuRI9MDtbnCo7gaN12qkZ7Znm
	ZQoQkjIxtHcxxrTUw3TnoJ1t9mjbxiI=
X-Google-Smtp-Source: APiQypKoEqBfI16zZBUnCvoNkA4P3RbBlEFDjsrcbwavbzM/4xnR0GnfYBEWU18uoz8hpwoImPPc/w==
X-Received: by 2002:a63:6b44:: with SMTP id g65mr4255812pgc.73.1587509725289;
        Tue, 21 Apr 2020 15:55:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d473])
        by smtp.gmail.com with ESMTPSA id o11sm3226458pgh.78.2020.04.21.15.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 15:55:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] go: Rely on go-runtime to provide needed modules
Date: Tue, 21 Apr 2020 15:55:21 -0700
Message-Id: <20200421225522.2026961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go compiler is including go/src/cmd modules in -dev package which is in
conflict with go-runtime-dev which provides exact same copy of this
module along with other runtime modules, as a result when both go-dev and
go-runtime-dev are included in image then it results in rootfs failures,
here lets make go depend on go-runtime and dont install the cmd module
here explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-target.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 316bf6f038..8e44247031 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -34,12 +34,12 @@ do_install() {
 		install -m 0755 $f ${D}${libdir}/go/bin/
 		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
 	done
+	rm -rf ${D}${libdir}/go/src
 }
 
 PACKAGES = "${PN} ${PN}-dev"
 FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
-FILES_${PN}-dev = "${libdir}/go"
-RDEPENDS_${PN}-dev = "perl bash"
+RDEPENDS_${PN} = "go-runtime"
 INSANE_SKIP_${PN} = "ldflags"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.26.2

