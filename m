Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A09BC04FDF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7537.1687850372228599749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110616501"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110616501"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 36E94D29E1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57C41D5015
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2DB86C833;
	Tue, 27 Jun 2023 16:19:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] gettext: upgrade 0.21.1 -> 0.22
Date: Tue, 27 Jun 2023 15:17:12 +0800
Message-Id: <1687850250-20040-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--16.881300-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yUIIxwDaU5mr4y6x6rwIkstXy2/vm0e6zqc6
	YGzj/s7U+4Z5cw7zsYUcybdSvZSgLK9LXqtHL0cwpVHcGuG9SAg+B+IaKi3iSV7OD7o3T6pzClM
	NkcTVd4FSxTaXxnjZ4rTgydUvVSSzCGrFz5XLS3Sz8d6zvo5NkGhADSmwSTddL31P64kiV5G7Al
	zDQluRGxAqzqmZMGTI4XaIt/U/b23O+bXN3tyGOOOnF2j8nBWbRpgtqnD1BD7VbZFdXapsKSO3J
	80qWMSD1jypNY0wtaYScHHX0rLXBNFMBnmJRh/JOjf3A4DTYuExVUWGXs3C88wHSQ+yXjTDsJXK
	+SZDNwl/3OsBjcxq0+pe9co8GDkGbRev5+PfDD/EtKyL0UoBPcE5XPQnBzGX+rNJicjlVL2em2v
	w+cenKeLzNWBegCW2xl8lw85EaVQLbigRnpKlKT4yqD4LKu3A
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183456

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* PO file format:
  - When a #: line contains references to file names that contain spaces,
    these file names are surrounded by Unicode characters U+2068 and U+2069.
    This makes it possible to parse such references correctly.

* Improvements for maintainers:
  - The AM_GNU_GETTEXT macro now defines two variables localedir_c and
    localedir_c_make, that can be used in C code or in Makefiles,
    respectively, for representing the value of the --localedir configure
    option.

* Programming languages support:
  - C, C++:
    o xgettext now supports gettext-like functions that take wide strings
      (of type 'const wchar_t *', 'const char16_t *', or 'const char32_t *')
      as arguments.
    o xgettext now recognizes numbers with digit separators, as defined by
      ISO C 23, as tokens.
    o xgettext and msgfmt now recognize the format string directive %b
      (for binary integer output, as defined by ISO C 23) in format strings.
    o xgettext and msgfmt now recognize the argument size specifiers
      w8, w16, w32, w64, wf8, wf16, wf32, wf64 (as defined by ISO C 23)
      in format strings.
    o xgettext and msgfmt now recognize C++ format strings, as defined by
      ISO C++ 20.  They are marked as 'c++-format' in POT and PO files.
      A new example has been added, 'hello-c++20', that illustrates how
      to use these format strings with gettext.
  - Java:
    o The build system and tools now also support Java versions newer than
      Java 11. This is known to work up to Java 20, at least. On the other
      hand, support for old versions of Java (Java 1.5 and GCJ) has been
      dropped.
  - Tcl: xgettext now supports the \x, \u, and \U escapes as defined in
    Tcl 8.6.

* Portability:
  - On systems with musl libc, the *gettext() functions in libc now work
    with MO files generated from PO files with an encoding other than UTF-8.
    To this effect, the msgfmt program now converts the messages to UTF-8
    encoding before storing them in a MO file.  You can prevent this by
    using the msgfmt --no-convert option.
  - On systems with musl libc, the *gettext() functions in libc now work
    with MO files generated from PO files with ISO C 99 <inttypes.h> format
    string directive macros.  To this effect, the msgfmt program pre-expands
    strings with such macros.  You can prevent this by using the msgfmt
    --no-redundancy option.

* xgettext:
  - The xgettext option '--sorted-output' is now deprecated.
  - xgettext input files of type PO that are not all ASCII and not UTF-8
    encoded are now handled correctly.

* The base Unicode standard is now updated to 15.0.0.

* Emacs PO mode:
  Fix an incompatibility with Emacs version 29 or newer.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-init-env.in-do-not-add-C-CXX-parameters.patch          | 0
 .../0001-tests-autopoint-3-unset-MAKEFLAGS.patch                | 0
 .../gettext/{gettext-0.21.1 => gettext-0.22}/parallel.patch     | 0
 .../gettext/{gettext-0.21.1 => gettext-0.22}/run-ptest          | 0
 .../{gettext-0.21.1 => gettext-0.22}/serial-tests-config.patch  | 0
 .../{gettext-0.21.1 => gettext-0.22}/use-pkgconfig.patch        | 0
 .../{gettext-minimal-0.21.1 => gettext-minimal-0.22}/COPYING    | 0
 .../Makefile.in.in                                              | 0
 .../aclocal/gettext.m4                                          | 0
 .../aclocal/host-cpu-c-abi.m4                                   | 0
 .../aclocal/iconv.m4                                            | 0
 .../aclocal/intlmacosx.m4                                       | 0
 .../aclocal/lib-ld.m4                                           | 0
 .../aclocal/lib-link.m4                                         | 0
 .../aclocal/lib-prefix.m4                                       | 0
 .../aclocal/nls.m4                                              | 0
 .../aclocal/po.m4                                               | 0
 .../aclocal/progtest.m4                                         | 0
 .../config.rpath                                                | 0
 .../remove-potcdate.sin                                         | 0
 ...-minimal-native_0.21.1.bb => gettext-minimal-native_0.22.bb} | 0
 .../recipes-core/gettext/{gettext_0.21.1.bb => gettext_0.22.bb} | 2 +-
 22 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext-0.22}/use-pkgconfig.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/Makefile.in.in (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/gettext.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/host-cpu-c-abi.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/iconv.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/intlmacosx.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/lib-ld.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/lib-link.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/lib-prefix.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/nls.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/po.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/aclocal/progtest.m4 (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/config.rpath (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal-0.22}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb => gettext-minimal-native_0.22.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.21.1.bb => gettext_0.22.bb} (99%)

diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.22/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext-0.22/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.22/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext-0.22/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.22/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.22/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest b/meta/recipes-core/gettext/gettext-0.22/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest
rename to meta/recipes-core/gettext/gettext-0.22/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.22/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext-0.22/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext-0.22/use-pkgconfig.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext-0.22/use-pkgconfig.patch
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.22/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.22/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.22/Makefile.in.in
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.22/Makefile.in.in
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/gettext.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/gettext.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/gettext.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/host-cpu-c-abi.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/host-cpu-c-abi.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/host-cpu-c-abi.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/iconv.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/iconv.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/iconv.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/intlmacosx.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/intlmacosx.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/intlmacosx.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-ld.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-ld.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-ld.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-link.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-link.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-link.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-prefix.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/lib-prefix.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/lib-prefix.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/nls.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/nls.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/nls.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/po.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/po.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/po.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/progtest.m4
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/aclocal/progtest.m4
rename to meta/recipes-core/gettext/gettext-minimal-0.22/aclocal/progtest.m4
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.22/config.rpath
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.22/config.rpath
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.22/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.22/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-core/gettext/gettext_0.22.bb
similarity index 99%
rename from meta/recipes-core/gettext/gettext_0.21.1.bb
rename to meta/recipes-core/gettext/gettext_0.22.bb
index b80ea9276e..f633312231 100644
--- a/meta/recipes-core/gettext/gettext_0.21.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.bb
@@ -30,7 +30,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            "
-SRC_URI[sha256sum] = "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45"
+SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
 
 inherit autotools texinfo pkgconfig ptest
 
-- 
2.34.1


