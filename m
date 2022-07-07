Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD2AC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:36:44 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web09.3958.1657190202673944247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mskX50C5;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CO/hWkvxV77WemensK/WfEp+fezfQEoQyvE9RVxa1Qa16M3PKKKgpKH6FFxpYbEBSOzpvbSS2kHRjUTzk0zWKv6Bd23C7czdBObx0yPatBN5OiAIx5KkmR9/c5wnkpgVVD/Pd5jbRHEz8AxceetlOM8S3HPzKvG3bCrgyIEF9VlFDwyD1mKAxj3MFoaLCAUvbsHYLKwfzz8R8Yipc9XvaND7gYvvIsr8gM8RBSRVI4qx+vrzYxVTtRl3mehxVdKc3IAoz+BP4vV4QBfTZJtjCcABpTtlOtTiRK+QISgtyvTrgfYt3y4lYASO4nUPNtvzV+xRgv9treWmtX2pQdNs4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g+dfm7wLJmNZpmscZ+se8EB/F2WQuw1vBqTCD30QJg=;
 b=LCoWvE9cicVYaUmmWaCbGyx48WRJ3SiX8q2S6Dvhz+t6SneGZAQvuRHXSgejJvhOIAqk/IXjIDionexFqKRYlKayho68JpP1dxoGQ8m4ebOqJYEBFPG2EEkbOSy9IS0mrFVjjkO92U2CChTo6Ljn3H4t02WC01gC7S1QFIY3qjlU5hNunXVC+w3z2H76OHMGsclaLIDW/sQ71AnFVc5RxG9UXwfzSTk0Jd1wVKVatJijxqZa3qQEZeiRKY0HrX9Qun4GU/7XoHO+RsYOMW44Cs3KJ2nTc1LmZJgHCqMP9G4DT8aevbrLpejWqs6O3bU6vXaiXrshfNwylAWHA8Uxdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g+dfm7wLJmNZpmscZ+se8EB/F2WQuw1vBqTCD30QJg=;
 b=mskX50C5FHqBP+D2N5ZqviiPYOVcSsO1Pljg3Wrc1boWaxVWlOsLsQvV3w+z0YqTN85UmH0UFhSWQ3DYtKdE5GFOy9oTbQhj+hZbhVxLnuhwKyNEo1Ti0RGUIPDx/4/iLutWcy+3YCNpTDPzJBMY6S0146zbAnPtc6EpKc2mVQw=
