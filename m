Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6814EC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 09:58:35 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.129])
 by mx.groups.io with SMTP id smtpd.web10.5472.1644573512259371585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 01:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Vx0l4/jY;
 spf=pass (domain: arri.de, ip: 40.107.0.129, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMcmrbjSoCYMxUH4Zc1wR7JBVQ+OKVQp6IGcf6L9GsX/qdR7yD6u0U5K2JFQJzxyU2AqXQm3z1EnRlNQbE9rNbfkaFbZZbBXcuLgZm7GqkI1WKddwKm+zj2Swy/jo8p+nIh8UI505k+UuAFIv+RDAYoVQusKvyv2Yf9GIb2exiaanMo/xp7l4me9iRugCkt8eadtDXZ9YJ5m34oeq48LkVUteddncyZP3A1/zxty1j5n94qRNmJbiKjSHQbqFtGikH9UrwBbYs/04wjK3p66XBOnE6APlWSY20Zy8YhHR1TW2t/T6sN/yyCtfufezXl3f05Ye7BDbxA4O9SCXuPQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGC0HX/Y85W9NjjLOMZANJSLkHRymM6LyiMoFoXdULk=;
 b=GI6A/NyUYLrAO9tkddozcv5Qp03WCzNnqLUoNPajQgWbPys0Ca1zJCe8UK8d0qfK+r7QYk+0451syd8ROESJS+E5kC39YzW17rWCr/inXb+4gQILzHsDPGNxTSYm1zspsliy83YyIPoInXvGMsGW62S1cRbrnQm7KS4jLvyQRrW2cLJWTIQW0BB4mz+AjKX8c/AQ6v/6YzpyHLUbG+eFnQJvrLXpZXwfzv1k/vV15PcRyoBCMSsjpwlZAPsKh8DcnUPI7/wReDelu5sxKBBoJWZZYVlQTkCKXR8H17YsedmSoyIgdPEYiKQkmpiYkowCMIPYP2ZV5o2tqRaHl9M1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 104.40.229.156) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=arri.de; dmarc=none action=none header.from=arri.de; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGC0HX/Y85W9NjjLOMZANJSLkHRymM6LyiMoFoXdULk=;
 b=Vx0l4/jY1E9nNIM88SK6fheHRzk4qaZJNJz4oNO8wLNyIYu2cKVLdEeqqDzx/tLyO37Q9XZhklUncK1TuHCUqWS5FAN4OzhtOMlTvDQmxmm47IdCbCxsfo2oCtu3S4K7av8fF8+r1Dg+b+7aIr69dI+FoXw+rNI1Yt3XtrwGWjY=
Received: from AM6P193CA0103.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::44)
 by PAXPR07MB8400.eurprd07.prod.outlook.com (2603:10a6:102:2ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.8; Fri, 11 Feb
 2022 09:58:28 +0000
Received: from AM5EUR02FT040.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::bb) by AM6P193CA0103.outlook.office365.com
 (2603:10a6:209:88::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 11 Feb 2022 09:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 104.40.229.156) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 AM5EUR02FT040.mail.protection.outlook.com (10.152.9.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 09:58:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.112)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Fri, 11 Feb 2022 09:58:26 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 8999335
X-ExclaimerImprintLatency: 3066446
X-ExclaimerImprintAction: 0febcbc10b6740f495fef23a1d5d6f96
Content-Type: multipart/related;
	boundary="----_=_NextPart_6c7dea66-0bd1-4297-b5b5-7d9f15675c0a"
