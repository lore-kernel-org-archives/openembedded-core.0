Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34740CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 20:49:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.28871.1760561390112227112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 13:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54E3D1688;
	Wed, 15 Oct 2025 13:49:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C17893F738;
	Wed, 15 Oct 2025 13:49:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: mhalstead@linuxfoundation.org
Subject: [PATCH] classes/mirrors: use geo-located kernel.org mirrors
Date: Wed, 15 Oct 2025 21:49:40 +0100
Message-ID: <20251015204940.783898-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224906

We use the kernel.org mirrors for a number of projects: obviously the
kernel, but also the GNU tarballs are fetched from there too.

However, mirrors.kernel.org does not have any geo-proximity DNS magic
and will always resolve to the primary server on in west coast USA,
which is far from ideal if you're not near there.

Switch the mirror URLs to mirrors.edge.kernel.org, which does actually
resolve to a closer server.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/mirrors.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mi=
rrors.bbclass
index e31af488b95..75a0003ce55 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -10,8 +10,8 @@ ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/deb=
ian/20250101T023759Z/pool
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120=
328T092752Z/debian/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110=
127T084257Z/debian/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090=
802T004153Z/debian/pool \
-${GNU_MIRROR}	https://mirrors.kernel.org/gnu \
-${KERNELORG_MIRROR}	http://www.kernel.org/pub \
+${GNU_MIRROR}	https://mirrors.edge.kernel.org/gnu \
+${KERNELORG_MIRROR}	http://www.edge.kernel.org/pub \
 ${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \
 ${GNUPG_MIRROR}	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcry=
pt \
 ${GNUPG_MIRROR}	ftp://mirrors.dotsrc.org/gcrypt \
@@ -26,7 +26,7 @@ ${APACHE_MIRROR}  http://archive.apache.org/dist \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc=
/ \
 ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases =
\
 ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/rel=
eases \
-ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \
+ftp://sourceware.org/pub http://mirrors.edge.kernel.org/sourceware \
 ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
 ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com=
/sourceware \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
@@ -52,8 +52,8 @@ https?://.*/.*  http://sources.openembedded.org/ \
 ftp://.*/.*     http://sources.openembedded.org/ \
 npm://.*/?.*    http://sources.openembedded.org/ \
 ${CPAN_MIRROR}  https://cpan.metacpan.org/ \
-https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.=
kernel.org/yocto/uninative/ \
-https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kern=
el.org/yocto-sources/ \
+https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.=
edge.kernel.org/yocto/uninative/ \
+https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.edge=
.kernel.org/yocto-sources/ \
 "
=20
 # Use MIRRORS to provide git repo fallbacks using the https protocol, fo=
r cases
--=20
2.43.0


