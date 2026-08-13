Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB47BC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26704.1786648597591195394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ln/Dmjb5;
 spf=pass (domain: est.tech, ip: 40.107.162.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga3RjxVAkQo9Q+cH0Yo7ZXbdn9OqZJoBrpyGStgh6tCKmuzas0ER+v4L4hLDvDa/jEsqOsbWc3VdhnG+BcaPNk+OMPfzJ9HfUyLaHn5MjmI/FWKJaY0ohYUBJdUUu3OcxTqAGzLspR9fnbAnjHr440E0YrP1Pe0VdjDf8RUV5V1vZpnn8ztALa8KxdkUDGFpWO90wiEPlwLdchBj24yPPGhdpivWWJTKmy6mJj6Osm5z5ENo9WUMGCI425mC47qfP/ak/4+drY5sI7EqdApjr+v1CJkdtAPtEQ5GmwtT2chnM28xTZHdCShgKsBnGafnVU2b2BkqwIZy1auwNMlvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSw150weq0Yz+j2yzxcoiVcQEzZOhelYlXJ0D/es69o=;
 b=SweDDcS1CkC5tfZqZr1/FVzj5RfNbjsCqx29eJQRgcL3cTaIjyAYqsVcwnxbB15rXaoVVnT49ZaspmCFn2I4A1ytgDkrOgMp1jtP1XOOBoA4po985hEpp7PHvHt64TzimmvUX7w+OGwTttTIwlBa1OV77KYDZb42C7J+BTe2rrzpwSmCuVT7TUk2cUGhGu5hbxkeI4esW9kM80bLchbhULBnaRYiKlAxZEu/muMnheWBAFUdR9B7z1eWSrm3gW4DkGNoRfIu8RVUyAb5FgtASsLt8tJjNRgyB++UJvJxl5xSMxHuR0/d6p1yk62DITRsAGNZhjynr4G68hMMc5tiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSw150weq0Yz+j2yzxcoiVcQEzZOhelYlXJ0D/es69o=;
 b=ln/Dmjb5SQALir64AY4wFO/zdZOpFBNvW6BZADeiB+GPmoW4W1rXO0TyaJpy9n3pu2MRYXuszx9kfFHbHEb1F3EnhRxaQmUcwmMZqQcBbQ99Bb0rJ/CnEaxZg0GZ2ovxjeiktn/2M7bKYQBBRMgpwzQL0v2MicQhgdVt5IQeM18ZBpRdyczi+uyMOG6S0mcgCOnyNiETUf/o73OT+DCivYOr8W6RWg9Ia0n6b2B2FU+d35af1flHle0QP3c9+L3rZFJc8hTspfJJf9bi1L7fnWGVvoO8j9XPhr6zC1FcTPFfH1UZL1616z2qZD8SBIG4GaK+yfEBDReHLG5Lwv3hiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:33 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 5/5] recipes: fix trailing whitespace
