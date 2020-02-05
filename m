Return-Path: <ross@burtonini.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9DE60B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 17:24:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so3371088wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 09:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IWidFcgNcb5fp6AwCLQrMOZaPH2nbWBFQ39VTPwG5To=;
	b=Jdn39pFn/7STkw2N2rPcMIKa4JFYU6a+XQwSzYdlx+PrneTycuMTWkP7HX4qmvwcQp
	0ya2sdKkHI31xR/+CzdWXMb8sY6q1aukAnkhBaN6OyM4voFEQaNWsPia7Z74bOO6ibnk
	TxnMhvn2XZ1rdBEX0Bu8dN00JVkr92Oc24L4JUyBZtq6eIiy8RNUIDDkkTEHskY4Yakn
	Un/id6P/DlATlVIG8Ll2IWdxkZi2yFCwA+5AkqdyqVeyvNnWwBQum4pwrdIXtASI326Z
	riVsjJw90X3IqXDkQU2jRjGhlWaWkaIa/1/S3tBMleE+IrVYuy9Lx+7O1/BzyeefJjC7
	8lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IWidFcgNcb5fp6AwCLQrMOZaPH2nbWBFQ39VTPwG5To=;
	b=JPnEGUa3CgO+CSQ+dIVW6aan9xD3pXyqD4XZzGBUWf1NGqOZrZaYkCBJ2OxjEcSm26
	6Qa53fGK+9WF7xHN01cwczXx+z8GZOKaZq+MD3/rLgp4m1VF3yuDa1uISpOL3QYmt2TT
	K16/wURCNiXYQK9zBTyaDR2Dsf6f8h5inr83rRjtfSHCUBGNe2ZdFc0i94Hwho38KhtK
	8/uEfTfX2Io2spnmhSmttZZ/tK1xMnITUuNSAaCH5NzIc3fn7ZU7To4xOQguRCfcl3zs
	+Gm4d+kPVDusAiTRrAW6/VtCG/RY/GT9R/eVMaHp6wuD2+nOewsiIJakq0pj0hrRWDV5
	xcSQ==
X-Gm-Message-State: APjAAAWgnFhnyd32uz8IiT7GGW6pL7D5SOF5Y68bYqqpNF0vn/q4SNlE
	m59anpaTOiVN9+0Z+RvXIt+OHpZZ/BiwdA==
X-Google-Smtp-Source: APXvYqy/lXo01jV3FNf9og1uyPKf8hanCyrpgrKDXIamsX7DDbNNsyLer5EODeM3Y5KHTBKVykWFAg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr7121460wmi.31.1580923498803; 
	Wed, 05 Feb 2020 09:24:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i2sm283085wmb.28.2020.02.05.09.24.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 09:24:58 -0800 (PST)
From: Ross Burton <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 17:24:55 +0000
Message-Id: <20200205172455.20928-1-ross@burtonini.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gtk+3: sort resources for reproducible binaries
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
X-List-Received-Date: Wed, 05 Feb 2020 17:24:58 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The list of resources is gathered with $(wildcard) in Make, which isn't
sorted. If this order changes then the generated libraries will differ.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk+/gtk+3/sort-resources.patch           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
new file mode 100644
index 00000000000..7f87372c52d
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
@@ -0,0 +1,19 @@
+If the resources file isn't sorted in some way then libgdk.so will differ
+depending on the inode order of the resource files.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gdk/Makefile.am b/gdk/Makefile.am
+index e25b57ba50..26f2d57c6e 100644
+--- a/gdk/Makefile.am
++++ b/gdk/Makefile.am
+@@ -465,7 +465,7 @@ stamp-gc-h: $(top_builddir)/config.status
+ # Resources
+ #
+ 
+-glsl_sources := $(wildcard $(srcdir)/resources/glsl/*.glsl)
++glsl_sources := $(sort $(wildcard $(srcdir)/resources/glsl/*.glsl))
+ 
+ gdk.gresource.xml: Makefile.am
+ 	$(AM_V_GEN) echo "<?xml version='1.0' encoding='UTF-8'?>" > $@; \
-- 
2.20.1