Received: from AS9PR06CA0760.eurprd06.prod.outlook.com (2603:10a6:20b:484::15)
 by DBAPR08MB5606.eurprd08.prod.outlook.com (2603:10a6:10:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 10:36:38 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::64) by AS9PR06CA0760.outlook.office365.com
 (2603:10a6:20b:484::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 10:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 10:36:37 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Thu, 07 Jul 2022 10:36:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e7818f195e2b239
X-CR-MTA-TID: 64aa7808
Received: from 754c776fab05.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 983F342B-58B5-4F4D-8B85-64FFE82A5013.1;
	Thu, 07 Jul 2022 10:36:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 754c776fab05.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Jul 2022 10:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6tXa5mvjZVHVVSDI+XzI7v0z1rp2IE/bJ98kkuxtVBNDESOdSes0aBvOZRwafiEPkhbnb3DXm+5kCII8El3LkLbGntg0OL0+QK6JobF2PqzhFXsFqxXnvM9BQ1Od+FeNf7SK8dF8f71ZV9YBnbcRGBARapMlMHBNGFpjplQYixM9EwWgimTjjqTDot+ZHRNR7EMk1ECPpZN/mWFMiODDbF8IHcRj5wAUekCYD/PGijc7SDRecq1KZYGbPsoWZ9kqUTx1y82az1Ays60ipr/1NLzZdOIpIj4Bgg8Mdxs3fp6b2BpdKS8FgXwIaGnUvB+RbdcBjkXs/daoYXQJ0rCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g+dfm7wLJmNZpmscZ+se8EB/F2WQuw1vBqTCD30QJg=;
 b=QFfL7aAScd3ydWToHHtvCgHvfKgWesYFU7h0utLTBJMobne7dzPOP/JRe5jQHPMOaUaA1LCL/fz9GX/YV1/M8oizOiaeMG37OGDLguzscbcLbxd2ttEXun5uCK8Plr0RcvmXaFMP6qXu3B0LP1GbkrmT3pahfcZugZkZjIOoYoPgiDemJoCqW/Ypbh2MjmU9JlgNcE/26/rCBLJbStsCmjZFXnRwKx4sIo0/Uk9BRe04+SHIY9Cn5ukBFIyeFnYVDzXLtEOoO/ktae3jE/W+03qjwHQP9IslrhKYfwVmz5pKfY27W3ynJYd0Io91k2H8nhrxm8aiLaV+1IeDg/mpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g+dfm7wLJmNZpmscZ+se8EB/F2WQuw1vBqTCD30QJg=;
 b=mskX50C5FHqBP+D2N5ZqviiPYOVcSsO1Pljg3Wrc1boWaxVWlOsLsQvV3w+z0YqTN85UmH0UFhSWQ3DYtKdE5GFOy9oTbQhj+hZbhVxLnuhwKyNEo1Ti0RGUIPDx/4/iLutWcy+3YCNpTDPzJBMY6S0146zbAnPtc6EpKc2mVQw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7221.eurprd08.prod.outlook.com (2603:10a6:20b:344::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 10:36:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 10:36:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
Thread-Topic: [OE-core][RFC] Layer Setup JSON schema and example
Thread-Index: AQHYkXI5OEmmUfWjvkWig9qxoeGl661yrpMAgAAEAoCAAAVZgA==
Date: Thu, 7 Jul 2022 10:36:28 +0000
Message-ID: <639E7961-BBE7-42D1-952E-FFCABEFB2655@arm.com>
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
 <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
 <CANNYZj-tF-QYoJ2U-V-PgJJXfAWbRDmELLBziUrq40SzXi5LwQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-tF-QYoJ2U-V-PgJJXfAWbRDmELLBziUrq40SzXi5LwQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 08e48abc-ad3a-400b-57ed-08da6004927e
x-ms-traffictypediagnostic: 
	AS8PR08MB7221:EE_|VE1EUR03FT059:EE_|DBAPR08MB5606:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KC6pL4pWnSMNgLlsUAlna0hSyWJ0hfs+sHsJ715b+VMjyfvezwzNK9Ggu7U0i9d5luLzotaLNlA+ljbXR2MAVgTKrITfqlXJVMKvLqUzuD6hnt0LnH9UnbmFQ3f6jawNVDHJ+Tkvk8BdeDsDvLCI8BXiwM0v1afImV8Mm2BB8wCqi2mbjor2d1PzOSNSAAccAPPRlDTvFJZY2qKCfw8vyG1mHwo0ilj82VL4YRn4eAeI+/tOi40RCi1TOSq1Iwqe5J5bVWc8ZM/cMmOX7LjSw9Z8T//K9mij+0GpOZZCgSgpNzi9U8eXsuSNU8WB/shm7jMtB0A5Utg/Jv8Xzxh0045UtQ62GG2IkVWeFQgjmp/IiccPUEPpwjinTgQOPs6qxL9HUyrPu07KE52J/vXIxtrxhanvVOSBpQVHSptlypityvsj0THenkVD+ZE1KGF584B6d1NGa3KaIw8pQxymvHmTeZSqf4n/Kglgs7Lug8gZ7ZUUj7H7uyFPVnh346yFDNCs2nI/HRnCNy4G+z/roenJtTEEXcJdeZDkp6hbXMegVwJHJ5jINr9rDsR6MQ0mxYsiFhe7iL6G5I1guLm1a40RPHgWx9bw8PWm2q8pxUh4zEaJDe0EGXSWyQk10pm4RMpNUWY+qz9X+FMWpBEKS9Z8iGOG0TNwvhw9Jg6f9VF7B3aDcWvpx/w7jSPPNP/vHK41fpsFKpat2xaNI6+jl/dSsjHQJ3uihB1K3HlHU/oH1OjqrAI7S2W2pPGgk140jjAzhH3CWsB08B9OjmTAj6LR0//F4SpONqw6HlHzotnkaH74l39SMQNbhgzmaaCmjcz24uDanwZmEGZdB+tvvyT8sZPjSqrwLT09ilb57ow=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(2906002)(2616005)(41300700001)(8936002)(38100700002)(36756003)(6512007)(54906003)(316002)(6506007)(6916009)(66946007)(66476007)(71200400001)(66446008)(91956017)(478600001)(33656002)(64756008)(186003)(83380400001)(8676002)(4326008)(26005)(38070700005)(122000001)(86362001)(6486002)(5660300002)(66556008)(4744005)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <076FCC3981751141AA0BCBE692BD8946@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7221
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5026ba9b-78fb-48b9-fca6-08da60048d06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	469WQM3pMV7WRqnQb0PFUA9pGhLHLzVwmPNjwihUt/p/zaohJNPYzW1slcWYl4IAePZrkoM+Gix8uX8/XHEdZ7LqZr5xCykIqaMYOGQu13o6E0UR49DI0g6ptg0IwJusRBRRJ9EYuK2QLFMJhYsiWKCmzO0O7ztTdHCrnOS2NwcDeePW7t9UVdkLoPFabHvAoOE+9ktqeV+m5ps0rjJIY7BKUX632fmKldmJnBOAsH/6KM43DjPK10FVnFqWEsh3e31u2pMVHhtMd+dORx816J8HAs44er+rn+NDJBr/2W3LWmnE8KKMroev314NAQXtyuzgwKIN9ZiQ4PvEcYPPqjwglOr/JCy5/urpO0SVeWqYpCbl1sKhJh+Om8TBKUg+EbilEpXhyizPH++952idxiSk8zs2UVxQCVZQwqNoKxb0YcEYCe3hfPLwsWezzD+D6TFiAzZAxRzW5L7yVHYDSK5mDmq11QvuwsTtR15O+v2eycVWXLoIdFv8WywGJ+oBXtUwkB7vMdKUxUchllrmEj2sykJqLgAOhKHLdAozidmA55SMx8toB3YL5B0digkWvfGOvBefEPy/eyD+N/aQNTD4x9H4170+qLk9x1YD4pVATITSig8Ct/FQ9ZGsN3MAS6j7qbDC0HU3O2pixh1UAdmrptiwkCsDit8E7OipYAAl94r2VoMs0NNHCiwwwFOzHEwUqopcF4P3ItJSHxk3BpRz61xI1h3KE0NkZsOO26E6TOecSE27OsemUcP9zauQ4waotx8r4vRNcGDntxqrxb3WiH9do0HnCdo6ZX3fhrxJJ1Su8Yfab6vhR4waIVOu
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(40470700004)(36840700001)(46966006)(81166007)(36756003)(41300700001)(336012)(86362001)(47076005)(2906002)(82740400003)(54906003)(70206006)(82310400005)(316002)(36860700001)(70586007)(8676002)(40480700001)(4744005)(478600001)(83380400001)(33656002)(8936002)(6862004)(5660300002)(40460700003)(6512007)(6486002)(2616005)(26005)(6506007)(186003)(356005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 10:36:37.9142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08e48abc-ad3a-400b-57ed-08da6004927e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 10:36:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167768

> Wait, how is YAML more readable, if JSON is valid YAML?

But YAML is not valid JSON, and YAML is the one which can be readable, unli=
ke JSON.

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

