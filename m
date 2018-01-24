Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 042DC78674
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 20:39:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c2so13783659qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=58bvZlegQhd6E67cSzWSSr3OmqQy1q7lMtuXbaSnJF0=;
	b=laHVJ5uLG04dET16aqrAsKos3ChDlkm8c4vYQlD/emqK0lWmLYNARs29xpgucB78S+
	tDQ7KoPTAMlQbpw0i7e9fzdWVNnNYtwYxm8p2coi3RwCWFNkq+gkcB3DhdcwuGf5k61X
	Ri+DE4sWbtuRbRo3TQvRXFlsdvQPMVPJRXLNsRz6IxZYpmwCthAyWnpbQYsApFkVeti/
	D33Obstn6bjWXaH66df8FNqLvPkqlhBbBvUK4pghy5w+Gxdk0Fil4M0Zn9Hqg7avyVR4
	HCgAPZWHcSz+pjYoKEOgpZAv0tfxlKdVbIOLXaGPxmIMZzkD/DEgH/TaAGojfjQKiB0N
	r+Fg==
X-Gm-Message-State: AKwxytfklQUpeBJa6NBXcYMcM5EfMs0C9oevWXANIk8x+0HOW8mQpX/Z
	RxBSsRVO/ib8PfKyayqv28Yk5Q==
X-Google-Smtp-Source: AH8x226+dzExBJuSDajc9ad11Mk52ebdj/thZrOW3mMZJhOO5szzxFgX3Num6ckwjQzpvOC2QqP6qw==
X-Received: by 10.200.81.154 with SMTP id c26mr12175149qtn.129.1516826361787; 
	Wed, 24 Jan 2018 12:39:21 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id j19sm2821226qtc.1.2018.01.24.12.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jan 2018 12:39:20 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 24 Jan 2018 18:39:13 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jan 2018 18:39:11 -0200
Message-Id: <20180124203911.18352-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] package_rpm.bbclass: Fix matching of architecture independent packages
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
X-List-Received-Date: Wed, 24 Jan 2018 20:39:21 -0000

OE-Core changes the architecture independent RPM packages to use
"noarch" instead of "all". This change has been included in the commit
below:

,----
| commit 341810aff923ace6b1cc1e15e19383c4f8773b51
| Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
| Date:   Mon Jan 9 16:37:28 2017 +0200
|
|     package_rpm.bbclass: make architecture-independent .rpm packages
|     "noarch" instead of "all"
|
|     Too many places in dnf/rpm4 stack make that assumption; let's not
|     fight against it.
|
|     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
`----

This is causing problems with machines that has "all" inside the
machine name.

Reported-by: Alexandru Palalau <ioan-alexandru.palalau@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/package_rpm.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3cbbd1eb53..7829beabb5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -646,9 +646,13 @@ python do_package_rpm () {
     rpmbuild = d.getVar('RPMBUILD')
     targetsys = d.getVar('TARGET_SYS')
     targetvendor = d.getVar('HOST_VENDOR')
+
     # Too many places in dnf stack assume that arch-independent packages are "noarch".
     # Let's not fight against this.
-    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_").replace("all", "noarch")
+    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
+    if package_arch == "all":
+        package_arch = "noarch"
+
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
     d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
-- 
2.16.1


