Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7917EECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 12:45:21 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web08.8691.1667220317318588921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 05:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oB8SQ0OX;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ra/6gDlTaEXGrWuVxN42wR0139fn/yS57tzdmxriZwNjwBo1hFsTYLJZ4RPbIOCn69Nfk2fbWGXR/niXErRFrgjt0C2AKsKYaJAWsyrCEIktjhUOqhQ1CZfKzIj+hxM8YyPyzyW4J+PTEQgvOHz3ggI5abTQzikwsYkAYNl4vO05GC6rw/FAfjSfj6cE2KyXlxJih+uOXNyWGkBVLQnO1NyZG1hcxJxz5TRdY0y8Z00qwAEL88h2L9tpNAL7hDJaEzF4YrhM8VSBf0YBbbZpj7dYzRzpC99jsSeB6v3YVe1XzP74yokI4n90OygdhPoDNmrAWRrTpDIw3FHF8BY85Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp+G2oSb80jVaqqTXtClMbyo5IJ+HNPfGzv2uYW0vj0=;
 b=mlMUaTZ1vEQdnBiZPSJ4VNymTkJKIvFBIjXg9DYzoDStYKJmwZHRQCesX48AImL7acuw8ZjPtIbcnUZ4kSNueBp3UqHnhZiCT49s8NgepkCpOeoVERwttm0hEJy7+N55FpTjcBOC/4mSa6T6VErObGlenU/0+WNG5SMBEVTVhWkpU6aJCcrJFKA2SiJikyXnjnGxXWRiOAX6sMP0oXuDmKllGF+YVrioPvYkyo88Mv+1dbtMEU0Syu6HukspW/CtiMjMJPvVLIe9zljI62/MNYPbVgriyLkBWhLUv7gYuGBPZxSCYzqULfSyNX7oXlOywLXBFvjyLwCYAxkuQ5l9Yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+G2oSb80jVaqqTXtClMbyo5IJ+HNPfGzv2uYW0vj0=;
 b=oB8SQ0OXVYFuy9sxgmBq2nC/9j8wN1tIjiwYSrFtKy+byGKqMB3Y4/L/7hJjlrObzq4pRS1yHLiWHZqfyniTcRMDlh/uKFfkOYLbx8RptUyPiQNsdVmxqnpggqnGSkbXn1jxEvcZEmLLIFvJ/M689iwF2Y3vm21nmC7MJun/6B0=
