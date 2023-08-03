Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3ABBC0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:46:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web11.9271.1691048797287683286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 00:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aQfr2GVS;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aQfr2GVS;
 spf=pass (domain: arm.com, ip: 40.107.7.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWHI2nl6+jmYQ6171zIyY21yjqkrIVLFNd2A+txsFsE=;
 b=aQfr2GVS/Wz7N6JTznmFlRVUpgbbQsZHcTYBlXYXZas5fbxTdtKeD4pcxiWa4eZJloWqehlB4GxsUbl89hjg/5cj3VXN+t4eDwo50tA/doPPHi0kB8DrrsMJH8E2ncimgiwurO7VfV6Z/EhhTupArPlQCnkS3dLlk0GXgOjQIkc=
Received: from AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12)
 by AS2PR08MB9569.eurprd08.prod.outlook.com (2603:10a6:20b:60b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:46:32 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::60) by AM7PR04CA0002.outlook.office365.com
 (2603:10a6:20b:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Thu, 3 Aug 2023 07:46:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 07:46:31 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Thu, 03 Aug 2023 07:46:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5e199c0f0ff37f7
X-CR-MTA-TID: 64aa7808
Received: from 391681ceada7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D34FF60-09FD-4620-857D-413D679356D8.1;
	Thu, 03 Aug 2023 07:46:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 391681ceada7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Aug 2023 07:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha3ktI0CWZfhLHbMFQy23h+EUoQ+gZEpocTILcJHAFNcEjOksYBcA6m8tHwNF2nzBwsulnAfz6uaEiGJDMDTM8/b4heSa5eZRujymc1NZsb8TvU0bb1nEO7tCaPpjvb4MA7CjFBwd8oYEqnvAutMMzb5x7Hq75dgqhMU2TjFiN0K+Kwj/Ukl8HKPeWgxKsr4uTLj8CpKVIMVSaUdufOgAMvEw9uaw4x3nC5CAHy1ohPfB8w915aFkFgSzh6PBzSnLnsQqhO0MsXt0088eYABfs4hUIrpgRQgu+aDKXCzEA4GSLghfVWlpaPKafNOujbhrSp7e0ydaWhJj8pfHl4YEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWHI2nl6+jmYQ6171zIyY21yjqkrIVLFNd2A+txsFsE=;
 b=nYJ+EvtqnnCuPX6QA9af2ZyugTWifN2RXKCrNqxCKUrdAAYbhEgu6OCZzDSM/9FfW7hwyupEPusDYmkbMHWla1w+GNxgMM6DrAbUEPZ/pyzEqPAPrjWHWKNWEpxTQNg8YQtuMpFYqFIGIiDv53S2X8s3aCDoNFDcRWjnWaXpdMSPC4eRhd95bfH0tV6KPPiQEprq0V1Fl3g3yy4iyKNGw7WIklBz9c25RMUbPQ1XDczhG4tBiLOq18bn7vcO6Gc8ZeK4AjsbVi73EetgEKF9uU8f9dG/92bOj/H1AILfcdsfsAkKjK3EaUwk6SmX8Ii3+/UDdblB+cIprEgeFDYYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWHI2nl6+jmYQ6171zIyY21yjqkrIVLFNd2A+txsFsE=;
 b=aQfr2GVS/Wz7N6JTznmFlRVUpgbbQsZHcTYBlXYXZas5fbxTdtKeD4pcxiWa4eZJloWqehlB4GxsUbl89hjg/5cj3VXN+t4eDwo50tA/doPPHi0kB8DrrsMJH8E2ncimgiwurO7VfV6Z/EhhTupArPlQCnkS3dLlk0GXgOjQIkc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8807.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:46:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 07:46:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tom.isaacson@teknique.com" <tom.isaacson@teknique.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][PATCH] Upgrade 9.3p1 to 9.3p2 for CVE-2023-38408
Thread-Topic: [OE-core] [meta][PATCH] Upgrade 9.3p1 to 9.3p2 for
 CVE-2023-38408
Thread-Index: AQHZwk+ns3W4uv3Y9U2gmkZqIfI6KK/YOIWA
Date: Thu, 3 Aug 2023 07:46:22 +0000
Message-ID: <F062881A-D80F-498E-9172-599CD429072C@arm.com>
References: <20230729190505.2711-1-tom.isaacson@teknique.com>
In-Reply-To: <20230729190505.2711-1-tom.isaacson@teknique.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8807:EE_|AM7EUR03FT036:EE_|AS2PR08MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: aeacc4f3-b69b-46c2-7c99-08db93f5c111
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rMGg3Q0QpZn2sm86v4opKIs0AndpQL1QzLXJqjWicfW+VJrb4LqKeUev6h3+2CjSweOZ7EPZxU/AJF3OrRdsKDUIMTlNW83ZSndD6MiCOtUP42JdirviDDSoFJDBtvBlZuxwjnmtOQaZt/TOQ+VQdVrRiaHkAwQO6p7gRCpn64K7JialQQRHkcYzqP4gy63oVLFCtrC51s2PywjifESeqeoQkbqZuzKMHnA81iwmZG4iNQkaN0sn4y92NLJQbk8MmneVV7U5JAdvlqPfZMAR1D2wRlHGnrKR2PNVK4lTVO0IpkbedloWjlbnLVaBiSS0B2FFTnIstTQlUByNxHpzb4BUkygt7ejJylWwJcf6dhSiYH6YSUJOB2YFHCMnwdw3JyvNfdyM3/SIsJeYn4BU09MiNMGnN+rjUVTrLmcx0FluIoaKZ0UXEeo/Jg5g+K+k1u33FxnGRa80X3MKr88ah3qiO+ZEtIFfUImJhsO0z06X5zmRopaXwA0eDn1vb47pk1beXE03AB2JtVPWzbBVXzhJM5eutde3WYYjAm1PJrS1RQaBH7QWs29oQUZKiJ0pI6lRiOOLV5Kk244loJiUGNvRYGVxEuRwVdVODCocHbFPaxFU3YD3bf6wX1Badm43zaDuPglBAy5X/2+//85AfA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2616005)(53546011)(83380400001)(6506007)(26005)(186003)(41300700001)(2906002)(91956017)(66946007)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(316002)(8676002)(8936002)(6486002)(71200400001)(966005)(6512007)(478600001)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34A7CF9BCEA6CC4E936B00B1766F04DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d3e5e3cf-6cb6-4cee-3b09-08db93f5bb4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mmFS03ye0FFUeJoAQXEVp//aU0tOppy5ln+gZUlzVMEil0nMReQ8dLVQmHQ9uYfx8XcTRe6xbv/zOPTJYjDfMGWbjn9VKq9MppjsmaJW9NjQ03KxKJMgERLncqryrOu43ZWyJlrC2QrSuxFz5TLs1j+5L0SSjVZ/71raDNpY0okkMXJ1gyStjokRuc8QrsyRd3+TIQYfRD6Fmq7MXzJhSlWqs23hlNuYolos8m9yz1tHv1sFS4qPsQWFK/xU9C54HIYtpfJeNQcw/B4nibHkHJuuE0TX8wb/SMuWIskaBLvhdLsqLbnvm420+sbnSsWf/fVWeHK5GjjH7UQvZuh7+kJ9t0McicERjIYBCCmOxnHvcvdbbqy5AVvbo3TuOfPuaNp2GgeGqiPUI6l5RobdewXQKKTonWNmJlL9tvQ4+1OkHr6OPsPJ/qwOj4GSUWK2IqtOJgG2B1TDoOZjIBPHejLlDxWR+ntT/toXgpbRSu7Jai1V84tsOJm9Wk+cV6pS8zCAsu6vgqEhMhHe8FswdyjCf9wx38Hrne4A0tJEh5M6i/6vW/pI5WatDCfldQgEUNCqIsn290+n0rlu6I99xThejEi3wBjmad18WmlXIz5sHdpKu+GPcxwI8sgxHPQqND9SIQnf0JoI2DiP20a5Wchp1qhOzMezq2XkXbr6sg33a9P+p9XkjVg7YMZ5psH9Vhtlus+5NeXSIcG7lngcZpI/+0FRnYKY5nzld/K0y7Y=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40460700003)(2616005)(53546011)(6506007)(83380400001)(26005)(186003)(336012)(47076005)(36860700001)(316002)(2906002)(70586007)(70206006)(4326008)(5660300002)(6862004)(41300700001)(8676002)(8936002)(6486002)(966005)(6512007)(478600001)(40480700001)(356005)(81166007)(33656002)(86362001)(36756003)(82740400003)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:46:31.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeacc4f3-b69b-46c2-7c99-08db93f5c111
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185461

The commit formatting guidelines say that the shortlog should start with th=
e recipe name, so please change the commit message to be something along th=
e lines of:

openssh: upgrade to 9.3p2

You can add more details after the first line.

Thanks,
Ross

> On 29 Jul 2023, at 20:05, Tom Isaacson via lists.openembedded.org <tom.is=
aacson=3Dteknique.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Tom Isaacson <tom.isaacson@teknique.com>
> ---
> .../openssh/{openssh_9.3p1.bb =3D> openssh_9.3p2.bb}              | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb =3D> openssh_9=
.3p2.bb} (98%)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.3p2.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssh/openssh_9.3p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_9.3p2.bb
> index 3edc123b9a..5fb2dccdfc 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
> @@ -26,7 +26,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>            file://add-test-support-for-busybox.patch \
>            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
>            "
> -SRC_URI[sha256sum] =3D "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc=
7db114c1868af8a8"
> +SRC_URI[sha256sum] =3D "200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f4=
56878e7ccac676e8"
>=20
> CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specifi=
c to OpenSSH with the pam opie which we don't build/use here."
>=20
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185058): https://lists.openembedded.org/g/openembedde=
d-core/message/185058
> Mute This Topic: https://lists.openembedded.org/mt/100432709/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


