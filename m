Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C37C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 20:08:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.99])
 by mx.groups.io with SMTP id smtpd.web12.34999.1635710932167476297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 13:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=suvqFCcf;
 spf=pass (domain: arri.de, ip: 40.107.20.99, mailfrom: mleonhardt@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6YmeWuzOFQBDdCtdf0dkP24yFPUdgDNq5Oxr7l98iLXBQOyJo/QmJ0KTpk8rMyPG1PBRRHX0ywIOp7WQI7vZlj7dTWMX7wBYp1p/AdW59mR62Ra9wrlNJgyoCwGu01pZjUy+rw2HxlF0vol7m+u3tl6ROdU7eLpaL908bj6pKRJAAYNKOz/npvUPQvixUltOj06m/vLMFaayLfiJ/9GDdtSn6ZYyjIVs1UTKTLGwbNNO0fDW2nVP6hgHxvEiQ90JuOFeBviWzM5MkWF7Ccx5VYNgjMjoCOhb8Zknkl1SbsGupZpCXPqlC0eeQoyFnpx79F3MEvyYkTl/CBiVjADeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvTpqXZ8lrhErKFoci3WbAVw5W//ywrk4D+oHxcIKk0=;
 b=VcB43VesZz2f2caRJ0Phu62h0sSKEDOJH1Dr2W8/1Xg1hjSEweESrXDEO2G1Rz63moQ1wwbb8ynGG5gdu73BL1Jsz/AbFZwZxjRjO70fOmYknROv2OrNUPstB6BDBNmAaUYYhvlvTdowxN9SKe3EUKgR9ej6UWlzHfogHxJUpyiz4rSavyDArksSfHJoiuciq6MbXBVd+0Po1IquFCSimvDUPhXWvlXs4m0ISxcV3VMRAF96M0as7+I4Q3UOZAGc5Ck1KwRdZT8RNiXR8a1lcXcWmGPq/io1W0XX1midt7iYPQWC/uof2HOGLEa7sLjoVkxAUhpsGjTeJnaVub/wxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvTpqXZ8lrhErKFoci3WbAVw5W//ywrk4D+oHxcIKk0=;
 b=suvqFCcf5XLd40vEiEuQCYWUOW7raL31ecctUMbxsEWKKg9dAvA9oOQ/c7ePY1sqC09Z2uynRJZuRXB3/Z8ZnlsmMvARYi8zEEp3fbThSn1YFEBvNeQppMaz6JIqYMHT2GcTYt8O3ULQ/I8pNC4z0ZxKwwWpMvRcHZQ1Z1UMxUE=
Received: from AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::33)
 by VI1PR07MB5902.eurprd07.prod.outlook.com (2603:10a6:803:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9; Sun, 31 Oct
 2021 20:08:47 +0000
Received: from VE1EUR02FT010.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::8b) by AM5PR1001CA0020.outlook.office365.com
 (2603:10a6:206:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Sun, 31 Oct 2021 20:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR02FT010.mail.protection.outlook.com (10.152.12.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Sun, 31 Oct 2021 20:08:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.51)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Sun, 31 Oct 2021 20:08:46 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 9533890
X-ExclaimerImprintLatency: 2540856
X-ExclaimerImprintAction: a3c93d11e57f449c9ca7340687b44ed9
Content-Type: multipart/related;
	boundary="----_=_NextPart_c938388f-8bcf-42f7-96a2-c921ae270bea"
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com (2603:10a6:102:d0::23)
 by PR3PR07MB6969.eurprd07.prod.outlook.com (2603:10a6:102:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.6; Sun, 31 Oct
 2021 20:08:42 +0000
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22]) by PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22%6]) with mapi id 15.20.4669.009; Sun, 31 Oct 2021
 20:08:42 +0000
From: Manuel Leonhardt <mleonhardt@arri.de>
To: openembedded-core@lists.openembedded.org
CC: Manuel Leonhardt <mleonhardt@arri.de>
Subject: [PATCH] sstate: Consider .lock suffix for when loading sstate file
 from mirror
Date: Sun, 31 Oct 2021 21:08:28 +0100
Message-ID: <20211031200828.80223-1-mleonhardt@arri.de>
X-Mailer: git-send-email 2.33.1
X-ClientProxiedBy: AM6P193CA0119.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::24) To PA4PR07MB7309.eurprd07.prod.outlook.com
 (2603:10a6:102:d0::23)
