Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B86C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 16:14:41 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web08.1015.1665072872684880667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 09:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=b8lwLTCB;
 spf=pass (domain: arm.com, ip: 40.107.15.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MS+2LhkObDJVZ7lrQyriznXg63ejew+Dfwaz8OCOW69H/mu9WQi6GSaL5vUi82b9VYaJIWugwh5kuKcOCnXE2odQrUH++9oYIwWRug4G/iNIkRj6jP/VuaWnzj/bF5iTdv4Q/MYkpPn0UpBs/+uJUNIwbDkId/X7d7DJ73mJeE8plbzNRQyvhMqzFQUAlPJRqMaJqg5VgO6iXR2m4iwv1F1rQ7tgp2lukQ2erzVy1fzhGDXrdIIaZ2NM5C0S67BqOIlRKI5qWMwiDLCfxgrfsapSYuRufXraqCxZvBCfH46N7Scjc427Z4WhnbiAob39Jarl+t4tYRBqlax2Xo9Bbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL4hWF6IIO3mkaYbRVPwnu5ok1d9mII2rcRhEWKoHOA=;
 b=P2XJyV3+pW77EzQlGhRim1OfHG2CCCSmoBNQywzUH+LXN4YYFyBMpmpx31YcODuMiBYLM9HPrJfCr/nuBl9alkUHhM59iKGi5mBU2aHaFT5qegsB/o7KAJoJtYy/lyH5JtlLMhnVm8ByVJhvYAt0tcSPUJdTVFr3AlD/IWg9PGrhfHYyiSIW1EotQ7hznGhuCGVYuihzzQQ78UkhKiEM1I9k4td38Fbpq4xhQvnlbDIf8VFgXyj0yPvmeLVls8ykzFpU7J/jqr4f1zAFpM9I7EmNkArxC5DvGdUCkc6PjCKWI5nWbteC5ds47TKViirsHHDNmqTfZetmonuiVhwrWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL4hWF6IIO3mkaYbRVPwnu5ok1d9mII2rcRhEWKoHOA=;
 b=b8lwLTCBHNoTmJN/XbZs1m/TB0e0Q+kc/NWyk0U4RE6uXK/F5KUHfCyN0i1/kma2YqZv0M3XwMaKixDpiGdvD5H4PZfPV8njgIJ1d8kEokqIqDJrMfvCH1CSIEIk4G4h5ES7eF8rMHB9+B7O62o2+2CTkNSfTnx/qItI7EfZ4DY=
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by PAVPR08MB9626.eurprd08.prod.outlook.com (2603:10a6:102:31a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 16:14:28 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::78) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Thu, 6 Oct 2022 16:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 16:14:28 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Thu, 06 Oct 2022 16:14:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15a841687b6027b9
X-CR-MTA-TID: 64aa7808
Received: from 39399d73e412.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93561F07-B1BC-46B9-A055-50EF486A4F6B.1;
	Thu, 06 Oct 2022 16:14:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 39399d73e412.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 16:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alhG838q8YOjHoZuODtKEBSeNYUY158g1MgZcL2n/hm2d56R9bffaybWGMiRlj3qvqe54z4X5/dUhNmEsgAPHylbZ8KAFc+6TmjSB0r7GxcHPflyYjnPMEMouNPlor23Or37SVwQasD9L4Ia2kwBFUMdPkM3ND2A/rER13JG0NI8H+QwhQL1tWB+CsVp6xCuZZWTOjVXBaWm/yfz0L4trBMCZmLZRfqjb0lbF2cWyqS0kpLDIufJ5Uq8PsD8lqudKLMAaMahTHJhX7wLpkdG5In5glrmNvoCBOhkXsbfexP9XMl+STXPeNScbW7Yh82AknU90g/mSlmUyljWsZ+ESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL4hWF6IIO3mkaYbRVPwnu5ok1d9mII2rcRhEWKoHOA=;
 b=MoCDrYq/JVaEUdKyAjuqw45u1uZ3NYiiNwUOxjyuUlXx3DpoQXGYJbq8f2uXoN7MH/PM8E58bkac8wKbaKYUmSi8wyJ3VXsKIYQyPxSyIh0iTZ79Fiigf+h1CnkGHaMoTGLUxJRAeaY/GrtdVFCLaEWV/sSU4CLnt+jU+pUVefrXbmeK/arX2Es+1Nr8XjIT3wbi5051AYmWgXqqArtsh8JZNmyRk6pWlCmJtAT6wzuqHzV2yRPeAHXHnkdcGvKmtJZPQkccmNuSZXcYg5HCD4tV4vIBv374pLu8lEMPVULYbWUbU/nXokq1FWAXG8sRGMO5evkZ7nANm+LEEONA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL4hWF6IIO3mkaYbRVPwnu5ok1d9mII2rcRhEWKoHOA=;
 b=b8lwLTCBHNoTmJN/XbZs1m/TB0e0Q+kc/NWyk0U4RE6uXK/F5KUHfCyN0i1/kma2YqZv0M3XwMaKixDpiGdvD5H4PZfPV8njgIJ1d8kEokqIqDJrMfvCH1CSIEIk4G4h5ES7eF8rMHB9+B7O62o2+2CTkNSfTnx/qItI7EfZ4DY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8135.eurprd08.prod.outlook.com (2603:10a6:20b:560::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 16:14:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 16:14:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alex Stewart <alex.stewart@ni.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] opkg: use a git clone, not a dynamic
 snapshot
Thread-Topic: [OE-core] [PATCH 1/2] opkg: use a git clone, not a dynamic
 snapshot
Thread-Index: AQHY2Yf4s5VPYfuA/kmpMS2TNHIMj64Bg+OAgAAGQR0=
Date: Thu, 6 Oct 2022 16:14:19 +0000
Message-ID: 
 <PA4PR08MB7411B456CD147BD0BABC1F6BE85C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20221006133122.493953-1-ross.burton@arm.com>
 <c1cc63c2-3552-0337-cce6-8c4ef2d1eb66@ni.com>
In-Reply-To: <c1cc63c2-3552-0337-cce6-8c4ef2d1eb66@ni.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8135:EE_|DBAEUR03FT056:EE_|PAVPR08MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d829f7-90d3-4f3f-13a9-08daa7b5d828
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lkh4w9WzxNJ3/KR9LyS8hly9qZ8b9akHHaFOEHVSmM3JANN1Muo14O0ck5kYdKH3K3hRztgue9ce1iu5GhZzwhjk1B9aJPUf5w+9ptwwUjBYiwfn1rNIGCaZA9y0MezH2KqgEXsVqOnT1fht62i9RrgCKCdfQQntB0OX48v6QrCdoKAJDMJs95iP7oQSPg3d9N51at83ze2jM7w/SSd3jPcrZIm+LsQXMFXB9tfor56HLkOH85X0iJHPEG61ha7296QRUdZuTUIG5dpaFDo0w9kSPjSXgX8pvx96fr2KeWr3sS70Od6RN+7HtductoHKfvgcExvtIb0+WUphwd43tmB0XOg3Dd7s9Ncksi1Oze7Zc+A481fLWqbLdBvp0ocwsbNNSe/HPMN7h0sR61cmMIuY6h1nnmt6naTP3+IPZpVx/pteGmjGzAMBObeYoz711NNSIG8HtT8xFKtTZDQSCn4FVl2Vhev+//0VvnrWATLrnwyHQB8J9i5CweS4FkBpZuA5gHruMAUGAjs86tVPL+7Vfi6VZafVbqpgwcxgUffQeVixOHZX7EQ90sbEySE5C2z5EC6xcDPFpA9pg/p9R715NMtVOOao7G7PrsZuXxww+6P+yU2ESkUOvs6i92hAKmoC4hFj4h0oE7VqOZPifhKM4asgYiXslEHUgl96n682TGZSj3PLS0C4FSlGCPli2T49lzzkZgAHimw9XPYJaqKgYEI/AcZQbycdXvD1/BY82TL1JFwIkQyzNiqROkvTbVO9g6YGPUZ2yG6Ibrq69Y4pdBbWzxOIIMKmCcQ/vgI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(166002)(122000001)(9686003)(7696005)(316002)(966005)(4326008)(66446008)(6506007)(53546011)(38100700002)(55016003)(8676002)(86362001)(186003)(33656002)(41300700001)(38070700005)(91956017)(64756008)(52536014)(8936002)(66946007)(5660300002)(26005)(66476007)(2906002)(66556008)(478600001)(76116006)(6916009)(66899015)(71200400001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411B456CD147BD0BABC1F6BE85C9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8135
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c98f9b0c-9e58-48ca-a3ea-08daa7b5d310
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dxf/pQ8i75YQfSHbkSAS4r2U6O7xXwyOPE5XAdItLUlhVQv/cdJiw9M3TNHVeELUbwX3iLUp9T2d2xRXstiv0dQClRFO66H2mVD2yY5VuSHUZs4+LoBW2P+GTcSwmWkm0frfkSjzmLvpdJ/Rrb66rkfJopb3Lxd9FwAQNixHeWgBMFmhMBEsw8mFUjoif+vyMxeecTvfTgq3995wJdAbe+IK5AV9p0Q9p+5WxsfU8xnzUe8nl0esCOxtXY33lJGjDtlIo8B+f/5dGFxZhBEYa1QmTdXmkyis9WajPb0OEVUAPgQE+QBzlEpc1mDUl5kr/OviBXs40gaC9aUwZTzc9drd8sgNYD05g7CcQAwgBYHiPYQyNGrTeSaWV30gHKxrxL4fh6MxfqNxB+n9UXxsG0algp2i/Sj8i3SABKDrrWxQ8ND4WtfRbHDlUl0UoAPqQVL3PP1QMSZ0ufERwp8nFSQWLmmbzOX0wMWETaON2vd9LAP5Aq0903vVjcSsG2F3oA01caFpnjgsi+Y7t2iwYXK4p7VIl8h9aXU/8lOPQZDqAgNQyA09hMbvMht5h8eOrMnxi7OCRDQxbaX/zI1bUgYaqBuWRfj5kk+pcH3q3dL/KFhZq4YIf/U9KNWnz6ocd2M/TDod1XMDDP4nnB+HpTO2tP1rni7bxHAoV7n9WQSIHHhMUMab59t4UkHztdkjJ0iCxncTJZcfH6VTpL3MtLYyeDKWhmrKVn7KbysDdUokUV0NCBynZUA74YUOQtV76TTdApJaXW6ziZYE8f3kYniI/ywnLEbOlAGfpUV/RjY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(26005)(82310400005)(53546011)(9686003)(4326008)(70586007)(478600001)(40480700001)(8676002)(82740400003)(86362001)(7696005)(966005)(55016003)(47076005)(81166007)(40460700003)(83380400001)(33656002)(336012)(186003)(166002)(316002)(36860700001)(70206006)(356005)(5660300002)(66899015)(8936002)(6506007)(6862004)(41300700001)(52536014)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 16:14:28.3614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15d829f7-90d3-4f3f-13a9-08daa7b5d828
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 16:14:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171510

--_000_PA4PR08MB7411B456CD147BD0BABC1F6BE85C9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, got carried away whilst battling a cold.

I retract this patch, but stand by the opkg-utils patch.

Ross


From: Alex Stewart <alex.stewart@ni.com>
Date: Thursday, 6 October 2022 at 16:52
To: Ross Burton <Ross.Burton@arm.com>
Cc: nd <nd@arm.com>, openembedded-core@lists.openembedded.org <openembedded=
-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] opkg: use a git clone, not a dynamic sna=
pshot
NACK.

