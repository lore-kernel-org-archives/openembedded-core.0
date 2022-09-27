Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67749C6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:29:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web08.9098.1664274558438767050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=FAU+dpDV;
 spf=pass (domain: arm.com, ip: 40.107.8.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FMq4insDKYzDRQABLBVWWn6PR4Xa6R1MsZu5JlJ7FaCNxvT6p3BQSdtcI111CRoSqJ1keydrSI+UksXoZD8zKahie3t6uiZRRKsfq8yA5pPRdcZd3s6s/487IfdnjirvA7cxAwjpOVpDnxHXB10Eyn6z6Oi9iL/r6KouRqQoEFOpUnWS014lE1gYFEdV94qWUv46VUq0Kgdh35/T5mZ0WucIJuzwSj4mtiIUSQ6F6+kJLlFZObpApGJuxrE9vFpEf8w/lc/gpVpQK3QqoVsf/JDAMCQD/OM73QsaxrUgEjzfAme1GPlQEnQAj9dRZtkNeetKYm3a77R12RzELl6iAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/1+XmCsRg6F/eBZvc2Vy93F3SynvWo4+EfXtauVUbs=;
 b=P7VT5h/ApEphDoFByWDDVaZcLBNmpeDKpvoUp5mOJEp/JWMBBF1YcwTNW8C8BuF7YSB4wVlyHBEUKgnNlq83NoB1Z82+ifUNRRekzIBySclaAOl0CfIgUizATa6pAhTfXNyz1u7bQ3YC6fa/ryQb+fKgZe8gg3f7VChjvvOuvxd3Gawa8hgIhlOKK5jgkW6zVkUTr/vVMyTh1RiMkfmDEzHOsfOdGA15dk/je0YiBtqN/3ut3tTRVdqLH+cWqqsi4Nb9GMw0pU1j8y9vOToeHn3REkDbrYYP4TYQtJeUkwhBcl4FCBYi7YRLGOaUnPrelFfrzizj7i2gF8ydtupbcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/1+XmCsRg6F/eBZvc2Vy93F3SynvWo4+EfXtauVUbs=;
 b=FAU+dpDVlFH5Uw9NLQMkv6mq+SLWR1ePeZ2/gpl6OPksPEe7NTYdUMYpeV934f94GEAp49CJFAxQOL2qLNNRsYffG2FQuU/gX37gb/XXoWfHs/AwTUbBIHMEB9Nii5doxAPBGvXf7jPgHphfgtpSclV2KjtS6SKSXlg3tuPFFkw=
Received: from AM6PR0202CA0046.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::23) by PAXPR08MB7598.eurprd08.prod.outlook.com
 (2603:10a6:102:23d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Tue, 27 Sep
 2022 10:29:13 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::f2) by AM6PR0202CA0046.outlook.office365.com
 (2603:10a6:20b:3a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 10:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:29:13 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Tue, 27 Sep 2022 10:29:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92a6fa1a1f35d5e0
X-CR-MTA-TID: 64aa7808
Received: from 145037f840d7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA6F5EFB-9016-4758-971E-6DEE4A35D667.1;
	Tue, 27 Sep 2022 10:29:06 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 145037f840d7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Sep 2022 10:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTz//jhlt+TZhLmMkAGLQLDmKLEV8+hG1hCntDUgJ8UhtgsgzZrtaXu4OrwZt4VW3r8XKYZfmTLIBf1ulhXmEIIu7L7qUfzTF+dv4Ft46uWtVIIgp2PJYwcCS4bmrmByZM77UE83HHmtq4a5gLD1EAGJn6tZ2ras/C8jLyBEDEuy/laCgXZFdXtC1d5Oroqaoaok+TNEOqk2d4SoinWXrWsM2DRZdO4UTQ05RyH1kl5gIDzO0FKmwi+v4pnXkx7uUuHsCaXRBqfDORAd5T4fvjN2r7CQBS+yNPpat8xJqTwgBrlgohqh/zGS950+3hsexySqSG2aqyWJrLNFKaqWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/1+XmCsRg6F/eBZvc2Vy93F3SynvWo4+EfXtauVUbs=;
 b=BN+YNlYaFRmUA+HHIf1QlEYQTxO+TPvzZBt0wP1V1CnJ27DKCA2ZorkDoh9vOKs6aFlssrYXZVdBBQ9EnUyLOCadmh8f+MoT5wDChsBWuJT03eRsSk82HAOH0tJCbqtfHo+Wzx1sIyLVh4XcEnupoT6Ky+cymu5rvIHnobVGSt0w3pYZKzqlQmp0A9XWsuFtdkk2KnvOU4ryY6n0UGpmlCP0CMng1QnX9O8toOmOl5Idb1Y9EnVpC1gSBGrhks9PQ33IdzObZcksVkMulM4ss82qTUTldLNxMjuEf2cxtPZ4dCV7lY1klsHsZMpuZAN5RJq95RA4UtKdevn2rBDaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/1+XmCsRg6F/eBZvc2Vy93F3SynvWo4+EfXtauVUbs=;
 b=FAU+dpDVlFH5Uw9NLQMkv6mq+SLWR1ePeZ2/gpl6OPksPEe7NTYdUMYpeV934f94GEAp49CJFAxQOL2qLNNRsYffG2FQuU/gX37gb/XXoWfHs/AwTUbBIHMEB9Nii5doxAPBGvXf7jPgHphfgtpSclV2KjtS6SKSXlg3tuPFFkw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9594.eurprd08.prod.outlook.com (2603:10a6:20b:60a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 10:29:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 10:29:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yanxk.fnst@fujitsu.com" <yanxk.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe] [meta-oe][PATCH] bc: Add ptest.
Thread-Topic: [OE-core] [oe] [meta-oe][PATCH] bc: Add ptest.
Thread-Index: AdjL8n5h1xMUHd76QfiRwMiTlufDHQGaXe0A
Date: Tue, 27 Sep 2022 10:29:03 +0000
Message-ID: <1A88151B-87BC-4BEB-AAEA-E6DE1FAC8A6C@arm.com>
References: 
 <TY2PR01MB415557D074E6D1FF5A605BC8934D9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY2PR01MB415557D074E6D1FF5A605BC8934D9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9594:EE_|AM7EUR03FT035:EE_|PAXPR08MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 5028074e-aa43-4fb4-7e68-08daa0731f2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 o72F0HgxCycWzidZmBhWZmDSoGKgbr3tlhfOR0rZkVCvGYEg5jKkDt20zkCiorav0KjEY7+/ue+phoi4SHscigk1vKvbG8VM4OIKKAARb+kqZIHQH5ljhrsQGd86wdPDOwygn3zIyufIQqs2wnYX/Y4jNaKjJNRWUhLlzrfZLDRQACerTYuZj23IZVcoSKDWizqbiMVBYtQYf9MrKCLhTFO6qjqKKmHckIL2xySiwin6XiHCIeGLHEpmuOBvNASTNOT+tT0hAlPM9esBgDAX2sx8ALNybjgYvTMQrDfVYZSAguPCNGbdSGbL1IiUeEVk1b/dp/i9UAAK9PD1LjtX+CgMoe0hQBrvkSMsN4ebQsboklNXz3Ddz5XxZSE2iwN1AVJ1YibNdnVM00g4RWCOZ/PV7ALfpVOb8rxMH8f0wW5Equm2+iVhodpGm8W7QcCkBxpTE1pdaGckOlrlhWmnEx1VszTN5JWljRYt5SyC+uyQscy+axbmlRc/5HAFvDMEOZ0Wyen8o2xwyppNhITu6YONyxMks1hMlR/jAgSd1jk8Hq+Mt/jbfh4c1WPNS1u+5SAA47tfjO40yZo4dD9oZeXtFhwKndmB+O1xsiom/ZjlrIniHhaeJWmWBkf0Hh8GrY5ecjI8XMKt6bN+AlFfx6wEZOWqKSAR4qOpfTp9LVqmIakYOW4Bwi+nshVCQW5pBUCg7cgJOpYkormjevsZoQsC6G26eBNOhK2YZqUhmRH7CHUdSJD6lqlpuId8aaxT3a61ZdSKRdt0XAjEGLdnuai2o0Yz4biSv6gWc/wBHIM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(66446008)(66476007)(186003)(6506007)(66556008)(4326008)(8676002)(76116006)(64756008)(6512007)(53546011)(26005)(2616005)(91956017)(33656002)(316002)(36756003)(122000001)(5660300002)(6916009)(2906002)(38070700005)(4744005)(8936002)(38100700002)(41300700001)(86362001)(83380400001)(66946007)(71200400001)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE1C752991CF8443B2BB2975B8004C39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cead3c2d-721d-468a-06e4-08daa073192f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	clWP9VH5H8uf4HfAsY4BcK3f8eTI6enc0DXKZ28w0OUA5OZ6xWTINE43+Cd5XPut0uHF7oaJD0XsgvwN5P54t/GEdS9ZaP7Xl6FG+VIhBnwRpCR6svxtRyLhim1VtiVNxvYH3HtTSvqivvtknku8F1S6ifuViWXZWYHluN7IjzrUY2xh96+LkvS85Ftaru0cxtMGAtGEgdV+TND4xwsS0HrLP6Vws3JIlcSDQcB4I1VslzV1QuLxIoBHXz1etxyzFajFBFnrwSd1kVHxWdEr6uFndJLkNCYClxqBBiAthHclbjozS0kNTuOaNgqfH02Ia6fhyFcSWF1GPKc9HI+MfOC8sTg3iUaEnngXwQpadbi5tGpJ+CLOJU+eKN4wqY3iXie1hNp/ZLYL6PEw5IeVMaLf6DY82JJ5SDWjkPkVPo9X8rBbccKiskNAaKpnTCl+YnZw5TkktokvV22bWwrsKOQRhcedeGrfLxxw5k8H2YuQFG0EFDMN1rfJnhQ0B2bLXKiUMCyhUlxvRRza5B1/NnLl5yU/pT6nW42y7igBPk402ZRCThMZFTgxYZYHmy+6m+BuaDNj9JnhmMV7/dTZWNOIYF70F900x+9cwKTyHDPRgo9yJUTmv/Op+V/UD1q/PAt6jCAAHnz7uHGgzyG4cA0s9u25hXa5bCcd4BJrjvhf23lxZnuyupaQgrSgQLxDWhED/mAXrnSO3npFUh/qr79X4AKIby17LVC7XOqE2yagw1NPU+uU2V7f5fl/GsHPb89lyUklVcbpg15NgYTDeQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(36860700001)(4744005)(316002)(6512007)(36756003)(26005)(33656002)(53546011)(8676002)(4326008)(81166007)(6506007)(70586007)(356005)(41300700001)(86362001)(70206006)(82310400005)(82740400003)(83380400001)(186003)(6862004)(8936002)(5660300002)(40460700003)(6486002)(47076005)(336012)(2616005)(40480700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:29:13.0545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5028074e-aa43-4fb4-7e68-08daa0731f2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171090

On 19 Sep 2022, at 07:44, Yanxinkuan.FNST via lists.openembedded.org <yanxk=
.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
> +do_compile_ptest() {
> +     install -d ${B}/Test/
> +     install ${S}/Test/timetest ${B}/Test/timetest
> +     sed -i "6,8d" ${B}/Test/timetest
> +}

This sed expression is incredibly fragile.  If timetest changes in the slig=
htest way the sed will continue to delete lines, and who knows what will ha=
ppen.

If the test script needs changing, please patch it.

Ross=

