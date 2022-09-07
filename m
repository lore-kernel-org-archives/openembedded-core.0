Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B198C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:10:14 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.76])
 by mx.groups.io with SMTP id smtpd.web12.6382.1662549012190082886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bRV3RVCM;
 spf=pass (domain: kpit.com, ip: 40.107.222.76,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4tP5NLcOHbXKcd/ZRgTq7hhlb5FpUSWScXqCx+oUIyN4WO7XjJpwU06Bnnz3EgPQuVTib2gjYhbmtPjq3d4s4NiueuibNrwr2CQb7I45tZPksOF5UKOBCJz8LOcol84Y3b3SjFfjP/0DQjCdcAqMLg/263HQD99v0zowPyBaw+lJlI6S7Hir2ehez/je6XcMMPrsU7jGkHB9rZF5hqi7XzVp7h0CDeNNUhM50kOiZMAqLQidMZsbn14sBFVtpv/lw57ZhJLFg0UgM1vKajOBmrMI41Td8za1Sasq/Wc8EZapz7BDp2DzN5+7Y3w9huSman3TaIpBgWMdMTUPbWE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbW5RcVcRdLgUN4q6u2lNc5EkSjXBIL6PDACCzCMO4I=;
 b=AIT8k4NE7RMsPk3pqvbqqLZ8LGIgISbEGPLkFvmoqEX3MESYrXklPTukSohVZ2m18qlkLxEeRLyqguJzVJ38ei44/m4y7oI9/EahunRm74Su9CLmlV8WX7IRvo2uJ60PSVrzMbutEtnwfElGe/JaxqFByoo2HB5gkIuN1dgfLnvd68Ye5G+iE/gdkt0eU46gWCwMBW6DaLJjdezU8T/KGIqQ1lj554vD07nYthJfkm01ut35W7TzuHpZ6c568FWacWRWFAW2AHLyaGn+m9/wxalKKvIzvUtQo0EMjZvlDoHcZOkCbbpW3Fdj6wdSC/F5euO43Q9rScWIHk6ObAV9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbW5RcVcRdLgUN4q6u2lNc5EkSjXBIL6PDACCzCMO4I=;
 b=bRV3RVCMrEFntQczUsTHUqKozWU9gZAk/NQ9msVYl1HCLRoKfN8gFx7naegpXnh78swLwMAC563f2j8LSH0e9fYSmBU2TEjBWdIyD6d4BXHyF2x/Cd7jr5S0kRSSvjhABc2XJerXCvUjQQDFK+1HBHi3gsr9rLH2wlPBo9oeGNE=
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by PN3PR01MB5715.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 11:10:02 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a%5]) with mapi id 15.20.5588.017; Wed, 7 Sep 2022
 11:10:01 +0000
From: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-23177
 issue
Thread-Topic: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-23177
 issue
Thread-Index: AQHYwShMUD3zVsmmc0WYdrAxbayaJK3TC4EAgADFba4=
Date: Wed, 7 Sep 2022 11:10:01 +0000
Message-ID: 
 <PN3PR01MB7382D12654445624F2D4C01A8F419@PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM>
References: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
 <CAOSpxda695me_a+bY92tT33SzV0oZTHvDJofJxnqO2PFqPYnGw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxda695me_a+bY92tT33SzV0oZTHvDJofJxnqO2PFqPYnGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aad1da2-e735-4ab9-7393-08da90c1825c
x-ms-traffictypediagnostic: PN3PR01MB5715:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EOtUX0YM2lChFIyM30WbMGORHDqPOMKcOJtPO08N/dQrd+voHRN+MehWMgNFMY9dK3pCgmqZ0bAwlzqj69dKrn95hs7nmfDa3SxBCl+zVw2y+6A45sZ4cyPpGIOcgOsZvzxyrPYqaUp3Q9B2uKRPncmFGa7vqA5d8koUlRJZLS1LOh8dZ4zd+7xIiXfacFwF9RMpQnKBGSNancJfc4xcqmHKujJ6JpvmcF4cXXPjIvVJElRaI2SZHyl02HfzvNEnbRaVNvvEh3cHX9+MQ7saX5q8aYXmv/biKxxYp/V9EfH45VDBjz/eCdEB5ML7UPzV54ZFUY4pFxrPZAXNYo5I8tZDExiF25MTPs+D3xGtG8D0XGt5biq/fhs5YN2XyK2VVT2t1gqXWQNZiHTxnfVtFu5tfA7/gQ6TGn8kcjHzxVmY6UgRO4a/IG5fUHATAUWoJCD1peRwJP2IZ/GwPPz8OKKRSH47ITgViNbV0drlsrb9xJ8fYaPIb486/aMqSfTqNq1oVVt8c8suw2YR1p5H9IiYCiJ8f0bqdz1kHW/RS/21N6Pyx+OM56FXpKqdzqnYY31eKzltuBO8QMKg797Z9c5ubI7nqj3d9aDkW0mbgf/VPuVrWgF7i9a8MKNy/TgzxzKWFvKCfWuBClwySphbEBMxQ/ETJoiKIepb5C9MXp1NWu14yI2gZo+vqiJjPzua7X8MbIYhVjJn7JD9ASX8rXaOyoOZyAW5zQjKyPeadpMriTLXYeND9J8nRqxVh/unxWTjsoJ6R7zfrj8irQcFz/z72vvQO/9+jt9OIFMHGMLb0kTyaYcdyJLW/QJ9fyZFc6CAqhfnPR+hhHhazy0hQpcRSvr2+Rltmre4fH8vzcU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(86362001)(66574015)(186003)(478600001)(55016003)(41300700001)(26005)(9686003)(966005)(71200400001)(38070700005)(7696005)(6506007)(122000001)(38100700002)(99936003)(53546011)(166002)(18265965005)(83380400001)(316002)(19627405001)(5660300002)(66556008)(4001150100001)(76116006)(66946007)(52536014)(8676002)(33656002)(2906002)(45080400002)(64756008)(8936002)(7066003)(66446008)(4326008)(66476007)(6916009)(91956017)(30864003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vSswDB/DEluslRts5pXQ18vbQLSKDJn4T/kM6lCZ7Bn4PeGxeeLuP4BsVuYa?=
 =?us-ascii?Q?cSxAglaMB5nE78ARWnLmIZY9CDPUQF8PdN7vu0aYh4Q5VO4mg+y6yZKj838Q?=
 =?us-ascii?Q?P1/hbg1tKoTIF2K4cviEZJR29nWSgBUCzw/IWxXEZ88ArKtccU39X78BTpbr?=
 =?us-ascii?Q?ua/Rs2McOSBkEvEVYgqQ2rLxjLO8N8GUo8k9/wo6Jyu4b+QA5HdgpQVsInpt?=
 =?us-ascii?Q?u3rQSZHucfOCzmKqItKFJgU7luamWrWOvT2D3wsT6VXXKcsiM5mAKhKyc2Ve?=
 =?us-ascii?Q?6/WW5wBA4vxi1Es44JcsCQ4zlqI9TzA8ZVra+ZN6+02NhB8XQ+GUMLyUVoNj?=
 =?us-ascii?Q?2P4SSVP9aVMhGT0JulvTqmb55stnxd1JoZhvOH6ijM5BkX9f4WftuCVxBCjM?=
 =?us-ascii?Q?JczZSFCLkZseJdRdujp5vRpfi7b7hIGc0wENfLVB9N5brAx13HBeolbSouvq?=
 =?us-ascii?Q?jsRjqss9QuOjkPRqB5572OuYTFAMx51H7gPBUSL2ZUZMVAdmAs2WCKNMJYVo?=
 =?us-ascii?Q?ObgV09Y/BGsTKlFRtIPfeMCeEkjBP3kjnG4703I9XcIhw82gZOWXYIWl59MH?=
 =?us-ascii?Q?qHZjynjcOgt8sx2FvxaTpFSQJr4Mt3t45/ecFgw8ZpxhTnYGugeru0lhzNDn?=
 =?us-ascii?Q?qI63AWxKKOLLSf8GMgugG+npokWT9ARqfyfyrIV30qReS7yL5KDlCfbV/tD5?=
 =?us-ascii?Q?xPyS9gC6hneeHXysOSqOTW7AYV4tXy2FBqJQrrvMr3j1l3ir2tgk0U3LjmtK?=
 =?us-ascii?Q?OBp32sX40A3cHI/t5jG3MLQHpAz3kCpbmcZ/WsVQCyti30//zxI8+WZjTat0?=
 =?us-ascii?Q?eJLGc6r4wjqSCQhpWl3hFK2sdZHpzcL8FLpQd+iMS5lxM0d6Zj1UIkY4MIhQ?=
 =?us-ascii?Q?gzjHnXGFbgZrCfCxbpjWb9/Oohskp/SnpY1FUnR4YbuhXpJih04AW+floJIm?=
 =?us-ascii?Q?O5trNq2pkpWPzvH0heJv0UCzff95JTt8T/BT7R7kEthqZQkoy5ZTvEQXyrYV?=
 =?us-ascii?Q?bOV6Epa1je+Kch3HtxfR2cLW4W8fGKpUawy76zI4dVvkFLy4kKMPjGxvnCik?=
 =?us-ascii?Q?DOANnoqnWpwEs1pItE5v5wNEP32o5bcCcDxmJakp9O0i1cfqpr36AhG3+SSa?=
 =?us-ascii?Q?gugu6wSFr05UsQyufUumZw+bi+K+7DMh2Q9SfPmJRmbbLnsiWrMPlWZuYWtN?=
 =?us-ascii?Q?80Q6FCkTAVQX1wsovpR49fnlyg+YnccBIZJkq9ZvvZTbj4g1MtkiohArleqF?=
 =?us-ascii?Q?4BntUoo13fubJGOTmwR1jtmWyPSYECwHLTlTmKleP7u5ez24o7b9G0d2zGZ1?=
 =?us-ascii?Q?Y+m5ady5zQsfEMlT5QgxrIPcuLRAY8W8yDdaly+PcFIQwmnLEYJpFn11tf1Z?=
 =?us-ascii?Q?V2A6yHWTyNwr+2+fDIakRtLAYaFvz+9P3qjrrm8UFO6K3VDs1mtJrQJzSwyr?=
 =?us-ascii?Q?xf9doV8E2fEjTni0VUEgNsiRSE81W3wATSoMctfdW5FlV+sxMSbnUN8XcdJK?=
 =?us-ascii?Q?0fsgaipgLBH0ZXoTR+Cd1Qbb5CG3vNYIvQWArgh84VtYlBeIDYKdZSfCUhk9?=
 =?us-ascii?Q?d1U3LAWBqQR8bzS1jJNHqV7Jh2HwLxstWdWmQ1us?=
Content-Type: multipart/mixed;
	boundary="_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5aad1da2-e735-4ab9-7393-08da90c1825c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 11:10:01.5906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 We7ao57ttjL1IitX4qRT9pAHPNEApb+pbdnqrsTuNfOG/nNKxFaZ4bU2L1YRhxmK/yu/UZFB7qz/9wg4QZXp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 11:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170386

--_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: multipart/related;
	boundary="_007_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_";
	type="multipart/alternative"

--_007_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: multipart/alternative;
	boundary="_000_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_"

--_000_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I have tested this and it seems the patch is working fine.
I'm attaching the patch file as an attachment, please use this and let me k=
now if that works.

It seems like something went wrong during sending using kpit email ID and c=
urrently using my gmail account I am facing the issues so I cannot send usi=
ng gamil account.


Also, attaching logs of do_patch task.


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:824f139b-dc78-4d88-b54c-19031b89b310]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Wednesday, September 7, 2022 4:48 AM
To: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-23177 i=
ssue

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Mon, Sep 5, 2022 at 3:06 AM Ranjitsinh Rathod via
lists.openembedded.org
<ranjitsinh.rathod=3Dkpit.com@lists.openembedded.org> wrote:
>
> Add patch to fix CVE-2021-23177 issue for libarchive
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
deb.debian.org%2Fdebian%2Fpool%2Fmain%2Fliba%2Flibarchive%2Flibarchive_3.4.=
3-2%2Bdeb11u1.debian.tar.xz&amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.c=
om%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637981031500145401%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DTkHx=
hOMThtixBaY%2FBNYDPPje1vMASk3%2FPNdQAoHQd7o%3D&amp;reserved=3D0

