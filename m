Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D465C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 11:29:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web09.4648.1665055754037704653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=WpxHyLor;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f7oyJpa1YXEjZJmeGHu/8FzHs9beff5ZNmwQwMtE4ItAIdK20vmgfExqbclMk8RsQjaTPz/kdKGUn515wF6qSq2WUOcBZIOnpNGJAaTizBdycwh/CoF3wEDlrhKos1zBYG2Qj7Gv7jzlnFHsoxnqvo/QwPkICIRH7/M8lxsjjnhxQitWIoDFCTt5IgoG7fN3NFrex3+zYFGFZtEd1IE0/xCEgCCbsCQXZLbb4ZDP2iNQI9j3hlqqm9sBDaOtJN+jbKCh0Y1qRG7R2guF5gqWIJa/FJuOCJHLytwSS2OpRLtEPVc+xrvap71Q8coFXu0cxZZ660TNrgakHvGFHh8VCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH4lqzO7x0gtmTMhM9uC17Pcbus8cW8GDsmw/qIhp48=;
 b=L4V1MQ2OlXhamiON822lMRXOSG/sxbGJUJXzbM4Eit8AT56G3dJmcUSDj6poCDPaQDkDRL9mjpye99h93HcfqLzpeSyUzem6oCSs6Vl6azafdZ5fNsEEy9PDFOE897PGOFHcPILjtsVGXgESzTyRGmP5RoXpdACxQuJeIYTKuUNt0Ra7/IPTBdYS35O7bVUaw26tPPLm+cux7dFQPD6NX3cqgQNXu+jKeDRcljPbogj1/oPN+0iVAN38H0a2uzhUzEQHotq6Wl9umYCcGrzOER7vLVBJ5p2BDVi0yCEaT4lbwt10h2ZpxNk2YJA0cOeeF4gsVuJFft+vr49DPFMoig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH4lqzO7x0gtmTMhM9uC17Pcbus8cW8GDsmw/qIhp48=;
 b=WpxHyLorr0/UvK82jWPyPcuCOHIqJ84v4tKbQLdzd5HIdbJhl9WWfnYEdZ41Z+8zkILoQyVR8RKUqFroRdrYODlR7g8ia3LNh1GvbCH4Y9tI5WPFyaeBGqidcv++ozdH1bwezU7YNZX7VVfsvFjdzbr1eSxWymhjxB73VaLg9VE=
