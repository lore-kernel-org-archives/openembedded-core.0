Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74BFC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:56:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web11.51056.1699268168741451398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d62e2exD;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d62e2exD;
 spf=pass (domain: arm.com, ip: 40.107.8.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=btgCGDwxDLrHzI0yvRqP285AaIeSpJlzahhlVo9mjShW+vXSelDZF6K2v23K5TtHN+tGffGgRh9y0+oCcLbHFXtoOJtwxCmDC1NrhNE90RD9hc3uMo/9WHZTFZ4gkmM/yZB4jo8Z8pHtTBEG5Zy+4tRKaysB3KMcMx7n0w+B6zFYRik78gl7TugWitqM3DkpTNWWAPu/So4EXnNEMTGu+KBAYPvvZ7oWhNWm9nkmfhicoS65LHlX+yZeYsP5Bac+bNCd0tJnCEq8XBDAm01CqV8wkDsbudJpvX1MCvwg+lpTmmISuW23LQMrGx6qgXT4B0BnwhOySfXfhUY1GmJHbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ryLVk/G1AxhknqKqqWPjPNxGNutMi9ZM+IDitZy7Zk=;
 b=NYlPHdkKR6QoCAqXMGI0KNBM4EPWNZXOzf2doNyhyS+25FT6gIMhI6uZsuXWdSkh7sNL3z5VlEVUARy+UNOUp8iU4dmJU++S+RSOUwlmORxbjio2umlcqz3gc6dWJ5gmlOjqXfo+KexLc2vyA8Lgo1wCA8OXS0gZ94CVNv5+lf6iE57MvdrjxSRJzd+tkIRktz/ouUA8IYgnhrBndDi1M0WZCsYawsbTtdDGsT4iyV6haMZPFrKLl5C9DsHptc8wPfFENf1iviICCWIG44DS/8tI7uMy9WgQF4NXsf29lbLYn0TMaqxYe4wjmD3tI8pFS/0YKkVHk+RuyTr/CzZIMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ryLVk/G1AxhknqKqqWPjPNxGNutMi9ZM+IDitZy7Zk=;
 b=d62e2exDg2DCNlmavMX7DLir9pL38RrUGpaucz9es7QMVdFSoUZqk/kaD1HzpZatDh2hSJBHwEEK8h6jXiQQhiZWcB0VkOeF9knNl6YNj3XMr1nxtEiv0aH0q6UxPMrwr6NGl2a6eG69NxFlCYk7L8Y9hY70IDQ98uZSKRDBKS4=
Received: from AS9PR05CA0185.eurprd05.prod.outlook.com (2603:10a6:20b:495::7)
 by AS2PR08MB8949.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 10:56:03 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:495:cafe::9f) by AS9PR05CA0185.outlook.office365.com
 (2603:10a6:20b:495::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27 via Frontend
 Transport; Mon, 6 Nov 2023 10:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 10:56:03 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Mon, 06 Nov 2023 10:56:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e110cae1c47d39f7
X-CR-MTA-TID: 64aa7808
Received: from c710b270da51.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B3ED90BE-3CDD-41BC-925C-9DFE9C32D3C9.1;
	Mon, 06 Nov 2023 10:55:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c710b270da51.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Nov 2023 10:55:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK2xzWYCeCwxQCNvNTm0ZlCY6lAUlZr+BqbTPv7z8HM1FpgdYhrQLNic7F0sO5paf0+63LKxGnEVZiDJ46wxdTxEXomzB87+q4dydOYHFGHbi8ULahDFiXbt93yTQZzqtk5uc8hRE8SyIt1AupX/Gfb6WpScaRIVK/yRqK6BuzQ+Pet7EnveAq+qkp9PnXA3s50JNBrscyjFUX006cisy29HzDx6GoYsZEXwMMyAxVd3W42pI78DhWNDNJpvKB3iForC4cCNuVnv1SeTLbfXer86iUgQ08cPbc9FiQvNXL5loEcwutlSbAPULOV9UaAajgn+crVTRIz1mTGUiHMAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ryLVk/G1AxhknqKqqWPjPNxGNutMi9ZM+IDitZy7Zk=;
 b=US8bld28tM4eR07OZ33M1hUH1FGY9Y3CCTbIBs1o8Jdtpxqs3qUOzCHUIGeiOEWbjhtuSHRb3z0+rob/BIUdJcIjIU6JhddIeyt1SVpuHjcsNEZNv8s0nXGdlbxlSyLLMKtFBMCKVJ5sx6z+ibd3QWdi7EYtyczZk8YbQbyueBkDSnLxNnrjdQyzpiyXDC4q9+AJNGn5HCaiybjxSiSYqxOEY/LrB1c/WttwxKeCbcB3VDAFrJMP3bslF1nWRP3WR72haZ6MQ9zcpqJ63Bn/HDPAwkwMtTO3Tr5vLVX9mUxTSgDXWbJUKgBAsBVuikvKc3Rhy3WcBDrjfbUJJCHKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ryLVk/G1AxhknqKqqWPjPNxGNutMi9ZM+IDitZy7Zk=;
 b=d62e2exDg2DCNlmavMX7DLir9pL38RrUGpaucz9es7QMVdFSoUZqk/kaD1HzpZatDh2hSJBHwEEK8h6jXiQQhiZWcB0VkOeF9knNl6YNj3XMr1nxtEiv0aH0q6UxPMrwr6NGl2a6eG69NxFlCYk7L8Y9hY70IDQ98uZSKRDBKS4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5328.eurprd08.prod.outlook.com (2603:10a6:803:13a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 10:55:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 10:55:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][master] poky-tiny: fix PACKAGE_EXCLUDE
Thread-Topic: [OE-core] [PATCH][master] poky-tiny: fix PACKAGE_EXCLUDE
Thread-Index: AQHaEJz7Z8y5K6TxOEyvzIUTYo0qOrBtG1eAgAADAQA=
Date: Mon, 6 Nov 2023 10:55:52 +0000
Message-ID: <5A07D8A2-2FE1-4FD1-9468-0AF32FB335C9@arm.com>
References: <20231106103516.361162-1-ross.burton@arm.com>
 <f772002b508b7a29fec7957f072a33dee36bf627.camel@linuxfoundation.org>
In-Reply-To: 
 <f772002b508b7a29fec7957f072a33dee36bf627.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5328:EE_|AMS1EPF00000045:EE_|AS2PR08MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 02043ad5-d8b5-4884-d845-08dbdeb6f87e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6QNiFEoZaVUWtWVPN3fYvjN+wgnDD2dafIKv0cUJ66H6SpM93wZMQKMxpXD8zMPnnhKd2YXppPc2aoNN5pR3UQ2fp2102bo99twpkMrFhVR7Jjne/9/Cc57i9i0fXpQbFIp6TdJ1Y3segQ1X9dqRrQtUhigjr/IWOFwVsR2BXM3l1mH+CcNEyEgvautOPJWdqdHlv4PEyWKRtpCXIvn0t4p8FvZoqqhBhgwGHzF0d9sYMJDnps0HPqUGBBzlaHz5RVWJB7Wj4t6+54Bk3Iu/o7Jxp6qI6AVEzTLrsLqOGgw1SO5oE0PTaqpQ2WbXv6VRiV22FomROrE5Cb3FK1eaGuISL944ws9hWvpyRrJx1ZUZUJchHD0X7J7Pk2yNb4kwMymet1URNH0N/qo/hMgRMFeoqzAfSCaFVMpWAfGJIVe9SxPhjBmKQXBm6ujjX6RlVpGQNqKnEDzdlfDJ6wBxFTrW7WKyGMtAx8foFsnkTNm9/vWlo96vFWqspp0z9SXSOP35YDwNrMsYGXscKaGuMjldmE9/+a2npSOkUAaJn1G5hIFvjsnYB5pLTOrxHH1nefrbIsjUZSrw7W5Mw8F2rGKQqhpufv66U+Y0DkeBbp4n1D/nts1YR8QTqld3tNXMaLItHqxUbV89knx5oEgfbw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(41300700001)(6512007)(6506007)(53546011)(2616005)(6486002)(71200400001)(83380400001)(8676002)(8936002)(4326008)(76116006)(2906002)(4744005)(5660300002)(66946007)(26005)(316002)(91956017)(6916009)(64756008)(66476007)(66556008)(66446008)(38100700002)(122000001)(86362001)(36756003)(38070700009)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B75687F52A2F0F4EB5BD83D8A8A4B04C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb57f4ab-2b1f-4e1a-a246-08dbdeb6f1e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VLM8UBP+LTFfjAlwaYQOLRlZV0zq2zlpPtlelGSpkQHufeEtXYCWwsYo8QdgSsTKqPJENz+MO7FM6DiypgWIdph7SotbVheGCM4G5YcFX/BOxSq57QF0Apw6Cw2g7R9izDbQbCjfqJT76XG6M3GM6FZdxHBWXJ9LsZWXe7vN9GhdtZVacg49D5O2FOmOHlEhvmq33WpCUPCFbTz2wfuk9L+kU2cuxNuhw/0bCx37tIHdicjvnRUVMC9frVvozjYYMR71/CXavE6qfk2vqtWPZd5WpMohO8t4R+M9NhI5Yn9zu9bhSbifWoyLA78NbHmUDKTPp4RJD/HSm+Imliy9ilYDQLFZ2jnVToivVAZy5fXy/BGPSlOT9iutWzLQzlcr9JJPsb6jSale5Y+Yyw58g4990M/4GA8lHWTEZhBmxpjlTZhF1IRm0KSBLAV/UuSFEFGUzw1OapR4pR2r6zqZu3atGyBowlCj83KtNUNar7lbX5MiXAIerau6AXQhpvW6z0E5DuYORwqlhJUEmgV29jG12GJjc1nPsM1xNkOeVuPcccTmnDzvLD37f/r+VQw45IoX1wlW4Ly1Qaje8WyGwc0bp8z3T6KrbXAQ3BV6c/rlR6HzEY3jNzfR8IlCZgrOCt7c8DEWZugbwFL7WOfdbjk37pR7NCxcc4Q4IBJZ1jv9WLFtrtt/hgUFqIr1VvR8RQsR1EfS0uSo6m6FCj61WZUIeOjd1P8wl2E9GRQeLfOl6Mg2yVxMA7AjxUi87MHp
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(4326008)(8676002)(8936002)(6862004)(41300700001)(36756003)(40480700001)(2906002)(36860700001)(5660300002)(6486002)(53546011)(6512007)(47076005)(356005)(33656002)(316002)(86362001)(4744005)(81166007)(70206006)(70586007)(83380400001)(336012)(40460700003)(26005)(82740400003)(2616005)(6506007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 10:56:03.6752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02043ad5-d8b5-4884-d845-08dbdeb6f87e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 10:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190202

T24gNiBOb3YgMjAyMywgYXQgMTA6NDQsIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMS0wNiBhdCAx
MDozNSArMDAwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4NCj4+IA0KPj4gcG9reS10aW55IGRvZXMgYSBQQUNLQUdFX0VYQ0xV
REUgb24gc2hhZG93LWJhc2UgYXMgdGhlIGtlcm5lbCBkb2Vzbid0DQo+PiBzdXBwb3J0IG11bHRp
cGxlIHVzZXJzLiAgSG93ZXZlciBpdCBkb2VzIHRoaXMgYnkgYXNzaWduaW5nIHRvIGFuDQo+PiBv
dmVycmlkZSwgd2hpY2ggbWFrZXMgaXQgaW1wb3NzaWJsZSBmb3IgaW1hZ2VzIG9yIG1hY2hpbmVz
IHRvIGV4dGVuZA0KPj4gUEFDS0FHRV9JTkNMVURFIHdpdGggdGhlaXIgb3duIGV4Y2x1c2lvbnMu
DQo+IA0KPiBQQUNLQUdFX0lOQ0xVREU/DQoNCk1vcmUgY29mZmVlIG5lZWRlZC4gVjIgaW5jb21p
bmcuDQoNCj4+ICMgSWYgc2hhZG93LWJhc2UgaXMgYnJvdWdodCBpbnRvIHRoZSBpbWFnZSwgbG9n
aW5zIHdpbGwgZmFpbCBiZWNhdXNlIGl0DQo+PiAjIGRvZXNuJ3QgaGF2ZSB0aGUgaGV1cmlzdGlj
cyB0byB3b3JrIHdoZW4gQ09ORklHX01VTFRJVVNFUiBpcyB1bnNldC4NCj4+IC1QQUNLQUdFX0VY
Q0xVREU6cG9reS10aW55ID0gInNoYWRvdy1iYXNlIg0KPj4gK1BBQ0tBR0VfRVhDTFVERSArPSAi
c2hhZG93LWJhc2UiDQo+IA0KPiBEb2VzIHlvY3RvLWNoZWNrLWxheWVyIHN0aWxsIHBhc3M/DQoN
ClRoaXMgaXMgaW4gdGhlIGRpc3RybyBjb25maWd1cmF0aW9uIHNvIGl0IHN0aWxsIGRvZXMgbm90
aGluZyB3aGVuIG5vdCBpbmNsdWRlZCwgYnV0Og0KDQpJTkZPOiBtZXRhLXBva3kg4oCmIFBBU1MN
Cg0KUm9zcw==

