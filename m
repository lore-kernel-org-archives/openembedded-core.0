Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92F02600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 13:47:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z84so4749602wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=knMXwA09iYeaJw6Llkxvonx7f+d92JU+n+Lkj3ipg+U=;
	b=WGYauMADZyyzpeTNAzxTbk8LKrWL4+Pl+m1xdtZkN4iYiIvsBRfV8EVVj2nd+lW1a3
	C3H+6bds6nkbRnU1ir1QlIMs8fORAZRKoQcHgBuG6l2rteyuX4uk3lCRFbeGzGNLEsWX
	VYtDlan/Th5axqHo1RVzHXiYZaV4eMtffIZSnK1z9ZKTbLv74qjnqqnucyrb9UFwpB8Q
	qA6dTnXTeiaV72hQgDIE2Y1CdfVVF1jv38hlOg4qNNi/VbicomTA+QWkY4hlw16LLJLV
	gE7oFQJNnO6ELqGJwYjEHKHMYZHoc8IWBi0+igpMWSL1qZTtjT+O8P8OuTVlARrv3eQp
	Trzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=knMXwA09iYeaJw6Llkxvonx7f+d92JU+n+Lkj3ipg+U=;
	b=JRooH2N2DWT0SnTEf2sGKenhVyt9WfDM55Ah9K7aZUsu7lhRwsVFRc9Ly5jG6aXx/y
	Y+m42mfLgee3afk8sOQ27ktoXN+GoLJBu2jdKiYcoZqflZra75cH8FBkdH2xBdoHN0xy
	XpiEkQW/Z96eG0XiJL8OL+5GXziU+8gUu1dhykOdyhqG/M8w+okEX81LsYUVyvuetBec
	v7JWgNT88zPAgGfje/Vr3LxGvyPqXRGeUXOECjIx7WZRViWbHdAxdJMKI6eJhf3EYNtV
	OZj+77H2TCFYpLf+eVpAEbCL+QW52e8nbk+WLrAuz0BRdK4zRdi6VTq1ceUGYURHyGhi
	EWCA==
X-Gm-Message-State: APjAAAWe9syy0TI/mcWT0aCqEIAhgkB/qY2UWNYaBRVDj+ARJtQlOJxP
	yZvia4pxsDWsKk3Hf0gIUYYiFXdedoM=
X-Google-Smtp-Source: APXvYqzlO+KRspt1G6naP+T9fRnS13cNFvsX4qTqp2tbJYnVh/om7XVDo0mcJNKK1hB845ziPxNqHQ==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr11387369wmg.101.1551707260671;
	Mon, 04 Mar 2019 05:47:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c202sm5559709wme.38.2019.03.04.05.47.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 05:47:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 13:47:37 +0000
Message-Id: <20190304134737.25240-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pango: fix markup-parse test case
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
X-List-Received-Date: Mon, 04 Mar 2019 13:47:41 -0000

The test case expects that printf(0x0) is (null) but for us this it is (NULL).

Use case-insensitive diff as the rest of the tests don't care about case.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/pango/insensitive-diff.patch             | 28 ++++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/insensitive-diff.patch

diff --git a/meta/recipes-graphics/pango/pango/insensitive-diff.patch b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
new file mode 100644
index 00000000000..faaa96133f9
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
@@ -0,0 +1,28 @@
+Do case-insensitive diffs as the test is sensitive as to whether 0x0 is printed
+as (null) or (NULL).
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/merge_requests/44]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/tests/markup-parse.c b/tests/markup-parse.c
+index 633f3e89..36d2c776 100644
+--- a/tests/markup-parse.c
++++ b/tests/markup-parse.c
+@@ -217,7 +217,7 @@ diff_with_file (const char  *file1,
+                 GString     *string,
+                 GError     **error)
+ {
+-  const char *command[] = { "diff", "-u", file1, NULL, NULL };
++  const char *command[] = { "diff", "-u", "-i", file1, NULL, NULL };
+   char *diff, *tmpfile;
+   int fd;
+ 
+@@ -237,7 +237,7 @@ diff_with_file (const char  *file1,
+       goto done;
+     }
+   close (fd);
+-  command[3] = tmpfile;
++  command[4] = tmpfile;
+ 
+   /* run diff command */
+   g_spawn_sync (NULL, (char **)command, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL, &diff, NULL, NULL, error);
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index e181bcb5005..d3357f82de9 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -16,7 +16,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-"
+            file://insensitive-diff.patch"
+
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-- 
2.11.0