Received: from AM6P194CA0096.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::37)
 by AS8PR08MB10151.eurprd08.prod.outlook.com (2603:10a6:20b:628::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 12:45:13 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::82) by AM6P194CA0096.outlook.office365.com
 (2603:10a6:209:8f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 12:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 12:45:12 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Mon, 31 Oct 2022 12:45:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bfde23788e29304b
X-CR-MTA-TID: 64aa7808
Received: from bf96393328e8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 410BCFE3-2AF0-483B-87E2-DD2E9B7C7CE7.1;
	Mon, 31 Oct 2022 12:45:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf96393328e8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 31 Oct 2022 12:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mve8LGXWabKYF4A39qtKLr+4gv6hXFO4zZVMPJ+uBsi0zyH5Ld+P7AiiV1ZWAt9x2m9CCwxC5twGg3NmxEVsSrodTmqFY1jLtA4DX5Y21Z62REv2kIsYwWWEA+VpHPg7uQdbpTTZhh/ZykABwX9TBRxTodtNxb8KkAfleSHUn734n3weOEME1eGEk/uar0eyxVfSDqIszez9jgpiro5sRNSgf8YYNZopHaoHFyWXVCnQWHxuNjYCYo3HVWSYgnSVSWJ7rjR9YMQfL7TveDIOvy2it3+s3lXmT4S6dX34+FdwvzxQFoATGfaacvSRvqO+tJsFDU08jzzKIfGj5By+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp+G2oSb80jVaqqTXtClMbyo5IJ+HNPfGzv2uYW0vj0=;
 b=MtiCitO+KQjPabpVnYfrAg21hxW1k8Vdw15FfWd/VtMqXNpm6qtPcn7AKnWxZjmC7TZKdMolEJwKj4N9HRE1/ZvNcGUV9lh5jhgNwaa9TZjjBSfgQVQKPllPCHQy3mLjNy7L3PuFw07Sma4TR+pLhBOFr46lkLKSCEzG1csK8gcYN6IgM4cr3JBnaVLHYnNiDKEMqg+aLCZVP1RL/xn6NhgtUkWhT0yqLAfJMpoHpoakm/BkqZt/dgfw7VNQDBCEWrY7Vi337ujwUvKSHTgnDavt0TUaBk81nKwpvz5qAhKtIxmfT/rldDqSa9ikX5y1PLMf3qY4et8ukyrG5yC6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+G2oSb80jVaqqTXtClMbyo5IJ+HNPfGzv2uYW0vj0=;
 b=oB8SQ0OXVYFuy9sxgmBq2nC/9j8wN1tIjiwYSrFtKy+byGKqMB3Y4/L/7hJjlrObzq4pRS1yHLiWHZqfyniTcRMDlh/uKFfkOYLbx8RptUyPiQNsdVmxqnpggqnGSkbXn1jxEvcZEmLLIFvJ/M689iwF2Y3vm21nmC7MJun/6B0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7406.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 12:45:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 12:45:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 30 Oct
 2022 02:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 30 Oct
 2022 02:00:01 AM HST
Thread-Index: AQHY7Fevgk8mvQjCYk25sJwrBLF8Sq4odIGA
Date: Mon, 31 Oct 2022 12:45:04 +0000
Message-ID: <65E29C4C-00DA-4688-BFD4-DE66B9DA22BD@arm.com>
References: <20221030120341.EB40996219F@nuc.router0800d9.com>
In-Reply-To: <20221030120341.EB40996219F@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7406:EE_|AM7EUR03FT050:EE_|AS8PR08MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: ac61555d-b6cf-4043-85e4-08dabb3dc0db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5x4lFu5xY5AcF2ZDMhytDWGdMg2OMQgCRlokVSpVMU0TWniPH83AAeyoF0Sc6sOshyRy0SbBVQ3jY5UHKvMgkWUkX7lLXLYaJWtoDYYekis4WZNSSDav00ua6FySpC1XvlxiCRl3Wx6znxhLnz8krDCG8B6imUfk9btt9OAFWPNFH/8hbRnBUbEJKar+1Ypy7Sp1ygP03Bet4N8ZfFbALinPaqVMz3aSsmwXLuklEeLyfOWvDLTYoWeNK4PqfD+8x72IE/YrUFabb+O55NFLbrZTAys/3k5XJaPk3q+niNQqDc4hu56gsnxE+qCfXoK3R0Fyxm9I4ekOeIZxckhlPRdH5VD7tTaNAD0EQbOLbXOnXxKN1+kN5NWAsIra5rIvDfSIpLjgqbfLM5MMVwGeXlqGQxxi3ynZRHjUvyPgjCkFOXP7tA9XDKnM7iuaLFWPJCQQD5ekv5+kbMnt0LzfoHVnXGc43OWyQnJ1IFPJcNj7CBnaDucu3WgClSVR9X8SV9qI/+qVeXq9iNiCRLSDNOc8pGrPyuyki1WWUh7g3iq+vIvUSykyRyLhaexL9zxEdu6M6XtSOMDDkGn2VDHIZCmLpjlpjtyJMshZKxGa8JwkgkqoW0XRCu8sj/Lv+Q2pFj4sxdY7hYSXJnGkbyCd6F2NdWgnaSe7bf3YYxtYksw9CjAuG9XEOlXnfyHGCpClq3CLUUbTtuUvFxGUXuv8GyWpVSFZ7NiK3ECSaC8H9wrT5lLtgGRRFFNXUIn24Pd/Ex7PIshgSrIbCpQhY8X5x7omldQyv3tSc02EnmwU+09lObiI3iC6KynIfrghX4o/EU6JcP2sCuYKhj+fd/8Teg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(86362001)(2906002)(558084003)(33656002)(36756003)(122000001)(38070700005)(38100700002)(6512007)(6506007)(26005)(2616005)(478600001)(186003)(53546011)(66446008)(71200400001)(966005)(4326008)(76116006)(6486002)(54906003)(66476007)(316002)(5660300002)(66556008)(64756008)(41300700001)(66946007)(91956017)(8676002)(8936002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C333260862093499775FAA64013A8CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7406
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	923140de-78c9-4eef-9cb6-08dabb3dbb99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Akw6L3xcxC4Lwuq+LAuksEfttJewcxDdy8zOu5NRRPO+gpb61J6wOM8EX1k5lpiPbg2ZJVz9MXMjM9aNDe94yXaKQ1RkR6GJo3V3RzRxjU4/fILDUCT7S2aC6HeQltmqaWJjneGLn6HsynVenCr4KDiCYSaAoPgCzU9XC+aFvjuPNJ5qU29/CQZeXm8GMOaqjn39y/EreJIObGZilr9OIFcQ4GF7DVs8eghyZqbTtUTRtVO20//iQtracerYWUc3EaExoAZ+pA+AUzW9AYRi9y/lY8m4HMy/QVXkMQ/iH6cDmU92O+Gh0TO4EyjkGW1ONn3pZapKgcMyghmdgttCFsk95B4IIzlW/iW/pRpuzmNFXLwz4QLAOZDjYn8WtWOmHeJBvC9X9vYijv/p5an6PFp/aG0UklObjTPfyL7Pl69SQhxnchqBjTkdppVMLWkCaNedVaY5Vq5+rHWp6Wmj+QIgMANh1Y4w5CZkAfGbVKLa+kxJWjsfwUNZmhVSZMdIkIJQcSDovbLfV8fC9IpLwq9reGEzmywbCSx7aoNFGC2DMKtWHn3bXOu4vKKN47jpjuFFcDkyYe634Zdux91DYDpxSKQvfv5OCIChtXus+aQPHAy+7Yfdeu4Qw3DwVc0p+4+ah7OI7Ddb4+bRx4WqoYyQrJpBDtkp74wLMaWAyzZFUw5JOFXOO9n6vlJCv0dhQtPhRo4zhJp/QAsvMgn7Ee4DKw9d+orCez0yWOXY1S+Wfo2krtDR/pMy9CaWg0G0LJ3bhEHP2HmMN4qNnx+aLE57+qFiSlZyMe72VKM5puZa2tTlJY03szU3BkRHPFDm
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(2906002)(36756003)(5660300002)(8936002)(356005)(8676002)(4326008)(26005)(6512007)(966005)(6506007)(86362001)(53546011)(6862004)(54906003)(82740400003)(6486002)(316002)(70206006)(40480700001)(81166007)(41300700001)(33656002)(70586007)(47076005)(2616005)(40460700003)(478600001)(107886003)(336012)(36860700001)(558084003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 12:45:12.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac61555d-b6cf-4043-85e4-08dabb3dc0db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10151
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 12:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172316

On 30 Oct 2022, at 12:03, Steve Sakoman via lists.yoctoproject.org <steve=
=3Dsakoman.com@lists.yoctoproject.org> wrote:
>=20
> CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-43680 *

Patches incoming for this.

Ross=

