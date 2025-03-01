Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C978FC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 10:01:46 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.58])
 by mx.groups.io with SMTP id smtpd.web11.6084.1740823296289940100
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 02:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=R0e4YrIz;
 spf=pass (domain: siemens.com, ip: 40.107.105.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+8TvRo1YIB2N3qnHuMsPThtRJxcOQvT+0/Wu0VQSpjjlilFxa8tx5cPK0174Sv1LUNg3aWhoang1V0mLLxjox/HMlGFc1VAmD137R8yh9vwVH0gMYr6u1Q2b5xIQsMa9MGrr/un/XkaSc2W/+9b3jjjZ3OFG+LP/+3TuMd5nCM9ivkMHoq5zf8sRnEmuSAb3jMxnXs5JhW1Iw6IJb0l8C+JDP7PBqF2ilF9PY3SOuJotBuXQ1o101O4fmWFEf9Z5j8X6er1NSHO8QHmtPunAxp+K/qvZ7/JuxXLQr3NWFDCczYfedYEmGKQRj23BGRCVat2FTXl7cNx69iJ5gE9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzx6s0uN8VKwiXIdRJA02nLxGPr5DUTxp/JO+6TGf8A=;
 b=vM/qNUzJv/2S9Tlsnz3pcEdPm18wO8Q53E6SDw7EgQt+Re3DoK9vms4iUtXmlCsPX0Jv5s2jsrNhwvFdouomRbbhdBUw48eA+95XtcojW/PJK81qPk9A7KgMEBIthdxyE7SfjiKwIk9oaCwNJl4x4Vj0hjWhXdoduZlaZCpb07nuO6XwfeCuZjTj2sh4BBhIoPIMgtblFTagChVCBiZ1mp6x9YLle6VA9sb4FwvpAkAgDAg82YBoR1uy/HfTQkEhnfdJSgs5rSoRvgsierPta/YhpieLCVqpKpFEh5qThp3ZVfuY2mvNI19FIX3XFgu676R3P89l/LXBBSDOE+4ulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fzx6s0uN8VKwiXIdRJA02nLxGPr5DUTxp/JO+6TGf8A=;
 b=R0e4YrIzrCnGiZ078H+DJ1ZsnjQa61iiDyOVAt2aO+5pdCDNWmDGHi2Nb/v3MPlQJlzgeaoDeMHp1f4bfk4LdHJ0NHp2LfH0cuv9E6JMPp302cipTw45dI7Oy/HV8ZJ0Ea1gkai/kQI+KfTx4keMw+nhmpSwpfOEGsEr4sgonDfbzt2p/hOEa88LegiCc5z7uvVs0wyQjTaNGp6oDoSDVTFBbq0f8nNmbHsgqA5eelUeQF03hzjsAheD+rH5ePnAc8dGOdsGDq/QpUFCi/5jjGbNqkr1Zl4eX1YhO4BUVY4wOOTWs9lwNAecgQCpnwwCUdXoVawXIWZA5a6c8RxDeg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sat, 1 Mar
 2025 10:01:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 10:01:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-update-nvd2-native: Tweak to work better
 with NFS DL_DIR
Thread-Topic: [OE-core] [PATCH] cve-update-nvd2-native: Tweak to work better
 with NFS DL_DIR
Thread-Index: AQHbUUPwjSkiOFkW50msodtxlS4947Neewew
Date: Sat, 1 Mar 2025 10:01:31 +0000
Message-ID: 
 <AS1PR10MB5697639D41EFB1AFE495DF11FDCF2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241218115634.1666697-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20241218115634.1666697-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2394b451-a21a-47c2-b84a-79c10e036f4b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-01T09:46:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7066:EE_
x-ms-office365-filtering-correlation-id: 3c352a73-65fd-4e70-1d68-08dd58a80b06
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?niZZ0EygPTYeQ3xDa8T8x0oDHkW5ioCk5OvujqbvEHmsNnhB+hI4KNTzIjB/?=
 =?us-ascii?Q?2opaXl9uvw3JCg9RounwjS4svSuGNtPTHgbf0+TMnS+NEHB+L2W3aVmer6eB?=
 =?us-ascii?Q?dL0BoE2lk8kBdeoLhxYThPCiaMjZqfnpN6F9dv4I/Ui22L2+ROye2g87raMq?=
 =?us-ascii?Q?nZxLH64n4mNOAQXfLlqIrXr1O3GgyqNbin95Wk5DsZgl5RVndrGegVEaShnG?=
 =?us-ascii?Q?VP6V6w9KHxqk4XpAk8ya1J0VN3JUZOGs447N5cvEUH2qE7NU3B2dusHZFq4D?=
 =?us-ascii?Q?kn2G2iuGxD0jhOcbqy/nAJgANGpPi7pF5YAJKAi5rSVRrcAs944Q8v4vLQCR?=
 =?us-ascii?Q?Lh5mA0wKNw5t5qwWIt8BfPQRQNNS4A1BHuU7xFrmbOZcD4fHc2qpSZxTCFFk?=
 =?us-ascii?Q?gr7rUWXh07SM32/2ZSta7VD+jRt2UQGMneg+ho8vh5Uaa9PCWn7KzrPnZCVK?=
 =?us-ascii?Q?RU2K24Nl7S8I2jucHJ983ClSrR4vMG+HnnhioC/Ah7y2SWSj+jVYHO4XMYoO?=
 =?us-ascii?Q?gwG8YSppg7GZdz1fY9vLY7YbXrqCfG9FULEhBXn66BBIQNKeFANBK5ajxn/P?=
 =?us-ascii?Q?D6KDd0E2A4vpe0piyNfHVwajxVGr2aSeeTGP1h1mq4lEBMi7ASyR+vLRcdMt?=
 =?us-ascii?Q?UqXctOfh9QnVLm/xfq7Sk8ILPLzZeu5rjFYGFXUBcVsBCO8n0v9eCwG/krYr?=
 =?us-ascii?Q?YB7jTXo57i1fPJjRGZ8I3y0wN2SyAqrnwxU4Jpu2vsyG1TIuv8X6qyNswXIy?=
 =?us-ascii?Q?ILFk0DwmzwBaE7JGFdDJjzywFjwzOx0LfbFh9c2UAZPkYFuONRhlzkeAxU9N?=
 =?us-ascii?Q?cj/9Pgv3QDfBbdFpOHBTK4MLvlDtvWynSh1a+JOwTAMRC0lyWRdjTuAEEBnX?=
 =?us-ascii?Q?xyGuoy8M0eR4/6nc8lKemrE23Qy5rP5KS9Rqvh0ZrDC0ZiaaS6omd5rsdprx?=
 =?us-ascii?Q?V1iY1/ONhKlhPstd4xTPemikiiMb65OMccqfRMklAfb81FWWAxvbCsB43Oql?=
 =?us-ascii?Q?FZfF4lmQU4LoxB4VqfqQLWAZ8rHm0B4Yw/oiwkPlgIehXPVxv+UuyOKeHhER?=
 =?us-ascii?Q?7yTvvtVYckYnxDqPt6XF7AgfTZfOdQmAKEirNR5fI24VBgUhpj2Cm7x+CVvH?=
 =?us-ascii?Q?Sau2yEFx8+hNkR03okTXnNxU6BHgIzzsoQuRrc60HQi1wpfpIxtE/iyaz6Ly?=
 =?us-ascii?Q?bykzMUH9L18DkzVz4OrVTBojPwpyefhGiQYWGLAQ+O3OiPFy7Q5VY9DfJrnV?=
 =?us-ascii?Q?IIM7Rrux1cMrNRyzHGBhN4G0YnMQh6uEc82J/TUekkCAkzQq2GlgHMSlv/5C?=
 =?us-ascii?Q?xyWEoNMqorSDfUOMDH9nywZGBiXnLuH6QBPP61BxHEJHRBlDVouL2kf0iKx8?=
 =?us-ascii?Q?n9spqZ0dL1QVSDCbT4wQHjl3PVmDVOencx3t8eWDp+mw6IxwoA2++2xxHUsz?=
 =?us-ascii?Q?778gw/9uVY479BZ6fhBeWSvVAEPj0BiC?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TpTRv3IO89N++feLrBGs6pWPSwj6gT+hMqpmGg+VWcDlnioRxDlIbTvrkRvV?=
 =?us-ascii?Q?iV/FPd4yn/4d7yLkGVdkxyj+0RAPf5ekyRFfReQnN9CULn0neqSS3M7ky9yc?=
 =?us-ascii?Q?97JcFkEK3Ie/S+qZGHmqVapFttsFTkhgjzOcjmLR0FXu0jf20KnzYxHD8Tjc?=
 =?us-ascii?Q?dTi5ESzVv8tgEOI3vH6XuDRanYbuIyD7Zg5tEE5SouVxbTwUJOAERlE3rz4d?=
 =?us-ascii?Q?ttQ3LQXonArh30SO+it6dKb/4E8VDiQ12mzhIfFc5lAE7qlh8DcTHefXHepR?=
 =?us-ascii?Q?DkLCM16k/Bdu+XJkslokAWs5aRZ1B/96jbPWdg07o+GEDbS6hMfq74oejMFg?=
 =?us-ascii?Q?aztZ4c6T+716PDjeoQAG4MUefoD1DTrDPhsyYPIvNlCEFcW888dEOLMJhFdX?=
 =?us-ascii?Q?+3fe5nOjqa32bRtovkzStDZcGBtGvK9VFMVtUH9+QcAIO8v0mAcLTaD5LJG1?=
 =?us-ascii?Q?YiAqw729vrCx40hPtOxs0Jl6SrAjyqwDc9VB0o3YTX2sNe4dsA2Lp2ly24IU?=
 =?us-ascii?Q?C96BtCygVKZg0lPAu9AOcoRe2fqpObPwqbQoZwKq03/cPY3U8bG+MmpzPS9f?=
 =?us-ascii?Q?mlBwKrWI7rvJ6sQmG5NO/lH39gewPnGryBhWGpP3Vv2YcyeozK2EUwQ+9+78?=
 =?us-ascii?Q?975VSMKZHsO5phfjCam7MZW5wl7hWbnahKVtsMEHJmHuq4+/HhA7zAavglLT?=
 =?us-ascii?Q?vtYLS773u9UeVlkgMYiPDBXrdma8yqWCJMbwF3AV4tugVv0n6I2cRmYlq9RM?=
 =?us-ascii?Q?D3jmFNih4q5ETCsY/QXYglOt7/qbocltkQPyMHAN96h59qk3mEBeJmxIAtnC?=
 =?us-ascii?Q?b+J/kO1OrSd0DH5Uv2Ypw1KXGZWUF8KHdJZY8sR6Ctaoi6abSmRax6r+3otY?=
 =?us-ascii?Q?TozMDuAeyPOu+c3bTTZdT6seyqR9pc8vsJHJwF1lAjRSyGEI0h9Zipq3Ytk3?=
 =?us-ascii?Q?5TsicHoTcoJsnzM9AyjmR1gyUbSrNiwHf3yv29Ar2mNnu/Y8oc5txsTRemAu?=
 =?us-ascii?Q?rfedfYJmMNvbjX+PonZbxd8L3wks16b1FizWUthnFweGttahceOczO3tvrt/?=
 =?us-ascii?Q?X6SJFtv+s9cokRE0uGvEmAvwhOtxYzzQHSTL930jkF3wbMcKKczA+rk+kWdA?=
 =?us-ascii?Q?WdU8rElcjj1/huwxIBdHL065v+xUP28VIAlODleC2QCbUK/UZlstBLxNhDe3?=
 =?us-ascii?Q?V6AiS3USxS/aFGjgi6Qfdr5hypFYCjgy7J6ZdkhnHYlC/ow2XRut3IC/DqS1?=
 =?us-ascii?Q?0xB/CZ92xwb/JqDTENgwWnGDcg7l2RK5yEctAb18yp1LcMAWRXmeHsg3oUNH?=
 =?us-ascii?Q?gnoevMisOz5QlGCR780UTfXe55xk5CD6kOq7utPA7gQi8Zltq/+6Uu4eY4h/?=
 =?us-ascii?Q?CmVsdSdKdEZfXW9zbHCok0HiM5HjbFOllNoQqd1rumsN92oWfVDLPImUk2u2?=
 =?us-ascii?Q?rHhTmcZaTNziFYuPfbumawEQghZOJn92b6rpvzDbvY1yt2JSGA1FPDQArxCn?=
 =?us-ascii?Q?mqhrIrOgp/41XRrm7fqGsyAPh4VroynFNsjZfVqKcASr8zr3QWj+KCh+FBEE?=
 =?us-ascii?Q?4RATgR+Zxtn1SEwMVsbSPMEcdX8GgOh5tCFfC7zu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c352a73-65fd-4e70-1d68-08dd58a80b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2025 10:01:31.8607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmBnsEK0kBcns1LB4eff+ZZHcrUL1/AFptJSMnkKNVlWTEkMDUduPISaDhFGMtzm0Jc+Zd2ScxIJgnFqjcQPMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 10:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212094

Hi Richard,

I believe that this patch is causing problem with the database never expiri=
ng.
I was wondering why valkyrie reports for master (but not other branches)
started lagging behind reality and this may be the root-cause.
Currently it's off by 1 for kernel CVEs and it's also missing puzzles CVEs.
And this commit is the only one in addition to styhead branch.

NVD update code is checking database file timestamp when deciding if
partial or full update is required, so that code always decides for partial
update due to this file touch, rendering the logic non-working.
And we know that partial updates are inaccurate, and we need to do full upd=
ate
from time to time to fix wrong/missing entries.

From this point of view this commit is wrong and should be reverted.
Or rather replaced by something different.
Maybe we could add release name to the database file instead so that
old branches with different sqlite version are not allowed to modify it?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie via
> lists.openembedded.org
> Sent: Wednesday, December 18, 2024 12:57
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] cve-update-nvd2-native: Tweak to work better w=
ith
> NFS DL_DIR
>=20
> After much debugging, the corruption issues on the autobuilder appear to
> be due to the way sqlite accesses database files. It doesn't change the
> file timestamp after making changes, which for reasons unknown, confuses
> NFS. As soon as the file is touched, NFS becomes fine again accross the
> whole cluster, as if by magic.
>=20
> We could try and debug further but putting a "touch" call into the code
> is easy and harmless. Lets hope this removes this annoying source of
> errors.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-
> core/meta/cve-update-nvd2-native.bb
> index a68a8bb89f1..8ef13bdde6f 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -90,6 +90,8 @@ python do_fetch() {
>      if update_db_file(db_tmp_file, d, database_time) =3D=3D True:
>          # Update downloaded correctly, can swap files
>          shutil.move(db_tmp_file, db_file)
> +        # Need to 'touch' the file to ensure NFS sees the data
> +        os.utime(db_file)
>      else:
>          # Update failed, do not modify the database
>          bb.warn("CVE database update failed")

