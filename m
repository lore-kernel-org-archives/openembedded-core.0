Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A3EC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1684.1789682888147890687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1lQKyLzy;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so13540f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682886; x=1790287686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sx5VEyQ8rwdvYdJ0qPc7noa8vHmysM5ALhBMD2Ld7aU=;
        b=1lQKyLzy8OvlEzdl1eLota7Y6XES+JB7a1rZ3IMLoDdhVcW0icu7tHnB0dNaBtwwpD
         HSSQzioz7B4rlD/ua6V+NBXneVRuzVSLe61y6uVohRanahBESYbKqZ1OBLa/HNv/aL2h
         K5y9uyjskal3pD3KDk5RqBO07LxmjkP2vcmjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682886; x=1790287686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sx5VEyQ8rwdvYdJ0qPc7noa8vHmysM5ALhBMD2Ld7aU=;
        b=yqiSJhmsNsaGK9kjDtZdlL9NHoIIDsmN0NbuR+/cI4QJpGrQxJUJyoJpcPMAWrAwFB
         /d/6FgwCRCzIMolOwLYarOIYuMDIoAJGL35+VGtoI8gyZeGEUFSPa5n7KQaceZ+ap07O
         WqQ0mzDbxy4EMDShORlcQt4ZdtNaD4H5ICaEWy6SM9I6x80g5jrVbuYApyHc63m+zTFy
         QOvcMQKoqbe7ulinym+aoanOyG0R6rBCnpn8l49o5THB8CRJHI86+Uekz3d0nhbA3ems
         wpnrPgK1s8+BgtbbtVeZsIm0k1pxu8i8OKn2cRBApmqLwP6YtIPw/xo3flseokAaVc2s
         eXCQ==
X-Gm-Message-State: AFuF++nNsfaDkJhTRGmhsRG6WyhvEcysXWuoQSOauI1xeZ3j1wFozGXH
	84pqcrY0hajU9zgRebmirx3T3Iyc8P8Pnc/O9/C2CI+kw4ngvxbZ2ouQ1TfDOccbLC4YIKyMZun
	sFnkK5Fg=
X-Gm-Gg: AYBFou3UMwLcXagZ3BJ6u+sdOxUk3QHBEbtScaRrQcmL1BvzTuxP5X8zMP60lBAtGht
	cH91E8MOOhC++YPy8cJoIt6qSHTOfwiCCBaetbhEe8PcsSki8SFwF0Nm8QbD5aR1jIOcd+MmvR3
	eNLF9IVoH8PQe2awnlMW0PmRKJj/Qn1vv3ZPaale/tNbdlcnyUtrQSjGZwCFyy9L9iSyUoccUTj
	4UOs13/TMVmp2t/fDHcYRCCOfIOwtTtuDR4GNg8YZjnzuJBiN+qX5Ps3zjmCpA5oc+8dP9OKco3
	1mNSyEDdksQrCTn1JVjnN2LAJIN4Dwnk6OeN0H3/haKWFz39eS8YV8SpxdaWQPrHxIw238zOeza
	rBphV8rbi8wl5EpPPvfYfH7CDLzQuMqsMCld83jbj7SI9qmnogcfZ9LX4CZlaU0uvSAXLc0/Na4
	xxrD90U/kD4E9vN8mm/ez3Rj9JL/GowY+6s0RWAfT9lDkRznsmAYB0ifRzHFaNJ4HsYWL3X97By
	RInsRiBglI+OQm8ic38bhLrr1uvdbThIHvdYKZCCNs65HSF6rYI+gd2bRwP5oNNDn26J6NR/s2E
	I6DAcYW5PA==
X-Received: by 2002:a05:600c:a49:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fc500055cmr6239265e9.12.1789682886332;
        Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/79] dbus: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:17 +0200
Message-ID: <64c67ca44405f9757ec94c79477dd21a16e17227.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246127

From: Daniel Turull <daniel.turull@ericsson.com>

D-Bus's CONTRIBUTING.md documents even-minor stable branches, currently
dbus-1.16.x, that receive only cherry-picked bug fixes, so upgrades
within a major.minor are stable point upgrades per the OE-Core stable
release policy (ref-manual, "Stable Point Release Upgrades"). It also
states that odd-minor development branches such as 1.17.x are not
supported at all and receive no bug fixes, not even for security
vulnerabilities, so only the even-minor stable series should be tracked.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.16.2/CONTRIBUTING.md#L65

Checked the only point release in the series so far for feature creep,
the 1.16.x series having just one non-.0 release to date:

  1.16.2 (Feb 27 2025): two items -- one build-regression fix for
  verbose-mode builds against libselinux >= 3.8, and a documentation
  update. No API or behaviour changes.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 1.14.0 -> 1.14.8.
scarthgap has had zero point-release bumps since its fork and remains at
1.14.10; wrynose ships 1.16.2 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 63948049e50abeda630fb716ea0ba97e71b4f7cd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index 7425bd23642..1102a8660ee 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -5,6 +5,12 @@ SECTION = "base"
 
 inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
 
+# D-Bus publishes bugfix/security-only micro releases on its stable
+# (even-minor) branches. Odd-minor development branches (e.g. 1.17.x) are
+# not supported at all and receive no bug fixes, not even for security
+# vulnerabilities, so only the even-minor stable series is tracked here.
+inherit upstream-stable-release-point
+
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb0ffc69a965797a3d6686baa153ef05 \
                     file://dbus/dbus.h;beginline=6;endline=22;md5=df4251a6c6e15e6a9e3c77b2ac30065d \

