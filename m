Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4297FC6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:14:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web08.8975.1664273654298123341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=VCQTBSho;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bZvPs5sut3i9FP4s2UKY9Yy6B6AvZ2gyo+vjdx+QbQ4lpORNs24I/m35Gm0F4MVb7TWHmmK/cxWkpljQVb5tP+26aqi6FONFU8md+dkLo8XkLk0BvSQZng1wTXvzUl0r8sm1HH5wlYKsn4KiZ2SLniYkd1uUsQIl9W8JRvm7YlUbYPJrAyFojaKiO+M9IhtJlBxl7lZKniOaxgNsp0h7jHYdS9ATgR0rIgWOr2l48anBAlsMO9ClbdjGC7EwrWzvPvJ0Sk2pM+jbCnZY/cpDhsM5dykCWCvfdn7qI40yOg8O5S2/BBO4wu8uc9guc1Kze68fLo81w+aa8FhWsRQEkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WAzKBjavvpViRB+reZ4Myc6kcmAizYsKOKs8zMccoU=;
 b=GO+QE9qVAFnQYaYfzWoI8GRQCnoxS+iAXBKHnrYupXUpeOCr9iRFZ7cjZqEqnVFZjJ+QYQYFfXEBOYLSOhp4gJgqtu3Q76UnxYtkHj66FDmbs5NUFrxHppz6RWnaXW4LQTOW8wXR45ZP+Cu7ly27HO+Mq6o9ji0bNhIA90/mLDOUWG1AO6klM67qiFamtYgzA2LWVOkeYqNFhYiZN+eu5C6BfR7tvMhrB5FK0T3x3SxDdtCL3LPPMYxG5mRVtCXmj86LWO5FspwUm/ZrQwbaIf2JGCpHrVK/YHEhm1JjIOeGNf8cQdSJ2w9ncvV9ov5DiNxORStuUSPDxmfliJl1rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WAzKBjavvpViRB+reZ4Myc6kcmAizYsKOKs8zMccoU=;
 b=VCQTBShoYplny8ZIZdrOCFcqRTLrPg0r5fygRvBEaQJljeoFAMnNSazmFvEjtQS5PXCV5+VYZ3+Pl97CkG567NV666t7JRfKnV8nLDvDCTOygWPihVq0d2fCdGZJF7guUliDSAWxjfPPTYoxqAOVtARlI7GziOLJeLNDN+ncmaM=
