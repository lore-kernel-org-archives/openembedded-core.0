Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1B8C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 10:04:34 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.86])
 by mx.groups.io with SMTP id smtpd.web12.23450.1633428268873253673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 03:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Qx30wzir;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.86,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8teOdaooElYzlb04M5SeRirKEFFw/+xNBOE58KyBIeAUebBZCIHsXxjNGXWflz66n0V/AM6pv4eq5UhsT4Hv43QCdnfE8OemvoHt42bRO57dqM3pgP4VdLqorwroAp2rZLSMzQJjHvM/ckZYuwargmuXKVji4Kkl70baCAkzol0qyiZtXgLEh0D5TczIbwbYUf/mvL5w2m6Xv6nSSarANsw0fdaU9P0IGQ2kaRrGU1J0Af9CluBp6cnQVK5Rs5IOsD5sHPmjQwai8TAHeIz0T/OGx4dN25fyW2eivNwuoxBcrS2LujxQkNRZYkL4QdWNTBouEBLrYLpGo1JSm90/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpKR9a2TJPY6Uh3kobK5Rjrwl6tWhdP3T0TG2dieSiA=;
 b=T3BkZjX0gtSozvI8QMtSy+01rrzrj68bsd437fymbIbEd+QoG7R5kSFdKhXr4ZWuZPrwuEr8bqKj1DcDCaXgd2xT7tla5bwhpEIhbjJ7OpeOHY/HqtuPvt7reWfeY7yn5wM9iuN6JFrPJWBug2lRVwjm8lwwFMLKoGXuLkPnO4MAtlN9LGD5PfHJ/aUzBmD7T6D04mB8C2UuGnKAKaMWx6XedtpL0C5IXXTUy7jAuddm3JpupmKWyej1JGlt6PYU3BZnbrxWxFNrAXiQXjIeKp7hX+BUPjyQSRsmWlhSkeWMgWA8vcIkqLr9hnnCHAZXwki+jajkexmiLUUQYozihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpKR9a2TJPY6Uh3kobK5Rjrwl6tWhdP3T0TG2dieSiA=;
 b=Qx30wzirN/5izWDJP6op3SSFp3QBDLpuwR1kfx3eHfUa48z+d6s6qYcosWK26bBHarJjJh7wjPnDcsWSr1nq+Qz9hz8DsaIPZ5Thx3iskQPDR5Sway+tNHh9Uq5+HgvoXZGVkUlN6yEQxk8icGHsh1g0QEuXzaLUttsaHzhHEHs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5982.eurprd08.prod.outlook.com (2603:10a6:102:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 10:04:26 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 10:04:26 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: jean-marie.lemetayer@savoirfairelinux.com,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Improve npm support to run build scripts
Message-ID: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
Date: Tue, 5 Oct 2021 12:04:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::33) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.240) by
 AS8P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::33) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 10:04:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddcb71ce-8a0b-4e33-3917-08d987e78344
