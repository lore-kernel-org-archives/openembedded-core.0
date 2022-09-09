Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA27ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 17:01:17 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.86])
 by mx.groups.io with SMTP id smtpd.web10.281.1662742871359894201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 10:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=RJcadld+;
 spf=pass (domain: arm.com, ip: 40.107.2.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m6O1IgECxODH0DEva9tTyEmhWXyVFdXKU7Q1mk3GUjttNnXv7NCsZKPvb1aCZvhEFLC40gGbyp8SoLST64B+6y8olu2QK7B+DvNl5iyFQ/L2o8D02yGNuSYRQ/ZChIGbAmN0xFWgLq3IgZ4Q4nre7nAq5UGL8My0zB5Jba+TbdWTkR4T5MN3+oWvJ9AFQ2HU0EvMcLMHJmR+G3hDJPCTLsDsOO0MIIXAVFWdpF7JLTlbDG3NfhCEESwJ/9Vf+xNCeTDdDx9pFIh7ax3hs4FyIwEG8Z8Ydr/s8zzV0WyvRVdmjagRu7qLwPx2M4BWE5FE5ivfeqC6wFwmcpy0mLBjIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wHxLMKRji1M184507snfsm6S5C8tgali/5sYaig0NI=;
 b=KBZ+haFSnk0pVq2/PaIEpiDPLngRgg2NMHljKgIQXbQfoDlRHK5dLJ+uG2xofAi867aJCobbBYfXKCPSPfQPRnv5jvA4viU7LwdigwkINcOtxshbC3B8gDMfNYUzev+mqtJgJR88Mw/crcBhQq5XuYN4hrTzVg+qfWUNo7jSxA/V+zhrKVHww1cSIg18O7FEcZJz+GmB4xTe1Xv29vRORXQOD1Tq7hxVC6M48HHvxRRCYFwbjj+sG0YNMpqh5kRMj63tTUfBsaW4+quwr6/4BFpRlHm/rSDEz52nHJ4scc2qfMH1TIn+ql2VXt4QB3r9n3Lo849CrXuiEc1SumsgFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wHxLMKRji1M184507snfsm6S5C8tgali/5sYaig0NI=;
 b=RJcadld+v+bwntwfLn6mK4t+i+rUZeCy/PePyR1F5R0EO9za0WRx9cWXpCwZcCiV5hlHyh2wNqiTGOh3UvS4+t9M3choMJE6iNY2xLQT+bw049mgbxpDySgm+adEh5wFJzWItzXX8ahnq/mUThCAfpYseafECeJ9+Xon0aoVM5E=
Received: from DU2PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:3b::9) by
 GV2PR08MB9352.eurprd08.prod.outlook.com (2603:10a6:150:da::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Fri, 9 Sep 2022 17:01:07 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::97) by DU2PR04CA0004.outlook.office365.com
 (2603:10a6:10:3b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20 via Frontend
 Transport; Fri, 9 Sep 2022 17:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:01:07 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 09 Sep 2022 17:01:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34c5fd6f60528802
X-CR-MTA-TID: 64aa7808
Received: from 84921f7d74c2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DA4B82D-08AC-44FA-A31F-DA0C0ACC0D40.1;
	Fri, 09 Sep 2022 17:01:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 84921f7d74c2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Sep 2022 17:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZzL+PE4Ybn/nO+HJTRt2Y6FEAJCSZKFOVJmefE+GU6YlkvB28Qx6UlutWnj6866Epypvey5q8OW22euCj6LjleH72J48ZgveDNZkD/oApF9WFoD4ME2odRQNfC5EU6T318+nf+csCVc3wQN2mKZxKDZbqVLlil0FqZy9E/o5aLgfo0Sn9OG8N74C+twer2mj8kzcrqnme/bHia9+L6S13nHXSNv2wgHmX7U2Ox6zTUetNZwDgTFR9PMqDEID9Q8cbqqOvos7iz5O9lQAicPq+JZK6yGj7K+37ESAgZ9sFU3KV3UwKFN6T2MZMIvNAztItm1Hn/GYp/4YVmCqped5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wHxLMKRji1M184507snfsm6S5C8tgali/5sYaig0NI=;
 b=L8g1bxtsC/px1dj/Q0rFHT8bb0if3Lv4KU9GThmHoTOdiy4xHRWN3h3/40knp2mZ9FdDXWKRkvKNAV7PTRtULuXnTuz5um+VatnH6hYIIcEuAZHG9VIBZ+zrm5eycLcvR49Id70x+tKdYfEzj2Orh1uAp1t/61MiI51BKrxQKmUTjwJpQEDHDIPpQ0BIJ49rC5fhuIMAMCC59veNRezpA9oK/ZGGmYjSVGAVtEQie0q/wDshE+pxgvVNmqZy9+j7u70AxngZJGOqeAoUz5sT6xHVxIAO58PTcj70PCgJQMTifez47s4dadXStQvJs5aTP11NETee+IliA4xxf7g7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wHxLMKRji1M184507snfsm6S5C8tgali/5sYaig0NI=;
 b=RJcadld+v+bwntwfLn6mK4t+i+rUZeCy/PePyR1F5R0EO9za0WRx9cWXpCwZcCiV5hlHyh2wNqiTGOh3UvS4+t9M3choMJE6iNY2xLQT+bw049mgbxpDySgm+adEh5wFJzWItzXX8ahnq/mUThCAfpYseafECeJ9+Xon0aoVM5E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6363.eurprd08.prod.outlook.com (2603:10a6:10:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 17:00:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::117:9076:5aca:6d9f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::117:9076:5aca:6d9f%7]) with mapi id 15.20.5612.015; Fri, 9 Sep 2022
 17:00:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "schnitzeltony@gmail.com"
	<schnitzeltony@gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
