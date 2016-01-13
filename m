Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 961516FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 21:47:15 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f206so393428549wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 13:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kaIdiWWWAuYVTJgwZBXPJr0C1hHVAhwMQV3MVJI/trA=;
	b=HiAbrOn/2O7THHv+y2GJ5pRcmHcUauQXJhLzTezQurd0L/sQD12Kcc3gCH0gqdzonG
	N12CbIcLwX4mohue7fUraWggIjSOk+Ubn3cp8pfZvxGtI/g8fs37PiPyfxyRLeRxMGIu
	Y7VclOrwFRJtXSi5isIxrX1Smdl/buhtjEv8jTBKbG29edgIcqU3p2Y6QnhtkGdv5kWt
	RZ9Bcw0gpRbVO+m+1kV9k1KeLgVh/sTztYrrSBeTUV5IBCwxEiryLASFg26qAzCay7Zy
	RBJNEbaPZjtkBRsn2NyPzpKvGm8isKzAOSTCdda0Mv98ZYKaem8lt/geow5LreOgmuqa
	zr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kaIdiWWWAuYVTJgwZBXPJr0C1hHVAhwMQV3MVJI/trA=;
	b=Yw+2ik2McVjqJrF9Dv5splBN8dqolhpVL77ZAMeCKWdM+l6/8V+tcPt6wi7iCoVAhD
	WZG9GXjD3CmJpOcQfTMS3aSkdo/Y0kuOsD4k37GXyDI/fYWNwodbggGJkJ7O8Q2sAsC2
	f6hwhSS/AKegMgG1yUpt2EygfZiYymVVoIezuiKZxQE/RFX9dxv/F4TE/nnkb0skpAUd
	L6OuBKqcZpGnsDutNzgBaJKbUp1vmhTGmU38E9RPDUflsDppaYxvwGcW5KEK3bYrZt53
	1gW3gxCjkKQRKhApNJbJfX8fEK0wZIjZcM45QPUfkJLUfXrOh0Tfcv6MwmFcrT0PuyoV
	BQ9Q==
X-Gm-Message-State: ALoCoQmh1GVeqTHlGElPZ/1hXssSUqbpJbqKa/uiBHD+t04/EPoBAjdO5wZ7fqr2vJuBKz0c5IYvylucjZ21mglFZpIDgXh3Cg==
X-Received: by 10.28.194.197 with SMTP id s188mr1079516wmf.44.1452721635589;
	Wed, 13 Jan 2016 13:47:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l7sm3212161wjx.14.2016.01.13.13.47.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jan 2016 13:47:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 21:47:12 +0000
Message-Id: <1452721632-11855-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] autotools: don't output the full config.log on configure failure
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
X-List-Received-Date: Wed, 13 Jan 2016 21:47:15 -0000

The config.log written by autoconf includes many pages of useless output,
followed by an obfuscated error message, and then more pages of every variable
that's been set.  It's only understandable if you're well versed in how autoconf
behaves, and often in simple failure modes doesn't actually make it clear what
the problem was.

Instead of outputting config.log to the console when do_configure() fails, just
use bbfatal_log so the human-readable configure output (not the config.log) is
shown to the user.

[ YOCTO #8856 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index d546a5c..99f64b8 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -86,14 +86,7 @@ oe_runconf () {
 	cfgscript="${CONFIGURE_SCRIPT}"
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		set +e
-		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
-		if [ "$?" != "0" ]; then
-			echo "Configure failed. The contents of all config.log files follows to aid debugging"
-			find ${B} -ignore_readdir_race -name config.log -print -exec cat {} \;
-			die "oe_runconf failed"
-		fi
-		set -e
+		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal_log "configure failed"
 	else
 		bbfatal "no configure script found at $cfgscript"
 	fi
-- 
2.6.4


