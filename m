Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 38B0A6BC8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 21:52:55 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e11so26245619itl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zD8ZoZHVUBFlmxd8fF373727KyJgMPQAOlFx16yDKKI=;
	b=C/qefMRHK+lPYX9QS6YW/uWMn7p9c9ySEEigIvCvczQf3cRdQKfX839QGj1lhZyPl/
	XDRIFN6bwYH/CfmrX8P+5p2o/XfQPU3kSyyNs8aq29dDyLW6OzHUywG1h38LeMqChRZs
	d5CZzHQYPnGgctabx1ZaDNNdi3JZT1AryxbIRAP+NrKxn9elRNI0HDShrxqoWNWfQtC9
	FM9IJH8xnd9xxTaySiHs3a/ZUd3zlwJPIbXIyItPvGd9CggQqwSNdiwjcwbwles7Rj8m
	Mnuf6j7M2GglJQhM/70v63fhcm1/i9VihAN0dmg2kMaSV7DJ2+pfoYuQ5vWgdjN5Iku9
	lGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zD8ZoZHVUBFlmxd8fF373727KyJgMPQAOlFx16yDKKI=;
	b=Q5puDXmB2fTR+c6ffclpJMfHuGP81FYL77OTEUUZ/iVlendx388BaU+ne0EGib/JO5
	5LL6ugOI8a9hpZcoOXVE6/7XvrfH3x5MGqSGDaS4y0I/BGWG6I1kAPgFgLChcrwqREFE
	1f23jZbmM3itreNd1Umbsrkl4hsIXiMho67pi1fxfhs9jTN1JnyQnir3U5betmjqlQOz
	vzBOmDEvaeIu2Ar8gpTq5U7jNMyEub06DS9ILQaUyJXzq1jCLg0x/bnC/9escB5Lji5C
	Bob7zgVrmuuOc2NIdFnSENUqlFmUAZO7nmoFIujSPRiwqYh/pzTBvi4MY7a4a97VFatR
	sW8A==
X-Gm-Message-State: AA+aEWb06ZLV/xse6hAIcqchSaL70NpfQdqcLojc/AeO0fFDsDB2mhxH
	5kPsnfTsmxtZa1K5KPkmmh1+xOYp
X-Google-Smtp-Source: AJdET5e6A22mFDkI2jehEE/5WgTDmqqoY4lCftmDS4DIR25510DW5XG/je7BiJsmFHolRwC+KM5gqQ==
X-Received: by 2002:a24:3692:: with SMTP id
	l140-v6mr3607670itl.113.1542232376119; 
	Wed, 14 Nov 2018 13:52:56 -0800 (PST)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	188-v6sm8946031itz.4.2018.11.14.13.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Nov 2018 13:52:55 -0800 (PST)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 16:52:37 -0500
Message-Id: <20181114215237.13183-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
Subject: [PATCH] busybox: Provide /bin/ash when usrmerge is enabled
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
X-List-Received-Date: Wed, 14 Nov 2018 21:52:55 -0000

When usrmerge is enabled, scripts that were explicitly using #!/bin/ash
will cause a QA Error like the following:

QA Issue: bar.sh contained in package foo requires /bin/ash,
but no providers found in RDEPENDS_foo? [file-rdeps].

It seems perfectly acceptable for scripts to use /bin/ash so provide
it along with /bin/sh.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 10582a7534..c07162f6b4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -454,4 +454,4 @@ pkg_prerm_${PN}-syslog () {
 	fi
 }
 
-RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/ash', '', d)}"
-- 
2.14.5


