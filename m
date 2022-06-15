Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E7CC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 10:52:24 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.53])
 by mx.groups.io with SMTP id smtpd.web08.3188.1655290335397467579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 03:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=c4Km8jNl;
 spf=pass (domain: arm.com, ip: 40.107.14.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jfeRbGBpvAYFlgBTjeCgo2lczQ1tiHOW9uII94dUc9cIJLPmjVHTkSp4u4fqL0g/1CnRrUF4XV+0i0WDVQ7UdQjwjNZVWpDTSrrI55aNnSIgIcjCoZHTuKA6GSnBJfAJ5fqzNOqc41C1Ew9SQrzHHiUyv+OfhSSB1b88O6wW1auBgRQr/KXemZxLAYAl8NaOGATjhR91DC7dMiprXd7mWGMhcMb/X7WTf7QdDXwyPIZLPUIAUZ+7lGsJM1L2QpuKLUQawyCHQKjyq4+0w6A5slXtfkiIHdZ3nqtH8l4s9vC+GdTA7pfddjb7L/bvVn364klw6ANTRpEs/QGmGjQBDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTrGGsHW831OuuONkWLtPZmWyzxl5kzl6CDA5kjWhrM=;
 b=Z4TKzaxMRJXYDsZrazBQdKK0eXcfRzwWVW68idVQ2uL9WejXc0APjkVd2sIrEJiHrBzH49VfYIAUdOXA4G/Oo2snp4F/ZNgdWrFNu/QaUKHujEPEyTm4U91S9oHsG12bgbLk5UBrzPTiE6LQ7ppHE/Qmw2W/2TqtNH6hwkhb4ShyQiJbZoChAsAVhGolVIIGoN5Jc6nD3EoHWs7qT9s5D+sovN9fBznLqaOHIxMsoXOkwa2ExmpNYdI1bPBgK1PZfL2DKQfKPybnF5Zn+VPDdcQHlkc3h1kd0LZNRWyiAwQPhwaeAQNXqQLP9a7FXveOi9TpBtO92MB5RsPi/ZpMJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTrGGsHW831OuuONkWLtPZmWyzxl5kzl6CDA5kjWhrM=;
 b=c4Km8jNl1ZMXdiNzSgRX5cK2YnMSG+lH48g0Z8C+lNe1rwNx/ay/XUi5Inelj84DD6Inobb1H3qdpXrhMMyJxintJPQy9SarknfuYIsixPieedXrjqG/q6s/3rdvnNW0kakKb5o83HrJDLDFV1LFf+FyJpx+27WoEsvbZA7af1Y=
Received: from DBBPR09CA0045.eurprd09.prod.outlook.com (2603:10a6:10:d4::33)
 by DB6PR0802MB2341.eurprd08.prod.outlook.com (2603:10a6:4:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 10:52:11 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::cd) by DBBPR09CA0045.outlook.office365.com
 (2603:10a6:10:d4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 10:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 10:52:11 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Wed, 15 Jun 2022 10:52:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff685a65cf3d4f49
X-CR-MTA-TID: 64aa7808
Received: from e209514eac4c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94F9C40B-9AB7-42C6-B67C-41BD391FC0CC.1;
	Wed, 15 Jun 2022 10:52:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e209514eac4c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Jun 2022 10:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5dMqyfcvohNAH47zRb+NUwozXKjriiSvatZhaarR5OSRjptlt0mfOFi+Qtb4G+CyOh89l+VvbRYTUVsSZWMVXMWRFp3ahWCIYKHzMZpYnLO2YgrEaC7URLwSW2R2noIHN1zCMTzRMeUeXqMEiOdjyUM5CmZMtprjEsXxmdXj4h8pFuJzSN474Tay0tC7Eo+6xK4nTLY9W/uzdOb65kR2vaWcBKLM2ZYJpKJexLih3kFglNU+E05iiWYnE9td163VAU6fOMNHt4v0/Z3Wi79r6Z4K4hJz/0XI7jnZ5OY1ufqhFmw70Q7xB8NtyGaAora2OgNlbnS6nXNMrDOmuFfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTrGGsHW831OuuONkWLtPZmWyzxl5kzl6CDA5kjWhrM=;
 b=FcJA1ik2+k/477SN78QsrAJOlGsr4zVw4007b/CMJwvrB/AAQ6HLy7K9TOIkpOuwoC4MyqMKw8Ihi7eEq++lDC3VZFOVR6oihpAX9DmKdtMOO5W39pu4iYOE53yk2IAKiRRvbjHF0M5utdYaA29Lr70OKYxWQzhvzfBqsy2YJ3femvfzvQdJ8PeTstliD1pN3gHd6CDbd7dqXqLO7dyLoTV2mG6EFmKC7P1gdqtodJq74tOuETfSgqy8N4ZyX3paKvJBaMdx85MAKnHN5FaU3d6qZqsb/X8O/8eRgyXkPpzQdGq+Fq3brBQ0Edw21mwdcvxDtl0PGgd83JRojuPoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTrGGsHW831OuuONkWLtPZmWyzxl5kzl6CDA5kjWhrM=;
 b=c4Km8jNl1ZMXdiNzSgRX5cK2YnMSG+lH48g0Z8C+lNe1rwNx/ay/XUi5Inelj84DD6Inobb1H3qdpXrhMMyJxintJPQy9SarknfuYIsixPieedXrjqG/q6s/3rdvnNW0kakKb5o83HrJDLDFV1LFf+FyJpx+27WoEsvbZA7af1Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6804.eurprd08.prod.outlook.com (2603:10a6:20b:30f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 10:52:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 10:52:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ptsneves@gmail.com" <ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper util.
Thread-Topic: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper
 util.
Thread-Index: AQHYgAEi6Y3OPQp9X0+34yJKnLb8c61QS9+A
Date: Wed, 15 Jun 2022 10:52:02 +0000
Message-ID: <282753D0-6BC9-4B2F-B73C-313D10232BF0@arm.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
 <20220614151105.1890454-6-ptsneves@gmail.com>
In-Reply-To: <20220614151105.1890454-6-ptsneves@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a0ad59b0-1e48-46f6-82b6-08da4ebd198f
x-ms-traffictypediagnostic: 
	AM9PR08MB6804:EE_|DBAEUR03FT034:EE_|DB6PR0802MB2341:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB23417C45A57AC90371CDE7AFE8AD9@DB6PR0802MB2341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F6LX/zuvnPoBPthjg1N4lKQihwovbhBylHVy2jNhr5poW6cXEvCVUN+JJOsnVwR2Dzyyt/3O9FMKRT3P46iRVKnHGAnrzn0gvXVHa6xxvUV0dY519S+ZAqKalZ2kwbxLvm32qBymlyca+wlxvP2zgFIxgeDjCIirU6RfQRupbdk0pDSVo/y9LzwWzNa+6odWDbdEkDJnxPUPRki5lINOUBE+NgI+mffNU2ozs/JSTN6s6q6wv+cFxKcgkDOlEwsto2jaBIHqorpCZRTJafaRbedKj2CQSbgB2ry0ij/XzzIykRx2MrL277nObaAmALkheZ881jrGaBqF7uD9sZfDPQmRk+AC68ybq7i2hnCsfbFfvwQWpFFrqgQeRIDWrtz/5LtCGjZbU7s6aNS2GgJQ52gGpJFTy8lEfMHEJEpajuizto5UmrrL3pEmlk7cX4drnfGnUwqH10hRlCfeGUE4NF26hY70HWv4wTXB6zXtdGu+jRBAyg+TYKEULzDgUtafD21QXOHtOfjPQG4N94XCQR43kWoLXpg1k4Skp6CRnvQzQGhtuIyosgbsav/ca2ouA50jcQ8WuVcbPkMh6U/uA7NBMuTT7+MATj3NVx6mWbKqO7P9eVEGNnJazbfPXTW+cNUG+BHd6wmJF1QMXbwieS1mzuGWdUwHoKld9tjIQhhUvnicbxyReYozu3MyviG5saoU9innKPqMav3UoWWUmw4sMRHwfbTWxcmZ7lXqIng=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6486002)(316002)(36756003)(86362001)(26005)(71200400001)(33656002)(6512007)(186003)(8936002)(2616005)(76116006)(508600001)(83380400001)(91956017)(38100700002)(6506007)(6916009)(122000001)(53546011)(66556008)(66946007)(64756008)(66446008)(66476007)(8676002)(4326008)(5660300002)(4744005)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7611A440F7E244BDC9B443B1F7E88F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6804
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6dca0ed8-2915-46a9-58af-08da4ebd1461
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oOXnghBaHX4rHvllRyW6l3/5jelM1IR654Saz7Ckk8EjxXl904k+SPQXL5lkUjKppncD76vEpY/h5mAGkE0PkiDGgtD/uUkCt9YdKvmDP+ViBgBgog9SsfuiqjtkdliVo02AhXQjaK5Q2MgYashwoTvp+X6WJK8VR44fIUkeFXsx/lFReCQqyBCaeTUlVGS1u0ahU5qNTQ95qf3WD0mu/w5P3sbbZb3/EEX5UuIOGgSJOYTQ6NBOUlSOcy3KTo7QYnzDztZ37dY7+1m8jyLzY00ZdNbxP9f1PDUZjvAS6GEAhZ3Xq3LdS14nAC/5ezSIcFi9ehoc7ep2mzxiJKpxkQ+HewGwlnmqV26nCVXLoXtmnF5MU9tWXHPimgOOCjfPuLR8cZHhQCrkBMlMJvHUoR5gW2uECP5ouLdDLkRR0vRGr0JkoDsT+oN1NIZNYYXBTS8C1SFqnahA8PPVaI77PrNUcN1Tc8BCFN+aUK9LYCedblpb3yKFaSk1v0tLo/uFYXQCAnw/tZU/IKcXMrC/A33Gkhmg6GTpEkxyFB2rACTcX2pVrvctgHBH+ESaHC+iVMzHd5JJilymdvz58uVubD61TGU1o9/KkP0W1n+dOrGujmPV8m18Szu2i77kTpOVig54k+55wKSXbk1ByVzuNR2oP9DYfBb0JCmoGOlz4ECXMhF9an67KXxDAJKUbOmr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(81166007)(336012)(6506007)(508600001)(36756003)(6486002)(5660300002)(40460700003)(83380400001)(316002)(2906002)(356005)(53546011)(26005)(8936002)(2616005)(82310400005)(6512007)(6862004)(36860700001)(4326008)(33656002)(70586007)(4744005)(86362001)(70206006)(8676002)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:52:11.0967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0ad59b0-1e48-46f6-82b6-08da4ebd198f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2341
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 10:52:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166929

T24gMTQgSnVuIDIwMjIsIGF0IDE2OjExLCBQYXVsbyBOZXZlcyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cHRzbmV2ZXM9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiArY3JlYXRlX2NtZGxpbmVfc2hlYmFuZ193cmFwcGVyICgpIHsNCg0KVGhlIGluZGVudGF0
aW9uIGluIHRoaXMgZnVuY3Rpb24gaXMgYSBtaXggb2YgdGFicyBhbmQgc3BhY2VzLCBwbGVhc2Ug
dW5pZnkuDQoNCj4gKyAgYXJndW1lbnQ9IiQoYmFzZW5hbWUgIiQoaGVhZCAtbjEgJGNtZCB8IHNl
ZCAtZSAnc3wjIVsgXSp8fGcnICnigJ0p4oCdDQoNCg0KWyBdKiBzZWVtcyBvdmVybHksIGNvbXBs
ZXgsIG5vIG5lZWQgZm9yIHRoZSBicmFja2V0cy4gSeKAmWQgYW5jaG9yIHRvIHRoZSBiZWdpbm5p
bmcgb2YgdGhlIGxpbmUsIGFuZCByZW1vdmUgdGhlIGcgYXMgdGhlcmXigJlzIG9ubHkgb25lIGV4
cGVjdGVkLg0KDQpNaWdodCBhbHNvIGJlIHdpc2UgdG8gYXNzZXJ0IHRoYXQgeW91IGZvdW5kIHNv
bWV0aGluZyBoZXJlLCBzbyBydW5uaW5nIHRoaXMgb24gYW4gRUxGIGZhaWxzIHdpdGggYW4gb2J2
aW91cyBlcnJvci4NCg0KUm9zcw0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRo
aXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxz
byBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0
aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwg
b3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91
Lg0K

