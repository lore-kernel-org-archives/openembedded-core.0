Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id EB0837E8B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q5so4840351pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=cHwtj3sU/Wn4fuJGz1SfCcjsUd6dJ74/+g/n4b3KrPWpalWJMy0JxF3okzi8s2SEsv
	vVr0kGpbIwg13jB6y6mGWOl+sWU3gjnMYKHMk5aHVcR0EjdzBLfc2VLeYMXFNfPSjP76
	ZBOu9efXIto6Gg8Vmv239/Qj4iq/yFHVNg1xFiB2mQL7YEGqoR0cA1oNmcA1iYyJGsgN
	FTIwarCnOl1e00flsXe70M7HQG1GbBlnZ1Msq/uxgQig6lUZWzRcI96LqNEYv7r5rJOn
	rZ/OAOvAGDgW7wDN/HmNUYQ8rs+6crLG2uYyam4jFJatfpRKFfOQmySoL91i39T95hsn
	O4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=mqqaumQik2DA8oKqLUOS97cVcqGwQU09CZcMZNMegxYYvrTRSmKV2WeEJEQGrzkn+u
	p74/B7fQToAfk3EpL9FeESoqrKQJyACXqNYkxSMhS7bGMcOsrm6QBCsk+CGm5RXvmUJ2
	VUyS+AT6SIY9TSiE0lxW5bEWeJfTIK/TVJRXlW+vF1PDwlaebfHZLQBGibGbSO5Gsp+o
	Dx2RbscmZbArkyCDj4DlQ+/OF2WBlwp47roOKP1jWjC9dBl6ZXmxcI8X9ihnbAP+EnIR
	f8H8e2AuHuYGk2Jo2Xkt+VsL8RIndm4ZnEJAwrVMK6A66o1p62aFaYJRpFDyKpnSqwnZ
	V92w==
X-Gm-Message-State: APjAAAVgbEHjdhgTJ8oVdtU/ml1mB0KxBIx+cgvZzYHTC9h0nYqxBG8X
	Uz9nc/gDWt78wBXL1YKYq9OkVhBPhEY=
X-Google-Smtp-Source: APXvYqzk63+3MKquN0eMqaHLnydhhsWd6HSyvTs4Ir9oi7BR0ihGhmfhZtOshyABf+Iqjp5RAFsLYw==
X-Received: by 2002:a63:5946:: with SMTP id j6mr22287664pgm.66.1569818890940; 
	Sun, 29 Sep 2019 21:48:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:12 -0700
Message-Id: <423115b70a4a2cdef4b3882ad4491446b84a1f1e.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 17/54] psmisc: Fix dependency for USE_NLS=no
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:10 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When using USE_NLS="no" in the local.conf psmisc will fail to
compile as follows:

| autoreconf: Entering directory `.'
| autoreconf: running: autopoint --force
| autoreconf: failed to run autopoint: No such file or directory
| autoreconf: autopoint is needed because this package uses Gettext
| ERROR: autoreconf execution failed.

This is because the gettext.bbclass returns gettext-minimal-native for
the host dependency which does not include autopoint.  The autopoint
utility is required to build psmisc, so it needs to list
gettext-native as a dependency.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947..594a10c 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "ncurses virtual/libintl gettext-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.7.4