Received: from AS9P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::17)
 by DB7PR07MB5370.eurprd07.prod.outlook.com (2603:10a6:10:34::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.10; Fri, 11 Feb
 2022 09:58:23 +0000
Received: from VE1EUR02FT008.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::1b) by AS9P194CA0013.outlook.office365.com
 (2603:10a6:20b:46d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 09:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT008.mail.protection.outlook.com (10.152.12.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 09:58:22 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 11 Feb
 2022 10:58:22 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Fri, 11 Feb 2022 10:58:22 +0100
Received: from localhost.de (192.168.55.18) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 11 Feb 2022 10:58:21
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Oleksiy Obitotskyy <oobitots@cisco.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Anuj Mittal <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] package_manager: ipk: Fix host manifest generation
Date: Fri, 11 Feb 2022 10:58:06 +0100
Message-ID: <20220211095806.4360-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [192.168.55.18]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 775c113e-8d1f-468a-ff90-08d9ed450c91
X-MS-TrafficTypeDiagnostic: 
	DB7PR07MB5370:EE_|AM5EUR02FT040:EE_|PAXPR07MB8400:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR07MB8400E982F15CB7FA83461903BF309@PAXPR07MB8400.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;OLM:103;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S/dCalVNAEwGOA10tZ9dSk7LGJ3WJZ2+Yh7NbE7rak5hzsvdHgMOkIYbg9n9J0Pb1lgR0caSBBBlKi8Imo7QzyPh+46c8X2NV1735vf516e7nUwHCOGr1reYFI7me06T/u/yJmoocoGUwLZrqwBYZMW+ZTMqWzz2w78g/z+HI/gXW+m8SMtJPaVl8mXz3q2SQZYvx4ZRaupoHu2aa8fOPKThT8d4nUwp4D38B+gtXWRtHEhpygUDsdQ1Gxl+frDSsSawY05yKtsMzhM7V2/wMECAbtE+erXrASLBahipNtlokslrizaNuKRu76m09Y7sA84EidhwgG/wNTKwFxt+GAq70y93K63QS+16iNHTX3oCp4ChhKF33F8/TBKQTX4MJDz2V6w+PrcuLK3S1MPO0D4kHJLF+fIwUZX0pZwEFGSMfMy8ky9ZBFflTpXYg9OiZvpLKRKoLjQccGUpdCZ/ztdbL5uCF23agAA6h96k4dQGw2xhDjVtAZ8ncliZOuGrni/sZOUTpN9LN8TgJMHE7mmCEZTdRFqOddzzAaXuEp14+XitvcsrU9zMEr9XuZzSQ410M0CfteZWWeWXBHMean7TaXTKdMVp9K6RxV9kR5KggHN7akQWxc9Luo2ffazK1GJRpItK7yo5L4G9M6hQZXgvgVAL0ni4QXIWoS/4mDsgDhJrf674+HqQ6yBHE8R6JOfc3QDwfea3bQGBNnRQgSgRZeiaRA+yiOA2vNOQ2yo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(4326008)(1076003)(2616005)(70586007)(8676002)(426003)(82310400004)(86362001)(316002)(54906003)(6916009)(8936002)(2906002)(70206006)(5660300002)(36860700001)(36756003)(356005)(26005)(47076005)(6666004)(508600001)(186003)(16526019)(81166007)(336012)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB5370
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR02FT040.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c5076d7-fd49-482d-06cd-08d9ed450a2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WIPEJzV3ygBfKO4fdf+G5WHVlGaNVimoOYSMddfVVzKuPJeyjX1BhFYM88RhzqlGRWgOgSdRPijRlH0G60ZE37oP1hlb7W7/gV++2BZxTnWbvTfAX5qu+DCWmw2rRKrQMK9WiZGwiYXzW02Q3qI4tumF2XAoR2akFPRCJ3lA2sTMZlZ87NdYjnkUrlEv4cQvPHbHNJKcNReXxQhFw/3rkQXRC4suqT5UZtBfkmr70VhJnXeIvQoP385ALp3hywZIQGH2qJEN8NvAWEGfYlHyy9ltI2LtzKAK8Px4lcSfmRcalW0UPzPTbDPL8ep8tytTAbhaZcCZkfBgO0Q/zpQPJFp6f/u8+j3o5+JFSGSqFW/927UZvSyGKVq8tB1MNXlG1AxucOk9CHNX1BdWxR4reNWfPIWWNeMAlhURjrgegt69DJMOv04d3GI9eYNcFisZ6Qtu+IilhwmKrZS1gQtwTUuvLjD5Ch3TwoeobYMSUXj2XoT0f/xRgapcZLdNRfddXvOV1AOflse0sQ7QSMb50QCuMdsQVYedghIg69M0b40NtJU+RU3BWCHL5AbxDysUgwOgY9L7LLGdJMwHBe1uROhNFpCcmEeRNc1bKsy670EZdLwIamMFKduRtTElaTSMJZZJJwMadoSh4lUmhpgK8J66wHDVBnKWY6oAdao65+uE8KMZ+uoGsRVOiySMFj30h7wvgyxUJnfkGxLr0eV9kzNapB0MYQCBxRVU766/RRvBRQj+AonQVvV+i44x978gZqnVUmHbwKA+hJAiD7Le4SRvwOhAsjFFOoRiLzf6axs=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(426003)(166002)(47076005)(508600001)(82310400004)(7636003)(86362001)(6916009)(40460700003)(7596003)(36860700001)(33964004)(6666004)(16526019)(1076003)(54906003)(2906002)(26005)(7066003)(8676002)(5660300002)(63350400001)(2616005)(4326008)(15974865002)(70206006)(336012)(36756003)(186003)(8936002)(70586007);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:58:26.2963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 775c113e-8d1f-468a-ff90-08d9ed450c91
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT040.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 09:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161638

This is a multi-part message in MIME format.

------_=_NextPart_6c7dea66-0bd1-4297-b5b5-7d9f15675c0a
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_77832015-de90-4cbb-92c6-a0e183c49f2e"

------_=_NextPart_77832015-de90-4cbb-92c6-a0e183c49f2e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Since honister host manifest stopped to generate, i.e.
manifest file is empty but all ipks/files into sdk is
ok.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 37b59afd1a99..27347667e846 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target, rootfs_dir=
=3DNone):
 
         rootfs_dir =3D [sdk_output, os.path.join(sdk_output, target_path)]=
