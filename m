Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F77ACD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:16:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151672.1781608615189607862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 04:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sZmdmCVi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 589DA43D0
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 04:16:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EBD83F763
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781608614; bh=7IMHTX+acPZkaaXxoLpxcEXPKifpe8KZgyyosnruy0I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sZmdmCVis8I9DWk9Dhw6/j0/tvW0kyKcncbl50uCh5oWznUPPLl/PPMhwvdrcIBi/
	 +qa8EkEF4J+6pardxaH90xeF6LS5iB4nuwCQCkURouAcdviRpJBfJjrY0PkGhHYtHR
	 kMDrem1m1i13iv4NrwZgZY0yXGcmzIivSFMOHlrA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libinput: upgrade 1.30.4 -> 1.31.3
Date: Tue, 16 Jun 2026 12:16:43 +0100
Message-ID: <20260616111643.4091790-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616111643.4091790-1-ross.burton@arm.com>
References: <20260616111643.4091790-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238891

libinput 1.31.0:

The disable-while-typing and disable-while-trackpointing timeouts are
now configurable (within reasonable limits).

We now support fast 3fg swipes when 3fg drag is enabled.

A new API to get a tablet tool's (marketing) name is now available:
libinput_tablet_tool_get_name().

libinput 1.31.1:

Fixes CVE-2026-35093 and CVE-2026-35094 (already in 1.30.4).

libinput 1.31.2:

Important fix for the new fast-swipe interaction during 3fg dragging. A
wrong timestamp calculation could cause slow movements to be interpreted
as swipes in some cases.

Another fix for the Acer Swift SFX14-73G (and likely other devices with
a similar touchpad) fixes a stuttering cursor caused by wrong SYN_REPORT
handling in libinput.

libinput 1.31.3:

Fixes CVE-2026-50265 (already in 1.30.4).

libinput 1.31.4:

Two fixes for libinput record, the --autorestart interval handling was
broken for intervals 5s and higher, and a convenience fix for running
with --autorestart.

Eraser buttons can now be mapped to any button (previously only
BTN_STYLUS, BTN_STYULUS2 and BTN_STYLUS3 were permitted).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wayland/{libinput_1.30.4.bb =3D> libinput_1.31.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.30.4.bb =3D> libinput_1=
.31.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.30.4.bb b/meta/reci=
pes-graphics/wayland/libinput_1.31.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.30.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.31.3.bb
index 8ce3d0d62cf..aed79951eaa 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.31.3.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1=
c10bc0fb037dc76c46ef8a"
=20
 DEPENDS =3D "libevdev udev"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.30-branch;tag=3D${PV} \
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.31-branch;tag=3D${PV} \
            file://run-ptest \
            "
-SRCREV =3D "7ad8b37ffcc71aceb8eb4d079d22490e87168f49"
+SRCREV =3D "26191d396d74d505541d6311f0b4ae68d791b890"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
--=20
2.43.0


