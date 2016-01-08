Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 421A06FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 20:46:16 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f206so188944362wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 12:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=933zcXYGsOh8KaZ/LxIhHQphQpW/90+ReMmhTjRc48o=;
	b=ZDKXw8gbLd0vUAfCTQ05FMC4l2gEB+z0++4ehb2OWurPfp/Z+aQ2wXExbHr0ZSn8HM
	T0dAM3PnHKmrzOhpEosAOABrlxgm5XZz+5++72bZhhemcoBkPx3akKKN7JNlU504mLEB
	i3EpPOAimN0RqnH7yVD620JPn603gaa+XlzNNL3/67Z2AglYD1Hh5lkXQpWWx+Q2fOT9
	S4RGTWz2L2nQhoSDROhcBTI6ObO4Rui/u7lWVVhgGRx+3MZ995v50lNYiTUaqKxPynyX
	adMJiMQm82AovmfFLrtygMaGBae0LCAQZ35oL8Kta75bo9VMGebJffgxhwzJwQ9rS4J5
	5EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=933zcXYGsOh8KaZ/LxIhHQphQpW/90+ReMmhTjRc48o=;
	b=NPRIp8x/P8S8BkvJCfCzgTuFTXkVwg7y8Ai0O48CndRMtufQdBhelRfzOvFkAlSQtH
	vi0FYQpqZF3UNCfuyLmkAfid3i95uzIgf0ZwlqIBRfIxagxpPZ4j+vvDgkrAXb9z3rfO
	lN7VQF7Wv3jNAxWwmM598aH56HbIBC5AAaueqKCkTu4031O+OAh2KFjqwSBAES9i6O03
	aYinG5ipLyX7wW18V5gZsEsD1L1VgKx2VculPKHPRkfBrfYpS3B5Zzhydw+yP+41xKvP
	s4pK5BXwfNmA1kLtANhneMR3iXASJIT8N/kmzariI3BlE052Un7Fl7INqY68hXTyPS/L
	cxYg==
X-Gm-Message-State: ALoCoQkO/nlebi7YcKAMwU3d2fXh2IaOVlHXlyOfUc21+JmvK53P9jYrBQtTkdxKdeuzs1lnIo3FjK/CHGft/1A/lDpHMhHTag==
X-Received: by 10.194.202.135 with SMTP id ki7mr102337569wjc.81.1452285976807; 
	Fri, 08 Jan 2016 12:46:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w17sm760960wmw.15.2016.01.08.12.46.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 12:46:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 20:46:11 +0000
Message-Id: <1452285971-22612-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] update_font_cache: only scan system font directories
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
X-List-Received-Date: Fri, 08 Jan 2016 20:46:17 -0000

By default fc-cache will scan both system and user directories, which means it
attempts to scan $HOME/.fonts.  As this is the build host's idea of $HOME this
generally doesn't exist, and causes fc-cache to exit with a failure.

Solve this by passing --system-only so that fc-cache will only scan system
directories, as is appropriate for a rootfs-time invocation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/postinst-intercepts/update_font_cache | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index d8b70ee..bf65e19 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -3,5 +3,5 @@
 set -e
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
-					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D ${fontconfigcacheparams}
+					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
-- 
2.6.4


