Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA77C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:49:36 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.127])
 by mx.groups.io with SMTP id smtpd.web10.2253.1635878972398278742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=aHCGlGud;
 spf=pass (domain: arri.de, ip: 40.107.15.127, mailfrom: mleonhardt@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyIr3n5EMojj7ExS68P3zeivH+RA1SR+T69OgpTlRTLGVSUkYyfiT4HP5YyOMN2knVnYu0ybbu4Mv8DdvYCGALQUKCCyi4MOFf4LnV6yWobBgCd+TLvlJiNMjBjhlF81CdLR32myzcyfIlzBtyHUys67sHdoG2xtYQiBwm8f9rAJ9P80bwG58KeKkh4ISrUEBUynszhBkX0pLFkc23C9OAqDXr7PJ95jliZADI7VKMYBGTZuP1Sj0hM606QYZDayJjFqpplEy61EYbWiWjYNQp9PdavnNlxOqBTqm6GCJz0Yq789OPyUNUgB3stzapyEhbzJZ2aMn+L1T1/QvZbiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3DB5W9soJUtAgje7Gj1nZ5PPkiL4fHuXmHQRWYfx/4=;
 b=hdr+qEDjgEccu4fh0JPdRv0f6xfQYnjNWTSY08QBkaqw6tSXwzEyTMVnN2oxOCoFbcVUZrssqHhPjtdWoUF7gmbnpjwoy/EYcRvYBcOIHCMc6M6t/tWc8MIbWWmlOre1ThcEmwOhccmrhqCD/kwYDG5GaskhttZbxktuoBn+SLfOHNwnz1JEa9hm8TNR9BcE8xt9JzN03cpUugaAOV5YQj48zLeAdJ2jIK82aSxbNq8Y6+aIArOsGI+DTd+u/+7NyuiAP0NO7EPRPXImQKu26aU/NEhujW70RZIrgFl+2hhPOMJwnFt20F2csb68n4ie5p2AFI8x0drhvnCDZPcVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3DB5W9soJUtAgje7Gj1nZ5PPkiL4fHuXmHQRWYfx/4=;
 b=aHCGlGudM/RC1mCfERr6xhwxfzVlUFKvNZK4ATTh2jsPOr7+PPYBE4pkiDot6mHVjIPEI2oXu03/nd14Ln0B2vxfruFYbPkTgxHzllHwHv9w7Nu/I7hg3AaSCYXFp0q1ABoaMcj5jyp0WKCYGYKvk6BCRJIGU+f+D78QsyHHcdI=
Received: from AS8PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:20b:311::7)
 by AS8PR07MB7734.eurprd07.prod.outlook.com (2603:10a6:20b:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4; Tue, 2 Nov
 2021 18:49:29 +0000
Received: from VE1EUR02FT033.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::aa) by AS8PR05CA0002.outlook.office365.com
 (2603:10a6:20b:311::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 18:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR02FT033.mail.protection.outlook.com (10.152.12.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 18:49:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.175)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 2 Nov 2021 18:49:28 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 17280526
X-ExclaimerImprintLatency: 2155225
X-ExclaimerImprintAction: e6e7e8e18e6246f1af3e9e28426cf70c
Content-Type: multipart/related;
	boundary="----_=_NextPart_a450c7a1-1e6c-47a6-a393-b298ce51ca59"
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com (2603:10a6:102:d0::23)
 by PR1PR07MB4937.eurprd07.prod.outlook.com (2603:10a6:102:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.8; Tue, 2 Nov
 2021 18:49:23 +0000
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22]) by PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22%6]) with mapi id 15.20.4669.010; Tue, 2 Nov 2021
 18:49:22 +0000
From: Manuel Leonhardt <mleonhardt@arri.de>
To: openembedded-core@lists.openembedded.org
CC: Manuel Leonhardt <mleonhardt@arri.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] sstate: Account for reserved characters when shortening
 sstate filenames
Date: Tue,  2 Nov 2021 19:48:44 +0100
Message-ID: <20211102184844.3699-1-mleonhardt@arri.de>
X-Mailer: git-send-email 2.33.1
X-ClientProxiedBy: AM5PR0101CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::19) To PA4PR07MB7309.eurprd07.prod.outlook.com
 (2603:10a6:102:d0::23)
MIME-Version: 1.0
Received: from MN-C02ZH1SVLVDR.fritz.box
 (2001:a61:ab1:ef01:f43c:68d8:fbc5:45c3) by
 AM5PR0101CA0006.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 18:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b81a586-e624-4ab5-c49d-08d99e31803a
