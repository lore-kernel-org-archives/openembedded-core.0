Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ED7ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:20:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web12.5671.1662542407699718113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=sXsV1Aog;
 spf=pass (domain: vaisala.com, ip: 40.107.6.75,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW/4hfHB8Qi7fe8Sjl7n3Ev+xSfiRzBlXvUTQaGk63Q/zWuQKQfFg4UcVUcUFSnq2+P7Gy31CDHHkFX5vxDZuekDYrXMrDyjtl6YLdpY205ZBaI1KSA8vKVKDpSFnNGP1Uzj+0HUOSiiMLkAEmGbIRHHepECbqXI/EuVNifPs/ePEZrlPqFQ9v4He3/E5JXAg73bW7FJgJ/IcBT/YoCKDFFomgWXvNog93mrYyIBpLSPC+/bYnO0MC5ebaGg3sEXg5x+FbE6vjM3PiNJshOsQQGYIz1Pp3SGrnXBHO1B/R3fS6F1FQ2IIUqlZRmwztiztbNjEEA+v9M1nSmsfoxrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mofF113pYn2v+FaAFYv46zueXXMlXW8ZRI2zuAA9tk=;
 b=oZaxYvllNVgeDw2V1sUssZlTDcMBZwo2dE7hY1s0uJXChOMDdT4eSHMEa2scQ0iehvm7P+PZQGMHV6kf9zhbOVBtD2ktKM/jpXyos/ko9KXBMgLV7oDrWQ3knUk0l/oClaoanQqjjonZ88PVs+xPJB/UzQa7AoaPlG2kwDv080blFoYVi5KNAG9htB07JNEY036zMNitVAvwBY5E4ZHT/icXFf7FakjjIx2d71bKqW4Z1niAWIcz2qV1trKHZuf2j68KADVr20njOYRmiViYo6UPpmydq/kFA5OnsuljZShEpv9S/dEeCZtAcVZqWu/mV8SC+05eOweVk0NPfsvxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mofF113pYn2v+FaAFYv46zueXXMlXW8ZRI2zuAA9tk=;
 b=sXsV1AogxqkuCk7/aHH8god0ZdIWTc9txaEpvYmr5VQHNrIl/mKKeIIwnj/L+e5MFydXhFLZ7O2kAFf2eHUPCfgZI6jwXqjO9BoTxATIFk3fK+MfDUmCtjmotIY6ctzVcM384TRgx6lnIF6mxPAlDBK91hZfJDYacfbhzNR2o5B6ZQKPifYdmGUXW6G0+D/s2SNZPSt72QO5HAysXC67S2PU/+1r+qrz4G5MTVsO8EsfWqsj6COXFgfe+BRlsP4df7nQ37sGT3d7XezamFS5Tzal+HBAOcaSdvF1TV3EhPOAPRf/qMlYC66LRFVp6OoAh7grEMOfZrGg1FUYBSI6Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by HE1PR06MB3146.eurprd06.prod.outlook.com (2603:10a6:7:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 09:19:42 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030%3]) with mapi id 15.20.5588.010; Wed, 7 Sep 2022
 09:19:42 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2] systemd: Add 'no-dns-fallback' PACKAGECONFIG option