MIME-Version: 1.0
Received: from MN-C02ZH1SVLVDR.fritz.box
 (2001:a61:ab1:ef01:bd53:518:f031:ec01) by
 AM6P193CA0119.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::24) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Sun, 31 Oct 2021 20:08:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b9d95e-f9cf-4773-c601-08d99caa3f3d
X-MS-TrafficTypeDiagnostic: PR3PR07MB6969:|VI1PR07MB5902:
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB5902FD4C06D1617D3813EC14D3899@VI1PR07MB5902.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HoHnHx6I1l6TIfo5nqzQDK9+eN80gMGKvUuvgXAIeakjxkt2TWzbuMsAUuCcZiwkSfK72Q/iwTVv/kPtDVOyl34w4XbUg8O1yhg8gezKgrk8lhfBUfAxH+2LI3QcbjnypmWVXeHi+gaSkUIS9Z8USwUhA5D1o90vyFRZ4W086ZHlqHvzMKvXoqXhQJRQYlMkwkZsdTGYl06WLlYsSSjkBdKh1TEtKj3KGfbvnnsmiPsGlNAZn5K6LA9fBOVnydoQJKcxDYlC3oZf5SwTeLSLD2UD0RRGWhWjKrxVqyjaPTclSUlZIbVCEddt0RawYUWiDHWMrLKAc64NIuOukabp5+jt7WGDP+bXQ+X6C4se8G2ug4bpkHt/wxUhrTMCP3yaw3MBCr7OxSWHKZ1HHww+Ux5TddeV1oNSNmcf66EaGhkN/amS7M9c89XmCJY1XeL9QFdHvX/XUtKlVw4I4XOnjbzvywkuZzNE8or2aLifVeFkq7DLQt28xl1htJvZjBrAlfViiNd0Jp//rezFctuGeHMT4Qs8EqeNG7/VT28nDjXx3otdIhzniAUbHfXSVzk+PpdEDHu1gKU8erkNTyJBMyw4mk65j3LJyC2EQ/gwzcxu8YATBnjjQK2ZcM6OD35JnbmWcgsJeNN86zJXLPl5HiR86T/J0OucbOj/EBtRWFiVks4YS5zzkwLBrB8ExaQw2DL9JReNpavqXCwo/B0s8w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7309.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(508600001)(6666004)(86362001)(186003)(36756003)(66946007)(6916009)(66476007)(6486002)(66556008)(1076003)(5660300002)(6512007)(6506007)(107886003)(4326008)(52116002)(2906002)(2616005)(8676002)(316002)(8936002)(83380400001)(142923001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6969
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT010.eop-EUR02.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a59e5d53-9ba2-40ca-d73e-08d99caa3c58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CYTwxZhhBBWH/W76Hh5lQEmAul14rXWtFmN/nZrZAkpvJb3iBQOfEnFttOVY/gWvVaidPev5vGqaGJaVE0agAD7IRDAXyVSoiG5IMRiIPy/ovJeGoGTyCZJcwQw7/ejZkrwcekrXGFFBMstJEVQBpf12PDOFejNeyqsx54Lbyt+S6biXnMRJdq7GhKQPLRbvhWcZeim6ftTZAf4vbuBIpWTwxCgMKrQHGITJApbcoMh5wMPMTaJF8WqsWxvyu3JZk6AvIt6mEDrs/8Gy6cX0s++yuWAZ7kbYcm+9pavuAD9Rz2y5q11bOgxSAGhes5rl0w5sEN4FGV/0PS6J1oRl3bQwnztCybUSF76S7ncPoqkERm92jx/OGCFgYXUcMUINRNmrcsDsc0I5plLKhpNRPbQWwmmiQ0MrT2z4vgkwso2D+97wa4GYkDoGWsts8JbMsuhyH09ih/Erit1hRBoC5mO+DLDFDpbVnLY+WtYSgrWnhkDdTqmvrUjKJyMtifayIsg9ZXWQhBg3yfLeNlXb8pkD3iAkKTM5nP+gNdS4+MRjkIzMEpDl7lq3Ygv7VZfjbg7pWtq/k7bZixTtOuD7FmPJUdb+tcNk+Wd+ktKEsKR6MWKIv/XQrtuNIHhsDqRFuyKyyBbObSXYYnX2m76fTBUpTUNgjB0ShAnF2p2g5rwCAI87D0TMVq+M/TSqyKlt9v58UOURFr+fRHRdH/1qTzYRYEY5TiFsFrqqcMDJu2Qc3q2xMwMnFcqUk1SVtOPFbVr7gIuwbG+L2efBtMVCy+T4j46rN10RCI6ww7Ug1XheVcHZjzbrt6BR87LpQ8x/xJzcd7CGr73VB2C8kEb81TOYR+uYZG17Dv5fvwtvGbs=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(66574015)(7066003)(26005)(316002)(508600001)(4326008)(36860700001)(166002)(82310400003)(36756003)(6506007)(186003)(107886003)(6916009)(8676002)(33964004)(356005)(6666004)(47076005)(6486002)(8936002)(86362001)(15974865002)(83380400001)(70586007)(336012)(2906002)(7596003)(70206006)(7636003)(6512007)(2616005)(1076003)(5660300002)(142923001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2021 20:08:46.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6b9d95e-f9cf-4773-c601-08d99caa3f3d
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT010.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 20:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157691

This is a multi-part message in MIME format.

------_=_NextPart_c938388f-8bcf-42f7-96a2-c921ae270bea
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_69fa6c68-9a23-4fe8-b3f6-032e4c473657"

------_=_NextPart_69fa6c68-9a23-4fe8-b3f6-032e4c473657
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

When using an sstate mirror over HTTP/S, a lockfile is created during
download. Previously, this resulted in an OSError (ENAMETOOLONG) in the
bb.utils.lockfile function because the lockfile has the filename of the
sstate file plus ".lock". Since this case is also not handled properly
in bb.utils.lockfile, this caused populate tasks to hang indefinitely.

Also, previously when generating a shorter filename, the reserved
characters for .siginfo and now .lock were not considered. This is now
fixed by using limit instead of 254, which is the maximum length.

Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6e4eb09f8e..b6a8951f8a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -14,6 +14,8 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
     if siginfo:
         limit =3D 254
         extension =3D ".tar.zst.siginfo"
+    # 5 chars reserved for .lock suffix when downloading from sstate mirro=
r
+    limit -=3D 5
     if not hash:
         hash =3D "INVALID"
     fn =3D spec + hash + "_" + taskname + extension
@@ -22,7 +24,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         components =3D spec.split(":")
         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for=
 information
         # 7 is for the separators
-        avail =3D (254 - len(hash + "_" + taskname + extension) - len(comp=
onents[0]) - len(components[1]) - len(components[5]) - len(components[6]) -=
 7) // 3
+        avail =3D (limit - len(hash + "_" + taskname + extension) - len(co=
mponents[0]) - len(components[1]) - len(components[5]) - len(components[6])=
 - 7) // 3
         components[2] =3D components[2][:avail]
         components[3] =3D components[3][:avail]
         components[4] =3D components[4][:avail]
-- 
2.33.1


_______________________________________________________
Manuel 
Leonhardt
Softwareentwickler
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Herbert-Bayer-Str. 10, 
80807 
M=C3=BCnchen
www.arri.com 

+49 89 3809-1719
MLeonhardt@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler

=E2=80=8B

------_=_NextPart_69fa6c68-9a23-4fe8-b3f6-032e4c473657
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>When using an sstate mirror over HTTP/S, a lo=
ckfile is created during<br />download. Previously, this resulted in an OSE=
rror (ENAMETOOLONG) in the<br />bb.utils.lockfile function because the lock=
file has the filename of the<br />sstate file plus &quot;.lock&quot;. Since=
 this case is also not handled properly<br />in bb.utils.lockfile, this cau=
sed populate tasks to hang indefinitely.<br /><br />Also, previously when g=
enerating a shorter filename, the reserved<br />characters for .siginfo and=
 now .lock were not considered. This is now<br />fixed by using limit inste=
ad of 254, which is the maximum length.<br /><br />Signed-off-by: Manuel Le=
onhardt &lt;mleonhardt@arri.de&gt;<br />---<br /> meta/classes/sstate.bbcla=
ss | 4 +++-<br /> 1 file changed, 3 insertions(+), 1 deletion(-)<br /><br /=
>diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br =
/>index 6e4eb09f8e..b6a8951f8a 100644<br />--- a/meta/classes/sstate.bbclas=
s<br />+++ b/meta/classes/sstate.bbclass<br />@@ -14,6 +14,8 @@ def generat=
e_sstatefn(spec, hash, taskname, siginfo, d):<br />     if siginfo:<br />  =
       limit =3D 254<br />         extension =3D &quot;.tar.zst.siginfo&quo=
t;<br />+    # 5 chars reserved for .lock suffix when downloading from ssta=
te mirror<br />+    limit -=3D 5<br />     if not hash:<br />         hash =
=3D &quot;INVALID&quot;<br />     fn =3D spec + hash + &quot;_&quot; + task=
name + extension<br />@@ -22,7 +24,7 @@ def generate_sstatefn(spec, hash, t=
askname, siginfo, d):<br />         components =3D spec.split(&quot;:&quot;=
)<br />         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are j=
ust for information<br />         # 7 is for the separators<br />-        a=
vail =3D (254 - len(hash + &quot;_&quot; + taskname + extension) - len(comp=
onents[0]) - len(components[1]) - len(components[5]) - len(components[6]) -=
 7) // 3<br />+        avail =3D (limit - len(hash + &quot;_&quot; + taskna=
me + extension) - len(components[0]) - len(components[1]) - len(components[=
5]) - len(components[6]) - 7) // 3<br />         components[2] =3D componen=
ts[2][:avail]<br />         components[3] =3D components[3][:avail]<br />  =
       components[4] =3D components[4][:avail]<br />-- <br />2.33.1<br /><b=
