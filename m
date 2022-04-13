Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEA8C3A59E
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web11.4353.1649843524443282962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=YYx4kLiZ;
 spf=pass (domain: topicproducts.com, ip: 40.107.2.43,
 mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDSFbYZYVHfJBxaDmkBm0o3EV+eY1/Rvu6ZwXsqNLOc=;
 b=YYx4kLiZPHTSwRmy9kP4aVKaYKKDVQIORqEUcO11IiuAzXq8HwmR6qj53yPcC16VefJuFMNKk2occMLXR4E2o/SEoYGd3jXOlQCBbNUvV78oRV/KYZ9620cCBbJJmqlTiS1ckEIF+7wMBaHJMaIHqGIqt9gCkL5tWZrUEai817SswJ+pk6fAVbiv+76ylqkaYqBANrYyoWuEJoIBqMcV5qtPrHw5uIqS5imWppUx3gTvi+4vHQiHSdvpMBX20WV0EOGcNC8nJI6Ny+C2lXHxY8w0tjYS7tY7mbr8UyKYL31zjJGJlZyCSGxEI40uLjDErBwYnfN9Mf6YRAjNhy5C/g==
Received: from OL1P279CA0031.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::18)
 by AM8PR04MB7428.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 13 Apr
 2022 09:52:01 +0000
Received: from HE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::7e) by OL1P279CA0031.outlook.office365.com
 (2603:10a6:e10:13::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Wed, 13 Apr 2022 09:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topicproducts.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 HE1EUR01FT087.mail.protection.outlook.com (10.152.1.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 09:52:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.53) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 13 Apr 2022 09:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkJO7S/NL7ise4MOlvmMiE1YvFbyJY0eNgEek1+3nsnkkBTlNMjGhYVG+HZsoEIALMWxn9OPz5A3iYXQ1U00lRp8dHpjY1ho0YxBjehF9MUkpca/L64IIWK6Ho4wlTS5HiGC4YzDp2+Lp7oK+D3Fk08rwGGUhG/qL6wvVuD+aMCJMtvQOr0LPxms1jqUkMiMgBaLhrZo6J5bBB8rfwTG41vgaIpvF/IAA60d+h9k+iOB9RWqk2MHLjWTEDjnbaAarQQliaEApysLEIeOi+KKyUfJsFsKkiyZo+R905pIZWexC3mtZLTktsG6+E8Tm9ZlK6itg29G+BV0/g9K/5xzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEsrFh7Iql1/My38a/8FzzPktsweEAEvKghxNw7HcxE=;
 b=TamHCFv0eLlkfswgKZ+b+ljVKCtxv+X8lTMNTnvtG1BG/+XQQrWNVbO7chcOEO65VHvLQBN9ypEYb6dyKotLegdwVfxPz5Vruj7exEx7zYoBcOPT/N7UeJ/H+rNOhH7BbuZaBjQH3jdEqjE+iJ3WO/Yq7UBkMmfTiH3U8c/rLh0Bapd3tmhLJ4srk0/gvwPdV/9NY77UmCebbZh0VaVFn2VUGdgUqFtdpdfPnRFgoNnpLy1Q0mTH3wAUNPDU2olifQUtAkjWU2wqwaA6LtN9P9RZalMeyiL6DEHaIAT1jJL8MfjY0Er4K0MxyfgPjQtsMXuCX6Eb89vkbIrvYmtxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by VI1PR0402MB3837.eurprd04.prod.outlook.com (2603:10a6:803:25::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 09:51:55 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::88de:7c49:c83f:bf0f]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::88de:7c49:c83f:bf0f%7]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 09:51:55 +0000