[target is True]
 
+    if target is False:
+        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
     img_type =3D d.getVar('IMAGE_PKGTYPE')
     import importlib
     cls =3D importlib.import_module('oe.package_manager.' + img_type)
-- 
2.34.1


_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

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

------_=_NextPart_77832015-de90-4cbb-92c6-a0e183c49f2e
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>From: Oleksiy Obitotskyy &lt;oobitots@cisco.c=
om&gt;<br /><br />Since honister host manifest stopped to generate, i.e.<br=
 />manifest file is empty but all ipks/files into sdk is<br />ok.<br /><br =
/>Signed-off-by: Oleksiy Obitotskyy &lt;oobitots@cisco.com&gt;<br />Signed-=
off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />(che=
rry picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)<br />Signe=
d-off-by: Anuj Mittal &lt;anuj.mittal@intel.com&gt;<br />---<br /> meta/lib=
/oe/sdk.py | 4 ++++<br /> 1 file changed, 4 insertions(+)<br /><br />diff -=
-git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py<br />index 37b59afd1a99..273=
47667e846 100644<br />--- a/meta/lib/oe/sdk.py<br />+++ b/meta/lib/oe/sdk.p=
y<br />@@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target, root=
fs_dir=3DNone):<br /> <br />         rootfs_dir =3D [sdk_output, os.path.jo=
in(sdk_output, target_path)][target is True]<br /> <br />+    if target is =
False:<br />+        ipkgconf_sdk_target =3D d.getVar(&quot;IPKGCONF_SDK&qu=
ot;)<br />+        d.setVar(&quot;IPKGCONF_TARGET&quot;, ipkgconf_sdk_targe=
t)<br />+<br />     img_type =3D d.getVar(&#39;IMAGE_PKGTYPE&#39;)<br />   =
  import importlib<br />     cls =3D importlib.import_module(&#39;oe.packag=
e_manager.&#39; + img_type)<br />-- <br />2.34.1<br /><br /></div><div dir=
=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:100=
%;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"width:100%;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"font-s=
ize:14.67px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:now=
rap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;">_______________________________________________________<sp=
an style=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-heig=
ht:1px;">&#8203;</span></td></tr><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;">Christian</td><td align=3D"left" style=3D"vertical-align:top;color:#00=
0001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Egg=
ers</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left=
" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" =
border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weig=
ht:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Sof=
tware&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67px;color:#000001;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,s=
ans-serif;">&#8203;</td></tr></table></td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#0E50AD;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;fo=
nt-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.6=
7px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-fam=
ily:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&=
nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<=
/span>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font-size:0;"><t=
d align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cel=
lspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">Arriweg=
&nbsp;17</td><td align=3D"left" style=3D"vertical-align:top;font-family:Ari=
al;">,&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;fo=
nt-family:Arial;">83071</td><td align=3D"left" style=3D"vertical-align:midd=
le;font-family:Arial;">&nbsp;<br /></td><td align=3D"left" style=3D"vertica=
l-align:middle;font-family:Arial;">Stephanskirchen</td></tr></table></td></=
tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#1532B9;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Arial;"><span style=3D"text-decora=
tion:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" id=3D"L=
Plnk689713" style=3D"text-decoration:underline;color:#1532B9;"><strong styl=
e=3D"font-weight:400;">www.arri.com&nbsp;<br /><br /></strong></a></span></=
td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-ali=
gn:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"f=
ont-size:0;color:#858080;font-style:normal;font-weight:400;line-height:norm=
al;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image3=
99736.png@97B31873.E027788D" width=3D"20" border=3D"0" alt=3D"" style=3D"wi=
dth:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-se=
rif;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk6=
89713" style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-=
weight:400;">+49&nbsp;8036&nbsp;3009-3118</strong></a></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;=
"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr=
><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-=
align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"=
></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image200984.png@D72=
085D6.9877A823" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-=
width:20px;max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"=
padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=
=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#858080;"><strong style=3D"font-weight:400;">CEgg=
ers@arri.de</strong></a></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr><tr style=3D"font-size:14.67px;color:#000001;font-style:normal=
;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;</td></tr></t=
able></td></tr><tr style=3D"font-size:0;line-height:normal;"><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"><a href=3D"https://www.arri.co=
m/en/lighting/led/orbiter-accessories/orbiter-dockingring/" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"https://a=
ssets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Signature_650x95=
=2Ejpg" border=3D"0" title=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking =
Ring" style=3D"font-size:12px;" /></a></td></tr><tr style=3D"font-size:13px=
;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Ari=
al,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;information&nbsp;fro=
m&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://www.arr=
i.com/" target=3D"_blank" id=3D"LPlnk689713" title=3D"www.arri.com" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">www.arri.com</strong></a></span>,&nbsp;<span style=3D"text-decoration=
:underline;"><a href=3D"https://www.facebook.com/TeamARRI" target=3D"_blank=
" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><st=
rong style=3D"font-weight:400;">Facebook</strong></a></span>,&nbsp;<span st=
yle=3D"text-decoration:underline;"><a href=3D"https://twitter.com/ARRIChann=
el" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline=
;color:#7F7F7F;"><strong style=3D"font-weight:400;">Twitter</strong></a></s=
pan>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://ins=
tagram.com/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decorat=
ion:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">Instagram<=
/strong></a></span>&nbsp;and&nbsp;<span style=3D"text-decoration:underline;=
"><a href=3D"http://www.youtube.com/user/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">YouTube</strong></a></span>.<br /></td></tr><tr=
 style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-alig=
n:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0;color:#6A6A6A;font-style:normal;font-weight:400;white-space:nowra=
p;"><tr style=3D"font-size:10px;"><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nb=
sp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&n=
bsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp=
;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;5791=
8<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp=
;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252=
;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nc=
hen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Ges=
ch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Ste=
phan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /=
></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />=
&#8203;<br /></td></tr></table></td></tr></table></td></tr></table></div></=
body></html>
------_=_NextPart_77832015-de90-4cbb-92c6-a0e183c49f2e--

------_=_NextPart_6c7dea66-0bd1-4297-b5b5-7d9f15675c0a
Content-Type: image/png;
	name="image399736.png"
Content-Transfer-Encoding: base64
Content-ID: <image399736.png@97B31873.E027788D>
Content-Description: image399736.png
Content-Disposition: inline;
	creation-date="Fri, 11 Feb 2022 09:58:26 +0000";
	filename=image399736.png;
	modification-date="Fri, 11 Feb 2022 09:58:26 +0000";
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

------_=_NextPart_6c7dea66-0bd1-4297-b5b5-7d9f15675c0a
Content-Type: image/png;
	name="image200984.png"
Content-Transfer-Encoding: base64
Content-ID: <image200984.png@D72085D6.9877A823>
Content-Description: image200984.png
Content-Disposition: inline;
	creation-date="Fri, 11 Feb 2022 09:58:26 +0000";
	filename=image200984.png;
	modification-date="Fri, 11 Feb 2022 09:58:26 +0000";
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

------_=_NextPart_6c7dea66-0bd1-4297-b5b5-7d9f15675c0a--

