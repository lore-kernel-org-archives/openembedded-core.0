Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF89C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:35:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web10.22084.1658939732040302393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=fiJ8t44p;
 spf=pass (domain: arm.com, ip: 40.107.6.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aVATMf8yT+Rnx0zX+flh6YX97o23rHt0AH9uDHZqaXNBAWp+K6QESWAiuQDy9BtPdwSGoEtDOPkCJ2nsgUgWSotxCEyHN5bZlwGG5cCYCY9JrtAGXC9bkGX+a0fK0dK9BSmunB2Q18oKMTWNykiibLS5V5/FWTqNbmTtqMIgxkjuzLPhZPVa+W9M9rsjCWFlQwX2/fATNnUsDtpQUCASHNtpISQ9o8Mkal28mYFh41ZJkLThCk+Gq78xpD29EwyLm8wkdJg+dY940LSlwN/wkdmUI7DKAqfHlW6TlcFwh8WmARzDkze8rpWKeuKQ4OB4B961UgshmkdCZxmOfxKXrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4037gWCwC4IpWFpur3qcmsEqtFPsyNd/n0TkuksQNY=;
 b=F+Kj/re8HBOFnXa1w0qL2zPNVMPuLRJp5IfhG6OtoRP2nZsWyj2jZaGUzLPWpHBYQ+ypqGrRVEvk1tv1z8Bb2YLxxfc+Bfu6gApAu7VEozKha6sAXVaGQ78kfi6uDN7GSFFn+8uJVLv5lyI5Lca/XYtTLxUflGaYvMWtqZT7+4gQcR4jz6ZKfAEwKg5pLyiL0/Hrk+LhKGLY1ffuSR+dxaSBoD40SREDqDqT7IhRB/HelxeAL/llWxFk+2FVeXgHQc8F2Kn+ahiEoXXYhi2esqm4oVglMczOnKERL1Sm+D2UPams8tJM4wNWWN6F1OtboXH+pIxDIch5Cu2VtLzNiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4037gWCwC4IpWFpur3qcmsEqtFPsyNd/n0TkuksQNY=;
 b=fiJ8t44pcuVFZHsfDZC3dm9Oz+CYvHUA5xFCX57MVJ9XAEcMLJtnpLYwzx0VQmKigfZc31Abze6e0Xleoocf2Dm75qyAiJW7kZL4bQsFbTxGUdJtqc+DLRhDsJdImkE0KX4F4YN0YmFgqIRMtpE+RHWqwYhNhXLAep8Fqte9U6s=
Received: from FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::14)
 by PA4PR08MB5984.eurprd08.prod.outlook.com (2603:10a6:102:ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 16:35:27 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::25) by FR0P281CA0094.outlook.office365.com
 (2603:10a6:d10:a9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Wed, 27 Jul 2022 16:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 16:35:26 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 27 Jul 2022 16:35:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b05bf9388892397f
X-CR-MTA-TID: 64aa7808
Received: from d1f048b1ad5d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 089E94D4-257F-4E98-AED3-605094D27D00.1;
	Wed, 27 Jul 2022 16:35:18 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d1f048b1ad5d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 16:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU/4usWnTz7zqPvn+7C0hWsu6fsrpbbKOrJLMRHQmMa3nl7IkNqNAkhuxsmK7pWpsrf+t4Tw0Kn87FIXvlWDbBFSVxbg5U9KBbaIo7pDrt0WbYpvlqfwH/Ehtvme0+Fb3s805EcDf+bevzgLJW8ndRXbrNgcl8EuklXJZp70OHHhdJHnG7kcjawipW9VnQWfxDK+DhZz5WOEImh88yCBRho7EJiECJ4Dly652h8dtHQ+tUOVl/i/MaTkmMPHmurs0seXNQRVEiCsbuy8WdXWoBYzXXNmj36p61imnERWbc9S4q27kniOv8F61w9TpOjFmCM5wf3E7nrXJ61qtrVveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4037gWCwC4IpWFpur3qcmsEqtFPsyNd/n0TkuksQNY=;
 b=Uf4Bpttct3ArgRThAhKn/v8Z73yElEt2moedvCJcJIfbB/k4w4326pl6YK1hdvKT5EMEtwPVOlvxBnWindtDJd86v8yARt8OYoYMcFHQFgAraODAlbCV7ZD2a82OJVF2SEtIpNmH8FpyCtfHPr8PPtFKTQq/xxZcYkMtgpM/wsDGiZH2bvSu9BWFha6KJsZgUs93TYo+RYvKazwMsbLFU0rXBlrtPC1XVvbgwrHEWe2FD2/QZXDHr09XYNXeD4FW87m7XFwfXVXpsOjXfY7Z6hizcXZydDdf5mcaV/nhujXnGvYYeauwvNKGQMz/NPYwykLEUYkuJNMJHamqjsbnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4037gWCwC4IpWFpur3qcmsEqtFPsyNd/n0TkuksQNY=;
 b=fiJ8t44pcuVFZHsfDZC3dm9Oz+CYvHUA5xFCX57MVJ9XAEcMLJtnpLYwzx0VQmKigfZc31Abze6e0Xleoocf2Dm75qyAiJW7kZL4bQsFbTxGUdJtqc+DLRhDsJdImkE0KX4F4YN0YmFgqIRMtpE+RHWqwYhNhXLAep8Fqte9U6s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB7118.eurprd08.prod.outlook.com (2603:10a6:20b:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 16:35:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 16:35:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, "Purdie, Richard"
	<richard.purdie@linuxfoundation.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Topic: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Index: AQHYobCNp/pDUHHp/E2gMRFZmhqen62SV7qAgAAOVoCAAAQwIA==
Date: Wed, 27 Jul 2022 16:35:16 +0000
Message-ID: 
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9e2e2d30-7e06-41d2-d889-08da6fee02d8
x-ms-traffictypediagnostic: 
	AM9PR08MB7118:EE_|VE1EUR03FT053:EE_|PA4PR08MB5984:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yZqjpqRKT4FoZVIMcl2IaTUVN3pSSLjmDnRoR1+utoW92v/43s0DKPvbgweIOrZh93HyV/7L+7ZRZgmOnluws2eL6KUsouOU0yvIRZx5HaLA7AE50h7AbjtUyBszDEe4SAZZfRrVr7MgZ5nE78S/p4+iZQNCpm4WHQzIB+xIVc3AjoUnEwC++QSFhAE2b//m63eoSgPp+DWv87OJ48RUZLHBqU+T77R3LEhAAnSk2DFd1U2LZal+DFkNeyMeCOkRrcRoivL6WiXzsq9jzMmg8kBQmwGBN85/vDowF+7TL+hHX/Df/kOeuYoYoFbRJsDBA8FRV1/JrYrpgVlJ/Szn++8v+4H6jx/9kkhcsbSNU1Ona2vH3C6WU52rqPB+XQRolKJZxxWuprDExFRk3kM+8Ac3C2toT5c4TO1SwwRuiE2wlM2ndureLcicB40jYLwayXCM/Vu7/PuVojTbLBk93gCY0TcYZ6LROIG/rtx9fafbkOrcrpwPbotYW8vK2yGj6sV8ArpgFzyqVhF3FBNjsuiWabg7YnhmRb00ufJN8V/0Xi6HBmMCUQX2XOLli0NQplTVeC/10qRlNktgQTvzLQEJpdgKEA7U7tMl35eurF4StEclPPevA7SV++5Hbh4oplprmX7EHARB0HxS1PvUJO2Bo1gQiCEo9Ckqm4uvJZtENmR4Y7/OMohBJCvdHmMxMwJmgkwL97RieHeRDakl6IODyHy3SW8YMKWR5K+cSk7/7LWZ77zFaqrrTy3QjiAYSpUL8tXQ1QmcxxnZ9jDycn12i5f39ck1rogfOgrg7Ppfs+fk5LW59tjsD1FkXeyH8EorijEMuWeJcHPyTxS3YQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(66446008)(91956017)(33656002)(966005)(66946007)(4744005)(66556008)(8676002)(76116006)(52536014)(186003)(64756008)(66476007)(4326008)(8936002)(5660300002)(316002)(9686003)(55016003)(7696005)(2906002)(26005)(40140700001)(41300700001)(6506007)(53546011)(478600001)(86362001)(110136005)(38070700005)(38100700002)(166002)(122000001)(71200400001)(54906003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7118
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33a1dc85-e76f-4f15-b571-08da6fedfd0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1uxxBQc/vBgMQ6NR0nrOWRMueICkbuC6qvzpx89OSxO1D+KRcNjAjdA4L+bYjaSry/RN/4IH0Ttlvcf7S+R0hvaNGFsD+ec3o4yjDsWAIzhpPRvui+A42dipw06pSfHp4qg2mEmdoDQDjDF18ttQJcx2KAjdInLMuNHoogSDVbgzYcCmTFF6JTny7I99BWN8UIJdn2tA90XqvVgkAcHXNwA0qBHe9gMG9dWccg7LIhp+X4/ylRi8c3grxad8gNnjSOc7CkSyYNoCmcvHAK1ie1qe4Gs65WXPKBd35rgub3qBcaWV/qWQt3iiH8bsFfR3zZRou0BHNHLh8rL2ZJPlUdUSQfD95yYx4b3BhTIahUAtXrieH1wALPBVAbTPCmq7ZbrkkUP2ci62Jih+LvCo0dVgMxma9fGSwPrHjtTaY6RdpjMQmmSNW/jA8oNRuw4dtyE5rZ2hxovpSgnCMXt6gI+x73+LYxeLF8tOhtUI2kFPKTJvlvC/57qBL05qXmBVMvsBku9hGig65vJmV0OWP6JCFZy3yQmFYFVxXydZccXHZuuvhyr3QE1/GPhhsjuUpwEzdglU/oGJ0b5A2TET5Wta2ADuPf10h/y3FyRrAzIMPdUxp+/OI+O9/6BETvokHSjfxsqZ81CpBmkzb8nt+A7Ig2OMAvNgvlTLXwoJFFu5a5Z7WoSUjYY3AHvI2/taw3FHMYauNp6TeBWeMyZhXImF8L4RWnNHMqHZFV2Sb5JueYi+FUUno1v+RR5so01OixuqHHT65K9jGNKeKHX8BsvupjthKvGTp9uyvMlQXT1Cqd+i+wfcEpFqxsfvJuiPslCL73a87qlFu5308ixVkA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(40470700004)(186003)(9686003)(26005)(478600001)(7696005)(6506007)(966005)(356005)(41300700001)(82740400003)(53546011)(81166007)(47076005)(36860700001)(166002)(52536014)(33656002)(5660300002)(8936002)(40140700001)(55016003)(40480700001)(82310400005)(2906002)(110136005)(316002)(54906003)(8676002)(86362001)(336012)(40460700003)(70206006)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 16:35:26.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e2e2d30-7e06-41d2-d889-08da6fee02d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168575

--_000_PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979PA4PR08MB7411eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Whoever adds the patch needs to add their S-o-b.

Ross

From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wednesday, 27 July 2022 at 17:20
To: Ross Burton <Ross.Burton@arm.com>, Purdie, Richard <richard.purdie@linu=
xfoundation.org>
Cc: otavio@ossystems.com.br <otavio@ossystems.com.br>, openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomi=
c builtins


Em qua., 27 de jul. de 2022 =E0s 12:28, Ross Burton <ross.burton@arm.com<ma=
ilto:ross.burton@arm.com>> escreveu:
The patch is missing your S-o-b.

The patch isn't mine but a backport. Richard can add it when adding it to M=
UT, though.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--_000_PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979PA4PR08MB7411eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
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
:EN-US">Whoever adds the patch needs to add their S-o-b.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Otavio Salvador &lt=
;otavio.salvador@ossystems.com.br&gt;<br>
<b>Date: </b>Wednesday, 27 July 2022 at 17:20<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;, Purdie, Richard &lt;ric=
hard.purdie@linuxfoundation.org&gt;<br>
<b>Cc: </b>otavio@ossystems.com.br &lt;otavio@ossystems.com.br&gt;, openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH] libusb1: Link with -latomic only if n=
o atomic builtins<o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Em qua., 27 de jul.=
 de 2022 =E0s 12:28, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
>ross.burton@arm.com</a>&gt; escreveu:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The patch is missin=
g your S-o-b.<o:p></o:p></span></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The patch isn't min=
e but a backport. Richard can add it when adding it to MUT, though.&nbsp;<o=
:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-- <o:p></o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Otavio Salvador &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mobile: +1 (=
347) 903-9750<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979PA4PR08MB7411eurp_--