X-MS-TrafficTypeDiagnostic: PR1PR07MB4937:|AS8PR07MB7734:
X-Microsoft-Antispam-PRVS: 
	<AS8PR07MB7734E97D440843FE944A26E3D38B9@AS8PR07MB7734.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LtpuK4J51uQKF00snvMvhe5IsfJa7FlcxzijKZ5qNabghW4ChP+WBjNVmZ1wF/9d7iNgMUiWvFqY/4tNn8aGYc8plkcwxyzMkLg88pV4smq0SdZpAJCLmHdVDXXuxJnhLqlbvBz0CCVktJ77AgoPYB2vNn4BCl28Y3drBG98lqZ1jr7aPn4ILy34+L9T769vFauKd/Zns41ned2Z1ivoFz6y9cq0LeuBI+QJftMXcwnSfVKAuGNk3UhdDADgF7nRnmDy7jx04+o3G7VawDpXrqNlhn5Av5/b6+tL9ul+RXzXQ8cHvzVQLTLjq7x7ahEsXmiqSV1ONnsDZ/d2XfsLVDZnH/L08PEhVMT5167aRKETbRzzM7ovDvJKkXqY6bzR7pd+Pf6T7qhBJwl+gy9vkyS6QLLdJ1j8H9KFz0MOJkIv6k2XKsvvIUV2RMrpKTZ80XwBaWun7pGeaQOawx9M0y9NNPeiXFupBQYPOrwuOAZBhOlf9zqoaDaAElnMA+DPmKeoIY4sXJWJTFevsOzxoAU+1y4EuuMDekCAAF/RhNnfqVh2vzcsd6ny4MzEPJY+zT88t1v5d5oGuHAJ/7wUUPAMihwNuVUwMNYepCQUtA1ED5PbPQ4L2dx5wYyX3vmk9SYC4G69zUeBRP0sN727Sw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7309.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(5660300002)(2906002)(86362001)(8676002)(186003)(83380400001)(1076003)(2616005)(6486002)(36756003)(316002)(6512007)(54906003)(66946007)(6506007)(66476007)(66556008)(6666004)(38100700002)(6916009)(52116002)(4326008)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR07MB4937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT033.eop-EUR02.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ccbcc1b-305c-4373-4937-08d99e317c64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iLv38I/0+TuvcUMrPxrIF4bANDuwwt+tlb78Zq+vh9yOnMNCbDgLnH17ATLYjHjMEZwHosDAKYb2oo5pc9vz6qI2TRJYDpiG+YojZK/xCSa/Oc77UgqcUiKAUb2yS9pVfGxtIi7yhYOaY5qqqQBc/xjvUi07KlTCw1NyqSZhMnnAl1n8oTCxnXnAu7/exn4gjt3d3/LiIGIGXpbu/Y5Dbi0kTRwGertPVPyN+NWwAAj9EeLhSQvXwMctsQc6mxDJDMGJjd/gP80Gq5idfP3rPjxxJAay+yneCFAcrYn/Fa6SHOG1UnQVRtVkD3DHWJFA0sM8Oc+6r1IobsbMd0sdWkQP2q1fTsQl3IFixnn/vZ9YTw/1zzgSDCJIrVV6JKH5Kkg8XzMf6pGBUkTUQkEQQw+IL6Ra4v32zuWyEFay7Dl6wOdKaG5GWrTbpU+n97zLrlU4Ixzs4gqekRwtI0jx518qQcvILPhbucehiKB3CDk3I2Z4YPh/GkJjYsqwq+MXkJMd7go6kA8HES5dfmOxsr9+hdO/CHD8M9RTGdzecCy1KEi9zFrAKhyqVdd//q7YsD+J9kmZWwuwsLOmidxFDw3Op3zT85+BKGf/rZfoTp/BMLYINV72H3TTbFjFi3Pa8MQHr+4RlfnxdoZU08TTpZIDs21YJIaGWs10joXCRVIPFpo8iEcMI7e2SRSltsQ+XSv6B/2je+OjQ6U9xSbjIsvndU6zSJw6QFppeahzUUnEHaoObj3vgTO6rQBkmY3Pfmp7hJkcKZ92jqby1aGQ/YMteoY7xAgsZmqJj3CIo987bIFtcgRFrso2wyucOLxMrf+z54ZETakjccay9y0+kA==
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(186003)(82310400003)(70586007)(166002)(356005)(15974865002)(7636003)(7596003)(47076005)(36860700001)(36756003)(83380400001)(5660300002)(316002)(26005)(66574015)(86362001)(6916009)(2906002)(8936002)(2616005)(8676002)(4326008)(1076003)(508600001)(70206006)(6666004)(6512007)(336012)(7066003)(6486002)(33964004)(6506007);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 18:49:28.6699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b81a586-e624-4ab5-c49d-08d99e31803a
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT033.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 18:49:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157808

