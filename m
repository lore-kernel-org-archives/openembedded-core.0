Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2734261330
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 18:51:58 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id l4so24593375ilj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L+ZMgVtmdFYF3RcZrmoojxkYwuPcgzYErY00VVcDAnA=;
	b=XLNSkiJjSfZcmMi8h6bhu9qp+bKS4dEvwMm4EICRZ7zfgrLrH7ACG3cBRcAES0EhHv
	BWjeRpcBuCc1mJwH6jB4BOI6hDGWTw9GSw6GCyugikrKemkw86Mv4MzQf8ixVrwDL1JS
	/id9lgKbmzTihVVJhT/t+HA/PGPQ7CqsFm7hcQzWdSrs9rj4iWkBw+yZ4ev7HcD4Gd7J
	4WFLTj8rEc5fxKtbVNrNGZORJmIG6JYDsVbnbIfJaxA+aUUYwGvHkux1sYL0WHiRYaFO
	8QxMh4mIvg38t6aLLhjJpuc4l8U1hWd7l94fUoMufGkOfKAhQzzI0hVCSGRnQyZev03J
	T4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L+ZMgVtmdFYF3RcZrmoojxkYwuPcgzYErY00VVcDAnA=;
	b=OdMX2YRRDv11T3j4Q7oejSpG0CupOuwJoZ8BVErbaVQtbwHJtLh3SKoUZdTXaqdIAo
	9nXM9F5dYwzM+NePFRVrda5zw9dTPm0dOGF/pwouSKcZeXNxI67g5tZRbjvKPghJn9NO
	OiUXiBy7ap8cUEtrasg+pkCmpbfd9H06lmFgYtF+rFxRcX3M/KygnXtUssjcr7JwT53K
	Exy8URwj8DBcvDDXgNotR/m18vFVnkrI2yC1XDuXQ20b4sd7r2llJn0KKTDKiIakq2wD
	5weRMtpOZGMn/888ekMPpuMHC1JahvWj05CvAYoE3FsNSGSwO/uPPd7W/NV4ctoF4WxK
	dyMw==
X-Gm-Message-State: APjAAAUlpuRw7Du16NfJrD5+tJTMqDECJms1IzO4BQFWWoQcZwPdHlnT
	4p4E7q13raQCvNc5RHUUoJ+7tlpj
X-Google-Smtp-Source: APXvYqxJ6cr3W4aEYid1aAXA6mSsXLPcX7D0/nXayvH98SNMeZIXIbUq3Tb3++rE53FaXJxTMPb/pw==
X-Received: by 2002:a92:afc5:: with SMTP id v66mr28690996ill.123.1582224718761;
	Thu, 20 Feb 2020 10:51:58 -0800 (PST)
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id a4sm52025ioa.20.2020.02.20.10.51.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 10:51:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 12:51:50 -0600
Message-Id: <20200220185150.23422-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/meson.bbclass: Explicitly mark functions as missing in MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 18:51:58 -0000

meson (with some help from GCC) misdetects certain builtin functions as
being present on MinGW, when in fact they are not. Fix it by explicitly
marking the functions as missing. This requires rearranging the
meson.cross file to put the [properties] section at the end so the
append works properly (meson can't handle duplicate sections).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/meson.bbclass | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b47..5c74658d01 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -96,14 +96,6 @@ readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
 llvm-config = 'llvm-config${LLVMVERSION}'
 
-[properties]
-needs_exe_wrapper = true
-c_args = ${@meson_array('CFLAGS', d)}
-c_link_args = ${@meson_array('LDFLAGS', d)}
-cpp_args = ${@meson_array('CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('LDFLAGS', d)}
-gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
-
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'
 cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
@@ -115,6 +107,23 @@ system = '${@meson_operating_system('TARGET_OS', d)}'
 cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
 cpu = '${TARGET_ARCH}'
 endian = '${@meson_endian('TARGET', d)}'
+
+[properties]
+needs_exe_wrapper = true
+c_args = ${@meson_array('CFLAGS', d)}
+c_link_args = ${@meson_array('LDFLAGS', d)}
+cpp_args = ${@meson_array('CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('LDFLAGS', d)}
+gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
+EOF
+}
+
+do_write_config_append_mingw32() {
+    # meson mis-detects the presence of several builtin functions in MinGW
+    # (see https://github.com/mesonbuild/meson/issues/3672).
+    # Explicitly mark these functions as missing in the cross file
+    cat >>${WORKDIR}/meson.cross <<EOF
+has_function_strndup = false
 EOF
 }
 
-- 
2.17.1


