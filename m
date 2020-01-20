Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3607FCFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:52:29 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id bg7so86290pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BUXjZpiNeRfLynGzyFxjAxQO/hlOBCYVaLqKe1IwO9o=;
	b=QbUKp685lS/+F1B9rcKz0zgKGVxk21Ebwa9hvTAEeFIwBxbaNwvM59mCRMzUHByyVX
	jb+6BayTK0jULRZOWH54m1i9oT43tq5am3ZDhyangCEHI4eL7Wh1rPHdLHuq34rTAdxX
	kPwU8Sd8ge472VrGsaRpQi2+O/Mv5IHKSb4kTiIbaE4fgybBsTrO5XWGuX3D8bi618y/
	a5Z+5zQ5r//r4bIUgDDWHj0ik06ddaqrqO3ERx662Kv8sVadpkuESqjkr+0NMSinG0Nl
	PcX72IklV0bsFQ9wUErUZ/TviUDqfcoZztM/5i9uFPFzWZsCcM/ITVhz07rfu2GZgowV
	htYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BUXjZpiNeRfLynGzyFxjAxQO/hlOBCYVaLqKe1IwO9o=;
	b=geaLiKRKvTyIq3uZ3cVmGGI2tY3CAfxGzXL1hDNY48r1Gd9AlBmqk8LcaTNiuORiyE
	rNVYia6RvacLdw2c9WiaE/TONMJ7IzI9l6bS3+YMu7sZ6f//uXPV+8xSKLr6NsPJAepo
	hMzj4sTXuoswibg9pNhjO5dXJOZUqLP2O/iAr7gG9wv0Uo2GwGdaz0tXeuDH5gDWskJC
	pLpC4q3CJ6jd9DBn+tMnCv73nNBGt++jgsDJmyOtKyJyQRQzPThYSskktl58aapDiANQ
	Dka55dMTLhfQVqb4TtasFfSivhB2Nr891DugGfMEfJFp4bUCL/CnLtbIO9bkd9p/41yf
	xbiA==
X-Gm-Message-State: APjAAAU55hOt8ZUiIfvqpslw9bVJaSxc8YbipU+aLajEOaNzB4/c7F0b
	JS3xb9LqgMgQC11ntzhAYKoQnVmKpZc=
X-Google-Smtp-Source: APXvYqz68AHA0zYPis47ArtZnzBFJDeCk/cM0rnWX2LFxcLDcHK81dPUoX9rHm6xpGgZW/fbE+Ydyg==
X-Received: by 2002:a17:902:341:: with SMTP id 59mr936354pld.29.1579542749019; 
	Mon, 20 Jan 2020 09:52:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	68sm38159422pge.14.2020.01.20.09.52.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:52:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:52:26 -0800
Message-Id: <2e52f93d5fd83945402c43befc44d22303badb24.1579542573.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579542573.git.raj.khem@gmail.com>
References: <cover.1579542573.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Mon, 20 Jan 2020 17:52:29 -0000
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


