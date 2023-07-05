Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5368EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:57:55 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web11.14161.1688554670327188615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4bPsVGJx;
 spf=pass (domain: arm.com, ip: 40.107.13.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw1dFyyxCYSoxYYSugjounNCl+X+hxu628qRscmurV4=;
 b=4bPsVGJxYrTF6jZU+S4xxmYq8lTnbyLwHd9hpZWEKZDppR50waKpjoo5ra/LtCFDvXHd32eMOhsV5L2n7LFxCzGzX7LA3v/qNF606Cywz8eviWrzgagaz/3QQvfEkPlPumF8aZwdFSjYjygAyibYrfH1GQoFkiX9VlyjiCaauLQ=
Received: from DB7PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:10:72::40)
 by GV1PR08MB9914.eurprd08.prod.outlook.com (2603:10a6:150:87::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 10:57:44 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::67) by DB7PR03CA0099.outlook.office365.com
 (2603:10a6:10:72::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 10:57:44 +0000
Received: ("Tessian outbound c63645f235c1:v142"); Wed, 05 Jul 2023 10:57:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c32a01558cd117a
X-CR-MTA-TID: 64aa7808
Received: from c90e22f0569c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2CB604D7-37FB-48E0-A5C7-9457E0BCC53C.1;
	Wed, 05 Jul 2023 10:57:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c90e22f0569c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jul 2023 10:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrGAD0kGZooFewKuNVg2OqqdL3S6PTlJR9aK5iZzZ9Y9oK1UxLtSaTWTwsMxOZ6qKo9J2oEMhl/Sjr7YFQgCdwELqbrP2CvBYSh13HglLlwxdQQTnyOrS7bOwQXfk927WPQTbCodPgENKuGKN/+lmM4WkQaEZNC0f9pT+Qro4Ni7OigVrG8PnaV7l5c+jgxVMEo79oLDTs6jGRSnYFmkVzJoXNzCCrLnGZQ+QHSIIbAww3bKUAa4ZuY4N21H2orknOvqmLgZ6pmu0OZi4o6a33IwrlV0PhPN4sVhZhSz16NvmILB2yI8SVkd+lqpScCXNfTqlSgBkczGau184yb7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw1dFyyxCYSoxYYSugjounNCl+X+hxu628qRscmurV4=;
 b=ncBJxbZFyiII+bIIyrZ2PRnFuUrybISqBYmxBfYgvfr6CqJIgCCAQYgv13BTcEdODnLvA7syB/4fcvIEw0ujhpGMoV/8cmITBFl85BFQLnBHvbGQ6sl8KS1PhfinRiX5/NbsofHF1xyild31YPpi9sbi3fdja5pLcueh/Khn+X5Vs+zXIwEt2J7ORSZczzYc6REd751Q9NvE0si9mHfTYS1m8/Pfp9FlTT3K8RGveKu62MDhz+9k+YQ6mvE+ebK7PGY5iitwaYO6FaCio5Phwpfc5+2ghr1ccyTGKP0Bz0YxmvdyA6kZCMsXmIfIfVWGoU7kJ1VFJksBNxxI5MjgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw1dFyyxCYSoxYYSugjounNCl+X+hxu628qRscmurV4=;
 b=4bPsVGJxYrTF6jZU+S4xxmYq8lTnbyLwHd9hpZWEKZDppR50waKpjoo5ra/LtCFDvXHd32eMOhsV5L2n7LFxCzGzX7LA3v/qNF606Cywz8eviWrzgagaz/3QQvfEkPlPumF8aZwdFSjYjygAyibYrfH1GQoFkiX9VlyjiCaauLQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8790.eurprd08.prod.outlook.com (2603:10a6:102:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 10:57:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:57:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/cases/rpm: fix unqualified
 assertTrue() call
Thread-Topic: [OE-core] [PATCH] oeqa/runtime/cases/rpm: fix unqualified
 assertTrue() call
Thread-Index: AQHZry6OyeFkNMS77Uqf3/rUOUWq8K+rAJgA
Date: Wed, 5 Jul 2023 10:57:35 +0000
Message-ID: <9A51174D-AABE-4F49-82FF-82D14937E7BF@arm.com>
References: <20230705105030.3698799-1-ross.burton@arm.com>
In-Reply-To: <20230705105030.3698799-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8790:EE_|DBAEUR03FT051:EE_|GV1PR08MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: 1603b54c-cd7b-48e0-14e8-08db7d46a92e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 53+d+xfP/VdowJKxJhGYNtWPdyatlcJkFxKrjRUxn7eyKQd3Fu/QrVUwIPFvFgRuJzCkCmUqRqA1Awirvv62M+aBkRQLiRY7NPyQ3V2oOB0S41uLh9HAKhevZEwuFV2pmnikThLKi62pltaHHRvIf7WiwjdufK0AAFzMrGyY+YmuidVVqi2nZfmQTdntc0pSEAS4U+sOd/iIO4JXQa8B0QF3EbbwcooSbOQCxjEqk4bBPk/89UdMgG7AOt//TZZEdCDHgPCv0YV3EmrwX2v7MjFXbIDfOp1PueHX4t4ahiPoU3C47nho7SpUZq8iPe5WVHJCABvagiyQqPPTcL4vw7L9knpkLlvxDISmPMDDcztUk/J9V7uAOC3EyH5QSO+B4LZPLRG/5qhPV45KSdfmkKa0P//lzRVTnldeYoTrUZjWyvEIlKUOgVJ8dEeeD+V0eXAp/wY9EaiZ3lFQm8eeOYtas61Ewfzb3QiDCZikmytoumi8ZuitkAHlK4zvOT4SPHARCsVfqDQDl/YHsDCXnJ7V907IO3j6N5P/gtKaYQdhMb02BqANgQiHia2u3m+YoHJQ8AwNA9sN3QgqGDQ6vc+QQGFy7DAuthVaOub6LVwOh4XJ5/I9REr2POxGXGg8XQHDc5yepPEUXeiVebvNpF8ycWnYcNeEfVHhGZyaaDN8xYWYyxvu7X1T4yftc12W
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(26005)(478600001)(6506007)(966005)(6512007)(71200400001)(86362001)(2616005)(186003)(53546011)(66556008)(38100700002)(54906003)(66476007)(64756008)(4326008)(66946007)(66446008)(37006003)(83380400001)(91956017)(76116006)(6486002)(122000001)(316002)(6862004)(8676002)(8936002)(66899021)(38070700005)(41300700001)(2906002)(5660300002)(6200100001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82F104C86F45BE4B811FA221207DD0BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8790
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b2c3540-68c8-404b-99ec-08db7d46a3c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TuMCnzFUx2XF9eZBbLkAKu2OyyPVY27W1r249XzAfJmKFtI3x+x2XuH4Gi4WcmV9hALmH8HcDR60w7AYc3Ad+Q92e9Y6LqrwTKp1bN7hSVS49zapbSjm2xSsTdmLw7Kch+DklTDY7kk66zFndP3R2/m+0P+tOq/P5TWJ/nLcQZlp06Q06+EOqiGu4Y+vq8ORxatgC0KuarDK6t2/gmegiM8qYxKodd0xcOCkhac5K0TsAC0E+2lAaUIDJOYHaR0CWimhLwoPGmWm70dwoVoy5FSFnwaBZ+T/0s+qb6jYUbi0hJKWzfx+31AmAvkS3rV9mn212JpzBvnQlXww8IJz8G3EAjdrdyipK0oRRD82b2bMwggEqUS93KWBIUG/1uRIm5s7tEb4tmybNwwXOY1oFsjy6b+frM9Zip5jgGuk0E0TFz6rMr/Ww6eVaNEm0i8/JnrJefsAs7LexJnEiDcB6GwBGnCDmIyDyADjMKUUioxETxJxLYq+7TDm+Fxcf+vp9yFMP7gSg7naN1k9rSh0hyjo1Ap9B/eJCQx+HiF21IOhGRY2JbXzCO+qmcw6Zbqy39Nh1DQw31somLqznQp/DAP9VuUmMIbuiRmw1d8zhapR4tCFycFF9sUJNagzDgJNVQf7hMd0jyAXBZ9afHeEXE2J7EIgE7gvsVTDXu5ETj/KcSbLASXbMYMk1tFIICXgWnZqDNHYqbxug3myC+c94j9drGDMsbDdN9XrLpZj6jWBKBf0E1NK3EDlnURDG4LFJlynW8mrE6ymhb/Fi94FOQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(316002)(33656002)(66899021)(26005)(186003)(40460700003)(53546011)(6506007)(41300700001)(54906003)(37006003)(82740400003)(81166007)(478600001)(40480700001)(4326008)(70586007)(82310400005)(356005)(6512007)(966005)(6486002)(36756003)(2616005)(336012)(2906002)(47076005)(70206006)(86362001)(83380400001)(6200100001)(36860700001)(6862004)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:57:44.2609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1603b54c-cd7b-48e0-14e8-08db7d46a92e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183885

Ignore this, more problems with the same code block.

Ross

> On 5 Jul 2023, at 11:50, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> assertTrue() is a member of self, not a global.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/lib/oeqa/runtime/cases/rpm.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/c=
ases/rpm.py
> index fa86eb05373..7ab71851b44 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -60,7 +60,7 @@ class RpmBasicTest(OERuntimeTestCase):
>                 time.sleep(1)
>             user_pss =3D [ps for ps in output.split("\n") if u + ' ' in p=
s]
>             msg =3D "There're %s 's process(es) still running: %s".format=
(u, "\n".join(user_pss))
> -            assertTrue(True, msg=3Dmsg)
> +            self.assertTrue(True, msg=3Dmsg)
>=20
>         def unset_up_test_user(u):
>             # ensure no test1 process in running
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183884): https://lists.openembedded.org/g/openembedde=
d-core/message/183884
> Mute This Topic: https://lists.openembedded.org/mt/99962465/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