This is a multi-part message in MIME format.

------_=_NextPart_a450c7a1-1e6c-47a6-a393-b298ce51ca59
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_ce358f36-ac52-4806-a724-0d52141fe31c"

------_=_NextPart_ce358f36-ac52-4806-a724-0d52141fe31c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Previously, when shortening sstate filenames, the reserved
characters for .siginfo were not considered, when siginfo=3DFalse,
resulting in differently shortend filenames for the sstate and siginfo
files. With this change, the filenames of the truncated sstate and
siginfo files have the same basename, just as is already the case for
untruncated filenames.

Making sure that the .siginfo files always have the filename of the
corresponding sstate file plus its .siginfo suffix, also when being
truncated, makes it easier to manage the sstate cache and an sstate
mirror outside of Bitbake/Yocto.

Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6e4eb09f8e..8182010047 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -22,7 +22,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
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

------_=_NextPart_ce358f36-ac52-4806-a724-0d52141fe31c
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Previously, when shortening sstate filenames,=
 the reserved<br />characters for .siginfo were not considered, when siginf=
o=3DFalse,<br />resulting in differently shortend filenames for the sstate =
and siginfo<br />files. With this change, the filenames of the truncated ss=
tate and<br />siginfo files have the same basename, just as is already the =
case for<br />untruncated filenames.<br /><br />Making sure that the .sigin=
fo files always have the filename of the<br />corresponding sstate file plu=
s its .siginfo suffix, also when being<br />truncated, makes it easier to m=
anage the sstate cache and an sstate<br />mirror outside of Bitbake/Yocto.<=
br /><br />Signed-off-by: Manuel Leonhardt &lt;mleonhardt@arri.de&gt;<br />=
Cc: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />---<br /=
> meta/classes/sstate.bbclass | 2 +-<br /> 1 file changed, 1 insertion(+), =
1 deletion(-)<br /><br />diff --git a/meta/classes/sstate.bbclass b/meta/cl=
asses/sstate.bbclass<br />index 6e4eb09f8e..8182010047 100644<br />--- a/me=
ta/classes/sstate.bbclass<br />+++ b/meta/classes/sstate.bbclass<br />@@ -2=
2,7 +22,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):<br />=
         components =3D spec.split(&quot;:&quot;)<br />         # Fields 0,=
5,6 are mandatory, 1 is most useful, 2,3,4 are just for information<br />  =
       # 7 is for the separators<br />-        avail =3D (254 - len(hash + =
&quot;_&quot; + taskname + extension) - len(components[0]) - len(components=
[1]) - len(components[5]) - len(components[6]) - 7) // 3<br />+        avai=
l =3D (limit - len(hash + &quot;_&quot; + taskname + extension) - len(compo=
nents[0]) - len(components[1]) - len(components[5]) - len(components[6]) - =
7) // 3<br />         components[2] =3D components[2][:avail]<br />        =
 components[3] =3D components[3][:avail]<br />         components[4] =3D co=
