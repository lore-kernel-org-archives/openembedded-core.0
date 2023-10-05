Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27721E7C4FB
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:54:26 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.113])
 by mx.groups.io with SMTP id smtpd.web11.11075.1696496064600311461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@brightsigninfo.onmicrosoft.com header.s=selector2-brightsigninfo-onmicrosoft-com header.b=V03n3ovt;
 spf=pass (domain: brightsign.biz, ip: 40.107.93.113, mailfrom: mcrowe@brightsign.biz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfD4Shvi9j4ejVt7xLAwHWiKv9EIhNs3gByDCiTRIXD1JI+e4+RWHweqaVZhKhI7k/kIA11GON0263RNqoglknBPMHHUtNpvBiuQklQuhQ2w9kHSRopYXDtOngMSnXx0OupGPEh4Q+/z0r4v5q8PZCODm7I//GE7/Ons9InZJJu+yG7uMDTTeQPNss+cSiSUc4ie5nc7x4Ke+V7vaYoLUYiDRhQ0ZYPqMjnQThWIgf9GSG/btP6VK8duOLr2T/3PdLVQLkIc/mw1iyWZu0quRp/yX8cR0h8XpQu3Adt+siUKS5Quu4L65mmw+wbyt8nfwpbaeUmQtaA/++C3eWcgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8LHy0xUSENdQMIRpP9G+DDOSwgLH6+AJIfbYHdjbV0=;
 b=T/IAHUEXUW4oCb4f5ZOCMitzwq9lSlqQ5Pk18K0EF/QLu/Y0si+5aDPLta+g0dYRfHcGiq+D2oS2oSskkqIvkyYPEPdupMqxWv5iRdn9RDhTRAbpxwf0vLRe4+Wh3QKdiHGC45juQwcgOtx5K2SF9mpBjU0U22Vwx7KajOPSZtOUsNpy/ejKEZ2gMywXx7WEbqL0K2JMxA7FO8AtSOZSZqppsMCThcI++Su6hVNn3H6XwJNqWA9sNQy5eRclb/iWGSFbmfZtlElj88TC/ge0G7+du1U/6LlTTNvoqchbxHO6qJhf3FCoaxIDpNPb5RgZDDpmrBSdw7Y62cB6RUUH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.222.38.66) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=brightsign.biz; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=mcrowe.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brightsigninfo.onmicrosoft.com; s=selector2-brightsigninfo-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8LHy0xUSENdQMIRpP9G+DDOSwgLH6+AJIfbYHdjbV0=;
 b=V03n3ovt7s7IxFKreXzLPJiqzSSpVs+VcSBV1lh/9Dq/8BB1telIbxH1jAT6UCFZS2yvsO3jx+Bt3n1qsdiHscLAXxmxfiYpgGioCKNvwNBsUUdViLuc5yeI2a9fJTpPD8dmA4yWbwa4XKV4Fgse8SMCWKHsIGFO6GIoTwcx6jE=
Received: from BN0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:408:ec::17)
 by EA2PR22MB5329.namprd22.prod.outlook.com (2603:10b6:303:25d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 08:54:20 +0000
Received: from BN8NAM04FT011.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::c1) by BN0PR04CA0102.outlook.office365.com
 (2603:10b6:408:ec::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Thu, 5 Oct 2023 08:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.222.38.66)
 smtp.mailfrom=brightsign.biz; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=mcrowe.com;
Received-SPF: Pass (protection.outlook.com: domain of brightsign.biz
 designates 212.222.38.66 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.222.38.66;
 helo=elite.brightsign; pr=C
Received: from elite.brightsign (212.222.38.66) by
 BN8NAM04FT011.mail.protection.outlook.com (10.13.161.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.29 via Frontend Transport; Thu, 5 Oct 2023 08:54:20 +0000
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.92)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1qoK7f-0001LH-FO; Thu, 05 Oct 2023 09:54:19 +0100
Received: from mac by chuckie with local (Exim 4.96)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1qoK7f-009EUy-1P;
	Thu, 05 Oct 2023 09:54:19 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney Tunables"
Date: Thu,  5 Oct 2023 09:54:07 +0100
Message-Id: <20231005085407.2200644-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM04FT011:EE_|EA2PR22MB5329:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6339c71c-4f67-4459-d4b8-08dbc580aa10
X-MS-Exchange-AtpMessageProperties: SA
X-IPW-GroupMember: False
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KAZW1zndGq9q8lwnGfjB/VfgAO1wV0pOWLOC4+6ds8yOAusJGsiICut3SPfeefBe0b+JzUZ6xXAjPvdgVTDkeQ0tvqkcczVKmNMPTN4zbi33HBhtowEoG6P/E3F039PUfA+5rlCZTZZkrYTSdE2mt4GktqlW0+CE7Q/QMhbUv9IW/cIE3dcfGu547h9tg3iuB0vbYjt+mFAqOxqMrEYMefzClUMj7edoWOZjQhfbHAV5GX9U1K8KOWI5cWJejLbITE2qV/qAYkYHuGeXkyBsSAFE7SYIBFtdtfoN4bfQ5a9lms7g2WoDo85rXe5DJCN9UvalixYIpGvJSc5hFXZ/crVto8csMx7dozEqH7nU97uoMlEFYfSGwafM/5r13rMZManAImfOOdBNl5P/vxkhCqagxI1uOHoSkgW1CxSMXvTcPgb4uaDl8asYQpTAceABi/zg8IrO8oxKSvjcjiLbJcDHb41+EMaIhpzbVsrtqGjX5Coe1HMINrJxHPa7sfK17P2jd9jPQJhKqZLeNuRTzB8r+ul857B2x+4skuTGxZIEojFN87QmrqqhPLXXpOz4NOyLa290gcbJsxJvFxz546q7Pu5Q7qXsAEqq/LnzxGfyOgOP9JKq2zcvGHQDwQMctT2R3e7V5Mc3pMggFa9hUScLHiAYAJVfZzCUxCP6YoQSlCSapg+RIWKOrwMXE99y3qGZTlsfP5nEEyII6mDKeWR4JucsKjaJzLri2D2pi4key5Gi3sKxr3zVZneWOciv1GxFahiBWD9eq4uMB4VHmg==
X-Forefront-Antispam-Report: 
	CIP:212.222.38.66;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:elite.brightsign;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39850400004)(346002)(376002)(61400799006)(48200799006)(186009)(451199024)(82310400011)(64100799003)(46966006)(36840700001)(81166007)(2616005)(83170400001)(82740400003)(6666004)(26005)(5660300002)(8936002)(4326008)(8676002)(478600001)(47076005)(356005)(966005)(70586007)(40480700001)(1076003)(70206006)(6916009)(316002)(36860700001)(66899024)(9786002)(9746002)(9686003)(42882007)(426003)(336012)(83380400001)(36756003)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: brightsign.biz
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 08:54:20.2616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6339c71c-4f67-4459-d4b8-08dbc580aa10
X-MS-Exchange-CrossTenant-Id: 8fbcdf64-1ab8-47ce-bdc7-43e23b04fb3c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8fbcdf64-1ab8-47ce-bdc7-43e23b04fb3c;Ip=[212.222.38.66];Helo=[elite.brightsign]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM04FT011.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188708

