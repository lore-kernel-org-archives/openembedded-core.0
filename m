Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id E640C79069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 11:50:49 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id e18-v6so2438175wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 04:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BEh9Ohx7A87BCDci8gX/n1MyEnj6jJFAe1kpQuXhHPU=;
	b=xZeLPrvUoW+S/znbQZxu2azR73c6t2SVvXaJ4tIenL7OQuwXri+hwWrFaOYkZhBiLL
	57svQWDdrnE5/kwfUgvVcbd6K8xomwwp0yS0Cewf8qK0eYRc7b7FyKpDhg5oHr1Xm1iB
	25FvFmkwkEPswuHllbklNIZG7yWGDtZd+ClOcx9S9vyyeaTVkpt+Wz20+nTPH9vrBUxB
	SwedFm1Y5rZ5XSOfN2o56j2rTh5MS9M7rNQO01HwgmNPw1Q/dr3wzPybdojviyZlzj/0
	8k7CnrOaER1UTZa9koOjhDAcDMq0c1pY9QI+uoMBYC/jyk8msyWKyUsBxp/T5Kk5idqD
	KQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BEh9Ohx7A87BCDci8gX/n1MyEnj6jJFAe1kpQuXhHPU=;
	b=Q3lF6OLGeXa/erZBKE9ixfFLvG0agMglK6lQLawQieQIT5da1WJo913pT/alN/rW8y
	Tfb9IRwb+RO7EST7IRiGB+S4M7UwIHfpl3aMGYGXvga5jMLP/maNR3BoTyJNvL6ZD2Er
	uWcong0k5JAQAO06vchPsWc2oc+W4sUrB2Z0SupsalJ+UWXKl3wlMj6xS7jLxPa8kmr4
	LdDBFSO7JEcq/zMqNoit8AH8f0PvZi6H850xXDxnBSp2cErP7KnWGxF6g5EALxwc65Cb
	DUR15AKcsU6HvMpKP0fb4TDUCS/t38nSIJ4y6Auwh+xBqExWQ1fin62XnC2tPEdVsv+7
	wSLg==
X-Gm-Message-State: APt69E1Our3f7JUAqnvN3snE1AYisUYfOWq1P9lbrjMDV8Z0EHiiXyFo
	hj0DSfSSWrj4REGLMJgC/qWA61eG
X-Google-Smtp-Source: ADUXVKK2Aqy1EVYo83KIVakr287QLEikb+cdoIdty9kDqI5mGsW6lIIpoUuxP0N91TwSujZJ8yGILQ==
X-Received: by 2002:a5d:4843:: with SMTP id n3-v6mr3795584wrs.24.1528890650197;
	Wed, 13 Jun 2018 04:50:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h11-v6sm2214105wrs.85.2018.06.13.04.50.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 04:50:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 12:50:45 +0100
Message-Id: <20180613115045.28339-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: only use lists of commands in cross file if required
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
X-List-Received-Date: Wed, 13 Jun 2018 11:50:50 -0000

There's a bug in Meson[1] where it find_program("foo") will fail if foo is
defined in the cross file as a list.

This is causing the Meson build of libdrm to fail, but for this instance we can
work around the problem by only using lists in the cross file if there are
arguments, and just using a string if there are not.

[1] https://github.com/mesonbuild/meson/issues/3737

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 5881765abba..e572344bd20 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -42,7 +42,8 @@ MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
 def meson_array(var, d):
-    return "', '".join(d.getVar(var).split()).join(("'", "'"))
+    items = d.getVar(var).split()
+    return repr(items[0] if len(items) == 1 else items)
 
 addtask write_config before do_configure
 do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
@@ -50,21 +51,21 @@ do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
-c = [${@meson_array('CC', d)}]
-cpp = [${@meson_array('CXX', d)}]
-ar = [${@meson_array('AR', d)}]
-nm = [${@meson_array('NM', d)}]
-ld = [${@meson_array('LD', d)}]
-strip = [${@meson_array('STRIP', d)}]
-readelf = [${@meson_array('READELF', d)}]
+c = ${@meson_array('CC', d)}
+cpp = ${@meson_array('CXX', d)}
+ar = ${@meson_array('AR', d)}
+nm = ${@meson_array('NM', d)}
+ld = ${@meson_array('LD', d)}
+strip = ${@meson_array('STRIP', d)}
+readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
 
 [properties]
 needs_exe_wrapper = true
-c_args = [${@meson_array('MESON_C_ARGS', d)}]
-c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
-cpp_args = [${@meson_array('MESON_CPP_ARGS', d)}]
-cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
+c_args = ${@meson_array('MESON_C_ARGS', d)}
+c_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
+cpp_args = ${@meson_array('MESON_CPP_ARGS', d)}
+cpp_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
-- 
2.11.0


