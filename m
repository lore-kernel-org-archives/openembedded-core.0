Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94EEC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:47:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web11.5897.1665064031204209105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=qje/9DLH;
 spf=pass (domain: arm.com, ip: 40.107.21.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dNT20xtgOF98wfAqowUXaOuwojJP9vYKg0VzmdZr9M3f3QQgC4rzX6ixToOO5B9BeJiENkHvEda9ql6dxbu8dBCN5/rYqfEKCVzIiRiDvXCQuaraq/YkF4VwrxCeaaiHAm3vSUH+1/fpmYliw1eIOU+tKYnXXVPrrJLf/3lzL59mM3Da1FR6JcbgoeuylltzZ9gatxTgOhxeCXoyhn3mJKVziVhMprcARk38+5BU63MxFCsd+HN1x/DYOKz3s4dyOI9JUL60VRQJyX89LkbXjPUUarDM4YhA/oXpEUZX0h2rNqtduFCHSYU4HOm0ljAJGiW+zKPunnXmnWE0QZD8eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61YiIs95aU+oE7ucbCcUaE+eZr6U9TYX/XGQ3EYaL0c=;
 b=CBFkNrsOungxgf+dq6vniEOxygovv4k9LW/6QV3FObW64o9TwgfCFTauCXW1pP5RG1CcBGKzavwx1/KnSqVa7U90MDKsbuHRT8lbf7an5+6SsW2oPM8VBqvNxwbd+C3YuWw2VDO3eugBJ6BziBs4OSJtoZj/Zp+yNPnEAjZfyPZ7IDZDFLM5nJJKM/Xt5Hys4LdnrXR85kSIdkcPg2rBTx7jStrYxc3E79to/yuiffqU7GqLpIFU/HmewijwHTK4ssrje+Y2drvalcOxvUgilgzMx+PSa7X9+e81a4QyWL2tqonhYR0jnYn8i1b/QF4kJhmEdvjs9EQRShlAD8X99Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61YiIs95aU+oE7ucbCcUaE+eZr6U9TYX/XGQ3EYaL0c=;
 b=qje/9DLHkiwFv21fkweJX6gY2A9LcRBo/6yU6QTH547p6Uj1CCsV8aaap1wLztXE94pQ2C62LPj0A/4A7vB+ZlFCadIg66HWMQr/Ni5PuKhkAfjsCmyAw2xZaARWVhiFfzUlj+AFFc0Mn+hdHoozSmdTKBmGb26rTxBc9qB9kcs=
Received: from AS9PR06CA0571.eurprd06.prod.outlook.com (2603:10a6:20b:486::13)
 by DB9PR08MB6522.eurprd08.prod.outlook.com (2603:10a6:10:250::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 13:47:02 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::e6) by AS9PR06CA0571.outlook.office365.com
 (2603:10a6:20b:486::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Thu, 6 Oct 2022 13:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 13:47:01 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 06 Oct 2022 13:47:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcf07e22114eaf3e
X-CR-MTA-TID: 64aa7808
Received: from 400cc9e52af9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3CABC2D-A696-4084-BAB9-59C94CFEC1AE.1;
	Thu, 06 Oct 2022 13:46:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 400cc9e52af9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 13:46:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnnwymynNOdH4I84srQIueAE3yT7IBkrMqQzbNZooM5AJhZ155kfGE2SpxmXziQgquCnQzdnFSTzyj03PTW1QpFIWwCZT0DKQr3rfgKX0NY6fAI8Ry99Ce+vYlPh99fxJJ3GcSPAiTMIRLgZtbgyMgXqgNeSuFVis3wYjYFaWk+x6d7N7ydKQkmyskTAInaNjevcaw6XWMO5d7hz6TdJCgR3xFqPbfXvEOgsx1ZA70vdNsgBCKpyLM3XI9IZkaD1jx+9rwtiE1n4juySW7zYowgaECQcwXoMLYUJkJMqbJB2ld/7SRjYP5BfoC6Rvtizj/IX+CZAGjxnq1mZnCM1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61YiIs95aU+oE7ucbCcUaE+eZr6U9TYX/XGQ3EYaL0c=;
 b=ljHsl/6zU1cVJqN8eZeLS2xSSin/pAaMXAh7nA0HEZsnPOBg1ytUyRbaH2zEwcOlyDUcBVJ35Pc3E5H2f+/CDsIuytA2cDfnjNwI0DidL2yy+JABwsxgaTUA/jtWVTYJX2pln4OOjuQ2DeS/ZgEe1FBvwHwCJohhWZ1kXqv0x+IIWOz6luVgK2NQQKlFm4y2wKKp+zYHOM//1E6F34YgVEIhc8k9Ssn/SFNRHkSk8sn2IKGu71bWt3V6SQE8Ts5YMZ2ETUzdHME84abmqe+jZsylJnJyI+QYdbmViJ7bM2I363SkFMOaZ1WeHFWrgUsouwW5+CtCVhNVfD0HzjWUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61YiIs95aU+oE7ucbCcUaE+eZr6U9TYX/XGQ3EYaL0c=;
 b=qje/9DLHkiwFv21fkweJX6gY2A9LcRBo/6yU6QTH547p6Uj1CCsV8aaap1wLztXE94pQ2C62LPj0A/4A7vB+ZlFCadIg66HWMQr/Ni5PuKhkAfjsCmyAw2xZaARWVhiFfzUlj+AFFc0Mn+hdHoozSmdTKBmGb26rTxBc9qB9kcs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 13:46:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 13:46:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "philippe.coval@astrolabe.coop" <philippe.coval@astrolabe.coop>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"philippe.coval.pro+meta-zephyr-lists.yoctoproject.org@gmail.com"
	<philippe.coval.pro+meta-zephyr-lists.yoctoproject.org@gmail.com>, Philippe
 Coval <philippe.coval.ext@huawei.com>, Jon Mason <Jon.Mason@arm.com>, Naveen
 Saini <naveen.kumar.saini@intel.com>
Subject: Re: [OE-core] [meta-zephyr][kirkstone][PATCH]
 nrf52840-mdk-usb-dongle.conf: Add new machine from makerdiary
Thread-Topic: [OE-core] [meta-zephyr][kirkstone][PATCH]
 nrf52840-mdk-usb-dongle.conf: Add new machine from makerdiary
Thread-Index: AQHY2YbeWf6dz4DiuEGC81v1dIOOi64BYR0A
Date: Thu, 6 Oct 2022 13:46:51 +0000
Message-ID: <5A0B8CE5-C025-48A3-A0C5-534C698A0102@arm.com>
References: <20221006132305.1318163-1-philippe.coval@astrolabe.coop>
In-Reply-To: <20221006132305.1318163-1-philippe.coval@astrolabe.coop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6025:EE_|VE1EUR03FT009:EE_|DB9PR08MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: a090866a-e05f-4a64-98b6-08daa7a13f0b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jeFygZ4V31IIH2p76wwBlrfYnkIk2mIN5jb1w6esJlnSC00/qTp32xmSScPkq/JZYLiMF+Hpz7h4E2tiQh0VCNxgpADfbS/d1t8DpsnQgqC6KlOP/y8zzK/SLkqajFQ4I+j28Jd8LsLqob71rtz7tbfRaV/Tj73WVvA4or2Nq29FrohDY2M5WIXWTdMenUieTOdJfiIkWn7eRUZr3lkdF02VxjoqnmHJ7J3jeIeV4wadIqQE+k2KcdZ39vEde87FOKYV+UU/MBpJn4x8OipRWyDJp6kdDloIowLtFWbDl+G8cPVt0LLxgBC9cHsHjeVFVFhujyuLAEIQGUYckNPXNXmsUZrntAl/GVitNLadIKP5JpIDITO3UdgExmxFwQWijz8+Sm3z0ZZU/mswD4ABwV1BTFj1zUavDzxd254RUBsAwfsvrCeLGEbooElDBEZXJAhIpAuWzf/i7xOj6TrY8He9UcHJDvnW88vmTBWZy3fMBN72pIj+v5Lb4Ho59vqKyhUzwYB1KgROGHUncc+CdfRKVBirRAogq9D8x/yF2tUPDmI3bdiTZWpCy1ydF3Lu7dbVvmlerCAgyQrqx5knCgk14huPYU6X5vgf2Aaefw9Rk3d8Pkd5arH0teViwGcuPNE/OdVCGXhxRNIdyl1ds42QChIFa6cvjylngWzErha1dMKkLPevTWYZFOigH4SR44twsvXXriVReUj5XggVnNOP71xtQE+oJ+lUHRzyWm1bMgpSAzGtuKR4t2R0cKVyFonRmMjQ3I52Q9fSRBvzSvAIreFCU6lHQ4eK7654PJ/CvLEXOnjhk383Cc6CFj6TzhokkZDFFl5qiQd9EqDMHQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(66899015)(91956017)(76116006)(8936002)(66946007)(5660300002)(66446008)(33656002)(66556008)(8676002)(66476007)(64756008)(4326008)(316002)(478600001)(6486002)(6916009)(41300700001)(54906003)(36756003)(38100700002)(71200400001)(966005)(2906002)(6506007)(53546011)(186003)(86362001)(2616005)(26005)(122000001)(6512007)(38070700005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <437A510FCAAA4E4FA42B2A88C9E51DB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d5cfb133-c878-4d3a-2245-08daa7a138f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NSTJexCY5B95irdXPhudkR4GHHrIPlLX2Ph4ERVNN3q+4Q5RgNKT+m1gN4hp5HXvf306HT5qlT1jSWAkGJgIT0k/GhYYRe6UAGncIcxqIZ00KT6WynhO+oP9pwjhhVUoTTYrDKYbvBrZBcAuJXWJrdcc2Rh86ngALHRC8j/G4ocvJbr46dKB1OEE4X9yzn7PTuXImkrENQdP+R/oEj8x/T0FtoSyJQxKrveSTFTBnLrV31tDnFM8h3/DEgljmahR54DBhGVyhxW6psoNfa7Y+/P5G6BU3LFz7TUyEjCF1LPtn+FYN0dmug2hjYmcOjmeC/vTAQexoyIw7lNH1gYAZpMxg/lqJP88Ml5Xf9FxpwTD8MuhHGa6phvh6BIJrPda+oXthwQ1UUJ/Q+/YH8Roir5ROU1I3M8m3CeXPLegDq6y6nKZoeEO92hFGATia2Y1rbsdjvYXmFeHfXHszt6oZjPOv/j6pRQJaEm0KaepdVn7rThh4SX2C5tMRpMz6jLXYUwAzqvuMq0knj5EysmAYT9z8A9f3Iln1GUOl79mgFagFM8Om9CgwcUVX/27c3QkKJYlWCs60oLf1RbFullPovOrm/EMDM3ebfbv+OXUcwF2mE3OArpZep4Feee15OsqOzdA62/pu8KKYLPan3P0PSWqiQ/tZKf/MQa9OXBMenl2VFzHxhkFdjfydTiKDLE8cDF1AzZjXP1g2GISePRGDOFotXE1pIO2CIYHrGSa8dqNHNUEr+jjBiNjr6TKMan0MEwSHSfE5t1L4z0SYk7ii5VOzLbvXV6BTY3wrB6IBiQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(107886003)(336012)(4326008)(26005)(6512007)(316002)(54906003)(33656002)(70206006)(186003)(47076005)(36756003)(2616005)(6506007)(2906002)(83380400001)(356005)(5660300002)(70586007)(6862004)(8936002)(82740400003)(41300700001)(81166007)(86362001)(8676002)(40460700003)(40480700001)(6486002)(966005)(82310400005)(66899015)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:47:01.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a090866a-e05f-4a64-98b6-08daa7a13f0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:47:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171506

This should go to yocto@lists.yoctoproject.org, not oe-core.

Cheers,
Ross

> On 6 Oct 2022, at 14:23, philippe.coval@astrolabe.coop via lists.openembe=
dded.org <philippe.coval=3Dastrolabe.coop@lists.openembedded.org> wrote:
>=20
> From: Philippe Coval <philippe.coval@astrolabe.coop>
>=20
> It was tested with zephyr-openthread-rcp
> along Oniro's IoT gateway blueprint
>=20
> For the record deployment was done manually:
>=20
> - Click on device button
> - uf2conv.py "zephyr.hex" -c -f 0xADA52840
> - and then copy to mounted "/dev/disk/by-label/MDK-DONGLE"
>=20
> Support of unfree flashing tools might be added later (once double verifi=
ed)
>=20
> Forwarded: https://lists.yoctoproject.org/g/yocto/message/58142
> Relate-to: https://gitlab.eclipse.org/eclipse/oniro-blueprints/transparen=
t-gateway/meta-oniro-blueprints-gateway/-/issues/6
> Relate-to: https://wiki.makerdiary.com/nrf52840-mdk/zephyr/
> Relate-to: https://gitlab.eclipse.org/pcoval/oniro-presentations/-/wikis/=
openthread
> Signed-off-by: Philippe Coval <philippe.coval@astrolabe.coop>
> Signed-off-by: Philippe Coval <philippe.coval.ext@huawei.com>
> Tested-by: Jon Mason <jon.mason@arm.com>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
> meta-zephyr-bsp/conf/machine/nrf52840-mdk-usb-dongle.conf | 7 +++++++
> 1 file changed, 7 insertions(+)
> create mode 100644 meta-zephyr-bsp/conf/machine/nrf52840-mdk-usb-dongle.c=
onf
>=20
> diff --git a/meta-zephyr-bsp/conf/machine/nrf52840-mdk-usb-dongle.conf b/=
meta-zephyr-bsp/conf/machine/nrf52840-mdk-usb-dongle.conf
> new file mode 100644
> index 0000000..67e407a
> --- /dev/null
> +++ b/meta-zephyr-bsp/conf/machine/nrf52840-mdk-usb-dongle.conf
> @@ -0,0 +1,7 @@
> +#@TYPE: Machine
> +#@NAME: nrf52840-mdk-usb-dongle
> +
> +#@DESCRIPTION: Machine configuration for makerdiary's nrf52840-mdk-usb-d=
ongle
> +
> +require conf/machine/include/nrf52.inc
> +ARCH:nrf52840-mdk-usb-dongle =3D "arm"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171500): https://lists.openembedded.org/g/openembedde=
d-core/message/171500
> Mute This Topic: https://lists.openembedded.org/mt/94157183/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