The downloads.yoctoproject.org fileserver isn't a dynamic cgit snapshot.
Those are static tarballs that I manually create every opkg release. [1]

[1] https://git.yoctoproject.org/opkg/tree/scripts/make-dist.sh


On 10/6/22 08:31, Ross Burton wrote:
> opkg fetches using a cgit snapshot of a tag, which is not reproducible as
> the tag could move, not reliable as a future dynamic snapshot could have
> a different checksum, and a waste of CPU load as these tarballs are built
> on demand.
>
> Switch opkg to use a proper git clone of the relevant SHA.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.6.0.bb
> index 4cd589cd29e..f9e5073ba5d 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> @@ -12,13 +12,15 @@ DEPENDS =3D "libarchive"
>
>   PE =3D "1"
>
> -SRC_URI =3D "https://urldefense.com/v3/__http://downloads.yoctoproject.o=
rg/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!p=
yuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgh=
2nsmLQ$   \
> +SRC_URI =3D "git://git.yoctoproject.org/opkg;protocol=3Dhttps;branch=3Dm=
aster \
>              file://opkg.conf<file:///opkg.conf> \
>              file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var=
-run.patch<file:///0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch> \
>              file://run-ptest<file:///run-ptest> \
>   "
>
> -SRC_URI[sha256sum] =3D "56844722eff237daf14aa6e681436f3245213c5590ed0cda=
37a79df637ff3a4c"
> +SRCREV =3D "9007789c18f70bc9f315a566c589231ef0a2e6fa"
> +
> +S =3D "${WORKDIR}/git"
>
>   # This needs to be before ptest inherit, otherwise all ptest files end =
packaged
>   # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171502): https://urldefense.com/v3/__https://lists.op=
enembedded.org/g/openembedded-core/message/171502__;!!FbZ0ZwI3Qg!pyuHI_PMGr=
Z2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj0RaRGrQ$<h=
ttps://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded-cor=
e/message/171502__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQz=
MmoQPyN-WSs9wjjW7a9E1qPmn22PazWj0RaRGrQ$>
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.o=
rg/mt/94157332/3616788__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0J=
DL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgOZqMzhA$<https://urldefense.com/v3/__=
https:/lists.openembedded.org/mt/94157332/3616788__;!!FbZ0ZwI3Qg!pyuHI_PMGr=
Z2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgOZqMzhA$>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-core/unsub__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY=
0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj3f46u5w$<https://urldefense.com/v3/=
__https:/lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!py=
uHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj3f=
46u5w$>   [alex.stewart@ni.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

--_000_PA4PR08MB7411B456CD147BD0BABC1F6BE85C9PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
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
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Sorry, got carried away whilst battling a cold.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I retract this patch, but stand by the opkg-utils patch.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Alex Stewart &lt;al=
ex.stewart@ni.com&gt;<br>
<b>Date: </b>Thursday, 6 October 2022 at 16:52<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc: </b>nd &lt;nd@arm.com&gt;, openembedded-core@lists.openembedded.org =
&lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH 1/2] opkg: use a git clone, not a dyna=
mic snapshot<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">NACK.<br>
<br>
The downloads.yoctoproject.org fileserver isn't a dynamic cgit snapshot. <b=
r>
Those are static tarballs that I manually create every opkg release. [1]<br=
>
<br>
[1] <a href=3D"https://git.yoctoproject.org/opkg/tree/scripts/make-dist.sh"=
>https://git.yoctoproject.org/opkg/tree/scripts/make-dist.sh</a><br>
<br>
<br>
On 10/6/22 08:31, Ross Burton wrote:<br>
&gt; opkg fetches using a cgit snapshot of a tag, which is not reproducible=
 as<br>
