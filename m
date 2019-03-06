Return-Path: <tom.rini@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA5A87CDF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:33:53 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id y4so14485689qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 12:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ugprp86ffP3J0leJD2YF/4iToZT3YJB/G2V/KqB5Kv0=;
	b=sMvm00AyzRgZljW2fMf6Kcm5agZiu+nT8+GDcW+Emrn2EaqK0hl9F/J4migLc9p2o9
	rl8t33j2qHIXY9VYcjaK+7cLIcVEQ+0xJ8rQeviarJMgRboEAhV1eCn3rTMY/thSnOdH
	j7buRGHU4TO+i+EfotGuElA4g1bJpmit8lneJpYaHZtrxqbmCzA4C9fJtrJUMvOTlJ4b
	Bc1iXtJqBSlM5Hz/x4gYywEmm3EPaqdCncAmhnxhLr9Oiuc2RImPVgqVtF+QZ5Gf6tGu
	F/8OZ3/qYP1I0OeEupxH8WRTwHYXRKjPwC3lBBQ6vvvSdQAgLqYVXHFP3UH+yhDqpJW4
	xiBA==
X-Gm-Message-State: APjAAAUN8viSmsJDCQlO7ZTgTM9BgjHTgoajJ6RIX/atXNdQQY0CHtU5
	20gFwOLG54hpFAl4CM74kDfc1/E=
X-Google-Smtp-Source: APXvYqwVCSfYjH7n5Ta2gRwtiUSEHy7ObPlGpZf68D8Ny5j+BRkFWtOihb1uaH9Oas97fETGF7159Q==
X-Received: by 2002:ac8:16d0:: with SMTP id y16mr6997118qtk.345.1551904434291; 
	Wed, 06 Mar 2019 12:33:54 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-C8CE-3B73-783F-B0BC.dyn6.twc.com.
	[2606:a000:1401:880d:c8ce:3b73:783f:b0bc])
	by smtp.gmail.com with ESMTPSA id
	x43sm1895034qtc.10.2019.03.06.12.33.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Mar 2019 12:33:53 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 15:33:46 -0500
Message-Id: <1551904427-14661-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551904427-14661-1-git-send-email-trini@konsulko.com>
References: <1551904427-14661-1-git-send-email-trini@konsulko.com>
Subject: [PATCH v3 3/4] packagegroup-core-base-utils: Introduce new base-utils packagegroup
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
X-List-Received-Date: Wed, 06 Mar 2019 20:33:53 -0000

This packagegroup is intended to provide all of the functionality found
in other VIRTUAL-RUNTIME_base-utils providers through full packages
rather than an all-on-one package.  Document how to make use of this
in local.conf.sample.extended.  Introduce VIRTUAL-RUNTIME-vim and
default this to vim-tiny to allow for a differently features vim to be
used instead.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Add a few more inetutils packages
- List kbd, add a few more packages specifically for non-systemd
  systems, thanks Mark!
---
 meta/conf/local.conf.sample.extended               |  8 +++
 .../packagegroups/packagegroup-core-base-utils.bb  | 58 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
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
index 000000000000..431dbb092615
--- /dev/null
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -0,0 +1,58 @@
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
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "debianutils-run-parts", d)} \
+    dhcp-client \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "dhcp-server", d)} \
+    diffutils \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "dpkg-start-stop", d)} \
+    e2fsprogs \
+    ed \
+    file \
+    findutils \
+    gawk \
+    grep \
+    gzip \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "ifupdown", d)} \
+    inetutils \
+    inetutils-ping \
+    inetutils-telnet \
+    inetutils-tftp \
+    inetutils-traceroute \
+    iproute2 \
+    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "kbd", "", d)} \
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


