Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92A2C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 10:07:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.99])
 by mx.groups.io with SMTP id smtpd.web11.8584.1715162846455318126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 03:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=lbSjTFtL;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=SURlhTD7;
 spf=pass (domain: topic.nl, ip: 40.107.22.99, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=j6XeRsbL9mpCdpdCBiwfGCpYxDw7Vd4g6oRcz4B8lG95ISmM8BqQRLQ07CcZeIKYaZ52g9FDBSwcxoD+h5cf5P2Zadr5vphkkoSwFHNPr16RHjXNWqYurH99DLiziLDQ/TaUtzcBIFCWvX638RyYTMEWb7rLAwcdo2mQMslAT6jKRS1zzZK86lmjjxFg7GASCORKD/1aWzcNYegdhzC0JV5Od2XrkUhMyS8/EOmqoIjhF16c7/jqybUHNS7BEB2lXAstMQ7MPLH25Gen0mJbMrfARdYS9wH+FbCdOTdm+A60uSFmkD1Bc8KySj1cin63Lsx47BwoNQ3kNqZ0flWXtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gJiApurgckcHyzKF2DOMMHxy9Neiedfx/QV815ayKw=;
 b=I6Paf4CCx8W3kCyTgsEeAMcKyAMXvhBKw3PsCKdr/RftW1fKqxRRCdetnOiS41O2SYhJrkYE0kQ/ktvVy06LNQ9XEUxmKiafmN8T1+9smBXG2/cG0n6MRT5iZHv5Ba3azV83RDomwGKObMmOXgPXI02TSpm3lAZ0IAKE4G9dtudSQ+KeDAK3I9dWcxW2yY1DBmH7Dc95NfOSs3ywx1tZ3hxHHcF4rATgbhJS5qH8f+dW48nXc0pYwIGZyeggt4Lli01Vcb6G8pli4fgp5zMzw+J3+my+5maNtJrfxBGpM6PVG5sGhiB0QEkmLUzEl/5vAwsMT7rrRBkuC1gbRgBeag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.69.19.60) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gJiApurgckcHyzKF2DOMMHxy9Neiedfx/QV815ayKw=;
 b=lbSjTFtLM/vKA0QEKAS4ZVdAgViysDOgmK9O8kkQDvlpLhwl4OxiXZd+nEXQGCl4qyBWjeXmbuANl2PpiaITcM79E5bhYMRyJWeukuT2KThY9YMA644u71gKpFyJRNI+QlXvEZgz8QsF03ZlPKJLor2Uok3v4Tvg+qkNMIOT1uxImDHjKARppB6HmxEGuJZ4orh2IkmYZghDe7TxFMBJ28JZnvDpDV8L/Tn6W5Obv2PT92A1jVv9JskIKNL0ea0ZM1s0fiUKW7Rotp//0HZtO/RQu55ycG0ukmm/Le9tmhWiIKP2gSWqytXQI5qDKbxwy4QYUb3LfZH4SGhDQxG/Jg==
