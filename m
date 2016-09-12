Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCAC60851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 11:48:09 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 1so139753592wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Es486S4MQs5L+2eGk2MARyM9FguRO7aRobZpuOV5nUE=;
	b=D6cOm7BrTd/cdZOnYsaG0CaoujhIBP6TCZA758PoH/n/SPPAJV1nNVZIVgfehiZ/Qh
	255SZImM6mkvBWamMmUttF04nxMCtk2cxShi56zkQQj+IHbNIXXY/PTLjUlzZL9SycQW
	m9k2t0oD9xZjUl0IzoBT7x9qNSYx3lkfVfyFnJ6mePkbmoc73XwDu0GA1wT1QsRG00xA
	14wiPb+jA1LN2k0gYeOeVg1HyDhd8FJOzIEu6OHY4B4lqKLGlUQnOeC2uNVjI6MOEOjQ
	AUhDeO1QkPXx9XupNzo5ycpY2mQoWe/pUlZCcrLN0YJvkj0iekclsvHM37xyc7thJ9dJ
	N4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Es486S4MQs5L+2eGk2MARyM9FguRO7aRobZpuOV5nUE=;
	b=IJk98i+LxVxXV4Lefnh9oY2koUMUW7h8a24hyZjFCeQ7EBt8T6UI+PHWYslUNKzCa8
	6vt/MYnCz7Uh30QUGjurv9RpScP5zJ7zkiK7WyNEFpzpeFExEqU8u2/xAqM17WD94T6b
	/iUveO0NNW+oVl5F7A/vEB6VBpDIKZxVNjBstbsHz3fMkUD3JsQrZPkQaJ3+cnbPKAAi
	WrMpHPZVgUOdeVf1TaRrZ/QGsg/fRf3dvlQ5b/an3Zn2vsnzQcZJNMxvaxaLngW1hkce
	RZLlr5zgh5QJnK41A8553GwFWush8qk0+F2TXEBSxBE02huBGWdMuI/S2Y94vFW5QVM1
	Gnag==
X-Gm-Message-State: AE9vXwNadQJ66HFmAeWy+VseohBZIygW9Kl2LF0lCPpfsTddW5L9BA7PVeZCkcP8PZhA7vhf
X-Received: by 10.194.85.18 with SMTP id d18mr14281329wjz.43.1473680889574;
	Mon, 12 Sep 2016 04:48:09 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm17478992wmk.13.2016.09.12.04.48.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 04:48:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 12:48:05 +0100
Message-Id: <1473680885-30513-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473680885-30513-1-git-send-email-ross.burton@intel.com>
References: <1473680885-30513-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] classes/gobject-introspecton-data: lazy assign GI_DATA_ENABLED
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
X-List-Received-Date: Mon, 12 Sep 2016 11:48:10 -0000

By letting a recipe assign GI_DATA_ENABLED trivially there is a simple and clear
way to disable gobject-introspection for specific build configurations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gobject-introspection-data.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes/gobject-introspection-data.bbclass
index b1bdd26..2ef6846 100644
--- a/meta/classes/gobject-introspection-data.bbclass
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -3,7 +3,5 @@
 #
 # It should be used in recipes to determine whether introspection data should be built,
 # so that qemu use can be avoided when necessary.
-GI_DATA_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', \
+GI_DATA_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
-
-
-- 
2.8.1


