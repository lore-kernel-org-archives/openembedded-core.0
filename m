Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7836B06C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:55:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p4so1608288wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8t7VOEXj8zb5/J/B5gjpn37507zheLoOa+rxYOrnz/I=;
	b=mcI2yll/8SkjHB+/HdYYIhqTKzNTLcsIwb0MIUyaFVH1WqaYpjSi6+LPSPvySM1ORm
	Rj6zZvXPSfPhuUZ0an4KTyLmtX/lPE+n+OZ+ir58LhQKigFNUID+ZDEsAApHwTalcSmm
	7wh/OwZYWhOk3CwXzlaRa0tObSPBRfr5YZB7InT4+odIgF14Nbz7mGfwr8CSvDg9EWVd
	bQpzJWUYF09JZq7c7geCu9Os+pyHTctVzn0hK1I1tKEyh0jpYJUSD+njHe0tLK6C+00T
	ZPw/L907t/czrmS7Ze9J7Z2vQaAuuZ+urv4TxCc3/qYe6ax0c/5VEJ3rwbdmn0Rc5bxX
	v07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8t7VOEXj8zb5/J/B5gjpn37507zheLoOa+rxYOrnz/I=;
	b=OK+nd7iNBMCE+/ckaSdvsqOQXLwVMLrmM1N/Gic8RINgZ/sYZ3USDXih01/PWxxxrU
	pWab7N7lr5mLnJJwn0a6f4Ld9ykJKwDk4UmKd/chEcxwV2RoLMDeQcyylWGlhkJueipn
	xpung//bv2YXdd6moflt2vosE6egqZHqOQ2NoRWSnerVDItzMo357qKzLmq+m8AZyjKj
	qf/QBeE9SAhtyecnQcVevdO0Ol/pNjb3FIpuDyzTvvVfwDEZKKk8wWZVIXQjdWuF1MsA
	JRHVW3AJ4IdQRMWcCOC7lsL02bNdSXwnOJFh3x5WjbYo+e+CzVdG8+sUsnDN+XM9F2cB
	c8NA==
X-Gm-Message-State: AJcUuke6BPoFL9M4wA85Lyx/+evlE60aJPXJv3OiikCNA0au2u04LvHq
	Jq583rQFLPM+HUvcrD7chdUELOyWRxQ=
X-Google-Smtp-Source: ALg8bN4fNW6lJRqDaat75SMTZsJjlt+4FnlNfbSTxwmJQxSdFAci27ZPj5/5cxXghzcmIWjBiKOh7g==
X-Received: by 2002:adf:b307:: with SMTP id j7mr1791403wrd.46.1547535311802;
	Mon, 14 Jan 2019 22:55:11 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v6sm56795686wro.57.2019.01.14.22.55.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jan 2019 22:55:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 06:55:07 +0000
Message-Id: <1547535307-15876-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] perf: Package libperf-jvmti.so as part of ${PN}
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
X-List-Received-Date: Tue, 15 Jan 2019 06:55:11 -0000

perf's jvmti support builds libperf-jvmti.so that needs to be packaged
as part of the main package, not a developer package. Given there's no
files in the developer package, override FILES_SOLIBSDEV so it's not
gobbled by FILES_${PN}-dev, and then add just that file to FILES_${PN}
so that if in the future there other files which would be added to the
dev package we'll fail then.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bae494875159..515a78b859d7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -254,7 +254,8 @@ RDEPENDS_${PN}-tests =+ "python"
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
-FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES_${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
 FILES_${PN}-python = " \
-- 
2.7.4


