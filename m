Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 874CC60CB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:19:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so636495wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j987LqWEVC14+Mc+ZRv3Rp4mF6qRumXrn4Qh3cpLthY=;
	b=NXC9HPYLK2iR3WiP66u4ylomucCJbEWDmEHrZiFYia5sL8U/uPlMlRrFp1YbVOuzTT
	0UXCLPHR1hVDGlR6/ZmHDs2LcUt4fABVWwxt24yMs2FVmHt6gFV+JOMcz3r+GgVuydsg
	QHSRH+xxGbME4+urZCZh9QOK9opQ3yjaSgfAWbKbLytJWtkg+p2LuAtgsIefoT6b6Ytc
	hkNeCtnGAl9J93WxfaFXwFxF1Jxxlemu4owz6G2nSCkhJiQ4gcJXdILcG9+40yQpSo/i
	wQak5J63M/RR65WSPIaOBJTRpUKNoYCziWoQ1PwAN2cMQizo4wGP4wVl+Kw1qGpZN6Ld
	rR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j987LqWEVC14+Mc+ZRv3Rp4mF6qRumXrn4Qh3cpLthY=;
	b=XQx3zJdhXj4lSNQEe2PYmfN8O5sZml2GRiaiN9DsAiTz8wEr9cwSgIC3+vgI/BaE4e
	SLLHmF0iaNc0CXjb7rVEoXz6YjuGjQ1R1udWOB4z4w7F0FYYs7MDS/LRmMokP1ZoG7G/
	wTemwGuc/pdFhWwLP9pFxDiDZdSP6ssVZatWaL0bf0QDhd0J9nTC4mZYsZlKNJk5z2Tf
	KPYHuGbl1Fq3GxKwV77pxGW7ufcxv0hjku7b1mh08J68Ao/rtTswLWhXRg/TlpJugPRI
	WuyLSB2BEvsDXnjXoX+LpkNV4GzHuWCysp6odeCPZdFb1cInYzjzPEaraHRyC7L4UarW
	peFA==
X-Gm-Message-State: ANhLgQ1gweCpnrxnKF7XiGjjqcn7NYEMDYhS7zZOhaaJI0Hb6EWRPuaI
	5gHDRaCtDJUhlBOaZ8QlZPAwtev7
X-Google-Smtp-Source: ADFU+vscRtgthu6dPCSaS+MRt0b7+heCLWdUwO5MlPGuhvJerfzSztZO1V3UJuOU3YE/5hvHaI60wQ==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr5203495wmi.37.1584645557675; 
	Thu, 19 Mar 2020 12:19:17 -0700 (PDT)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	d124sm218204wmd.37.2020.03.19.12.19.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 12:19:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 20:19:13 +0100
Message-Id: <20200319191913.13388-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ross Burton <ross.burton@intel.com>
Subject: [zeus][PATCH] sanity: check for more bits of Python
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
X-List-Received-Date: Thu, 19 Mar 2020 19:19:19 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

MJ: icu in master doesn't need distutils anymore, because icu 65.1 currently in
dunfell/master doesn't depend on python3-distutils anymore since:
https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be8ef536bb1

but the icu-64.2 in zeus and openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb
still need python3-distutils as described in:
http://lists.openembedded.org/pipermail/openembedded-core/2020-March/293984.html

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 936fe913b4..5c2f8f9d75 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -625,13 +625,14 @@ def check_sanity_version_change(status, d):
     # In other words, these tests run once in a given build directory and then 
     # never again until the sanity version or host distrubution id/version changes.
 
-    # Check the python install is complete. glib-2.0-natives requries
-    # xml.parsers.expat
+    # Check the python install is complete. Examples that are often removed in
+    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
+    # requires distutils.sysconfig.
     try:
         import xml.parsers.expat
-    except ImportError:
-        status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
-    import stat
+        import distutils.sysconfig
+    except ImportError as e:
+        status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
     status.addresult(check_make_version(d))
     status.addresult(check_patch_version(d))
@@ -667,6 +668,7 @@ def check_sanity_version_change(status, d):
         status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
+    import stat
     tmpdir = d.getVar('TMPDIR')
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
     tmpdirmode = os.stat(tmpdir).st_mode
-- 
2.20.1