Received: from AS4P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::11)
 by PA1PR04MB10400.eurprd04.prod.outlook.com (2603:10a6:102:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 10:07:23 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::8e) by AS4P195CA0006.outlook.office365.com
 (2603:10a6:20b:5e2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Wed, 8 May 2024 10:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.69.19.60)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 40.69.19.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.69.19.60; helo=westeu100-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu100-emailsignatures-cloud.codetwo.com (40.69.19.60) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 10:07:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.51) by westeu100-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 08 May 2024 10:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMSJNvMZ1Fs/qJXBeHpbLnHKqWrnf1bkKg7cYZ3+y8uf19K+EYTRLuhjnoL3V/x1sAktVcdhLnrHGe9nRPSVI5VQ4bABV1Dl+L9EmUSJn8fI0LHF89LPVx3QlbDRXK7Wwsd/lWt+vYX9RESwVgyzDy9Uju6lgiFDy00j5r81FcJtij04UbFfVQfc8Y7FCf+cX5EOxSmoLWZiu6PGavHctaB6RVEoDC7FRa3uHZMRZ0X2enh9wDui4iDiwmRFb7r/bd8XHpNFyCLBbVNYebu9UB89JVoGWseBL8QYNV4FI4OsydruXqqYD5aGTY7zGdJiVAeLG+Ebz91CdFhcT23ZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3luu1oJtn2/brzFvK1uh9yp7Nqg7jMrunrOJ+Q6reK4=;
 b=KhAQIm/EtxjjBzB9SKJKbMCi2mQ7kQnB1PCMABOWIKbwxUgtD1hhOjxNpM/ncA2MEWKbeiD66qrK49y7hOBvjg3Slxnmizdnl/Cr2tn59Oagme0+p00s5wbLhSzTb1PhiRzNbAJjUK3TUGiDyzfxqSObC8GAEVDyPKX78RZ3/0dpY5nUGQw6SGLk/fQE9IuiYwsgAHR8Lof8UnCV+mUuQ7XJGgTEFkE5y+rthQCYM7YH3brItpRZcnJddbTVoQt4vnww/umTcGCDfZaCqaPFa3rTmwCfd4Q2vMpmlnHmqidS85d3GFVNeFSR8RfUfNhew5dcQ0wTxIyN+Exawdj5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3luu1oJtn2/brzFvK1uh9yp7Nqg7jMrunrOJ+Q6reK4=;
 b=SURlhTD7FBUoKUh+kCV12yMKb/NDtgOQD2wRN46sYG+Bnt9JsiFg2Cpe+N/0IrdJgTK1OWv+HP1efbpWeCCxd5Wi9r1UQcFkNigq6ng4mjLorAcVNw8m2a8X3sYzH2jfRM0yJI1Xyo68Hd7qvBXDUgRLk4G/PInBYgoOJuI46ftT38YD70MYTeQupzuiJ6MjY4d42o86SnW1uwpXVYvlz1DQEF/gwh20oHxNPOx8qNH9+JbHZQu1enFPaDtrSf99jVqjhWnMsXDDKN1phbAOC9+6s6om4AZcTfvr1oLsVWicJ07JX8VH8oJ0uhA6oEUip0bc7HIc8tBU6+JlhwhWfQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 10:07:18 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7519.031; Wed, 8 May 2024
 10:07:18 +0000
Message-ID: <1404aa44-8e02-44fc-8a1b-d4737ce020a1@topic.nl>
Date: Wed, 8 May 2024 12:07:17 +0200
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [scarthgap] psplash no longer working
Organization: Topic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0220.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::27) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS8PR04MB8803:EE_|AM4PEPF00027A66:EE_|PA1PR04MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f4d8cf-e1ae-4e14-cc14-08dc6f46a729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|366007|52116005|376005|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a0hLWTlaMHF2SGhXUEVBWC8ydC9FN3VHSHQ4Z3E0clpBV1czK2VUZk9DbXRQ?=
 =?utf-8?B?OHNqaHNhU2plVVNSQ1BCdUQwcGpkaHV2cjJvS0w1WktuU3NuV3pxUTBEbVA5?=
 =?utf-8?B?ZXlPb1dLSmZHbURQQ3EzQVVBL1JWeEtiK1AwSUtWWUkzMmkydUxBSHREeEtx?=
 =?utf-8?B?NzBVbURsWDdFb3VFMEJxNFlZUXkyYmw1MHR2aG9oVE50dE45cFJxMk1RNFhM?=
 =?utf-8?B?Zm1UdngrOGZ6Uys1emVJeHFBRGRzYllzS3FWZHY4SUhTaDRDYnd2dkpQZ1Vl?=
 =?utf-8?B?ZlRPbG92cnNLNHJnNVRaa1lDK2lJKzF3TkROeXRqd0FudlNNMS9WM1IwRHo4?=
 =?utf-8?B?eTFWa01QS2lSclczZzdIZ2F0T3FjWkNaVU5RZFBETkxNenQxTE95UUtGSzhk?=
 =?utf-8?B?N2UvajBtMzNVeVBoSjdmRHZrVFlseFBaemlKL3g2c20rQjhnL2FrOE9pVXdt?=
 =?utf-8?B?UXhvaWdjaCtpL2V5NVdsUlQxaDFUR1VxUHZ3RytaYTA3cjE1MXdUcjRwVkhH?=
 =?utf-8?B?RElGME9ETFJSZHJ3dzNtbjhTZjJ1YUJQV2NLTVIycThSOWJjUGNVaG9UMjVy?=
 =?utf-8?B?eldDd3ZVOHFnZ2o4K1lNUDU1b2VnUi9CYmpiMFp3OEkybGdZWkQ1MElneWZB?=
 =?utf-8?B?WjdqNyt2M3JxT1VzU2dTOUVFUEs0T2pLY3dSSVVubDN1V2dZeG4xRFQ5NWtB?=
 =?utf-8?B?OUNlM2JMcjc4MGp4eUpUMk9relVnbUVSZWJLNkMrYTAyRHk2TFZudGE1elFY?=
 =?utf-8?B?Wm9DY3FRVTNPV2NjL0tWNDFIODVqUWJ4Nmk4RDhtVk5WRlZ0MGVibzM1WFA5?=
 =?utf-8?B?aHk1WEFLV0pVL0xtMXl1eWp0Z0daNDRYcnRTNUZSRGJLUE5HcUk4QTBYR2lu?=
 =?utf-8?B?bk1XdS8rNTJMc0trd1hXM0ovY3Nab1lBNGRISjhBRG9iZjlqMTZEbmFBY0M3?=
 =?utf-8?B?ZUFjZGlNeG9sUVI2Tlh5TGxSYzNaMTBDeXlmU3Nya3lnSEFpeXlQOGc2WTl0?=
 =?utf-8?B?RklKWEp3WFFkVXJyQ3RibGlZRm4wMWZoZ0FySW1mTjczc1dJclV1MTJjUjdu?=
 =?utf-8?B?SVFsczBQZDYrcXg0OXlOc1c1V0J0clYwMVhjWUlzdG5uUkFrZFZLUTU1b2Rt?=
 =?utf-8?B?OU0yS0YzZ0JLSHhWZldOTkpxeGQvVDkxZ3R5NEcvaUFYd3lCUU1nZjVKdkwv?=
 =?utf-8?B?d09tcEgydWhJREVKZG5CR0xqbitZa3dIZ1YxMFhQb3ZxOXIvQW5RN0R6ZStX?=
 =?utf-8?B?MXgxaVB6cmlDbFVERWtraUNpeGprdEhxc3BJYzJpS2E0OEFtK2QrbmNQT1hI?=
 =?utf-8?B?QjVCTHVmQnVkWXo3Vy91Z0lOeXAzY3pIcm5LRmx4Y3VmejNsK05nc1ZjY0xt?=
 =?utf-8?B?YTJTL1dTb2xWbnJDaXRUNjlMNmZCMXFpYWhocEt6NmdsYlJrVzVLZlAycVVa?=
 =?utf-8?B?Rjg3Uk5XRXBaZmQrY3p4MjNOS2JFb1J0ak5vV09sRmpQMFR6R0ZLWENwdXRF?=
 =?utf-8?B?eUFkYmRqUm1abEx1Zkxpc1p1YU1zbVQ0VkJ5T3VUSkh0bHlSVmF4TFpzeHlY?=
 =?utf-8?B?eEhyT0xNQm1vUUtJaG96Q0s1M1VSeTZvQjBzMVVGcXQ3MjJycFdrZHVMMDc1?=
 =?utf-8?B?TXVqalpXeGNxNDZMclNRQitLSVVzOUJsRFAxeFhPcy9lNExjeHV6UlhLdHBE?=
 =?utf-8?B?NEtTZkVZNW10Mk8wc0RWVEVJaCtHaWtRL1pIVXhRd2h3N1ZsSG1YSW9BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803
