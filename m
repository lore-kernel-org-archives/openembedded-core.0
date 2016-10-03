Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B26A6FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:47:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so12915150wma.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 22:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=voq+gywZea4eLBt38CyNq6AZqUxr5fZ+WCb4A7gdGhU=;
	b=KE8D3k2gvaFjX+ZxqhBnFvXI+q8BOA1bUb1GWo5Nnv5F3sPEo7Ckq5ZYESIYM26150
	/qKaw6fQp69N8hFTBz/MQuuv0VWiBZ6793IsD2K/nT8GPiK+GfBft3rCLI60RU3rV5xu
	aLBzGcBg6b2yroaaK89EZRlyru2NlFlAVOcC+45qxWy1oEuYsh015QcnoIOsMgdbTf3l
	GpzKKtIiwWUrw6Wc0wIG6mVdvFCVADTh9LZjG774SarptcOIUe9QYJpJ2bSGca6WtCs5
	2+waAmqMsFa2QioelIx7VCQZIduMs1Z8Gup6RrgvTrFbjEBYhN8g7yF0DBBCnWseJ6QI
	+4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=voq+gywZea4eLBt38CyNq6AZqUxr5fZ+WCb4A7gdGhU=;
	b=icaSTHuUYPIE9kGc74kw3LMq5GdwzUlcr+oB+V9Izfako/OJGdDVdH/+YI08FpHwhj
	JdRbLRXTsKSkfpTK3lAFbSlKvCgAH/IAntVTUU8D61E922dEsMZGwu/NcTMGIQi0yp1Z
	Bp4pOQvpDopeCG7BVsWfM8jmHJymSxn4l0S2PDJHUwgzXo+nNpNk1CDdvZSHErhsxyi/
	IE/cJXUBWVRa3pdV5QzfRPaT+Qirxzmc+A3s2dS6SQ6WUsHsQQDrtAKnzo1v65Jg7nOe
	gksIz+Qu7Rh4nhdJCGX5Ruq6N78hb2c8Ry/uNyBfREgIgIj7QdMN4oWuTEzSxcoOux96
	o7iA==
X-Gm-Message-State: AA6/9RkV/pWjOF3mvAuO8ByRY5yp3hK56wexyej2j6rDAMpcF/AXawJXJG5O8gYIu/2dbQ==
X-Received: by 10.194.146.174 with SMTP id td14mr16108503wjb.152.1475473651125;
	Sun, 02 Oct 2016 22:47:31 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1454.dip0.t-ipconnect.de.
	[91.10.20.84]) by smtp.googlemail.com with ESMTPSA id
	lz5sm32361375wjb.24.2016.10.02.22.47.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Oct 2016 22:47:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 07:47:16 +0200
Message-Id: <1475473636-17235-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] alsa-lib: allow building ARM thumb again
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
X-List-Received-Date: Mon, 03 Oct 2016 05:47:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The directive mentioned in the comment was removed in:

commit 326c6802e49e5499e16cf141e1cdb0360fce14aa
Author: Riku Voipio <riku.voipio@linaro.org>
Date:   Fri Feb 7 15:38:58 2014 +0200

    alsa-lib: heavy pcm atomics cleanup

    The following patch comes from the realization that at least ARM code
    for atomics is quite broken and nobody has cared for a decade.

    A quick dive shows that only snd_atomic_{read,write}_{begin,end}
    appear to be used widely. These are implemented using wmb/rmb.

    Only other use of atomic functions is in pcm_meter.c.
    The #SND_PCM_TYPE_METER plugin type appears rarely, if ever, used.
    I presume these days anyone who wants a meter/scope will do in pulseaudio
    layer instead of alsa.

    It would seem better fit to have pcm_meter in alsa-plugins instead
    of alsa-lib, but I guess that would be an ABI break...

    So instead, I'm proposing here

    1. Removal of all hand-crafted atomics from iatomic.h apart from barriers,
       which are used in snd_atomic_{read,write}_{begin,end}.

    2. Using __sync_synchronize as the default fallback for barriers. This
       has been available since gcc 4.1, so it shouldn't be a problem.

    3. Defining the few atomics used by pcm_meter.c withing pcm_meter.c
       itself, using gcc atomic builtins[1].

    4. Since gcc atomic builtins are available only since gcc 4.7, add a check for
       that in gcc configure.in, and don't build pcm meter plugin if using
       older gcc.

    The last point has the impact, that if there actually is someone who 1)
    uses the meter plugin 2) wants to upgrade to 2014 alsa-lib 3) but
    does not want to use a 2012+ gcc - that someone will be inconvenienced.

    Finally remove the unneeded configure check for cpu type. We can
    trust the gcc to set right flags for us.

    [1] http://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html

    Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
index ff47576..e313da7 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
@@ -8,12 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 BBCLASSEXTEND = "native nativesdk"
 
-# configure.in sets -D__arm__ on the command line for any arm system
-# (not just those with the ARM instruction set), this should be removed,
-# (or replaced by a permitted #define).
-#FIXME: remove the following
-ARM_INSTRUCTION_SET = "arm"
-
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
-- 
2.5.5


