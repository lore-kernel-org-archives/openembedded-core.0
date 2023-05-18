Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F266C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 09:56:06 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.61])
 by mx.groups.io with SMTP id smtpd.web10.13305.1684403760408118649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 02:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WWoyDW6v;
 spf=pass (domain: arm.com, ip: 40.107.104.61, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjkUhN/MrnWCG9dhun9vjC/MxFATbPhkAntN49lUpfQ=;
 b=WWoyDW6vpHXZeprZqPTxXalPGRSZSacFLbUXG2tQE2Q4fsvrqLgFowGX3fjuCB/GrMzun5qGidIcBcZH+g3ruEXXGVWPCsCiBYxNW6plLs5qbrdDPkSpvxK6zs+RiacC9U+CDMzYieSaDpthMLoyJbkF0xbQfHEvlXVaNO6EJoA=
Received: from AM7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:20b:100::28)
 by PAWPR08MB9686.eurprd08.prod.outlook.com (2603:10a6:102:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 09:55:57 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::ff) by AM7PR02CA0018.outlook.office365.com
 (2603:10a6:20b:100::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 09:55:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 09:55:56 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Thu, 18 May 2023 09:55:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9b0ae44471a5ae0
X-CR-MTA-TID: 64aa7808
Received: from d4bdbc5d2384.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 937E2D8B-D4F0-42BC-9089-E2B06558C315.1;
	Thu, 18 May 2023 09:55:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4bdbc5d2384.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 May 2023 09:55:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRRouw8P8Gaa5fffNgeFBG8N8dBx3bX3izmK06KpbYk5vhmwiAIzFnto3CxIJpYpoFzeEKJSR82/y8kUzeajRI82jvhNXpFraz2GKsSpmas7oQZ5t093D0NT7ObsDf54mjHlEGyuYwuAVCT/nDK8ez2j8auk/pFBjdSEvAmMdKs6q4g6ahVKObnnB4jlOEM3k3zoGtNI/fhkdxyp88VqWRce5UJzHl8GskA2MDRtYegpK8UCdgjq4fYXutVKYUEzibUWhO3e9+YpqflYZ+HSRAThZJwmNbq33sCPuA8dyWU/LBp5tc+qzsooVeeuR8tKbg4HvrljxC5qHhp2q1cVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjkUhN/MrnWCG9dhun9vjC/MxFATbPhkAntN49lUpfQ=;
 b=BAXEY5/7h5TF0LiIvF8sydpk1U+7ZSO1FXi3OgdAIIOXm0Ms1ZmFWrWlna3I37mNV0oSqPOPmN2VkFmekoF5PbJ9CN+kTg8MLaJHTLxSTOQcQ3o3DGDlTcVl9kaWdm6Hbc6zj1Ahm4yI5XXVElZOcJXdqpkjI1GlyQMUKvh3XnRwQceNZhCANnsWlyR9YkYlrnmT6R/glWqZPZ427UW1P5zFG2rrYDns4qhivkWDfla90znyowcAfczJbkQYt5+0GrEFMkP2g9DZYPYPYcVxc6AW7vF36+pAyFhk106eUoIuUgZzNg9PjH+m/CA5p62rW3UttO2PbZ4sW35Kbzez+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjkUhN/MrnWCG9dhun9vjC/MxFATbPhkAntN49lUpfQ=;
 b=WWoyDW6vpHXZeprZqPTxXalPGRSZSacFLbUXG2tQE2Q4fsvrqLgFowGX3fjuCB/GrMzun5qGidIcBcZH+g3ruEXXGVWPCsCiBYxNW6plLs5qbrdDPkSpvxK6zs+RiacC9U+CDMzYieSaDpthMLoyJbkF0xbQfHEvlXVaNO6EJoA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 09:55:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Thu, 18 May 2023
 09:55:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "lorenzo.arena@powersoft.com" <lorenzo.arena@powersoft.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] conf: add nice level to the hash config ignored
 variables
Thread-Topic: [OE-core] [PATCH] conf: add nice level to the hash config
 ignored variables
Thread-Index: AQHZiWxO0pM6doPLJU2otIyqqqUL5K9fyvGA
Date: Thu, 18 May 2023 09:55:47 +0000
Message-ID: <5C75B35A-E9AD-4E06-9D70-4F1B2D2B720E@arm.com>
References: 
 <6b539f9c-b8ef-4b86-bea3-2991e0b609fa.d3d7bd9a-7157-4b71-9d22-e15598af349e.aab2fef3-68b7-4478-84eb-720bf79f2836@emailsignatures365.codetwo.com>
 <20230518093635.1214442-1-lorenzo.arena@powersoft.com>
