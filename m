Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91135ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:19:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.88])
 by mx.groups.io with SMTP id smtpd.web08.11263.1667233163685433279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 09:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6/GfNchl;
 spf=pass (domain: arm.com, ip: 40.107.105.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RIjCdJY7BVZA2RJI660Zm+L5w/1Cu+GC7K1TmftVuWF553xNReLpDA9/Ob5GLYaQsmDPmGmMMKCepfJeWRmwgWJJBAxQr5p090XBi7CYukP65RhruQrSih9UGg/iBXiHT1jYGI2Av8t8g/tOLN+bqmfF0I35/hi74YrxbG/CQAJqfEPf0vgEUCYKlvGaHy43bOKt1WnvmhSE2AW+KN2aZgrgmHVW6Gcu1hlg9xybSc42TA2JZzRJjzVXZSg+mEc33VCxCxMPj02oixoqjx0meY5kWcVeSADEMFgMXayFpnvu0tNCqvdJ/FpI0GO3xs+eogE5d8VfouA+UGQBzQZYlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBaif4Dv/8vr33QtkNYWQbbZ+b+qeufGKi5ETrucijA=;
 b=dlxQoR8H2DeQR9ObSW4Qm5pdSCSDjZ1E9speKDnNedZx0yzI5IgpFgP+fozd+S6lsgk4DJ0L4N8JwuNPQz6kG6YyvgMDkgUMr+B4wJgr2MJsjPfd932HIM8OKtAP3tdnk0dAzXSadbUvBwFfJswQdo/Oc5tzWeiBzFBzG5rH/pT4zwRBjBjTQj5w8OGxqWvjbivj6MrAogwggBAY2tBBvMUsuBZykBwNH05cY9wCbL4c4HhDhrxVQ4gZdXR5kT40vCoeSEPbr1LJJzMUFEhY2dRhALHM8ZtPpGq3PTZ9oiP2K4cVmyn4bLcaLqkP33atNLRa/4gi2ZC/3krQDmNipg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBaif4Dv/8vr33QtkNYWQbbZ+b+qeufGKi5ETrucijA=;
 b=6/GfNchlGKBCBcH0bMozgdBgfbYslc37zuFxarZzBTVgul19RfsEJipB8dqWZGTVgbmGrf0NpZZCM7qYuzKKLgea3zjoSPW6gaiJ+fAJ1E8U0MYFrqMgIraQFOpKtDu5wUanXlpQ/Z0RyhVWhFu024OuBlFVSeEfBKXPmMMP+DM=
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by PAWPR08MB9029.eurprd08.prod.outlook.com (2603:10a6:102:341::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 16:19:20 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::a7) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 16:19:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 16:19:19 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Mon, 31 Oct 2022 16:19:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3340a42cf424eac
X-CR-MTA-TID: 64aa7808
Received: from 5327d4128496.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E94762FD-7A63-4A49-BA4F-C69DB36DBD09.1;
	Mon, 31 Oct 2022 16:19:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5327d4128496.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 31 Oct 2022 16:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPFQ79Tty2DudCOQ4ss0X2NRIFts3kbC3GZkM7Osx0Ll9kJmHY8hfGAdkTIEe7pSTvFNEEHA7VEngn0uiewO6CNAe5DTedUCe5QEJnBx4ncX3F+sv+V0UKf1aclfUhCC/Bcq3sP4rYiAH0F8bWbV75F62TZiBugFzqcxZI2KGQ52UM6jYYAuwPu3eZdEpoDEhY2I8Kx9xjjH21dd4OiiBIrDxuRnKSYrAew4lCSB6C6CCzVToyhguOke6jBc2QvXVLMruSBd6ezkCH9fYJhVWcksZE1HFIW4AAusqfUtKZSv2Pakk0ptQpLwA5zSoo65ATY6FdkG/kewIKF9EbVAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBaif4Dv/8vr33QtkNYWQbbZ+b+qeufGKi5ETrucijA=;
 b=R0BxE47EhVL4hUBhCzR6kt1PFhE1VgSOpFi2klP0YenG0P5O2+tn1HUueo7zE4Ou2uqbaf9Qv7FRcUfhiZLxxd3ZRWp8QzCsV7KSLNC1mka5WxUjxt/5o6RtlkFdqRPRNPf8p4/y9oEDoflNbC/2JqEOC1mL4MJzr+xlvX5m1h1UEqfMJcVGpivBM1215zyTcdKxxRJzHW+4AJwQrlnUXOHDGIwS5+8p2tWJx1B1Ez3agRJIx+cC1jtddODV0t1sIadeWtb/LtLaah5em5/QONAR6iQulc52/cBUlpSgy3dhSjt/SAOUDcBmA/jhT2CO1OikuDyyJokOuu8LkXYBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBaif4Dv/8vr33QtkNYWQbbZ+b+qeufGKi5ETrucijA=;
 b=6/GfNchlGKBCBcH0bMozgdBgfbYslc37zuFxarZzBTVgul19RfsEJipB8dqWZGTVgbmGrf0NpZZCM7qYuzKKLgea3zjoSPW6gaiJ+fAJ1E8U0MYFrqMgIraQFOpKtDu5wUanXlpQ/Z0RyhVWhFu024OuBlFVSeEfBKXPmMMP+DM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8213.eurprd08.prod.outlook.com (2603:10a6:150:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 16:19:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 16:19:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: wangmy <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Topic: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Index: AQHY7QFFhOyVHYch1UWRuS0ObQH5Gq4orvSA
Date: Mon, 31 Oct 2022 16:19:10 +0000
Message-ID: <62CE5E7E-3A59-4845-99BE-8672974E2822@arm.com>
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8213:EE_|DBAEUR03FT026:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a90362-51b6-46df-5384-08dabb5baa34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fvR84W15dJjL2Ou/ygFQqpWhBd93VjL62I1gKzWwVQSUCkluUGy7D3Mh+xHOyN21je5nVVPSJOu1VkW4RjWauLt4JTck0WKgaRwx1O6U9g/pcKlejzQIjEskMVsKwVNfxsdy3f0pZtv3qW0LSl2b/VKO0qlHCLkAKzDuAnD79+hkrHO+HNCbtvMEI7gpeMi2Mhx/N+j1HpI6dxiU4/6sx0NUhPy40KTrf/N+cpL/UAEHyUtUezx0ZCQexzC5dApXv8BFtGv9gPx2OHPhIzAmaxUv3Aa6BE12+pfOrYWECRxYdvXsJfoNqqi8b8MUEO7QsSIwxX6akVFTn4ltZBON4FZJUUW4IHEZnKBl0dlCEA7EHV5Jg57ZX+eM0zXfOsRX7COz5WK6obxs3ISFZjPsx0GyPl4jD6P0a8sAc6Oig71wqpUEWuZbOVhKDDK13P1yQUV3tJks9v3YtJtgtAafbJYHIKNt1iQ54Dh0V89Kmy8ySwrs2HFROWtTvIv1Ds975W0DmapxyitBJvb0rGOLF4nBAKxg1tTZF+7PZ9khdm+BaK60duu4kCxg9Ui2q1jg0QC8JFsIHlPPHJ3AKaBgvZ5rqWZP/lTyJ0cXROp0dXDSNbW2T9ASeLB6YVCIOmIRyPn1jYjTESz6CADdwsyMYF1Tde2o6SxgLSbVEtqeoY5yEVF3W0syphY7G6ohbWRXeumkv8NAtomtzX1aRPJmDnlV80GtkIFGScp2d48empeVsDWUyV56SsPwi34T4ZfUX3+m08qqURoWX7lB036D2s5NUxj9yyY/IhwFMUybylI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(6486002)(71200400001)(6916009)(478600001)(122000001)(316002)(91956017)(5660300002)(6506007)(2616005)(53546011)(26005)(64756008)(4326008)(8676002)(66946007)(66446008)(66556008)(66476007)(76116006)(6512007)(86362001)(8936002)(33656002)(38100700002)(38070700005)(83380400001)(41300700001)(2906002)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE12CED4757E434D888F13D905B8710F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8213
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8dec9a73-3a49-4c45-921e-08dabb5ba47c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o5VdbEHgcaI95j3UyjN2DoB5yLstgosr9Cw5YUBF9gjjX2Xf1mFdcEOqnxny+0JHhF02F59Y4Y3eUCmruBXuiCK4F0Bf/oFeMxrtBeSgwIjCyubO6WcD5lmEobzPIkYCRwhmYpf93lO3W/7q4/CJ59HxqruqYziFI7B13ysCHNug7BoRDXiJk2tJWbtCrMJRH7N5djRmtXtTQtmEHf98wKuoqpUY/QDYY4u7PihRiVoIE9j6XgsZULrm2CsduPJbFkg6sxUejOy7pnV5semfOXT2BGIcppSGXH8HdbDPYG5OOZGvRvqN5Kh9S2YqGfIFG3kJYOclah5VyrxjdnjAuFPY8XtSe26upCLmGPg3ii9LTGinTJT8z+ubgo+hldeGrDFbbZtgieBeOZMgQo6x6tKiOasofDRabh5FGNdMWB3/ffO01LMiRvsiDJBlx7AWFZ16bh20U4av7glo9rvt6DxuHgvu0dSpQdfdWUJ5JiRvzqGR8PaGFpbe8NHrugYmyMugAOi4vKBiqP/eau5fsRnU4Q89wLxiomxrqvBCtLjcpylUOd32a21/W0caAnzYGlJ+frq1ePaCUijzcaKY008LZWYS/7B8/+JYfP+ReKpMHb2uhsGyH1BCOFzLC+q7gCPhwlAL1WgJVAkdaC0c+QxobVnX2KhJVMji4Z5wkfbkJ06IYe75SykrmDI+CsGezj58sFTIbjhunkW+9XZTvdCWFU9llb0pqNnJpbrh2xGc3gyppn15p0SGEFf+PbJNUggPGnn7YMwQZAFsLyEQiw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(86362001)(83380400001)(33656002)(36860700001)(2906002)(336012)(82740400003)(356005)(81166007)(5660300002)(8676002)(70206006)(41300700001)(82310400005)(4326008)(8936002)(6506007)(70586007)(6486002)(2616005)(186003)(6512007)(53546011)(316002)(40460700003)(26005)(478600001)(36756003)(40480700001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 16:19:19.8320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a90362-51b6-46df-5384-08dabb5baa34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 16:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172330

On 31 Oct 2022, at 08:17, wangmy via lists.openembedded.org <wangmy=3Dfujit=
su.com@lists.openembedded.org> wrote:
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> .../systemd/nativesdk-systemd-systemctl.bb      | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta/recipes-core/systemd/nativesdk-systemd-systemctl.=
bb
>=20
> diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb b/m=
eta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> new file mode 100644
> index 0000000000..66b5ec5e6e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Wrapper for enabling systemd services"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +PR =3D "r0"
> +
> +inherit nativesdk
> +
> +SRC_URI =3D "file://systemctl"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> + install -d ${D}${bindir}
> + install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> +}

As the native and nativesdk recipes are almost identical, write a single re=
cipe called systemd-systemctl which uses BBCLASSEXTEND which replaces this =
recipe and the existing native form.

You can then fix the ownership in maintainers to refer to the base recipe, =
and solve the oe-selftest failure too.

Ross=

