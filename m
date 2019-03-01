Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id EAED17CD45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 03:21:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m10so10743158plt.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 19:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YZUujBytv4bg6vzgI91E1O1iuswu3Hf2Of0soEOI1LQ=;
	b=OC06b4gWiebHjbYL7QVFDkuacwwYSJHxEy4dGEMnjS/peF5NtOv1F+P3XzFgN8hbtS
	BsOjtq0IBjgPUM5Av39JvujiIo0bB3Ix//92Jvwmghc644FRmyVqLE+g9RxRTpUqw+L8
	frB3kHAtYx5hqPeDkON9h94Ue288tcL6VFA/ZcIA0BqpP8K3TMyCsUTCtCv82rrzEsW8
	tusDKvS/VVbEhiXwMxz0ODE+ZhDJzRcV8DgDQ9oyFtL6VaTpW+aJb9N5tgT4zqvyssIQ
	KtC5jYIzdef1X8o9x1uyysWb1YRNgPV/lkqP39PoGUF5BTvAKBh6nsukAeL5GE4WU58B
	W7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YZUujBytv4bg6vzgI91E1O1iuswu3Hf2Of0soEOI1LQ=;
	b=ZAVci9I98Jq0hUzFxZj+pKwxMjrmIOAgUcMXAO/slHhrr/tAnjKU+i+1lkIr3QUUUj
	qG5VB2PZxRm6fLuZafYkDR3N3Pn6yP9s+UsifL35Nxj9M+PIeUxvusyrLRYFrG24AQLy
	asjBnOIN06jaV++VhxVlEXjcO71/VrjP8wTP5Jc1eJggUJK7PMaO1UEwH5b+fl60/xDJ
	yAF2jwLfXppvhWt5nNF3fPqakeV7DfI1Lgu6EBZME7uknbsB5bHUTj6AvkpQ3eQSD06+
	2FwCXVdnK2fvnYsgE+fkLri79Vd7FGDvquD/zVJQMwBgymrBHWUTehuVbWRjMq5MWAOL
	hwYw==
X-Gm-Message-State: APjAAAV3R3sMtW8WeFzbZ4NzQF8GsWydMYdvNLy/bV/fB9AF3mqnprG5
	zbo7kSgKtkpJ+qbt4Ph/iCBc1K9V
X-Google-Smtp-Source: APXvYqxmOEuHmTksGv0piMNIQwVpavarlVuoASsr20+GzR7YB+ckhraZaupF3g+aunPufsegPTnkZA==
X-Received: by 2002:a17:902:7604:: with SMTP id
	k4mr3136487pll.232.1551410484669; 
	Thu, 28 Feb 2019 19:21:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	z127sm37612096pfb.80.2019.02.28.19.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 19:21:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 19:21:12 -0800
Message-Id: <20190301032112.38191-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301032112.38191-1-raj.khem@gmail.com>
References: <20190301032112.38191-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] musl: Fix out of bounds data access in dlopen
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
X-List-Received-Date: Fri, 01 Mar 2019 03:21:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/musl/out_of_bounds_read.patch        | 20 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/out_of_bounds_read.patch

diff --git a/meta/recipes-core/musl/musl/out_of_bounds_read.patch b/meta/recipes-core/musl/musl/out_of_bounds_read.patch
new file mode 100644
index 0000000000..a681cc284e
--- /dev/null
+++ b/meta/recipes-core/musl/musl/out_of_bounds_read.patch
@@ -0,0 +1,20 @@
+Fix out of bounds read
+
+self->dtv hasn't been extended yet
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c
+index e2c3259f..b23ea0df 100644
+--- a/ldso/dynlink.c
++++ b/ldso/dynlink.c
+@@ -1374,7 +1376,7 @@ static void install_new_tls(void)
+ 	}
+ 	/* Install new dtls into the enlarged, uninstalled dtv copies. */
+ 	for (p=head; ; p=p->next) {
+-		if (!p->tls_id || self->dtv[p->tls_id]) continue;
++		if (p->tls_id <= old_cnt) continue;
+ 		unsigned char *mem = p->new_tls;
+ 		for (j=0; j<i; j++) {
+ 			unsigned char *new = mem;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f1052278c8..6a72b7d3bc 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://out_of_bounds_read.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


