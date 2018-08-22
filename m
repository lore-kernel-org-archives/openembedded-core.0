Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE15B7916D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:31 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id b15-v6so2462175oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=crQOOkJHbEWdDwgZedTneCEEk2/QykumuEGRt7ZzHrE=;
	b=wFKpSdxkRNN3ouQQ7QwreB9vCzqSt/Wlqe3nRwJNdyVbuyq9KLyBsEGhZ0o68uos9Y
	woDhFNfN1E7CprU6C8TK9cdbdCmW3F2nroMVNhSyaBXL1BfX4TccPyx3brCedjwSAciS
	7V+jruLa7tm1n1oQwu2BRBED0fWdpZyCQXBW4fGdSkbwltRcz3hc2kFSGUc74k4T+PGC
	4HLq6zWtzbjr9gL2QaSElXI6HW6rEEaWFTNaYr2IC7fy4OWKkq3Nqt4DQbRQvSgn0TNn
	F7UwOG/XnvprFIHEd/CIjaUJkch4tvtenL8GsDsZ+iB3+rmlToWgtTIuTdPBeFEQsIdV
	omvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=crQOOkJHbEWdDwgZedTneCEEk2/QykumuEGRt7ZzHrE=;
	b=jbWpvW/O7KSmMq0aEkqG9hKolSzCtF9CScdcbjwtFiPUuixfLPg+JCnuuuEUN5pG9N
	qdIsink9CPBAi3lyV9LjCAjVWjvjVrLpoVaHK2HvkmbZi6BdZln+qmkFXntfhwFV4of+
	UoAR/uKo7gY8QUafogdusGB/cm34tW0qSNfEi2pVC2QT4VLOlhIP+Foa1gdvtIdjdszQ
	LB7llOJaQ6pANfbD/ciyz5JqoVmyiA6/Jc9//bQBjjCyPmyjvOcY2m0kLQvs+ytPSwQ1
	G7vdGdRRee1N1Bd6VjUZ9SDaD5k7JqsNZ3PsvVngI8Eu+rwg814fuCMtx/jAA+FTCpKk
	jQAw==
X-Gm-Message-State: APzg51DxxmDMHFMJpmaL1pyED9AJd2reFz/gVfb63+wpPHKh+uJIfuP2
	EueeGaMKcP53I6SBsY15pL3jGMpNS+I=
X-Google-Smtp-Source: ANB0Vdad3TRlPZgFASOJU4vPdPWxGyACmzx1fezbKgFLZD4LTNApYx7yeGlEOUxVfSBxIxMkZ+OIeg==
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr3645809oif.10.1534936772792; 
	Wed, 22 Aug 2018 04:19:32 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:32 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:07 +0530
Message-Id: <1534936692-11736-29-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 29/34] wget: CVE-2018-0494
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:32 -0000

Fix cookie injection (CVE-2018-0494)
* src/http.c (resp_new): Replace \r\n by space in continuation lines

Fixes #53763
 "Malicious website can write arbitrary cookie entries to cookie jar"

HTTP header parsing left the \r\n from continuation line intact.
The Set-Cookie code didn't check and could be tricked to write
\r\n into the cookie jar, allowing a server to generate cookies at will.

Affects wget < 1.19.5

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../0001-Fix-cookie-injection-CVE-2018-0494.patch  | 68 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.1.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0001-Fix-cookie-injection-CVE-2018-0494.patch

diff --git a/meta/recipes-extended/wget/wget/0001-Fix-cookie-injection-CVE-2018-0494.patch b/meta/recipes-extended/wget/wget/0001-Fix-cookie-injection-CVE-2018-0494.patch
new file mode 100644
index 0000000..ac163e6
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/0001-Fix-cookie-injection-CVE-2018-0494.patch
@@ -0,0 +1,68 @@
+From 1fc9c95ec144499e69dc8ec76dbe07799d7d82cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Fri, 27 Apr 2018 10:41:56 +0200
+Subject: [PATCH] Fix cookie injection (CVE-2018-0494)
+
+* src/http.c (resp_new): Replace \r\n by space in continuation lines
+
+Fixes #53763
+ "Malicious website can write arbitrary cookie entries to cookie jar"
+
+HTTP header parsing left the \r\n from continuation line intact.
+The Set-Cookie code didn't check and could be tricked to write
+\r\n into the cookie jar, allowing a server to generate cookies at will.
+
+CVE: CVE-2018-0494
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/commit/?id=1fc9c95ec144499e69dc8ec76dbe07799d7d82cd]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/http.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index c8960f11..77bdbbed 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -613,9 +613,9 @@ struct response {
+    resp_header_*.  */
+ 
+ static struct response *
+-resp_new (const char *head)
++resp_new (char *head)
+ {
+-  const char *hdr;
++  char *hdr;
+   int count, size;
+ 
+   struct response *resp = xnew0 (struct response);
+@@ -644,15 +644,23 @@ resp_new (const char *head)
+         break;
+ 
+       /* Find the end of HDR, including continuations. */
+-      do
++      for (;;)
+         {
+-          const char *end = strchr (hdr, '\n');
++          char *end = strchr (hdr, '\n');
++
+           if (end)
+             hdr = end + 1;
+           else
+             hdr += strlen (hdr);
++
++          if (*hdr != ' ' && *hdr != '\t')
++            break;
++
++          // continuation, transform \r and \n into spaces
++          *end = ' ';
++          if (end > head && end[-1] == '\r')
++            end[-1] = ' ';
+         }
+-      while (*hdr == ' ' || *hdr == '\t');
+     }
+   DO_REALLOC (resp->headers, size, count + 1, const char *);
+   resp->headers[count] = NULL;
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/wget/wget_1.19.1.bb b/meta/recipes-extended/wget/wget_1.19.1.bb
index 78bde95..3c484ce 100644
--- a/meta/recipes-extended/wget/wget_1.19.1.bb
+++ b/meta/recipes-extended/wget/wget_1.19.1.bb
@@ -1,6 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://CVE-2017-6508.patch \
+           file://0001-Fix-cookie-injection-CVE-2018-0494.patch \
           "
 
 SRC_URI[md5sum] = "87cea36b7161fd43e3fd51a4e8b89689"
-- 
2.7.4


