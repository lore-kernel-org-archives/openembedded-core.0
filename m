Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0BBC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 02:38:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3583.1641436729662888798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 18:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IxpomboH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8005d9af02=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2062bsE4028158
	for <openembedded-core@lists.openembedded.org>;
 Wed, 5 Jan 2022 18:38:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MkH9ypRHKh4fH4tquR0QAc/W23cU4xap5wcCA2nwIU0=;
 b=IxpomboHQVXCwYfffg/najHm88m9bwXQDxj8j+yJZnZUQvXkV2olJefAcRv2zTY9xkx2
 8hnIzATQ++qdCPNMbNY+JeR/a/7Fs42FCa27whJoG3iRPZyVFM/a7CbvKYpYxwo9L5Xy
 HkJyEduPvqvQDF2nyYFU7A0hwrp5/TcP++ZLwC4FIUn6mhwQ4b04fNdVJjjv69nNYdJ3
 uL5lgkxK3sDU+BqnAsVeWRBG5VzAvyrC0/pgOnK0SE7uYOeXy82b5mWaCK0XvlTBLozq
 PxcpTcYuXge2XK3tCa4FSfJLz9tf++lQOFvaySs4UWkkvKv2ZaKwJCEs0Gona4RTjT6w 2w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ddmthg318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 18:38:49 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2062cm9j029724
	for <openembedded-core@lists.openembedded.org>;
 Wed, 5 Jan 2022 18:38:48 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ddmthg317-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jan 2022 18:38:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHfw9861P/Y2x+X921+E+hRr7m1EGyRTVKzJCJhsAqh6Bc5HdNeB0rDcZXmtPqKU0btUXgLjTcH4DIPXiH76XfyNlKscc92sWV2YTSSwJbw3smf3FzHQnkXVFTI6ZcxrmZu9b62hgIfs5YMy9TEgkzzSlORXn568jHlZqdy62/I5WkhDClsnxJsCmBZacVF9LVeklseLmW40VAvKjGDRck+lxqQSFsI1PUk9FzNhcG6IwZ9LJZgyK/ApRK9idp+dhlLng5AxhA5jVu9BVLApWYF0edts3ZY659WsSgeIe08QCXR5gwzVKqUUEgAJgzZafCXgqUwON5o3fkzV/8cKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkH9ypRHKh4fH4tquR0QAc/W23cU4xap5wcCA2nwIU0=;
 b=hwYZqbp61hbS6JeoIX0s3P58MU6CDiIfHD1Ox/fkL1yATo8fy0HXL6l+YXGlQZQAGjnRy4LmzKmWH47rtiqc/IjzieFn55BclaY84Fy/unO2MaT0qk/CPHbvvql9yiyDAXWv17sFwXO2Xruh+yUUwBOW2Cd6E8IE7PnJw083Ng40vh38cagquXuV1gdxv4XrzgcedcQDHh+eBy0+69XynTWXRUJCxf45BHKRXxQNXzeLO3UmT3lDvPZr0qJdT+ZHWsNNQ6PZovjCPp6p2L/Pksg3F/DjPmB6PUg0US3naa6PTdDMo6uAhdOa7ixAD5V9bnLuPO+9+kV2lHrkDjRVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Thu, 6 Jan
 2022 02:38:46 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd%8]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 02:38:45 +0000
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Topic: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Index: AQHX+u8I+M0X74xWF0aFf0Z/G/RoW6xVVYrQ
Date: Thu, 6 Jan 2022 02:38:45 +0000
Message-ID: 
 <PH0PR11MB51750B7FDC8104AD362275C4E54C9@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <16C48A4E435FADD8.12001@lists.openembedded.org>
