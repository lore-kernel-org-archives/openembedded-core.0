Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB19C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:51:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web11.8401.1655995905392497349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mK1TogJs;
 spf=pass (domain: arm.com, ip: 40.107.21.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fp7AeMylIT2MCYDLwsjhi93Eo8cD9OeyoZJ0xMa6lNR47TgeQZV7MuvjrgOduHAB9WcIw3hBSjix2B0nopY5Z68hkIus8MXedRDzYDd1bmCQ7Wh+LzoCcPEwBpLRbizXhY/8twczodmpaS9zQkn5DxTlzf5sRJmAjoT8fJW2vx4Ci7NukmoFZbs8394euCj92wOFewiVZa5BQX3G5X9MwZlBcJixBJv+yG6x43A3fTlthQ9Kq9euiKIcmv2iJG43gqYEeCvnIxV2MQOhZrds0HryxeYzUEn6Okqsh/EoRM9qFvSJUFugkHxNC59FM3mCyd3g6l1poa2EOBC9Fp85sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpdgrvO4LoUxswrrH42ma5d7CSkYXqw4h3fCCK0qSds=;
 b=Wa6efpn8HrV406lF5qSnF+Gtit/AUAlk8SOuRNIAF+JYjpCxzbQ891QhixLZ6LPVfFcSv4svtDMkeDCq+qk3+inSbK8B2jfTdfz/ncJ8RhiCa2GCux5qIIUhcKUseqB6tRbCL5oGVqvAUWfYkGwBhHuGP3Mp1yaV0oHUFQaIm7viTTXkW86qFehlIQZd7AqWMoJs3XKzU0z+xhUGqRuD608z2cc63emoDnzcBUg8Gfi9TohcRzNxTJ1J38bWt8/WRmUS5OzclYJRBZQO0hjOZRewmkIoDEwG419BFQrMDOrdMNGUqwjwtHoIteLlAn9FYRoC1+/Y4PzrXes+cPn0Sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpdgrvO4LoUxswrrH42ma5d7CSkYXqw4h3fCCK0qSds=;
 b=mK1TogJsDSbAfgsMQRWkNnW9of+vCWQD013NpEpfk46ohwvUkYomujUybAUC8CEncGN2kHLea6SxS1Ff1JvyWzON1kwJ5uWrxHBMlyFrdoaB/QWBwDxFCIZM6iko3IznDd7p/XM+0V5Ik+n+fHlAdl+2FyUUiyqh55BfMtQInvg=
Received: from AS9PR06CA0394.eurprd06.prod.outlook.com (2603:10a6:20b:461::27)
 by AM0PR08MB3540.eurprd08.prod.outlook.com (2603:10a6:208:e3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 14:51:41 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::f6) by AS9PR06CA0394.outlook.office365.com
 (2603:10a6:20b:461::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Thu, 23 Jun 2022 14:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 14:51:40 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Thu, 23 Jun 2022 14:51:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 846de2b58fc2396d
X-CR-MTA-TID: 64aa7808
Received: from f99f1c8c3fbc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3FF633D-AF80-4103-99B6-D204AC157719.1;
	Thu, 23 Jun 2022 14:51:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f99f1c8c3fbc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jun 2022 14:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyJB/9xrfszut6IM7WYNu0sJkK0f5Hfk4vyMT7JrFKJTYpjXYzDOczmhbkidb43mQyQUsPVNpfRrxe31XfCbg2evAl/GWoEasB54va/00hc0cgEYDPSftFKAvyygg/8YpWExwsA9YYFs9AYpPkoqSlEshZJU297xbzpYNrhbVUVS4TWLGQOSPU3LxUUoFDrv3tq79mCmHP8s/zjhwmc9PDSZ7qXiz9qZyBjQl86VUBke2BEYXzmCgEpeuN9dzvMUORKMac9hyYnSxnDEi0nhJacPF3ZwAlbh11cDx8IArthMpgz8U/PO4y1gos3ILF6UgFFUwoLJL4+U9lETqL/Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpdgrvO4LoUxswrrH42ma5d7CSkYXqw4h3fCCK0qSds=;
 b=cDzdDWYGIZjqOd7A90g2Z6+3eHyextfTPzZmRz/VllrwWwZNWq2pXQAZlnSnDKCqPkJBzAfzDVLhGFz4ZB9sJXeqLjfcMZ0DtVhqTFGS5ZBUStVjHBQjm3nx2iYaj4zVryCs8fhG47pmTG1Rt4Y7MnEk4DD/xE63nkY3Ek36U/s+9OfieeEOrJsKJUVlFraWx3f19RqGYhTomgkNqw6CjW9tZ7UJf3u9A7vGELonS2IOMtqFIChQWi6geUgIKPcemFJZZa8QLX33SHGnSTzbI+lGZ298Syvg0pXzXH9svdrNWS4zepTjrNhattbSMA8C9xDi/Rnc30TTqhsvoATAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpdgrvO4LoUxswrrH42ma5d7CSkYXqw4h3fCCK0qSds=;
 b=mK1TogJsDSbAfgsMQRWkNnW9of+vCWQD013NpEpfk46ohwvUkYomujUybAUC8CEncGN2kHLea6SxS1Ff1JvyWzON1kwJ5uWrxHBMlyFrdoaB/QWBwDxFCIZM6iko3IznDd7p/XM+0V5Ik+n+fHlAdl+2FyUUiyqh55BfMtQInvg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6527.eurprd08.prod.outlook.com (2603:10a6:102:156::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Thu, 23 Jun
 2022 14:51:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 14:51:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] python3: fix a race condition in the
 test_socket.testSockName test
Thread-Topic: [OE-core] [PATCH] python3: fix a race condition in the
 test_socket.testSockName test
Thread-Index: AQHYgkiTv8Rc9szxLUiciMc2KHluza1dG8GAgAAA+LY=
Date: Thu, 23 Jun 2022 14:51:32 +0000
Message-ID: 
 <PA4PR08MB74116345DACF55A2CFD7DA8CE8B59@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220617124820.3030925-1-ross.burton@arm.com>
 <CANNYZj9MAVCDE0ypESkUasY9O-rMR8w65PYBpkMuTHt3A9Jd9A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9MAVCDE0ypESkUasY9O-rMR8w65PYBpkMuTHt3A9Jd9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9ce99a06-b096-43f5-7e2e-08da5527e1d4
x-ms-traffictypediagnostic: 
	PAXPR08MB6527:EE_|VE1EUR03FT020:EE_|AM0PR08MB3540:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB354003311C8CA73A79E4418BE8B59@AM0PR08MB3540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 an3112VGIT0IlETH5QHbEwtL9UPnzBvEAi9IrBumawkdDlLpjMwC9Kp49F972ZgXQPMXYqgBMjxH/bVVRBaOrirgQg8XJsTZCwsQXNz4SpBrQ92cq+k04xwGfvXBuT+Ph4rxGpBe7RPWa6gmU+Vp4sgzsQH2U/utahPhw8I0C0AJqlQHZXf1gu4emBy3nasqoid9uGK0lZgIpRdx1Sj72NBHyxHZza72fGPBDhryzpckjfmOAUn0j8bVMNgFfAFxG9bn99WllNqk+7tcm5Lsne2jmAy4TGHDFVCg1TxQoDeUfIDiQqMZyZNJKW7AHLCyXgI66c1JDwKSb3evZC6kQLNeKWeFamhY47lPlVGN7r45vOQol+QytK7Y+49MpOioXZsivNAZ8s+CTs93tU3pZWyssWl1Vak6x3XxbCWk05Qsyt54M7vNcWoJ6ZWljidRMhXtkgutaC6jJAQtfC4qZSyfUU2/xh8yHdlPVl8G3xVCAnrCpN6qJ5rQQpmRBM7soBC+XX/lwn5Ba/Zvw/N+xr0Ln9fCKML041nvLAlfmgItfaiRp87tIgmlQQYAJtTmMX4QEHeMM7eaIzCy+/xZMyURMdvp22wbEf87/lIFtmTJmoc+Wrm/KAr7AEQISjZpzw5UQ9HSfwINsJm/fxTDvnetGL0i2BC74g20LhGPPuch6ZmYqI0X97lmE7B+Gh/Qe+hzDaHEM3xbcyXW4ugLm7Bi2ZkZ7BRgr+/wFkWxGeYnz5KLpqWHleMPvwkVpe/Xp2EQMHE8ePOqRU+RFa2N7w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(76116006)(91956017)(478600001)(186003)(38100700002)(71200400001)(2906002)(66556008)(64756008)(8676002)(122000001)(41300700001)(86362001)(4326008)(66946007)(66476007)(6506007)(7696005)(316002)(38070700005)(26005)(66446008)(52536014)(6916009)(9686003)(33656002)(5660300002)(54906003)(558084003)(55016003)(8936002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB74116345DACF55A2CFD7DA8CE8B59PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6527
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	551720eb-b634-4c73-9fe4-08da5527dd33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7oIVASQ3GhQlGlg25UB42zde+mSLMqjg+kRuV5PdgKf5UKhyPdczxQsM9DbnZD83U5uWQdaOUNNt8jE2J1/OQQHd/sEJLV3mkpqqi52SPlHz4iHuDbTUh1TqKi9cOagNb4qyEVCzH3MV3C+gMuwQw43MuLGaxtF9XfFyGDvKGh/QxYkhIBqVHOvkRJSkH9tk9pWoN/skdFgDKbkulnLDcAjkcT5t2vnE1Zj8PbDyDwoucejI6sfT2GbKLCWXUafU5AKJje7iMmVYQbaJMz8iydbcLsL6ULk+g6xrYPqRIxtNjb59g3vs0+G3FDcGDKrUkI3i+no5XHjQ8RCu+hCs8HAO6D8Zgtl0e4eHMCqIlcq+oCOWNZ8KhX70amyK+HlfoWtAr1Gjb2fPrczOjeU15t9YmeXkhOPZTgXiYfIq4DMFXQK8/iFpXt/TGxlqYK57aMvMGqB4U4ZBxfQvV+PoIZcNu9V1GGRJQLrPM6dgYzzN9l1S5BH1d/Rw1wNyseddxZroINCGt7rUbmdHol1sez3AcX0dqOy9OmWOqj/3PUps/TIeaQw4lSrh8ghY+PUpbLa53tjftWCY8iuY1fqN3wIZsqSuL2S4vaFbCjv+jqYa35pZIlO8nLXNulSLZUD6qbozgcQr7Z1uzIVxw220eShGEi0M5/LUVw+I6ciMe2eCcUU37nyt+1RwQ5LclrZIxLT3NNNZBIGukzko1kdq11+059noK9qsGr+8k8BbRlpplZe1C9Ys2F+0QmVnZRxMumM7fB+249K7lBpxugwtMg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(186003)(47076005)(54906003)(8676002)(36860700001)(336012)(40460700003)(86362001)(82740400003)(70586007)(4326008)(316002)(6506007)(52536014)(6862004)(356005)(5660300002)(41300700001)(26005)(40480700001)(55016003)(8936002)(478600001)(82310400005)(7696005)(9686003)(70206006)(2906002)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:51:40.6137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ce99a06-b096-43f5-7e2e-08da5527e1d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3540
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 14:51:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167272

--_000_PA4PR08MB74116345DACF55A2CFD7DA8CE8B59PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> I trust this will be submitted upstream right after the python CLA is
> signed and approved?

I can=92t just sign it due to employment etc etc, but yes, the process is i=
n motion.

Ross

--_000_PA4PR08MB74116345DACF55A2CFD7DA8CE8B59PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; </span>
<span style=3D"font-size:11.0pt">I trust this will be submitted upstream ri=
ght after the python CLA is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; </span><span s=
tyle=3D"font-size:11.0pt">signed and approved?<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I can=92t just sign it due to employment etc etc, but yes, the proc=
ess is in motion.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PA4PR08MB74116345DACF55A2CFD7DA8CE8B59PA4PR08MB7411eurp_--

