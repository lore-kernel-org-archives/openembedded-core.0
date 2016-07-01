Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8094A6012C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:42:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so10789123pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TjFpDschnTCuk+k/VP0awppe/ZPqfbdo3qVoyKhltIE=;
	b=vncZnbEa8EVbWkr0qfzLvIJsMZfICTagW7IQLdwO1hZHB8LpaSGSF9b/CItu+ZBY+x
	qmZfK66SHfqYESK+SGGv4mvFYBQmkP789iJHD3IwnehtlX+UTCUTMBeyuhgi08azj8Gn
	XSDUUisF9t2aJIUyf0fRUnaxp8nBKIv+IILKicurtzMTmyLL4JMcQVMO9nGhVWsAfi1H
	zOoxydJMZB0KoouSvQxK9neJM5vxzF8g+Jme8hXNWQtyjMofuOA8e5B8swJ2CFuHsT//
	/oD9oEr3z7ZrSphVilKNl+ZpsHNmbL1grReSa3b8glVIpxZtYz2KgLP97eqG/0d60we0
	osvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TjFpDschnTCuk+k/VP0awppe/ZPqfbdo3qVoyKhltIE=;
	b=isegP1PWRnI4s/1Ryux70nlbsN3o1BpQyJelZLs0ldeo8UxQ6cztOjnyOFC27pGbT0
	los5EvXCISKBeQBO1E1aII89xLYpQapfkCl4T1AbAw/z4Kgx6DAG27NALtg9EsuLMfly
	znQavR6e9HanShow4KYbR2lJtYNruug9pyjgSwqJWNh3En/fIzgkuXiwgrKZM7Lc8/eE
	/nCnogzpnSkUN0Ow7/Q3fDw4JHzyxX2/cIOAEyX7vG61dUxw+q/N7dIYabQX0jrW6lfI
	leC5WsyqJiAaBXTEP08F5Y+taXu+FMzeAJ4uDdkN6B/HYaP++7ZX8jIbJtXxKzZj3BFA
	vZ6Q==
X-Gm-Message-State: ALyK8tKQJ3SfxTq5pqiWrawngJCAZ9RrTG5GnGEXwpLi13yAB1MqgxgzZcCpaDmccRzKjg==
X-Received: by 10.98.38.69 with SMTP id m66mr299757pfm.57.1467405754674;
	Fri, 01 Jul 2016 13:42:34 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o22sm7729561pfa.15.2016.07.01.13.42.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 13:42:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 13:42:30 -0700
Message-Id: <1467405750-13691-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] buildstats-summary: round the floating point percentage
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
X-List-Received-Date: Fri, 01 Jul 2016 20:42:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was rounded in python 2, but python 3 changed the default behavior of /.
We could switch to the same behavior as previous by switching to // rather
than /, but there's value in keeping at least one decimal point, to avoid the
misleading case where it says 0% but the reuse is non-zero.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/buildstats-summary.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index d73350b..b86abcc 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -30,7 +30,11 @@ python buildstats_summary () {
                 header_printed = True
                 bb.note("Build completion summary:")
 
-            bb.note("  {0}: {1}% sstate reuse ({2} setscene, {3} scratch)".format(t, 100*len(sstate)/(len(sstate)+len(no_sstate)), len(sstate), len(no_sstate)))
+            sstate_count = len(sstate)
+            no_sstate_count = len(no_sstate)
+            total_count = sstate_count + no_sstate_count
+            bb.note("  {0}: {1:.1f}% sstate reuse({2} setscene, {3} scratch)".format(
+                t, round(100 * sstate_count / total_count, 1), sstate_count, no_sstate_count))
 }
 addhandler buildstats_summary
 buildstats_summary[eventmask] = "bb.event.BuildCompleted"
-- 
2.8.0