Thread-Topic: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
Thread-Index: AQHYxGpi/8l/szoka0m7sKyMqN5jS63XUKmAgAAB94A=
Date: Fri, 9 Sep 2022 17:00:58 +0000
Message-ID: <8B8690ED-C7A3-4CC4-9D37-1BC5397DCA4C@arm.com>
References: <20220909163640.1985612-1-ross.burton@arm.com>
 <aec9d2b3-bb3a-cae0-ebab-d5b4f5481f96@gmail.com>
In-Reply-To: <aec9d2b3-bb3a-cae0-ebab-d5b4f5481f96@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6363:EE_|DBAEUR03FT006:EE_|GV2PR08MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: a484aafe-330e-4867-8d90-08da9284e340
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oyIPvQjpyErZ0AwQqt/J38HRp4r6tasY2aKnBOO37q9hZzFWYodoJWyfQLdBeFMXxrI5haTklZ0470x9nwCAZHRS8YJwjyPi9U4vUXzWNTMiVoBRa7QO9DQf0S1zBHtQBvjOLHFOF89FmUm0Rlpq8NNUCXk+IZHU7vQkvl/ozrKfCHjvKnagrG5qYLjijh7z1dMFViEL6w3/as6qqpoLJCZy95/Xpt0+ZpMQB2uSyXNaFyYRALzBNv/hsZWxAL1Av/+rNglVyDvTensMg1RjiFx2s6zsJIW1xYzYKzdh6Wazsom59pfZHFnZGIeyi8FEz6XJvWLZG0Lw0Liwxk6v8VHD0bLYVahBGyagpUySkVxv4Zpc4aS9jslYZsAZdGGAupMPN3lQkiQTKv+8wgTfhEaYf3ogemnoRrsRDdNhn9odXA7ddRU/NPQGiMMiuH1dW499nb466OLLujce/pXWmmAl4qqot0kmj2bXcRp1/ZPMEPZb8wbhzQulkH+QRUKm89hM7NCHz6ZmpJnck4GjA+ROTGaPkiDpRr0JENoy2YmwPDma0n5UIyTHs5OugXE4yUF86H8KG+fXEJWXp8l/imG2kObBb4cYLgqfyBazJYWTyjJp+FASEaz0SWnIvsuGdmiTT7wMW2lq77d03HB7rrrFs9oeoqrZKlL8q0+MqeOIHM6dNk4cyjBTfNQ6hAgtpqdd28MuujZng99b8z7KHqtN2XmQWcrmtG9lz9VO+jo+QblGrhNLZ6jYGvwJSt3kbFGiJta5WRH8KH7CsvMtVm8DD5GwwLYvQYJGYG+g6Lw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(478600001)(38070700005)(26005)(6512007)(6506007)(86362001)(6486002)(41300700001)(71200400001)(2616005)(186003)(38100700002)(122000001)(36756003)(33656002)(5660300002)(4326008)(76116006)(8676002)(66476007)(66556008)(64756008)(66446008)(91956017)(66946007)(8936002)(54906003)(6916009)(316002)(4744005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91E6BF66585C3946BCA648250F1CA253@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06e3fbed-b767-4b83-128a-08da9284de04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hA0gleonn2vBxah7Rbu0pZDyOKAhpbBu/pCrH6Sv7AFq02HcWe0MA1ceQ0TOl1vQJxy5bJsxmDS9TxxPm3jxpU7eL3Clx62e3/mQWRdKXKdfEg4WgN5LcDHcSnuFOPX6WEMnO8glLehim1miogjIZZz41jRy1mPqFNPoW2RdjY0201swMJE1CT9a+JDj2s/XJn9XJyygVTmcSOZr1lqslon9CaQIEDJ0XRf70D5vhBgXgWwBqgdgT5mGFcWrJ8p37pttaltzKUau2jz13XzVBJS8C+koVahMdn8h53BdbWoGkUah4yYik0o3/y7iKtjk33RFDsW5fXERuj3HlBcqTnfl8Tb9/D9YE7LXDzH927kso9dRaRS6OVT6Vq3D4fyHthkTzw85M36BM+/to8m2TxiKNvfCuHDpkGA2XrxqWRxzQ3MjVQ6Ur4cZF8M7qDCQ/4aMDD/edK7SqKeKY8bW39OsgEtfL+kdotY21Wzh7Clv3ZeYb6BKPGX2uwnZUvq4Ak/0t9XdO5/UUDtwmO1H/TyIZP3e4bhH+mpSKR5fxquCDh+KI79ajeWSsaGeQ4u+1+PtZS0ILlT42zfA3vw6Wzoj2IsuTzjn07zNM1SC2/B5bh6B1v1xweOjvFe67ddms3dpa6LqjqAdjiCmyOH6pnnF3YplG5puZ8aJm2JbYD/qjl//9UZPUiujtNIWOd5ZU9Khwm5colPCWYn9WvEOkfwHcdWmmykZ9AP2KTMGAlVMLMpCynP83lwvk1CVmCFuVsnqC43qOMXY1wPVF/PzWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(4744005)(8676002)(40480700001)(6512007)(6506007)(107886003)(40460700003)(33656002)(54906003)(316002)(6862004)(82310400005)(5660300002)(36756003)(8936002)(2906002)(4326008)(86362001)(478600001)(81166007)(70206006)(356005)(82740400003)(26005)(70586007)(36860700001)(2616005)(47076005)(6486002)(186003)(41300700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:01:07.2187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a484aafe-330e-4867-8d90-08da9284e340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9352
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 17:01:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170502

>>  -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfdir=
}/xml/catalog
>> +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=3D${XML_CATALO=
G_FILES:-${sysconfdir}/xml/catalog}'
>=20
> That ...:-${sysconfdir}/... looks odd. Is that hyphen intentional ?

Yes:

     ${parameter:-word}    Use Default Values.  If parameter is unset or nu=
ll, the expansion of word is substituted; otherwise, the value of
                           parameter is substituted.

Ross=

