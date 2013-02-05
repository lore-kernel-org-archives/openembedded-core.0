Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7h-0003zx-4n
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:56 +0100
Received: by mail-bk0-f45.google.com with SMTP id i18so155285bkv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=nMzRbmW+Ufrp/loDvT81Wbx1H0T9NpUUfgIUSKtUKH4=;
	b=bq5m4ISzHLcWNsjNU6QwEephBZHp9ZnPKkYWGqfa/ZvADKltPS6AhNvbqU+yk09T3P
	uKMUqqI8Yoyl6WM2gxtz66YtEno45Vwmzt7TAp49oMhE0jr9zJ+DWEY9ii8lqbP5efbD
	356DGiSpxnhFyIXnGR5DvfllYcfVnlTll33OA+F0r2wfOjwPeJFOHBreKBiZrsCvvxIW
	e0KuKdaKpF8FqyxttF0VvDA9sYUKlyfpk9gv3tENJQGdJo/Mbf0XgDr+NafnD++YN8qt
	qmoJDrrfRQva/jLI4LzMbgye9/74aMT1fqlzjAEVB3EL4ZC/zZP6cXVlSvEcMfk1EGp0
	3KUA==
X-Received: by 10.204.8.207 with SMTP id i15mr6646057bki.19.1360079762917;
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id o2sm133698bkv.3.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksH-0004Xg-4V; Tue, 05 Feb 2013 16:55:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:46 +0100
Message-Id: <0574b409893545c5ce601853c0210e3047b02297.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 6/8] busybox: update-modules script needs id(1)
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000

The update-modules script calls id(1), so turn on id in this case.
Bump PR.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.20.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972df6d..b0a3cbe 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -59,6 +59,7 @@ def features_to_busybox_settings(d):
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
 	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
 	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg('update-modules', distro_features, 'CONFIG_ID', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 783261e..3ea100d 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.10.4