In-Reply-To: <16C48A4E435FADD8.12001@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ba402d3-e8a4-43c5-da6a-08d9d0bda960
x-ms-traffictypediagnostic: PH7PR11MB5864:EE_
x-microsoft-antispam-prvs: 
 <PH7PR11MB5864EFD40C7F0272578FF59AE54C9@PH7PR11MB5864.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HE3HvpYakGVC/7lp8XFtsiq5ZQA6Yh2xhkkyb1EoCt01zCTaWX64pNgxWF5N60Be9d2cNjA3EK8kb2xq1/jGvqVETuWSyzmh+SD6+62PHtjKonJ7Ot6HrMvoEv39lrWmjI0+WixPaiKUWRFNMssRLZGB903Bf2sMqUKRygvCbB8EI4KH74+9rOyz8juTA5j3RyrgtfF6E6fIUGvhmYKZMBNQSnm1+a36FqIDqNtBLHKfiif6RnTmecy5m0+fLUmonbytk1okbQbkWAUwV9DXAZGIKwxxJ6QyvpnkUzkRhfoPbPj2+zOFzyN1DHpNxUC+5h4VaDiMSbv4Pf852jd8/yYb/hYg5H8KCoEUGYOMoGc3+TIdpCzY3WTLQCRzL9KTHoEXShsmC+TKn+dNCT+oEtq63wBfoqYV5KA7cWSWBKS8gmWLz2cXHkW1/H1xyprTVy89rXJUoG4aFrQ8EcEgOSkbzih+/SJmVVVeGreCl6njfYMSHn5WU2d1qVfePV0laZFNdd4xs162Lpt5w3JfmYNiPU4OpIwjGoA+QpJJVniT6lMIgnO2kvK5L0YGl4/+KTMrbXT2u4Wt47Ast1dJsAtml+z6k9EBRfNA1GaVcfdg2jcPyEql/CuTg3y9Z+6Mj71vrHuSNYSSWCf5mS3QSio3ppfWyoiqr+njaZMINrzIUs12q0ntJzURIRyi8u/C7jdsvs9CSuoGUmBn4r8qW/pu0aJTG/JDUjjEGKBXUUHsi/VRrvVAzOwxwIVdpwS3Q7ZqQECF3Ngm1P03mAz6sQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66446008)(66556008)(66946007)(66476007)(64756008)(38070700005)(86362001)(83380400001)(508600001)(2906002)(76116006)(26005)(186003)(4326008)(52536014)(55016003)(6506007)(110136005)(122000001)(53546011)(8676002)(316002)(7696005)(71200400001)(107886003)(38100700002)(9686003)(8936002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/VZxPdSJv78lfLaZZdSSaOfx8MTRqgS3sIRg95r1JmoP+1l2oACS/TZcoRaZ?=
 =?us-ascii?Q?QQj9qUc2sYVU7Wj868AmcFG3svYZ7Gw6LnEw5AdfVg8FVxLwfjfUhlAKqbGQ?=
 =?us-ascii?Q?sake9ReK/hamxoHzMDPob2uR/MecnNf2km5kcEigwcr4rE+/hEyR2DTOEgkN?=
 =?us-ascii?Q?e8moTy9BHbQZcgcxXJobUFm1eLnwqi0Dz36cSmAqpLVJ40jfIru3d/Te0Jnx?=
 =?us-ascii?Q?El7o7yQ4JVu7ibBd/SUkS+13VaIQpjuHRkaWWm/KJTxwlvEfqaJGnebHjVbZ?=
 =?us-ascii?Q?OyzntT8cRcFgaKtIySdyZpDUU3vFAziuBZ4snti6zuzNTAD9oXUhu1dg7GNU?=
 =?us-ascii?Q?nGGYD0T2UQvkfAl/Yqhvd3KfMt/ct1a1bDiIsEmZGOyysM2oyVYCShHT723C?=
 =?us-ascii?Q?X96m9E9qzGZcBD/XoGxUdUA5l4j4cBeNB6t6DHA1DktgYskSwiz4oS9//5vf?=
 =?us-ascii?Q?JrxSRkn37sM56UGqyKxufmeLdmuELWET5kkstfCga/fdPGKE1HZZzC0Yo6nF?=
 =?us-ascii?Q?jkkZOXrvQAtiKrDWYkNbWxCCM7aR2yME16thGDApIJzSeSBZ9YaK9hHnb2RL?=
 =?us-ascii?Q?KU7oYxvIgAlEZtElectWpM09/4GTRXbM2QQuwEqUxLiHoOV8Rws0L3olDeFs?=
 =?us-ascii?Q?PZpxuoRoR2ADRNS72u+ujNXzCiyE7eL7Yxhm9cOYlTP9AekVetLCdeNB3Ym7?=
 =?us-ascii?Q?yNJhqYcF1VGgPMBYDoH6TydG51r4vvmvNpg6tOOKFpj8oJ0yyUgd4r87DweX?=
 =?us-ascii?Q?h8yEB3KBksoSkg5eIYo4HCA5T7Mti52JRMTpoSG0TVxdc/MtTvDeSzsJuDr0?=
 =?us-ascii?Q?Z2fz4hkwsUF5iM824zGb1ELsLtfuiTaYpHlq3XSJNDgfBancXzkN6Pl/PXxc?=
 =?us-ascii?Q?KuE6JK5yig7PuolBFpbAhuqxYJRWcnOnhKwP3RQIbyvmMtsHWeP9grdJb9f4?=
 =?us-ascii?Q?MAjY/d82HamAqmObgTxi3gwetW+66Cv/miNqPZmsGBqLIkS1PYqKuCf7YJVT?=
 =?us-ascii?Q?dCdIHuuvTE0UPh6k/UHcbfjn6eCH1Wl7uJl9B3Oc8iDqQO86D5WG6wNBGKNh?=
 =?us-ascii?Q?ok2jk/DMte64StWAFRGQ/MdsJCrOMw6u05lWCPJweLwA0AW6d9xmVhhPyY7U?=
 =?us-ascii?Q?d4TA6wD6MnHCava4+XjJ8R0/CMUITsHvc/BxIrNFRLVONyZPIGcsQwq8Obs2?=
 =?us-ascii?Q?TLE92hu53M7HAAh507QgLgGxklE0NwV5f8WkMIsBqsNe3Z8AGO3ZLbyXEQJg?=
 =?us-ascii?Q?+EghVywCUnP1buq7hIUR44DP4xbUpqTOfggd+Fcr4s9215iSHKUCV2DdinYu?=
 =?us-ascii?Q?zpgYusB5AfU5CoUEULSKixSq/dcmhF31ICK8k/spLCSURicK1/g+c+BG9YCN?=
 =?us-ascii?Q?hP1DMjc03uTCPauyehSVj9fRMYCqTlBsGq5IC/n2AML3ne6sayMfwpQeaesI?=
 =?us-ascii?Q?s+jU/tZsGWf5ejsi0OSzxq/r18Np5jQb46CSfFtWGbIJTw7p2vqBNXvcGpKX?=
 =?us-ascii?Q?ooaCVUhwzkpmSzQmFuXoFfd7CkmkxhJV39mb2u0jZ3CO9tW9/U3XKMZkK35O?=
 =?us-ascii?Q?QwT7ofb1r2XeWkdOZPRbmai+S6bvayGlnYFuLnOF0mhyKyPIqrjaX5MkR5wr?=
 =?us-ascii?Q?PlA8EVLhevVv10WHdhIoTY9s63UhtgXwmYczJa5OBd6Y9d3K3KQIdIb7iKbq?=
 =?us-ascii?Q?LU3Plw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ba402d3-e8a4-43c5-da6a-08d9d0bda960
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 02:38:45.7166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 f6sZa+6p6maLawnPvBYrmQP1zW9xplRucN3+dAbxmfu2211ymvrbNcQlfgvYzdSFgQADdk+9l18WkEigE5r86OOVJC8ODkhguIp7W83DSHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
X-Proofpoint-GUID: WQMzk7f76H9-EiZUUWdkUAzT4ntoYUYg
X-Proofpoint-ORIG-GUID: OwKZRH16Nq60htOsTNS6VAoR-iNUyHzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 02:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160222

Hi Richard,

I saw this patch has been merged to master.

Could you help to merge this patch and=20

commit 0f528608eb48809955b2610ecc4bd689f1cf8899
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   2021-06-15 10:12

    grub: upgrade 2.04+2.06~rc1 -> 2.06
   =20
    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

to branch hardknott also? Or do I need to send those patches again for hard=
knott?


Thanks,
Yongxin


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yongxin Liu
> Sent: Monday, December 27, 2021 14:55
> To: richard.purdie@linuxfoundation.org; openembedded-
> core@lists.openembedded.org
> Subject: [OE-core][PATCH] grub2: fix CVE-2021-3981
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  ...onfig-Restore-umask-for-the-grub.cfg.patch | 49 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-
> mkconfig-Restore-umask-for-the-grub.cfg.patch
>=20
> diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-
> Restore-umask-for-the-grub.cfg.patch b/meta/recipes-bsp/grub/files/CVE-
> 2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
> new file mode 100644
> index 0000000000..dae26fd8bb
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-um
> +++ ask-for-the-grub.cfg.patch
> @@ -0,0 +1,49 @@
> +From 0adec29674561034771c13e446069b41ef41e4d4 Mon Sep 17 00:00:00 2001
> +From: Michael Chang <mchang@suse.com>
> +Date: Fri, 3 Dec 2021 16:13:28 +0800
> +Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
> +
> +The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
> +configuration by grub-mkconfig) has inadvertently discarded umask for
> +creating grub.cfg in the process of running grub-mkconfig. The
> +resulting wrong permission (0644) would allow unprivileged users to
> +read GRUB configuration file content. This presents a low
> +confidentiality risk as grub.cfg may contain non-secured plain-text
> passwords.
> +
> +This patch restores the missing umask and sets the creation file mode
> +to 0600 preventing unprivileged access.
> +
> +Fixes: CVE-2021-3981
> +
> +Signed-off-by: Michael Chang <mchang@suse.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3981
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D0adec29674561034=
7
> +71c13e446069b41ef41e4d4
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + util/grub-mkconfig.in | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in index
> +c3ea7612e..62335d027 100644
> +--- a/util/grub-mkconfig.in
> ++++ b/util/grub-mkconfig.in
> +@@ -301,7 +301,10 @@ and /etc/grub.d/* files or please file a bug report
> with
> +     exit 1
> +   else
> +     # none of the children aborted with error, install the new
> +grub.cfg
> ++    oldumask=3D$(umask)
> ++    umask 077
> +     cat ${grub_cfg}.new > ${grub_cfg}
> ++    umask $oldumask
> +     rm -f ${grub_cfg}.new
> +   fi
> + fi
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-
> bsp/grub/grub2.inc index bb791347dc..a72a562c5a 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
>             file://determinism.patch \
>             file://0001-RISC-V-Restore-the-typcast-to-long.patch \
> +
> + file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patc
> + h \
>  "
>=20
>  SRC_URI[sha256sum] =3D
> "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> --
> 2.31.1


