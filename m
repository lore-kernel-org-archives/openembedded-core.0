Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BEACD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:33:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45290.1781883213835165300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=W0Fj5qiL;
 spf=pass (domain: est.tech, ip: 40.107.159.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqd9GVD3a3kuHUIvNrwcvaWn1cKIcWdH616te71VStdJHupTG0JEcD8keCLcZD3ytTGNARzn7fFnPtIqsn2IsSxM7iHg22EeyRgSisoCxkqTylGDKqkL1vIqLQD6wv8p/YspKfKQ71jWMvNhYys4Ze7twvB8GbkWNrwVMANCuLOFDz3nqsC76265wamof7SZ8CgVSf95Vk/WkhZD6KcilMt8cJImgiJJe13vvvbXs5X4gbfC7aRGLijn43Qs/Pi0RXxlisYvgi/Q1U0L1cakAz+JFw8nd8LO7Q+JaUQmdyNbCzAOtxrdB1t5thCW3Lf5w6qdu3Dqn/eaXgoVl3vD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLVlZ5OFHREzlZQxyeYvrfVOo7j8lPPbSrIJjZV5W/Q=;
 b=DdTlmeulahnMO3JAVHj63fSbb4gYyzWYHEMdHHOnekfNsqxzQsI8NBnby7dLaLmfQ/SfAYDXkRSWqWqr6EuMvUjr/IPH8LjoExXm0oLBZ9IF990ZwlkATW93S9E0P5Z+or6upcggwooK6yidZQL/8VTJz9NAMcsJnQHwSXiEscbi+WmdXFwp39uVb1cO/uDZsSFPDdJUuS3DO8gbyG76Ijm+OYzIU4uNB0vSTQgIK/hqW6lI1zj78k8GosxP8ieoiICTOa4TL+sYTDu0RPS5hxWb9dhPt3PJLitUPf1JGYEH//f9WvfUtse1+ZLpj8M6510foxZFcHyeuZcUNvvmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLVlZ5OFHREzlZQxyeYvrfVOo7j8lPPbSrIJjZV5W/Q=;
 b=W0Fj5qiLo7DmBAFgqQ2JEA2eTl6fNagnltMl8BM7yRI6Y/k42WqXu2wkz0GmVQTnulT8w4jPMhNzSuDH8gqXWWihFrdVWxPmbLuqSYu8jCASCxMyPVJkheopla5NOMFP6Cmm3BGyoHCiFrWXdTtO9QncmZqwHp5edSREJKPkzngwXMHnbLdYiQ4hYnopxX1lWcZGnmISXRIdm6TXh1H73+Oxi4wjGL/LpOA896Ip8o7vzsxe4T3SUGuGCfyKHU4XAFV7by8VHZnjVpj4io2U2+khTC65+j9scOep7v8VsjRVFwDb05+n1qGRjji4u4DypFiG3N7llNqf6eSp/j+PYQ==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB1240.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:33:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 15:33:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: Jaipaul Cheernam via lists.openembedded.org
	<jaipaul.cheernam=est.tech@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jaipaul Cheernam
	<jaipaul.cheernam@est.tech>
Subject: Re: [OE-core] [PATCH v2] install-buildtools: auto-discover
 environment setup script via glob
Thread-Topic: [OE-core] [PATCH v2] install-buildtools: auto-discover
 environment setup script via glob
Thread-Index: AQHc/X8Cha2xGOD+nU+Hd6VV5mdcB7ZGBraU
Date: Fri, 19 Jun 2026 15:33:28 +0000
Message-ID: 
 <DU7PPF66507B2D7AB53E81188C23F0256EBF3E22@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
 <18B98A8EDA01B41E.267903@lists.openembedded.org>
In-Reply-To: <18B98A8EDA01B41E.267903@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|AS8P189MB1240:EE_
x-ms-office365-filtering-correlation-id: 0a21b695-77ca-4b78-a946-08dece181c45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|18002099003|22082099003|4143699003|6133799003|8096899003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 DmxLFr9vSwTsDiB9pH0nJAzAHo5gSU9uQNkoIoAget1zpJH2PYKlhoPSlcH8LF7G/2ziv2siSYKXmDYS7X2kA14gtFB69daROi1EE8LicCQKaUaRBDPnPEd7VXzBdWMaICUBuYGPbz3zfjurNDz9q/cJXuCPcyImcnpKesRn6pj7vNQ4D8gkevS2SLr9xM6UuHhdZTjin5Z99J8e9ULRITdjDYOiF5FtMtOmlEV734jYRlu48psvZJo69zLV8meeLyNS4WLupy4Y282GOMHP6Fbnx8zGSRcSt4LmSh1rXGlIIhE065QzYvEWRVruuEp4C361TUjqhT8eqSxc5QnBQ7+k65nnPB04ZbcIladSAwDAPihsEn6yzlynSOqacKPM7I8Ov6TaSYruJQnJxkv8B742Oty77U9wqGYm5OfjV6v2GKK/G0EdASorGk/9D534dGhNa/iyxX/+eMhcdVw/wrfezkNGhJruU5VQACP0WT/0XfIJaj2HTyHN7c/EmWJKJ+a8xv54t9J2530XnGqSBezX33iMI/W7bQslhkCQAkMyzDgJfIXwV2rA0u09NJTOm3CP+1YwjFtd8mwZYob68lvTUSKvMtEsObS4qQSGeoDN/kGGBVcESBu2q/Ye1fvQF/VYMfJOx5hYlvncwkzoodPRwdnp3xOr35SCm5LpuxR9Nr32yAgR72rzRPPou66qyAAFcenDrnAWc7IhZq7lHVMPHI/bsiM3RKnq4AXot4k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(18002099003)(22082099003)(4143699003)(6133799003)(8096899003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?22wkBIWI3eazIhttiwDwqu5B/Y6tPvVDAtJ5bOsMkOI6RAqmeQ82pBnKvCvR?=
 =?us-ascii?Q?2n9M9IhnJ8cyEu4Qqnb0TOEXJQfLU0R1Dk9l/aTmBcCEb2RqJeTh5nc8GWUC?=
 =?us-ascii?Q?vOUM7/bL2WWqk9pRNPAbjcgbevIo9zx4Nw/V//HZ0tdJsngJDzcVQ1wsMZKD?=
 =?us-ascii?Q?PRdlWJCQPAvljIOTZdcHpmcgT/VCwuwrgGD3SNZUOTtlQTEogPlJHcuKm+eF?=
 =?us-ascii?Q?Yt8RqyCcc9XWp6aJ5H6gBzqQVYR5l7ijXlCgJDbcmDNDfDX8OJ29Ydz8ZWNO?=
 =?us-ascii?Q?SF2qtVtM5cqoPqOzEheb2E48q21pJTsuxsAopKDj6m5zzXrls+/sb0UpCEVa?=
 =?us-ascii?Q?hnuaaUMKeR+1/b2apPuzJqOfKf4CLYcIWV7AuTQiCSt7GHE7PcAqV9UJz1kJ?=
 =?us-ascii?Q?4lgMw0QZ0MRO6Bg6BfEqMIrE4sFmk7srES8vAmtvLpcFkaaZVEwtGPiFIFyQ?=
 =?us-ascii?Q?phFjDUZQRRyOnkU6hp+3w6S9FUtLX+DIctZ8RxQeTpZ0cCCX+TMReg/Qkuke?=
 =?us-ascii?Q?Hwt370981dMdI/x6TRUE4LL0evXbxBZnmXIGjHJYcZfbr+ywFB8r6zQLfBSF?=
 =?us-ascii?Q?1yOK9v841Y1iXZrf5sso7m0kBlUxRl1Fwi5+GRPWEzzZeigjHyYfYQ91BkcY?=
 =?us-ascii?Q?qhiIwBmxXPx8/q1iXSqkLQp2RDF96jRKIhdDE/AqZcECp5EMXD+LHWTy+LBE?=
 =?us-ascii?Q?Mtb/25tJnlFa+A3SeO8iKJxWiS8RPL4tncK++AsilNPaUoOauuhZOEmNWMQZ?=
 =?us-ascii?Q?P8jTTh9W8JG1sMgFiSg72+D78aK40KHNv9Wi8zaABEdYR81+JhhXdxU19SMl?=
 =?us-ascii?Q?6NQp1BE8zaTT2JSmAT71CbSmg28BO6maz/zDOnyn7Qmbt4tCwuD/J626LN+D?=
 =?us-ascii?Q?NN/HCbz08dJy7liFY2ArAXsi6U7RXpZOQ1BdHddN/drNicw2wYqZlBOIN6QO?=
 =?us-ascii?Q?0YsTyEQmsjnFTUMao2wtjfCLGpsE9s2HHnW2d+V/nbPel/kGpV0P4/jiEY0V?=
 =?us-ascii?Q?TgCsNGnXxDjqrIq86n2RlAXIKxmSkQ04g6p7G5VGjmy6V8hHLZ/hoaxniwaF?=
 =?us-ascii?Q?ByYpO8o5/iWCGpZJZdrM1TQ6Xpuii6riPHGB92twa0bvaqlH1XhUGmIrR0kE?=
 =?us-ascii?Q?usM8jWXHgWMr4GBzsFVC6G1azW4F37bfJJ4yYgGT3vZa3ceyiCZwVnNlfWrv?=
 =?us-ascii?Q?f+M/bLF7UDA3Jq909JyUqaMRp3nnSGA5x05xBXzDIW9cjqL/7lnxm3zDC/sP?=
 =?us-ascii?Q?O9byW+3YH7pdXKgyw3lIssVXX2B+sslGiFV0HdHcQytfvZBsdegoE9QgO4VB?=
 =?us-ascii?Q?7VtCd79IAjCp8MEA3VdBujeSvkNY9IDv9DUud47Vq/D2z7miARKJQp9O2fvf?=
 =?us-ascii?Q?G1vCdyazePNIs6jSo9OOyz8QT4358bBLdrJfY4EUIf57isFczPbD8lEvgFFA?=
 =?us-ascii?Q?a0kmyuhtgwHFwfApo79MvHZ9L9tPghog7314ZM5sb5xbUlUB90tLmhTWluPx?=
 =?us-ascii?Q?LmZFycc34WfIOPeOTg3llnWWqv4AEf5UpmgnFNbrbTUjmycOzbVrmJ3lupop?=
 =?us-ascii?Q?bAAsv5p3Uhiga0I6CNs9GM5oxn6UIIBKW46gkDuaXaxA9kFOBEjSHF6peB99?=
 =?us-ascii?Q?ulliDOES53PN2lp9otvE9QkjTbotZP5V9UP1+sYovDlMppSSwn2JMsXJ/h6b?=
 =?us-ascii?Q?hYZd4x57Bk+t68S38L5SCJaGfaqbpdqo0A+OXZ7mrDjd8mPkMVurMKpgQ/PR?=
 =?us-ascii?Q?ZzbXb4b5kA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7AB53E81188C23F0256EBF3E22DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a21b695-77ca-4b78-a946-08dece181c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 15:33:28.2031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyxKUfKKovB5KMFGWFZQR4LbweSMYSH/LsO0IVWO4rVcFHLeFRlYzQuznRczZnb6EFK4+gleKPS6Auc4dE1cIWJ0eRH4TNDOw7cPkIU5+qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 15:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239180

--_000_DU7PPF66507B2D7AB53E81188C23F0256EBF3E22DU7PPF66507B2D7_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,

Please let me know feedback on below patch .


Regards,
Jaipaul
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Jaipaul Cheernam via lists.openembedded.org <ja=
ipaul.cheernam=3Dest.tech@lists.openembedded.org>
Sent: Tuesday, June 16, 2026 12:57 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [OE-core] [PATCH v2] install-buildtools: auto-discover environment=
 setup script via glob

The environment setup script installed by a buildtools tarball is named
environment-setup-<arch>-<sdk-name>-linux. The script previously hardcoded
"pokysdk" for this component, so any distro that ships buildtools under a
different SDK name gets a FileNotFoundError after an otherwise successful
install.

Use glob.glob() to discover the environment setup script by pattern
matching on environment-setup-<arch>-*-linux in the install directory.
Since a buildtools install should produce exactly one such script, error
out if zero or more than one match is found.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 scripts/install-buildtools | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ec..723edd793e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -33,6 +33,7 @@
 #

 import argparse
+import glob
 import logging
 import os
 import platform
@@ -305,8 +306,17 @@ def main():
         # Setup the environment
         logger.info("Setting up the environment")
         regex =3D re.compile(r'^(?P<export>export )?(?P<env_var>[A-Z_]+)=
=3D(?P<env_val>.+)$')
-        with open("%s/environment-setup-%s-pokysdk-linux" %
-                  (install_dir, arch), 'rb') as f:
+        pattern =3D os.path.join(install_dir, "environment-setup-%s-*-linu=
x" % arch)
+        matches =3D glob.glob(pattern)
+        if len(matches) =3D=3D 0:
+            logger.error("No environment setup script matching %s" % patte=
rn)
+            return 1
+        if len(matches) > 1:
+            logger.error("Multiple environment setup scripts found: %s"
+                         % " ".join(matches))
+            return 1
+        logger.debug("Using environment setup script: %s" % matches[0])
+        with open(matches[0], 'rb') as f:
             for line in f:
                 match =3D regex.search(line.decode('utf-8'))
                 logger.debug("export regex: %s" % match)
--
2.34.1


--_000_DU7PPF66507B2D7AB53E81188C23F0256EBF3E22DU7PPF66507B2D7_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Hi ,</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Please let me know feedback on below patch . &nbsp;</div>
<div><br>
</div>
<div><br>
</div>
<div id=3D"editor-signature">
<div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Regards,</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Jaipaul</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Jaipaul Cheernam via lists.openembedded.org
 &lt;jaipaul.cheernam=3Dest.tech@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, June 16, 2026 12:57 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<b>Subject:</b> [OE-core] [PATCH v2] install-buildtools: auto-discover envi=
ronment setup script via glob</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The environment setup script installed by a buildt=
ools tarball is named<br>
environment-setup-&lt;arch&gt;-&lt;sdk-name&gt;-linux. The script previousl=
y hardcoded<br>
&quot;pokysdk&quot; for this component, so any distro that ships buildtools=
 under a<br>
different SDK name gets a FileNotFoundError after an otherwise successful<b=
r>
install.<br>
<br>
Use glob.glob() to discover the environment setup script by pattern<br>
matching on environment-setup-&lt;arch&gt;-*-linux in the install directory=
.<br>
Since a buildtools install should produce exactly one such script, error<br=
>
out if zero or more than one match is found.<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
&nbsp;scripts/install-buildtools | 14 ++++++++++++--<br>
&nbsp;1 file changed, 12 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/install-buildtools b/scripts/install-buildtools<br>
index b9c008a2ec..723edd793e 100755<br>
--- a/scripts/install-buildtools<br>
+++ b/scripts/install-buildtools<br>
@@ -33,6 +33,7 @@<br>
&nbsp;#<br>
&nbsp;<br>
&nbsp;import argparse<br>
+import glob<br>
&nbsp;import logging<br>
&nbsp;import os<br>
&nbsp;import platform<br>
@@ -305,8 +306,17 @@ def main():<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Setup the environment<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logger.info(&quot;Setting =
up the environment&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regex =3D re.compile(r'^(?=
P&lt;export&gt;export )?(?P&lt;env_var&gt;[A-Z_]+)=3D(?P&lt;env_val&gt;.+)$=
')<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(&quot;%s/environment-=
setup-%s-pokysdk-linux&quot; %<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; (install_dir, arch), 'rb') as f:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pattern =3D os.path.join(instal=
l_dir, &quot;environment-setup-%s-*-linux&quot; % arch)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matches =3D glob.glob(pattern)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(matches) =3D=3D 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logger.=
error(&quot;No environment setup script matching %s&quot; % pattern)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(matches) &gt; 1:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logger.=
error(&quot;Multiple environment setup scripts found: %s&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; % &q=
uot; &quot;.join(matches))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logger.debug(&quot;Using enviro=
nment setup script: %s&quot; % matches[0])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(matches[0], 'rb') as =
f:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r line in f:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; match =3D regex.search(line.decode('utf-8'))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; logger.debug(&quot;export regex: %s&quot; % match)<br=
>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D7AB53E81188C23F0256EBF3E22DU7PPF66507B2D7_--

