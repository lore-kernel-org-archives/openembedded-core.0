Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 58B4E60144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:23:54 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so42005442igb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 17:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bg8V/kjUQxkcQgwWnfJHFD26wmn8FP2wGT6a985R7qU=;
	b=i5zgGwRYTVX+SlSZ7AQIT5ocV/bEyvndVHEKdHdVTxFTJlzQ1liyLSKGDgiDlBBq5j
	5lBV1AU12PuCNwmtyqiIDXwxe0hqELTKf+R1k73/sDnH3WWyMCi3t4+k2Otub9SY7yEC
	MhFjw4A13YydirMEP2BSpVpD1THHUOnHJ67WPg8FhRRfXdGGrQwjbws53ru2vQ5+0+iS
	VT6ge9BklM3rWHHux59hy8FTqX1Ui3F3WgPjI1FtrZFKSN3tnkRXmqNO9wopHqPTmBRw
	6XE5KCmQoL4OwhW2UPMTSL5OWHW5mnR2/94cn49UiuXQZtV8ZYPuFCzB1o2uFt9d1TUr
	8+DA==
X-Received: by 10.50.142.106 with SMTP id rv10mr17059653igb.18.1425518636137; 
	Wed, 04 Mar 2015 17:23:56 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id o8sm11814008igp.11.2015.03.04.17.23.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 17:23:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 01:23:49 +0000
Message-Id: <1425518629-19739-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
References: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd: Create packageconfig for ldconfig support
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
X-List-Received-Date: Thu, 05 Mar 2015 01:23:58 -0000

Useful when we disable ldconfig in glibc, we need to be able to
turn it off in systemd too, otherwise systemd tries to launch
the service and it fails

Change-Id: I170307f809a13def0cafc282e88d4eafa0313c31
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 9c90c03..a96adbc 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -58,7 +58,7 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz \
+PACKAGECONFIG ??= "xz ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
 
@@ -83,6 +83,7 @@ PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
+PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
2.1.4


