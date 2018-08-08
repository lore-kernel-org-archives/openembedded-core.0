Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id A9AE078E39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:36 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id e13-v6so1318451pff.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Z5j4hpDb+OSEXDXtoD5OfcazC4t19nFe3LRABR3Eiss=;
	b=cEAyahP/uiXLCEILquOBN7a+fp9oLCoCun9ijBTBw36SSMU8c7KcSXmDJF1xL06SpT
	M1I7rnjK4fMNq6sPYenFjQrVxYB0Ol6l2kgVAUY8FjZW5zP4G29j8b1IU1gKDlNujEim
	u8MfMmttzfedV3uorw8F2ygX6j9JcSB6Hb7S50C3Z3AC/si1Ec9egweYcjs7jnNxh7/1
	F1fCyrj2C1i+ueT5RUqeEz2rvYhUTaEIt2EM2Zv6H7ULodkZ7ncl8xXHtwgOnwUAir08
	r51YR9gwux7h3nRjKz91zAofSTDxRSq4hhlFLGFlrX7epDHy0/+41/F12+e5PKcPJeCn
	+C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Z5j4hpDb+OSEXDXtoD5OfcazC4t19nFe3LRABR3Eiss=;
	b=EybS2Lsv+c7tq1lzRQqSPGdh7t/IbmtYDaeJ4RyTZ74f0JMS5hS4HizIlFmgl8cJDr
	v/yqiyOp/GE+CJhUCxQxdeBid3fxQDEDFmP3DJYvHLqTOCIuxoittT+9TeuFDo1aU2hC
	vsgYay5VdM7vHSOP0EavexN2H4uPLfBG1q41GvOx90oJk+DItO6TEToBG0PFKF9Uo+p6
	EmecwnRvWvDLnW6L5nQXHr/8pUgRMJFGQ0rJNiCMq7fo1iUGc3BLcY8o39SbwPUs3K33
	QZY9cqZnTR19vBbPzYlFl/AH63EhzsAS0WfM1m8L76TAXx/ZmEc3nbRAwiNiXx+CDGU1
	JrRw==
X-Gm-Message-State: AOUpUlGTxtLLhb+ktQQsJpPdK5Lmgxo/8lEoFXBe217lqk+oGuH8bywe
	lFwkGsF7P39WlZcuQ5l7R0sGu8hb
X-Google-Smtp-Source: AA+uWPxSkBpBcbczzBDE3W4ayUvankBPnraPYDzsCZJ8hqmw/QqHzm/87K9QbATmHbXoreLzL1wGkg==
X-Received: by 2002:a63:f043:: with SMTP id s3-v6mr2923905pgj.94.1533742537874;
	Wed, 08 Aug 2018 08:35:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:09 -0700
Message-Id: <1533742522-24357-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 14/27] binutls: Security fix for CVE-2017-15225
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:36 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15225.patch         | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 8bd880c..1983d85 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -49,6 +49,7 @@ SRC_URI = "\
      file://CVE-2017-15023.patch \
      file://CVE-2017-15024.patch \
      file://CVE-2017-15025.patch \
+     file://CVE-2017-15225.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15225.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15225.patch
new file mode 100644
index 0000000..2ef3f53
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15225.patch
@@ -0,0 +1,48 @@
+From b55ec8b676ed05d93ee49d6c79ae0403616c4fb0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 9 Oct 2017 13:21:44 +1030
+Subject: [PATCH] PR22212, memory leak in nm
+
+	PR 22212
+	* dwarf2.c (_bfd_dwarf2_cleanup_debug_info): Free
+	funcinfo_hash_table and varinfo_hash_table.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15225
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/dwarf2.c  | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -4932,6 +4932,10 @@ _bfd_dwarf2_cleanup_debug_info (bfd *abf
+ 	}
+     }
+ 
++  if (stash->funcinfo_hash_table)
++    bfd_hash_table_free (&stash->funcinfo_hash_table->base);
++  if (stash->varinfo_hash_table)
++    bfd_hash_table_free (&stash->varinfo_hash_table->base);
+   if (stash->dwarf_abbrev_buffer)
+     free (stash->dwarf_abbrev_buffer);
+   if (stash->dwarf_line_buffer)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-09  Alan Modra  <amodra@gmail.com>
++
++       PR 22212
++       * dwarf2.c (_bfd_dwarf2_cleanup_debug_info): Free
++       funcinfo_hash_table and varinfo_hash_table.
++
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22186
-- 
2.7.4


