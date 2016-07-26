Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD76606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:26:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so2214952wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 08:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=avEZr687JANbuEmANoivVq8C+KQ3gMDmjfBHH3YD1IA=;
	b=CDwhBj0qXwQqJBtZsaNvI9wODasbAVz+jj2iigICXidXRjwEK9aatYRFtkRCoIFDRz
	QdCx9/fu2NGYipa/gQ+TyEQRJue0in9cJTzuaLicF3DLLukvDG4dXgrxFymL3FJNHUh9
	n2tCU2z9JQDXgIeo1HDqlYvohvcRKBss4zs6xVF1UPzsmI5pTh3CTzHVlYCcGpkNAVP1
	XJhGGy3yUTCVqM/uq8OCv42AV+fda2a0f0eB2FGm4panLpjv9Z7472hINH5Km3nki9ej
	UrnCu33AiZroOtG+hbirEbUo1iYGbOvfQ5KaGj2DgxmQNXhatsUQoGlRe5GYm2hgDzFW
	q59Q==
X-Gm-Message-State: AEkoouuZU1i/TEfCAWB6YdPB+wkCWC0C5FuZzmmtgn2XN9OUcOMbe2FSmoKwYE11neIzrA==
X-Received: by 10.28.45.69 with SMTP id t66mr24078160wmt.41.1469546792746;
	Tue, 26 Jul 2016 08:26:32 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id kc6sm1564266wjb.3.2016.07.26.08.26.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 08:26:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:26:30 +0100
Message-Id: <1469546790-24621-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] bash: add patch to build w/ -Wformat-security
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
X-List-Received-Date: Tue, 26 Jul 2016 15:26:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 ...1-help-fix-printf-format-security-warning.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch

diff --git a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
new file mode 100644
index 0000000..5405c84
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
@@ -0,0 +1,35 @@
+From e5837a42f8f48a6a721805ff8f7fcd32861d09ca Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Tue, 26 Jul 2016 13:09:47 +0100
+Subject: [PATCH] help: fix printf() format security warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def: In function 'help_builtin':
+| ../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def:130:7: error: format not a string literal and no format arguments [-Werror=format-security]
+|        printf (ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
+|        ^~~~~~
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Pending
+ builtins/help.def | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builtins/help.def b/builtins/help.def
+index 1894f17..cf624c6 100644
+--- a/builtins/help.def
++++ b/builtins/help.def
+@@ -127,7 +127,7 @@ help_builtin (list)
+ 
+   if (glob_pattern_p (list->word->word))
+     {
+-      printf (ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
++      printf ("%s", ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
+       print_word_list (list, ", ");
+       printf ("'\n\n");
+     }
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 95ed392..16a3139 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
 	   file://fix-run-builtins.patch \
+           file://0001-help-fix-printf-format-security-warning.patch \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
2.8.1


