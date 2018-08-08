Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8F21978E83
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id l9-v6so1315426pff.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YIdtlAsR43qdhJvTofeXDVYyQ59sayB8I7wJkr3JBQ0=;
	b=kd30VfXWCHttvKzZHErvZ7xSZXGvWrh9i24yCVWnZ6CTWar2Jq+wvjJ4QKORhdmrO5
	IcXEBoO97IgzpR72JVto/Zlx8id6aKDf5AOrUy8iGjcIjrZ4cca9fhxX2befmXo3UpGc
	DFEJbP9VSLCugeuo0lXA2XU+aGH62VkmjdsPkHGIwnCgK4/kQCEw+QNe9lAt+xhycP3L
	HbML4ClItEEt+qSF1uVpTI0s81lQf5okFAKhGLUcoBJ3tBKkQrL2uDwYPmKokTlpJ9vW
	gR6vH5szCu6b7Y0RkvQDNQaIMG0QkvX5FSsexUBn77sm4S+LOFXVNIAlXdHeac3syP4J
	9PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YIdtlAsR43qdhJvTofeXDVYyQ59sayB8I7wJkr3JBQ0=;
	b=Tp4pX+1Cf2bWRtI/OYMVappxpfHm8/dHwrzRe77iWPWdwdUc+192jqfX1JJyhGLsEk
	eoMIpUwPU1t+1xBU24UL3GrDET0ab9g6D0Osx2q6pS/tfGKRTiZxYFfL+IKoGWmTBv4S
	JLLWnThsS1b3H3vJ/8tPHIc/6a4xZMv/wScmrlcdPQK4TGtSb/M1F036lARuyKJ1pGzb
	r4lr8DGIgGBJoMFgdHxjKsZki2W4oUF1rFupa5Wo/jcqNRAuQhNo8Qx/kWki29YNfc9e
	o6CK3iSrVCYr+JiftKXwJthWynXn4nlVmX9xW0sybdGbJKIUSCG0qbVahvLOdGgbQObG
	w1YA==
X-Gm-Message-State: AOUpUlFsfrdT94HoD49RnTopgVXqn5s4l8PnaNa9mfp30BgGEO3oHZzB
	EJA2wJ885m+TQd0OTwrb11k=
X-Google-Smtp-Source: AA+uWPwVDh0KrzN18ItVGKD4w+qLNXktouvP4ZJ9pMzpvPwHo45ePMp79J/9Lhenh9H+P+gyFOUmdQ==
X-Received: by 2002:a63:4b5a:: with SMTP id
	k26-v6mr2970048pgl.384.1533742540796; 
	Wed, 08 Aug 2018 08:35:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:12 -0700
Message-Id: <1533742522-24357-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 17/27] binutls: Security fix for CVE-2017-16826
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:40 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16826.patch         | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16826.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 7928de9..d75ec50 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -52,6 +52,7 @@ SRC_URI = "\
      file://CVE-2017-15225.patch \
      file://CVE-2017-15939.patch \
      file://CVE-2017-15996.patch \
+     file://CVE-2017-16826.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16826.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16826.patch
new file mode 100644
index 0000000..bb24ba8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16826.patch
@@ -0,0 +1,53 @@
+From a67d66eb97e7613a38ffe6622d837303b3ecd31d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 1 Nov 2017 15:21:46 +0000
+Subject: [PATCH] Prevent illegal memory accesses when attempting to read
+ excessively large COFF line number tables.
+
+	PR 22376
+	* coffcode.h (coff_slurp_line_table): Check for an excessively
+	large line number count.
+
+Upstream-Status: Backport 
+Affects: <= 2.29.1
+CVE: CVE-2017-16826
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  | 6 ++++++
+ bfd/coffcode.h | 8 ++++++++
+ 2 files changed, 14 insertions(+)
+
+Index: git/bfd/coffcode.h
+===================================================================
+--- git.orig/bfd/coffcode.h
++++ git/bfd/coffcode.h
+@@ -4578,6 +4578,14 @@ coff_slurp_line_table (bfd *abfd, asecti
+ 
+   BFD_ASSERT (asect->lineno == NULL);
+ 
++  if (asect->lineno_count > asect->size)
++    {
++      _bfd_error_handler
++	(_("%B: warning: line number count (%#lx) exceeds section size (%#lx)"),
++	 abfd, (unsigned long) asect->lineno_count, (unsigned long) asect->size);
++      return FALSE;
++    }
++
+   amt = ((bfd_size_type) asect->lineno_count + 1) * sizeof (alent);
+   lineno_cache = (alent *) bfd_alloc (abfd, amt);
+   if (lineno_cache == NULL)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-11-01  Nick Clifton  <nickc@redhat.com>
++ 
++       PR 22376
++       * coffcode.h (coff_slurp_line_table): Check for an excessively
++       large line number count.
++
+ 2017-10-28  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22361
-- 
2.7.4


