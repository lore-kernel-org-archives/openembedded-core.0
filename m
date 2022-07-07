Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BE6C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 11:29:24 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.49])
 by mx.groups.io with SMTP id smtpd.web08.4426.1657193358392026424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 04:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=EkOuYbN9;
 spf=pass (domain: arm.com, ip: 40.107.0.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C6p2XtO+vgB9kJq9jAwXSVo2Jlh6UAHRuV96WwM6ZO8q666rM1ZKDrHfj2uqLFWVuuBGzJ4ubORG3T74RgCQzouKRy+UPNdq9W2KLIRJosFN6kfkWyCyscKnA6PE87EFQ9GnNmpsGL0SyEedOhhCTshYt6HpuNZOQTcXgnqmQg1DiU0nCh38PqN5nrICqeS1ERptv7WyCvlu2mmA1vy+rzD8W7IETxWZ7Yncvl9Y4VWCp2IPohRH2ml4f3tH7Q+43iMrBUAUd7SkaEUe5BkQMQt96cxWOGiroSdewILNNNdRq3plVydckjjp8Aao6tyQ3bLt2o2kUgLxzUSCfedDcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFbjRAHsO37qFGpjuHV8uB4V2lMwCp2MB1XIbUDlsRQ=;
 b=ImSU4fTBNi9DIZ5cwwxOr1SVzq6lcOZaFAg4/HmxoX3FXTscQ6MFdrivSWk3cFQm+ay6TtyMB7miEw0WOcbOsjPumLbvIKBzrO9mcmiriLtutRNqi7eRM6lnuOw60tbKPsFXbGAH5Z+xzSOUukmWMn6HlM1c5Q2kDAeMfN6pZbNJJQRqoYUwrX+USdJLC0YElHhlYLDdjJdQH/XGK+PWRw/D+tcPbBfc71iaMkg0KyAqW6VA3B86ZkD+IKF5ThDx48xDEy6O8YJpuhxTSntSLdMc7rOBebg/wwZKqi22xh0vTYqlXnUrBNkCz/LroOBnkdVK89mkMYBWSSGTB2C+Lw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFbjRAHsO37qFGpjuHV8uB4V2lMwCp2MB1XIbUDlsRQ=;
 b=EkOuYbN9NbBcq6MY5vHqxpnabO0gPFjxsodVk3qvt2tvojYM+PEjUJ4XQNHtkWQvPVhEJQva1IEQpaiVeUqxMdVVmdGJdW7RDuFpiyfn0zSfcKlv0f6wBWnx1WzYmVLDRFkFOGBjXzvgMSrCagKo1ykQaC1HSzfmkniI82cEM2s=
Received: from DU2PR04CA0334.eurprd04.prod.outlook.com (2603:10a6:10:2b4::24)
 by DB7PR08MB3900.eurprd08.prod.outlook.com (2603:10a6:10:33::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 11:29:06 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::8) by DU2PR04CA0334.outlook.office365.com
 (2603:10a6:10:2b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Thu, 7 Jul 2022 11:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 11:29:06 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Thu, 07 Jul 2022 11:29:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adcff22fe629d695
X-CR-MTA-TID: 64aa7808
Received: from 8ed9d5b5fed6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 691FC34E-643B-4B14-BF22-63E79AAF38B3.1;
	Thu, 07 Jul 2022 11:28:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8ed9d5b5fed6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Jul 2022 11:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmtcI5U+J5Lf1j5vCpsFuK622UeCdH2epNWjeMpjQFeW4ybGJPCwiIl8HfqmmgEzesbu/EKuJlmH8psiVNtlTjRpi9MM7XCtVkRWwRs0zUEvyYlX65YNjARfEErenxGxbff07y7j5gklO8w/ABmA+MyOkoppppWGp9D5DTcaKU98Giml/f+Dr2fWFq4RhsapoCO1UeO/rsCzo7Rpw8f2hRS0vl1jTVclfdIirESyATPXQeomg4rk8Tw1Tn8tSv1sjd+HJSbq6ssT47nVsv64q/6U1T/Wsl04/VWc0EyHyWjWK151ZyZ/8M4wJLW4tFKsSvgBC8UtFc3pcIvEUeEBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFbjRAHsO37qFGpjuHV8uB4V2lMwCp2MB1XIbUDlsRQ=;
 b=cUPkxAlm8Ss+gfRaH7iFRk6JNaIr8d45Jiask+ZYMrwXjyEX45ms7DgQb73o7tKxU/19ulwwqhQuhBmnwNnyjDwB3O5mrVrwWQctddgxkIhSB0fSmtOgfDH9PFvhehMzdyr5330RepWToiqKpBnKI53vnTHl208RpEIJ7RhKYmlvadXtCsw6B34G7RE9ubnGyFD99RH3nGVO7ia2go2f4AjyA78rwEx4S91VBDalMP5E3kQsqbngRkXpAcxRUba7EaUE7W+pjaWU6SKhS7TeDNNkbcCEUss+3fP/ykRz3pc/mWdwKQqERmswXTrptY4TPuItwstxVvsqmyN+qmDtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFbjRAHsO37qFGpjuHV8uB4V2lMwCp2MB1XIbUDlsRQ=;
 b=EkOuYbN9NbBcq6MY5vHqxpnabO0gPFjxsodVk3qvt2tvojYM+PEjUJ4XQNHtkWQvPVhEJQva1IEQpaiVeUqxMdVVmdGJdW7RDuFpiyfn0zSfcKlv0f6wBWnx1WzYmVLDRFkFOGBjXzvgMSrCagKo1ykQaC1HSzfmkniI82cEM2s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB3159.eurprd08.prod.outlook.com (2603:10a6:209:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 11:28:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 11:28:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
Thread-Topic: [OE-core] Build paths/reproduibility issues in master - help
 requested
Thread-Index: AQHYkVcFPD8XM+zhqEeSNjIXsqv5f61ywr6AgAAED4A=
Date: Thu, 7 Jul 2022 11:28:56 +0000
Message-ID: <8877617E-E758-4948-9BF3-730FBB36E74A@arm.com>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <16FEA3B3CA900B93.1980@lists.openembedded.org>
 <16FEBD90A08F81A5.1980@lists.openembedded.org>
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2de9dd80-ff6f-46d6-5053-08da600be72d
x-ms-traffictypediagnostic: 
	AM6PR08MB3159:EE_|DBAEUR03FT060:EE_|DB7PR08MB3900:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lnqJAYMW6lJcjreDtwTDPDWaLqN+ei6bM2J/rju1KZYXlB0y51J9Jo2MsyIf5rSBW5pNNbVspkPcSTktBpDsn9AKhYi5zX92GbtSpjQzmJlYm+SzPNK9MB3uHGYQiYdGdg+KBeXLFTah+K2WYA6xUz0ysOsypjR8xJmtZjJYAc9jaibOJ9a2SQZGmDAI/xIm6ANf+YfdtLHjjkv9gN57OiEmRyN6lpIXyixu3LSc7BWGo9Yy3OLGQoyEd3h2PfUpcBojz04ToLhtgRnQTio2Woo4B1ApWZqCA2KVIPLM+hJkfoNhOf4l785d2YA9+juOdB2/SSBXk3IIEA+BeX1PT5yWIxYaAw6Ji2M84RRgzYeSR5siD7c6cc595LWo8atXNeNUoQubmjAPTqLLrX+oQB+nA5DOUHV8GIVhw69xGCvqaqJxBHbjnBHoZuoT6h9On48h71uX00liLb/OIGlQrWH1CQ/c//Uu2z/7h0ecjFhrXKasABycJRyOIHMmWh+scp8CggyYPUVYtfCL6Zjbuj9gSDFvYjGkuZlR8suynSqI3kCWRM9hEITOC/W6/yqNbt0OjUMZR0lHKLWRPvd2ZUCsvHwAZSw9bwHjQyK3a8SH+BJBpKHVNNzCssYxtvtuFkiw5JfYnDmSjeYy+AcMRWv0JGrKZ/z2leOk9/ezLibniRKX7UbaH7KtwvbXMUeBLpGdxBfr2ML3TKjh9puzxL2da4ao+XPb1rvZlwVu22IzVsv45bYuFpZvsBUEu0QHBcr5KW3q05z7Dirq5cEu3QKkKz4NntgGziiO91w9VOhg0asarDz++D8EPPl9VoK+vIVQtfPLFhFg4bcHCbNmu+J3M3Lw9v4i4yYpPXLsEIgY34WnyBeChwvInzfH0HiJ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(8936002)(66556008)(38070700005)(2906002)(33656002)(8676002)(64756008)(122000001)(86362001)(6486002)(966005)(6512007)(4326008)(66476007)(2616005)(5660300002)(66946007)(66446008)(71200400001)(53546011)(76116006)(91956017)(26005)(186003)(316002)(38100700002)(6916009)(54906003)(83380400001)(41300700001)(36756003)(6506007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F396BC9D0220FC4D929FB3F8F4232E50@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3159
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	940ad58b-6039-4578-b9f4-08da600be148
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XAExYOFYyoRy1McB8AyGpePSkxgcPBlB2jLPcGSZiCmw54vKEd7cXw4kZWCjsDrdjU2siPir9CAIckfpLLow5J0zI4DWp6BYSL65gBl3H/PaDKJkcT+lEZ1whsCqrSptW0XzFZ7j/LY+Wxdz61LL8F59hkHMljb6QYIr6TnB6mbLXZlOwnpm5Gkpik81lRchg/lgVfQz21uxOnQ5BBtH8b5r/8ok8E87dHnyhvECW1mlCrIj6ipo6FFN7jFK0OY8xb4l1XoP6pm6wtiHtVssVYo0BCW+a7x8w0m+NEymVdnNkadPRqH9/4C4O0DueHlVr9GwWh3LRqJuU9fASz4x/mOTKu5QyGxeVWeLlZL1WTOUHDin0QHZcWS2WB7bGTLEd0M5b/YrdrvjOeA7/8v48BkoalvTpvPa8cqXzYLduAmDQux4YtWv691BKKwEgESi/B3vSQgi8wcEkhIjIeoirYjnklkl+xx6n5XmJOfxzPfL5jRwPO7YppbT4FA7ElhpLGkp67Mv3gV9+Ni20DKSUyqeqtJieIGYgcJ0pvdYvfcrRoIhFNLmWu6W312W3Uyi9FUv2MPPDpo1AhMVulaM58w872QL3FfZ1hYP8gcoD8KrkPGxovFzRoqxtf3CClOoEGNaVIfrRpA/nIJkuXXtWVghb9Qy/cNyeTeiZk0nSLDn3l/4YjVki61z7VBlaivgjlbWVt/sOAbmfw4RUcZ9/ATv37Z4HQmkiLkWtx2jRXZ/4dcxmUeFYoQ0X5fcsx01bJCRIdyz0dbOeFdlgv1kUrtfpfhO8ds6i81PpE38GiAzVHMR8/RKG6F7qZ/g06EB4HMyhW9qQAZJxpgiPC0Gmqzzm36kFr8PgccxD2zQSTc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(26005)(6506007)(53546011)(36756003)(4326008)(6512007)(33656002)(86362001)(54906003)(40460700003)(316002)(40480700001)(81166007)(82310400005)(966005)(6486002)(478600001)(41300700001)(336012)(47076005)(2906002)(5660300002)(186003)(83380400001)(2616005)(8936002)(6862004)(70206006)(70586007)(356005)(8676002)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:29:06.5603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2de9dd80-ff6f-46d6-5053-08da600be72d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 11:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167771

On 7 Jul 2022, at 12:14, Alex Kiernan via lists.openembedded.org <alex.kier=
nan=3Dgmail.com@lists.openembedded.org> wrote:
>>>> meta-gplv2 issue:
>>>> stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libex=
ec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [b=
uildpaths]
>>>> stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/deb=
ug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to =
TMPDIR
>>
>> This may be the end of meta-gplv2 since nobody cares.
>>
>
> Much as I'd rather this just wasn't necessary, I'm taking a look.

Is this an admittance that you use meta-gplv2?  Do you have an opinion on t=
his thread?

https://lists.openembedded.org/g/openembedded-architecture/message/1566

Cheers,
Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

