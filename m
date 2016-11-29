Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 34FDB71AB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:55:19 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id c21so267236855ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Nzn2Y+m/3ltd2evKWVjg38Ho+kCy2h7QsXz6z5biPY=;
	b=NNYKDIJE1QB0FwnzOAf2De4QNtTzg+OIeH+lJw/dWCiAS8ciNTzDrT656LcQ7IdcTd
	RnSNxPfzB3+V02trHO5YmX9GBH2m/kd91Sqi+IKRgv7pG3/t5T7e0jFOtZDVt9/HbBl2
	WvaWTM2kYIXpZjNVF/30YQcnw3X7wIpt3G/qQIBP3GVwwj9LAYZ9dhsz3fobbySDz+eW
	vNWv/+aPUzmRbaoINU8HIBz0OwdZ0YaLfsHaOnwp45jmp+yv7I+gGYGn/iH+HsckEy5I
	r+CVkCwuqg4bgOM6Ok0tXlktc5F/Qzmfj4eQaZHqu/ckKf8Kswwi21VKAuTMV9V7ZS2t
	N6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1Nzn2Y+m/3ltd2evKWVjg38Ho+kCy2h7QsXz6z5biPY=;
	b=lxqSsnG0qQdsu7ru7nYvm05e0lzyV09wCdOXOWIrZ8kcOvQWpxoCoxiu+U69QqeSY8
	pwv+gn1GA+6d2vhg3lFRPO7fEGfoMLiyKUzM5pfmPAmo30zmmO7pIfr/8/Nro3rDR9YO
	k1LAUyeBmT+jgXrukp9HmZKUnwXO9TyU8zP5Zu15rQcA/SRZWQ1ERZlabQc9BxwI4CQW
	7K7l9AJ4MLtX/MaVpWadyukk1VukjI/JPr4LUe8IJTHZpXlp3ctbukTqU6+4pZv94fLk
	aQksPUIAXn7Kwu1x4uzwSz6tm5rrPkKPbCJ5emUIk70+1tTRRkUXYjij4K9dxnedEQSQ
	2sNw==
X-Gm-Message-State: AKaTC01dxlIzC8UztmZwcqkecbrhZyaFdsC4gO1+fdMZH2eJxKLnY5BnTvMpz7OqzfSXdDuS
X-Received: by 10.36.82.22 with SMTP id d22mr22505214itb.53.1480409720950;
	Tue, 29 Nov 2016 00:55:20 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8EEDB.dip0.t-ipconnect.de.
	[93.232.238.219]) by smtp.gmail.com with ESMTPSA id
	l73sm19093242ioe.37.2016.11.29.00.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 00:55:20 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:55:10 +0100
Message-Id: <1480409710-3292-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1480409468.6873.232.camel@intel.com>
References: <1480409468.6873.232.camel@intel.com>
Subject: [PATCH V3] scripts/send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Tue, 29 Nov 2016 08:55:20 -0000

When creating a patch set with cover letter using the
send-pull-request script, both the "In-Reply-To" and "References"
headers are appended twice in patch 2 and subsequent.

That's because git-format-patch already inserted them and then
git-send-email repeats that. Suppressing mail threading in
git-send-email with --no-thread avoids the problem and is the
right solution because it works regardless whether git-send-email is
called once or twicee.

Repeating these headers is a violation of RFC 2822 and can confuse
mail programs. For example, Patchwork does not detect a patch series
problem when there are these extra headers.

[YOCTO #10718]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/send-pull-request | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 575549d..883deac 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -158,11 +158,16 @@ GIT_EXTRA_CC=$(for R in $EXTRA_CC; do echo -n "--cc='$R' "; done)
 unset IFS
 
 # Handoff to git-send-email. It will perform the send confirmation.
+# Mail threading was already handled by git-format-patch in
+# create-pull-request, so we must not allow git-send-email to
+# add In-Reply-To and References headers again.
 PATCHES=$(echo $PDIR/*.patch)
 if [ $AUTO_CL -eq 1 ]; then
 	# Send the cover letter to every recipient, both specified as well as
 	# harvested. Then remove it from the patches list.
-	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
+	# --no-thread is redundant here (only sending a single message) and
+	# merely added for the sake of consistency.
+	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-thread --suppress-cc=all $CL"
 	if [ $? -eq 1 ]; then
 		echo "ERROR: failed to send cover-letter with automatic recipients."
 		exit 1
@@ -172,7 +177,7 @@ fi
 
 # Send the patch to the specified recipients and, if -c was specified, those git
 # finds in this specific patch.
-eval "git send-email $GIT_TO $GIT_EXTRA_CC --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
+eval "git send-email $GIT_TO $GIT_EXTRA_CC --confirm=always --no-thread $GITSOBCC $PATCHES"
 if [ $? -eq 1 ]; then
 	echo "ERROR: failed to send patches."
 	exit 1
-- 
2.1.4