Date: Thu, 13 Aug 2026 21:16:15 +0200
Message-ID: <20260813191615.34122-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0310.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e7fee0-bede-4466-3e3f-08def96f6300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|5023799004|12006099003|3023799007|22082099003|18002099003|10067099003|56012099006|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	EVi48NXSxmuqbdRho+BLZmQOBpFZ+qAswAKx+i1CVoxAgftYDIX63LmN2fzv2Sm6FP8SFAiRYIgt/tnOgFrUD9f0PJynW3Ha/oX1Wf/Ymvm82+uNUSPRdhvj69GYZYWk0kVs3Mmz/KzwwXww8AFFtxNpxrzR6/gn8B88Dx32t6DowDS2xbcVVTsTfqLHZ5xhr0hB/BJbquqczYKtRmwWI7x4o+B0pCvp05xtWB69rBkZkt1Y04Zw8FdNmey/srd4HdDDm38ByOIp8eX12jCBxQRfwgQAB4RXxRWiuXPQQ6QSHRk1J3pc06QFKD3t7ej1XBnyed/6DAh1B4t4c6NzA7h66bsz6fBrCt/Cg6dD1NRABXFPv8SWJ8bO68rInlQuML8nC8KAhl/+MY0t7DBP4CV3HDdPmIF3ZKm5B0LEhkdVmq4GmXoJue0LBTPbqcgO7Y+zshjowjp888M2QgzDCdJz7lls9rSsQvxG2eOH1kYDxabnb9AQMyvqyGvDaymARBhmBMLv2FLJ3zvHwQE9UGD/xqjoxDerGfgd2clGdAqWiSg5W6wQF/pApIRLKOKvE9QsrM7v9lxQm++FLTFXU76c/efc6PEAkkQZ0xgMSGcCebpPfT+WTTGxmfCmJ4C3NymfB6J6/c+53T2DuO/WawvhGMrVMkb+0+MMS/C7xtk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(5023799004)(12006099003)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gw3dgXVY4P8AZcMtellbxRykGD6A14gU6f3hQdBUxrH4Arq5aNPwqStcPfr4?=
 =?us-ascii?Q?su6mwjKikuDD9OTjlr7iP0izyWOSOyXrAsYeVz6Ayj1pQZzPCH6zyUn88bq7?=
 =?us-ascii?Q?fty8RWInZVXfk15GTt0+YJBHc30CdsP8J/pa/HrSR2jEF+j4HJ193ZeNoM+y?=
 =?us-ascii?Q?Px0PGCnKSNFNU0BqxUy5kFcA6PsssQe4Sz+lp6nju/xlupSqhDWy2EpuFtN6?=
 =?us-ascii?Q?ewqNanwzwOlTU81pCqCy+65bcg5H32jTL5LLygLV3ImwtdQZXtPftTM2HjZV?=
 =?us-ascii?Q?VLpkvd5bOCl/lIiTm7nLcgUanGLLv2E6NGWNXLqwOCblKfDJ4yWpQmCfaRLZ?=
 =?us-ascii?Q?3x8PSBzFSITrrswr3wSe3hgrRe87ktGVAxnVCuZ4NGHYW6dFbiAAbhk0Cugi?=
 =?us-ascii?Q?/1cgSxqHCyGnGkLAxYEkZzsgwCE5VD+irFrKOoKqe1JGpMzn0eyqi4ZUEXZH?=
 =?us-ascii?Q?0NoWYQnr/pVLoFhJ2l2S/9ns//UP5yqOeGij/hCIWIjxnj8TpIvHWH0cXczL?=
 =?us-ascii?Q?ERg3fOZ7syTWyhARRJTRimLqT/YJJWSXTDu5ya4K9s/HAcpHuApoBJpcch89?=
 =?us-ascii?Q?z/kzyuiUTHQttM5UgSbEmOhgp1LzIRaskH+Iy/7mk9svTQDgUTTWDydoqj72?=
 =?us-ascii?Q?6XXPkc60vsgjRJQFNWO2ewv3A7i+E/RhQ87KR6eU6g9POEjjfVJS6HmFSrXL?=
 =?us-ascii?Q?3rbyP0CT2li9KBoXTTCs8S/+egQoUnjiSIQEYAwtte8PPVQAOBnIlmSCZmdb?=
 =?us-ascii?Q?Cqg+mI7OWQnA1LmpYKwwFKsoYsxom+DejifFUY+aDTsp4fxlJ4yKhL2Fbh72?=
 =?us-ascii?Q?hvhkStaT1AM2UaIqVT/ZnlSgrdLShSfdxI7YQa1wP4tLQ13sQNprHl19K+f+?=
 =?us-ascii?Q?EkmPh0Rot86/BIX/f62c6yrtt4+nEmg2Y0EkqH5GOX+pqiDqzpwqHV8EmYji?=
 =?us-ascii?Q?A/kULXyod2x3aQbGIxtu9sYwjFnUVBMlsGV6e2hd6rQjCpq4Kp47eCopp6ZF?=
 =?us-ascii?Q?vR5vqSciniiFtmvENg0GD+32qbh0h5yA8GLDie8H+6CXFmCpkHa6x52dC0X1?=
 =?us-ascii?Q?KvteiFKVTPlNJperHnSCibFWe8OLDsRFwdVRO09PJGjrWHauq5vWfTixq2I7?=
 =?us-ascii?Q?A6UlPdiTRw/zmLTKih0CH4bgvL5NxV3mLtSDHZ0rWSyYGmTIBF2pY7uaGoNp?=
 =?us-ascii?Q?ggfySYe6F4KVAXv6O7nZXtQK1qam5xnh6PXpPCUvDFEVJMB36BWKUsa+QOwE?=
 =?us-ascii?Q?m1pqHZS3YEboSxC+AZ/9pT3kqJGhlN9CDJqoH48nml7yt2Gu78HFFaUU9f76?=
 =?us-ascii?Q?OC0mDrJ3no6JMDpzMGh3EU0EflkyLzfB4C4DcWX2dD/t6MFgPtQ60mT5AQEX?=
 =?us-ascii?Q?EILcr5DHePBn52HIAOs3UahTz3yX83bXKYJvpzvFunACxy6krL4eGbkF671Q?=
 =?us-ascii?Q?eevKOt06OGXHKVsXcmCRQEu84aOBUFvPYAHTdov8xbmpXlwnTkSKXnw6JVcY?=
 =?us-ascii?Q?d4k8mkjsBhSio7Z2YnTemp9BqzlEDX8cVEbMXmMHWOOc6Z6j9Y7iJ266nj57?=
 =?us-ascii?Q?x0c/xc+mUVG3MLU8fkEnnzLz6zR4mVMKlXm4cCggItMX7EqUUp+YPklXYyN1?=
 =?us-ascii?Q?wA80TsgO6CfWorMofyUsGNNdxYy6jQMoOg31x03LHgOtwNSK8iao8yHfCwNy?=
 =?us-ascii?Q?F1f2NlNrlfsS0jUJ0gkVFmXpmeY1KSZ7YNqCJJY7I+ZV9ETgBqmMp/w3X31O?=
 =?us-ascii?Q?hANH1AQ3MUKmCFqxzcDTHO1Cw9VuqnYxbmcucYXxj1ddOTBylFLMzDeDfYXh?=
