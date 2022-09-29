Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20470C4167B
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 15:33:57 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.44])
 by mx.groups.io with SMTP id smtpd.web11.12062.1664465635156119600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=imY+SIRT;
 spf=pass (domain: arm.com, ip: 40.107.13.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RO+JLHHabbT1s2JiJyteO3TzugVXgMvR84ghHK+IZal0e37Je2Tq6Arqw6i6w+idyJLJdtJd0hQyffcmuTdrtS86g8V7u4w1SdgyPAiA6X6IpXhQmjC/eGeYd2/3cLdNmNgGwKzeoOYy3EnfmvkJvGHjjkX1NxHc3rifDkFp3vr/ajUye3IsN3/M0oaINcBYGLka3A/Lkrj/tiu4wMJcOWIzbnc9Iomaz7osxZKC5z9YGUplL7QT0LGT0FWPBErBs2qqOHrBZbrfr/JDjWlLWUNXFsLoQcVW2iu0Z2/YuudRSsUSRvu38kYlo6dDEJ/K9tAVwvMFlRhBfX4p6QvTlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiqFCff7eh/GaSVvA6ltR8z9Q24nUytZVgWI8hsQD4w=;
 b=GqlRUjIh7ukyTzx/79GAOLSEqXY4x26ODMktCvqW/1QsPo9zSSVwEYqEt0NW99pZjSWS5lfnGBCWNiOC85JyMjgAgNeiI7V49yx10Jtz5wED2GBrXz1flNPPXeTepuk5Wu4bOOUt5bFDsde3uHO7lvhDxpKjO+ooYTRuVUTKxahsKIRC+VNOtyXOqXmo1RbEBQT9qX65PuAf7k2LFfpyOdRwmrucuInTFhF+vgaS3cxNfCtTmweRviePyXEWaD9jbXfAl0/81IKELKUyOhwOo+smmJ+C8BTDZm/KMHsvS3qqt4eREho+lWzz9I8OyqTXFGSthSXxDT2FVJbrh1eNYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiqFCff7eh/GaSVvA6ltR8z9Q24nUytZVgWI8hsQD4w=;
 b=imY+SIRTAdfwuALpgOquDdh8E6ccr0s3AvXxBCXMdEwNvyLnC7o3eoQo7kppI5KboQ4rphBD+KF/c4dpTRHHl0u+LjBtYsVMyO4/55PVsk025rFoYJMuTie1d7PDSz+ZtIpplzJVhTr+BJrfw4zXEoTpgWRRzQeXF4JtPaXMvHE=
Received: from DB6PR1001CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::26)
 by PA4PR08MB6255.eurprd08.prod.outlook.com (2603:10a6:102:f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 15:33:50 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::5a) by DB6PR1001CA0040.outlook.office365.com
 (2603:10a6:4:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 15:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 15:33:50 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Thu, 29 Sep 2022 15:33:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 94ac3327248f4b7f
X-CR-MTA-TID: 64aa7808
Received: from 7808b0504c46.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B41164BE-708F-4270-AE8A-F7840A8B4AA3.1;
	Thu, 29 Sep 2022 15:33:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7808b0504c46.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Sep 2022 15:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzeO1QJZk88y5Kp90cNWCw4L+Jk1fKOuNVni8Ve8xvISVltDHa+5pbGvg4bxTvmiyU7FE3eyGSPaqF0wIublC3ivrEfdHcNmmHB4KLAY8jbao4HM/QXyadljpfO6JbQN4r7B8MzvNl4WqkGktOIa5BvGald0JATAVCYpNi+my8yJss2joo9N2WJZAJPls8JXuQn84MdddQoSj9xGuEINrl5SvZ9qO0+ZturCXCciYnzDXVhZV7ae6GM1N2u0+NkbLeTawMrMvqy83NTST9YsbsZgW4El8FiMUJuJiLCgwKMUP+bpWBD7MoKiPKnImyw/eVngmUPqJg8chGbvt3iHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiqFCff7eh/GaSVvA6ltR8z9Q24nUytZVgWI8hsQD4w=;
 b=SlvF998GIlVYv3/2KbnSAd+MoLChVJJz2tRUkEcJ9ZJseQfIIckbAciQ6X4jIjEZp0NhRsIBk9zQKmvIr4nLWtjDGNXMJg4VTSB4QZZCZDDQoY2dajpPY/1i49050e/qGT8eOJkj4A/+g2sMkuwfnlZkV5i1OQftsrXtHo/tIrvH1ypdSI3YjSRMvdZ6eXDmlO/5pY5/jcoECaX0cfWRRT6rBuewm4d/s0RDWJyP7hZqWIP9/5kReI131BIB5Md6+MK2qybCpdOrn2JCQgUWd+LVN60p4XGthka0+TYkwYjKu/TqBikTvtyj5MfI9Rs69rlUNgFdy7Zk8Qy8BS5StQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiqFCff7eh/GaSVvA6ltR8z9Q24nUytZVgWI8hsQD4w=;
 b=imY+SIRTAdfwuALpgOquDdh8E6ccr0s3AvXxBCXMdEwNvyLnC7o3eoQo7kppI5KboQ4rphBD+KF/c4dpTRHHl0u+LjBtYsVMyO4/55PVsk025rFoYJMuTie1d7PDSz+ZtIpplzJVhTr+BJrfw4zXEoTpgWRRzQeXF4JtPaXMvHE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9820.eurprd08.prod.outlook.com (2603:10a6:102:2f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 15:33:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 15:33:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Daniel McGregor <daniel.mcgregor@vecima.com>
CC: "danismostlikely@gmail.com" <danismostlikely@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] gcc: set the default target arch
Thread-Topic: [OE-core] [PATCH 2/3] gcc: set the default target arch
Thread-Index: AQHY04egleefWE7NP0a5hcNaFxi24a32Q40AgABGYICAAAC2AA==
Date: Thu, 29 Sep 2022 15:33:41 +0000
Message-ID: <B5F2A1E2-35C1-4F3D-A546-A27B0575F489@arm.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
 <20220928221320.1763684-2-danismostlikely@gmail.com>
 <133AE478-7799-4555-9260-2706CF3E11E9@arm.com>
 <08a4803c-628e-c898-eef4-7d40775e27bf@vecima.com>
In-Reply-To: <08a4803c-628e-c898-eef4-7d40775e27bf@vecima.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9820:EE_|DBAEUR03FT036:EE_|PA4PR08MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: aa233f7d-e530-4732-e0af-08daa23001e4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q6JGnT/NMdJmCrq6J+LFSv73SvKfO7fg5pMrpgZ5fPH22M5FrJZuOqsUd2WtaNrgG4QKX5eolDHADN9JGctXI7x/1mF7Z5tRpVETlMR++s3q1S/dlFiU50sJdGj5NQ63EmEca2xqEpjlKlGMAYCDVH1Kwmo5T8PF2oAmI68yTsdmJ0kQk/Ap4CIOkInk6YEtYtbCYB1OvUKQuTG87PY/vLN3ToYTdHv4Np5JgoWPB4+mKjEkbt3XyhpIE/ypJWj4uIpAwNnQ7foXNhV1WXyZdgBR4Oluc9GArJtzz7QLGZIlveXcznZzyanTAkd6cWYEMJoKFIlxQedwrWsn05sJJqz4FRiYlL4ewNfUKNiVY76LcoeREXOP/YYEzYFfyjfVpu4qjeKTSmWcdtbN87ipmVR+Njc5zSsxyGSDPjjj/JEmM4YxHYVNNTe9RrTpziqXGJWWvhaJ+EbhV8c/6Prvmu2v1D2CxxMnoU1s+AKwJXiGv5fDHDcrVrscbQ5XARDyt9BXJBfWIR3+kirzzTeKYsiqjym9xrtY1/uWaRraIRHSzh2YXdNp9cP0El9DZ7g7ZP1wSN7mSdBAAdHE8ZkIMcKVnkONL58Pp+3Ul1gv92Kuo6eZN6cb/KyXJET9dzuJnQHSpiUWXtdDkmu2ZIBMmCTSV8hduQERTDbCVcXccPczu1IA0jd1k1evA+InTEhstOQCTrAkVWLbTcD66tu3ZX3x97Iv2M2/urCoudTOS/2SZ93aub7qYltnt6pu99fvDSXtD0E9HwZbfdjfiQuAXMOVLkVTNv9BR8dKcWtZ89A=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(33656002)(38100700002)(122000001)(86362001)(36756003)(38070700005)(478600001)(4744005)(2906002)(186003)(6486002)(2616005)(53546011)(41300700001)(26005)(6512007)(6506007)(54906003)(5660300002)(71200400001)(4326008)(83380400001)(6916009)(8676002)(66476007)(316002)(8936002)(91956017)(76116006)(66946007)(64756008)(66446008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE99AE1FF0B49445BA03ADB6927B6E01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9820
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2fd9a95-fce5-4794-7bcb-08daa22ffc9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	10HEm9G6kH6K59lyXtIH59TWnxoGmNgFfLixz6aFqJBhdRCpgaz5BtYocKNPWjPzmgTAbTge5MVBOw6D6x2WmDn96c62C49tREC8rMo9Omn8Mk5ttmwyXLWLgFGA7btzdfnkJxAmtvbvY1j1EeMEyLPkY+TRz42ELK44MedlGfXQlKnX8Nl2MZELPt1pEgrenk6ntv4FZkR0JlYDBmvQXSFr8mROTi96ccDW+/iDFsjsPJ9IS7kGHfjjL7vGeKvi9sRWk+foVXP0ET5a8WqxYvpKR5gEPNF7swt3W1EV04zTBSzCiGLVhahOBW8CZXPnEyzRo/5mkyVZATdSymYDvgt4/xwUkSGi3moxx1OSvbF8pVtssj7H0m8TCGRssJZfZNt/Qx3zpJclJ1oaszkXLpn8ZXvNFsqRhT09pTdW/rUzN4rxMwc1gbm+Pss5+LvG1N9i/VHkk4uCfdvaxf8zL5dxQe/Dolf6v4Lef5CCu1IspEtujrJavVf2kAj41AyWCrtPiHlG9WcdKoRJkuiPLl1tJhgqYE50K+dFNrJZxRk6FnG4TdUICyhVCWhuM05jb5FfUdW6+e0S9PY6mmx83qw5FdEcrT3aFk5g7Kh0+4l+uJUulwe7kIj3XwWrZx5Vp6JGhKPqyMGPLXyfNbnt61D1KqVDuPJl9/PjUvLx4u274b6nBUIO93fw0lbLgfRf6Hlz9+v/cGBX1avqjb3S9RMABZlL/6fXY7BpVu/nO+4TLMir6wHC7K8xLM32KWFPEIsgR7D5OKsuhOwsNZPjag==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(336012)(47076005)(356005)(33656002)(40460700003)(81166007)(36756003)(5660300002)(8676002)(6506007)(41300700001)(4326008)(82740400003)(4744005)(86362001)(40480700001)(26005)(83380400001)(2616005)(186003)(478600001)(36860700001)(6486002)(54906003)(82310400005)(53546011)(6512007)(8936002)(6862004)(2906002)(316002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 15:33:50.0097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa233f7d-e530-4732-e0af-08daa23001e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 15:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171193


> On 29 Sep 2022, at 16:31, Daniel McGregor <daniel.mcgregor@vecima.com> wr=
ote:
>=20
> Sure, I'm actually talking about host binaries, built inside our equivale=
nt of a poky build appliance. The most obvious example is pseudo-native bui=
lt on our newest build servers. GCC decides to use instructions (in particu=
lar BMI2 instructions) that don't exist on our older build machines. Since =
we use a common shared state and uninative it was becoming pretty common fo=
r old machines to pull shared state built on a much newer one, leading to b=
uild failures do to invalid opcode exceptions.

Ah, so you build a container with Yocto and then do your Yocto builds insid=
e that container.  Got it, thanks.

Ross=

