Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1929060088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:56:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n5so84976627wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ITFnwQsa07/1KVTb4uT/ZqhSl4+usKSq9gTEl2oMjSY=;
	b=mvYC99fVSipKgzIzJ5SfUfNe+6mJueaDqW/DN41eHWvl61H0B87oDilxEtd+VJ5nGm
	skKFCteGRjmNuYv1Rpwoxx+AcufukntsOvnGLLlQdhLqftC4UUpQBQhvU8nJi8G4SXAd
	kOS62P2JElF2BpzZn3AAl/sp2Z73S3lFz3R5VleHYzIA3Hud4ppcIzV/5SVcIoy9Vcpn
	LXNYpK6fUSSQCDTerGC7T4pVmqC61zwexcvyU06tkozAXTMMnUtNhqo39eZsNDy1onHO
	XljWAdEJVcnXTkSdEuUuDWS7ydFnQgYo6WNGvxRlQjripZhhjwlNk1sgAnJfaVFyHwWn
	FhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ITFnwQsa07/1KVTb4uT/ZqhSl4+usKSq9gTEl2oMjSY=;
	b=Q/ZatdD67jAjJUN+wOsVm8y8JGa9z2NhX1OMlwKZJ6S5G5vQtyoP3DGCDkxQeKlksN
	tG7OV13widWXvREN4zLSmdihWOj83bGPtqDOb94poB6mHSnFBTEUy/gn4341WyFeL38r
	qZtopKrSE9U6YC3IKsR6dEaOWirO2RFQdLjkR/QlhhVQSHkxxkBYOaJl38oCNJhJtCUx
	X4Xzke2GjEd1uufjXz++AGMmLYZHoytlmh3CmaJC3mZ3wG8JJ0IKN/n+PPzGC//k8jYb
	Z0Np6upoPOYDz/fWR0xUKrPhOElVF0JeRJEuuOdkr/sJnL9lH46cismfovF7tmok7RPB
	ppNQ==
X-Gm-Message-State: AG10YOShSYrbbU3v66Ahd0Q2iaq5/IzjCzV15tzmfAsVRiW+z37gv0ApaERIWILkjLPzhqx1
X-Received: by 10.194.59.20 with SMTP id v20mr5289864wjq.84.1453388185722;
	Thu, 21 Jan 2016 06:56:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o7sm1788205wjf.45.2016.01.21.06.56.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 06:56:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 14:56:23 +0000
Message-Id: <1453388183-8838-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][V3] autotools: don't output the full config.log on configure failure
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
X-List-Received-Date: Thu, 21 Jan 2016 14:56:29 -0000

The config.log written by autoconf includes many pages of useless output,
followed by an obfuscated error message, and then more pages of every variable
that's been set.  It's only understandable if you're well versed in how autoconf
behaves, and often in simple failure modes doesn't actually make it clear what
the problem was.

Instead of outputting the whole config.log to the console when do_configure()
fails, use bbfatal_log so the human-readable configure output (not the
config.log) is shown to the user, and tell the user where config.log can be
found if they need it.

[ YOCTO #8856 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 44cb422..1400b44 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -88,14 +88,11 @@ oe_runconf () {
 	cfgscript=`python -c "import os; print os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.')"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		set +e
-		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
-		if [ "$?" != "0" ]; then
-			echo "Configure failed. The contents of all config.log files follows to aid debugging"
-			find ${B} -ignore_readdir_race -name config.log -print -exec cat {} \;
-			die "oe_runconf failed"
+		if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
+			bbnote "The following config.log files may provide further information."
+			bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
+			bbfatal_log "configure failed"
 		fi
-		set -e
 	else
 		bbfatal "no configure script found at $cfgscript"
 	fi
-- 
2.6.4


