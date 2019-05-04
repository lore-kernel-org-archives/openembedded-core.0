Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D55DE7DD8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d31so4211112pgl.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=er+9HWksaf0YkVR34kVTA+uA70+u2tjlv+YwyyIDwaQ=;
	b=MzoXYwyvk3hM/Bs8znHBGoe/VTp8ZToa3RZYvq4M2aq3UjlF3UtZLNr9bXNkAIpexo
	SW+nzSFeMPionG55JmyisZqye8R1tfXMCWMMzMvvtzi2uhlh1OWENbgJWlvISYK1VoXd
	28qjnuFlpH88+WmjJJGq4M2Pbp2ZSX93QJp4eXIQVavktm80GPzEM6TGQJFTFvNLCDmo
	PzBWfjOhuByBkr2VEJGarMUDsP49q7/6VROAO7EeIh+WhdFRPFFhylLoI2MUSHsIPowF
	Taux2mrha0rNF4WrQXjjYCR0ZSQ5iyTdcHACzdlNGpds7cRRx7P3dz9Om0UArCOvd5cg
	6d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=er+9HWksaf0YkVR34kVTA+uA70+u2tjlv+YwyyIDwaQ=;
	b=eDkdqoH1Fu2UXapFh400kGfKEodzzEpeLB49L4GogLbAyTD/fk4TjQQ6bsxQQZk4/Y
	1OFcvoU6lgeKs1ub0b17aq0SDloBfHBBnSIz7Ii034g0pK8IaamBzDrwv9u3e1uzYDql
	/vTZQWgex5qCxumt8pVppW8FkVwUEoEhjDVPxFi5o7wfm6FXvxkum/JjJZVcWh2kPsi9
	rl/QKPvbAS1xzIF1pya7g9tmB/I2nTj8Epk/o8ZPoyaiUH6xjWOltvqBHHr0CXFIVhse
	7tb8YaNGlTo16fBrz9LdhUSqlsQ0sKNyFL5QQWFzySklOB9r+9r9PCWLPJ4qFrORbddJ
	zjCQ==
X-Gm-Message-State: APjAAAWvoawOrh5lerMBwMfIFMIOjcK+Zw4XZ/QvS0dc3V9L/urcwkNp
	mgy1Fb0fFQyIqeI6oUT07L3YmvUs
X-Google-Smtp-Source: APXvYqy1DQ+L1rmMI5If3xPfJntaUaSXwvBgJxhfLJMLnW0lxAMMI+kbZtnCF1j7AZT1begjyRGkww==
X-Received: by 2002:aa7:8851:: with SMTP id k17mr19646545pfo.121.1556983671842;
	Sat, 04 May 2019 08:27:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:02 -0700
Message-Id: <499e830fad1c109f6c009d6ceb2256ced19e4452.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 26/43] kernel-module-split.bbclass: support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Sat, 04 May 2019 15:27:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jens Rehsack <sno@netbsd.org>

In case, kernel config enables compressed modules, support of
splitting via split_kernel_module_packages won't find any module.
So, first expand module pattern regex to recognize compressed
modules and then objcopy on temporary extacted to extract module
information.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e8d3eb5..221022b 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -44,9 +44,23 @@ python split_kernel_module_packages () {
     def extract_modinfo(file):
         import tempfile, subprocess
         tempfile.tempdir = d.getVar("WORKDIR")
+        compressed = re.match( r'.*\.([xg])z$', file)
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
-        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
+        if compressed:
+            tmpkofile = tmpfile + ".ko"
+            if compressed.group(1) == 'g':
+                cmd = "gunzip -dc %s > %s" % (file, tmpkofile)
+                subprocess.check_call(cmd, shell=True)
+            elif compressed.group(1) == 'x':
+                cmd = "xz -dc %s > %s" % (file, tmpkofile)
+                subprocess.check_call(cmd, shell=True)
+            else:
+                msg = "Cannot decompress '%s'" % file
+                raise msg
+            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", tmpkofile, tmpfile)
+        else:
+            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
         subprocess.check_call(cmd, shell=True)
         # errors='replace': Some old kernel versions contain invalid utf-8 characters in mod descriptions (like 0xf6, 'ö')
         f = open(tmpfile, errors='replace')
@@ -54,6 +68,8 @@ python split_kernel_module_packages () {
         f.close()
         os.close(tf[0])
         os.unlink(tmpfile)
+        if compressed:
+            os.unlink(tmpkofile)
         vals = {}
         for i in l:
             m = modinfoexp.match(i)
@@ -133,7 +149,7 @@ python split_kernel_module_packages () {
     kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
     kernel_version = d.getVar("KERNEL_VERSION")
 
-    module_regex = r'^(.*)\.k?o$'
+    module_regex = r'^(.*)\.k?o(?:\.[xg]z)?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
-- 
2.7.4