X-MS-Exchange-AntiSpam-MessageData-1: 7GDncFTYf7xav69K3xe5dtSY4JTWJGmPGBk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e7fee0-bede-4466-3e3f-08def96f6300
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:33.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6txjtV9AbubSeraZaILnUtYIV6yyn3WPDZzD4O3F4coyMq+kraxDMvllHtQlcupWFfLieNpnoPNrNV9fRBXptiit1WcTIiJ3wMQM36X/+2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243386

Fix trailing whitespace in recipe files to resolve bitbake parsing
warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb  |  2 +-
 .../base-files/base-files_3.0.14.bb           |  2 +-
 .../gettext/gettext-minimal-native_1.0.bb     |  2 +-
 meta/recipes-core/glibc/glibc-scripts.inc     |  2 +-
 .../initramfs-live-install_1.0.bb             |  2 +-
 .../nativesdk-packagegroup-sdk-host.bb        |  2 +-
 .../packagegroup-cross-canadian.bb            |  2 +-
 meta/recipes-devtools/apt/apt_3.0.3.bb        |  2 +-
 .../autoconf/autoconf_2.73.bb                 |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           | 24 +++++++++----------
 .../gcc/gcc-configure-common.inc              |  2 +-
 .../gcc/gcc-multilib-config.inc               |  2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +-
 .../opkg/opkg-arch-config_1.0.bb              |  2 +-
 meta/recipes-devtools/perl/perl_5.44.0.bb     |  4 ++--
 meta/recipes-devtools/pseudo/pseudo.inc       |  6 ++---
 meta/recipes-devtools/ruby/ruby_4.0.6.bb      |  2 +-
 .../iptables/iptables_1.8.13.bb               |  2 +-
 meta/recipes-extended/mc/mc_4.8.33.bb         |  6 ++---
 .../perl/libxml-sax-perl_1.02.bb              |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  4 ++--
 .../xorg-font/xorg-font-common.inc            |  2 +-
 .../xorg-lib/pixman_0.46.4.bb                 |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc |  8 +++----
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 .../lttng/lttng-tools_2.15.1.bb               |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 meta/recipes-support/libcap/libcap_2.78.bb    |  4 ++--
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  2 +-
 .../recipes-support/numactl/numactl_2.0.19.bb |  2 +-
 31 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.9.bb
index 7cf0eb2b71..15189d0906 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -184,7 +184,7 @@ do_install:append() {
 	sed -i -e 's,@sbindir@,${sbindir},g' -e 's,@sysconfdir@,${sysconfdir},g' =
${D}${sysconfdir}/init.d/avahi-*
 }