Received: from AS9PR06CA0481.eurprd06.prod.outlook.com (2603:10a6:20b:49b::6)
 by PAWPR08MB9589.eurprd08.prod.outlook.com (2603:10a6:102:2e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 11:29:09 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::ff) by AS9PR06CA0481.outlook.office365.com
 (2603:10a6:20b:49b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Thu, 6 Oct 2022 11:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 11:29:09 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 06 Oct 2022 11:29:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6734ec560af16028
X-CR-MTA-TID: 64aa7808
Received: from 05b7cdbef05d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C555730F-0BBF-4177-B202-F828AAE76AAC.1;
	Thu, 06 Oct 2022 11:28:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 05b7cdbef05d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 11:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak52Z7KUHmwZuKq2uguDr5Z/lm6mCPca6AVXP/xOQDUhRIZ9dbGgoGimDubXDXtYhKpirH55Q5/Fzl8AAx4i2fNl0UIEJE/7OKCjxbfpqz/36iv6XUWeJdLij2zCRiKfykonwTurXW4g0viQ/gHc24XNB5ImyI48K2RbxVopGGxKmw1NNzLMM1d+NadPSqdgR3USnejpg5C+EhfbrZ+ZQqWG6Ng6qpRxT5/eXHRtmRujLpQIZA2LOTITYi5u0OuqP2pNPER9bVL0EbxAZS/b5lwaxJL9R+b5h0VlBVKhN6atHMCpsEHoscNOmR4X49UMOKDJcb4zo4hyasALweOVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH4lqzO7x0gtmTMhM9uC17Pcbus8cW8GDsmw/qIhp48=;
 b=Xva5gHKCcPGmwq//gVwRNuLYAxlBMNSe/LJT/JVYpcfR8P7+J7jqKos04dwEIcQcxz8JgQfbBpNgXlLa5CD8QOdgHDKq/t6hPAc04SpyDZ6jAxi7DlOSs4MQl1OJrRNaF5JdpqmQO8LxFNM/+m6pTY2ypWdFb+b7EBtvrCq4hPkq6IYkoV5RZU1ud+sw/tlzKapOVDs80lbOJHTOwk6wvNN45jO/mg5BbsjnC+w25pzSic4ZX+FzMWVk7CNKXQl5cMG3WyYG5B4RzCY4EAi3WPbNF1ipJMbhl1lWamuDr463gSGwnmorO27lqGuUyyRiobx3SAXUO8etiyIWLyLrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH4lqzO7x0gtmTMhM9uC17Pcbus8cW8GDsmw/qIhp48=;
 b=WpxHyLorr0/UvK82jWPyPcuCOHIqJ84v4tKbQLdzd5HIdbJhl9WWfnYEdZ41Z+8zkILoQyVR8RKUqFroRdrYODlR7g8ia3LNh1GvbCH4Y9tI5WPFyaeBGqidcv++ozdH1bwezU7YNZX7VVfsvFjdzbr1eSxWymhjxB73VaLg9VE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7641.eurprd08.prod.outlook.com (2603:10a6:102:273::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Thu, 6 Oct
 2022 11:28:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 11:28:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Topic: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Index: AQHY2Ba76E7uCV3y9kqHlmZC1skQl64BPXeA
Date: Thu, 6 Oct 2022 11:28:58 +0000
Message-ID: <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7641:EE_|AM7EUR03FT022:EE_|PAWPR08MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0590be-f3aa-44c3-4e88-08daa78dfcb0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IzJxrIyvP+WAc3V47rKA/MP+miDq47RpaVU8TEamP+cYW4vLmxCZETuXAjxrJaZlySFVY6dei/Anw2xqGuH1JgM3Sue9xVfmvgH9prMulrVAaOVOzfwmlTi2kOhd5PPJxEg4asK8E4CNeVM7uHgdxcI5RX1TwrLV/Y/1I7bnahxsuO4Uv1KDJs8Wzhl2+uNz+JdyGLcNMSJgim6lYf/7IAcKX5PDmqN6ucGY4LDK2GD/ycfU5XA92uPQxgkHQfzML6gx8ZceI7bB6o+t7yPuUDiyhgnDabZS6tOsBz1QJKyootqVJ6f906Nn1ElgSeNSR831wdQ4B3tW1R4XUfzUEtEYGUCCsoTZvrhdideMLphCdZfA/kLCVP9FplQ6RaVOV0Om5ktg0lZKfiWamtKOpIkJUEbwAt0dyZMtqHeof+h9f+d8TK/DzreUgK/4nO8DMcr5KP+GzPJlfXSUTK3NaO2OAot7Jx0ARtg8OMaBozbZX0z3/PgNKDb0PjFbsRjWRk+YTeI18iNj+5k+vVuheglR9JcPA1NHvv/9QtJjySIs+ihNYqE0d7qHyQG1z7wFxHENFcgWi2IjPMqj0LfmAt+Huj8J0yfKz8lyCcF49QDE0y6lW43Y+JpBUecsDsg0SqaHQasA36BZPQwTg951okZCK0S+nedMM8y7j6RSSmM0zubyrIM18ldyhzC4ngx1Xo0rJaJ7FeUWAvJniw+Q4QDJoZd1h8PL6viyf0yFLzRaMldDxGdYbPgtjhItS4BXLh1QV6Ulw63I3EL+z2jGgmfGvWJw8jWO/eIEyZ8I6oE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199015)(4744005)(5660300002)(8936002)(41300700001)(2906002)(66946007)(122000001)(66446008)(64756008)(66556008)(66476007)(53546011)(38070700005)(6506007)(478600001)(36756003)(76116006)(4326008)(33656002)(91956017)(8676002)(6512007)(26005)(38100700002)(6916009)(186003)(86362001)(6486002)(2616005)(71200400001)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86C7A5E258C9884FA629CA1CFBA5F065@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7641
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51e9653e-1696-496a-495e-08daa78df5c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6R/7dUUuLWCVsCehmo6ypAAzacWyxNn9LyM41o7aYxf56rCK3D0hFElRr5YUTsU7W/DqaTdVxtUGSDPGUWaVUp7I0SrOpEyVtwiEnSSR2bsyphK09g51Cjf4fU2o5Y1xaFiYsEFuU6BB6WEMeiVvNQZ+LkxNEaaqr+vD9egN+dvnc3wSh1+pc/VZs+nGnjyQNfBbq/WwMv6Tf/BuGfpstlFWr8bkXMGCjN/kzqtve2VjJ0weJWWa7CxnN0fqAmGLgk7Ac48t9uFM2WNw8gG38O6746CD31XyxZDygcbkVbRfcZQlmwFfOuCqT8D+JUzkPzF1uc9IpkMZQDT5gtd8GriMq46YG5M9IF4gCdsfDhVEl6ueIFqIRfYKQE2fjsPRH3N+TRq8CenT2p4rO9DdDQKYAZykHpiwJgSmpnSx3WMa+lvHvKV3bnZ/VFAazlYNELDAwY989lzfopd5s3oNT0507ZSoDiq6b600+HbYaQ3j9D5a6swGOdCfdkWICrCQQJ3rJ/dyLKdgBtCqavAylA2+5xHxh/SgmLiUH+sqnNLSaDTs8eJvj6xkiP7+zB4iNGCzyOSL4ToMNoCZq77kMJ/ONA4QGSqTIVBwMAXg3Oc87WA04uOB95uXi9OLcCpyWkfeib3pmdt/s0i6/Dzj+0N8KY7I7oXLs1X2xASQQ+JpILJG52Rk8o870htpr2Ak5bE/3hlc02JP9eGDBxvgif9UVZ4aVHNN7OmWhRl+YnhNFv5nVS5Fe+Fu3gIKGeSHDjuaDwokfyneW1KVl6a3iQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(316002)(36756003)(2616005)(2906002)(33656002)(186003)(356005)(40480700001)(82310400005)(70586007)(70206006)(41300700001)(478600001)(6486002)(4326008)(81166007)(8676002)(40460700003)(54906003)(82740400003)(6506007)(53546011)(6512007)(5660300002)(26005)(4744005)(86362001)(6862004)(336012)(36860700001)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 11:29:09.7361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce0590be-f3aa-44c3-4e88-08daa78dfcb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9589
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 11:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171496

T24gNCBPY3QgMjAyMiwgYXQgMTg6MjcsIEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxicnVjZS5hc2hmaWVsZD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC1pbmhlcml0ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklH
JywgJ3NjcmlwdGluZycsICdweXRob24zdGFyZ2V0Y29uZmlnJywgJycsIGQpfQ0KPiAraW5oZXJp
dCAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdzY3JpcHRpbmcnLCAncHl0
aG9uM3RhcmdldGNvbmZpZyBzZXR1cHRvb2xzMycsICcnLCBkKX0NCg0KRm9yIHJlYXNvbnMsIHNl
dHVwdG9vbHMzLWJhc2UgZG9lcyB0aGlzOg0KDQpSREVQRU5EUzoke1BOfTphcHBlbmQ6Y2xhc3Mt
dGFyZ2V0ID0gIiAke1BZVEhPTl9QTn0tY29yZeKAnQ0KDQpTbyBidWlsZGhpc3RvcnktZGlmZiBz
YXlzOg0KDQpwYWNrYWdlcy9xZW11YXJtNjQtcG9reS1saW51eC9wZXJmL3BlcmY6IFJERVBFTkRT
OiBhZGRlZCAicHl0aG9uMy1jb3Jl4oCdDQoNCknigJltIGd1ZXNzaW5nIHRoYXQgaXNu4oCZdCB3
aGF0IHlvdSBtZWFudC4NCg0KTWlnaHQgYmUgZWFzaWVyIHRvIDpyZW1vdmUgdGhhdCBSREVQRU5E
UyB0aGFuIGZhZmYgYXJvdW5kIHJlY3JlYXRpbmcgdGhlIHJpZ2h0IGRlcGVuZGVuY2llcy4NCg0K
Um9zcw==

