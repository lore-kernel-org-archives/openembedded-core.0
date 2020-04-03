Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.14799.1585930577186743640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKj+7dTz;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m17so9157248wrw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=mNX4qtqmmH+zKkm3PMFy546eXQIFEB25JPBWdq58GGY=;
        b=YKj+7dTzU5zTRyfm7fzQK/KS1ZKt3ZEauQf/2IRnV7KdKV6ZYHgkzTOvHMt5CYshey
         5ctiFZ180dN+kiv0PfJCindxU0AFcz6rOW8qDiHyFzE+jEgLazniV7c1ltZTx8OdiDtc
         mk3bWN6gWmJesJoaRVNe7AhOPYHK8fJzrYKC3OuovZJNOhJ3hqAynFBDZm2e8fADXTKy
         P4Edf/L9AbPRHqsdpK+rBYr1MDVvOR6YKW9CXTakv0Z41OSe56h1UJGQP4wp26W1RQxc
         3pL6VsXmIt9T+Ni2YZZIK2SQqhw+X6tRTs3ReFxXAUuB09I3x01vbFTraURHi4mmi6Mz
         IhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=mNX4qtqmmH+zKkm3PMFy546eXQIFEB25JPBWdq58GGY=;
        b=pDWq8DFcPh8UVz3mMsdaJeGi0lCTlJlbHDiis3vM5pGGlz8JOFI2Cf7c7rRUJRpKKN
         LfFgBOlVXAog3NSUz8PDy/qebelgpKqVxGoQ1YZ5KQDU+emDzVORScoUOcd8EM5Lbjkx
         LzntNfgqfpG7ht6u3Mb+LMZy+dt0VkvNxj5KmFJ6Zo7M5p32GgjxiPhhhxfJcz2+lwcA
         PhUE87V1/9ci3kbfxGCJ5q5OwdeBKSgJU2+n/JrbMEF5+tcwj3liwO9LD6e1KUD+uV7N
         UyeOzdOn0yDAdHjPnm5KuIQ9as0CuyQVddVv3943v89s+/jZzK7g5EM4pSm/XTgfcwJ5
         fNzA==
X-Gm-Message-State: AGi0PuZlMqWY6kfhjBSAcCPgZg2mxvsYqkgJMwzg7ZTqWK+OFB68khoM
	Xpz7yrLSeMJ6uW/xCygJWJjdMEFE
X-Google-Smtp-Source: APiQypJ6lv/Ig+Jl1OrdT8veI3lB5kPE5MmPhw6nBrk6HkYk4vfT1Ka08jPzRSCBaRm5pd/22UI7SA==
X-Received: by 2002:adf:e70f:: with SMTP id c15mr10474553wrm.217.1585930575177;
        Fri, 03 Apr 2020 09:16:15 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5B25B65E.dip0.t-ipconnect.de. [91.37.182.94])
        by smtp.gmail.com with ESMTPSA id e5sm12862145wru.92.2020.04.03.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 09:16:14 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v2] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Fri,  3 Apr 2020 18:16:07 +0200
Message-Id: <20200403161607.7935-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
    Author: Yue Tao <Yue.Tao@windriver.com>
    Date:   Fri May 25 10:48:08 2018 +0800

	initscripts: Avoid starting rpcbind daemon twice

	Check the status before start it to avoid duplicates.

the use of a script {/usr/sbin/}service is introduced - maybe earlier
provided by systemd, nowadays mostly by init-system-helpers from
debian project.

For the very first shot, maybe discussions and improvements based
on that script collection, use just the init-system-helpers-service
in initscripts/mountnfs.sh to avoid problems mounting NFS in later
boot stage.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../initscripts/init-system-helpers_1.57.bb   | 51 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
new file mode 100644
index 0000000000..d75e518ed4
--- /dev/null
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -0,0 +1,51 @@
+SUMMARY = "helper tools for all init systems"
+DESCRIPTION = "This package contains helper tools that are necessary for switching between \
+the various init systems that Debian contains (e. g. sysvinit or \
+systemd). An example is deb-systemd-helper, a script that enables systemd unit \
+files without depending on a running systemd. \
+\
+It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
+provide an abstraction for enabling, disabling, starting, and stopping \
+services for all supported Debian init systems as specified by the policy. \
+\
+While this package is maintained by pkg-systemd-maintainers, it is NOT \
+specific to systemd at all. Maintainers of other init systems are welcome to \
+include their helpers in this package."
+HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
+SECTION = "base"
+LICENSE = "BSD-3-clause & GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
+
+DEPENDS = "perl"
+
+SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d -m 0755 ${D}${sbindir}
+	install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
+	install -m 0755 ${S}/script/service ${D}${sbindir}
+	install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
+}
+
+PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
+
+FILES_${PN} = ""
+FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
+FILES_${PN}-service = "${sbindir}/service"
+FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
+
+ALLOW_EMPTY_${PN} = "1"
+
+RDEPENDS_${PN}-update-rc.d = "perl"
+RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1a59b82fbf..4080c4a495 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS_${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
+                  init-system-helpers-service \
 		 "
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS_${PN} = "${PN}-functions"
-- 
2.17.1

