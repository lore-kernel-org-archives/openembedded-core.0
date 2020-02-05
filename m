Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id E884A60C70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:56 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id y8so1976501qvk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RSa44dX2g6nQVud0zL3I+oPqxnRkx4bzLKn+F8PfS+0=;
	b=pMvIwtgU6VWZIb05ZCrCAaMsxNrITZijwuOhYWyRD3Hw6qG0W76Lek5xor+KL66gZn
	VQYa9Jeljj5Mag9PDH4ZwYfOSJb+FDSaubs3a7U4T4qe3+aYOYKxbcrV/DfTd6FlTE39
	6DQTWmHhtgOdiHpf3OdgnV4NkjQpUrYyF/tRGxRhjP3kFUHBhuHzXbCcubF/tTUmyjMN
	7AEudLNgFpANgr1g2SLXkmlNwGUyOYPA2PNXAO4sdn+KdVg+aulvuZuaFsRNxrSckTue
	zpgdqjG1F7tEtLWDQB6tLdA/uMNvnCT6AI3w8eX3Gb26dSBZY+A8L6OVyH7bdHOlpK5q
	J+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RSa44dX2g6nQVud0zL3I+oPqxnRkx4bzLKn+F8PfS+0=;
	b=fsbt+wpa00A28T/wHK0xNjCZOQB7UWFmUc7X/+RpYtU6HYP1Nu8PLScuF5gMEPci1Z
	VKb4z+scLJdrVThdGL8h35IWBwU7XxmXTKNJASpHjeTyFxw+yBwnwklnU1DwTPHR9mx9
	iGNwxRYDMudukBGUJMZgBO6p/+fhaFD/RcZydaWsTHrboN2q2Ct7cJ3w10jLNFuPfWQ/
	bYzrwX7zIU/bXJKQYNGxzEtJzZOtzslkjoHZ/cQw96BJRRp87MrJHX3hkZjoCJyYww6A
	M53TRxc83Sh+9G/h3qxZ8oVewbGMLkkm51Ci1qbYyTTgnhqVK2fjuZmChEFMzGwg0SWH
	/tUA==
X-Gm-Message-State: APjAAAWfdecPKZzOmM2qQfrMjaaiGGPCYWtEMGnhVhc+OglA7D0+GGX5
	MjXZwhKYR7q2bfzXr6zvpHcL8iFlfAPo+A==
X-Google-Smtp-Source: APXvYqwStXqTplcvQ8d1xvMdt3j2hRxakqIHrmu93YPn/IXk5ipr7+C3wMq2of3c4GmBZSd5RJ4EEQ==
X-Received: by 2002:ad4:58a8:: with SMTP id ea8mr53572qvb.93.1580944376453;
	Wed, 05 Feb 2020 15:12:56 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:44 -0500
Message-Id: <52b98a7fb4dea5caf2629ebe3339a559bf8e7ef0.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:57 -0000
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 3f9cfe7fe5..f263421234 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tools for managing Yocto Project style branched kernels"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
+LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
 
 DEPENDS = "git-native"
 
@@ -11,14 +11,17 @@ PV = "0.2+git${SRCPV}"
 inherit native
 
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
-S = "${WORKDIR}"
+S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
+do_configure() {
+	:
+}
+
 do_compile() { 
 	:
 }
 
 do_install() {
-	cd ${S}/git
-	make DESTDIR=${D}${bindir} install
+	oe_runmake DESTDIR=${D}${bindir} install
 }
-- 
2.19.1


