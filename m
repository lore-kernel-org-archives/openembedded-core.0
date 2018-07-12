Return-Path: <ross.burton@intel.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 24FC9754DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 13:45:53 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id x5-v6so18263545edr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uyg5aYO1p8kB0heOKL2nMrKBDDEGHhcXETkM9zkZM9k=;
	b=natiz67J2JiXFnFhlns7+fT0VSYSu58Q5nAZwCmd+TDnSzp6H3g3Iu0KcuOY4dOpKx
	s6GaKtVlbMcx8YFl+dTu8USEWJaljhdQapH81pdR/roncSY4FWWBDzZLRz+oT181Tx4R
	A03KuoEB7TDXt1c7GQZr43KHnU1Rom5dacEGhVyHrpLNERZiGwNI9rmRPExE/jPAV67x
	OOvJw7AqO6LeilhiS2u3oxvOZHbQmYK/15haPngRSYJZKcOsW5M9krlx559NNkb/gFnE
	gntvJQj5xREda2UTDq1ugdsBKgK4IJ3WeyIQ2lbJ0Ni6qHKOviatW7TnmpEpSMrDWlj4
	pzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uyg5aYO1p8kB0heOKL2nMrKBDDEGHhcXETkM9zkZM9k=;
	b=J698ZXJFAcqLnzyeFZK3aFKt9Fj4x25VBCpbHKLn+42QTcEUKaVdcyAPTr3xAV9Fyf
	0XZ8eSf9vCP9HvQ6zJDmM21h3W27rlKDjKPv3AMWabQKmHA20xakYMxxgi/skYqDULki
	bSw+H5erNY1cK+3+MeW+bXqV7+oCqT92tuGOPTNTZJH4Ye7YsFVReg0ZOcdmg3EiZrxB
	oovV2yfEFW3bSymv7m9HM4nl/0Hwv9eAAhuEV9c/CdwENNA5OL+V3Kn/C27VLxj2jtu7
	DRvYPSrkK9qzo8pam1pNAacOifDfD8tdsLfajDq7SlwHfPkijeAyrK3tLzD/lWJtiUja
	KZdg==
X-Gm-Message-State: AOUpUlHQ0Wj81eWnrxFD9uu16taysD3Gny1TJD0jCzVL3Ni2231FWkgi
	AfBECsRPtdr96mUmOmrAoqySBC/Q
X-Google-Smtp-Source: AAOMgpd6b5kr0TD4Q+8OQ25RurS8vSHPcg0MmsijqU+3AIYGzcCPpjkUNVc6vuzk1pBG3VVNGJlKTA==
X-Received: by 2002:a50:b5e6:: with SMTP id
	a93-v6mr2644062ede.94.1531403153519; 
	Thu, 12 Jul 2018 06:45:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d18-v6sm8985842eds.40.2018.07.12.06.45.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 06:45:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2018 14:45:51 +0100
Message-Id: <20180712134551.27635-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: optimise buildpath search
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
X-List-Received-Date: Thu, 12 Jul 2018 13:45:53 -0000

Instead of decoding every file we open as UTF-8 (with many errors as machine
code isn't UTF-8), convert the build path to the UTF-8 byte representation and
search for that instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 713b40eac42..469d5c4cd51 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -535,9 +535,9 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
         return
 
-    tmpdir = d.getVar('TMPDIR')
+    tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
     with open(path, 'rb') as f:
-        file_content = f.read().decode('utf-8', errors='ignore')
+        file_content = f.read()
         if tmpdir in file_content:
             package_qa_add_message(messages, "buildpaths", "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
-- 
2.11.0