Message-ID: <887a4cc8-7d2c-e39f-b6c1-ae45d9a18583@topic.nl>
Date: Wed, 13 Apr 2022 11:51:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] "bitbake-prserv-tool: Added quotes to variables
 to prevent splitting and gobbling"
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <20220413093544.5587-1-abongwabonalais@gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.4b547764-f1ab-4220-9cb3-e9c4ae848711@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.e4d1c566-c78b-4344-9ede-7a749348d920@emailsignatures365.codetwo.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <20220413093544.5587-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::15) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: fd57a4a2-a18d-4ff2-5300-08da1d33416e
X-MS-TrafficTypeDiagnostic: 
	VI1PR0402MB3837:EE_|HE1EUR01FT087:EE_|AM8PR04MB7428:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB74280A53D18FAD4B4D1BB77096EC9@AM8PR04MB7428.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tRiqRSUjaof76EACNv1/kKF1FwEEs2HI+uspTadWnGkD5YtmeaZtVEHl4cCK8OqkFzz8eKhPgptKX0z+lu6neyvB+M3jv7IXGxnf/JeeWtFR9/Zdb4fA+IjBhZsd6WlJMgbfTsT5J9GvO40kCHvFSRxH3ilGhnCEYnZG7+w6O8CLv6eQv2caL7D5h7Dgv0U6hg0akjaCFRh/kuI54LacIh54BDqAWYB6mQOhbbkkdCW0lKEGghW2hQAK8dhl80Nwa0Kipx2JL1dBN/QooIoCfKEgGHcpbg7vHBGIZVqHgIsTTGdDBBEwHSZy96J8u70bkBcTZnni+GS8QjogVpXb2r+59EVPsG0iYJotjmhzT2WpjIXFvHEMPTjBICdpEH7+RMtUCBYCU+mnVQLLCIr3/M+stpRqYhgsZ0aiRFQaUdjUydN31zBADSzKm5yRXpTgPznEQqxuSn19ADwGP8KmPFS2QBL+XB61zXSXcvZJMshfBWgY5O5hGlN6YVMlfhU0IRZ7EGGZX1yQYB0W6fCgPOrvHuMqRFkSda8rdCjVqjMq+xXaZfG4rCgLB5r+H7cqgteN0QYuhost56ADUGP82OHeLZNpe+oOLOXiV3TZEkVwHNLuBJE2wMLYHdsmHvlpTD4NEOsMFBjVhL+BvWWK/AUVfN/E2vvE/azn2bOLzNW57F3f6jXkXF5IwcDQNlxEGj2clAq8l3d3ffuqO2YxMJEUSBiZ3RdwqYkm8Xzpk4aksKo0Ii6x/Pzykx+TcVWA1wUk21XXhxdUli45EZNiz7XIYVUJZV1DZ/hNocLqlApT8Hbn/C3Oj+L1/GJZ5uoXgySm5sRGYollxp1U0p6aeGE8/RwqUsnInDk4GES9FGA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(136003)(39840400004)(366004)(346002)(396003)(376002)(38350700002)(38100700002)(66476007)(66556008)(66946007)(6506007)(83380400001)(36916002)(52116002)(31696002)(31686004)(44832011)(36756003)(6916009)(8936002)(83170400001)(316002)(5660300002)(2906002)(8676002)(53546011)(6486002)(508600001)(26005)(186003)(6512007)(2616005)(42882007)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3837
X-CodeTwo-MessageID: 
 ca20f155-e8dd-4822-87a1-fa9f331dd94f.20220413095159@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fd8bb489-8628-4e49-0daa-08da1d333e00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wdc15AfHRZtclDbbZ7bwOKDyHrcWK1dq2FAf7cgxVeyESjgDiCFM7XLNP7P+8ToRVqwDlaR3sGZY6E3wB4ju9/GOJKkkOUHnewsQkLtuxz6lJy0fYlKfz2/ek12YvaclUkDeujRo7RzGn4HwnXyuZyar/7Cqr2dz64M0FLKoxEw0xP+gmrtYuOfslOM2pK0zO7qpLIdrZNPpRDUT+9Nkz3xZwpxyc3tW+ymGCowmkGspHo0ludtWb0EMdjK9/KZ2zwHIYKRpks1ApCx62dFzESWk4+YQpXyll4LC6M7mFkfS4hR020f6KAwq5m3Qcy4Q5vb1nmfqUawvugQsW2MHGqMEHtYWWOHPhjGG7BwAhg0YF42L3LgR1YQbGvUq3Ab4qpFUsIBfg9E8xmT/YUt86pthAcjL9uZtpcGEdNFEMPZNEWjqd8WNYRMjmlNeshlIuHnRTVYEb1E6ftK+o5N2yLTO6WK8tGKZhdfxU7xuzFjBzQvJ640cijEa5/JDJ+BY3XLP435Y3RS80hOIptDoGrIIOkWzHLrAnmgeoJgbadkkk/9O+H38KJlt5bFwHqYqJi9DpX/wRbMWOzsyypq3Q/U2a5mANsFh0gxtLbic7mLEqrtDAEjo7ovaF8ztOjRhccliwVOXwxOwi3dPyNJBvfZESnCT4/RZn4r4LPplcQ3Yuykoo7OvBEGWXnJ4FnBVGXvbPXhuTjqBZdcGdeTmGJZD/IOTzlNf5ef8COklZOqOLQd2PZPQQjoGIPIbcO3nM/76ddVzO/EdnUN0e+IgK4OSvguMkOMAKGTepmC7HIc=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230001)(4636009)(39840400004)(396003)(376002)(346002)(136003)(46966006)(36840700001)(2906002)(186003)(336012)(2616005)(83380400001)(6512007)(36860700001)(42882007)(47076005)(36916002)(6506007)(316002)(6916009)(36756003)(31686004)(15974865002)(6486002)(508600001)(966005)(53546011)(8936002)(31696002)(82310400005)(356005)(7596003)(7636003)(8676002)(26005)(83170400001)(44832011)(70206006)(40480700001)(70586007)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 09:52:00.3852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd57a4a2-a18d-4ff2-5300-08da1d33416e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164311