&gt; the tag could move, not reliable as a future dynamic snapshot could ha=
ve<br>
&gt; a different checksum, and a waste of CPU load as these tarballs are bu=
ilt<br>
&gt; on demand.<br>
&gt;<br>
&gt; Switch opkg to use a proper git clone of the relevant SHA.<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; meta/recipes-devtools/opkg/opkg_0.6.0.bb | 6 ++++--<br>
&gt;&nbsp;&nbsp; 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-d=
evtools/opkg/opkg_0.6.0.bb<br>
&gt; index 4cd589cd29e..f9e5073ba5d 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb<br>
&gt; @@ -12,13 +12,15 @@ DEPENDS =3D &quot;libarchive&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; PE =3D &quot;1&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -SRC_URI =3D &quot;https://urldefense.com/v3/__http://downloads.yoctop=
roject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0=
ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn=
22PazWgh2nsmLQ$&nbsp;&nbsp; \<br>
&gt; +SRC_URI =3D &quot;git://git.yoctoproject.org/opkg;protocol=3Dhttps;br=
anch=3Dmaster \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file:///opkg.conf">file://opkg.conf</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file:///0001-opkg_conf-create-opkg.lock-in-run-instead-o=
f-var-run.patch">
file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file:///run-ptest">file://run-ptest</a> \<br>
&gt;&nbsp;&nbsp; &quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -SRC_URI[sha256sum] =3D &quot;56844722eff237daf14aa6e681436f3245213c55=
90ed0cda37a79df637ff3a4c&quot;<br>
&gt; +SRCREV =3D &quot;9007789c18f70bc9f315a566c589231ef0a2e6fa&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; # This needs to be before ptest inherit, otherwise all pte=
st files end packaged<br>
&gt;&nbsp;&nbsp; # in libopkg package if OPKGLIBDIR =3D=3D libdir, because =
default<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171502): <a href=3D"https://urldefense.com/v3/__ht=
tps:/lists.openembedded.org/g/openembedded-core/message/171502__;!!FbZ0ZwI3=
Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22Pa=
zWj0RaRGrQ$">
https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-c=
ore/message/171502__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6R=
QzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj0RaRGrQ$</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.o=
penembedded.org/mt/94157332/3616788__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZN=
HVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgOZqMzhA$">
https://urldefense.com/v3/__https://lists.openembedded.org/mt/94157332/3616=
788__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9w=
jjW7a9E1qPmn22PazWgOZqMzhA$</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.opene=
mbedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanI=
ZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj3f46u5w$">
https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-c=
ore/unsub__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN=
-WSs9wjjW7a9E1qPmn22PazWj3f46u5w$</a>&nbsp;&nbsp; [alex.stewart@ni.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
-- <br>
Alex Stewart<br>
Software Engineer - NI Real-Time OS<br>
NI (National Instruments)<br>
<br>
alex.stewart@ni.com<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411B456CD147BD0BABC1F6BE85C9PA4PR08MB7411eurp_--

