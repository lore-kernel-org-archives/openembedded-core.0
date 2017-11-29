Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88C7C60248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:33:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g75so6000162wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rJYcy8HJHVLadS9NWbP4XhEwb84Zr5JfyeeBTx0yVtY=;
	b=IrjDkCCbDIfPhblNzUQDhOfLXRy4DWMPMO0DfbesqD3CiAko6jomTsYhXHON/nT0oN
	L329PC3hdAYLWxE+OCWndTaoSe8Git4IY95Aee3H94HFuANLZOn/HTETj5tLCn4tYRHk
	Jqf7AVIlOby0Ovg8YK6kn8eqJdhuzrNv3GWBgoYUL1DwlA1an4IZdxtTbmlL60TFzBUl
	CLJq2ETsiYnTVmfwGLF+ci4raKpGrZAukRui8tVAUDOqTr+fIYO2AKnvelwjK82GIF6B
	UyOL4VUlBVuZejXMTQhpPsZsLL3KrQmsRk+8wjvBE2VLnuaq43xey3Y1xKk+/onQMVPl
	/S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rJYcy8HJHVLadS9NWbP4XhEwb84Zr5JfyeeBTx0yVtY=;
	b=NWhR5PR4BRJL6M5xktGMVy3SG3WII/vCHOfLau/00Gfnnr+nJkCE8rtmENZ5TpciMg
	eMdOHCol3lQTTRbAI6f9VBbc8Mvg4QNFkFNp5lyKWQ4fQ6DB6Qx2eFcyze3y44acTQPK
	vxkfZuO+xJ0ToE0YDIcK5i4qkVssu+Sc2MqQUlYtWN6nzhBXnHz+TWnWWJSP9LJ6rljJ
	Q6iauJZFf4750EGYMvcCSTzjiI3JqNv0hvuVJgiSHbnROt9Fk/OX71olfVkBU8Cw9sCk
	QovBUGip7wuhiJn5QBqCLmtCOFWi0cS/a7bgL7G7O4E3lOa7T+KqP2L6Sd/jJTnLAkdD
	7hfg==
X-Gm-Message-State: AJaThX6Pbat0y4hKqesQ0bTAFHkiV3Y9imPRgBOs6fsyMc0z2TBYVS0i
	NyqVhKgMcTADO0d7LWWJe6nPr6Zl
X-Google-Smtp-Source: AGs4zMa5/XfKh0b8JlbTCib6udQ2soytoVQhYW64AA7Hag9NkV12P+FZcTAL4ZUO9EfEQf0JCUDoOg==
X-Received: by 10.28.105.144 with SMTP id z16mr2552468wmh.41.1511958782785;
	Wed, 29 Nov 2017 04:33:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	h194sm4452706wma.3.2017.11.29.04.33.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Nov 2017 04:33:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Nov 2017 12:32:59 +0000
Message-Id: <20171129123259.5703-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bash: fix build race under musl
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
X-List-Received-Date: Wed, 29 Nov 2017 12:33:02 -0000

Under musl bash uses its own libintl clone but there are some missing
dependencies so it is possible for pathexp.o to be built whilst libintl.h is
being written, leading to compile errors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bash/bash/pathexp-dep.patch | 13 +++++++++++++
 meta/recipes-extended/bash/bash_4.4.bb            |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch

diff --git a/meta/recipes-extended/bash/bash/pathexp-dep.patch b/meta/recipes-extended/bash/bash/pathexp-dep.patch
new file mode 100644
index 00000000000..e05bbda3174
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/pathexp-dep.patch
@@ -0,0 +1,13 @@
+pathexp includes libintl.h but doesn't depend on it, thus a build race can occur.
+
+Upstream-Status: Submitted (https://savannah.gnu.org/patch/index.php?9503)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index c7b62bc0..241cbf12 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1281,2 +1281,3 @@ nojobs.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
+ y.tab.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
++pathexp.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
+ pcomplete.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
diff --git a/meta/recipes-extended/bash/bash_4.4.bb b/meta/recipes-extended/bash/bash_4.4.bb
index e544d07c10e..8b989ed3bd8 100644
--- a/meta/recipes-extended/bash/bash_4.4.bb
+++ b/meta/recipes-extended/bash/bash_4.4.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://0001-help-fix-printf-format-security-warning.patch \
            file://bash-memleak-bug-fix-for-builtin-command-read.patch \
+           file://pathexp-dep.patch \
            "
 
 SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
-- 
2.11.0


