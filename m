Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.997.1625954862805951952
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 15:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AvkxQhok;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k4so11727174wrc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejl3jgXkHPK5LW/7wUCr2B26D1HGWRc9cMNjNf/dbII=;
        b=AvkxQhokSIQa63K1sifMXQd0W0ODn3OjZhXMO8D7cDkhC++YiGdzDhCuMT9PDBjsp/
         LZG7xopBR6CG8fyGzS6qsPyMfIJaXjooBdzrfrQgROh8dfhhNkbN3zOzrWu2zq0XLWD1
         RI8P67IpQ35eikgMUQ38FsUDqaZoHNvFdBbXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejl3jgXkHPK5LW/7wUCr2B26D1HGWRc9cMNjNf/dbII=;
        b=hd5iv4+nE8kpvlu31BBawz80aeBBV9ZlS3XNWOqzx/JYvuxq4/WV3x4f9z6HYgw7bQ
         qfCg5fWjtkln39u7liP8VwpwCC52OQvBcZgqiwgZQnt4aISlgPjvGU8WgHlzCEtEtrcx
         /IEkzxBorsWpFPBXCqr90PeK+YGg+T228PcBOgve4Xvpkbqh4lQ09TVmyfgsg3Fwkxze
         +zuLvds6irVAGCvOZDoQ8Vebfak9JsbfiBGYeOZxBV30P+To8bse2Q0oyT1huffLQ7zI
         Ub+z7NQVGKDgaJfpueLzn5AtbTigix+315omOy6Kzi8fF5XoRrsX3QSwuP2kzCVUUk8Z
         Kayg==
X-Gm-Message-State: AOAM533Sn+1bcgIFhjworizdS/up/qd4Wmcu/qsfEeeDDzaVy1I9KDrX
	zoDeKCM4Hp+wHQLdOcki0k0B6XNd8XcvSg==
X-Google-Smtp-Source: ABdhPJwTPfDgS45D8GEZTipjlcmEBh461iG5cCnRDuyHwJbTwNGi+HnGIP6RRwmRUevrF+I8wGxxlA==
X-Received: by 2002:a5d:414b:: with SMTP id c11mr10232125wrq.162.1625954861182;
        Sat, 10 Jul 2021 15:07:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id t3sm5146334wmi.14.2021.07.10.15.07.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:07:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pseudo: Add uninative configuration sanity check
Date: Sat, 10 Jul 2021 23:07:38 +0100
Message-Id: <20210710220740.2793958-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building pseudo-native to work with uninative, we need to ensure the
configuration will work on all supported target systems. This means
"new clone" semantics, xattr and statvfs support in particular. It is
extremely unlikely we'd run on a system without any of these but add
a check just to be sure when uninative is enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 65d6e5068db..e6512bc6e68 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -112,6 +112,19 @@ do_compile_prepend_class-nativesdk () {
 	fi
 }
 
+do_compile_append_class-native () {
+	if [ '${@bb.data.inherits_class('uninative', d)}' = 'True' ]; then
+		for i in PSEUDO_PORT_UNIX_SYNCFS PSEUDO_PORT_UIDS_GENERIC PSEUDO_PORT_LINUX_NEWCLONE PSEUDO_PORT_LINUX_XATTR PSEUDO_PORT_LINUX_STATVFS; do
+			grep $i.1 ${S}/pseudo_ports.h
+			if [ $? != 0 ]; then
+				echo "$i not enabled in pseudo which is incompatible with uninative"
+				exit 1
+			fi
+		done
+	fi
+}
+
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
 }
-- 
2.30.2

