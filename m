Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F21C62135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 18:51:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i85so4025841pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WR7atwbw857NqK99RZXaFe4ufwGzBkQ86bvR1VoZi9Y=;
	b=CMm4Oy4LnXCGggMovl2vZXjMiv523gw8U8+QOc7uXYxjdwdXxZ6hDXcXXYDy/seUBU
	RYl2nrS5Zm4WbHOutviaNqvfN/A7Hagg/MbALI9mHFTTMZt++vC1wm9kspI2E+I6SV5k
	gHoZ2NL6qNCs3KDIkdShWzBqWpoc6f+HSJDx0IgbBZ9Z2+DiCtlYSXizJop2ZwWsKuot
	Dbu4Jg0VwZgBs7v0YFN7Qxbe1/2mOODtRmn+njKRYL6DxKgZQ2+l6HPb1Sbi3yxW+Bsb
	1KRI1L73Rw48tb1uXqtnJczUirtgt86bdySiikT5xfK6WU2UzMxKBgWZv3Ozyvvmb/8T
	Wz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WR7atwbw857NqK99RZXaFe4ufwGzBkQ86bvR1VoZi9Y=;
	b=QiUY4YZ9KKdG7FxIUDzcMXvIHYXRyeIYB4XZDKm2ecucswSJ00iMRClEDc4VGP8J7k
	EWpq1oQsbxjDbplEColwbxrAocao9KRfY9iMHRKWKSwfkhEV7leVv5iztKrFKzU3aD75
	Ibk7oMbkFnGCK1IWwtGpLtk9vxFtl/FjU2d0XQq77Kdn/nX8WpVOIp9AxirzL5YQC+Bx
	3eIj91c27gr2LNOGKF0we/FOY6pz1giZFUQmwLeW0v8hsRjcZJlcsZYnGysK2Wz2wZ14
	keh1S6/nEq0eS86SeIsWTZnto555DVwMglsEG1+M1+7gCSjA3cmkmuUyMnKgk1eT1fsk
	3dww==
X-Gm-Message-State: AA6/9Rmdctryr0SFiuGOaPWDO2dR4mifo8ANHSqz8WRaptR4yf8gZmIQo+21v+wZGt063w==
X-Received: by 10.98.30.65 with SMTP id e62mr8689754pfe.104.1475607078193;
	Tue, 04 Oct 2016 11:51:18 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id ao5sm7772067pad.1.2016.10.04.11.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 11:51:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 11:51:12 -0700
Message-Id: <1475607072-27194-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base-files: don't export TZ="UTC" from /etc/profile
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
X-List-Received-Date: Tue, 04 Oct 2016 18:51:21 -0000

If no /etc/localtime (or /etc/TZ for uclibc) is found, then the libc
will default to UTC, so setting UTC as a fallback default via the TZ
environment variable is redundant.

Since having the TZ environment variable set causes /etc/localtime
to be ignored, it can cause confusion if /etc/localtime is added
interactively after /etc/profile has been run.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/base-files/base-files/profile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index a52bf89..0a05e45 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -5,12 +5,6 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="vi"			# needed for packages like cron, git-commit
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
-	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html
-				# for an explanation of how to set this to your local timezone.
-	export TZ
-fi
-
 if [ "$HOME" = "ROOTHOME" ]; then
    PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
 fi
-- 
1.9.1


