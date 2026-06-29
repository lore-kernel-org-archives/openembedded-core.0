Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C466C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89584.1782730511543200012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VW9Z3/Dz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FBDF1A00
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8EA53F836
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782730511; bh=lkzl5TfZ0uyTLjMPeto5pZi9ZVNwjTYc20LVhWgmizY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VW9Z3/Dz/Hg9oVf4icyW2qX1H3yzzVA3aot07hhciEzauLJ+w3iRIh01IzW8rygbf
	 pLwkLGzkZinojGcuJ0AtG2KdER/EPcuwhaMY1mA9d6rghGER7LOqeTTyek1ypdIDLQ
	 f8bg9r9I9QahQlaX5K1wK6hr6XkTxvas10y9c4QU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] avahi: upgrade 0.9-rc4 -> 0.9-rc5
Date: Mon, 29 Jun 2026 11:55:06 +0100
Message-ID: <20260629105506.2156617-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629105506.2156617-1-ross.burton@arm.com>
References: <20260629105506.2156617-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239755

Notably, this has security fixes:

- common: make sure valid domain names can be normalized

  It fixes a bug where it was possible for unprivileged local users to
  crash avahi-daemon via D-Bus by calling the RecordBrowserNew method
  with bogus domain names.

- core: always create new lookups and let queriers coalesce them

  It fixes a bug where it was possible to trigger a use-after-free by
  sending CNAME RRs.

Curated upstream changelog:
- core: always create new lookups and let queriers coalesce them
- tree-wide: cast chars to unsigned chars before passing them to ctype fu=
nctions
- common: make sure valid domain names can be normalized
- core: add missing check to avahi_record_copy
- core: add missing checks to avahi_dns_packet_append_name
- core: add missing checks to parse_rdata
- core: handle prefix lengths longer than 120 correctly
- core: use ip6_masklen for IPv6 prefix lengths on BSD
- core: no longer read past netmask in ip6_masklen
- core: set scope ids for link-local IPv6 addresses
- tests: cover oversize rdata rejection in avahi_rdata_parse
- dns: reject rdata larger than the 16 bit rdlength field
- common: free copy instead of NULL on failures in string_list_copy
- common: add missing checks to avahi_alternative_*
- core: free copy's HINFO 'os' field on rdata copy failure
- core: fill out msg_controllen for IPV6_PKTINFO control messages correct=
ly
- tests: call functions with side effects outside of assertions
- tests: call avahi_string_list_parse outside of assert
- fix: replace __FUNCTION__ with __func__ in AVAHI_WARN_UNSUPPORTED

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-=
connectivity/avahi/avahi_0.9.bb
index b5b63cf1ee4..308ddc1822c 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa34=
95befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=3D21;md5=3D9ee773=
68c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=3D23;md5=3Df4ac=
741a25c4f434039ba3e18c8674cf"
=20
-SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dhttps;branch=3Dmast=
er;tag=3Dv0.9-rc4 \
+SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dhttps;branch=3Dmast=
er;tag=3Dv0.9-rc5 \
            file://00avahi-autoipd \
            file://99avahi-autoipd \
            file://avahi-daemon.in \
@@ -26,8 +26,8 @@ SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv0.9-rc
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            "
=20
-PV =3D "0.9~rc4"
-SRCREV =3D "625ca0fac19229f6dfa3a6c6b698ae657187e50c"
+PV =3D "0.9~rc5"
+SRCREV =3D "71b640e686964efb27cb708f4457ffaed183c319"
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
=20
--=20
2.43.0


