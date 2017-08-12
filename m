Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDE3B78281
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:40:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c24so3475081wra.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RcVx9xNQgKTuhptxEGFpE3XvtHLyQ0SCIWbhlk2prBI=;
	b=pNYaM/3ROuhA14CX3s8GRKkT8tUfDkVKQoozKvaRqEd7ejzEfnsgVvDZs1r8eWw8c7
	mkHeaLZ6Ucp0oKM9bQRDz0Dyrz9QHIMVCTY6qVef5SNKgD0007pabDgdVYOfpIL2jiNB
	kZ9atMLbT4pnmqu2q712vXxMaG1NE4gqoj4VWKKkDYI0kYtHKLCffoawZ5HDTXEt7q7Y
	qjSsyXfv+yklA4B75iLtVWldIuXGHasMHOF+KE9cvLZFkqsB9G8LcY2/bf3VZfew5kSt
	QdNG3D5SCSR+T1EQBBdDkkqAdpKcK22K80DrR9bSmxyiSmlngQafgEBQkf1P+t0Cn0eV
	RpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RcVx9xNQgKTuhptxEGFpE3XvtHLyQ0SCIWbhlk2prBI=;
	b=pZFOdK2kDG15oNOvzBwkAdaY9tChlt6B8coVYmhy6U+ggvGf0c4CxcKszjnmG3KR6f
	mmmwpD0Aok/pO2u/A4Fg275vUAvyiOpyej1zVbQmpxP7cDSbXrouabxKPn9OnJjmlJNg
	YAPPyOgbhGGoF0X2jstSYMBW0SmIkUlf0F6ax3lL1pdwvosbXnsT2oX8eL6njeAR4lIv
	HbhN15DiuDeJogrZS0+f0RkQaq9oPTjBGb9KvJuoUszJzP8CLhWTcXS/eDmVLhAAVYmt
	b9/d5BJAlyLD1YgvcKtwucgGTEhleFX1I03ox31P4G0Yy03uuIT7G8yI9D73+Pgm38wc
	g/eA==
X-Gm-Message-State: AHYfb5h9KVvb5cFkxzHZI1RMWKtMrNI1ovEOTDQL6nfpC5nRe40DuFeN
	xDxc7ZTQeIwXZLKt
X-Received: by 10.223.164.194 with SMTP id h2mr14780913wrb.137.1502498418571; 
	Fri, 11 Aug 2017 17:40:18 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z45sm139540wrb.41.2017.08.11.17.40.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:40:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:41:42 +0200
Message-Id: <20170812004145.12654-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812004145.12654-1-Martin.Jansa@gmail.com>
References: <20170812004145.12654-1-Martin.Jansa@gmail.com>
Subject: [PATCH][morty 2/5] sstate-sysroot-cruft: Add /etc/ld.so.conf to whitelist
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
X-List-Received-Date: Sat, 12 Aug 2017 00:40:18 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* it reports at least 2 issues in every build (this file in
  native and target sysroot) add it to whitelist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/sstate-sysroot-cruft.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index b7ed8ea846..b6166aa1b2 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -141,6 +141,18 @@ WHITELIST="${WHITELIST} \
   .*/var/cache/fontconfig/ \
 "
 
+# created by oe.utils.write_ld_so_conf which is used from few bbclasses and recipes:
+# meta/classes/image-prelink.bbclass:    oe.utils.write_ld_so_conf(d)
+# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
+# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
+# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:    oe.utils.write_ld_so_conf(d)
+# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:        oe.utils.write_ld_so_conf(d)
+# introduced in oe-core commit 7fd1d7e639c2ed7e0699937a5cb245c187b7c811
+# and more visible since added to gobject-introspection in 10e0c1a3a452baa05d160a92a54b2e33cf0fd061
+WHITELIST="${WHITELIST} \
+  [^/]*/etc/ld.so.conf \
+"
+
 SYSROOTS="`readlink -f ${tmpdir}`/sysroots/"
 
 mkdir ${OUTPUT}
-- 
2.14.0


