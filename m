Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 83FC06FF91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 10:53:18 +0000 (UTC)
Received: by wmww144 with SMTP id w144so24499636wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2ks3ZW4ymPb6Nho+O/e5z3rNMZs09SJWY6j/n96kwv0=;
	b=HQrbzGMmHvGEAstDz2YphyprIo4z0X7XfHDfPX5Aa3iDLbrmHOQSKwksQKJHSK5rCK
	Ot0lzoebntTPDEZjuUnJ021Cpqgrv9v+bPUVB7vGj0G/QS5CyYyyVimKHObYWmhwrVsC
	jWNsCVNst/VnMOZ8s/HhPX4wW5e9+4v0U70L/QtkW2xZvYvHNXePySn0MCCYk1dRFPcV
	KLhCioVTg4A4SltivE/+MdfHdoV3toRGLAB3Gbx4DK/5KfLabyS+EBWzoRCWhcyREfQE
	EawPNrkm0PS1STjELiiiCUNaDxHW7/3KJ2yDNSvEy0+syV95cXJcNf73+pWzJpGxPhkq
	8CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2ks3ZW4ymPb6Nho+O/e5z3rNMZs09SJWY6j/n96kwv0=;
	b=aByahGMCLFfVQ6QMsZzq9lpu67Dm+lYFivA7Rrq5BInAm3iEuiKWP5U779OlZmRywQ
	RvZgl2z0rduLreWcf/iH37FHRVgdU1dCGR+Qlabu3V/O1dJwP/zyzpWkxKkPiWCLl7GD
	SWbYGIRLsqXd11xGd+HjOl8TEIvrYXLoI2YNMh4fP1TwTXkRCqRyabOgHGgTodTT4hHo
	QmAZAeDAp/kHT2FomEFNgJb6Vdgyg+ZcDzHh86ZshSf9mwENjPwsTlKIZndTx24klsjV
	q2QIj4Ja9Y182gDx84UESnBOxny1tw+mQ8rGWKmz5dYYOPeKYTf+6olob3A+PyAfz4IB
	7oYg==
X-Gm-Message-State: ALoCoQkesN87amN72UcKPWeUKK+IAQs1TI55IUfeUTjZWzINvE1l/CleiaDHz888X1PijOZtoUCMURkpsCIOnDpX43Gbg303hw==
X-Received: by 10.194.77.51 with SMTP id p19mr2478795wjw.159.1449571999076;
	Tue, 08 Dec 2015 02:53:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id lx4sm2444025wjb.5.2015.12.08.02.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 02:53:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 10:53:15 +0000
Message-Id: <1449571996-16060-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] insane: in libdir test allow libraries in libexecdir
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
X-List-Received-Date: Tue, 08 Dec 2015 10:53:19 -0000

From: Juro Bystricky <juro.bystricky@intel.com>

Some recipes, such as sudo and gcc, put libraries into libexecdir.  Allow this
in the sanity test so that we don't have to whitelist the libdir check.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2a1e30b..bf6a598 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -292,6 +292,7 @@ def package_qa_check_libdir(d):
     pkgdest = d.getVar('PKGDEST', True)
     base_libdir = d.getVar("base_libdir",True) + os.sep
     libdir = d.getVar("libdir", True) + os.sep
+    libexecdir = d.getVar("libexecdir", True) + os.sep
     exec_prefix = d.getVar("exec_prefix", True) + os.sep
 
     messages = []
@@ -322,7 +323,7 @@ def package_qa_check_libdir(d):
                     if base_libdir not in rel_path:
                         messages.append("%s: found library in wrong location: %s" % (package, rel_path))
                 if exec_re.match(rel_path):
-                    if libdir not in rel_path:
+                    if libdir not in rel_path and libexecdir not in rel_path:
                         messages.append("%s: found library in wrong location: %s" % (package, rel_path))
 
     if messages:
-- 
2.1.4


