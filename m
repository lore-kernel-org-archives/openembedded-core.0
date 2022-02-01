Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FCCC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 18:58:54 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.59])
 by mx.groups.io with SMTP id smtpd.web10.53472.1643741932159252076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 10:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=brCMoEiv;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.59,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo58xnZ6v+YGBMpXtMIhPcmVcJXB3bcLvOPyrImz52KIfuKSFfgRdhEnSF2GDDELkhiHbxN0iHrITGIOcc/mPK/eZ4g8MiO0R785uEOMVONLoDEMOZ9WsZ+maKs1i2843zrkFxH+RJq4mMr9ZTzANValhAh3SiWelF2z4oRzRow+yL4vNb/hkVYuZ0qTcVs5jp2mfCQbPrpDFWs+YchE+Zsb5rBrUQAyfNs4N7jg45AgzPKk24itZ2uyE2f/bnKRTXXwIjVlxnee9ypdvqd2k86uEXhr4yal6IaAHulwwDb97k/iB8qPZLq7JhhdjJE8fVkIu9cYl8l9dQRCyZ3fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cq4lOJAp6V7wxmBiRXW0PCkevC618xMvHuIFJkxSvo=;
 b=ZxKV6L7kn9+nVRtkJNriVNMEMWx+nKzF16tP5/3Tm5386qsDahVYPvQBaGtb/F4Iv++RgHGZ8yHHibOJFZDr54B6UQ91E55OnUvlbgrvBVMW4eOA/oUk/Xw0kZBgLixaioJCMYw1tcBZ6qD7dr7fzbirlaWvXGZfJLydCZdc7MaKhu2UW2AIkmt7j+OK3l5sNBt55adVInW8/18OS5QhLl+dRCidHKBK3teh1yX9hMPl1dzj82KyhYZDr2FBZGGgBIZs+4YDKjGRZDLZh4slH/9o+iDahV3U9ZiYyodyxo3wfdwoKbDcRUPXxN8KV22xGiSdVKlH0MXgyE1TUWGBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cq4lOJAp6V7wxmBiRXW0PCkevC618xMvHuIFJkxSvo=;
 b=brCMoEivc8oTdjqvExcHigj1hJ+rhWhHJhNZNuo6itqr7Ucf+BDKJexAiom/Waii4EddrM8Sr/c3E0qyCySVav+lpsFNxGJrwb1g3hHeWrw532sWfJXxbeuUJCx7Ggii3VPkshvxPoMQ3z+lcVNyobZ5SOEq48ZrewQYQHuTCdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR0801MB2126.eurprd08.prod.outlook.com (2603:10a6:800:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 18:58:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 18:58:48 +0000
Message-ID: <37a9983d-526c-f04a-a40e-979dadf4a5f2@weidmueller.com>
Date: Tue, 1 Feb 2022 19:58:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/3] cve-check: create directory before copy
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_ju3e+JbsxurjDLue4q3WeAfKMUQJqcXSF=5R2898-VQ@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj_ju3e+JbsxurjDLue4q3WeAfKMUQJqcXSF=5R2898-VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0353.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::30) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 588b2cb6-860b-4cfa-c16f-08d9e5b4e0e4
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2126:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2126FDF20F9ED9A30B80DDE9D7269@VI1PR0801MB2126.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sa1qXdfbVfcqltq1jYWkmPx5ALJIztSW76RltLbIKiYIgQZUeYyRP0H2IJe6JUdho2w6CEoQX/v/xaEi/gCaRb6zsvAHBz0rw0wTzb51CbCRNbnHHv4UV+Jdt1xUV9gFxvCUg14KMflRL4JVJKnAaAXc5N3YHr7pVrCzY5PDH+eS+1lrMW+38nPp8qLPAfYGxoRoLbv9uVN/B/NgTtAnzkbx/mdI1rFMoMY6tyQ4SMvDQ0NeDQ+2gUAXuaBrLEJruGlTsVak+WGONaLDhdQq5wIuz2s5uCqaKgXhVkjA/PQ9itDpwL3IL1th0waHZUiYSUF8oxAPJR2Yw63HB4eM/vV/Y4znpB/pVwOGhU8bn2ahSMLdcPoXVD7qg/0IOfIzYJiuBdEFJ4lh0Isc23PPc5hCz1LXUsP7N81qZxMPHPp6afD962ZtCqlFfR0qWMfXARC2+qFgkcV3bXQg6AaG83/bx1o6iZGp1INS+5+9ccqENKZq7MkmjOw/KTEy8XH3QTnS6Udtn2p93OU+80/TyM2SHrkBip4AcZAlmYVxxcC3LFrvUqKlc+P/hxfgqps26NqBZj/COp7rQS7tEEENrBcJzEyvQfVuF8oHWiRlJyTQiYeHTIkUI3FiUQYh0PTZtd6v3hYM5SJz5NP6XgkdjQAqHIg/XO5h4tgw+rYryxSEzLY8xjfjlsbhQuhP/oj7seYvGVHbmjQObKukkq8FxJnAsfgbM6GUPdL0JxKTz/N3VceGVhjXGRLJpfm5GgOQKu9+h2fN1dMG0MnQAco+JmytFpcFKWtlJEl0efDEv+2UgynhqjfZtuKL1HwUPxgResmwRkoMXtht0wX2ZOi04w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(31686004)(83380400001)(6916009)(316002)(54906003)(966005)(26005)(186003)(6486002)(2616005)(2906002)(107886003)(38100700002)(38350700002)(52116002)(6512007)(5660300002)(6506007)(508600001)(4326008)(66476007)(8676002)(8936002)(66946007)(66556008)(86362001)(31696002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vyzAIrYa+NOib4ZukfH5ECV3bL8bEV8mdnhXY5+HDbjrh7RWu+tkOYjiOcD3?=
 =?us-ascii?Q?oAhrEfTFH6ubhd03b+5uK8GoYBq6nKdmSHJhdsrUKsXkMbjeOrbz6TbvpmhH?=
 =?us-ascii?Q?tV97CxewCgA1DSldVOE4QIcoot/UZVobx4nqUGtLA2wtxLrVo724MFLnAm4Y?=
 =?us-ascii?Q?IEjKbDheEOujby2cJ3JBuQFl+D4300nJWrSO1SttVoE5i0YK1TXGwY5Bs5eS?=
 =?us-ascii?Q?a7KmcceV1gSNuZ21gmyNZQpmlkm71BwpbRgtYQ9DMu0hBk9g4q69KI0cKeWy?=
 =?us-ascii?Q?iKkqtrfbyC782bad2DzmFh6YRXJuGVy/t4TLIEMm8+x/c5Dla7eNPxzOT0yE?=
 =?us-ascii?Q?+ecOjrVKPypkrJFJUziFmQyGLDG/RHCkjHSKlNa9F4ureYR/I9jPWlO7gsHi?=
 =?us-ascii?Q?Ker8EB9pUDlmyuQDflImLWq8w/DVanCwTZ+zwEW4fCWxdnGKij3EkgnsJBgd?=
 =?us-ascii?Q?DmUEIM8MXXPkdezS6PqE6MjWYX4LZkKrl7ZWoiuep9Lbh+jn9TRdHzGkudp5?=
 =?us-ascii?Q?G4L6bL2MUU31B7EGJsNE0ank78Q4IKpvIwa0nsjKgckUtx+BUL8rfJy9KobO?=
 =?us-ascii?Q?gA5GKiQ5qrUFVmVYJkYbd8UdEo8veUrs8Lacks4N3ynIEi2BbtlToLCH3J3S?=
 =?us-ascii?Q?GnwCmteEbxc6dZaW8qWS72uYtm90YidEraH24VZPzuJbZOZS7kZr9qU16zmP?=
 =?us-ascii?Q?4V9Q7zawJiIYrHYddrNvamWqt/0CEE4XgLsiFumocqNm/tx096BnI9YEwQ8m?=
 =?us-ascii?Q?41xcBU7DgFq0r8nN9Jd1OTrKK/1cELxVBD+ZQY2G+avvt2RkzaXXFSHJ2tfg?=
 =?us-ascii?Q?KCWEIf0pgRzWemTLNkwU1fvR0t6IhA2KgRoNZ4SBSsfHlNsPW3N/sD/vYQBu?=
 =?us-ascii?Q?wkBCpqD0WSa/ofMMiO6488zwEL7Bw5hKdyWQmIeCYeFZLCpUqbZL2CLmvLeU?=
 =?us-ascii?Q?HjU1rB0A8RUEvE5hnPTSTo3v6fIbvzFTNFjzpTFIAsyVX8CIprNPwAeDGPpw?=
 =?us-ascii?Q?2lZgS4CQZrT6bV+D2YosoStxdD2mRc6EvGFKVLoKef7Jktf1uINgkEPtG0B0?=
 =?us-ascii?Q?TzY1DZRfa3pum54iP4rsMj/Vj629VeZcAs371mz9SXyxB3OcXzN5oB4U32Ty?=
 =?us-ascii?Q?hx928jU4z42/zSD+KrppPRjrWgABx7ie8TqAVJJBxc37Xmloi0E5TuN1DxCc?=
 =?us-ascii?Q?sX67bUH4a58lec9B8v2PXNQk9I9hShlQ1uAz8aMrVYAnd111ADliKFncK8nL?=
 =?us-ascii?Q?YEXoCJe8NXMF5NEV/MUFEixUm5KeYqlZCinVZbhYf6IxiaIyjbxSL6K47Z+S?=
 =?us-ascii?Q?tyQEsla2pHKGQ9Hsh9LEW5veh7uIFJN9+F5Fr6+fpxmhetqzp2XgqFSR09Hr?=
 =?us-ascii?Q?NEliPZ78ZL1PJC0x4ROkm+TWMUAzWoXQ8cNNpk+xHFMHDRvLrXOQUzzsalWv?=
 =?us-ascii?Q?G1YPrDGHupmyY0R0u7j6qdpPtZkAZ1sQFrTE0kh7oWBGhUUviFocSX6ZZZ0z?=
 =?us-ascii?Q?bkHiYdzrPUe3huA5ALPhlIzPqmjFD3WBBzQCicMuApACqll+6+DAihBeaoQI?=
 =?us-ascii?Q?FMXn7xW9t+xZM4yEO8iKCHyGy8LP5n7VEsAVSTsu7r56INVONk9xcjfbgEuI?=
 =?us-ascii?Q?3lDidoKEVpEQvsXET/fAFRE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 588b2cb6-860b-4cfa-c16f-08d9e5b4e0e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 18:58:48.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RZi2EGpsGu/DBPd5jejutWfnpKvb5sLHHdJ9NsK8tS1zhjf6pugRFo7ewldYVcWi+3oZanyFqFyD1e/P5PhiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 18:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161166

Am 01.02.2022 um 18:00 schrieb Alexander Kanavin:
> Can you please describe the issue this is fixing in the commit message?=20
> Why is this not seen by others?

Isn't it best practice to create a directory before copy something into=20
the directory? The patch shows that the arbitrary directory of the=20
CVE_CHECK_MANIFEST variable isn't created.

> On Tue, 1 Feb 2022 at 17:17, Stefan Herbrechtsmeier=20
> <stefan.herbrechtsmeier-oss@weidmueller.com=20
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>=20
>     From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com
>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
>=20
>     Signed-off-by: Stefan Herbrechtsmeier
>     <stefan.herbrechtsmeier@weidmueller.com
>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
>     ---
>=20
>      =C2=A0meta/classes/cve-check.bbclass | 1 +
>      =C2=A01 file changed, 1 insertion(+)
>=20
>     diff --git a/meta/classes/cve-check.bbclass
>     b/meta/classes/cve-check.bbclass
>     index 70d1988a70..a4d735c323 100644
>     --- a/meta/classes/cve-check.bbclass
>     +++ b/meta/classes/cve-check.bbclass
>     @@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar("CVE_CH=
ECK_MANIFEST")
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_tmp_file =3D d.getVar("CVE_CHE=
CK_TMP_FILE")
>=20
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(manif=
est_name))
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(cve_tmp_file, mani=
fest_name)
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if manifest_name and os.path.exist=
s(manifest_name):
>     --=20
>     2.30.2
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#161159):
>     https://lists.openembedded.org/g/openembedded-core/message/161159
>     <https://lists.openembedded.org/g/openembedded-core/message/161159>
>     Mute This Topic: https://lists.openembedded.org/mt/88836328/1686489
>     <https://lists.openembedded.org/mt/88836328/1686489>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

