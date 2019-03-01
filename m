Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id A27467CDD1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:27:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id g9so21373439eds.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 14:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1KvU6ulLrjruZcZsJQ1UCUN1Dsd9ODIQukfKDT83Jls=;
	b=bF+Z5yUbegCa6+/EOR74Sx+Br2iYRBjELrPPuKdAu+GZG1O6V5k8CB/wqFTl8WdzS1
	NYD3o03WbUhk+ydZ9Znu0XeSsaH5TYxyEAJSltQ35pbRBzVHx5bHurMlHG9tnvg7X9n/
	PkJaCrS/gCM2Bs0HCwwwBkvAGPf+PQFu53K4jCfsYbZC0VBCqn0CQI710V0YjyrRre/N
	NCyuhpC7YgUXoQHRyHIWty6LDJ8Jin5BeM3ajLYMx5kAZ8H/24AfKDooNkXvi8qnn5JU
	esjl6k1TaN0btiRxQ+YwF0YkKgExuU5ZFM/6Zx+XfSsv1lD00vrz/sKmnzfsWiqSVmbC
	u+4w==
X-Gm-Message-State: APjAAAVVfnmxOhbuhT+HAcYso5OV7v1ykauGIc8jlj2DMyB6WNEd368Q
	IgY6Ei5Zgdeuo3XJw40TOVAx8bc=
X-Google-Smtp-Source: APXvYqyyKuB+eZlH+Y01gLXy1V/JbMG4IkyLlTc6s1VKfOzUc2ttsg5EMvGTVxA1rMrDMtzHKcOytw==
X-Received: by 2002:a50:b126:: with SMTP id k35mr5729871edd.55.1551479225546; 
	Fri, 01 Mar 2019 14:27:05 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id
	x34sm6337645edm.70.2019.03.01.14.27.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Mar 2019 14:27:04 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 17:26:51 -0500
Message-Id: <1551479212-28944-4-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551479212-28944-1-git-send-email-trini@konsulko.com>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 3/4] packagegroup-core-base-utils: Introduce new base-utils packagegroup
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
X-List-Received-Date: Fri, 01 Mar 2019 22:27:06 -0000

This packagegroup is intended to provide all of the functionality found
in other VIRTUAL-RUNTIME_base-utils providers through full packages
rather than an all-on-one package.  Document how to make use of this
in local.conf.sample.extended.  Introduce VIRTUAL-RUNTIME-vim and
default this to vim-tiny to allow for a differently features vim to be
used instead.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/conf/local.conf.sample.extended               |  8 ++++
 .../packagegroups/packagegroup-core-base-utils.bb  | 49 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 8062e4c5721b..d00221893ad9 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -384,3 +384,11 @@
 #VIRTUAL-RUNTIME_login_manager = "shadow-base"
 #VIRTUAL-RUNTIME_init_manager = "systemd"
 #VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+
+#
+# Use a full set of packages instead of busybox for base utils
+#
+#PREFERRED_PROVIDER_base-utils = "packagegroup-core-base-utils"
+#VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
+#VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
+#VIRTUAL-RUNTIME_base-utils-syslog = "syslog"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
new file mode 100644
index 000000000000..061dade0bc03
--- /dev/null
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -0,0 +1,49 @@
+#
+# Copyright (C) 2019 Konsulko Group
+#
+
+SUMMARY = "Full-featured set of base utils"
+DESCRIPTION = "Package group bringing in packages needed to provide much of the base utils type functionality found in busybox"
+
+inherit packagegroup
+
+VIRTUAL-RUNTIME_vim ?= "vim-tiny"
+
+RDEPENDS_${PN} = "\
+    base-passwd \
+    bash \
+    bind-utils \
+    bzip2 \
+    coreutils \
+    cpio \
+    dhcp-client \
+    diffutils \
+    e2fsprogs \
+    ed \
+    file \
+    findutils \
+    gawk \
+    grep \
+    gzip \
+    inetutils \
+    iproute2 \
+    kmod \
+    less \
+    lzip \
+    ncurses-tools \
+    net-tools \
+    parted \
+    patch \
+    procps \
+    psmisc \
+    sed \
+    shadow-base \
+    tar \
+    time \
+    unzip \
+    util-linux \
+    ${VIRTUAL-RUNTIME_vim} \
+    wget \
+    which \
+    xz \
+    "
-- 
2.7.4


