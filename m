Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A82E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:46:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22872.1736351202764916721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1CD213D5
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:47:10 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 046CD3F66E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:46:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] autotools: log when we're removing aclocal.m4
Date: Wed,  8 Jan 2025 15:46:35 +0000
Message-ID: <20250108154636.1431857-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108154636.1431857-1-ross.burton@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209571

Some mysterious autotools errors are because upstream has a custom
aclocal.m4 that we're deleting it unless we know we're not even running
aclocal.  There's a case to be made for removing this deletion logic
on the grounds that aclocal should know what it is doing, but for now
make it clear that we're deleting a file by saying so in the task log.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index a1d8e4b3603..9e89ce40b9e 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -193,6 +193,7 @@ autotools_do_configure() {
 		# like it was auto-generated.  Work around this by blowing it away
 		# by hand, unless the package specifically asked not to run aclocal.
 		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
+			bbnote Removing existing aclocal.m4
 			rm -f aclocal.m4
 		fi
 		if [ -e configure.in ]; then
--=20
2.43.0