From: Mike Crowe <mac@mcrowe.com>

Take the patch from the source for Debian's glibc 2.31-13+deb11u7
package, the changelog for which starts with:

 glibc (2.31-13+deb11u7) bullseye-security; urgency=3Dmedium

   * debian/patches/any/local-CVE-2023-4911.patch: Fix a buffer overflow in=
 the
     dynamic loader's processing of the GLIBC_TUNABLES environment variable
     (CVE-2023-4911).

This addresses the "Looney Tunables" vulnerability described at
https://www.qualys.com/2023/10/03/cve-2023-4911/looney-tunables-local-privi=
lege-escalation-glibc-ld-so.txt

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../glibc/glibc/CVE-2023-4911.patch           | 63 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-4911.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch b/meta/recip=
es-core/glibc/glibc/CVE-2023-4911.patch
new file mode 100644
index 0000000000..4d3146509a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
@@ -0,0 +1,63 @@
+From d2b77337f734fcacdfc8e0ddec14cf31a746c7be Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@redhat.com>
+Date: Mon, 11 Sep 2023 18:53:15 -0400
+Subject: [PATCH v2] tunables: Terminate immediately if end of input is rea=
ched
+
+The string parsing routine may end up writing beyond bounds of tunestr
+if the input tunable string is malformed, of the form name=3Dname=3Dval.
+This gets processed twice, first as name=3Dname=3Dval and next as name=3Dv=
al,
+resulting in tunestr being name=3Dname=3Dval:name=3Dval, thus overflowing
+tunestr.
+
+Terminate the parsing loop at the first instance itself so that tunestr
+does not overflow.
+---
+Changes from v1:
+
+- Also null-terminate tunestr before exiting.
+
+ elf/dl-tunables.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2023-4911
+
+diff --git a/elf/dl-tunables.c b/elf/dl-tunables.c
+index 8e7ee9df10..76cf8b9da3 100644
+--- a/elf/dl-tunables.c
++++ b/elf/dl-tunables.c
+@@ -187,11 +187,7 @@ parse_tunables (char *tunestr, char *valstring)
+       /* If we reach the end of the string before getting a valid name-va=
lue
+        pair, bail out.  */
+       if (p[len] =3D=3D '\0')
+-      {
+-        if (__libc_enable_secure)
+-          tunestr[off] =3D '\0';
+-        return;
+-      }
++      break;
+
+       /* We did not find a valid name-value pair before encountering the
+        colon.  */
+@@ -251,9 +247,16 @@ parse_tunables (char *tunestr, char *valstring)
+           }
+       }
+
+-      if (p[len] !=3D '\0')
+-      p +=3D len + 1;
++      /* We reached the end while processing the tunable string.  */
++      if (p[len] =3D=3D '\0')
++      break;
++
++      p +=3D len + 1;
+     }
++
++  /* Terminate tunestr before we leave.  */
++  if (__libc_enable_secure)
++    tunestr[off] =3D '\0';
+ }
+ #endif
+
+--
+2.41.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glib=
c/glibc_2.31.bb
index 8d216f6ed1..1862586749 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -80,6 +80,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patc=
h \
            file://0037-Avoid-deadlock-between-pthread_create-and-ctors.pat=
ch \
            file://CVE-2023-0687.patch \
+           file://CVE-2023-4911.patch \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--
2.39.2

BrightSign considers your privacy to be very important. The emails you send=
 to us will be protected and secured. Furthermore, we will only use your em=
ail and contact information for the reasons you sent them to us and for tra=
cking how effectively we respond to your requests.