In-Reply-To: <20230518093635.1214442-1-lorenzo.arena@powersoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6406:EE_|AM7EUR03FT039:EE_|PAWPR08MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b31ea4-628e-47d7-9654-08db5786138b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3iQSxhs8Mkbz/41hjQ5jSOz848c5JrIj7oiX3X0or84RFnm/uW8UU34RYJB4NXkO+CQoaaKVTpNLdAqCoHPehgZaqNEMUfor+IINxckbdbp7+uPM6vTlx+TMaY8JqpoYmsk5i5XH9JaWE0NGVEYOw36SwlPnSv3Tz8dVPY2VbGavtjucDYTeA8ZKbx8XgCPdxioazsABg3KpaBXvXcXBDQ2WQan48htzfemvuIg5nPMhFhfTveRwh+R2TgFwqO1UC250qaj2ZVb6Gg6ayv/IVVALKyH/9bvmGtITlnnC+7+inz7D5sCAqbfIFL8/e0rRXrSUOzYLwVZM0LTRljB8U9C5B3K2+xkMZ2rfLM0QhJ1ZbxoOWK/hE1GNTcsLVr6nSSd2SOouo6l0XEpvRsLYmU544KJV2F7RetsYRVHREpHDUtnYjja+0pshmfrELidX5KSc/CwMV2pjYdtLQ4v7bxI+QT3odiY7iy2eSfWtQWRVh2KEPRJcGzj+zVV3W9+wEG9kWTm9aATEZ53q20tSdo1cGDrU/1m5BDsMhp/wcTAlGW9uTEEF8oM4IdbZU0stAvOWJYrGm4pqhZir75W9q22da38JqmeYTBdmZ1dCK41hFUAa523BaQr8zVS3NifBQAR3imoqa5yxwzAZxKXVgg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(66476007)(64756008)(66446008)(76116006)(66946007)(66556008)(5660300002)(8936002)(8676002)(478600001)(66899021)(91956017)(4326008)(6916009)(316002)(41300700001)(6486002)(71200400001)(966005)(122000001)(38100700002)(53546011)(83380400001)(6506007)(26005)(2616005)(86362001)(6512007)(186003)(38070700005)(2906002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3A64DBAB45E1784D807FDB9047C4FBF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9d3f76d-e123-4cca-6f95-08db57860e40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f1U/5ttULx+J8vIJxKMrjn472MzIiNBrlWP+6r1rGLiWvdfjwKLZGCBYoNbTZMM+KMVLjCbMUTY1l3ZAn/5VI6NuZQ0SQ7jWuMy1RvY2HMvhvhBRfNchF4HIiYB7cMTLYrT00czsNEwY41g+sVdvcYKDauBGVllcR/cytil65zLk2I91RbcaTfYy6h3t6hGwrurPQGdW8Z34urQDk54Oar6HcNkME+ZAsrXQNQi4LZVUQoRlj3OkU8iwRzWuWwX9j5g30eMDZIaqCpb9UFQ492ODcIx19GFvtruWlZ/0jiwAMT+jZPz8K7zopI9FTsPocD7Ttu+dlZN04/jhyJkyaFJKHyrPthfbAixQ6bXRYCVjqUmQC3o5/FR4z7nfLOEgQWz5jjBjSVk0wehDmnzIyjniLvwCZ+V3asfpkEsybVoqoP4fo82jGLHARhMVr+81DWV6opgm8NNVCR95jd+mB5R/2iDgjWKJ2jZdaAg1W7m63yaDOld2kIk4JQSvPU7mEtE4aNGwhvqRkJDOcFfYY6taKIFcdTNqoWZpyoTp/HtjX8T7eZ7HmpawWmL9ovQ8ssWFRThtwTaUgLRgna1mXma2PnDyhwKQs84SLQ3U8EhtCdVGQYw6K+mX5lctHuSUCXWRJhrcrJfvcjvV0rgiGyelIpHylsF6EA+RNzHBFwVUcB/syLCC/oBCPxgKi4LgFLJykCLJ15VZ33FVPSFu7aHIQoIrecMY8iPRJmI2Ghw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(6512007)(6506007)(53546011)(40460700003)(26005)(966005)(36756003)(36860700001)(47076005)(83380400001)(40480700001)(336012)(2616005)(33656002)(86362001)(81166007)(82310400005)(82740400003)(356005)(186003)(478600001)(2906002)(6862004)(8676002)(8936002)(316002)(41300700001)(5660300002)(4326008)(70586007)(70206006)(66899021)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 09:55:56.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b31ea4-628e-47d7-9654-08db5786138b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 09:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181514

Can you send patches as plaintext (ideally, using git-send-email).  Copy-pa=
sting HTML mails tends to fail.

Thanks
Ross

> On 18 May 2023, at 10:36, lorenzo.arena via lists.openembedded.org <loren=
zo.arena=3Dpowersoft.com@lists.openembedded.org> wrote:
>=20
> From: Lorenzo Arena <lorenzo.arena@powersoft.com>
>=20
> This is needed as each user could be setting different nice levels
> while building, however this should not make the shared cache unusable.
>=20
> Signed-off-by: Lorenzo Arena <lorenzo.arena@powersoft.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2db84a46ee..314cc46662 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -954,7 +954,7 @@ BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMM=
ON} DATE TIME SSH_AGENT_PID \
>      PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED=
 \
>      GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ft=
p_proxy \
>      HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PAS=
SWD \
> -    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
> +    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT BB_NICE_LEVEL"
>  BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \
>      lockfiles vardepsexclude vardeps vardepvalue vardepvalueexclude \
>      file-checksums python task nostamp \
> --=20
> 2.34.1
>=20
>=20
> Lorenzo Arena
> EMBEDDED SOFTWARE ENGINEERING SPECIALIST
>=20
> Powersoft S.p.A.
> Via E. Conti, 5 - Scandicci (Fi) 50018 - Italy
> OFFICE:    +39 055 7350230<PS_553e4174-d089-4113-aa68-7863aa6108ea.png>
>  <FB_c651e92c-f558-4470-9dc8-0cde2dc49cf4.png> <Teams_6088ac53-fdc7-460a-=
97b3-533e03f1ad3d.png> <IN_2180daad-e9b1-4c84-9ac3-d130a49ed1c3.png> <YT_c7=
4db1a3-a814-4e66-b04f-15ff9bd7940d.png> <IG_b8aafa87-2c84-4406-9c9e-91da1b7=
684d0.png><ps_infocomm2023_bm-3_81926ec5-ad2a-4a27-87a8-1cf76c356652.jpg>
>=20
> =20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181513): https://lists.openembedded.org/g/openembedde=
d-core/message/181513
> Mute This Topic: https://lists.openembedded.org/mt/98987748/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



