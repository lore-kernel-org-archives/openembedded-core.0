Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57B887EB63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 21:48:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v14so3973142wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YBvtzh+9Dfj16meNBs7AaQfn9kMKhSXfpwCmWnI+2SI=;
	b=QzqQgMW8PoURe8DeN9V94mtL8jbeIkHhq/nHI6HXYSoI/nTx1YDnNby89s+ApPyIJa
	sk2SL3OweeUJyYP3GpaQbrk9pVkz9rMi8OAcnmX4u4jX2Tcx0Dw8oKLfveIN8ZhjKP/U
	jPSiyVUsXGvOd6xy7IQ4LYLYLWwgHEGLorTOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YBvtzh+9Dfj16meNBs7AaQfn9kMKhSXfpwCmWnI+2SI=;
	b=MDWNIyQvVqNQg43poyX+Aks9hdUozPHF5a9s+1P4RUCzZa9/Uz/B2GA4iktYsclJuI
	Kp+DYUuY3lT2N4mPWFkVhg0fkeo3/djB9nKcLcemjGDIzHTl0rAHm3BzpwaTZy9CQL9B
	F6zask9ZBpYThFG0MFzDmKgquu+uTbQm2iutqXaaU1NIhPaDuqyge2LUNkEoKUjjrXzQ
	0h4QyAhs4r3lTJZ/6nUo+Xgbfec+btXrX6eknQudVrDoPcPTgwC4rwmXT1iowFXq8gEb
	WVGgtDevJKK9MWmV+QIpVfnts9I8Lpe3FzgbhBRAIEuaRVDA4qRpVqgUOI7Y3hBT10nv
	kBiA==
X-Gm-Message-State: APjAAAUMJAX7+bl/oXZGplCi2Wu2y7bUBuSyd09JQlP1OmJwCeg0PQhL
	IRdV+mVyjXmk076crZ4FXgZmvYBjrTM=
X-Google-Smtp-Source: APXvYqx1TLVyzsRRZbg/IX5Wk2DEuNMjc45H7No9jH5u5RcxGvUOF5Kzx/lDRegZpF99evUTYB4moA==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr56440640wrq.331.1560548880587;
	Fri, 14 Jun 2019 14:48:00 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c2sm4656610wrf.75.2019.06.14.14.47.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 14:47:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 22:47:58 +0100
Message-Id: <20190614214758.26406-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perl: Fix setgroup call regression from 5.30
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
X-List-Received-Date: Fri, 14 Jun 2019 21:48:00 -0000
Content-Transfer-Encoding: 8bit

The upgrade from 5.28 to 5.30 caused acl's ptests to fail. The issue is
that the new function changes the endptr to the end of the scanned number
and this now needs to be reset to the end of the string for each iteration
of the loop.

[YOCTO #13391]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../perl-sanity/files/fix-setgroup.patch      | 49 +++++++++++++++++++
 .../perl-sanity/perl_5.30.0.bb                |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch

diff --git a/meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch b/meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch
new file mode 100644
index 00000000000..2b490e60676
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch
@@ -0,0 +1,49 @@
+Test script to reproduce the problem:
+
+#!/usr/bin/env perl
+$) = "2 2";
+print $!;
+
+Result from perl 5.28 under strace:
+
+setgroups(1, [2])                       = 0
+setresgid(-1, 2, -1)                    = 0
+
+Result from perl 5.30 under strace:
+
+setgroups(1, [-1])                      = -1 EINVAL (Invalid argument)
+setresgid(-1, 2, -1)                    = 0
+
+Patch which broke this upstream:
+https://perl5.git.perl.org/perl.git/commitdiff/5d4a52b5c68a11bfc97c2e24806993b84a61eade
+
+Issue is that the new function changes the endptr to the end of the
+scanned number and needs to be reset to the end of the string for 
+each iteration of the loop.
+
+[YOCTO #13391]
+
+RP
+2019/6/14
+Upstream-Status: Pending
+
+Index: perl-5.30.0/mg.c
+===================================================================
+--- perl-5.30.0.orig/mg.c
++++ perl-5.30.0/mg.c
+@@ -3179,6 +3256,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
+ 	    const char *p = SvPV_const(sv, len);
+             Groups_t *gary = NULL;
+             const char* endptr = p + len;
++            const char* realend = p + len;
+             UV uv;
+ #ifdef _SC_NGROUPS_MAX
+            int maxgrp = sysconf(_SC_NGROUPS_MAX);
+@@ -3209,6 +3287,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
+                     Newx(gary, i + 1, Groups_t);
+                 else
+                     Renew(gary, i + 1, Groups_t);
++                endptr = realend;
+                 if (grok_atoUV(p, &uv, &endptr))
+                     gary[i] = (Groups_t)uv;
+                 else {
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb b/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
index 90a8a035ce6..b18a6b69131 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
+           file://fix-setgroup.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.20.1