=20
-# At the time the postinst runs, dbus might not be setup so only restart i=
f running=20
+# At the time the postinst runs, dbus might not be setup so only restart i=
f running
 # Don't exit early, because update-rc.d needs to run subsequently.
 pkg_postinst:avahi-daemon () {
 if [ -z "$D" ]; then
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index 332c094eee..df7ba4e4bc 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "The base-files package creates the basic s=
ystem directory structu
 SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://licenses/GPL-2;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f"
-# Removed all license related tasks in this recipe as license.bbclass=20
+# Removed all license related tasks in this recipe as license.bbclass
 # now deals with this. In order to get accurate licensing on to the image:
 # Set COPY_LIC_MANIFEST to just copy just the license.manifest to the imag=
e
 # For the manifest and the license text for each package:
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb b/meta=
/recipes-core/gettext/gettext-minimal-native_1.0.bb
index c0cd701ab1..2b4af91581 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -45,5 +45,5 @@ do_install () {
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same=
 place, rename it
 	# cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Ma=
kevars.template.minimal
-	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template $=
{D}${datadir}/gettext/po/Makevars.template.minimal=20
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template $=
{D}${datadir}/gettext/po/Makevars.template.minimal
 }
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/=
glibc/glibc-scripts.inc
index 47216ae7d7..cdf4dce928 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -15,7 +15,7 @@ do_install() {
 	done
 }
=20
-# sotruss script requires sotruss-lib.so (given by libsotruss package),=20
+# sotruss script requires sotruss-lib.so (given by libsotruss package),
 # to produce trace of the library calls.
 RDEPENDS:${PN} +=3D "libsotruss"
=20
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb =
b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 791bd57171..95136c54ec 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -12,7 +12,7 @@ do_install() {
         install -m 0755 ${S}/init-install.sh ${D}/install.sh
 }
=20
-# While this package maybe an allarch due to it being a=20
+# While this package maybe an allarch due to it being a
 # simple script, reality is that it is Host specific based
 # on the COMPATIBLE_HOST below, which needs to take precedence
 #inherit allarch
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-hos=
t.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 51e48f250b..d0dffb5815 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -9,7 +9,7 @@ inherit_defer nativesdk
=20
 PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
=20
-# autoconf pulls in nativesdk-perl but perl-module-integer is needed to=20
+# autoconf pulls in nativesdk-perl but perl-module-integer is needed to
 # build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} =3D "\
     nativesdk-pkgconfig \
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb=
 b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 4b0499b1b9..b87721a4bc 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,7 +17,7 @@ RDEPENDS:${PN} =3D "\
     meta-environment-${MACHINE} \
     "
=20
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine =
definition is updated),=20
+# When TUNE_ARCH changes but MACHINE does not (for example when a machine =
definition is updated),
 # cross-canadian.bbclass prevents variable dependency propagation to TRANS=
LATED_TARGET_ARCH
 # This will result in erroneous reuse of previous sstate packages. The fol=
lowing line
 # establishes a direct dependency instead.
diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools=
/apt/apt_3.0.3.bb
index 08b6bac2e4..5241626e05 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -55,7 +55,7 @@ EXTRA_OECMAKE:append =3D " -DCURRENT_VENDOR=3Ddebian -DWI=
TH_DOC=3DFalse \
 "
=20
 PACKAGECONFIG ??=3D ""
-# usrmerge displays a runtime warning during package installation in case=
=20
+# usrmerge displays a runtime warning during package installation in case
 # the system doesn't have merged /usr folders.
 PACKAGECONFIG[usrmerge] =3D "-DREQUIRE_MERGED_USR=3DON,-DREQUIRE_MERGED_US=
R=3DOFF"
=20
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.73.bb b/meta/recipes=
-devtools/autoconf/autoconf_2.73.bb
index 15baa47e63..227fd043cc 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.73.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "A GNU tool that produce shell scripts to automatically config=
ure software"
-DESCRIPTION =3D "Autoconf is an extensible package of M4 macros that produ=
ce shell scripts to automatically \=20
+DESCRIPTION =3D "Autoconf is an extensible package of M4 macros that produ=
ce shell scripts to automatically \
 configure software source code packages. Autoconf creates a configuration =
script for a package from a template \
 file that lists the operating system features that the package can use, in=
 the form of M4 macro calls."
 LICENSE =3D "GPL-3.0-or-later"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/r=
ecipes-devtools/bootchart2/bootchart2_0.14.9.bb
index c03bee4c1f..05226030eb 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -1,20 +1,20 @@
 # Copyright (c) 2013 LG Electronics, Inc.
 # Copyright (C) 2014 Intel Corp.