See comment below (our mail server injects signatures, sorry for that)


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 13-04-2022 11:35, Abongwa Amahnui Bonalais via lists.openembedded.org wr=
ote:
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
>   scripts/bitbake-prserv-tool | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
> index e55d98c72e..68caa9fb66 100755
> --- a/scripts/bitbake-prserv-tool
> +++ b/scripts/bitbake-prserv-tool
> @@ -5,7 +5,7 @@
>  =20
>   help ()
>   {
> -    base=3D`basename $0`
> +    base=3D`basename "$0"`
>       echo -e "Usage: $base command"
>       echo "Avaliable commands:"
>       echo -e "\texport <file.conf>: export and lock down the AUTOPR valu=
es from the PR service into a file for release."
> @@ -16,7 +16,7 @@ clean_cache()
>   {
>       s=3D`bitbake -e | grep ^CACHE=3D | cut -f2 -d\"`
>       if [ "x${s}" !=3D "x" ]; then
> -        rm -rf ${s}
> +        rm -rf "${s}"
>       fi
>   }
>  =20
> @@ -24,14 +24,14 @@ do_export ()
>   {
>       file=3D$1

You'd want to quote this one too I think.

>       [ "x${file}" =3D=3D "x" ] && help && exit 1
> -    rm -f ${file}
> +    rm -f "${file}"
>  =20
>       clean_cache
>       bitbake -R conf/prexport.conf -p
>       s=3D`bitbake -R conf/prexport.conf -e | grep ^PRSERV_DUMPFILE=3D | =
cut -f2 -d\"`
>       if [ "x${s}" !=3D "x" ];
>       then
> -       [ -e $s ] && mv -f $s $file && echo "Exporting to file $file succ=
eeded!"
> +       [ -e "$s" ] && mv -f "$s" "$file" && echo "Exporting to file $fil=
e succeeded!"
>          return 0
>       fi
>       echo "Exporting to file $file failed!"
> @@ -44,7 +44,7 @@ do_import ()
>       [ "x${file}" =3D=3D "x" ] && help && exit 1
>  =20
>       clean_cache
> -    bitbake -R conf/primport.conf -R $file -p
> +    bitbake -R conf/primport.conf -R "$file" -p
>       ret=3D$?
>       [ $ret -eq 0 ] && echo "Importing from file $file succeeded!" || ec=
ho "Importing from file $file failed!"
>       return $ret
> @@ -60,13 +60,13 @@ do_migrate_localcount ()
>           return 1
>       fi
>  =20
> -    rm -rf $df
> +    rm -rf "$df"
>       clean_cache
>       echo "Exporting LOCALCOUNT to AUTOINCs..."
>       bitbake -R conf/migrate_localcount.conf -p
>       [ ! $? -eq 0 ] && echo "Exporting to file $df failed!" && exit 1
>  =20
> -    if [ -e $df ];
> +    if [ -e "$df" ];
>       then
>           echo "Exporting to file $df succeeded!"
>       else
> @@ -75,7 +75,7 @@ do_migrate_localcount ()
>       fi
>      =20
>       echo "Importing generated AUTOINC entries..."
> -    [ -e $df ] && do_import $df
> +    [ -e "$df" ] && do_import "$df"
>  =20
>       if [ ! $? -eq 0 ]
>       then
> @@ -93,17 +93,17 @@ case $2 in
>   *.conf|*.inc)
>       ;;
>   *)
> -    echo ERROR: $2 must end with .conf or .inc!
> +    echo ERROR: "$2" must end with .conf or .inc!
>       exit 1
>       ;;
>   esac
>  =20
>   case $1 in
>   export)
> -    do_export $2
> +    do_export "$2"
>       ;;
>   import)
> -    do_import $2
> +    do_import "$2"
>       ;;
>   migrate_localcount)
>       do_migrate_localcount
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164310): https://lists.openembedded.org/g/openembedde=
d-core/message/164310
> Mute This Topic: https://lists.openembedded.org/mt/90437025/3618446
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
ke.looijmans@topic.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


