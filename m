Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32EC478882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 139so14039362wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kZjZ9KONEBlNdhOyr2g6flG+pBr9DRF/g/NxStxLsF8=;
	b=yyUh89jlCmkLGz0JhHH/SlfHZT2MdQnMA0L3FBMC7z5r71QbHzQeNu1Xwfebm4eQ5m
	8xTjVRil47k2IHE9V6fLorDluL90DR5VCcmM1ndtblV4XkYxkD+VZ68S5szYkR7/mObH
	73zXuYKy2Qd6IhypNkvNUqXvSUSqx45vTcln5HYQSpdfq5lVEyGPrDfs0ktdPunrSvj2
	J7NEGB2o9bWI5G62ZGyWpGVWsy9EeT9hIlgm4IEeX60nGqDPf/eclIxJ72VXhsyyEQpv
	VLZLihVAzHIg7IE8FbIigU9PCM8yhiKrYCe3SuDM7qRpWW3aLHyrpIRzjMYkD50q91Yp
	CWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kZjZ9KONEBlNdhOyr2g6flG+pBr9DRF/g/NxStxLsF8=;
	b=QOO3oMkapbc92RbEmADtAL2kiU2lgxdpfV2TqeJUGVjelZ70frJJuaflwMrARzf/Hl
	2LTXWto/yPimpfhEaf+Rh0099cidtTTyhmsrX69QtRiR1ZaKQBKEg/bZmrbR/MxHjoN5
	jDQbJveMzja2x/qanEpDI/okmwo5tSJ0IVfVjGYSzZwsmQslX1orIeWTcQvPv31md5tX
	RqwkVlBML7MvIw3BVkSAyoRy4VFvT/x5yHG5SLnWs/uvESaVPlQpsxf1kdXBEVNPYLZM
	F/aaGHMvaVbW7lGPm8B+lfLRFQ5Tz90DvsWpOjw+4TgQmY96XaRWiqH7GE/GrrOWmpzd
	YtBQ==
X-Gm-Message-State: APf1xPAP2oQK+p7gk0KqsueOvW9E/CRNumHrcu3UhqCSsKUUk8xM1M/M
	9uCaVUUtG8opsvOuCajAKP9Z1aJV
X-Google-Smtp-Source: AG47ELsJfAN+ixotcuotRISk6m9KI4DUn7tbudvIF/Z3hKS9ns91D6gC5Sa9YUlTqDUeAWkVvWXftA==
X-Received: by 10.28.7.209 with SMTP id 200mr2537509wmh.49.1519928808062;
	Thu, 01 Mar 2018 10:26:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:30 +0000
Message-Id: <20180301182634.20502-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 07/11] package-manager: add install_glob()
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e37dd4e8a2f..7a5796a3a57 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -371,6 +371,29 @@ class PackageManager(object, metaclass=ABCMeta):
         pass
 
     """
+    Install all packages that match a glob.
+    """
+    def install_glob(self, globs, sdk=False):
+        # TODO don't have sdk here but have a property on the superclass
+        # (and respect in install_complementary)
+        if sdk:
+            pkgdatadir = self.d.expand("${TMPDIR}/pkgdata/${SDK_SYS}")
+        else:
+            pkgdatadir = self.d.getVar("PKGDATA_DIR")
+
+        try:
+            bb.note("Installing globbed packages...")
+            cmd = ["oe-pkgdata-util", "-p", pkgdatadir, "list-pkgs", globs]
+            pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+            self.install(pkgs.split(), attempt_only=True)
+        except subprocess.CalledProcessError as e:
+            # Return code 1 means no packages matched
+            if e.returncode != 1:
+                bb.fatal("Could not compute globbed packages list. Command "
+                         "'%s' returned %d:\n%s" %
+                         (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+    """
     Install complementary packages based upon the list of currently installed
     packages e.g. locales, *-dev, *-dbg, etc. This will only attempt to install
     these packages, if they don't exist then no error will occur.  Note: every
-- 
2.11.0