=20
-# This recipe creates packages for the bootchart2 system-wide profiler dae=
mon=20
+# This recipe creates packages for the bootchart2 system-wide profiler dae=
mon
 # and related utilities. Depending on the images you're building, addition=
al
 # configuration may be needed in order to use it.
 #
 # Packages:
 #   *   bootchart2 - The daemon itself.
 #   *   pybootchartgui - Python program to visualize and display the data
-#       collected by bootchart2 or compatible daemons such as the original=
=20
+#       collected by bootchart2 or compatible daemons such as the original
 #       bootchart.
 #   *   bootchartd-stop-initscript - A SysV init script to stop data colle=
ction
 #       when booting completes (see below for details.)
 #
-# While bootchart2 is designed to stop collecting data roughly when the bo=
ot=20
-# process completes, it is not exactly a stopwatch. It has a list of progr=
ams=20
+# While bootchart2 is designed to stop collecting data roughly when the bo=
ot
+# process completes, it is not exactly a stopwatch. It has a list of progr=
ams
 # which are supposed signify that the boot process has completed (for exam=
ple,
 # openbox or gnome-shell,) but it waits a full 20 seconds after such a pro=
gram
 # is launched before stopping itself, to collect additional data.
@@ -30,22 +30,22 @@
 # You might set this command to be launched by the desktop environment shi=
pped
 # on the image you're building after the other startup programs are comple=
te.
 # This will not incur the 20 second wait period and will cause bootchart2 =
to
-# behave a bit more like a stopwatch. An example of this is shown in this=
=20
+# behave a bit more like a stopwatch. An example of this is shown in this
 # recipe, specifically the bootchartd-stop-initscript package, which stops=
 data
 # collection as the last action when switching to runlevels 2 through 5. Y=
ou can
 # add bootchartd-stop-initscript to IMAGE_INSTALL if you need to use it.
 #
-# Unless you're doing something special, if your image does not launch an =
X=20
+# Unless you're doing something special, if your image does not launch an =
X
 # window manager, you will need to add bootchartd-stop-initscript to your =
image.
 #
 # Bootchart2 can be started in two ways. Data collection can be initiated =
by
 # running the following command:
 #   bootchartd start
 # However, for the most complete data, the bootchart2 developers recommend
-# running it as PID 1. This can be done by adding the following to the ker=
nel=20
+# running it as PID 1. This can be done by adding the following to the ker=
nel
 # command line parameters in the bootloader setup:
 #   init=3D/sbin/bootchartd
-# When invoked this way, bootchart2 will set itself up and then automatica=
lly=20
+# When invoked this way, bootchart2 will set itself up and then automatica=
lly
 # run /sbin/init. For example, when booting the default qemux86 image, one=
 might
 # use a command like this:
 #   runqemu qemux86 bootparams=3D"initcall_debug printk.time=3Dy quiet \
@@ -54,10 +54,10 @@
 # Neither method is actually implemented here, choose what works for you.
 #
 # If you are building your image with systemd instead of SysV init, bootch=
art2
-# includes systemd service files to begin collection automatically at boot=
 and=20
+# includes systemd service files to begin collection automatically at boot=
 and
 # end collection automatically 20 seconds after the boot process has compl=
eted.
 # However, be aware that systemd tends to start bootchart2 relatively late=
 into
-# the boot process, so it's highly recommended to use bootchart2 as PID 1.=
 If=20
+# the boot process, so it's highly recommended to use bootchart2 as PID 1.=
 If
 # you're using systemd and you wish to use another method to stop data
 # collection at a time of your choosing, you may do so as long as you get =
to it
 # before the 20 second timeout of the systemd service files. Also, you may=
 write
@@ -76,8 +76,8 @@
 # and find pybootchartgui in the native sysroot:
 #    bitbake bootchart2-native
 #   ./tmp/sysroots/x86_64-linux/usr/bin/pybootchartgui /path/to/bootchart.=
tgz
-# Note that, whether installed on your build system or on your image, the=
=20
-# pybootchartgui provided by this recipe does not support the -i option. Y=
ou=20
+# Note that, whether installed on your build system or on your image, the
+# pybootchartgui provided by this recipe does not support the -i option. Y=
ou
 # will need to install pybootchartgui by other means in order to run it in
 # interactive mode.