X-CodeTwo-MessageID: 4f411fad-f259-43f5-b6eb-dba41abd956d.20240508100720@westeu100-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9cd77b08-40a0-4724-c57b-08dc6f46a4b4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|35042699013|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0E1QlFRbE9FUG1zR0w4eGFQVkljTkk1MmVNS0lVajNKMkdVVDJQSXJBNlV2?=
 =?utf-8?B?SXJmK2FjTmF6YWloY2VOOFE0aXNaY3RyTVdHS2lIbVlneEpJU1N6SUxOaHBt?=
 =?utf-8?B?WFdPUks5VWJGalo1WlVDRThwUGttMittc0w0TjdrNmdjdWFiSGNtWTJqTzNZ?=
 =?utf-8?B?b25oZEx2aldwQjN3WmJMdzNJRTVEVjRuQkp6VWlUMGpBZmlGWUxJM2tFT3Vp?=
 =?utf-8?B?MndWSDZSYTJpbXFEcWwxdVNsSStEdFp6V1ZnUTlna2U4TUptbDhOKzBEU0JS?=
 =?utf-8?B?MVVHdjdEOWgybnBmR1pBbzJYK1BsVjJXSXpUcTFPZ2ptdUtka29mMTJ5bStC?=
 =?utf-8?B?Q2VZYmJNVytDdTdScHdiSjBIOU1XRDB1cVJDK1JQMHQ0MVVUNldVcjh1YXB3?=
 =?utf-8?B?SHNCaHI1dE5IMmU3Sklab0QrbUhTdDdpb2F2WFNGMXN1aTM5cWxXTkRxY2F2?=
 =?utf-8?B?dWZrZGliVS82NGVPaFltdlRPdTBEWDNGNFVOSm9QMS95eHpIRjYvWVJaVnpr?=
 =?utf-8?B?QnJOckIrSHJCd0Z6RUpTNyt2ZVZkRGFlWldIUUw0NHQ5dkFDNkxnN3JxNWQr?=
 =?utf-8?B?c2RaYWlNekRqVHhSZ0RQSkcvSzZlblZuYlBJOXFLbjhvQVBWK3p5OHVHblYz?=
 =?utf-8?B?VTV6cDA1ZHNDSE1WRTVyMGdBRmJEZjdiclZINmJSZzMySDVuemJPYm81N1J4?=
 =?utf-8?B?bEIvMGhFUnducjltZTZjazc4bGJCOXgyaXNqelNublpCV3UyQTBLaUpCditL?=
 =?utf-8?B?Wk1xNDBIMFQ2YkV6cTU3TFNpaVdjTkx5U3E1MmIvWWswTUlPOGVPbDd2UTlK?=
 =?utf-8?B?Q1hnUFJGZ0FjMnJEUVNyL0o0MkJiaWI5aWlGZExSeStXYmswdVMrcTBXS0Qv?=
 =?utf-8?B?OUU1c0xHL0lzQmdwd3krajl4ZE1PYUtCeERDSWRCdzRMNjNYRnhLeStzWEww?=
 =?utf-8?B?THRRV25QRFovRTFsWVVuZGdDbVBZZ2lEQkQ2TzR6YTJMMGQ4cGgzOVhUNmRO?=
 =?utf-8?B?L3BLdG1tOTJFY0tEcTFxM2NmMTUxK0lqV2VDOTFwYUNrendBQTZVbHd3aWN3?=
 =?utf-8?B?TzhnMzQ1WVFrNWFmdzlDellEVG1KdzUrWHdFLytzQWRyU0xQUE4raVNHd2Ey?=
 =?utf-8?B?dFA2ZmVjVUtXYURlZ01pOE1DVE1kUXFuSE8wQ2g5MVN0bWUyc1RqODdURlpP?=
 =?utf-8?B?bSsrcVRKOEVNbDNIZmZ5V1AwTWkxSjBoZU55UzlxU212dElNTlg0T0FCeFFk?=
 =?utf-8?B?VEdpeEwrdm5DRmpHUmFlS0ZlMDg3N0doS0M0R1hsZXl4OExENHZ4VmtucFlE?=
 =?utf-8?B?bDRYais4Lzd5dTBVRHcrVEk4MWs3ZjljeEdKNnczYVgyOExubW1GRmY0eURk?=
 =?utf-8?B?L1h4TFpleER2elc5aUR5Q2xmS254RWtVOEpLWTNYbWVpakxiUjZWaUdEbERU?=
 =?utf-8?B?VWJ0ZEJ4K29Tc2xWNCsxNDFxQThySkZ2T3EyUWNlVGJQMXlGdzVSek9oWEhP?=
 =?utf-8?B?K1pBT3R2UXRoT0Y5QlFNVE5LWkRUZ2xRN0liY2ZoVWNjZGtUOUI0V3VlNkl2?=
 =?utf-8?B?TWkxY1ZGdUZuT1NqVWtQcnhHN2Y0a21SWXM5MFdGWWpVS2xEa1JDQ2xvVkY2?=
 =?utf-8?B?TER4Q2w0aDVSd2RqUWttNDlRNjJQMldYd2FMT0ZWWCtMRkJqVnM0RlVlN0Ni?=
 =?utf-8?B?T29ud2ppRDRsdmNoSWZSQmZUUlJVdHJMYmtETkVQTWtDSWJVVitvWE85MGIr?=
 =?utf-8?Q?3ppOtWKZQbcd2VskJE7UBuU56i/jFpU2tn720kY?=
X-Forefront-Antispam-Report: 
	CIP:40.69.19.60;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu100-emailsignatures-cloud.codetwo.com;PTR:westeu100-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(35042699013)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 10:07:22.2383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f4d8cf-e1ae-4e14-cc14-08dc6f46a729
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.69.19.60];Helo=[westeu100-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 10:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199113

I'm puzzled.

Migrating from kirkstone to scarthgap, and psplash somehow broke.

Systemd doesn't start is because "/usr/bin/psplash" is missing.

Interestingly, the line that appears to be responsible for that is in=20
the do_install:append

 =C2=A0 rm -f ${D}${bindir}/psplash

If I copy that file from ${B} to the board, psplash works again.

But what really baffles me is that kirkstone already had that line in=20
do_install:append but somehow /usr/bin/psplash still got created. And I=20
cannot find the magic that puts it there...

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