r /></div><div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-te=
xt-size-adjust:100%;direction:ltr;"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"width:100%;"><tr style=3D"font-size:0;"><td al=
ign=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><=
td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size:0;"><t=
r style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-weight:40=
0;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-=
family:Calibri,Arial,sans-serif;">_________________________________________=
______________<span style=3D"font-family:remialcxesans;font-size:1px;color:=
#FFFFFF;line-height:1px;">&#8203;</span></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;fo=
nt-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size=
:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calib=
ri,Arial,sans-serif;">Manuel</td><td align=3D"left" style=3D"vertical-align=
:top;color:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td>=
<td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sa=
ns-serif;">Leonhardt</td></tr></table></td></tr><tr style=3D"font-size:0;">=
<td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" c=
ellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style=
:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px=
;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial=
,sans-serif;">Softwareentwickler</td></tr><tr style=3D"font-size:14.67px;co=
lor:#000001;"><td align=3D"left" style=3D"vertical-align:top;font-family:Ca=
libri,Arial,sans-serif;">&#8203;</td></tr></table></td></tr></table></td></=
tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:to=
p;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-s=
ize:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-ali=
gn:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"f=
ont-size:0;color:#0E50AD;font-style:normal;font-weight:400;white-space:nowr=
ap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"fo=
nt-size:10.67px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&n=
bsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betri=
ebs&nbsp;KG</span>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font=
-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddi=
ng=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;=
font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-si=
ze:10.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Ari=
al;">Herbert=E2=80=91Bayer=E2=80=91Str.&nbsp;10</td><td align=3D"left" styl=
e=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"=
left" style=3D"vertical-align:middle;font-family:Arial;">80807</td><td alig=
n=3D"left" style=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /><=
/td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">M=
&#252;nchen</td></tr></table></td></tr></table></td></tr><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#153=
2B9;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"fon=
t-size:11px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Ar=
ial;"><span style=3D"text-decoration:underline;"><a href=3D"http://www.arri=
=2Ecom/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:unde=
rline;color:#1532B9;"><strong style=3D"font-weight:400;">www.arri.com&nbsp;=
<br /><br /></strong></a></span></td></tr><tr style=3D"font-size:0;"><td al=
ign=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"font-size:0;color:#858080;font-style:norma=
l;font-weight:400;line-height:normal;white-space:nowrap;"><tr style=3D"font=
-size:14.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;fo=
nt-size:0;"><img src=3D"cid:image555154.png@ECC9A4C6.3E54388C" width=3D"20"=
 border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;fo=