=20
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/reci=
pes-devtools/gcc/gcc-configure-common.inc
index f152ae5555..ff98f828e5 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -42,7 +42,7 @@ EXTRA_OECONF =3D "\
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
=20
-# glibc version is a minimum controlling whether features are enabled.=20
+# glibc version is a minimum controlling whether features are enabled.
 # Doesn't need to track glibc exactly
 EXTRA_OECONF:append:libc-glibc =3D " --with-glibc-version=3D2.28 "
=20
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recip=
es-devtools/gcc/gcc-multilib-config.inc
index 2afd8f6f2a..cafc64971d 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -14,7 +14,7 @@
 #    gcc/config/mips/linux64.h
 #    gcc/config/rs6000/linux64.h
=20
-MULTILIB_OPTION_WHITELIST ??=3D "-m32 -m64 -mx32 -mabi=3Dn32 -mabi=3D32 -m=
abi=3D64"=20
+MULTILIB_OPTION_WHITELIST ??=3D "-m32 -m64 -mx32 -mabi=3Dn32 -mabi=3D32 -m=
abi=3D64"
=20
 python gcc_multilib_setup() {
     import re
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc
index 9e65ee5bcf..626bf955f8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -102,7 +102,7 @@ do_install () {
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
-		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include=20
+		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TAR=
GET_SYS}/${BINV}/include
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BI=
NV}/include
 	fi
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/reci=
pes-devtools/opkg/opkg-arch-config_1.0.bb
index 9e9e70209e..4034a6ddec 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -13,7 +13,7 @@ do_compile() {
 	rm -f $archconf
 	ipkgarchs=3D"${ALL_MULTILIB_PACKAGE_ARCHS}"
 	priority=3D1
-	for arch in $ipkgarchs; do=20
+	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> $archconf
 		priority=3D$(expr $priority + 5)
 	done
diff --git a/meta/recipes-devtools/perl/perl_5.44.0.bb b/meta/recipes-devto=
ols/perl/perl_5.44.0.bb
index ef76df7e0f..2c2e075578 100644
--- a/meta/recipes-devtools/perl/perl_5.44.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -310,8 +310,8 @@ PACKAGES +=3D "${PN}-pod"
 FILES:${PN}-pod =3D "${libdir}/perl5/${PV}/pod \
                    ${libdir}/perl5/${PV}/*.pod \
                    ${libdir}/perl5/${PV}/*/*.pod \
-                   ${libdir}/perl5/${PV}/*/*/*.pod \=20
-                   ${libdir}/perl5/${PV}/*/*/*/*.pod \=20
+                   ${libdir}/perl5/${PV}/*/*/*.pod \
+                   ${libdir}/perl5/${PV}/*/*/*/*.pod \
                   "
=20
 PACKAGES +=3D "${PN}-module-cpan ${PN}-module-unicore"
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtool=
s/pseudo/pseudo.inc
index 836e910fae..ba946ef9c9 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -77,7 +77,7 @@ warn_32bit_missing() {
 }
=20
 # Two below are the same
-# If necessary compile for the alternative machine arch.  This is only=20
+# If necessary compile for the alternative machine arch.  This is only
 # necessary in a native build.
 do_compile:prepend:class-native () {
 	maybe_make32
@@ -96,7 +96,7 @@ do_compile:prepend:class-native () {
 		oe_runmake ${MAKEOPTS} libpseudo
 		eval "$save_traps"
 		# prevent it from removing the lib, but remove everything else
-		make 'LIB=3Dfoo' ${MAKEOPTS} distclean=20
+		make 'LIB=3Dfoo' ${MAKEOPTS} distclean
 	fi
 }
=20
@@ -108,7 +108,7 @@ do_compile:prepend:class-nativesdk () {
 		./configure ${PSEUDO_EXTRA_OPTS} --prefix=3D${prefix} --libdir=3D${prefi=
x}/lib/pseudo/lib --with-sqlite-lib=3D${baselib} --with-sqlite=3D${STAGING_=
DIR_TARGET}${exec_prefix} --bits=3D32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
-		make 'LIB=3Dfoo' ${MAKEOPTS} distclean=20
+		make 'LIB=3Dfoo' ${MAKEOPTS} distclean
 	fi
 }
=20
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtoo=
ls/ruby/ruby_4.0.6.bb
index a6fb0d0e09..d2a81a0ba5 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -115,7 +115,7 @@ do_install_ptest () {
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
     cp -r ${S}/lib/did_you_mean ${D}${PTEST_PATH}/lib
-    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/=
lib   =20
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/=
lib
=20
     # install test-binaries
     # These .so files have sporadic reproducibility fails as seen here:
diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recip=
es-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..f2a4f402ae 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -71,7 +71,7 @@ do_install:append() {
=20
     # if libnftnl is included, make the iptables symlink point to the nft-=
based binary by default
     if ${@bb.utils.contains('PACKAGECONFIG', 'libnftnl', 'true', 'false', =
d)} ; then
-        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables=20
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restor=
e
         # ethertypes is provided by the netbase package
diff --git a/meta/recipes-extended/mc/mc_4.8.33.bb b/meta/recipes-extended/=
mc/mc_4.8.33.bb
index fd18edf7be..0682ae4bb6 100644
--- a/meta/recipes-extended/mc/mc_4.8.33.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -37,7 +37,7 @@ CACHED_CONFIGUREVARS +=3D "mc_cv_have_zipinfo=3Dyes"
=20
 do_install:append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.=
d/*
-       =20
+
         rm ${D}${libexecdir}/mc/extfs.d/s3+ ${D}${libexecdir}/mc/extfs.d/u=
c1541
 }
=20
@@ -47,8 +47,8 @@ SUMMARY:${BPN}-helpers-perl =3D "Midnight Commander Perl-=
based helper scripts"
 FILES:${BPN}-helpers-perl =3D "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/m=
c/extfs.d/apt+ \
                              ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc=
/extfs.d/deba \
                              ${libexecdir}/mc/extfs.d/debd ${libexecdir}/m=
c/extfs.d/dpkg+ \
-                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}=
/mc/extfs.d/patchfs \=20
-                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/=
mc/extfs.d/ulib \=20
+                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}=
/mc/extfs.d/patchfs \
+                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/=
mc/extfs.d/ulib \
                              ${libexecdir}/mc/extfs.d/uzip"
 RDEPENDS:${BPN}-helpers-perl =3D "perl"
=20
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/reci=
pes-extended/perl/libxml-sax-perl_1.02.bb
index 167591145c..51baf12f8d 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Perl module for using and building Perl SAX2 XML processors"
 HOMEPAGE =3D "https://metacpan.org/dist/XML-SAX"
 DESCRIPTION =3D "XML::SAX consists of several framework classes for using =
and \
-building Perl SAX2 XML parsers, filters, and drivers.  It is designed \=20
+building Perl SAX2 XML parsers, filters, and drivers.  It is designed \
 around the need to be able to "plug in" different SAX parsers to an \
 application without requiring programmer intervention.  Those of you \
 familiar with the DBI will be right at home.  Some of the designs \
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-ext=
ended/psmisc/psmisc_23.7.bb
index 44f8530977..ad57c49ffe 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -18,8 +18,8 @@ SRCREV =3D "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
=20
 inherit autotools gettext
=20
-# Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y=20
-# don't ship a po/POTFILES.in (which is silly).  Without that file gettext=
=20
+# Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y
+# don't ship a po/POTFILES.in (which is silly).  Without that file gettext
 # doesn't believe po/ is a gettext directory and won't generate po/Makefil=
e.
 do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/re=
cipes-graphics/xorg-font/xorg-font-common.inc
index a11b8e8ab2..ae70a3db8a 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -24,7 +24,7 @@ do_install:append() {
 	find ${D}${libdir}/X11/fonts -type f -name fonts.dir | xargs rm -f
 	find ${D}${libdir}/X11/fonts -type f -name fonts.scale | xargs rm -f
 	find ${D}${datadir}/fonts/X11 -type f -name fonts.dir | xargs rm -f
-	find ${D}${datadir}/fonts/X11 -type f -name fonts.scale | xargs rm -f=09
+	find ${D}${datadir}/fonts/X11 -type f -name fonts.scale | xargs rm -f
 }
=20
 FILES:${PN} +=3D " ${libdir}/X11/fonts ${datadir}"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recipes=
-graphics/xorg-lib/pixman_0.46.4.bb
index d86aa78b9a..06da15bcfa 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -26,7 +26,7 @@ inherit meson pkgconfig
 # These are for the tests and demos, which we don't install
 EXTRA_OEMESON =3D "-Dgtk=3Ddisabled -Dlibpng=3Ddisabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
-# linking mips:loongson_2f module with previous mips:isa64 modules=20
+# linking mips:loongson_2f module with previous mips:isa64 modules
 EXTRA_OEMESON +=3D "-Dloongson-mmi=3Ddisabled"
=20
 EXTRA_OEMESON:append:class-target:powerpc =3D " ${@bb.utils.contains("TUNE=
_FEATURES", "altivec", "-Dvmx=3Denabled", "-Dvmx=3Ddisabled", d)}"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta=
/recipes-kernel/kern-tools/kern-tools-native_git.bb
index cb09800535..ce4730fc78 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -22,7 +22,7 @@ do_configure() {
 	:
 }
=20
-do_compile() {=20
+do_compile() {
 	:
 }
=20
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index c93966e370..eeb42b24cc 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -5,14 +5,14 @@ SECTION =3D "devel"
 LICENSE =3D "GPL-2.0-only"
=20
 #########################################################################
-####                        PLEASE READ=20
+####                        PLEASE READ
 #########################################################################
 #
 # You're probably looking here thinking you need to create some new copy
-# of linux-libc-headers since you have your own custom kernel. To put=20
+# of linux-libc-headers since you have your own custom kernel. To put
 # this simply, you DO NOT.
 #
-# Why? These headers are used to build the libc. If you customise the=20
+# Why? These headers are used to build the libc. If you customise the
 # headers you are customising the libc and the libc becomes machine
 # specific. Most people do not add custom libc extensions to the kernel
 # and have a machine specific libc.
@@ -27,7 +27,7 @@ LICENSE =3D "GPL-2.0-only"
 #
 # There can also be a case where your kernel extremely old and you want
 # an older libc ABI for that old kernel. The headers installed by this
-# recipe should still be a standard mainline kernel, not your own custom=20
+# recipe should still be a standard mainline kernel, not your own custom
 # one.
 #
 # -- RP
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kern=
el/linux/kernel-devsrc.bb
index ca1a08cba3..a684ee8648 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -131,7 +131,7 @@ do_install() {
         rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.cm=
d
         rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
-        rm -f $kerneldir/build/include/generated/.vdso64-offsets.h.cmd=20
+        rm -f $kerneldir/build/include/generated/.vdso64-offsets.h.cmd
     )
=20
     # now grab the chunks from the source tree that we need
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.15.1.bb
index 4623e114ba..040632d671 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
@@ -73,7 +73,7 @@ FILES:${PN} +=3D "${libdir}/lttng/libexec/* ${datadir}/xm=
l/lttng \
 FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
=20
-# Since files are installed into ${libdir}/lttng/libexec we match=20
+# Since files are installed into ${libdir}/lttng/libexec we match
 # the libexec insane test so skip it.
 # Python module needs to keep _lttng.so
 INSANE_SKIP:${PN} =3D "libexec dev-so"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 25852f8a22..b9f26e051b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -445,4 +445,4 @@ perf_fix_sources () {
 # Rust in kernel support pulls in clang-native, which satisfies the
 # BUILD_BPF_SKEL dependency checks and causes perf to attempt
 # building bpftool, resulting in a build failure.
-PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"=20
+PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"
diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-supp=
ort/libcap/libcap_2.78.bb
index d804e94244..e31fab39c4 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -75,13 +75,13 @@ LIBCAP_PTEST_TESTS =3D " \
   exploit \
   noexploit \
 "
-=20
+
 do_compile_ptest() {
         oe_runmake -C tests ${LIBCAP_PTEST_TESTS} \
                 AR=3D"${AR}" \
                 CC=3D"${CC}" \
                 RANLIB=3D"${RANLIB}" \
-                OBJCOPY=3D"${OBJCOPY}"=20
+                OBJCOPY=3D"${OBJCOPY}"
         oe_runmake -C libcap cap_test \
                 AR=3D"${AR}" \
                 CC=3D"${CC}" \
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 0eb263b017..e8fa4a5eec 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-55199.patch \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
-           file://CVE-2025-15661-3.patch \	  =20
+           file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-=
support/numactl/numactl_2.0.19.bb
index 35bb401935..80468472ee 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Development package for building Applications that use numa"
-HOMEPAGE =3D "http://oss.sgi.com/projects/libnuma/"=20
+HOMEPAGE =3D "http://oss.sgi.com/projects/libnuma/"
 DESCRIPTION =3D "Simple NUMA policy support. It consists of a numactl prog=
ram \
 to run other programs with a specific NUMA policy and a libnuma to do \
 allocations with NUMA policy in applications."

