Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B6BFE76988
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:15:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so280204wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HUzfi+OUG1SGNgJMfZEmoN4kegSnymR83/fjfS8w68U=;
	b=bU4EJFbxL2v6IcOQ/+av+VMo+l6tVQSpuqavfKigBsO4E7WlnWWnEAHAqK/RBC3VWu
	i2oqii+FNyqIQD3qHrjYTZ2NPsfx/nwwvjCtoF1stEkndFu68yyo1yRESFYW5uZLYFtG
	+xx3AzuAfFtBXOjtslOg6L4VoBFao52UhOAZsEhMRjUfKuDi/xEwcf7UyMHR1jQz84Fr
	rA/oQbW6Xbur29ZiECb+KbzzrcJoKa2xyo2bTVqFrHdVmEB8i2CuFzF5MHFyKf2/GbwQ
	NL+bT3a0DHmR/N1RABrQUv6NuJLN4HBDgJ3zuCt5X/lyCfhkaC1EKTWoBJVrOMPLt/fg
	kOkA==
X-Gm-Message-State: AEkooutu50ARXQJvaAcZFFYPAEXMJY6IHVHPxkx/Xj7wQfCVMbprc0yZzPekKMvK77R4uA==
X-Received: by 10.194.238.42 with SMTP id vh10mr3081741wjc.111.1471536905281; 
	Thu, 18 Aug 2016 09:15:05 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	al10sm2921327wjc.12.2016.08.18.09.15.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:15:03 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 17:15:00 +0100
Message-Id: <20160818161503.20738-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/4] gettext_0.16.1: use musl gettext implementation
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
X-List-Received-Date: Thu, 18 Aug 2016 16:15:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gettext uses internal symbols to detect whether the
implementation is compatible with GNU gettext. However,
these symbols don't are not part of the public API, they
are specific to glibc.

While musl implements the GNU gettext *API* version 1 and 2
  http://www.openwall.com/lists/musl/2015/04/16/3
it doesn't implement glibc internals. This means that
gettext fails to detect musl's working implementation.

More recent versions of gettext have changed the way
GNU gettext compatibility is done
  https://lists.gnu.org/archive/html/bug-gettext/2016-04/msg00000.html
  http://git.savannah.gnu.org/cgit/gettext.git/commit/gettext-runtime/m4/gettext.m4?id=b67399b40bc5bf3165b09e6a095ec941d4b30a97
and while we could backport the corresponding patch to
gettext.m4, we avoid doing that so as to avoid any
potential GPL-v3 issues.

So instead we force ./configure to assume that the gettext
implementation of the c-library (musl) is compatible.

As a side-effect, this also reduces image sizes as the
internal gettext implementation isn't built anymore, and
it's otherwise packaged into the main gettext package
which blows up the image as the main gettext package
contains a lot of things.

Similarly, libintl.h isn't generated anymore, as the one
from musl is OK.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 8b6f0a7..5a58578 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -31,6 +31,11 @@ PARALLEL_MAKE = ""
 inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lisp --disable-csharp --disable-openmp --without-emacs"
+EXTRA_OECONF_append_libc-musl = "\
+                                 gt_cv_func_gnugettext1_libc=yes \
+                                 gt_cv_func_gnugettext2_libc=yes \
+                                "
+
 acpaths = '-I ${S}/autoconf-lib-link/m4/ \
            -I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
@@ -41,7 +46,6 @@ do_configure_prepend() {
 
 do_install_append_libc-musl () {
 	rm -f ${D}${libdir}/charset.alias
-	rm -f ${D}${includedir}/libintl.h
 }
 
 # these lack the .x behind the .so, but shouldn't be in the -dev package
-- 
2.9.3


