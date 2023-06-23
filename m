Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43409C001E0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 12:33:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40785.1687523578249930892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 05:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD2D11042;
	Fri, 23 Jun 2023 05:33:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BA383F59C;
	Fri, 23 Jun 2023 05:32:57 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com
Subject: [PATCH 4/4] cve-update-nvd2-native: use exact times, don't truncate
Date: Fri, 23 Jun 2023 13:32:50 +0100
Message-Id: <20230623123250.726731-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623123250.726731-1-ross.burton@arm.com>
References: <20230623123250.726731-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 12:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183329

From: Ross Burton <ross.burton@arm.com>

When requesting updates in a specific range, use the actual current time
and database mtime instead of truncating to midnight, and explicitly set
the timezone to UTC so that NIST don't treat the timestamps as _their_ lo=
cal
time when they're _our_ local time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
index 0c627ef2623..61f4d47f961 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -172,8 +172,8 @@ def update_db_file(db_tmp_file, d, database_time):
     # The maximum range for time is 120 days
     # Force a complete update if our range is longer
     if (database_time !=3D 0):
-        database_date =3D datetime.datetime.combine(datetime.date.fromti=
mestamp(database_time), datetime.time())
-        today_date =3D datetime.datetime.combine(datetime.date.today(), =
datetime.time())
+        database_date =3D datetime.datetime.fromtimestamp(database_time,=
 tz=3Ddatetime.timezone.utc)
+        today_date =3D datetime.datetime.now(tz=3Ddatetime.timezone.utc)
         delta =3D today_date - database_date
         if delta.days < 120:
             bb.debug(2, "CVE database: performing partial update")
--=20
2.34.1


