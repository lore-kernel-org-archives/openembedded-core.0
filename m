Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 231F7780FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:16:58 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id d127so93065967wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 04:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EndmnMq48xNPv1X/x1YuT8PMYCuw7Gao6DRLDI8Veis=;
	b=YRpXbvAxeyFGEjKtk7i7lpSuTGlEA6Xa17AHGFhZa17PNRHXlKuOeR4KXUn0X5Z3Sa
	fazQAKwcUI1SVIMXULDWNQeEI4qQdinB8FLdYH8/fztUkT0ijb492KADmep96Dk+3u0z
	ASVpcNpHnU2PEKpgyasf1BjSE01esgkaeMyQJhK2eQOCSWP1SJaRmsYpdny46QCeAc4v
	Duki12vIMKqpmIZJO/+Nu+LXCyeUuaHOTs6llJcN0U7hO0abqronWwEMqFPn0bnp+ARF
	XpZZ/6Ib4PV1Mf+UoXy+Qh9nI2seLTvNBdKqbKoXdikRTxgMtDxCBVL+copG/7n450cZ
	8oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EndmnMq48xNPv1X/x1YuT8PMYCuw7Gao6DRLDI8Veis=;
	b=n4wGDO/inDkhjt5Zt+ANtbnuNFbSTYUUp3N/op56oDtzmmA3SE/dNWIAJmBMtjyJsv
	nGkD24jBQn8Mo8gz9M4Wo8JhZigazbgR4lk4lw6q7bfQINQvcIJUrUiiDRmtOx1TPbXo
	KO/Uu2hVdrVRfNLlat0rjmnJ6UvhQkUyYyKwylZiPq93LwgeT5FIjTnVI87SAvL0a0ZF
	//J4mQMmB86f2OjT7FP2C52GhukP8yimYZjMVsUEvGAUm/v4mU9a+ylJ1azUidG2IsLn
	qm15WD0QeOYKlcECw3RIy/MX0c/5TUMYJhN5pInQB7UR6guMbi/PEp+NUHD/4BJg7ZSh
	NhgA==
X-Gm-Message-State: AODbwcCDslu9yoSiHaClZFMA7ehpQY21TGPYmh4wh/6gFXPb9BvNsIO2
	aOzERtiHwq99+XSM
X-Received: by 10.223.135.50 with SMTP id a47mr23489615wra.138.1495711018549; 
	Thu, 25 May 2017 04:16:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d74sm8544169wmi.3.2017.05.25.04.16.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 04:16:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 12:16:50 +0100
Message-Id: <1495711012-6397-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][morty 1/3] insane: remove broken unsafe-references-in-binaries test
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
X-List-Received-Date: Thu, 25 May 2017 11:16:59 -0000

This test aims to detect binaries in /bin which link to libraries in /usr/lib,
for the case where the user has /usr on a separate filesystem to /.

However it doesn't scan both image/ and the sysroot, so if a binary in /bin
links to a library in /usr/lib that was built by the same recipe then it will
error out.

This test isn't enabled by default, and because of this serious bug I suspect
nobody else is enabling it either.  As /usr being on a separate partition to /
is a very rare configuration these days I think we should delete the test: if
someone cares sufficiently they should write a test that actually works.

(From OE-Core rev: a6af5bbf3dad6f0951c67a0aae13ef86a8906893)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5ddb87b..e541c72 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -405,47 +405,6 @@ def package_qa_check_perm(path,name,d, elf, messages):
     """
     return
 
-QAPATHTEST[unsafe-references-in-binaries] = "package_qa_check_unsafe_references_in_binaries"
-def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages):
-    """
-    Ensure binaries in base_[bindir|sbindir|libdir] do not link to files under exec_prefix
-    """
-    if unsafe_references_skippable(path, name, d):
-        return
-
-    if elf:
-        import subprocess as sub
-        pn = d.getVar('PN', True)
-
-        exec_prefix = d.getVar('exec_prefix', True)
-        sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
-        sysroot_path_usr = sysroot_path + exec_prefix
-
-        try:
-            ldd_output = bb.process.Popen(["prelink-rtld", "--root", sysroot_path, path], stdout=sub.PIPE).stdout.read().decode("utf-8")
-        except bb.process.CmdError:
-            error_msg = pn + ": prelink-rtld aborted when processing %s" % path
-            package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-            return False
-
-        if sysroot_path_usr in ldd_output:
-            ldd_output = ldd_output.replace(sysroot_path, "")
-
-            pkgdest = d.getVar('PKGDEST', True)
-            packages = d.getVar('PACKAGES', True)
-
-            for package in packages.split():
-                short_path = path.replace('%s/%s' % (pkgdest, package), "", 1)
-                if (short_path != path):
-                    break
-
-            base_err = pn + ": %s, installed in the base_prefix, requires a shared library under exec_prefix (%s)" % (short_path, exec_prefix)
-            for line in ldd_output.split('\n'):
-                if exec_prefix in line:
-                    error_msg = "%s: %s" % (base_err, line.strip())
-                    package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-
-            return False
 
 QAPATHTEST[unsafe-references-in-scripts] = "package_qa_check_unsafe_references_in_scripts"
 def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
-- 
2.8.1