Received: from AS8PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::24)
 by PAWPR08MB9638.eurprd08.prod.outlook.com (2603:10a6:102:2ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 10:14:10 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::3d) by AS8PR04CA0199.outlook.office365.com
 (2603:10a6:20b:2f3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 10:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:14:09 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Tue, 27 Sep 2022 10:14:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3b1c0d1c3439ccd
X-CR-MTA-TID: 64aa7808
Received: from 4bdc27f76bfc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE1598D9-DFF1-4A23-ABC6-6823DE489ADF.1;
	Tue, 27 Sep 2022 10:14:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4bdc27f76bfc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Sep 2022 10:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edGbQBtu63kGdeU+GjptKwxVEmx1lYtGRz15+vz/Hhn1HKH0ciDfteyMAKT5e5WAdLDd0DP1q86VW+ixCSG8rQTSS2pjWQ6qHF7zh1u4oRLlbrTtAviHcWG7GeClijp/PrkfMmja4rX0cez+fAO6aaEEHHBdCJxWaksd9VL+v0FlBrEZd6DdGfEN7Rv+2nv/NFsr4z+2f4QAjDZiz01b4yvqHx0Yuw/eP5Lby7xvJW35tz4Blb3+3Ijikj7uq0VnSCYADA1N0SdpDXpQS0kSuAMP0tbWJ27lvRTcd6RyAonuA+tF/Bf8LQ5+E7/5S0Ijm+6xLey/UNcEau2HPmgw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WAzKBjavvpViRB+reZ4Myc6kcmAizYsKOKs8zMccoU=;
 b=Q9T5MXWK+G80HsfnE5LEWdGOtuaqsw49nb5dOzfhMyzfNKSpDKilY6vya17Plsclf+xfhTTzxHfeMH/u4L8t2ecZWzKzbPgVQCKCbi7kxvsvi8eQTskhFesJDIhB9kWcd68UO1656Atwawg05Wh7xERB3wXb33HzZ/y8BMbw950jKPPqxyf6FEvEaGyRDnrJ0q9LBxMlAWzR+v/l5wz2xuBZjVy7+XvIPfT+yIl1tvM1Yy5yWd0Vr/LtBBVuuaPEmvN2oWebFOVco2G47AIp0TEymRMx+aU7IGJdouE6trjrctZ01uzzc7HqoFLaBSMrOl31Zxm+HVeE+FfdOPvMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WAzKBjavvpViRB+reZ4Myc6kcmAizYsKOKs8zMccoU=;
 b=VCQTBShoYplny8ZIZdrOCFcqRTLrPg0r5fygRvBEaQJljeoFAMnNSazmFvEjtQS5PXCV5+VYZ3+Pl97CkG567NV666t7JRfKnV8nLDvDCTOygWPihVq0d2fCdGZJF7guUliDSAWxjfPPTYoxqAOVtARlI7GziOLJeLNDN+ncmaM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7914.eurprd08.prod.outlook.com (2603:10a6:150:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 10:13:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 10:13:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "robert_henz@jabil.com" <robert_henz@jabil.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
Thread-Topic: [OE-core] PR to fix WantedBy parsing of systemctl
Thread-Index: AQHYzQWznyTD58gH9ESfGzUBG724QK3o02CAgAk0S32AACCngIAA8TkU
Date: Tue, 27 Sep 2022 10:13:57 +0000
Message-ID: 
 <PA4PR08MB74111DE8594496AE882FAB4EE8559@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <CA+chaQeTobLcWi+LiXDnBo7gCEzg+iSgGOf-_zxyHp3zhZ5_WA@mail.gmail.com>
 <27206.1664221809231976757@lists.openembedded.org>
In-Reply-To: <27206.1664221809231976757@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7914:EE_|AM7EUR03FT045:EE_|PAWPR08MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a77667-b527-4aff-f866-08daa07104bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZMsnHd5Mo5zro+O8n4HS5DtI4elqES6yldl//yMqvEW58ecWifFdoPoXrINgtU1lRsvuPFCuajjHBIQBZ9STmkbXJG4oLfl1O7zwSl8I99O9kGXav3X+Hg9xaq6B4jiphBeed9klQkidut9lDDZ4eYxoGz6NRtKdTJGx9uHjd32m1hUch6ysPQM19TD9qGrQFPMWC3OkRqePGqTFSbehp5QT5oveWJyBpimYpeoKrv7DANmYiDaLa4UCQ6mLEkXyYYxPZH0Xau2vlVhp/arPnS6hNahEG+wslf3aw/b/wQVjUuMCDFucAdo1OvZvhxzrJdLqow/GeKCxuRMyXsoHyksbK/cYqxf34i4XpQ/BuPZRQuRzsjNfdNo5efxQYdnhTt6SapaSjCXBD4zlr4PBBOMe4yuoMHmx3wboYjL5qlPrNipGdtHFgwGqw/2qOPnY+XSZKKGbMn74V9B9u6A56Fr+taqcj9Jj61HTui7CpibCmHei49hPhkew4htsT5iGpXOaIkh1KWJ3NbO7D82kBVInaTS8BAX8LEgEBAWGJM58FLMSZADra2C/zx1+E6ETA7K/fydQtSvtkN7H9HxZ3Hukw2J+BCc+cdSyn/hHqp9ZLrbA2DkMSZpYGzPvQ5SxeqmoYqNIB2yA1/DRZr/3csKXhQtPBqrOHP/UeOijObw5x8nRaXoafOi0wrgBnBKERzV6RblFdWjDs9OeZyD5AGEYUQtI6cKq+PFU2b+tj3/Ckrs+5a1FQXx2ZG+wrZJN/zvnj86u1FzFUs6GFDV/RumvugVn8EYHZEUj7o9yacsJMByXG0gDQ3dtCGtsf/1QItsGG/0lVA7OkxvS9fpeVg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(66946007)(52536014)(8936002)(5660300002)(66556008)(33656002)(66476007)(122000001)(86362001)(2906002)(38070700005)(38100700002)(66446008)(8676002)(55016003)(186003)(6506007)(478600001)(41300700001)(26005)(71200400001)(64756008)(9686003)(83380400001)(76116006)(91956017)(7696005)(316002)(966005)(110136005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB74111DE8594496AE882FAB4EE8559PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7914
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c94b79a2-8428-46d7-fbdb-08daa070fd2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3xo3kqxmI7RN89515fulgRO4LspRUtFb/XlkH8CNdqGC+86j7M3ZLoqP/A0VSBZjyagLDmcV0GNBOaI2DiE1ZDEnTGy4REd9779gU2pNKNhzVqlD0e+FLjKPgFt6axvkA9k+Vfv8FtcHimcCCfMlwSlNvpnuNZ1fE3gWloGsSR3n/EqLkMFaERuk/uq73inkSvVl9Uq8JsZeP+ypSxeW5AOAm3y6pAx7QkNJN6eH9at3YFIlvLo9hY+WvyZ1kC8eH7u4JY7NVxDiv50SeAF0NcJ62Rtfye1KI2KltuhHXt2e7sC68boR7Fxchkh3LujSFA9UPEoE47FbjJWZKUHOYDaPCdfs3LBrw1bJ1LDGHBXCQVhMO98LSq52ZE2XUDNE7cVmnihUXDBiurIKDimK6kzlEzBBRUlNnOlJlH4+V3d6SBl9/G+ACFlKESDAd7t4wtXWFmEP45jlxz9qGMQCPm2YJ1IvItXWdU94S7ho2YGscSE+4+Zj+/CCGuwVHAqJNiGNaX7OG+I6sJA7vXMaSABw6xlyQ6UMO5F2HXYTVwUkd3iiowR468+3tGnyizQ/egObY3P8E9krmRs+61R+1UUYhJoX2/UYzr56RWo2MFAX12BNWWbKmg4cJ/ocgS71eoV7mVe0ltfvTmk190UA6mngjY4BLdCLQfVyCJ8MTWmbXtBUSvxK7pvKXv8Bv+GF/q12z5Z5ME1bBhOGQmKvCHWos+Rf1cFUEb24YmaSWLGKuWaUj3JN8L7xVK4mejNUD8by0qD/ZgMNCGLcfUeEMLIwPoAM6dT3WEMmlXLS/elf9RNhoyvgr17QcV09hJxBP638h4r63+49P5A/2O8Iw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(110136005)(19627235002)(8936002)(52536014)(316002)(86362001)(8676002)(41300700001)(70586007)(70206006)(33656002)(5660300002)(356005)(81166007)(966005)(40460700003)(478600001)(82740400003)(2906002)(82310400005)(6506007)(9686003)(7696005)(26005)(336012)(40480700001)(47076005)(36860700001)(186003)(83380400001)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:14:09.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4a77667-b527-4aff-f866-08daa07104bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171087

--_000_PA4PR08MB74111DE8594496AE882FAB4EE8559PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Just use git-send-email directly, for a simple patch you don=92t need the o=
verhead of create-pull-request.

Ross

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Robert Henz via lists.openembedded.org <robert_=
henz=3Djabil.com@lists.openembedded.org>
Date: Tuesday, 27 September 2022 at 10:53
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
I think I'm missing some context. Not really understanding what this script=
 is trying to accomplish I don't know what "remote branch" is vs "local bra=
nch". Should "remote branch" be "master" and the local branch be the branch=
 with the change I want to make? Here's that script running with "set -x" t=
urned on 1/2 way through...

bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u badge=
r
+ USER_RE=3D[A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?
+ PROTO_RE=3D[a-z][a-z+]*://
+ GIT_RE=3D\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)=
\?\([^:/]*\)[:/]\(.*\)
+ REMOTE_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core
+ echo https://github.com/BadgerTechnologies/openembedded-core
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#\5#
+ REMOTE_REPO=3DBadgerTechnologies/openembedded-core
+ echo https://github.com/BadgerTechnologies/openembedded-core
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#git://\4/\5#
+ REMOTE_URL=3Dgit://github.com/BadgerTechnologies/openembedded-core
+ [ -z  ]
+ git branch
+ grep -e ^\*
+ cut -d  -f2
+ BRANCH=3Dfix-wantedby-clearing
+ echo NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to over=
ride.
NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.
+ [ -z  ]
+ L_BRANCH=3DHEAD
+ echo NOTE: Assuming local branch HEAD, use -l to override.
NOTE: Assuming local branch HEAD, use -l to override.
+ [ 0 -eq 1 ]
+ WEB_URL=3D
+ WEB_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core/tree/fi=
x-wantedby-clearing
+ [ -n https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wan=
tedby-clearing ]
+ [  =3D 1 ]
+ wget --no-check-certificate -q https://github.com/BadgerTechnologies/open=
embedded-core/tree/fix-wantedby-clearing -O /dev/null
+ [ 0 -ne 0 ]
+ [ -e pull-186156 ]
+ mkdir pull-186156
+ [ -n  ]
+ git format-patch -M40 --subject-prefix=3DPATCH -n -o pull-186156 --thread=
=3Dshallow --cover-letter master..HEAD
+ ls -A pull-186156
+ [ -z 0000-cover-letter.patch
0001-Fix-WantedBy-processing.patch ]
+ [ -n  ]
+ echo pull-186156/0000-cover-letter.patch
+ CL=3Dpull-186156/0000-cover-letter.patch
+ PM=3Dpull-186156/pull-msg
+ + trgit -d --version
 [:alpha:][:space:].
+ sed s/\(...\).*/\1/
+ git version 2.25.1
+ GIT_VERSION=3D225
+ NEWER_GIT_VERSION=3D210
+ [ 225 -lt 210 ]
+ git request-pull master git://github.com/BadgerTechnologies/openembedded-=
core HEAD:fix-wantedby-clearing
fatal: unable to connect to github.com:
github.com[0: 140.82.113.3]: errno=3DConnection timed out

warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at=
 git://github.com/BadgerTechnologies/openembedded-core
warn: Are you sure you pushed 'fix-wantedby-clearing' there?
+ [ 1 -ne 0 ]
+ echo ERROR: git request-pull reported an error
ERROR: git request-pull reported an error
+ rm -rf pull-186156
+ exit 1

--_000_PA4PR08MB74111DE8594496AE882FAB4EE8559PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Just use git-send-email directly, for a simple patch you don=92t ne=
ed the overhead of create-pull-request.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on b=
ehalf of Robert Henz via lists.openembedded.org &lt;robert_henz=3Djabil.com=
@lists.openembedded.org&gt;<br>
<b>Date: </b>Tuesday, 27 September 2022 at 10:53<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [OE-core] PR to fix WantedBy parsing of systemctl<o:p><=
/o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I think I'm missing=
 some context. Not really understanding what this script is trying to accom=
plish I don't know what &quot;remote branch&quot; is vs &quot;local branch&=
quot;. Should &quot;remote branch&quot; be &quot;master&quot; and the local
 branch be the branch with the change I want to make? Here's that script ru=
nning with &quot;set -x&quot; turned on 1/2 way through...<br>
<br>
bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u badge=
r<br>
+ USER_RE=3D[A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?<br>
+ PROTO_RE=3D[a-z][a-z+]*://<br>
+ GIT_RE=3D\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)=
\?\([^:/]*\)[:/]\(.*\)<br>
+ REMOTE_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core<br>
+ echo https://github.com/BadgerTechnologies/openembedded-core<br>
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#\5#<br>
+ REMOTE_REPO=3DBadgerTechnologies/openembedded-core<br>
+ echo https://github.com/BadgerTechnologies/openembedded-core<br>
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#git://\4/\5#<br>
+ REMOTE_URL=3Dgit://github.com/BadgerTechnologies/openembedded-core<br>
+ [ -z&nbsp; ]<br>
+ git branch<br>
+ grep -e ^\* <br>
+ cut -d&nbsp; -f2<br>
+ BRANCH=3Dfix-wantedby-clearing<br>
+ echo NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to over=
ride.<br>
NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.<b=
r>
+ [ -z&nbsp; ]<br>
+ L_BRANCH=3DHEAD<br>
+ echo NOTE: Assuming local branch HEAD, use -l to override.<br>
NOTE: Assuming local branch HEAD, use -l to override.<br>
+ [ 0 -eq 1 ]<br>
+ WEB_URL=3D<br>
+ WEB_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core/tree/fi=
x-wantedby-clearing<br>
+ [ -n https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wan=
tedby-clearing ]<br>
+ [&nbsp; =3D 1 ]<br>
+ wget --no-check-certificate -q https://github.com/BadgerTechnologies/open=
embedded-core/tree/fix-wantedby-clearing -O /dev/null<br>
+ [ 0 -ne 0 ]<br>
+ [ -e pull-186156 ]<br>
+ mkdir pull-186156<br>
+ [ -n&nbsp; ]<br>
+ git format-patch -M40 --subject-prefix=3DPATCH -n -o pull-186156 --thread=
=3Dshallow --cover-letter master..HEAD<br>
+ ls -A pull-186156<br>
+ [ -z 0000-cover-letter.patch<br>
0001-Fix-WantedBy-processing.patch ]<br>
+ [ -n&nbsp; ]<br>
+ echo pull-186156/0000-cover-letter.patch<br>
+ CL=3Dpull-186156/0000-cover-letter.patch<br>
+ PM=3Dpull-186156/pull-msg<br>
+ + trgit -d --version<br>
&nbsp;[:alpha:][:space:].<br>
+ sed s/\(...\).*/\1/<br>
+ git version 2.25.1<br>
+ GIT_VERSION=3D225<br>
+ NEWER_GIT_VERSION=3D210<br>
+ [ 225 -lt 210 ]<br>
+ git request-pull master git://github.com/BadgerTechnologies/openembedded-=
core HEAD:fix-wantedby-clearing<br>
fatal: unable to connect to github.com:<br>
github.com[0: 140.82.113.3]: errno=3DConnection timed out<br>
<br>
warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at=
 git://github.com/BadgerTechnologies/openembedded-core<br>
warn: Are you sure you pushed 'fix-wantedby-clearing' there?<br>
+ [ 1 -ne 0 ]<br>
+ echo ERROR: git request-pull reported an error<br>
ERROR: git request-pull reported an error<br>
+ rm -rf pull-186156<br>
+ exit 1 <o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PA4PR08MB74111DE8594496AE882FAB4EE8559PA4PR08MB7411eurp_--