mponents[4][:avail]<br />-- <br />2.33.1<br /><br /></div><div dir=3D"ltr" =
style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:100%;directi=
on:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"w=
idth:100%;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical=
-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"pa=
dding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"font-size:14.67px;=
color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;">_______________________________________________________<span style=3D"=
font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#8=
203;</span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"le=
ft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Manu=
el</td><td align=3D"left" style=3D"vertical-align:top;color:#000001;font-fa=
mily:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Leonhardt</td=
></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Softwaree=
ntwickler</td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
">&#8203;</td></tr></table></td></tr></table></td></tr><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"f=
ont-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpa=
dding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#0E50=
AD;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font=
-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;font-family:=
&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67px;color:=
#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;=
"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&=
nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbs=
p;<br /></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Arial;">Herbert=E2=80=
=91Bayer=E2=80=91Str.&nbsp;10</td><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"left" style=3D"ver=
tical-align:middle;font-family:Arial;">80807</td><td align=3D"left" style=
=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /></td><td align=
=3D"left" style=3D"vertical-align:middle;font-family:Arial;">M&#252;nchen</=
td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#1532B9;font-styl=
e:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:11px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span s=
tyle=3D"text-decoration:underline;"><a href=3D"http://www.arri.com/" target=
=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#15=
32B9;"><strong style=3D"font-weight:400;">www.arri.com&nbsp;<br /><br /></s=
trong></a></span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bord=
er=3D"0" style=3D"font-size:0;color:#858080;font-style:normal;font-weight:4=
00;line-height:normal;white-space:nowrap;"><tr style=3D"font-size:14.67px;"=
><td align=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><im=
g src=3D"cid:image498371.png@3F8E975E.4B0DF8EF" width=3D"20" border=3D"0" a=
lt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /><=
/td><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Ca=
libri,Arial,sans-serif;"><a href=3D"tel:+49%2089%203809-1719" target=3D"_bl=
ank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;"><stro=
ng style=3D"font-weight:400;">+49&nbsp;89&nbsp;3809-1719</strong></a></td><=
/tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertic=
al-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:to=
p;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"paddin=
g:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertica=
l-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image7=
65288.png@FADE4A22.AF43BF8D" width=3D"20" border=3D"0" alt=3D"" style=3D"wi=
dth:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-se=
rif;"><a href=3D"mailto:MLeonhardt@arri.de" target=3D"_blank" id=3D"LPlnk68=
9713" style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-w=
eight:400;">MLeonhardt@arri.de</strong></a></td></tr></table></td></tr></ta=
ble></td></tr></table></td></tr><tr style=3D"font-size:14.67px;color:#00000=
1;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&=
#8203;</td></tr></table></td></tr><tr style=3D"font-size:0;line-height:norm=
al;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><a href=3D"=
https://www.arri.com/hi-5" target=3D"_blank" id=3D"LPlnk689713" style=3D"te=
xt-decoration:none;"><img src=3D"https://assets.arri.com/media/sign/2021-06=
-16-E-mail-signature-Hi-5-01.jpg" border=3D"0" title=3D"Hi-5: Further. Stro=
nger. Faster" alt=3D"Hi-5: Further. Stronger. Faster" style=3D"font-size:12=
px;" /></a></td></tr><tr style=3D"font-size:13px;color:#7F7F7F;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;">Get&nbsp;al=
l&nbsp;the&nbsp;latest&nbsp;information&nbsp;from&nbsp;<span style=3D"text-=
decoration:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" i=
d=3D"LPlnk689713" title=3D"www.arri.com" style=3D"text-decoration:underline=
;color:#7F7F7F;"><strong style=3D"font-weight:400;">www.arri.com</strong></=
a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"https=
://www.facebook.com/TeamARRI" target=3D"_blank" id=3D"LPlnk689713" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">Facebook</strong></a></span>,&nbsp;<span style=3D"text-decoration:und=
erline;"><a href=3D"https://twitter.com/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">Twitter</strong></a></span>,&nbsp;<span style=
=3D"text-decoration:underline;"><a href=3D"http://instagram.com/arri" targe=
t=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7=
F7F7F;"><strong style=3D"font-weight:400;">Instagram</strong></a></span>&nb=
sp;and&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://ww=
w.youtube.com/user/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">YouTube</strong></a></span>.<br /></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellpad=
ding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#6A6A6=
A;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-=
size:10px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Aria=
l;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&n=
bsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nl=
ich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter=
&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#2=
52;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Stephan&nbsp;Schen=
k;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /></td></tr><tr =
style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;<br /></=
td></tr></table></td></tr></table></td></tr></table></div></body></html>
------_=_NextPart_ce358f36-ac52-4806-a724-0d52141fe31c--

------_=_NextPart_a450c7a1-1e6c-47a6-a393-b298ce51ca59
Content-Type: image/png;
	name="image498371.png"
Content-Transfer-Encoding: base64
Content-ID: <image498371.png@3F8E975E.4B0DF8EF>
Content-Description: image498371.png
Content-Disposition: inline;
	creation-date="Tue, 02 Nov 2021 18:49:28 +0000";
	filename=image498371.png;
	modification-date="Tue, 02 Nov 2021 18:49:28 +0000";
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

------_=_NextPart_a450c7a1-1e6c-47a6-a393-b298ce51ca59
Content-Type: image/png;
	name="image765288.png"
Content-Transfer-Encoding: base64
Content-ID: <image765288.png@FADE4A22.AF43BF8D>
Content-Description: image765288.png
Content-Disposition: inline;
	creation-date="Tue, 02 Nov 2021 18:49:28 +0000";
	filename=image765288.png;
	modification-date="Tue, 02 Nov 2021 18:49:28 +0000";
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

------_=_NextPart_a450c7a1-1e6c-47a6-a393-b298ce51ca59--

