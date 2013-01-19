Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSx-0007e1-Qq
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:48 +0100
Received: from mail-bk0-f72.google.com ([209.85.214.72])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:22 -0800
Received: by mail-bk0-f72.google.com with SMTP id jf3so5349308bkc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=B0tSy+rC+Lfc+i9XhRKzGE1sR8uYqH0fkQo04hBoCEM=;
	b=L3ijViRFwKSGvJVJB8/HzQ2fwL9zmU28ba33K5METim5RUYgCLJopaOd5vacgz3aom
	nD88MM5mCxmXYrZzcWni9ZmIGb2VNopYpqefintm4HhMY3ypUBxIPzFloI6rl5F1HTSB
	4q2HlR8p+mZGMyPL3sM3mEjSOVLZtY/TDthcEdyhJybUSqmnWNi2DEjMdjsUugRvZvo/
	IcAEikHMcf1/vrZErN2BrradnykYZK9t1ftqLnF+rEAchoY2v13evchGhCzIZEtpsucX
	LQqoMdJbFUu5B8ZZ+1QvjU2SREezNmgpNb+sAzL5bdHT5XrBJYH+N+qUPs4TVx/lvTKD
	EEdQ==
X-Received: by 10.180.82.170 with SMTP id j10mr9377518wiy.2.1358635761227;
	Sat, 19 Jan 2013 14:49:21 -0800 (PST)
X-Received: by 10.180.82.170 with SMTP id j10mr9377516wiy.2.1358635761177;
	Sat, 19 Jan 2013 14:49:21 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:09 +0000
Message-Id: <581738118a1085bdbeffe98267a02372f3524f37.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnQyv88Xa3giSFdB/dtDLiSgpnU4HsKOiXSK7oX0AhuDExoZkstC5Go/WCOmGODSTPciKGXIyezjaIFvf7eRvnjRznTbEx/0g7GxKJ6RyACZguY6gA3FYQ/cd1rH1cY2IhNGwEi1SbUkQdfP4MzFt/WN9UH4XCRWCP3kIV71HOTkss4s/r8uvqoOGT4Eiawo+U39F8m
Subject: [PATCH 06/10] packagegroup-core-boot: install systemd-compat-units on systemd images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 23:04:48 -0000

systemd-compat-units is needed to run postinsts for example.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 94e9e32..fbc50c7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -41,6 +41,7 @@ RDEPENDS_${PN} = "\
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units', '',d)} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.10.4