X-MS-TrafficTypeDiagnostic: PA4PR08MB5982:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB5982F3FDAA1C16AA98B1F36ED7AF9@PA4PR08MB5982.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9vhgeYPpbVuORpsS8bmTwNkG8mZaJ3uv66p7AJaUQmNx8ErNTGvvZmsZxkUCPWAKwrKYJf7KihF/nxu/0kSLcKqLb3/X7DHbQjiibHSuM1mhTw47tqsxWSzWKAkyOWZsGMt6l9oq8JZYNoZHlHF5bgc5ihypnsyMpnyZ6HWm/x6eD9LDiv7+n9mHoP/RFuddqK0FYUNOsi2YQOoKBd/i3jeh9hiU+pu7pYD86TFDZjjTsdXZsFpuSc3pTTX3b0xwEjzlQg0C3BPvKNfkHM4/k86pkdwbLYv943wlXbcG0IikODUaRq/oRHMPjgeHqJ3YAbNsfH8uz5vOFC5mkt2k+Ow+TKBpC7Yt/FS5PufwISWsMgW8eSS0A+YUeLVn/i4zlwSEzk6tR3XMrj8rO5PylSfb2b1vbT1hpSH/Sr7w7VnIkcGqg56ZFhVSD4q0pEMlJFDMWmX2rMf173zYqyj0sfEsRbTA03C1mqA/pHv1Ei4sB/uoxz3EcZFA+AoLtR0ufMpvywp5HQmxY+ixOtLdOJVnUwNHNkR2WpzL0iXDtgPzyOdOwvCMwRUCbj6gIilgPMbXQDI5BZNunUhIbPDYQGrzBUs92He2dYjeKNoW3e3og02Buh5ofJf0dxqqF+NlloZaGf07HklSkGE1Ov7sl+mxMbDmTSorJjv28YEg7OZ/8Zs+8cvFHPrl6m/H8Mloimo8B9fy4BHGQm/OgrdHEzymXTcuIUjLHHJR1IdAAo3wL+HoowflwSD9zb7fS7bwMsvxIKH88StWORl9ArcGsg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(316002)(66476007)(2616005)(956004)(66946007)(86362001)(31686004)(66556008)(38100700002)(6486002)(36756003)(38350700002)(8676002)(6666004)(4326008)(52116002)(83380400001)(5660300002)(8936002)(2906002)(508600001)(26005)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmVpbC9EVUZZcGxQRm5RZ1pzVXNFeTFQRW9kMjJhYlFaUnVycjdBTDhEN0Y1?=
 =?utf-8?B?cUlPQ2NNT3N3R205UFBiRVpJc1JSbWZsakdRVkxQR3ZDTHJvNHpteHNLdWZH?=
 =?utf-8?B?R2xURldSQlpuY0V3b3lTVkYyRitOdGZjLzk4aXZnQjdwUG8xQW5CY096VmZ6?=
 =?utf-8?B?d2N1UG92SGRXQTIzSnA5UkZ6L1dienJGcktkVFY2SjhsOC8wb3Z4OWxSd01t?=
 =?utf-8?B?UVRyTXRWWmhTUEtzcUlsWFNxdWxrU3NOWFV1R2U0b1VJL3BaMlhlblprRGRI?=
 =?utf-8?B?c3pXWjgvSUdEamFPeU8rckY2bHJLbGhFWTBIZDUvaWduMUw2QStmN1c0STdh?=
 =?utf-8?B?K1prS3ZsL3dZUG83bVZGT3FDNmRpcjBGV3hFeEpTY01mN2pUV1dNeG9aU3hk?=
 =?utf-8?B?b3JxNXl6c3p0bElXQVQyRnRyTEJMUWYwL3JBL0V5VyszOGFkWlJpeHdnWVFq?=
 =?utf-8?B?QS8wSDZGeWdhRFhZditRTGNldjZyc1hXR2wwbTFDL1RpbFVrYk50a0tNUTR3?=
 =?utf-8?B?SjJGWjFDYlgwdFFSYmFCQ3V0UmE0K2VWWDVscTExRk40MGs1UUVNVTdRTUJO?=
 =?utf-8?B?UnRUUmRqTDMxbXliSG9xYWw4K2Q2bkJyR2RoNTJFTHJNZFpMdUM1d2U5U1hV?=
 =?utf-8?B?OVk1VFM4NUtMTjczTytYT3RuNDJPeU9zempSQTdkeVUwS0RtTmtPQjNUUkxj?=
 =?utf-8?B?aldwVGpidnFieCtROHJjWHlRaC92WDNjcW9sZ0ZGVHdWWUw0cE1nK2QwQ1Ra?=
 =?utf-8?B?VjVWWjB1NkZnQk15QnM4M1NkV2tNVDFpNVFzcm9CbEI4eWpkY2lxdEsvRnlm?=
 =?utf-8?B?S2ZmU0pjdU5WenhvbGxqQkoreHUxR1lvV2wzTXNSV2UwRS9XcDJYWmtSWDBv?=
 =?utf-8?B?MFhqNzJHaEN5MFBEMEJuRHk5cTN2dkxaTFdJM0RacEVic1VWWHhOTElWT2hp?=
 =?utf-8?B?YzMvMkxQZ2RBVFB2L1BxWXB5RDBXNWZwRHpBTllJRWp4NmRoTHRNczF1SDZk?=
 =?utf-8?B?VytWMnBKN0xoeXpHeTcvdFhCSU81WXpZbUFybDZkRjRDZC9MMnpBZjI5YkxT?=
 =?utf-8?B?blVnbTVLTXY0Q21qU1JyOGZqMzNQL2xXOUtkeHlrZTdYQUxFRWFIVWVOQ2dM?=
 =?utf-8?B?a1g4OHMzc0I2QlF3RklzZmY4bTZMLy9xSS9IMExuTEVFaVdVVUFuRkZMSGd6?=
 =?utf-8?B?UlhGOHh3SnM2TlArNlRqWkhZM0xQRUFSUm1HcmMvUVM5a0lyaWZESTAzMUZ2?=
 =?utf-8?B?OGpXRjUrU2p1dlJNNzlmcDAvMGxLODUyVno2aFlqbkpweVd4bUVRejQrK2t4?=
 =?utf-8?B?eXZGdnRabmxUR2g5UUlYay9SRldDVjZkNWYrSExxUVpMMDJMeW5jdFA3MGR5?=
 =?utf-8?B?R3hDYkVqR29EYWlOVGNDTEw4bjBjYWJYdUFEaU9lejNSbGtrUzE1K21lR0FU?=
 =?utf-8?B?cittcHA5ZDFmN1BCcXFmLzVJcDh3dGN0bFNteDc2eFZKajFVdGxlNkxZcTF1?=
 =?utf-8?B?QXVtRmxnV1gxdDI1ZG5sV2ltQndzSU9wNDZhM3NxMkNCNVZoN1hzQ0F1Q08x?=
 =?utf-8?B?QnVHYStuZDk5bkt0eHJwdXhPMXdxZGR1MDZuK2tZZENSeVZlUEgxdVNFWWN4?=
 =?utf-8?B?YzlhbG1tQ0JrL2VlR2g0RDErSGxHR1I5cW5ONW0xaFVHb3hDelVGVVJSY2x6?=
 =?utf-8?B?VVZQOGU2UmZNRDJOYWhkYVZQOXJwbTJqM3FwdGMrd3luT1hWaGtqMUdCS3RH?=
 =?utf-8?Q?qUH7kH5Mvcio8cnCcr3p6G3KokIDZxEDTq4/4eY?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddcb71ce-8a0b-4e33-3917-08d987e78344
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 10:04:26.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3Gk04DUH5uhb2oyj6br392q++yv9LO1JhyhgBKyeYXSvPBRYsPCRotW7Cu5LLkbSxpvhiPwQgVeLSyjwY0qEZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 10:04:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156640

Hi Jean-Marie and Richard,

I must improve the npm support for our use cases but need some 
fundamental decisions to proceed. I need to build express and angular 
applications from git repositories.

I have the following changes in my pipeline until now:
- Support npm packages with missing execute mode for directories
- Reduce command calls in npm run
- Add support for local tarball and local link sources
- Rework crunch license to recognize more variants
- Move known license checksums to CSV file
- Pass README as fallback to guess license if a license is missing
- Add support to pass build arguments to npm install
- Add support to run build scripts with native packages
- Parallelize the populate of the npm cache

The build (install) of npm packages leads to problems because of old 
versions in the dependency tree. For example, older versions of packages 
are incompatible with the Node.js version and older versions of node-gyp 
require Python 2.

I see three solutions to integrate npm packages:
- Build npm packages from the npm project outside of OE and only fetch 
the data.
- Fork the npm project repository and fix everything inside the fork. 
Use the fork direct or create patches from the fork to build inside OE.
- Create recipes per project and incompatible version to fix everything 
in OE and reduce redundancy.

The last solution keeps everything in OE and benefit from the existing 
OE functions like download proxy as well as license, CVE and version 
check. But it increases the initial costs and makes only sense if there 
is an interest in an meta-nodejs layer.

Regards
   Stefan


