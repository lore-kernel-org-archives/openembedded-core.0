Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNu-00076g-0M
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-we0-f178.google.com with SMTP id z53so1833580wey.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=pwre65hhnjj7bEr2xRVSKF2Xt0EDlEzEYEtdK0M0hHM=;
	b=GPWIkAfxa/z0xR3YWPdSwY5P5rOl7fmiR9Wtuume8sgd/opZxrnLuXunJlrgJ3h0oP
	ieYLQbq7CdBiI+gwMxnPzBqmjX6K8rMzUzGRR4Ctzp1h7DjDSKASLrHyI9wKwUQOP87t
	G4MTmYRspVfBzsVcr0xYAODC7NXh7gaRQQEZsSEf2QD+tqPiBporopTC6bZZuqahdbVJ
	EMekLTam/j90cRhyMoHI0mLqlp7s0UEeGJz19jKuZJbbKn/Vlf90k46E+VE7Afi8qqk3
	Z/hfNSu4t599GkPUH6W9K6RRhRUNWlTzRr0P9r62Hx9rUWkzVUSJNWJ0NQqMiam8S0hA
	vzLg==
X-Received: by 10.180.108.106 with SMTP id hj10mr4628431wib.0.1364316786304;
	Tue, 26 Mar 2013 09:53:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:01 +0000
Message-Id: <9a7827747db176919f1dc4e17d5cc7d3601ee9c6.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmoy/f02Zr0/EcKzUZOxfVXIXdZzpYzlHAMS8IC42E+lTA7kANr6hgzfniKqXN/CVdZSauL
Subject: [PATCH 03/24] systemd: make xz support (compressed journal) optional, defaulting to on.
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:17 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:10:17 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:10:17 -0000

Compressed journals means using liblzma, sf the journal isn't going to be used
this can be disabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 5180eef..dc54f36 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -43,9 +43,11 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "xz"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.10.4