Date: Wed,  7 Sep 2022 09:19:20 +0000
Message-ID: <20220907091920.3239552-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0098.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::30) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7accf050-d1f5-44c6-000e-08da90b21882
X-MS-TrafficTypeDiagnostic: HE1PR06MB3146:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9j15c2sFqkkX2Z1cI2l0SKMmnAz/E8IcmWlai5OrGVmJ+cqdBNaAruObeL0zYCMGblIXvmJusPlagPqJt5cWB8eCDBb6WD/NMVXh8QGsremGPmzy3DpH+KU4MYBpTj7XIr2zI7pNXiXM2yt5p19IMI82NYp/v454BBW/HIZHs1CW1tXtFZxThI0aglTekXJHZg6kEn+3CehYUhXCBKSGrP/X2X/nEI/fJBlizqluWM/hGrn+YopW48F6mqTA1ZfyNWR29PpjoNaWXcVuLothLlk2Oi33UGW7Lruf7ynQxSghgL4XYxV7Thz4wJW9j9L6XHj0f6hdTDFSYzXb9hx+UCsbnHd7avbyn6Pu1THSN5O7JOurvAqnc+dZw9P/+M0Vo9vKVhUagsfNzM9zXUtETo9rdmrGo1tb4sLSjIWUYJ/uUSvgIwK01KBclg5HjZv6E7cZePXF6Kj4fHHWRF7Q/Q3USJriqtSAutFGa7V3kOjQGgYp7xlOf9Sd5duONnY7pLpwocmrar8vdCMxL1XPJbmHV2d3XnA60tL7UI74Hgce7MOl/gztZcf4JfJY1srmwrJSiyKcf9paPXGuR1yQ2gZSaMjAq1Mi+tA5WDVskAco2pmbVKUpCL3ODOFePSEJ1qOh8XJJyO6PgHzILeqZO3wag2Gs4SFLwagsebLaUKHQuOFtSg/KjVoThI0y7OEtz1dVk75LAlmJocsO1w7LpHUWG2/yvtqYHGn1ePxwSsbLAhPUPfOgb8uNoAZ/YrsAFOtIaB5EusAn9kiHi19OKaD0is69BFWEd/s9LQSl1uc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(966005)(44832011)(6486002)(52116002)(36756003)(478600001)(86362001)(38100700002)(38350700002)(8936002)(2906002)(8676002)(4326008)(66476007)(66556008)(66946007)(5660300002)(316002)(2616005)(6916009)(107886003)(6506007)(26005)(41300700001)(6512007)(6666004)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8UewYqrd5gJGWpWLbQFCl3enYstpOxs9PHUw6BcU+PLJEADxiL9odpy3tBoF?=
 =?us-ascii?Q?hZ1moJjrkwa4y7aFFIzSUb5eVbeNByPgOaXGmiDTLqGqqUaq9hrteOM4Ou9s?=
 =?us-ascii?Q?Ng7dJB30qtG1/CSFGiEwFRSNG4C63MyHqOOgK8yHoLGpGGl+9EQSist6W1n1?=
 =?us-ascii?Q?8AllTfl0eREnrDy1e4SqxK0rO9kCMNS5QuJuAc0MeDTFmrpdXOSxSJ8Smlel?=
 =?us-ascii?Q?mn7KLl2AboiseG66rdWG2WASXu16lfpddonVhH+su4pMEZuS0qTzZJL6QdHK?=
 =?us-ascii?Q?P20s16fqkoaltUuCB5wPfhAzQZFdbXuoTXbH2PwZhFBCieKP4eeYEZZMm84d?=
 =?us-ascii?Q?jCfpkcNglLAtUgdR4HE+tEFUAHV7cEKtyJjkQBEs/AkdwNqbfWU9B8SkqdSx?=
 =?us-ascii?Q?+paqhvu9RY4Y8VRyzJVf1ou1pSTP3/h4gfTkCJifWKSPVEvPeuHMoYC+LxTj?=
 =?us-ascii?Q?0AdSD7VSKOG67Bf2DRlx2hltPjYnLrGn3efuZaYkHh4QWjei7Ei/IVpB7Sxc?=
 =?us-ascii?Q?GPd9Cbg1aS6ufq687vgSIL4fg70suaDTVUg3eAbyFQy2mkQn7jlBhMGKzJM1?=
 =?us-ascii?Q?qdI4eG4+sM9VTpkEh1IT9qfN/F78NNhLnOPE3J+eVcYDLu3axuLmyJWcQCX7?=
 =?us-ascii?Q?OecuLxPG1EJ4XcTDMpJigkYh/RRcfVle9ntihL9cBXt1Lml51tbSmKSMT76R?=
 =?us-ascii?Q?B4wbl/VdlF8s/E+1HqNFWRp0g3bd18ijE4CSDB0sBWyxNS6JJGUvgtlbtVHR?=
 =?us-ascii?Q?AWsIiPzdhi97srlYpWzez+mnc2Yy1Yq/0kFJS+NaFGOICGFevELywJdhDE2c?=
 =?us-ascii?Q?8I6aIWVcxK/rkOe4UCXRTFul5i0O1OK7RZym1ZliMwrMgRZBWdIb9XyWKya3?=
 =?us-ascii?Q?H9ZCheVWeIzz/fHIZjIt5np1wqpf5TxYZPGKNyVvnQ4gMPBKkec4lIH3Z9mP?=
 =?us-ascii?Q?zMm5XXHLUkaTBXj5ItXr/KiHIbqmZTgvWPpDbQaoLX1YJOQEXCjjJHH/3Ejg?=
 =?us-ascii?Q?7G+IcOdGK/3WfnIyweOsGjDuWRLk5EKUqLNT8HRocj5AibujTgydLvS6QnZY?=
 =?us-ascii?Q?10K+z2jiBRog2A/Wi9rHyLWBFo3RQa979AcfPZVTvdNg0eledVJSDcxEF1gK?=
 =?us-ascii?Q?IN8/kOY86lkyUjkwQr/1Cu0Qmt80z7tVqV0np5nudnnjK4/gu9XEdf+yIIYo?=
 =?us-ascii?Q?qeOS6jRyy/Ccd1F3oGjvQ36XzfLAY+fyP14YJMPm8p63AckPHc0LzLBYh377?=
 =?us-ascii?Q?4a1fL7tTV0SrCeRTwHW5UN8K8wj2ZjZeix7C8p0SwM2RymF7XRC4rm0gK4Sw?=
 =?us-ascii?Q?k4Y51Dn3QtCKiZEmDcdfz3kqWTimKalSruDFpsRaJgdyvaGbmTqqed2hrkbw?=
 =?us-ascii?Q?CWbaJeT7ZxoUOSfBj56v6a7sKSAfYcUJpQtkwXb+oJUSKwq+EB0LukGqKqVD?=
 =?us-ascii?Q?rVLha3sJS3crXL0nk0x2zMB+ITduvv+aVcLs0avRT3TtUCAT0Xq1UJawBScZ?=
 =?us-ascii?Q?9/IvRcWhU6ceUC1A4IS5O+4m+0lXCdWgTfUsMiKUtvwxlEE/d1U25UQN0IGm?=
 =?us-ascii?Q?LxhVWvSLZEZjTAWy3LF8QsAmFYNTNx8b8XOEyDplaXOAjOZZvhQgEBPO94aO?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7accf050-d1f5-44c6-000e-08da90b21882
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:19:41.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BtsH2WAyWBQshF93snNdmjmSmiNYrlB75IoN4N3saWzyt5TtIJHbF13JW5y1y9Umgn1eolcZOGNkIIz5KbyHPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB3146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:20:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170379

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then adding that value to systemd's PACKAGECONFIG, the output from
runtime 'resolvectl status' command no longer contains the following
line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0=
.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dn=
s.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.c=
om 2001:4860:4860::8844#dns.google

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core=
/systemd/systemd_251.4.bb
index 8497e24af9..4f684aea14 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -129,6 +129,7 @@ PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredu=
mp=3Dfalse"
 PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3Dfa=
lse,cryptsetup,,cryptsetup"
 PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-tss li=
btss2 libtss2-tcti-device"
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
+PACKAGECONFIG[no-dns-fallback] =3D "-Ddns-servers=3D"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
 PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LIBD=
IR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfutils=
"
--=20
2.35.1