Fails to build with this patch:

NOTE: Applying patch 'CVE-2021-23177.patch'
(../meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch)
ERROR: Applying patch 'CVE-2021-23177.patch' on target directory
'TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/libarchive-3.4.2'
Command Error: 'quilt --quiltrc
TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/recipe-sysroot-nati=
ve/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2021-23177.patch
patching file libarchive/archive_disk_acl_freebsd.c
Hunk #1 succeeded at 319 with fuzz 1.
Hunk #2 FAILED at 364.
Hunk #3 FAILED at 542.
Hunk #4 FAILED at 677.
Hunk #5 FAILED at 693.
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_free=
bsd.c
patching file libarchive/archive_disk_acl_linux.c
Hunk #1 FAILED at 343.
Hunk #2 succeeded at 455 with fuzz 1.
Hunk #3 FAILED at 488.
Hunk #4 FAILED at 727.
3 out of 4 hunks FAILED -- rejects in file libarchive/archive_disk_acl_linu=
x.c
patching file libarchive/archive_disk_acl_sunos.c
Hunk #1 succeeded at 443 with fuzz 1.
Hunk #2 FAILED at 467.
Hunk #3 FAILED at 492.
Hunk #4 FAILED at 801.
Hunk #5 FAILED at 810.
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_suno=
s.c
Patch CVE-2021-23177.patch does not apply (enforce with -f)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished

I'm going to drop both patches in the series and await a v2.

Steve

> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
>  .../libarchive/libarchive_3.4.2.bb            |   1 +
>  2 files changed, 184 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-=
23177.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.p=
atch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
> new file mode 100644
> index 0000000000..555c7a47f7
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
> @@ -0,0 +1,183 @@
> +Description: Fix handling of symbolic link ACLs
> + Published as CVE-2021-23177
> +Origin: upstream, https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgithub.com%2Flibarchive%2Flibarchive%2Fcommit%2Ffba4f123cc456=
d2b2538f811bb831483bf336bad&amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.c=
om%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637981031500145401%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dgvio=
BQMQ2EoCWnEZqMzDGb2QP3Cpe0nyt8nHZXDXbCU%3D&amp;reserved=3D0
> +Bug-Debian: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fbugs.debian.org%2F1001986&amp;data=3D05%7C01%7Cranjitsinh.rathod%40=
kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DAZAP5EPxLqEOTWQrrQqBLKB28h2F%2FzfnHrM9DdecYVo%3D&amp;reserved=3D0
> +Author: Martin Matuska <martin@matuska.org>
> +Last-Updated: 2021-12-20
> +
> +CVE: CVE-2021-23177
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttp%3A%2F%2Fdeb.debian.org%2Fdebian%2Fpool%2Fmain%2Fliba%2Flibarc=
hive%2Flibarchive_3.4.3-2%2Bdeb11u1.debian.tar.xz&amp;data=3D05%7C01%7Cranj=
itsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;sdata=3DpAVwJEG5suJZAifS75UoFBNUHSmX08PffM0957Y8W00%3D&amp;reserv=
ed=3D0]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +--- a/libarchive/archive_disk_acl_freebsd.c
> ++++ b/libarchive/archive_disk_acl_freebsd.c
> +@@ -319,7 +319,7 @@
> +
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       int              acl_type =3D 0;
> +@@ -364,6 +364,13 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
> ++              errno =3D EINVAL;
> ++              archive_set_error(a, errno,
> ++                  "Cannot set default ACL on non-directory");
> ++              return (ARCHIVE_WARN);
> ++      }
> ++
> +       acl =3D acl_init(entries);
> +       if (acl =3D=3D (acl_t)NULL) {
> +               archive_set_error(a, errno,
> +@@ -542,7 +549,10 @@
> +       else if (acl_set_link_np(name, acl_type, acl) !=3D 0)
> + #else
> +       /* FreeBSD older than 8.0 */
> +-      else if (acl_set_file(name, acl_type, acl) !=3D 0)
> ++      else if (S_ISLNK(mode)) {
> ++          /* acl_set_file() follows symbolic links, skip */
> ++          ret =3D ARCHIVE_OK;
> ++      } else if (acl_set_file(name, acl_type, acl) !=3D 0)
> + #endif
> +       {
> +               if (errno =3D=3D EOPNOTSUPP) {
> +@@ -677,14 +687,14 @@
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
> +                       if (ret !=3D ARCHIVE_OK)
> +                               return (ret);
> +               }
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
> +
> +               /* Simultaneous POSIX.1e and NFSv4 is not supported */
> +@@ -693,7 +703,7 @@
> + #if ARCHIVE_ACL_FREEBSD_NFS4
> +       else if ((archive_acl_types(abstract_acl) &
> +           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
> +       }
> + #endif
> +--- a/libarchive/archive_disk_acl_linux.c
> ++++ b/libarchive/archive_disk_acl_linux.c
> +@@ -343,6 +343,11 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (S_ISLNK(mode)) {
> ++              /* Linux does not support RichACLs on symbolic links */
> ++              return (ARCHIVE_OK);
> ++      }
> ++
> +       richacl =3D richacl_alloc(entries);
> +       if (richacl =3D=3D NULL) {
> +               archive_set_error(a, errno,
> +@@ -455,7 +460,7 @@
> + #if ARCHIVE_ACL_LIBACL
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       int              acl_type =3D 0;
> +@@ -488,6 +493,18 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (S_ISLNK(mode)) {
> ++              /* Linux does not support ACLs on symbolic links */
> ++              return (ARCHIVE_OK);
> ++      }
> ++
> ++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
> ++              errno =3D EINVAL;
> ++              archive_set_error(a, errno,
> ++                  "Cannot set default ACL on non-directory");
> ++              return (ARCHIVE_WARN);
> ++      }
> ++
> +       acl =3D acl_init(entries);
> +       if (acl =3D=3D (acl_t)NULL) {
> +               archive_set_error(a, errno,
> +@@ -727,14 +744,14 @@
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
> +                       if (ret !=3D ARCHIVE_OK)
> +                               return (ret);
> +               }
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
> +       }
> + #endif        /* ARCHIVE_ACL_LIBACL */
> +--- a/libarchive/archive_disk_acl_sunos.c
> ++++ b/libarchive/archive_disk_acl_sunos.c
> +@@ -443,7 +443,7 @@
> +
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       aclent_t         *aclent;
> +@@ -467,7 +467,6 @@
> +       if (entries =3D=3D 0)
> +               return (ARCHIVE_OK);
> +
> +-
> +       switch (ae_requested_type) {
> +       case ARCHIVE_ENTRY_ACL_TYPE_POSIX1E:
> +               cmd =3D SETACL;
> +@@ -492,6 +491,12 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++        if (S_ISLNK(mode)) {
> ++                /* Skip ACLs on symbolic links */
> ++              ret =3D ARCHIVE_OK;
> ++              goto exit_free;
> ++        }
> ++
> +       e =3D 0;
> +
> +       while (archive_acl_next(a, abstract_acl, ae_requested_type, &ae_t=
ype,
> +@@ -801,7 +806,7 @@
> +       if ((archive_acl_types(abstract_acl)
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               /* Solaris writes POSIX.1e access and default ACLs togeth=
er */
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_POSIX1E, "posix1e");
> +
> +               /* Simultaneous POSIX.1e and NFSv4 is not supported */
> +@@ -810,7 +815,7 @@
> + #if ARCHIVE_ACL_SUNOS_NFS4
> +       else if ((archive_acl_types(abstract_acl) &
> +           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
> +       }
> + #endif
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/=
recipes-extended/libarchive/libarchive_3.4.2.bb
> index b7426a1be8..d8ed80686b 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttp%3A%2F%2Flibarchive.org%2Fdownloads%2Flibarchive-%24&amp;da=
ta=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e1=
3f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D6E6NPIoer6lLtmIy%2BfJes9X%2Bb9c8LMcP4r=
JqEWMh9AE%3D&amp;reserved=3D0{PV}.tar.gz \
>             file://CVE-2021-36976-1.patch \
>             file://CVE-2021-36976-2.patch \
>             file://CVE-2021-36976-3.patch \
> +           file://CVE-2021-23177.patch \
>  "
>
>  SRC_URI[md5sum] =3D "d953ed6b47694dadf0e6042f8f9ff451"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170314): https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F170314&amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a05=
2c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63798=
1031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DzAN8zWKpjRn4a8aMU=
z0gBrNUG6Z4UgxOm7eUGa0h7o8%3D&amp;reserved=3D0
> Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F93477934%2F3620601&amp;data=3D05%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;sdata=3DeIaljRDAxfulEqHozOYe40SmAY%2BDskX8isAJldDM0kA%=
3D&amp;reserved=3D0
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D0=
5%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C3000%7C%7C%7C&amp;sdata=3D80OItx%2FP%2BlEtMkfwUJE9Q8sKL5e%2BX67Ou%2F3L=
rzQZ17s%3D&amp;reserved=3D0 [steve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi&nbsp;Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I have tested this and it seems the patch is working fine.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'm attaching the patch file as an attachment, please use this and let me k=
now if that works.</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
It seems like something went wrong during sending using kpit email ID and c=
urrently using my gmail account I am facing the issues so I cannot send usi=
ng gamil account.</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Also, attaching logs of do_patch
 task.</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"></span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt; font-size:11pt; font-family:Calibri,sans-s=
erif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,255,2=
55)">
<span lang=3D"EN-IN" style=3D"margin:0px; font-family:&quot;Work Sans Mediu=
m&quot;; color:rgb(89,89,89)"><b>Ranjitsinh Rathod</b></span><span lang=3D"=
EN-IN" style=3D"margin:0px; font-size:14pt; font-family:&quot;Work Sans&quo=
t;; color:rgb(0,137,207)"><br>
</span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family=
:&quot;Work Sans&quot;; color:rgb(127,127,127)">Technical Leader |&nbsp;&nb=
sp;| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span lang=3D"EN-IN" style=3D"margin:0px; font-size:14pt; fo=
nt-family:&quot;Work Sans&quot;; color:rgb(176,255,69)">___________________=
_______________________<br>
</span></sup></b><span style=3D"margin:0px; color:rgb(31,73,125)"><a href=
=3D"http://www.kpit.com/" target=3D"_blank" rel=3D"noopener noreferrer" sty=
le=3D"margin:0px"><span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt;=
 font-family:&quot;Work Sans Medium&quot;; color:gray">KPIT</span></a></spa=
n><span style=3D"margin:0px; font-family:&quot;Work Sans&quot;; color:gray"=
><span>&nbsp;</span></span><span lang=3D"EN-IN" style=3D"margin:0px; font-s=
ize:12pt; font-family:&quot;Work Sans&quot;; color:gray">|</span><span lang=
=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&=
quot;; color:gray"><span>&nbsp;</span></span><span style=3D"margin:0px; col=
or:rgb(31,73,125)"><a href=3D"http://www.kpit.com/linkedin" target=3D"_blan=
k" rel=3D"noopener noreferrer" style=3D"margin:0px"><span lang=3D"EN-IN" st=
yle=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&quot;; color:=
gray">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:rgb(89,89,89)"></span><span style=
=3D"margin:0px; font-size:12pt; font-family:&quot;Times New Roman&quot;,ser=
if"></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" target=3D"_blank" rel=3D"noope=
ner noreferrer" style=3D"margin:0px"><span style=3D"margin:0px; color:rgb(3=
1,73,125)"><img class=3D"EmojiInsert" width=3D"621" height=3D"120" style=3D=
"margin:0px; width:6.4687in; height:1.25in" data-outlook-trace=3D"F:1|T:1" =
src=3D"cid:824f139b-dc78-4d88-b54c-19031b89b310"></span></a></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;ste=
ve@sakoman.com&gt;<br>
<b>Sent:</b> Wednesday, September 7, 2022 4:48 AM<br>
<b>To:</b> Ranjitsinh Rathod &lt;Ranjitsinh.Rathod@kpit.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-=
23177 issue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
On Mon, Sep 5, 2022 at 3:06 AM Ranjitsinh Rathod via<br>
lists.openembedded.org<br>
&lt;ranjitsinh.rathod=3Dkpit.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; Add patch to fix CVE-2021-23177 issue for libarchive<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Fdeb.debian.org%2Fdebian%2Fpool%2Fmain%2Fliba%2Flibarchive%2=
Flibarchive_3.4.3-2%2Bdeb11u1.debian.tar.xz&amp;amp;data=3D05%7C01%7Cranjit=
sinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637981031500145401%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;amp;sdata=3DTkHxhOMThtixBaY%2FBNYDPPje1vMASk3%2FPNdQAoHQd7o%3D&amp;=
amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdeb.debi=
an.org%2Fdebian%2Fpool%2Fmain%2Fliba%2Flibarchive%2Flibarchive_3.4.3-2%2Bde=
b11u1.debian.tar.xz&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7=
Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637981031500145401%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DTkHx=
hOMThtixBaY%2FBNYDPPje1vMASk3%2FPNdQAoHQd7o%3D&amp;amp;reserved=3D0</a><br>
<br>
Fails to build with this patch:<br>
<br>
NOTE: Applying patch 'CVE-2021-23177.patch'<br>
(../meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch)<br>
ERROR: Applying patch 'CVE-2021-23177.patch' on target directory<br>
'TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/libarchive-3.4.2'<=
br>
Command Error: 'quilt --quiltrc<br>
TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/recipe-sysroot-nati=
ve/etc/quiltrc<br>
push' exited with 0&nbsp; Output:<br>
Applying patch CVE-2021-23177.patch<br>
patching file libarchive/archive_disk_acl_freebsd.c<br>
Hunk #1 succeeded at 319 with fuzz 1.<br>
Hunk #2 FAILED at 364.<br>
Hunk #3 FAILED at 542.<br>
Hunk #4 FAILED at 677.<br>
Hunk #5 FAILED at 693.<br>
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_free=
bsd.c<br>
patching file libarchive/archive_disk_acl_linux.c<br>
Hunk #1 FAILED at 343.<br>
Hunk #2 succeeded at 455 with fuzz 1.<br>
Hunk #3 FAILED at 488.<br>
Hunk #4 FAILED at 727.<br>
3 out of 4 hunks FAILED -- rejects in file libarchive/archive_disk_acl_linu=
x.c<br>
patching file libarchive/archive_disk_acl_sunos.c<br>
Hunk #1 succeeded at 443 with fuzz 1.<br>
Hunk #2 FAILED at 467.<br>
Hunk #3 FAILED at 492.<br>
Hunk #4 FAILED at 801.<br>
Hunk #5 FAILED at 810.<br>
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_suno=
s.c<br>
Patch CVE-2021-23177.patch does not apply (enforce with -f)<br>
DEBUG: Python function patch_do_patch finished<br>
DEBUG: Python function do_patch finished<br>
<br>
I'm going to drop both patches in the series and await a v2.<br>
<br>
Steve<br>
<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;ranjitsinh.rathod@kpit.com&gt;<br=
>
&gt; ---<br>
&gt;&nbsp; .../libarchive/CVE-2021-23177.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 183 ++++++++++++++++++<br>
&gt;&nbsp; .../libarchive/libarchive_3.4.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 184 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-extended/libarchive/libarchive/C=
VE-2021-23177.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-2317=
7.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000000..555c7a47f7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch=
<br>
&gt; @@ -0,0 +1,183 @@<br>
&gt; +Description: Fix handling of symbolic link ACLs<br>
&gt; + Published as CVE-2021-23177<br>
&gt; +Origin: upstream, <a href=3D"https://apc01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibarchive%2Flibarchive%2Fcommit%2=
Ffba4f123cc456d2b2538f811bb831483bf336bad&amp;amp;data=3D05%7C01%7Cranjitsi=
nh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637981031500145401%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&amp;amp;sdata=3DgvioBQMQ2EoCWnEZqMzDGb2QP3Cpe0nyt8nHZXDXbCU%3D&amp;amp;re=
served=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flibarchive%2Flibarchive%2Fcommit%2Ffba4f123cc456d2b2538f811bb831483bf=
336bad&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c72=
4605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031=
500145401%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DgvioBQMQ2EoCWnEZq=
MzDGb2QP3Cpe0nyt8nHZXDXbCU%3D&amp;amp;reserved=3D0</a><br>
&gt; +Bug-Debian: <a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fbugs.debian.org%2F1001986&amp;amp;data=3D05%7C01%7Cra=
njitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&amp;amp;sdata=3DAZAP5EPxLqEOTWQrrQqBLKB28h2F%2FzfnHrM9DdecYVo%3D&am=
p;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs.de=
bian.org%2F1001986&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C=
e7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DAZAP5=
EPxLqEOTWQrrQqBLKB28h2F%2FzfnHrM9DdecYVo%3D&amp;amp;reserved=3D0</a><br>
&gt; +Author: Martin Matuska &lt;martin@matuska.org&gt;<br>
&gt; +Last-Updated: 2021-12-20<br>
&gt; +<br>
&gt; +CVE: CVE-2021-23177<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttp%3A%2F%2Fdeb.debian.org%2Fdebian%2Fpool%2Fmain%2=
Fliba%2Flibarchive%2Flibarchive_3.4.3-2%2Bdeb11u1.debian.tar.xz&amp;amp;dat=
a=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13=
f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DpAVwJEG5suJZAifS75UoFBNUHSmX08PffM0=
957Y8W00%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outloo=
k.com/?url=3Dhttp%3A%2F%2Fdeb.debian.org%2Fdebian%2Fpool%2Fmain%2Fliba%2Fli=
barchive%2Flibarchive_3.4.3-2%2Bdeb11u1.debian.tar.xz&amp;amp;data=3D05%7C0=
1%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;amp;sdata=3DpAVwJEG5suJZAifS75UoFBNUHSmX08PffM0957Y8W00%3=
D&amp;amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;ranjitsinh.rathod@kpit.com&gt;<b=
r>
&gt; +<br>
&gt; +--- a/libarchive/archive_disk_acl_freebsd.c<br>
&gt; ++++ b/libarchive/archive_disk_acl_freebsd.c<br>
&gt; +@@ -319,7 +319,7 @@<br>
&gt; +<br>
&gt; + static int<br>
&gt; + set_acl(struct archive *a, int fd, const char *name,<br>
&gt; +-&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl, __LA_MODE_T mod=
e,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ae_requested_type, const char *tname)<br=
>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl_type =3D 0;<br>
&gt; +@@ -364,6 +364,13 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (ARCHIVE_FAILED);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acl_type =3D=3D ACL_TYPE_DEFAULT =
&amp;&amp; !S_ISDIR(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; errno =3D EINVAL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; archive_set_error(a, errno,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Cannot set default ACL on non-dire=
ctory&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return (ARCHIVE_WARN);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl =3D acl_init(entries);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acl =3D=3D (acl_t)NULL) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; archive_set_error(a, errno,<br>
&gt; +@@ -542,7 +549,10 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (acl_set_link_np(name, a=
cl_type, acl) !=3D 0)<br>
&gt; + #else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FreeBSD older than 8.0 */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (acl_set_file(name, acl_type,=
 acl) !=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (S_ISLNK(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* acl_set_fi=
le() follows symbolic links, skip */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ARCHI=
VE_OK;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (acl_set_file(name, acl_typ=
e, acl) !=3D 0)<br>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (errno =3D=3D EOPNOTSUPP) {<br>
&gt; +@@ -677,14 +687,14 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; AR=
CHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if ((archive_acl_types(abstract_acl)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; ARCHIVE_ENTRY_ACL_TYPE_ACCESS=
) !=3D 0) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_ACCESS, &quot;access&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=
=3D ARCHIVE_OK)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ret);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if ((archive_acl_types(abstract_acl)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; ARCHIVE_ENTRY_ACL_TYPE_DEFAUL=
T) !=3D 0)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, &quot;default&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Simultaneous POSIX.1e and NFSv4 is not supported */<br>
&gt; +@@ -693,7 +703,7 @@<br>
&gt; + #if ARCHIVE_ACL_FREEBSD_NFS4<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if ((archive_acl_types(abst=
ract_acl) &amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE_=
ENTRY_ACL_TYPE_NFS4) !=3D 0) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_NFS4, &quot;=
nfs4&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif<br>
&gt; +--- a/libarchive/archive_disk_acl_linux.c<br>
&gt; ++++ b/libarchive/archive_disk_acl_linux.c<br>
&gt; +@@ -343,6 +343,11 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (ARCHIVE_FAILED);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISLNK(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Linux does not support RichACLs on symbolic links */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return (ARCHIVE_OK);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; richacl =3D richacl_alloc(entrie=
s);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (richacl =3D=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; archive_set_error(a, errno,<br>
&gt; +@@ -455,7 +460,7 @@<br>
&gt; + #if ARCHIVE_ACL_LIBACL<br>
&gt; + static int<br>
&gt; + set_acl(struct archive *a, int fd, const char *name,<br>
&gt; +-&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl, __LA_MODE_T mod=
e,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ae_requested_type, const char *tname)<br=
>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl_type =3D 0;<br>
&gt; +@@ -488,6 +493,18 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (ARCHIVE_FAILED);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISLNK(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Linux does not support ACLs on symbolic links */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return (ARCHIVE_OK);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acl_type =3D=3D ACL_TYPE_DEFAULT =
&amp;&amp; !S_ISDIR(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; errno =3D EINVAL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; archive_set_error(a, errno,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Cannot set default ACL on non-dire=
ctory&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return (ARCHIVE_WARN);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl =3D acl_init(entries);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acl =3D=3D (acl_t)NULL) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; archive_set_error(a, errno,<br>
&gt; +@@ -727,14 +744,14 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; AR=
CHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if ((archive_acl_types(abstract_acl)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; ARCHIVE_ENTRY_ACL_TYPE_ACCESS=
) !=3D 0) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_ACCESS, &quot;access&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=
=3D ARCHIVE_OK)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ret);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if ((archive_acl_types(abstract_acl)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; ARCHIVE_ENTRY_ACL_TYPE_DEFAUL=
T) !=3D 0)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D set_acl(=
a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, &quot;default&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ARCHIVE_ACL_LIBA=
CL */<br>
&gt; +--- a/libarchive/archive_disk_acl_sunos.c<br>
&gt; ++++ b/libarchive/archive_disk_acl_sunos.c<br>
&gt; +@@ -443,7 +443,7 @@<br>
&gt; +<br>
&gt; + static int<br>
&gt; + set_acl(struct archive *a, int fd, const char *name,<br>
&gt; +-&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp; struct archive_acl *abstract_acl, __LA_MODE_T mod=
e,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ae_requested_type, const char *tname)<br=
>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aclent_t&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; *aclent;<br>
&gt; +@@ -467,7 +467,6 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (entries =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (ARCHIVE_OK);<br>
&gt; +<br>
&gt; +-<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ae_requested_type) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_ENTRY_ACL_TYPE_POSI=
X1E:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cmd =3D SETACL;<br>
&gt; +@@ -492,6 +491,12 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (ARCHIVE_FAILED);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISLNK(mode)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* Skip ACLs on symbolic links */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D ARCHIVE_OK;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto exit_free;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (archive_acl_next(a, abstr=
act_acl, ae_requested_type, &amp;ae_type,<br>
&gt; +@@ -801,7 +806,7 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((archive_acl_types(abstract_=
acl)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; AR=
CHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Solaris writes POSIX.1e access and default ACLs together=
 */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_POSIX1E, &qu=
ot;posix1e&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Simultaneous POSIX.1e and NFSv4 is not supported */<br>
&gt; +@@ -810,7 +815,7 @@<br>
&gt; + #if ARCHIVE_ACL_SUNOS_NFS4<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if ((archive_acl_types(abst=
ract_acl) &amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE_=
ENTRY_ACL_TYPE_NFS4) !=3D 0) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D set_acl(a, fd, name, abstract_acl, mode,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE_ENTRY_ACL_TYPE_NFS4, &quot;=
nfs4&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif<br>
&gt; diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/me=
ta/recipes-extended/libarchive/libarchive_3.4.2.bb<br>
&gt; index b7426a1be8..d8ed80686b 100644<br>
&gt; --- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb<br>
&gt; +++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb<br>
&gt; @@ -36,6 +36,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flibarchive.org%2Fdownload=
s%2Flibarchive-%24&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C=
e7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D6E6NP=
Ioer6lLtmIy%2BfJes9X%2Bb9c8LMcP4rJqEWMh9AE%3D&amp;amp;reserved=3D0{PV}.tar.=
gz
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2021-36976-1.patch">file://CVE-2021-36976-1.patch</=
a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2021-36976-2.patch">file://CVE-2021-36976-2.patch</=
a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2021-36976-3.patch">file://CVE-2021-36976-3.patch</=
a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2021-23177.patch">file://CVE-2021-23177.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;d953ed6b47694dadf0e6042f8f9ff451&quot;=
<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170314): <a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembe=
dded-core%2Fmessage%2F170314&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40k=
pit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sda=
ta=3DzAN8zWKpjRn4a8aMUz0gBrNUG6Z4UgxOm7eUGa0h7o8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F170314&amp;amp;data=3D0=
5%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C3000%7C%7C%7C&amp;amp;sdata=3DzAN8zWKpjRn4a8aMUz0gBrNUG6Z4UgxOm7eUGa0h=
7o8%3D&amp;amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fmt%2F93477934%2F3620601&=
amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c=
008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379810315003016=
30%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DeIaljRDAxfulEqHozOYe40Sm=
AY%2BDskX8isAJldDM0kA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F93477934%2F3620601&amp;amp;data=3D05%7C01%7Cranjitsi=
nh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&amp;amp;sdata=3DeIaljRDAxfulEqHozOYe40SmAY%2BDskX8isAJldDM0kA%3D&amp;amp;=
reserved=3D0</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsu=
b&amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7Ce7011a052c724605e=
9c008da905e13f4%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63798103150030=
1630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D80OItx%2FP%2BlEtMkfwUJ=
E9Q8sKL5e%2BX67Ou%2F3LrzQZ17s%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;amp;data=3D05%7C01%7Cra=
njitsinh.rathod%40kpit.com%7Ce7011a052c724605e9c008da905e13f4%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637981031500301630%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&amp;amp;sdata=3D80OItx%2FP%2BlEtMkfwUJE9Q8sKL5e%2BX67Ou%2F3LrzQZ17s=
%3D&amp;amp;reserved=3D0</a>
 [steve@sakoman.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_--

--_007_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: image/png; name="Outlook-aiobnw0j.png"
Content-Description: Outlook-aiobnw0j.png
Content-Disposition: inline; filename="Outlook-aiobnw0j.png"; size=22485;
	creation-date="Wed, 07 Sep 2022 11:10:01 GMT";
	modification-date="Wed, 07 Sep 2022 11:10:01 GMT"
Content-ID: <824f139b-dc78-4d88-b54c-19031b89b310>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_007_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_--

--_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: text/x-patch;
	name="0002-libarchive-Fix-CVE-2021-31566-issue.patch"
Content-Description: 0002-libarchive-Fix-CVE-2021-31566-issue.patch
Content-Disposition: attachment;
	filename="0002-libarchive-Fix-CVE-2021-31566-issue.patch"; size=8872;
	creation-date="Wed, 07 Sep 2022 11:06:12 GMT";
	modification-date="Wed, 07 Sep 2022 11:06:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxN2E5ODFhZTRkNDgzYTY2OWI5MjczM2FhYTBiODZlOWQ5ODBiMDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RA
a3BpdC5jb20+CkRhdGU6IFR1ZSwgMzAgQXVnIDIwMjIgMTU6Mjc6NDcgKzA1MzAKU3ViamVjdDog
W1BBVENIIDIvMl0gbGliYXJjaGl2ZTogRml4IENWRS0yMDIxLTMxNTY2IGlzc3VlCgpBZGQgcGF0
Y2ggdG8gZml4IENWRS0yMDIxLTMxNTY2IGlzc3VlIGZvciBsaWJhcmNoaXZlCkxpbms6IGh0dHA6
Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2xpYmEvbGliYXJjaGl2ZS9saWJhcmNo
aXZlXzMuNC4zLTIrZGViMTF1MS5kZWJpYW4udGFyLnh6CgpTaWduZWQtb2ZmLWJ5OiBSYW5qaXRz
aW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20+Ci0tLQogLi4uL2xpYmFyY2hp
dmUvQ1ZFLTIwMjEtMzE1NjYtMDEucGF0Y2ggICAgICAgIHwgIDIzICsrKwogLi4uL2xpYmFyY2hp
dmUvQ1ZFLTIwMjEtMzE1NjYtMDIucGF0Y2ggICAgICAgIHwgMTcyICsrKysrKysrKysrKysrKysr
KwogLi4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjQuMi5iYiAgICAgICAgICAgIHwgICAyICsK
IDMgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL0NWRS0yMDIxLTMxNTY2
LTAxLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFy
Y2hpdmUvbGliYXJjaGl2ZS9DVkUtMjAyMS0zMTU2Ni0wMi5wYXRjaAoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvQ1ZFLTIwMjEtMzE1NjYt
MDEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL0NW
RS0yMDIxLTMxNTY2LTAxLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmM0YTJmYjYxMmMKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliYXJjaGl2ZS9saWJhcmNoaXZlL0NWRS0yMDIxLTMxNTY2LTAxLnBhdGNoCkBAIC0wLDAgKzEs
MjMgQEAKK0Rlc2NyaXB0aW9uOiBOZXZlciBmb2xsb3cgc3ltbGlua3Mgd2hlbiBzZXR0aW5nIGZp
bGUgZmxhZ3Mgb24gTGludXgKKyBQdWJsaXNoZWQgYXMgQ1ZFLTIwMjEtMzE1NjYKK09yaWdpbjog
dXBzdHJlYW0sIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0
L2UyYWQxYTJjMzA2NGZhOWViYTYyNzRiMzY0MWM0YzFiZWVkMjVjMGIKK0J1Zy1EZWJpYW46IGh0
dHBzOi8vYnVncy5kZWJpYW4ub3JnLzEwMDE5OTAKK0F1dGhvcjogTWFydGluIE1hdHVza2EgPG1h
cnRpbkBtYXR1c2thLm9yZz4KK0xhc3QtVXBkYXRlOiAyMDIxLTEyLTIwCisKK0NWRTogQ1ZFLTIw
MjEtMzE1NjYKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHA6Ly9kZWIuZGViaWFuLm9y
Zy9kZWJpYW4vcG9vbC9tYWluL2xpYmEvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNC4zLTIrZGVi
MTF1MS5kZWJpYW4udGFyLnh6XQorU2lnbmVkLW9mZi1ieTogUmFuaml0c2luaCBSYXRob2QgPHJh
bmppdHNpbmgucmF0aG9kQGtwaXQuY29tPgorCistLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfd3Jp
dGVfZGlza19wb3NpeC5jCisrKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfd3JpdGVfZGlza19wb3Np
eC5jCitAQCAtMzkyNyw3ICszOTI3LDggQEAKKyAKKyAJLyogSWYgd2Ugd2VyZW4ndCBnaXZlbiBh
biBmZCwgb3BlbiBpdCBvdXJzZWx2ZXMuICovCisgCWlmIChteWZkIDwgMCkgeworLQkJbXlmZCA9
IG9wZW4obmFtZSwgT19SRE9OTFkgfCBPX05PTkJMT0NLIHwgT19CSU5BUlkgfCBPX0NMT0VYRUMp
OworKwkJbXlmZCA9IG9wZW4obmFtZSwgT19SRE9OTFkgfCBPX05PTkJMT0NLIHwgT19CSU5BUlkg
fAorKwkJICAgIE9fQ0xPRVhFQyB8IE9fTk9GT0xMT1cpOworIAkJX19hcmNoaXZlX2Vuc3VyZV9j
bG9leGVjX2ZsYWcobXlmZCk7CisgCX0KKyAJaWYgKG15ZmQgPCAwKQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9DVkUtMjAyMS0zMTU2Ni0w
Mi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvQ1ZF
LTIwMjEtMzE1NjYtMDIucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uMGRmY2QxYWM1YwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmUvQ1ZFLTIwMjEtMzE1NjYtMDIucGF0Y2gKQEAgLTAsMCArMSwx
NzIgQEAKK0Rlc2NyaXB0aW9uOiBEbyBub3QgZm9sbG93IHN5bWxpbmtzIHdoZW4gcHJvY2Vzc2lu
ZyB0aGUgZml4dXAgbGlzdAorIFB1Ymxpc2hlZCBhcyBDVkUtMjAyMS0zMTU2NgorT3JpZ2luOiB1
cHN0cmVhbSwgaHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9jb21taXQv
YjQxZGFlY2I1Y2NiNGM4ZTNiMmM1M2ZkNjE0NzEwOWZjMTJjMzA0MworQnVnLURlYmlhbjogaHR0
cHM6Ly9idWdzLmRlYmlhbi5vcmcvMTAwMTk5MAorQXV0aG9yOiBNYXJ0aW4gTWF0dXNrYSA8bWFy
dGluQG1hdHVza2Eub3JnPgorTGFzdC1VcGRhdGU6IDIwMjEtMTItMjAKKworQ1ZFOiBDVkUtMjAy
MS0zMTU2NgorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cDovL2RlYi5kZWJpYW4ub3Jn
L2RlYmlhbi9wb29sL21haW4vbGliYS9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy40LjMtMitkZWIx
MXUxLmRlYmlhbi50YXIueHpdCitTaWduZWQtb2ZmLWJ5OiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFu
aml0c2luaC5yYXRob2RAa3BpdC5jb20+CisKKy0tLSBhL01ha2VmaWxlLmFtCisrKysgYi9NYWtl
ZmlsZS5hbQorQEAgLTU1Niw2ICs1NTYsNyBAQAorIAlsaWJhcmNoaXZlL3Rlc3QvdGVzdF93cml0
ZV9kaXNrLmMgXAorIAlsaWJhcmNoaXZlL3Rlc3QvdGVzdF93cml0ZV9kaXNrX2FwcGxlZG91Ymxl
LmMgXAorIAlsaWJhcmNoaXZlL3Rlc3QvdGVzdF93cml0ZV9kaXNrX2ZhaWx1cmVzLmMgXAorKwls
aWJhcmNoaXZlL3Rlc3QvdGVzdF93cml0ZV9kaXNrX2ZpeHVwLmMgXAorIAlsaWJhcmNoaXZlL3Rl
c3QvdGVzdF93cml0ZV9kaXNrX2hhcmRsaW5rLmMgXAorIAlsaWJhcmNoaXZlL3Rlc3QvdGVzdF93
cml0ZV9kaXNrX2hmc19jb21wcmVzc2lvbi5jIFwKKyAJbGliYXJjaGl2ZS90ZXN0L3Rlc3Rfd3Jp
dGVfZGlza19sb29rdXAuYyBcCistLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfd3JpdGVfZGlza19w
b3NpeC5jCisrKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfd3JpdGVfZGlza19wb3NpeC5jCitAQCAt
MjQ2MSw2ICsyNDYxLDcgQEAKKyB7CisgCXN0cnVjdCBhcmNoaXZlX3dyaXRlX2Rpc2sgKmEgPSAo
c3RydWN0IGFyY2hpdmVfd3JpdGVfZGlzayAqKV9hOworIAlzdHJ1Y3QgZml4dXBfZW50cnkgKm5l
eHQsICpwOworKwlzdHJ1Y3Qgc3RhdCBzdDsKKyAJaW50IGZkLCByZXQ7CisgCisgCWFyY2hpdmVf
Y2hlY2tfbWFnaWMoJmEtPmFyY2hpdmUsIEFSQ0hJVkVfV1JJVEVfRElTS19NQUdJQywKK0BAIC0y
NDc4LDYgKzI0NzksMjAgQEAKKyAJCSAgICAoVE9ET19USU1FUyB8IFRPRE9fTU9ERV9CQVNFIHwg
VE9ET19BQ0xTIHwgVE9ET19GRkxBR1MpKSB7CisgCQkJZmQgPSBvcGVuKHAtPm5hbWUsCisgCQkJ
ICAgIE9fV1JPTkxZIHwgT19CSU5BUlkgfCBPX05PRk9MTE9XIHwgT19DTE9FWEVDKTsKKysJCQlp
ZiAoZmQgPT0gLTEpIHsKKysJCQkJLyogSWYgd2UgY2Fubm90IGxzdGF0LCBza2lwIGVudHJ5ICov
CisrCQkJCWlmIChsc3RhdChwLT5uYW1lLCAmc3QpICE9IDApCisrCQkJCQlnb3RvIHNraXBfZml4
dXBfZW50cnk7CisrCQkJCS8qCisrCQkJCSAqIElmIHdlIGRlYWwgd2l0aCBhIHN5bWJvbGljIGxp
bmssIG1hcmsKKysJCQkJICogaXQgaW4gdGhlIGZpeHVwIG1vZGUgdG8gZW5zdXJlIG5vCisrCQkJ
CSAqIG1vZGlmaWNhdGlvbnMgYXJlIG1hZGUgdG8gaXRzIHRhcmdldC4KKysJCQkJICovCisrCQkJ
CWlmIChTX0lTTE5LKHN0LnN0X21vZGUpKSB7CisrCQkJCQlwLT5tb2RlICY9IH5TX0lGTVQ7Cisr
CQkJCQlwLT5tb2RlIHw9IFNfSUZMTks7CisrCQkJCX0KKysJCQl9CisgCQl9CisgCQlpZiAocC0+
Zml4dXAgJiBUT0RPX1RJTUVTKSB7CisgCQkJc2V0X3RpbWVzKGEsIGZkLCBwLT5tb2RlLCBwLT5u
YW1lLAorQEAgLTI0OTIsNyArMjUwNywxMiBAQAorIAkJCQlmY2htb2QoZmQsIHAtPm1vZGUpOwor
IAkJCWVsc2UKKyAjZW5kaWYKKy0JCQljaG1vZChwLT5uYW1lLCBwLT5tb2RlKTsKKysjaWZkZWYg
SEFWRV9MQ0hNT0QKKysJCQlsY2htb2QocC0+bmFtZSwgcC0+bW9kZSk7CisrI2Vsc2UKKysJCQlp
ZiAoIVNfSVNMTksocC0+bW9kZSkpCisrCQkJCWNobW9kKHAtPm5hbWUsIHAtPm1vZGUpOworKyNl
bmRpZgorIAkJfQorIAkJaWYgKHAtPmZpeHVwICYgVE9ET19BQ0xTKQorIAkJCWFyY2hpdmVfd3Jp
dGVfZGlza19zZXRfYWNscygmYS0+YXJjaGl2ZSwgZmQsCitAQCAtMjUwMyw2ICsyNTIzLDcgQEAK
KyAJCWlmIChwLT5maXh1cCAmIFRPRE9fTUFDX01FVEFEQVRBKQorIAkJCXNldF9tYWNfbWV0YWRh
dGEoYSwgcC0+bmFtZSwgcC0+bWFjX21ldGFkYXRhLAorIAkJCQkJIHAtPm1hY19tZXRhZGF0YV9z
aXplKTsKKytza2lwX2ZpeHVwX2VudHJ5OgorIAkJbmV4dCA9IHAtPm5leHQ7CisgCQlhcmNoaXZl
X2FjbF9jbGVhcigmcC0+YWNsKTsKKyAJCWZyZWUocC0+bWFjX21ldGFkYXRhKTsKK0BAIC0yNjQz
LDYgKzI2NjQsNyBAQAorIAlmZS0+bmV4dCA9IGEtPmZpeHVwX2xpc3Q7CisgCWEtPmZpeHVwX2xp
c3QgPSBmZTsKKyAJZmUtPmZpeHVwID0gMDsKKysJZmUtPm1vZGUgPSAwOworIAlmZS0+bmFtZSA9
IHN0cmR1cChwYXRobmFtZSk7CisgCXJldHVybiAoZmUpOworIH0KKy0tLSBhL2xpYmFyY2hpdmUv
dGVzdC9DTWFrZUxpc3RzLnR4dAorKysrIGIvbGliYXJjaGl2ZS90ZXN0L0NNYWtlTGlzdHMudHh0
CitAQCAtMjA4LDYgKzIwOCw3IEBACisgICAgIHRlc3Rfd3JpdGVfZGlzay5jCisgICAgIHRlc3Rf
d3JpdGVfZGlza19hcHBsZWRvdWJsZS5jCisgICAgIHRlc3Rfd3JpdGVfZGlza19mYWlsdXJlcy5j
CisrICAgIHRlc3Rfd3JpdGVfZGlza19maXh1cC5jCisgICAgIHRlc3Rfd3JpdGVfZGlza19oYXJk
bGluay5jCisgICAgIHRlc3Rfd3JpdGVfZGlza19oZnNfY29tcHJlc3Npb24uYworICAgICB0ZXN0
X3dyaXRlX2Rpc2tfbG9va3VwLmMKKy0tLSAvZGV2L251bGwKKysrKyBiL2xpYmFyY2hpdmUvdGVz
dC90ZXN0X3dyaXRlX2Rpc2tfZml4dXAuYworQEAgLTAsMCArMSw3NyBAQAorKy8qLQorKyAqIENv
cHlyaWdodCAoYykgMjAyMSBNYXJ0aW4gTWF0dXNrYQorKyAqIEFsbCByaWdodHMgcmVzZXJ2ZWQu
CisrICoKKysgKiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZv
cm1zLCB3aXRoIG9yIHdpdGhvdXQKKysgKiBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJv
dmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKysgKiBhcmUgbWV0OgorKyAqIDEu
IFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29w
eXJpZ2h0CisrICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZv
bGxvd2luZyBkaXNjbGFpbWVyLgorKyAqIDIuIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9y
bSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0CisrICogICAgbm90aWNlLCB0aGlz
IGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZQor
KyAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRo
IHRoZSBkaXN0cmlidXRpb24uCisrICoKKysgKiBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZ
IFRIRSBBVVRIT1IoUykgYGBBUyBJUycnIEFORCBBTlkgRVhQUkVTUyBPUgorKyAqIElNUExJRUQg
V0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdB
UlJBTlRJRVMKKysgKiBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFIEFSRSBESVNDTEFJTUVELgorKyAqIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBB
VVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwKKysgKiBJTkNJREVO
VEFMLCBTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5DTFVE
SU5HLCBCVVQKKysgKiBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBH
T09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsCisrICogREFUQSwgT1IgUFJPRklUUzsgT1Ig
QlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZCisrICogVEhF
T1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwg
T1IgVE9SVAorKyAqIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcg
SU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBPRgorKyAqIFRISVMgU09GVFdBUkUsIEVWRU4gSUYg
QURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisrICovCisrI2luY2x1
ZGUgInRlc3QuaCIKKysKKysvKgorKyAqIFRlc3QgZml4dXAgZW50cmllcyBkb24ndCBmb2xsb3cg
c3ltbGlua3MKKysgKi8KKytERUZJTkVfVEVTVCh0ZXN0X3dyaXRlX2Rpc2tfZml4dXApCisrewor
KwlzdHJ1Y3QgYXJjaGl2ZSAqYWQ7CisrCXN0cnVjdCBhcmNoaXZlX2VudHJ5ICphZTsKKysJaW50
IHI7CisrCisrCWlmICghY2FuU3ltbGluaygpKSB7CisrCQlza2lwcGluZygiU3ltbGlua3Mgbm90
IHN1cHBvcnRlZCIpOworKwkJcmV0dXJuOworKwl9CisrCisrCS8qIFdyaXRlIGVudHJpZXMgdG8g
ZGlzay4gKi8KKysJYXNzZXJ0KChhZCA9IGFyY2hpdmVfd3JpdGVfZGlza19uZXcoKSkgIT0gTlVM
TCk7CisrCisrCS8qCisrCSAqIENyZWF0ZSBhIGZpbGUKKysJICovCisrCWFzc2VydE1ha2VGaWxl
KCJ2aWN0aW0iLCAwNjAwLCAiYSIpOworKworKwkvKgorKwkgKiBDcmVhdGUgYSBkaXJlY3Rvcnkg
YW5kIGEgc3ltbGluayB3aXRoIHRoZSBzYW1lIG5hbWUKKysJICovCisrCisrCS8qIERpcmVjdG9y
eTogZGlyICovCisrICAgICAgICBhc3NlcnQoKGFlID0gYXJjaGl2ZV9lbnRyeV9uZXcoKSkgIT0g
TlVMTCk7CisrICAgICAgICBhcmNoaXZlX2VudHJ5X2NvcHlfcGF0aG5hbWUoYWUsICJkaXIiKTsK
KysgICAgICAgIGFyY2hpdmVfZW50cnlfc2V0X21vZGUoYWUsIEFFX0lGRElSIHwgMDYwNik7Cisr
CWFzc2VydEVxdWFsSW50QShhZCwgMCwgYXJjaGl2ZV93cml0ZV9oZWFkZXIoYWQsIGFlKSk7Cisr
CWFzc2VydEVxdWFsSW50QShhZCwgMCwgYXJjaGl2ZV93cml0ZV9maW5pc2hfZW50cnkoYWQpKTsK
KysgICAgICAgIGFyY2hpdmVfZW50cnlfZnJlZShhZSk7CisrCisrCS8qIFN5bWJvbGljIExpbms6
IGRpciAtPiBmb28gKi8KKysJYXNzZXJ0KChhZSA9IGFyY2hpdmVfZW50cnlfbmV3KCkpICE9IE5V
TEwpOworKwlhcmNoaXZlX2VudHJ5X2NvcHlfcGF0aG5hbWUoYWUsICJkaXIiKTsKKysJYXJjaGl2
ZV9lbnRyeV9zZXRfbW9kZShhZSwgQUVfSUZMTksgfCAwNzc3KTsKKysJYXJjaGl2ZV9lbnRyeV9z
ZXRfc2l6ZShhZSwgMCk7CisrCWFyY2hpdmVfZW50cnlfY29weV9zeW1saW5rKGFlLCAidmljdGlt
Iik7CisrCWFzc2VydEVxdWFsSW50QShhZCwgMCwgciA9IGFyY2hpdmVfd3JpdGVfaGVhZGVyKGFk
LCBhZSkpOworKwlpZiAociA+PSBBUkNISVZFX1dBUk4pCisrCQlhc3NlcnRFcXVhbEludEEoYWQs
IDAsIGFyY2hpdmVfd3JpdGVfZmluaXNoX2VudHJ5KGFkKSk7CisrCWFyY2hpdmVfZW50cnlfZnJl
ZShhZSk7CisrCisrCWFzc2VydEVxdWFsSW50KEFSQ0hJVkVfT0ssIGFyY2hpdmVfd3JpdGVfZnJl
ZShhZCkpOworKworKwkvKiBUZXN0IHRoZSBlbnRyaWVzIG9uIGRpc2suICovCisrCWFzc2VydElz
U3ltbGluaygiZGlyIiwgInZpY3RpbSIsIDApOworKwlhc3NlcnRGaWxlTW9kZSgidmljdGltIiwg
MDYwMCk7CisrfQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZV8zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xp
YmFyY2hpdmVfMy40LjIuYmIKaW5kZXggZDhlZDgwNjg2Yi4uN2QyZTdiNzExYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjQuMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNC4yLmJi
CkBAIC0zNyw2ICszNyw4IEBAIFNSQ19VUkkgPSAiaHR0cDovL2xpYmFyY2hpdmUub3JnL2Rvd25s
b2Fkcy9saWJhcmNoaXZlLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAy
MS0zNjk3Ni0yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIxLTM2OTc2LTMucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMjMxNzcucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vQ1ZFLTIwMjEtMzE1NjYtMDEucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMjEtMzE1NjYtMDIucGF0Y2ggXAogIgogCiBTUkNfVVJJW21kNXN1bV0gPSAiZDk1M2VkNmI0
NzY5NGRhZGYwZTYwNDJmOGY5ZmY0NTEiCi0tIAoyLjE3LjEKCg==

--_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: text/x-patch;
	name="0001-libarchive-Fix-CVE-2021-23177-issue.patch"
Content-Description: 0001-libarchive-Fix-CVE-2021-23177-issue.patch
Content-Disposition: attachment;
	filename="0001-libarchive-Fix-CVE-2021-23177-issue.patch"; size=7384;
	creation-date="Wed, 07 Sep 2022 11:06:12 GMT";
	modification-date="Wed, 07 Sep 2022 11:06:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlM2FhNzllYzM3NmUzNDQxMjE4YTZiZTk2MDZjM2FmYmY4NmQxZmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RA
a3BpdC5jb20+CkRhdGU6IFR1ZSwgMzAgQXVnIDIwMjIgMTU6MjI6MTggKzA1MzAKU3ViamVjdDog
W1BBVENIIDEvMl0gbGliYXJjaGl2ZTogRml4IENWRS0yMDIxLTIzMTc3IGlzc3VlCgpBZGQgcGF0
Y2ggdG8gZml4IENWRS0yMDIxLTIzMTc3IGlzc3VlIGZvciBsaWJhcmNoaXZlCkxpbms6IGh0dHA6
Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2xpYmEvbGliYXJjaGl2ZS9saWJhcmNo
aXZlXzMuNC4zLTIrZGViMTF1MS5kZWJpYW4udGFyLnh6CgpTaWduZWQtb2ZmLWJ5OiBSYW5qaXRz
aW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20+Ci0tLQogLi4uL2xpYmFyY2hp
dmUvQ1ZFLTIwMjEtMjMxNzcucGF0Y2ggICAgICAgICAgIHwgMTgzICsrKysrKysrKysrKysrKysr
KwogLi4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjQuMi5iYiAgICAgICAgICAgIHwgICAxICsK
IDIgZmlsZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL0NWRS0yMDIxLTIzMTc3
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS9DVkUtMjAyMS0yMzE3Ny5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJh
cmNoaXZlL2xpYmFyY2hpdmUvQ1ZFLTIwMjEtMjMxNzcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uNTU1YzdhNDdmNwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvQ1ZFLTIwMjEtMjMxNzcucGF0
Y2gKQEAgLTAsMCArMSwxODMgQEAKK0Rlc2NyaXB0aW9uOiBGaXggaGFuZGxpbmcgb2Ygc3ltYm9s
aWMgbGluayBBQ0xzCisgUHVibGlzaGVkIGFzIENWRS0yMDIxLTIzMTc3CitPcmlnaW46IHVwc3Ry
ZWFtLCBodHRwczovL2dpdGh1Yi5jb20vbGliYXJjaGl2ZS9saWJhcmNoaXZlL2NvbW1pdC9mYmE0
ZjEyM2NjNDU2ZDJiMjUzOGY4MTFiYjgzMTQ4M2JmMzM2YmFkCitCdWctRGViaWFuOiBodHRwczov
L2J1Z3MuZGViaWFuLm9yZy8xMDAxOTg2CitBdXRob3I6IE1hcnRpbiBNYXR1c2thIDxtYXJ0aW5A
bWF0dXNrYS5vcmc+CitMYXN0LVVwZGF0ZWQ6IDIwMjEtMTItMjAKKworQ1ZFOiBDVkUtMjAyMS0y
MzE3NworVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cDovL2RlYi5kZWJpYW4ub3JnL2Rl
Ymlhbi9wb29sL21haW4vbGliYS9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy40LjMtMitkZWIxMXUx
LmRlYmlhbi50YXIueHpdCitTaWduZWQtb2ZmLWJ5OiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0
c2luaC5yYXRob2RAa3BpdC5jb20+CisKKy0tLSBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9kaXNrX2Fj
bF9mcmVlYnNkLmMKKysrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9kaXNrX2FjbF9mcmVlYnNkLmMK
K0BAIC0zMTksNyArMzE5LDcgQEAKKyAKKyBzdGF0aWMgaW50Cisgc2V0X2FjbChzdHJ1Y3QgYXJj
aGl2ZSAqYSwgaW50IGZkLCBjb25zdCBjaGFyICpuYW1lLAorLSAgICBzdHJ1Y3QgYXJjaGl2ZV9h
Y2wgKmFic3RyYWN0X2FjbCwKKysgICAgc3RydWN0IGFyY2hpdmVfYWNsICphYnN0cmFjdF9hY2ws
IF9fTEFfTU9ERV9UIG1vZGUsCisgICAgIGludCBhZV9yZXF1ZXN0ZWRfdHlwZSwgY29uc3QgY2hh
ciAqdG5hbWUpCisgeworIAlpbnQJCSBhY2xfdHlwZSA9IDA7CitAQCAtMzY0LDYgKzM2NCwxMyBA
QAorIAkJcmV0dXJuIChBUkNISVZFX0ZBSUxFRCk7CisgCX0KKyAKKysJaWYgKGFjbF90eXBlID09
IEFDTF9UWVBFX0RFRkFVTFQgJiYgIVNfSVNESVIobW9kZSkpIHsKKysJCWVycm5vID0gRUlOVkFM
OworKwkJYXJjaGl2ZV9zZXRfZXJyb3IoYSwgZXJybm8sCisrCQkgICAgIkNhbm5vdCBzZXQgZGVm
YXVsdCBBQ0wgb24gbm9uLWRpcmVjdG9yeSIpOworKwkJcmV0dXJuIChBUkNISVZFX1dBUk4pOwor
Kwl9CisrCisgCWFjbCA9IGFjbF9pbml0KGVudHJpZXMpOworIAlpZiAoYWNsID09IChhY2xfdClO
VUxMKSB7CisgCQlhcmNoaXZlX3NldF9lcnJvcihhLCBlcnJubywKK0BAIC01NDIsNyArNTQ5LDEw
IEBACisgCWVsc2UgaWYgKGFjbF9zZXRfbGlua19ucChuYW1lLCBhY2xfdHlwZSwgYWNsKSAhPSAw
KQorICNlbHNlCisgCS8qIEZyZWVCU0Qgb2xkZXIgdGhhbiA4LjAgKi8KKy0JZWxzZSBpZiAoYWNs
X3NldF9maWxlKG5hbWUsIGFjbF90eXBlLCBhY2wpICE9IDApCisrCWVsc2UgaWYgKFNfSVNMTkso
bW9kZSkpIHsKKysJICAgIC8qIGFjbF9zZXRfZmlsZSgpIGZvbGxvd3Mgc3ltYm9saWMgbGlua3Ms
IHNraXAgKi8KKysJICAgIHJldCA9IEFSQ0hJVkVfT0s7CisrCX0gZWxzZSBpZiAoYWNsX3NldF9m
aWxlKG5hbWUsIGFjbF90eXBlLCBhY2wpICE9IDApCisgI2VuZGlmCisgCXsKKyAJCWlmIChlcnJu
byA9PSBFT1BOT1RTVVBQKSB7CitAQCAtNjc3LDE0ICs2ODcsMTQgQEAKKyAJICAgICYgQVJDSElW
RV9FTlRSWV9BQ0xfVFlQRV9QT1NJWDFFKSAhPSAwKSB7CisgCQlpZiAoKGFyY2hpdmVfYWNsX3R5
cGVzKGFic3RyYWN0X2FjbCkKKyAJCSAgICAmIEFSQ0hJVkVfRU5UUllfQUNMX1RZUEVfQUNDRVNT
KSAhPSAwKSB7CistCQkJcmV0ID0gc2V0X2FjbChhLCBmZCwgbmFtZSwgYWJzdHJhY3RfYWNsLAor
KwkJCXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2FjbCwgbW9kZSwKKyAJCQkg
ICAgQVJDSElWRV9FTlRSWV9BQ0xfVFlQRV9BQ0NFU1MsICJhY2Nlc3MiKTsKKyAJCQlpZiAocmV0
ICE9IEFSQ0hJVkVfT0spCisgCQkJCXJldHVybiAocmV0KTsKKyAJCX0KKyAJCWlmICgoYXJjaGl2
ZV9hY2xfdHlwZXMoYWJzdHJhY3RfYWNsKQorIAkJICAgICYgQVJDSElWRV9FTlRSWV9BQ0xfVFlQ
RV9ERUZBVUxUKSAhPSAwKQorLQkJCXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0
X2FjbCwKKysJCQlyZXQgPSBzZXRfYWNsKGEsIGZkLCBuYW1lLCBhYnN0cmFjdF9hY2wsIG1vZGUs
CisgCQkJICAgIEFSQ0hJVkVfRU5UUllfQUNMX1RZUEVfREVGQVVMVCwgImRlZmF1bHQiKTsKKyAK
KyAJCS8qIFNpbXVsdGFuZW91cyBQT1NJWC4xZSBhbmQgTkZTdjQgaXMgbm90IHN1cHBvcnRlZCAq
LworQEAgLTY5Myw3ICs3MDMsNyBAQAorICNpZiBBUkNISVZFX0FDTF9GUkVFQlNEX05GUzQKKyAJ
ZWxzZSBpZiAoKGFyY2hpdmVfYWNsX3R5cGVzKGFic3RyYWN0X2FjbCkgJgorIAkgICAgQVJDSElW
RV9FTlRSWV9BQ0xfVFlQRV9ORlM0KSAhPSAwKSB7CistCQlyZXQgPSBzZXRfYWNsKGEsIGZkLCBu
YW1lLCBhYnN0cmFjdF9hY2wsCisrCQlyZXQgPSBzZXRfYWNsKGEsIGZkLCBuYW1lLCBhYnN0cmFj
dF9hY2wsIG1vZGUsCisgCQkgICAgQVJDSElWRV9FTlRSWV9BQ0xfVFlQRV9ORlM0LCAibmZzNCIp
OworIAl9CisgI2VuZGlmCistLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfZGlza19hY2xfbGludXgu
YworKysrIGIvbGliYXJjaGl2ZS9hcmNoaXZlX2Rpc2tfYWNsX2xpbnV4LmMKK0BAIC0zNDMsNiAr
MzQzLDExIEBACisgCQlyZXR1cm4gKEFSQ0hJVkVfRkFJTEVEKTsKKyAJfQorIAorKwlpZiAoU19J
U0xOSyhtb2RlKSkgeworKwkJLyogTGludXggZG9lcyBub3Qgc3VwcG9ydCBSaWNoQUNMcyBvbiBz
eW1ib2xpYyBsaW5rcyAqLworKwkJcmV0dXJuIChBUkNISVZFX09LKTsKKysJfQorKworIAlyaWNo
YWNsID0gcmljaGFjbF9hbGxvYyhlbnRyaWVzKTsKKyAJaWYgKHJpY2hhY2wgPT0gTlVMTCkgewor
IAkJYXJjaGl2ZV9zZXRfZXJyb3IoYSwgZXJybm8sCitAQCAtNDU1LDcgKzQ2MCw3IEBACisgI2lm
IEFSQ0hJVkVfQUNMX0xJQkFDTAorIHN0YXRpYyBpbnQKKyBzZXRfYWNsKHN0cnVjdCBhcmNoaXZl
ICphLCBpbnQgZmQsIGNvbnN0IGNoYXIgKm5hbWUsCistICAgIHN0cnVjdCBhcmNoaXZlX2FjbCAq
YWJzdHJhY3RfYWNsLAorKyAgICBzdHJ1Y3QgYXJjaGl2ZV9hY2wgKmFic3RyYWN0X2FjbCwgX19M
QV9NT0RFX1QgbW9kZSwKKyAgICAgaW50IGFlX3JlcXVlc3RlZF90eXBlLCBjb25zdCBjaGFyICp0
bmFtZSkKKyB7CisgCWludAkJIGFjbF90eXBlID0gMDsKK0BAIC00ODgsNiArNDkzLDE4IEBACisg
CQlyZXR1cm4gKEFSQ0hJVkVfRkFJTEVEKTsKKyAJfQorIAorKwlpZiAoU19JU0xOSyhtb2RlKSkg
eworKwkJLyogTGludXggZG9lcyBub3Qgc3VwcG9ydCBBQ0xzIG9uIHN5bWJvbGljIGxpbmtzICov
CisrCQlyZXR1cm4gKEFSQ0hJVkVfT0spOworKwl9CisrCisrCWlmIChhY2xfdHlwZSA9PSBBQ0xf
VFlQRV9ERUZBVUxUICYmICFTX0lTRElSKG1vZGUpKSB7CisrCQllcnJubyA9IEVJTlZBTDsKKysJ
CWFyY2hpdmVfc2V0X2Vycm9yKGEsIGVycm5vLAorKwkJICAgICJDYW5ub3Qgc2V0IGRlZmF1bHQg
QUNMIG9uIG5vbi1kaXJlY3RvcnkiKTsKKysJCXJldHVybiAoQVJDSElWRV9XQVJOKTsKKysJfQor
KworIAlhY2wgPSBhY2xfaW5pdChlbnRyaWVzKTsKKyAJaWYgKGFjbCA9PSAoYWNsX3QpTlVMTCkg
eworIAkJYXJjaGl2ZV9zZXRfZXJyb3IoYSwgZXJybm8sCitAQCAtNzI3LDE0ICs3NDQsMTQgQEAK
KyAJICAgICYgQVJDSElWRV9FTlRSWV9BQ0xfVFlQRV9QT1NJWDFFKSAhPSAwKSB7CisgCQlpZiAo
KGFyY2hpdmVfYWNsX3R5cGVzKGFic3RyYWN0X2FjbCkKKyAJCSAgICAmIEFSQ0hJVkVfRU5UUllf
QUNMX1RZUEVfQUNDRVNTKSAhPSAwKSB7CistCQkJcmV0ID0gc2V0X2FjbChhLCBmZCwgbmFtZSwg
YWJzdHJhY3RfYWNsLAorKwkJCXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2Fj
bCwgbW9kZSwKKyAJCQkgICAgQVJDSElWRV9FTlRSWV9BQ0xfVFlQRV9BQ0NFU1MsICJhY2Nlc3Mi
KTsKKyAJCQlpZiAocmV0ICE9IEFSQ0hJVkVfT0spCisgCQkJCXJldHVybiAocmV0KTsKKyAJCX0K
KyAJCWlmICgoYXJjaGl2ZV9hY2xfdHlwZXMoYWJzdHJhY3RfYWNsKQorIAkJICAgICYgQVJDSElW
RV9FTlRSWV9BQ0xfVFlQRV9ERUZBVUxUKSAhPSAwKQorLQkJCXJldCA9IHNldF9hY2woYSwgZmQs
IG5hbWUsIGFic3RyYWN0X2FjbCwKKysJCQlyZXQgPSBzZXRfYWNsKGEsIGZkLCBuYW1lLCBhYnN0
cmFjdF9hY2wsIG1vZGUsCisgCQkJICAgIEFSQ0hJVkVfRU5UUllfQUNMX1RZUEVfREVGQVVMVCwg
ImRlZmF1bHQiKTsKKyAJfQorICNlbmRpZgkvKiBBUkNISVZFX0FDTF9MSUJBQ0wgKi8KKy0tLSBh
L2xpYmFyY2hpdmUvYXJjaGl2ZV9kaXNrX2FjbF9zdW5vcy5jCisrKysgYi9saWJhcmNoaXZlL2Fy
Y2hpdmVfZGlza19hY2xfc3Vub3MuYworQEAgLTQ0Myw3ICs0NDMsNyBAQAorIAorIHN0YXRpYyBp
bnQKKyBzZXRfYWNsKHN0cnVjdCBhcmNoaXZlICphLCBpbnQgZmQsIGNvbnN0IGNoYXIgKm5hbWUs
CistICAgIHN0cnVjdCBhcmNoaXZlX2FjbCAqYWJzdHJhY3RfYWNsLAorKyAgICBzdHJ1Y3QgYXJj
aGl2ZV9hY2wgKmFic3RyYWN0X2FjbCwgX19MQV9NT0RFX1QgbW9kZSwKKyAgICAgaW50IGFlX3Jl
cXVlc3RlZF90eXBlLCBjb25zdCBjaGFyICp0bmFtZSkKKyB7CisgCWFjbGVudF90CSAqYWNsZW50
OworQEAgLTQ2Nyw3ICs0NjcsNiBAQAorIAlpZiAoZW50cmllcyA9PSAwKQorIAkJcmV0dXJuIChB
UkNISVZFX09LKTsKKyAKKy0KKyAJc3dpdGNoIChhZV9yZXF1ZXN0ZWRfdHlwZSkgeworIAljYXNl
IEFSQ0hJVkVfRU5UUllfQUNMX1RZUEVfUE9TSVgxRToKKyAJCWNtZCA9IFNFVEFDTDsKK0BAIC00
OTIsNiArNDkxLDEyIEBACisgCQlyZXR1cm4gKEFSQ0hJVkVfRkFJTEVEKTsKKyAJfQorIAorKyAg
ICAgICAgaWYgKFNfSVNMTksobW9kZSkpIHsKKysgICAgICAgICAgICAgICAgLyogU2tpcCBBQ0xz
IG9uIHN5bWJvbGljIGxpbmtzICovCisrCQlyZXQgPSBBUkNISVZFX09LOworKwkJZ290byBleGl0
X2ZyZWU7CisrICAgICAgICB9CisrCisgCWUgPSAwOworIAorIAl3aGlsZSAoYXJjaGl2ZV9hY2xf
bmV4dChhLCBhYnN0cmFjdF9hY2wsIGFlX3JlcXVlc3RlZF90eXBlLCAmYWVfdHlwZSwKK0BAIC04
MDEsNyArODA2LDcgQEAKKyAJaWYgKChhcmNoaXZlX2FjbF90eXBlcyhhYnN0cmFjdF9hY2wpCisg
CSAgICAmIEFSQ0hJVkVfRU5UUllfQUNMX1RZUEVfUE9TSVgxRSkgIT0gMCkgeworIAkJLyogU29s
YXJpcyB3cml0ZXMgUE9TSVguMWUgYWNjZXNzIGFuZCBkZWZhdWx0IEFDTHMgdG9nZXRoZXIgKi8K
Ky0JCXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2FjbCwKKysJCXJldCA9IHNl
dF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2FjbCwgbW9kZSwKKyAJCSAgICBBUkNISVZFX0VO
VFJZX0FDTF9UWVBFX1BPU0lYMUUsICJwb3NpeDFlIik7CisgCisgCQkvKiBTaW11bHRhbmVvdXMg
UE9TSVguMWUgYW5kIE5GU3Y0IGlzIG5vdCBzdXBwb3J0ZWQgKi8KK0BAIC04MTAsNyArODE1LDcg
QEAKKyAjaWYgQVJDSElWRV9BQ0xfU1VOT1NfTkZTNAorIAllbHNlIGlmICgoYXJjaGl2ZV9hY2xf
dHlwZXMoYWJzdHJhY3RfYWNsKSAmCisgCSAgICBBUkNISVZFX0VOVFJZX0FDTF9UWVBFX05GUzQp
ICE9IDApIHsKKy0JCXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2FjbCwKKysJ
CXJldCA9IHNldF9hY2woYSwgZmQsIG5hbWUsIGFic3RyYWN0X2FjbCwgbW9kZSwKKyAJCSAgICBB
UkNISVZFX0VOVFJZX0FDTF9UWVBFX05GUzQsICJuZnM0Iik7CisgCX0KKyAjZW5kaWYKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy40LjIu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNC4yLmJi
CmluZGV4IGI3NDI2YTFiZTguLmQ4ZWQ4MDY4NmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy40LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjQuMi5iYgpAQCAtMzYsNiArMzYsNyBA
QCBTUkNfVVJJID0gImh0dHA6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9hZHMvbGliYXJjaGl2ZS0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMzY5NzYtMS5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMS0zNjk3Ni0yLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovL0NWRS0yMDIxLTM2OTc2LTMucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZFLTIw
MjEtMjMxNzcucGF0Y2ggXAogIgogCiBTUkNfVVJJW21kNXN1bV0gPSAiZDk1M2VkNmI0NzY5NGRh
ZGYwZTYwNDJmOGY5ZmY0NTEiCi0tIAoyLjE3LjEKCg==

--_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_
Content-Type: application/octet-stream; name="log.do_fetch.7706"
Content-Description: log.do_fetch.7706
Content-Disposition: attachment; filename="log.do_fetch.7706"; size=14319;
	creation-date="Wed, 07 Sep 2022 11:09:50 GMT";
	modification-date="Wed, 07 Sep 2022 11:10:01 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFtdCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jv
b3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFtdCkRF
QlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX2ZldGNoCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2gKREVCVUc6IFRyeWluZyBQUkVNSVJST1JTCkRFQlVH
OiBUcnlpbmcgVXBzdHJlYW0KREVCVUc6IEZldGNoaW5nIGh0dHA6Ly9saWJhcmNoaXZlLm9yZy9k
b3dubG9hZHMvbGliYXJjaGl2ZS0zLjQuMi50YXIuZ3ogdXNpbmcgY29tbWFuZCAnL3Vzci9iaW4v
ZW52IHdnZXQgLXQgMiAtVCAzMCAtLXBhc3NpdmUtZnRwIC0tbm8tY2hlY2stY2VydGlmaWNhdGUg
LU8gL2hvbWUva3BpdC9icy13b3Jrc3BhY2UveW9jdG8tZG93bmxvYWRzL2xpYmFyY2hpdmUtMy40
LjIudGFyLmd6LnRtcCAtUCAvaG9tZS9rcGl0L2JzLXdvcmtzcGFjZS95b2N0by1kb3dubG9hZHMg
J2h0dHA6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9hZHMvbGliYXJjaGl2ZS0zLjQuMi50YXIuZ3on
JwpERUJVRzogRmV0Y2hlciBhY2Nlc3NlZCB0aGUgbmV0d29yayB3aXRoIHRoZSBjb21tYW5kIC91
c3IvYmluL2VudiB3Z2V0IC10IDIgLVQgMzAgLS1wYXNzaXZlLWZ0cCAtLW5vLWNoZWNrLWNlcnRp
ZmljYXRlIC1PIC9ob21lL2twaXQvYnMtd29ya3NwYWNlL3lvY3RvLWRvd25sb2Fkcy9saWJhcmNo
aXZlLTMuNC4yLnRhci5nei50bXAgLVAgL2hvbWUva3BpdC9icy13b3Jrc3BhY2UveW9jdG8tZG93
bmxvYWRzICdodHRwOi8vbGliYXJjaGl2ZS5vcmcvZG93bmxvYWRzL2xpYmFyY2hpdmUtMy40LjIu
dGFyLmd6JwpERUJVRzogUnVubmluZyBleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IGV4cG9ydCBE
QlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6cGF0aD0vcnVuL3VzZXIvMTAwMC9idXMiOyBl
eHBvcnQgU1NIX0FHRU5UX1BJRD0iNTE0MiI7IGV4cG9ydCBTU0hfQVVUSF9TT0NLPSIvcnVuL3Vz
ZXIvMTAwMC9rZXlyaW5nL3NzaCI7IGV4cG9ydCBub19wcm94eT0ibG9jYWxob3N0LDEyNy4wLjAu
MSw6OjEsY2MtYXJ0aWZhY3RvcnkuYm13Z3JvdXAubmV0LGZ0cC5hbHNhLXByb2plY3Qub3JnLCou
QWRhcy5pbnRlbC5jb20sKi5BZHZhbnRhZ2VkcC5vcmcsKi5ibXcuY29ycCwqLmJtd2dyb3VwLm5l
dCwqLmNjYm13Z3JvdXAubmV0LCpnaXRodWIuY29tLCouYXJ0aWZhY3RvcnkuY2MuYm13Z3JvdXAu
bmV0LGNjLWdpdGh1Yi5ibXdncm91cC5uZXQsaWNnZW41LmFydGlmYWN0b3J5LmNjLmJtd2dyb3Vw
Lm5ldCxldS1tdWMtOS1jYy1wcm9kLWpmcm9nLWFydGlmYWN0b3J5LmV1LW11Yy05LmFydGlmYWN0
b3J5LW1pbmlvLmNjLmJtd2dyb3VwLm5ldCwqLmFydGlmYWN0b3J5LW1pbmlvLmNjLmJtd2dyb3Vw
Lm5ldCxjb2RlY3JhZnQtY2MtcHJvZC1hcnRpZmFjdG9yeS1pY2dlbjUuaWNnZW41LmFydGlmYWN0
b3J5LW1pbmlvLmNjLmJtd2dyb3VwLm5ldCxhcnRpZmFjdG9yeS5jYy5ibXdncm91cC5uZXQsKmNj
LWFydGlmYWN0b3J5LmJtd2dyb3VwLm5ldCxmdHAuYWxzYS1wcm9qZWN0Lm9yZywqLkFkYXMuaW50
ZWwuY29tLCouQWR2YW50YWdlZHAub3JnLCouYm13LmNvcnAsKi5ibXdncm91cC5uZXQsKi5jY2Jt
d2dyb3VwLm5ldCwqZ2l0aHViLmNvbSxhcnRpZmFjdG9yeS5jYy5ibXdncm91cC5uZXQsY2MtZ2l0
aHViLmJtd2dyb3VwLm5ldCxpY2dlbjUuYXJ0aWZhY3RvcnkuY2MuYm13Z3JvdXAubmV0LGNvZGVj
cmFmdC1jYy1wcm9kLWFydGlmYWN0b3J5LWljZ2VuNS5pY2dlbjUuYXJ0aWZhY3RvcnktbWluaW8u
Y2MuYm13Z3JvdXAubmV0LG1ndTIyLmFydGlmYWN0b3J5LmNjLmJtd2dyb3VwLm5ldCxjb2RlY3Jh
ZnQtY2MtcHJvZC1hcnRpZmFjdG9yeS1tZ3UyMi5tZ3UyMi5hcnRpZmFjdG9yeS1taW5pby5jYy5i
bXdncm91cC5uZXQsYXNjLXJlcG8uYm13Z3JvdXAubmV0IjsgZXhwb3J0IFBBVEg9Ii9tbnQvMjNh
NWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL2J1aWxkLWR1bmZlbGwvdG1w
L3N5c3Jvb3RzLXVuaW5hdGl2ZS94ODZfNjQtbGludXgvdXNyL2JpbjovbW50LzIzYTVlNTBlLWM3
MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L3NjcmlwdHM6L21udC8yM2E1ZTUw
ZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vYnVpbGQtZHVuZmVsbC90bXAvd29y
ay9jb3JlMi02NC1wb2t5LWxpbnV4L2xpYmFyY2hpdmUvMy40LjItcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL3Vzci9iaW4veDg2XzY0LXBva3ktbGludXg6L21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vYnVpbGQtZHVuZmVsbC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L2xpYmFyY2hpdmUvMy40LjItcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2Jpbi9jcm9z
c3NjcmlwdHM6L21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8v
YnVpbGQtZHVuZmVsbC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L2xpYmFyY2hpdmUvMy40
LjItcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9tbnQvMjNhNWU1MGUtYzczOC00
YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL2J1aWxkLWR1bmZlbGwvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC9saWJhcmNoaXZlLzMuNC4yLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluOi9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL2J1
aWxkLWR1bmZlbGwvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9saWJhcmNoaXZlLzMuNC4y
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9zYmluOi9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2
MzYtMWFkYjgxZTVkNzlmL3lvY3RvL2J1aWxkLWR1bmZlbGwvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9saWJhcmNoaXZlLzMuNC4yLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L21u
dC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9iaXRiYWtl
L2JpbjovbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9idWls
ZC1kdW5mZWxsL3RtcC9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUva3BpdCI7IC91c3Iv
YmluL2VudiB3Z2V0IC10IDIgLVQgMzAgLS1wYXNzaXZlLWZ0cCAtLW5vLWNoZWNrLWNlcnRpZmlj
YXRlIC1PIC9ob21lL2twaXQvYnMtd29ya3NwYWNlL3lvY3RvLWRvd25sb2Fkcy9saWJhcmNoaXZl
LTMuNC4yLnRhci5nei50bXAgLVAgL2hvbWUva3BpdC9icy13b3Jrc3BhY2UveW9jdG8tZG93bmxv
YWRzICdodHRwOi8vbGliYXJjaGl2ZS5vcmcvZG93bmxvYWRzL2xpYmFyY2hpdmUtMy40LjIudGFy
Lmd6JyAtLXByb2dyZXNzPWRvdCAtdgotLTIwMjItMDktMDcgMTA6NDk6MjctLSAgaHR0cDovL2xp
YmFyY2hpdmUub3JnL2Rvd25sb2Fkcy9saWJhcmNoaXZlLTMuNC4yLnRhci5negpSZXNvbHZpbmcg
bGliYXJjaGl2ZS5vcmcgKGxpYmFyY2hpdmUub3JnKS4uLiAxMDguMTU4LjYxLjQzLCAxMDguMTU4
LjYxLjEyNywgMTA4LjE1OC42MS42LCAuLi4KQ29ubmVjdGluZyB0byBsaWJhcmNoaXZlLm9yZyAo
bGliYXJjaGl2ZS5vcmcpfDEwOC4xNTguNjEuNDN8OjgwLi4uIGNvbm5lY3RlZC4KSFRUUCByZXF1
ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDIwMCBPSwpMZW5ndGg6IDY5Nzk0ODEgKDYu
N00pIFthcHBsaWNhdGlvbi94LWd6aXBdClNhdmluZyB0bzog4oCYL2hvbWUva3BpdC9icy13b3Jr
c3BhY2UveW9jdG8tZG93bmxvYWRzL2xpYmFyY2hpdmUtMy40LjIudGFyLmd6LnRtcOKAmQoKCjIw
MjItMDktMDcgMTA6NDk6MjkgKDMuMzggTUIvcykgLSDigJgvaG9tZS9rcGl0L2JzLXdvcmtzcGFj
ZS95b2N0by1kb3dubG9hZHMvbGliYXJjaGl2ZS0zLjQuMi50YXIuZ3oudG1w4oCZIHNhdmVkIFs2
OTc5NDgxLzY5Nzk0ODFdCgpERUJVRzogU2VhcmNoaW5nIGZvciBDVkUtMjAyMS0zNjk3Ni0xLnBh
dGNoIGluIHBhdGhzOgogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3
OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZl
LTMuNC4yL3Bva3kKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlm
L3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9w
b2t5CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9w
b2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzL3Bva3kKICAgIC9tbnQv
MjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi9xZW11eDg2LTY0CiAgICAv
bW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcWVtdXg4Ni02NAogICAgL21u
dC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9maWxlcy9xZW11eDg2LTY0CiAgICAvbW50LzIzYTVl
NTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvcWVtdWFsbAogICAgL21udC8yM2E1
ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUt
YzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvZmlsZXMvcWVtdWFsbAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJj
aGl2ZS9saWJhcmNoaXZlLTMuNC4yL3g4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJj
aGl2ZS9saWJhcmNoaXZlL3g4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0x
YWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9m
aWxlcy94ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlm
L3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0z
LjQuMi8KICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3Rv
L3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8KICAgIC9t
bnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMvCkRFQlVHOiBTZWFyY2hpbmcgZm9yIENW
RS0yMDIxLTM2OTc2LTIucGF0Y2ggaW4gcGF0aHM6CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJl
OS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJh
cmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvcG9reQogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJj
aGl2ZS9saWJhcmNoaXZlL3Bva3kKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFk
YjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmls
ZXMvcG9reQogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9j
dG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLTMuNC4y
L3FlbXV4ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlm
L3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9x
ZW11eDg2LTY0CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95
b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzL3FlbXV4ODYt
NjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bv
a3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi9xZW11
YWxsCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9w
b2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcWVtdWFsbAog
ICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9maWxlcy9xZW11YWxsCiAgICAvbW50LzIz
YTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIveDg2LTY0CiAgICAvbW50LzIz
YTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUveDg2LTY0CiAgICAvbW50LzIzYTVlNTBl
LWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2ZpbGVzL3g4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJj
aGl2ZS9saWJhcmNoaXZlLTMuNC4yLwogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0x
YWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9s
aWJhcmNoaXZlLwogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYv
eW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9maWxlcy8KREVCVUc6
IFNlYXJjaGluZyBmb3IgQ1ZFLTIwMjEtMzY5NzYtMy5wYXRjaCBpbiBwYXRoczoKICAgIC9tbnQv
MjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi9wb2t5CiAgICAvbW50LzIz
YTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcG9reQogICAgL21udC8yM2E1ZTUwZS1j
NzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliYXJjaGl2ZS9maWxlcy9wb2t5CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2
LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZl
L2xpYmFyY2hpdmUtMy40LjIvcWVtdXg4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTkt
YTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJj
aGl2ZS9saWJhcmNoaXZlL3FlbXV4ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2
MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hp
dmUvZmlsZXMvcWVtdXg4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRi
ODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJh
cmNoaXZlLTMuNC4yL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFk
YjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS9xZW11YWxsCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1
ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzL3Fl
bXVhbGwKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3Rv
L3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi94
ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3Rv
L3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS94ODYtNjQK
ICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMveDg2LTY0CiAgICAvbW50LzIz
YTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvCiAgICAvbW50LzIzYTVlNTBl
LWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1h
NjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNo
aXZlL2ZpbGVzLwpERUJVRzogU2VhcmNoaW5nIGZvciBDVkUtMjAyMS0yMzE3Ny5wYXRjaCBpbiBw
YXRoczoKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3Rv
L3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi9w
b2t5CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9w
b2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcG9reQogICAg
L21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9maWxlcy9wb2t5CiAgICAvbW50LzIzYTVlNTBl
LWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvcWVtdXg4Ni02NAogICAgL21udC8yM2E1
ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL3FlbXV4ODYtNjQKICAgIC9tbnQvMjNhNWU1
MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMvcWVtdXg4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4
LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliYXJjaGl2ZS9saWJhcmNoaXZlLTMuNC4yL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUtYzcz
OC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9xZW11YWxsCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJl
OS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJh
cmNoaXZlL2ZpbGVzL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFk
YjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS0zLjQuMi94ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFk
YjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS94ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVk
NzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMveDg2
LTY0CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9w
b2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvCiAg
ICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvCiAgICAvbW50LzIzYTVl
NTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzLwpERUJVRzogU2VhcmNoaW5nIGZvciBDVkUtMjAyMS0z
MTU2Ni0wMS5wYXRjaCBpbiBwYXRoczoKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYt
MWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZS0zLjQuMi9wb2t5CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFh
ZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xp
YmFyY2hpdmUvcG9reQogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3
OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9maWxlcy9wb2t5
CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvcWVtdXg4
Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8v
cG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL3FlbXV4ODYt
NjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bv
a3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMvcWVtdXg4Ni02NAogICAg
L21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLTMuNC4yL3FlbXVhbGwKICAg
IC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9xZW11YWxsCiAgICAvbW50
LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUt
YzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi94ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUt
YzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS94ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00
YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
YmFyY2hpdmUvZmlsZXMveDg2LTY0CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFh
ZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xp
YmFyY2hpdmUtMy40LjIvCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1
ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hp
dmUvCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9w
b2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzLwpERUJVRzogU2VhcmNo
aW5nIGZvciBDVkUtMjAyMS0zMTU2Ni0wMi5wYXRjaCBpbiBwYXRoczoKICAgIC9tbnQvMjNhNWU1
MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi9wb2t5CiAgICAvbW50LzIzYTVlNTBl
LWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcG9reQogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRi
ZTktYTYzNi0xYWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGli
YXJjaGl2ZS9maWxlcy9wb2t5CiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4
MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFy
Y2hpdmUtMy40LjIvcWVtdXg4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0x
YWRiODFlNWQ3OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9s
aWJhcmNoaXZlL3FlbXV4ODYtNjQKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFk
YjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmls
ZXMvcWVtdXg4Ni02NAogICAgL21udC8yM2E1ZTUwZS1jNzM4LTRiZTktYTYzNi0xYWRiODFlNWQ3
OWYveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZl
LTMuNC4yL3FlbXVhbGwKICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVk
NzlmL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2
ZS9xZW11YWxsCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95
b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2ZpbGVzL3FlbXVhbGwK
ICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS0zLjQuMi94ODYtNjQK
ICAgIC9tbnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS94ODYtNjQKICAgIC9t
bnQvMjNhNWU1MGUtYzczOC00YmU5LWE2MzYtMWFkYjgxZTVkNzlmL3lvY3RvL3Bva3kvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvZmlsZXMveDg2LTY0CiAgICAvbW50LzIzYTVlNTBl
LWM3MzgtNGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUtMy40LjIvCiAgICAvbW50LzIzYTVlNTBlLWM3Mzgt
NGJlOS1hNjM2LTFhZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmUvCiAgICAvbW50LzIzYTVlNTBlLWM3MzgtNGJlOS1hNjM2LTFh
ZGI4MWU1ZDc5Zi95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2Zp
bGVzLwpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2ggZmluaXNoZWQKREVCVUc6
IFB5dGhvbiBmdW5jdGlvbiBkb19mZXRjaCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhv
biBmdW5jdGlvbiB3cml0ZV9zcmNyZXYKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiB3cml0ZV9zcmNy
ZXYgZmluaXNoZWQK

--_008_PN3PR01MB7382D12654445624F2D4C01A8F419PN3PR01MB7382INDP_--

