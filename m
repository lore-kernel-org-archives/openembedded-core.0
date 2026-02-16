Return-Path: <tonyb@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371C5E81A45
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 16:40:54 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [72.215.153.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23959.1771260048188010877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 08:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=N6BpjB1h;
 spf=pass (domain: cybernetics.com, ip: 72.215.153.18, mailfrom: tonyb@cybernetics.com)
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id S7p0xYkw7XTHrirB for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 11:40:46 -0500 (EST)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=1d/3kcuLn6ucdygNmMQtxQOdFeaD7MLaQHigIueMSPA=;
	h=Content-Transfer-Encoding:Content-Type:To:Subject:From:Content-Language:
	MIME-Version:Date:Message-ID; b=N6BpjB1hI7f81iQWPnSJN5nFr+0qGq72ArznHbIu2sV8D
	HJX0GFadovzZ9wGo4wwdIxEwsR7KnAMb8RCM17+uYyyaektf18wYQAhUizhag8AEqAt5VyfoZD9n9
	N7O8UfNndp3nDUcIa4zkBII2f5U4dQp7yd99Vto9QOizcuFJk=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate SPEC SMTP 8.0.5)
  with ESMTPS id 14404144 for openembedded-core@lists.openembedded.org; Mon, 16 Feb 2026 11:40:46 -0500
Message-ID: <cd8dabb4-fc3b-426e-8dea-c8c83e87f3f4@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Mon, 16 Feb 2026 11:40:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tony Battersby <tonyb@cybernetics.com>
Subject: [PATCH v2] texinfo: Fix gcc 15 compile errors
To: openembedded-core@lists.openembedded.org
X-ASG-Orig-Subj: [PATCH v2] texinfo: Fix gcc 15 compile errors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1771260046
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 3250
X-ASG-Debug-ID: 1771260046-1cf439285027de90001-7zcVdP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 16:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231216

gcc 15 switches the default from -std=gnu17 to -std=gnu23, which causes
multiple errors compiling texinfo:

texinfo-7.2/info/terminal.c:164:7:
  error: too many arguments to function 'tputs'; expected 0, have 3
etc.

My patch to fix the issue has been accepted upstream; backport it since
texinfo 7.2 is still the latest release.

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---

This needs to be applied to openembedded-core master and backported to
whinlatter.


 ...l.c-use-modern-prototypes-for-curses.patch | 35 +++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_7.2.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-use-modern-prototypes-for-curses.patch

diff --git a/meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-use-modern-prototypes-for-curses.patch b/meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-use-modern-prototypes-for-curses.patch
new file mode 100644
index 0000000000..4af4a0eb51
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-use-modern-prototypes-for-curses.patch
@@ -0,0 +1,35 @@
+From 20ca4b10bd5f3aac55ff6bdfbb0c8debdb5cf380 Mon Sep 17 00:00:00 2001
+From: Tony Battersby <tonyb@cybernetics.com>
+Date: Sat, 14 Feb 2026 16:56:19 +0000
+Subject: [PATCH] * info/terminal.c: use modern prototypes for curses
+
+This fixes compile errors with -std=gnu23 (which is the default
+with gcc 15) on systems that do not have termcap.h.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinfo.git/commit/?id=20ca4b10bd5f3aac55ff6bdfbb0c8debdb5cf380]
+
+Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+---
+diff --git a/info/terminal.c b/info/terminal.c
+index b1eb0ffd13..273a9ca48d 100644
+--- a/info/terminal.c
++++ b/info/terminal.c
+@@ -44,9 +44,12 @@
+ char *BC, *UP;
+ char PC;      /* Pad character */
+ short ospeed; /* Terminal output baud rate */
+-extern int tgetnum (), tgetflag (), tgetent ();
+-extern char *tgetstr (), *tgoto ();
+-extern int tputs ();
++extern int tgetnum (char *id);
++extern int tgetflag (char *id);
++extern int tgetent (char *bp, const char *name);
++extern char *tgetstr (char *id, char **area);
++extern char *tgoto (const char *cap, int col, int row);
++extern int tputs (const char *str, int affcnt, int (*putc)(int));
+ #endif /* not HAVE_NCURSES_TERMCAP_H */
+ 
+ /* Function "hooks".  If you make one of these point to a function, that
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-extended/texinfo/texinfo_7.2.bb
index 784f67f65b..20f316b8bf 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch \
            file://0001-Makefile.am-do-not-build-manpages.patch \
            ${TARGET_PATCH} \
+           file://0004-info-terminal.c-use-modern-prototypes-for-curses.patch \
            "
 
 SRC_URI[sha256sum] = "e86de7dfef6b352aa1bf647de3a6213d1567c70129eccbf8977706d9c91919c8"
-- 
2.43.0


