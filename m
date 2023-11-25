Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1600BC4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 14:04:54 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web11.25489.1700921085083986058
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 06:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cpfZ858a;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cpfZ858a;
 spf=pass (domain: arm.com, ip: 40.107.7.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OAX+yKAAxNhH5YrO9+aXrqXOQ0E89IjQUt4HdcQ38uZ5y5MD1T0gjwZCDTjvHLl2C3xMkUaV3ENa95WoJIcAEFxJyjuSeKV1U6rdUd8e1M9vyJ7azs5BnfRTnVQQMTfr1fHgaFPeLs9N8MQ0bil/5LBqbumxHWFFow1sptRXzGvxvhlweJqJ3PrBjy7WOKpB8D54vDpEC0YNo85wLHnHCQYYSrJxDjmvsP/MydI1U6C8UqScCLE/KFGFg6l25NJPHD33oIbUu4tErEpm2YsLXqkdL43Z+7cSfD5XZWiwVAAH7681RSDPATuH2WxF5N88aktnGLjFgdW9Qp3VKCW8cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsd7m9JwOeqFH5cskDuQolnvo/UCSrokIPuXgpUSlEs=;
 b=jDSv38CJgqtbaaXXlbwithCb5D9COfdliAg+2ZLNvmIA99hFAkxrChKySDJUp8+Vbx0yAmh9Bu4b/G4LcmgibjVjLEYGpGK8g39mo3PETCmNw2pt2nlMm732H/Kqpu++JRoE2cF5SavEvO9Si0XN2XEGLfJjZC/bpOU/RBKcxwyiJz67TZ0vHNk35GIMEiUniEhtk9sR0Ow152OXSXPIQDolaXAjo6CSe2WplzDfWeR+EfXKo2QAjwgXLT367+NHkbrax1pSb5GgLCMLeN+gFfrGDc4IrQUPhKNuSCsQ3iMWAs2Cq8sWZbqzLKyA1z5MPFeIOO+2B4CnSyBHuk4hLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fsd7m9JwOeqFH5cskDuQolnvo/UCSrokIPuXgpUSlEs=;
 b=cpfZ858aaXbliVGrtArubBGovixpJHBtLCEfMW6Yk9Qc2CH3zUJnyZYQDo1/wtb5TiXn4m3jd++T1wHPDX5ebeFKdM2Lw3uw4rMzZ3zl3kRpI8yNGdLBb93nwbSdGQJ8Vq0NROal1CL1cSrjqDnQtT+7XnhKYmXZJdPaOG+a9qg=
Received: from AS9PR06CA0577.eurprd06.prod.outlook.com (2603:10a6:20b:486::17)
 by PAXPR08MB6448.eurprd08.prod.outlook.com (2603:10a6:102:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sat, 25 Nov
 2023 14:04:40 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:486:cafe::3f) by AS9PR06CA0577.outlook.office365.com
 (2603:10a6:20b:486::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24 via Frontend
 Transport; Sat, 25 Nov 2023 14:04:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 14:04:39 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Sat, 25 Nov 2023 14:04:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13238121d97b6e01
X-CR-MTA-TID: 64aa7808
Received: from 61ebb0484992.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8F41A19A-523A-470B-A429-0A3F51097180.1;
	Sat, 25 Nov 2023 14:04:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61ebb0484992.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 25 Nov 2023 14:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du3q+q3UStZQHQaqdzu2JetQuawoqwsto2pBvBJhjREKIYNp+/gsGeRz21Xwgj29IBPzDkQk29Gm/vepcVOzlDAiqsOTn9MJUZ2vZzstYxNgJbxqn+5PWFviE3mrVhAoRfCgXQRneLpyOP4BWrxwnuPvfHpjVUFyJOCuuzgFbT4IHCJVxUrlsLSyoifzTkc7WVWQBdJmv+9Ff9KyhypdFzMeNivmNlUxUn/DMmAjvjp5WUBjduJlm4+YWIxjx4eEM+eA8Y+duTvis6TwPqck/sbyXNbYz7Y4u9wRa+CbVtrRvjSvFw7tGMlxzZzh4Y+Lq8PLRP8G7RWEO9rI4az3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsd7m9JwOeqFH5cskDuQolnvo/UCSrokIPuXgpUSlEs=;
 b=Z7FLhGTYOteGOiA91XlpSjc2BLyq2LI2Ih0UwAXKBil61zMm4aIuIA2Z0FIP+0v2B0P1OfAqCvvPIpOjF8c3QJTkWlRPAUfmjsEmWwgbcCwNcsFH+Xa+YxIr+8xGaV/9ExWQ1uu0/u9WadJpyNiwCFb/uq1BEa6pQJKm03UvvOQ2Ou01Ul3/JMxhbcVUkHtpUM/XpjvBejGOsPec5WjaG2V5ZXHOpevNKNA9hpttZnaRgOzE2ZeiKTOeF+5UE0sBwRLmDKtEFx6HyKkqkVVuSdS6eyh5lGqO7iLv/F1v/rViCxPqwJtTKV2pxw6qoeRBBkASSdwmpfQHaLX0tlakYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fsd7m9JwOeqFH5cskDuQolnvo/UCSrokIPuXgpUSlEs=;
 b=cpfZ858aaXbliVGrtArubBGovixpJHBtLCEfMW6Yk9Qc2CH3zUJnyZYQDo1/wtb5TiXn4m3jd++T1wHPDX5ebeFKdM2Lw3uw4rMzZ3zl3kRpI8yNGdLBb93nwbSdGQJ8Vq0NROal1CL1cSrjqDnQtT+7XnhKYmXZJdPaOG+a9qg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24; Sat, 25 Nov
 2023 14:04:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Sat, 25 Nov 2023
 14:04:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into
 individual packages
Thread-Topic: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into
 individual packages
Thread-Index: AQHaH3JmaEGN6IAdfUCeqhbRvHXhd7CLEXT8
Date: Sat, 25 Nov 2023 14:04:28 +0000
Message-ID: 
 <PA4PR08MB7411F95FD927EE786C9FB2CAE8BFA@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20231125073823.159294-1-raj.khem@gmail.com>
 <20231125073823.159294-3-raj.khem@gmail.com>
In-Reply-To: <20231125073823.159294-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9203:EE_|AMS0EPF00000197:EE_|PAXPR08MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e19927-51a7-45b0-cf5a-08dbedbf775a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7j6yrlFZEYikiRaFEuileyDE8BwyEZIe3lCXIpft5Ytlr30Na3JT7l2nEdskY82YT8SruJuawv0Ra1W2tI3wxuo8hq2xsg6QruBEQ9dzpzCDxdvKDPR6yjZifgr4LIvG6kALaxtruP6m3m/IM1+3+NUujgeFLva1/8eNv+YCeNFw6oiQXpnnpJ2xQ0tarxmxoBfJ+aVux2yC6XemOcv6/bha3fL4Om7FYoei2ksUA2efGKKChLViYZU1SPhM7V47QDA4QTLIxCSvSny4iozZ7B4AUSbhWOc6+hKq9G6oTQXJtgSCRRGA6E7r22a8Ds69HClxXBsem8t5oqP6lqLOzzBA/JLsYWHZhgQ2+Ve9UJx9GzXJN4BJv0oR1APWtgucdmf0mRrO6nRA8cfVT/Z9+Q6Z4opOmxGkZpwQxZbtJGQ0O55vxOolAXZb//uDExgf1BdmwdC5jexQi6Qc397qPRr5AIiDZQNleErDtNFI5g3J8U6XK0ySNXjY+BZ60XCOhX/odp4pburpAuyoZpoxyC9GhTQcP1ksromP3Uvnp9rRWZkc7MTOi1dpF2ZAFzbljsc4z6qtbZlJLhAC/ySwahN2WXN77DI2wfMub1dov/ynVjiSDSilBGHvvBGE4g+q
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(110136005)(316002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(478600001)(71200400001)(5660300002)(38070700009)(41300700001)(33656002)(2906002)(52536014)(4326008)(8676002)(8936002)(86362001)(26005)(122000001)(83380400001)(55016003)(6506007)(7696005)(38100700002)(53546011)(9686003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411F95FD927EE786C9FB2CAE8BFAPA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9203
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e396d30-6590-48d8-5de2-08dbedbf70cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CU+FnKEHb1EbZFYMelRaCJupyUM3yvANulSfSCjepV+Gq9OkjfgtviSrwKVMe2aee0upfaCgICcwj/G+MdUswgtZr4rgQn5v3ACnZ5C3WKaGp2gSc7jkhv0dPGkmKwUnIKahH2YAzdQePSdTjWONlvyoQL2DYTw90vLQ6QtZjHvJbZOx7/h6YN7wOg6aMNwxVQVvfvEnZYRCFR/f58FwSZHTiv+eiGjt4GDE1qpst9cXbPb6fRrUU0oFgP+8rqpUbVmEf60fW8bSPaTdBS0Dw3GmArOUzosmjuJTs0qiTRf9dVnHOjhem6J5BM1C0FBMleD689qjYuEr0SGZf08YMgYqkeRNF0TrgMDXRyb+Jxq4O8BTf1V1EIIUBp7/DjOQk29VOcsZWO3DyvDeH5lsB+As5y7LLHJn0cfdC2aZZDZ2/tbgC02PCHHTkEg3bE/V2gejWK3y0gtFlnQ+YbXA1W8Fku7Tlz+xy8hrjW7MQNfcDo0k0d+dO6vLeaG1InC0KHE0vJMSIV40Cwulr/Rd9agmii69was9hEnMmFIDDBcVUzHId1K00hKiw1ZAJzuf2IvWz7eNAtyDBYCwmCIgk8BQdAp07Unb63X4vOMEELTD/9sVGQ/wzDHmYsSuFw8I/4mglkkcRL8N3g433RGlRVXD9S++j2JCXbHscN1K1U6LB3IRnH+Nt/A7+FET5PeMv8ahlL6cTh+qDZHem8tamQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(46966006)(36840700001)(70586007)(70206006)(316002)(52536014)(8936002)(8676002)(4326008)(110136005)(478600001)(86362001)(5660300002)(41300700001)(33656002)(2906002)(36860700001)(356005)(47076005)(81166007)(107886003)(26005)(7696005)(6506007)(9686003)(53546011)(83380400001)(336012)(82740400003)(40480700001)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 14:04:39.9252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e19927-51a7-45b0-cf5a-08dbedbf775a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191231

--_000_PA4PR08MB7411F95FD927EE786C9FB2CAE8BFAPA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does this allow installing the gtk4 libraries without gtk3? Looks like the =
GIR files will mean pulling in both.

Ross
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Saturday, November 25, 2023 7:38:21 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Khem Raj <raj.khem@gmail.com>; Ross Burton <Ross.Burton@arm.com>
Subject: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into individu=
al packages

This avoids adding gtk4 dependencies when image may only desire the gtk3
pieces of vte.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v10: Added new

 meta/recipes-support/vte/vte_0.74.1.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/=
vte/vte_0.74.1.bb
index 8a7054a13cd..91c331d44cc 100644
--- a/meta/recipes-support/vte/vte_0.74.1.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gt=
k4"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
 PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd"

-PACKAGES =3D+ "libvte ${PN}-prompt"
+PACKAGES =3D+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
+FILES:libvte-gtk4 =3D "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/=
Vte-3.91.typelib"
+FILES:${PN}-gtk4 =3D"${bindir}/vte-2.91-gtk4"
+FILES:${PN}-gtk4-dev =3D "${libdir}/lib*gtk4.so \
+                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
+                        ${includedir}/vte-2.91-gtk4 \
+                        "
 FILES:${PN} +=3D"${systemd_user_unitdir}"
 FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt =3D " \
--
2.43.0


--_000_PA4PR08MB7411F95FD927EE786C9FB2CAE8BFAPA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Does this allow installing the gtk4 libraries without gtk3=
? Looks like the GIR files will mean pulling in both.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Ross</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Saturday, November 25, 2023 7:38:21 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Khem Raj &lt;raj.khem@gmail.com&gt;; Ross Burton &lt;Ross.Burton=
@arm.com&gt;<br>
<b>Subject:</b> [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into i=
ndividual packages</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This avoids adding gtk4 dependencies when image ma=
y only desire the gtk3<br>
pieces of vte.<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
Cc: Ross Burton &lt;ross.burton@arm.com&gt;<br>
---<br>
v10: Added new<br>
<br>
&nbsp;meta/recipes-support/vte/vte_0.74.1.bb | 10 +++++++++-<br>
&nbsp;1 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/=
vte/vte_0.74.1.bb<br>
index 8a7054a13cd..91c331d44cc 100644<br>
--- a/meta/recipes-support/vte/vte_0.74.1.bb<br>
+++ b/meta/recipes-support/vte/vte_0.74.1.bb<br>
@@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] =3D &quot;-Dgtk4=3Dtrue,-Dgtk4=3Dfal=
se,gtk4&quot;<br>
&nbsp;PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnut=
ls&quot;<br>
&nbsp;PACKAGECONFIG[systemd] =3D &quot;-D_systemd=3Dtrue,-D_systemd=3Dfalse=
,systemd&quot;<br>
&nbsp;<br>
-PACKAGES =3D+ &quot;libvte ${PN}-prompt&quot;<br>
+PACKAGES =3D+ &quot;libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-pro=
mpt&quot;<br>
+FILES:libvte-gtk4 =3D &quot;${libdir}/lib*gtk4.so.* ${libdir}/girepository=
-1.0/Vte-3.91.typelib&quot;<br>
+FILES:${PN}-gtk4 =3D&quot;${bindir}/vte-2.91-gtk4&quot;<br>
+FILES:${PN}-gtk4-dev =3D &quot;${libdir}/lib*gtk4.so \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/=
pkgconfig/vte-2.91-gtk4.pc \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}=
/vala/vapi/vte-2.91-gtk4.deps \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}=
/vala/vapi/vte-2.91-gtk4.vapi \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${included=
ir}/vte-2.91-gtk4 \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;FILES:${PN} +=3D&quot;${systemd_user_unitdir}&quot;<br>
&nbsp;FILES:libvte =3D &quot;${libdir}/*.so.* ${libdir}/girepository-1.0/*&=
quot;<br>
&nbsp;FILES:${PN}-prompt =3D &quot; \<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PA4PR08MB7411F95FD927EE786C9FB2CAE8BFAPA4PR08MB7411eurp_--