nt-size:0;" /></td><td align=3D"left" style=3D"padding:0;vertical-align:top=
;font-family:Calibri,Arial,sans-serif;"><a href=3D"tel:+49%2089%203809-1719=
" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:=
#858080;"><strong style=3D"font-weight:400;">+49&nbsp;89&nbsp;3809-1719</st=
rong></a></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"p=
adding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;ve=
rtical-align:top;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" =
style=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=3D"pa=
dding:0;vertical-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td=
 align=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img sr=
c=3D"cid:image650886.png@0A2220C5.5B048B7F" width=3D"20" border=3D"0" alt=
=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /></t=
d><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;"><a href=3D"mailto:MLeonhardt@arri.de" target=3D"_bla=
nk" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;"><stron=
g style=3D"font-weight:400;">MLeonhardt@arri.de</strong></a></td></tr></tab=
le></td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:14.=
67px;color:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><=
td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,san=
s-serif;"><br />&#8203;</td></tr></table></td></tr><tr style=3D"font-size:0=
;line-height:normal;"><td align=3D"left" style=3D"padding:0;vertical-align:=
top;"><a href=3D"https://www.arri.com/hi-5" target=3D"_blank" id=3D"LPlnk68=
9713" style=3D"text-decoration:none;"><img src=3D"https://assets.arri.com/m=
edia/sign/2021-06-16-E-mail-signature-Hi-5-01.jpg" border=3D"0" title=3D"Hi=
-5: Further. Stronger. Faster" alt=3D"Hi-5: Further. Stronger. Faster" styl=
e=3D"font-size:12px;" /></a></td></tr><tr style=3D"font-size:13px;color:#7F=
7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-se=
rif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;information&nbsp;from&nbsp;<sp=
an style=3D"text-decoration:underline;"><a href=3D"http://www.arri.com/" ta=
rget=3D"_blank" id=3D"LPlnk689713" title=3D"www.arri.com" style=3D"text-dec=
oration:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">www.ar=
ri.com</strong></a></span>,&nbsp;<span style=3D"text-decoration:underline;"=
><a href=3D"https://www.facebook.com/TeamARRI" target=3D"_blank" id=3D"LPln=
k689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong style=
=3D"font-weight:400;">Facebook</strong></a></span>,&nbsp;<span style=3D"tex=
t-decoration:underline;"><a href=3D"https://twitter.com/ARRIChannel" target=
=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F=
7F7F;"><strong style=3D"font-weight:400;">Twitter</strong></a></span>,&nbsp=
;<span style=3D"text-decoration:underline;"><a href=3D"http://instagram.com=
/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underl=
ine;color:#7F7F7F;"><strong style=3D"font-weight:400;">Instagram</strong></=
a></span>&nbsp;and&nbsp;<span style=3D"text-decoration:underline;"><a href=
=3D"http://www.youtube.com/user/ARRIChannel" target=3D"_blank" id=3D"LPlnk6=
89713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"=
font-weight:400;">YouTube</strong></a></span>.<br /></td></tr><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><t=
able cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;=
color:#6A6A6A;font-style:normal;font-weight:400;white-space:nowrap;"><tr st=
yle=3D"font-size:10px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Arial;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik=
&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252=
;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nc=
hen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Per=
s&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbs=
p;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbs=
p;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;f=
tsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Stephan&nbsp=
;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /></td></t=
r><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;=
<br /></td></tr></table></td></tr></table></td></tr></table></div></body></=
html>
------_=_NextPart_69fa6c68-9a23-4fe8-b3f6-032e4c473657--

------_=_NextPart_c938388f-8bcf-42f7-96a2-c921ae270bea
Content-Type: image/png;
	name="image555154.png"
Content-Transfer-Encoding: base64
Content-ID: <image555154.png@ECC9A4C6.3E54388C>
Content-Description: image555154.png
Content-Disposition: inline;
	creation-date="Sun, 31 Oct 2021 20:08:46 +0000";
	filename=image555154.png;
	modification-date="Sun, 31 Oct 2021 20:08:46 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_c938388f-8bcf-42f7-96a2-c921ae270bea
Content-Type: image/png;
	name="image650886.png"
Content-Transfer-Encoding: base64
Content-ID: <image650886.png@0A2220C5.5B048B7F>
Content-Description: image650886.png
Content-Disposition: inline;
	creation-date="Sun, 31 Oct 2021 20:08:46 +0000";
	filename=image650886.png;
	modification-date="Sun, 31 Oct 2021 20:08:46 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_c938388f-8bcf-42f7-96a2-c921ae270bea--

