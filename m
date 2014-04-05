Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AACB60C02
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 02:14:26 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so3653679ykr.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GQdnZz3xkRfnfc90p1ZOmKkY2+5FvXEFg9hnImIRmfw=;
	b=Eg38pUunmrh+OK5JBisY5Kj2k9a4yQM0oETTxeTb3XxN79sqLJK7DkGJuWZTTu9cce
	g65l5DsHOrN8gJEmZ9oXpPBlg+IHQ39hX82Bm820uY6mYeLseeWQXoJw8LDk6xRuQtji
	FdNghFMAdQymRcCF2VVg9xjT3jIRRMYV8ZpmaPKz9uz8EJpGK6qfg3/Jv0r2aXm6SWpg
	GGmnI2hKUCVQpUbtVmVhurMkcmNzRS1EG/Z9qZpD1sYJkmP5M4Muoioaa6yoGdAQMGOo
	uiubOEo2OyM76SRcDjH/fvkevXk+S0ZuI9vxGV2kqUiudCh2JBMoKejnJy3ZZH7ndSBH
	ag9Q==
X-Received: by 10.236.128.47 with SMTP id e35mr895184yhi.96.1396664067905;
	Fri, 04 Apr 2014 19:14:27 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id n5sm18173596yhn.43.2014.04.04.19.14.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 19:14:27 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 23:14:10 -0300
Message-Id: <1396664051-11430-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
References: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 2/3] wic: add find_artifact() to get a specific bitbake variable
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
X-List-Received-Date: Sat, 05 Apr 2014 02:14:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This helper is used by source plugins to get specific bitbake
variable.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/utils/oe/misc.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 5436a0a..16c250a 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -142,6 +142,20 @@ def find_bitbake_env_lines(image_name):
 
     return bitbake_env_lines
 
+def find_artifact(bitbake_env_lines, variable):
+    """
+    Gather the build artifact for the current image (the image_name
+    e.g. core-image-minimal) for the current MACHINE set in local.conf
+    """
+    retval = ""
+
+    for line in bitbake_env_lines.split('\n'):
+        if (get_line_val(line, variable)):
+            retval = get_line_val(line, variable)
+            break
+
+    return retval
+
 def get_line_val(line, key):
     """
     Extract the value from the VAR="val" string
-- 
1.8.3.2


