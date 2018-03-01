Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 620E978882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:50 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v65so7572277wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=shR0+CEtgm2pzT7EklRLTDlo5Tvgt3/dJbsSYkaK7yg=;
	b=LoXnjPHdCOT4M56dhHBH5235nuZXwJ2tH8HRojNkd2qE9PYEEiiCCqhLWn1kfyaw75
	Zq+vMEpMnR6OCGi38lJN7LL06lneTqWHrew0Fiy4MLQ4tssT3tJoak231WlNOegFG4re
	weByzPg6LyQPDxCaGiQ2zMIWnUIK490poCZ1v7raJffWyyW8PqO0K6H2mo84FR+tgiKv
	K+MNOMhWPgFS9Z2lXG8ukioAdoqgP1eu931eUJWxypumi0k8+aFgFFek5nSvA7bFAb7j
	U2PEOpEXfGoF67aBpTXxORIxcZNgYDnzmr8u7NtFfSXaFp/Vg8OR8AKRAiOniNwidffB
	r38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=shR0+CEtgm2pzT7EklRLTDlo5Tvgt3/dJbsSYkaK7yg=;
	b=BO2S8Wc3kHF21ejbJW/cwSsH+4GCAvM/1BHTGuPzMLyeaWOcpi3EAoFQsGah1jXiRO
	wXfKIzrbk0i6s8LAVH0V0EVckzkGS6Lf/Drl4pB81R2mOdoDDC/irQ1PULvOhBW0socv
	rp3J0OcumNJRhahnF2nZVVg0WolTdTIOLqRAScKUYOt/kybuDk7R9/xG8pAtmHdFWl/+
	PRb9ug58RL2G5lT/s+Qx4x5X6Pi8qZLp2V+GQbzGir7jc23Lw1rTKi2B/D3RRWsjvIO4
	p7Zfif6DYIbyqWHN9vSIdp8VvkpdNNT2wXPsGAZEdEg87VZH1ENp9cTynemQTcnl4Mub
	71EQ==
X-Gm-Message-State: APf1xPDuN/TSGYNKQIt8MEfIROC+303yMHp79n3UKvPpa1Hz0S368PE1
	VxvPMR8x8c5ke/yuDYIQkqwzWm51
X-Google-Smtp-Source: AG47ELs9ofoX6JSirtC7vVeSPzSMj/jzU+lCIoDVPikVjplAlIQK+dBtaJQMWbXYi9ZJ24yr694LYQ==
X-Received: by 10.223.198.200 with SMTP id c8mr2598668wrh.14.1519928811006;
	Thu, 01 Mar 2018 10:26:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:33 +0000
Message-Id: <20180301182634.20502-10-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 10/11] sdk: generate locale archive and remove packages
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/sdk.py | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index aa6597a8495..76fe02c37b2 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -7,6 +7,51 @@ import shutil
 import glob
 import traceback
 
+def generate_locale_archive(d, rootfs):
+    # Pretty sure we don't need this for SDK archive generation but
+    # keeping it to be safe...
+    target_arch = d.getVar('SDK_ARCH')
+    locale_arch_options = { \
+        "arm": ["--uint32-align=4", "--little-endian"],
+        "armeb": ["--uint32-align=4", "--big-endian"],
+        "aarch64": ["--uint32-align=4", "--little-endian"],
+        "aarch64_be": ["--uint32-align=4", "--big-endian"],
+        "sh4": ["--uint32-align=4", "--big-endian"],
+        "powerpc": ["--uint32-align=4", "--big-endian"],
+        "powerpc64": ["--uint32-align=4", "--big-endian"],
+        "mips": ["--uint32-align=4", "--big-endian"],
+        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
+        "mips64": ["--uint32-align=4", "--big-endian"],
+        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
+        "mipsel": ["--uint32-align=4", "--little-endian"],
+        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
+        "mips64el": ["--uint32-align=4", "--little-endian"],
+        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
+        "i586": ["--uint32-align=4", "--little-endian"],
+        "i686": ["--uint32-align=4", "--little-endian"],
+        "x86_64": ["--uint32-align=4", "--little-endian"]
+    }
+    if target_arch in locale_arch_options:
+        arch_options = locale_arch_options[target_arch]
+    else:
+        bb.error("locale_arch_options not found for target_arch=" + target_arch)
+        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
+
+    localedir = oe.path.join(rootfs, d.getVar("libdir_nativesdk"), "locale")
+    # Need to set this so cross-localedef knows where the archive is
+    env = dict(os.environ)
+    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
+
+    for name in os.listdir(localedir):
+        path = os.path.join(localedir, name)
+        if os.path.isdir(path):
+            try:
+                cmd = ["cross-localedef", "--verbose"]
+                cmd += arch_options
+                cmd += ["--add-to-archive", path]
+                subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
+            except Exception as e:
+                bb.fatal("Cannot create locale archive: %s" % e.output)
 
 class Sdk(object, metaclass=ABCMeta):
     def __init__(self, d, manifest_dir):
@@ -87,11 +132,18 @@ class Sdk(object, metaclass=ABCMeta):
     def install_locales(self, pm):
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
+            import fnmatch
+            # Install the binary locales
             if linguas == "all":
-                pm.install_glob("nativesdk-locale-base-*.utf-8", sdk=True)
+                pm.install_glob("nativesdk-glibc-binary-localedata-*.utf-8", sdk=True)
             else:
                 for lang in linguas.split():
-                    pm.install("nativesdk-locale-base-%s.utf-8" % lang)
+                    pm.install("nativesdk-glibc-binary-localedata-%s.utf-8" % lang)
+            # Generate a locale archive of them
+            generate_locale_archive(self.d, oe.path.join(self.sdk_host_sysroot, self.sdk_native_path))
+            # And now delete the binary locales
+            pkgs = fnmatch.filter(pm.list_installed(), "nativesdk-glibc-binary-localedata-*.utf-8")
+            pm.remove(pkgs)
         else:
             # No linguas so do nothing
             pass
-- 
2.11.0


