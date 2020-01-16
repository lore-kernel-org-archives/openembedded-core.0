Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF9867F8D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:46:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q127so9259433pga.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BUXjZpiNeRfLynGzyFxjAxQO/hlOBCYVaLqKe1IwO9o=;
	b=QebOOOrwuEe9FWf4yZQZl1J4Hion7sPfFLSBTgOC7Rde5z6NbIWEuJcPtehdiB5YjZ
	mAr3v1A+jIowiBr848alJOm3zF1JFsWzYKqbKz7ubkweTXtP/D2rkBrfFdpqY7kbIfaF
	NpWSm187t8k7kG8btNzcPA2xxrGd/G98xEnsfNF+5Cppd9GnDEs2yptJhXalCYwOmCin
	27gmwkHEdh6Sb0ejzgW1C+0embZOQn0tzEv4FiGqY+5cUNSS8DFRXj8IR0cHTG4D7Qv8
	hv2OX4PHgG/k5PsmCnKrOzWID9ZuqsyNTuV1uy6rEJ67tEWdci0S/B81qVgNGiRBqIja
	3PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BUXjZpiNeRfLynGzyFxjAxQO/hlOBCYVaLqKe1IwO9o=;
	b=Zi+BZKYgN4Z6Sv4F+JKqyzWsk2ut99w1JEG4hArGKpCxyWPnZllMflvsHNDjeu6FAp
	8WV9+JtVLrqYLp8svBDXw5+hPbAQhMY3q+E0TFuKjujRq2TgyN3VXn93w1sWgxNUWISO
	wqgX8b0ybBzvheDnOyvnw+D5DLQZKnX43p3DbvxQWqoRCGDvDK2+nUUqp+HEh90gTGP/
	N+k5FgtnEkxA1sfE1A0bQ5qr11XOwdK21+suuhs6VMVq6GIurz3XzMdOO7gV0yJTgwsu
	GepU/CXPdVr57j1OHMPhWXwktYbKvLcylP3O0BjNJ/bt9J/2yusvdFrnIiQSbu2cDQmk
	OlSQ==
X-Gm-Message-State: APjAAAUMRtbRtqUiuWSF6v2Qhbu9JxV/FVpsFVoIJ4i7iWzJmUrfg3iF
	HYVxkCIxeN2hkd3yfyUa//ERTugEYhg=
X-Google-Smtp-Source: APXvYqz52ZMvzy+kSl4kY1Md07OkJY+59PSy/aP+/YzeJgIXlUIIspfzDgJ1A849mFQ2H1ZdO/i1yA==
X-Received: by 2002:a65:6216:: with SMTP id d22mr37025995pgv.437.1579149970639;
	Wed, 15 Jan 2020 20:46:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	z11sm24500299pfk.96.2020.01.15.20.46.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:46:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:46:09 -0800
Message-Id: <20200116044609.3902260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Thu, 16 Jan 2020 04:46:10 -0000
Content-Transfer-Encoding: 8bit

Clang detects that getcwd is being re-declared and signatures don't
match, simple solution is to let clang use overloadable attribute

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gettext/gettext-0.20.1/overloadable.patch | 22 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch b/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
new file mode 100644
index 0000000000..1b41cb464e
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
@@ -0,0 +1,22 @@
+Use overloadable attribute to aid clang
+
+Fixes
+dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/gettext-runtime/intl/dcigettext.c
++++ b/gettext-runtime/intl/dcigettext.c
+@@ -144,7 +144,11 @@ char *getwd ();
+ #  if VMS
+ #   define getcwd(buf, max) (getcwd) (buf, max, 0)
+ #  else
+-char *getcwd ();
++char 
++#ifdef __clang__
++__attribute__((overloadable))
++#endif
++*getcwd ();
+ #  endif
+ # endif
+ # ifndef HAVE_STPCPY
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index 09628bc4a3..3b576f45e9 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://serial-tests-config.patch \
            file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
+           file://overloadable.patch \
            "
 
 SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
-- 
2.25.0


