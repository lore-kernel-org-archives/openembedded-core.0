Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69039C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 06:50:26 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.47])
 by mx.groups.io with SMTP id smtpd.web09.9010.1632984621626763645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 23:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com
 header.s=selector2-topicbv-onmicrosoft-com header.b=hNgdFbKy;
 spf=pass (domain: topicproducts.com, ip: 40.107.5.47,
 mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o/+aueRJZsHiaw9HGXP1MX9SaP3lLllSpM2Rvx8xf4=;
 b=hNgdFbKyO/MwIdkb9SFspQcRc01q5TYai8xc6xeJpdsm5b/J4FHK/lovt4SwQOmzqSZgBZ+egPdRoK+ZBUqgM1IqMi3iDR4U7ynCu0zK3DiVa2s/cShyzKcdSRZUAW/lyjn1ZUEkSFx+dKwa2dafVwGIvBH+EU9CI3seqmsqYgc=
Received: from DU2PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:10:234::27)
 by AM6PR04MB6167.eurprd04.prod.outlook.com (2603:10a6:20b:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 06:50:17 +0000
Received: from DB5EUR01FT012.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::a3) by DU2PR04CA0052.outlook.office365.com
 (2603:10a6:10:234::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 06:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 DB5EUR01FT012.mail.protection.outlook.com (10.152.4.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 06:50:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.107)
 by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 30 Sep 2021 06:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWz7YvyCr0NtzSbrXOyFecssPzoQfDEC8IqKufDTTj/zlwE3ktVdyw0njHV5mdmahuvZGH2oVB2d+I5SbbDnMpo60IkpXSwagk+TDkw/aDYQ3Oo5CJ+6yfH5+5IXg9FWP65mwvV6ZxV3miniPfk9mkKF1p51V8Yp2oH0tbpQaz+Mv2W8d6KzOcugQU5aNw/5F6lgr+9Ut3j0IIaHgh2mEXPxqaWOGpzg2xF3wa5twAnoB/WD/oYyLhFjE0oIzUIecXXncDuiD0P++By5Qgilj3eMx1vrz2IebJh6UFhcNEPy4GZOMhiRnz35N95q7pGzfksUFQTftQti/jZXCuz2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=apTGoW8chVo9GRkFWHMIt9jCAsHwOOfV4sSAl6s0gcM=;
 b=nAEMEpSQgYvzW3wdLd+f4sMplRO8QJcCM4LyOj/tuwXG9r9wc81FEAAt7kp/eeXGAkXPg30sJp5O8ac6cjZRFDa3pMp9Jr7A47rK++lB3bk50c/3KS60GtISh4xbRGEMUQwhuPW47uqd1VMvScZbP0dp1rvE94rrytdrMuZ4H2LI74fV1G24u7+u77Lk7cL3P5i9BHoLZ/1T09DSI03uTi/GFt0AdDoP/x72FvzCbFtbejfSbP+i9ekhhIg3e5byBPhHoVc+P+Do+HkoBfMZI7SfZfC2RbmJBjolBXwrMK/fbl0RjH+/O8sxtUtreiCVFIzzOzJ+oAgLF1Hk/IcU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 06:50:13 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::b0fa:c0d8:101e:be49]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::b0fa:c0d8:101e:be49%6]) with mapi id 15.20.4544.021; Thu, 30 Sep 2021
 06:50:13 +0000
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: Ensure XZ_THREADS doesn't
 change sstate checksums
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d232f846-51ae-43c0-85e8-be1b07245956@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.5a416b0f-56e3-45c8-b87b-0760607e2824@emailsignatures365.codetwo.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <9b55887d-d2ce-5443-5e4d-be7f4133d5f7@topic.nl>
Date: Thu, 30 Sep 2021 08:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::31) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
Received: from [192.168.80.121] (81.173.50.109) by
 AM0P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::31) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 06:50:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fff624-3f36-4109-6bf8-08d983de903e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6523:|AM6PR04MB6167:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB616787FD78BC7C0C7D9746EE96AA9@AM6PR04MB6167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9/WHUFQctIlK0QgNhzmSS2cf75r8tIpKHh25YUnxzQwccoR+n7UpEyABGlDWkL6Cbi60iQWhU2ejnnUmODYeP06a99hfz619ZvpBNxBhG5WsyWJcbkpiEw4Z2AQ5ge03mydQj+guwV61NTjXAmsFG2NzRvdun1QlYzca35ylamaRvdt9uMUQY0ax/gcf68/Rj7Jnlndg2zVOge4+R3zSv5P6JHjl4wNly7m6DKpCtbur3mx7O3zZOCQNPzFoAEPx3LKdZ8/CHDohSq9XRTxDedumzc8skh6XdslOU4A0xA46foZAfkxI/+jeS3rFZGcfXJo0SzWNIURrnsrb+e8sOEXHbNheMUmdNubPhcgpDMyELVyidsIZtrIq7/ZgW+yVua9LKtfGlh30fCCx7u7ex20teyQafyZaxSRkepNqT79icLncye320wadYfE+fROVpzZ/AiGyOeZZSsSIRhWr1nyy/3x4mXhZKunLKvniOvK4L4GkFopELYJoZBIYqBrpYbP4T+nVYYBX3hjtq0GoTCTJi7ciVISbl0Lq7IiFqJG5lI1vjXa5MdauPcyf5J0wuCUdXAm7iahO0BatExnWGvGQfj52ofG1SAQXTIpEextcdF9yfRTdVA88vXR6T8BH4MJE2d4qODNJ1R7Th2PtpYKhGU087bu0P3OYEHLUPHBQUrt73pSeC1KiDCJp4I0kR/DLBi4c5RF04Bq3jDyjQKfgvjvS2wAlE2u2zCwu4CbyBGXs/bSzbOXie8q1HL5SAWrT4YHGfxY3tulJy1+i+YcF+jgVBcAFGzhBbJ/RwvvcFGIuvXfG5bNAXko5klec4kjmmMllQV5iIrsHH0E8wn0Jp/12mN1Cfe0WvnEnRyU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39830400003)(376002)(136003)(366004)(36756003)(956004)(2616005)(966005)(2906002)(83380400001)(508600001)(16576012)(83170400001)(5660300002)(44832011)(316002)(36916002)(42882007)(52116002)(66946007)(31696002)(186003)(31686004)(66476007)(66556008)(26005)(8676002)(38100700002)(38350700002)(8936002)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6523
