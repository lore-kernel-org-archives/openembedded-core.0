Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB477E692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:45 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id f25so1477314pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i9A6RUbeHqED5lyBs1vAj2pf4izOS3Je3QrlVMcF2JU=;
	b=hgVFFH9TKvu65HGD5WpZFOXcWggySm1TUVhx6mVdZELlNsKsmixrNzY+Mu73n6bCSx
	YTd+CVGWvFlmKFxM3m2XbK+kB5ddHlJ/nwAcEkh+50HglhnMSUosfzK5YlSKmJEo7pLy
	NuOLnhCHd7HTjXf634qArCEfOPOOexj50gB6wlRqrw9PB/giF551yoNv88UQIixhlT5/
	/9l1ZlnIQjlZvzoDVhULvmL1YSCNf8CoCLdzMqBUdAadkSNMj3Ywd5Leu6B6vp9qt11M
	iJlReNetdhS7ALNar1TLZzu3XW41d7OxvjHvVclDDUxiukeo+sGmGjhmqzG2N62Q8e1V
	HEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i9A6RUbeHqED5lyBs1vAj2pf4izOS3Je3QrlVMcF2JU=;
	b=KaJAO9183TvLjvi6wUPUw4SjS+ORA8uIsnCKypSbRQoiPzE1s/ZXWxijhPju7zuKs1
	G/URfcGfmZaaUzdourLmfHucNBDGoc4v8RrjaJ9KXU3IdtBTfURs+gpkk9nXHykmAcB/
	C3DHYkt5l29ipPPdixP85FdbZf9lpRZFXRub2LBKBTquISVNw+dU+fFK7zbDhXcCtkhG
	qUsMtc1Y39DZHi8RK/p32GS9Qa7lSAeU2yshtMLdzjE72VLIc2bvBH22atq9DRuzDFJN
	LxBZuGVkNbLpuUy2rKj4YUTpaDdB34weg5fBa3ut5M0UGlTW7hHy8Mlo4ECubTz5edld
	dtIA==
X-Gm-Message-State: APjAAAVD8Y1K3gmFt8aTcNCU769jd++avM5+ZtYrHGWU6iNlUFy08YGY
	F0GQFkcv8wQGDCPij/L8Yqcv/HtlQ1k=
X-Google-Smtp-Source: APXvYqyVy4V+FZ9PzxjrSDvv3Hr/kGnTlSvH7uZu1UW27YWmeCD41qBOVdFlhxbE0FRJe26QHnNQtA==
X-Received: by 2002:a17:90a:eb08:: with SMTP id j8mr65215pjz.72.1561568026310; 
	Wed, 26 Jun 2019 09:53:46 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:12 -0700
Message-Id: <8b5e68afc9767d8b6b966503e9353cadafae9bfb.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 11/25] cairo: fix CVE-2018-19876 CVE-2019-6461 CVE-2019-6462
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:45 -0000

From: Ross Burton <ross.burton@intel.com>

Source: OpenEmbedded.org
MR: 97538, 97543
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/cairo?h=warrior&id=078e4d5c2114d942806cd0d5ad501805a011e841
ChangeID: fa8bdd44ad8613bb0679a1f6d9d670c3b47a0677
Description:

CVE-2018-19876 is a backport from upstream.

CVE-2019-6461 and CVE-2019-6462 are patches taken from Clear Linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Dropped CVE-2018-19876, not affected]
Issue was introduced in 1.15.8 by:
commit 721b7ea0a785afaa04b6da63f970c3c57666fdfe

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/cairo/cairo/CVE-2019-6461.patch | 19 +++++++++++++++++++
 .../recipes-graphics/cairo/cairo/CVE-2019-6462.patch | 20 ++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb         |  2 ++
 3 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
new file mode 100644
index 0000000..5232cf7
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -0,0 +1,19 @@
+There is a potential infinite-loop in function _arc_error_normalized().
+
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..f9249dbeb 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && error > __DBL_EPSILON__);
+ 
+     return angle;
+ }
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
new file mode 100644
index 0000000..4e4598c
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -0,0 +1,20 @@
+There is an assertion in function _cairo_arc_in_direction().
+
+CVE: CVE-2019-6462
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..1bde774a4 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
+ 
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
+ 
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 18b9479..08026c4 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -25,6 +25,8 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
            file://0001-cairo-Fix-CVE-2017-9814.patch \
+           file://CVE-2019-6461.patch \
+           file://CVE-2019-6462.patch \
           "
 
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
-- 
2.7.4


