Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id BEE1278191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:44:21 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id k192so9259504ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7T/anRs7ScfSudgbwUNPaTPyD8WT/KqH+OuU979d8l4=;
	b=OcT0BVXnSM+6LckzBj7qEpTFy2vKtCux1m+fbdrGYIaGQrAQ77pzY+zZhsUh7vFuyA
	IPWdOoqxxrqW8aYKg6wccE0RIO2C/GXNO/Z1cVi5N+tP35ElsZzAoUIkuWuHjlBz/787
	sQeCZrskIG5VHFCFv1qpLLmJnVM12NwmUM2jhyJixZxGg5pghIq2T4gJQogIErLouEdF
	G536WUc4d2EuIHPv2GiWlk6dv92iRpRlxMMg+kAD23tLHa5KUUr67Vad8j0Squ863dcT
	qzoYikpEHH1SC4Yy0bTFY8ToEkgaSugqwO8sZckNHmf4lgcjl+618B70AyZZRXz5tLVV
	829g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7T/anRs7ScfSudgbwUNPaTPyD8WT/KqH+OuU979d8l4=;
	b=k6+r8qznLF0sSCNwaJd2K0LDFfCGiGG1dDn9KtEeI1rmR6mHbs88hDfglK+TpJpBJk
	BzfJb8K2jz8I6fdk01cww0aKtNNy0prZxJdyJYfLKwUhM1bRSKpKqN1SG7EeuqycdFEJ
	LntxVq3IQVOYVCYnPcYbToTT9KPGDEPZl26ZJkgxjQoVLI1Z9sweMOW5ZS2cxeYio5cx
	GJun7ciuuuyRGXXo0rm/PDCkiDW8KxEgYljeWkd4Tb3b4xLL5eaBOTzVOKva08ynvvfs
	GHHBCvQsefdliQD7woc8CsFUh9fe8EW+2+kAcn/yfPnsrD9m3MKDCDyf13RpIroXVdXt
	i5VQ==
X-Gm-Message-State: AIVw112d4cDadUSraBAT7s0fbs8S86GirmELvVRnj+Qs9ArqoALqR9aW
	aND2Gs/PqwNZHQoRU34=
X-Received: by 10.36.40.84 with SMTP id h81mr22618740ith.12.1499849062452;
	Wed, 12 Jul 2017 01:44:22 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F424.dip0.t-ipconnect.de.
	[93.232.244.36]) by smtp.gmail.com with ESMTPSA id
	j96sm1248695ioo.49.2017.07.12.01.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 01:44:21 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 10:44:12 +0200
Message-Id: <f441186bafe2b8a80d3229f13aacf92138f63cd8.1499848992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.295e104beddcf41cf864decc94ea28047dd54ec1.1499848992.git-series.patrick.ohly@intel.com>
References: <cover.295e104beddcf41cf864decc94ea28047dd54ec1.1499848992.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] base-files: ignore "mesg n" error messages
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
X-List-Received-Date: Wed, 12 Jul 2017 08:44:22 -0000

When using "su - myuser" to change from root to a non-privileged user,
"mesg n" from the default .profile fails with "mesg: error: tty device
is not owned by group `tty' or "mesg: cannot open /dev/ttyS0:
Permission denied", depending on whether mesg comes from busybox or
util-linux.

This does not happen during a normal login because permissions on
/dev/tty* get changed while doing that, something that isn't possible
with plain "su -".

As the error can't be avoided and failures of mesg probably aren't
particularly important, now error messages get dumped to /dev/null.

[YOCTO #11127]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/base-files/base-files/share/dot.profile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/share/dot.profile b/meta/recipes-core/base-files/base-files/share/dot.profile
index 979793e..a873160 100644
--- a/meta/recipes-core/base-files/base-files/share/dot.profile
+++ b/meta/recipes-core/base-files/base-files/share/dot.profile
@@ -7,4 +7,5 @@ fi
 # path set by /etc/profile
 # export PATH
 
-mesg n
+# Might fail after "su - myuser" when /dev/tty* is not writable by "myuser".
+mesg n 2>/dev/null
-- 
git-series 0.9.1