X-CodeTwo-MessageID: 
 35a621a6-6e65-42f8-a2fc-0a532a84782a.20210930065016@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT012.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a5b4113-9703-48f1-fada-08d983de8daa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q+QZitaC0VRXgmMfpUDRCpKbpZJ2FHOvBxbU4ntYI4lSCZnE9wPfvaPQfKttWS0DQ935C4+Yh90uocN3MsC79EAvYyzgC6Ak5HjM8Cv+l+jVwuHARQ4GRSsJT8Pl6779Vq4DzI/u0Qmh3wLsZsUqXrDGI+kAYzcEsoVrCXy9POKphygKtqd5G8pp5IAlmPaNR074XUAaQMxPPKjGgIe8RlSJM+T7ut3HXzosIweGgAWgV/9cdGA+zHZKugnkp/ZY1D7zfWWzkmDRNS8SLhb8Qm8iOTMYDYCycQpKDB7FxXEf6rNlWIv9z1yCxRUt7SjDWr6QjKuf2ITp2I07mOLxP6zU3fHBBHL6NoOZPz5QK41W90CL2ZgIaQRCbOoSzhCkSP4KGQR1mJ0k7Y9RXMU9gPM7FYAtIzkFD0sQuU3yHEfQjdrPExUKecrbX3vEyBobpL5U3CY60bNst569nSiaqzwAYHbARAl/alWVCIYgbz044rrh6DN3zp1eo/umwmuAe1rYtjWW79laM5k9iY8pXYF4jaSvDYFbNsMVp3gqr3OYmaLNG5Djq/wCK+0HWvOwcqYsfu7nCldys0/BcX4JVNtDcfxxwsz051dhYXMqiXj+I5kqhPZrM3cvBP/vMrvxvsWBbVFgUqyS1Emhvwkbv6+LqHq8NuB6Uk4g5mKuz5T25PMja9fh1XGCD9vKbVGlLu1q3U0/Qtu7suUf2uyWBthmrN3SaO9EJ3bz5mTf+Y/O+3yi/dYu5jNNXXAYkbDMoL5g4OgDpbAGMwF3ZNOnJkV6VHbCnWGfHS1hWa/6yjcXOKt8wFIvPI1gkj3cJwDs
X-Forefront-Antispam-Report: 
	CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39830400003)(136003)(36840700001)(46966006)(2906002)(2616005)(53546011)(956004)(44832011)(15974865002)(31696002)(186003)(26005)(36756003)(16576012)(316002)(83170400001)(31686004)(36916002)(966005)(70586007)(70206006)(47076005)(5660300002)(36860700001)(7636003)(7596003)(8676002)(42882007)(356005)(82310400003)(336012)(83380400001)(8936002)(6486002)(508600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 06:50:17.4800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1fff624-3f36-4109-6bf8-08d983de903e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT012.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 06:50:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156483

Wouldn't "0" be a better default? Setting threads to "0" will make xz use t=
he=20
CPU count anyway, so it'd be honest too.



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
On 11-09-2021 12:04, Richard Purdie via lists.openembedded.org wrote:
> rpm output packages currently depend on the value of XZ_THREADS which
> is ok if left to the default value but problematic if system limits
> are set such as on the autobuilder.
>=20
> Force the value to a specific one in the hashes for better sstate reuse
> and consistent rpm task checksums.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/conf/bitbake.conf | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2140d498f7c..e25d632dc1c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -811,6 +811,7 @@ PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
>   # Default parallelism and resource usage for xz
>   XZ_MEMLIMIT ?=3D "50%"
>   XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
> +XZ_THREADS[vardepvalue] =3D "1"
>   XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_THREADS}=
"
>   XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS"
>  =20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#155939): https://lists.openembedded.org/g/openembedde=
d-core/message/155939
> Mute This Topic: https://lists.openembedded.org/mt/85529700/3618446
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
ke.looijmans@topic.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


