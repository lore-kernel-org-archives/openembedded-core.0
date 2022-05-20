Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A31C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 05:32:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5545.1653024763206524343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 22:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SQbcYEf7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=213929ba40=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24K5V4Vi019554
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 22:32:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=3cdhzr7eOwN0XQQVFKd9yQ92jqUgnfJ+huLwYLen8Yc=;
 b=SQbcYEf7SgH8JBype3u1KWdAUjbuH3VS2+ZyIQPmK8WEtfVlLQGx8NPUeGiG61NU+H+s
 1BrIc4wcUKh5ohUqi5J+pJ/EF0g4ysuOWZnoT6PI65Rjw23QgyO8y/Ouex87sfimSXq4
 vyKTe57FlukPamTc/J2bah+GhBIcO2c4JnK6nD098O+16S/yhXdA2zTbFWm1/muZnpIg
 KA5VKpkgubS0RduBktAlNoPqocCf6S+sIBn9MvpNPnP20unRwDCw1JyMkXfa0w8jBcx7
 HpTjq04OfURD4h4GaZAbY9QFbFPMxhVoAgxwPBWY/5pWi6QbhtZt/q8sFXMvWUBDGvO2 qA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmvq9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 22:32:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24K5WfeZ022245
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 22:32:41 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmvq99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 May 2022 22:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlkMeuG74XlBhVYZ/YOhyhYhzWBwPLM2MEEv7fi1COYuhtdo3BGwalH/o8XXbJ6yxaD9Z/X+6yWqRHUH80SqJ/YCeNuE76rGTP/BAXA8ZOx4mKmL5FzsAiEBWaIWGPaHLZnWrZd/Qgp3ctVWMkuuZSlcav4dNu3uMAJd6+j3Ak1AEuNaHoR+k7zBZjEkmD8BmdM3dPwGcAvkfEI/djFiwE18hwWmzJ8JjhLWNnz5rKX+1n6ll63SOEiD+6I0+VQyjSmrkclZ2Jcc4KYrLe4tZz9mhGqjuGeV3tz0x7XkT0EO3sAHCmArDxx+r0DQS9v/WbHcXVHD4O8/MLA/nPNSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cdhzr7eOwN0XQQVFKd9yQ92jqUgnfJ+huLwYLen8Yc=;
 b=RPx4N6u7MxPMyumrjvvN/nq07eoeHHrF51AIO+9sau1TedkJXTL605ARI0tXnZisHxS/G95u+tbS30YS0PZGOwpG4lw3Y7Jv8UBNa6hfYZ2q4DQOAiYk6bGPZqSlWKMvD2qURnrOyynPBTmi0bGPmWK70KCBfvJ393pNqeBesFzOCilFz4Gmcc/JcZ3tbmryf2GVORv6kUmuiVKAAiNEWxM7mBEWLViE7d9R/Tk8vsJSIgQt1hZLJgzfBOWIoxQ5i2GhxlHWuNkVMXT5hLnlOUChB+KuceVjF4RNEocX+YMeE8+qINI5dSu6VC6sZN/IeLtOw9g+3dcjGL2eyX4Phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 05:32:38 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::4cb8:f51f:5fa8:4de]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::4cb8:f51f:5fa8:4de%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 05:32:38 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] eudev: create static-nodes in init script
Thread-Topic: [PATCH] eudev: create static-nodes in init script
Thread-Index: AQHYa4rAqb4iztV6Z0qy9XKYHG7N660nLEH2
Date: Fri, 20 May 2022 05:32:38 +0000
Message-ID: 
 <SN6PR11MB25574BDFF88A33D9399205CF82D39@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220519085658.3796309-1-changqing.li@windriver.com>
 <CAO5Uq5TFbM9gZmNk+Zm5sFgyu6PQgKmOPBnknv=u1Wkm_mhubA@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5TFbM9gZmNk+Zm5sFgyu6PQgKmOPBnknv=u1Wkm_mhubA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61563160-c942-4e32-f4f0-08da3a22272b
x-ms-traffictypediagnostic: SJ0PR11MB4910:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB49101A6EBE73B097B1D7249482D39@SJ0PR11MB4910.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bTYmzaDtKsPdV26b5PaFqm2JNmXWczl+9ehq0Yfdzl7Z/afM+kR4pmNaY3QDlRlGCXR69vwUDW81fwU00scFf1eu+qdI4Wv/MALoT+lnD1+QpwIUfVOyZkfMR2hyVJpXJnicGLTGwmodahAdrgA/Ur/TfT6QYpq5OP4/lioAawXQvAdFTI0ctsRm0lq8Xy0plEBUS6MPPavOeE+QH4fs0piE/JISvIMQ81KhFQfchH5rLFA9r8Bo3xRqeMhP7WQZklfUaYTBrEHrnvBgPJeUKi9V5ImuJtuCf++PfXDtNJaRfqYbSCWmdSs09UzIhY0Z/3XdNNCzXqHsh3aOsZd2yic4rUDkSeVAI/WAhCd1L51xKgYABkM1vz4fXgWeM4I2PkLN5Xm/NX4RHGaH0l4U+Sp9yhbKrDReHGSE1gMZPlxih5HYNWCymXljgwwGDyPWrYyWnzviMN41jGO/z6o+c7fiB9UXP/cl5zTxI8tLA7ZIcZnhyP13/pkSIb24YMQocMaNcxCOJkUqTH/yu0fC8klZyLENdeTGFbga5vMwSbiyl+e/j34l6aFG04D2d0AdbW0t9W3VfoyxgmFlXROQLFLrdV+A7He+NZP7O14092JFYTq7AbEyQulwqvN1kvczaiaLO6dr8/Y5t6RRgu2R71HmRB9XgvbmLaVR+k1cgLlkJrqZlOCrNXucBZwMhkOZr9JHsZWKesPagu1hBtXEdaY5vcWCOYz9koVnjPFwVf4ZHcZnlBqg2e4bOW94fbNjDQ7msmKjR66/rImsBhsKqB5ler5nALQA5Dvji16GinA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(9686003)(55016003)(6506007)(66946007)(53546011)(66556008)(52536014)(8936002)(38100700002)(64756008)(66476007)(83380400001)(66446008)(26005)(166002)(186003)(19627405001)(38070700005)(122000001)(316002)(7696005)(76116006)(8676002)(4326008)(966005)(2906002)(71200400001)(33656002)(91956017)(6916009)(54906003)(86362001)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KZA378+Bkq1XpbscG+nqb+OkgUBvD80HYJ3TQNitG6Us32b3hEWN7J1pGy?=
 =?iso-8859-1?Q?F9WRVr5RfAKmDcPOGvnipvj5tqXSG6CuRcq2taXFkjGi4sFe7ItxPf24rW?=
 =?iso-8859-1?Q?SnvxAp0G/S7KhQNldiJ4vC3Ix2cHwIJookySWlUhCXe0W8+hIFmYMzK1gY?=
 =?iso-8859-1?Q?ibsQc/JCzVAB6JDVmpGPAdg6O8Rcs+wW4oFB7L3PhgqhNgj03ZhqR1W+x7?=
 =?iso-8859-1?Q?IPOUYFClFvp2aNJA2EpeZ+5pflBmzQG/hgIgb8g25l4ach91Wp2pUWGjju?=
 =?iso-8859-1?Q?PVXd5cHpqf0TFT+VNoPjTqOC7/n79kVMh9lo5iLLUO6/zzdXRNCmA+rFla?=
 =?iso-8859-1?Q?5Jf5XqZ0v+t+iC9tpPY5MnivX8/4ozEik3nHnsPZ7rf6fl+jk1cHEf3476?=
 =?iso-8859-1?Q?4sNU+MkhzrTyh6Px+dsMLPcbwhloGyoTKkJPZhkURC9SktH3CDafwz5ht7?=
 =?iso-8859-1?Q?BPDI6vBgecLNI6yjwJ5lKKZVFgN2RAkKse+7+CjekYs+O6vg3MdNGURUO+?=
 =?iso-8859-1?Q?CLAc3Hpw2JVKEEkvon/g0sfIPBYRMd1e1aVXz9sz6KPmJyiZstK9z7LI6f?=
 =?iso-8859-1?Q?rB1eUmcYbF8SeM3RKEzMGv6+341+mmTrYNkNO4aReHEFnFaWIgNaTZcFQJ?=
 =?iso-8859-1?Q?hc2Do6yqLUR3q0TmagPBb20GIrxFAnnpylPVThSY3jcFxWgbbyJzUyIpB9?=
 =?iso-8859-1?Q?EngsT0EjGBGL8sNjcGn3ezouDQ1alZPLlZBcTudgFEz95RII+o07zhkCJu?=
 =?iso-8859-1?Q?3kLNt0008jb18+Q5RPwqKqO6S9ykFw3g+ikyyalgt2TSUwJRET0gXFj44t?=
 =?iso-8859-1?Q?dEzHFKPA6a9uzQD3hDteqfW0M49N1oBeAQnWL8BhmSheoCytVcRWUlVRHf?=
 =?iso-8859-1?Q?+w94QAJwsTWoifE0TJhpKuQyD84GVM9ssYfIt9pYi3739heOU1zYhf8Tzv?=
 =?iso-8859-1?Q?wzbqcWDoqZAC0DM56ITLuiP46zgAqCzGAyrniYwLiQSEDi+dxBYM7Q4IyA?=
 =?iso-8859-1?Q?HZERub1mKohZ9h91NDU+FLzZMJlJ2Fw7OfAt32fPXVLmjYD99vxG2ZLy2D?=
 =?iso-8859-1?Q?tN32vhmpQuxIqjSsXsoWAv3U1PgnjwBoX3h8jWXfDWZHQmDraNIDzoMS8o?=
 =?iso-8859-1?Q?WLfPREvR8m10NQwKRSOOJJssmA9yx4fFHJ3iycBXRm4kLjjscWeHEzx852?=
 =?iso-8859-1?Q?HoVKnjJuzKU+MA5JhGRMChmltSDS2xLewjPBA0NjJP25OFphRhRRxKM9Ev?=
 =?iso-8859-1?Q?+UVlKj6uRL7ThsVE4cVLlAmNcfdO2TN13YBLdJrbh0Q2IXgjcR6uPt6LZL?=
 =?iso-8859-1?Q?wJ6FDQOTqPwzBtu2JpA5VQmP78uuvoe6snDaiBWKhioj2Q7+1yHQZO2HTF?=
 =?iso-8859-1?Q?kXyGQ65yyTGosDtftQ3jn8JnKjahdObksgi4CASBDzGlOOyhAZSgfaAQ/o?=
 =?iso-8859-1?Q?Sz3ESeN7QHEPFm9zvhF4D3jhismlgZDvB+qsaPUKSR2LqD/hp3o5KFu/Vs?=
 =?iso-8859-1?Q?Su26TDkc5fHKsKcXeNXk7VKHAXLEnrSiY8LXNC8hUE1TbbAa+G8xSrkVVE?=
 =?iso-8859-1?Q?MCmrW+OvfwULyF3b82F2ICsvCJzTCILIRlG536knJdLNDaQ7Z+Jpq1ARfW?=
 =?iso-8859-1?Q?JJcjeF250hIrRO09ktjIDrIuCYfW9kyn7jkTiPohrtQPnaAaVJl2OrLiCX?=
 =?iso-8859-1?Q?NTs4db9aXKUAsYmQBVEu5YQ01eqrx0LaeMRlAfDfGDY74Iyo3N9MQarOvS?=
 =?iso-8859-1?Q?tOI5y+YjRojYMRQy8GKbutWEL+ST47nmFVX519hmC514MXsq35UNMdQzgp?=
 =?iso-8859-1?Q?39EXP9IPNwRMeJi9HmqAGUypoYtUHL0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB25574BDFF88A33D9399205CF82D39SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61563160-c942-4e32-f4f0-08da3a22272b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 05:32:38.6681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xV/Y/X7pY8YFDe32so9KKC4Q0NtsJXwfo5NNmM/Vofx6ppTbpqyq6DwdVFQeQhxRTKxJjalMMAEO3aUZh/Htx/8AGEuw9COdzqPERKss0QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
X-Proofpoint-GUID: TFwQTjw8TYHTWVMIIz6h_YhWVNu9XFfA
X-Proofpoint-ORIG-GUID: 91hNFyiANuuvKeVpwPYXQBmEw4UHWgjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_01,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=974 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 05:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165916

--_000_SN6PR11MB25574BDFF88A33D9399205CF82D39SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Alex Kiernan <alex.kiernan@gmail.com>
Sent: Thursday, May 19, 2022 10:14 PM
To: Li, Changqing <Changqing.Li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>; Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] eudev: create static-nodes in init script

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Thu, May 19, 2022 at 9:57 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> dev in modules.devname should be populated in /dev on boot.  remove
> create static mode from udevd will make these devices cannot be
> populated. Since commit [1], when use sysVinit, devices like
> /dev/net/tun will not be created.
>
> more info:
> udevd in systemd also remove create static mode in udevd, but using
> service kmod-static-nodes.service and systemd-tmpfiles-setup-dev.service
> in systemd to create these node, so systemd works well.
>
> For sysV, parse kmod static-nodes and generate the device nodes in init
>
> [1] https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9cc47a=
8b895df6db77fb1537c6f1a39
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/udev/eudev/init      | 36 ++++++++++++++++++++++++++
>  meta/recipes-core/udev/eudev_3.2.11.bb |  2 ++
>  2 files changed, 38 insertions(+)
>
> diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/e=
udev/init
> index c60dbbf6d5..5c2fb4a9fb 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -23,6 +23,41 @@ kill_udevd () {
>      [ -n "$pid" ] && kill $pid
>  }
>
> +make_static_nodes () {
> +    [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
> +    [ -x @KMOD@ ] || return 0
> +
> +    kmod static-nodes --format=3Dtmpfiles --output=3D/proc/self/fd/1 |

Is that --output=3D... really needed?

add output since kmod output to /dev/stdout by default,but we run make_stat=
ic_nodes before udevd,
/dev/stdout is created by udevd.

Also if we're substituting for the full kmod path with @KMOD@ we should do =
the same here.
OK.

> +    while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
> +    case "${TTYPE}" in
> +    'd')
> +            test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
> +            ;;
> +
> +    'c!')
> +            if [ ! -c "${TPATH}" ]; then
> +                    old_ifs=3D"${IFS}"
> +                    IFS=3D:
> +                    set -- ${TARG}
> +                    IFS=3D"${old_ifs}"
> +                    mknod -m "${TMODE}" "${TPATH}" c "$@"
> +            fi
> +            ;;
> +
> +    *)
> +            echo ERROR
> +            exit 1

I don't know what the right answer is if you end up here - blundering
on regardless I guess is more typical behaviour for sysvinit, so just
use a better error message and don't exit?

Get this.

> +            ;;
> +    esac
> +    if [ "${TUSER}" !=3D "-" ]; then
> +            chown "${TUSER}" "${TPATH}"
> +    fi
> +    if [ "${TGROUP}" !=3D "-" ]; then
> +            chgrp "${TGROUP}" "${TPATH}"
> +    fi
> +    done
> +}
> +
>  case "$1" in
>    start)
>      export ACTION=3Dadd
> @@ -51,6 +86,7 @@ case "$1" in
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
>
> +    make_static_nodes
>      # trigger the sorted events
>      [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/h=
otplug
>      @UDEVD@ -d
> diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/u=
dev/eudev_3.2.11.bb
> index 841039f6d7..e4f78c2b0c 100644
> --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> @@ -41,6 +41,7 @@ do_install:append() {
>         install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>         sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/=
udev
> +       sed -i s%@KMOD@%${base_sbindir}/kmod% ${D}${sysconfdir}/init.d/ud=
ev
>
>         install -d ${D}${sysconfdir}/udev/rules.d
>         install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rul=
es.d/local.rules
> @@ -73,6 +74,7 @@ FILES:libudev =3D "${base_libdir}/libudev.so.*"
>  FILES:eudev-hwdb =3D "${sysconfdir}/udev/hwdb.d"
>
>  RDEPENDS:eudev-hwdb +=3D "eudev"
> +RDEPENDS:eudev +=3D "kmod"
>
>  RPROVIDES:${PN} =3D "hotplug udev"
>  RPROVIDES:eudev-hwdb +=3D "udev-hwdb"
> --
> 2.25.1
>


--
Alex Kiernan

--_000_SN6PR11MB25574BDFF88A33D9399205CF82D39SN6PR11MB2557namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Alex Kiernan &lt;al=
ex.kiernan@gmail.com&gt;<br>
<b>Sent:</b> Thursday, May 19, 2022 10:14 PM<br>
<b>To:</b> Li, Changqing &lt;Changqing.Li@windriver.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;; Richard Purdie &lt;richard.purdie@linuxfo=
undation.org&gt;<br>
<b>Subject:</b> Re: [PATCH] eudev: create static-nodes in init script</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Thu, May 19, 2022 at 9:57 AM &lt;changqing.li@windriver.com&gt; wrote:<b=
r>
&gt;<br>
&gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt;<br>
&gt; dev in modules.devname should be populated in /dev on boot.&nbsp; remo=
ve<br>
&gt; create static mode from udevd will make these devices cannot be<br>
&gt; populated. Since commit [1], when use sysVinit, devices like<br>
&gt; /dev/net/tun will not be created.<br>
&gt;<br>
&gt; more info:<br>
&gt; udevd in systemd also remove create static mode in udevd, but using<br=
>
&gt; service kmod-static-nodes.service and systemd-tmpfiles-setup-dev.servi=
ce<br>
&gt; in systemd to create these node, so systemd works well.<br>
&gt;<br>
&gt; For sysV, parse kmod static-nodes and generate the device nodes in ini=
t<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2=
b7abd5ec9cc47a8b895df6db77fb1537c6f1a39" data-auth=3D"NotApplicable">
https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9cc47a8b895d=
f6db77fb1537c6f1a39</a><br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/udev/eudev/init&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
| 36 ++++++++++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-core/udev/eudev_3.2.11.bb |&nbsp; 2 ++<br>
&gt;&nbsp; 2 files changed, 38 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/ude=
v/eudev/init<br>
&gt; index c60dbbf6d5..5c2fb4a9fb 100644<br>
&gt; --- a/meta/recipes-core/udev/eudev/init<br>
&gt; +++ b/meta/recipes-core/udev/eudev/init<br>
&gt; @@ -23,6 +23,41 @@ kill_udevd () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -n &quot;$pid&quot; ] &amp;&amp; kill =
$pid<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +make_static_nodes () {<br>
&gt; +&nbsp;&nbsp;&nbsp; [ -e /lib/modules/$(uname -r)/modules.devname ] ||=
 return 0<br>
&gt; +&nbsp;&nbsp;&nbsp; [ -x @KMOD@ ] || return 0<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; kmod static-nodes --format=3Dtmpfiles --output=3D/=
proc/self/fd/1 |<br>
<br>
Is that --output=3D... really needed?&nbsp; &nbsp;</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">add output since kmod output to /de=
v/stdout&nbsp;<span style=3D"color: rgb(0, 0, 0); background-color: rgb(255=
, 255, 255); display: inline !important;">by default,</span>but we run&nbsp=
;<span style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); =
display: inline !important;">make_static_nodes
 before udevd,</span></div>
<div class=3D"PlainText elementToProof"><span style=3D"color: rgb(0, 0, 0);=
 background-color: rgb(255, 255, 255); display: inline !important;"><span s=
tyle=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); display:=
 inline !important;">/dev/stdout is created
 by udevd.&nbsp;</span><br>
</span></div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Also if we're substituting for the =
full kmod path with @KMOD@ we should do the same here.</div>
<div class=3D"PlainText elementToProof">OK.&nbsp;&nbsp;</div>
<div class=3D"PlainText elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp; while read TTYPE TPATH TMODE TUSER TGROUP TAGE TAR=
G; do<br>
&gt; +&nbsp;&nbsp;&nbsp; case &quot;${TTYPE}&quot; in<br>
&gt; +&nbsp;&nbsp;&nbsp; 'd')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; te=
st -d &quot;${TPATH}&quot; || mkdir -p -m &quot;${TMODE}&quot; &quot;${TPAT=
H}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;=
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; 'c!')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 [ ! -c &quot;${TPATH}&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_ifs=3D&quot;${IFS}&quot;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IFS=3D:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set -- ${TARG}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IFS=3D&quot;${old_ifs}&quot;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mknod -m &quot;${TMODE}&quot;=
 &quot;${TPATH}&quot; c &quot;$@&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;=
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; *)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ec=
ho ERROR<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ex=
it 1<br>
<br>
I don't know what the right answer is if you end up here - blundering<br>
on regardless I guess is more typical behaviour for sysvinit, so just<br>
use a better error message and don't exit?</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Get this.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; esac<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ &quot;${TUSER}&quot; !=3D &quot;-&quot; ]; th=
en<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ch=
own &quot;${TUSER}&quot; &quot;${TPATH}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ &quot;${TGROUP}&quot; !=3D &quot;-&quot; ]; t=
hen<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ch=
grp &quot;${TGROUP}&quot; &quot;${TPATH}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp; done<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; case &quot;$1&quot; in<br>
&gt;&nbsp;&nbsp;&nbsp; start)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export ACTION=3Dadd<br>
&gt; @@ -51,6 +86,7 @@ case &quot;$1&quot; in<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # make_extra_nodes<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kill_udevd &gt; &quot;/dev/null&quot; 2&=
gt;&amp;1<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp; make_static_nodes<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # trigger the sorted events<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -e /proc/sys/kernel/hotplug ] &amp;&am=
p; printf '\0\n' &gt;/proc/sys/kernel/hotplug<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @UDEVD@ -d<br>
&gt; diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-cor=
e/udev/eudev_3.2.11.bb<br>
&gt; index 841039f6d7..e4f78c2b0c 100644<br>
&gt; --- a/meta/recipes-core/udev/eudev_3.2.11.bb<br>
&gt; +++ b/meta/recipes-core/udev/eudev_3.2.11.bb<br>
&gt; @@ -41,6 +41,7 @@ do_install:append() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${sysco=
nfdir}/init.d<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${WORK=
DIR}/init ${D}${sysconfdir}/init.d/udev<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i s%@UDEVD@%${bas=
e_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i s%@KMOD@%${base_sbindir}/=
kmod% ${D}${sysconfdir}/init.d/udev<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${sysco=
nfdir}/udev/rules.d<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${WORK=
DIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules<br>
&gt; @@ -73,6 +74,7 @@ FILES:libudev =3D &quot;${base_libdir}/libudev.so.*&=
quot;<br>
&gt;&nbsp; FILES:eudev-hwdb =3D &quot;${sysconfdir}/udev/hwdb.d&quot;<br>
&gt;<br>
&gt;&nbsp; RDEPENDS:eudev-hwdb +=3D &quot;eudev&quot;<br>
&gt; +RDEPENDS:eudev +=3D &quot;kmod&quot;<br>
&gt;<br>
&gt;&nbsp; RPROVIDES:${PN} =3D &quot;hotplug udev&quot;<br>
&gt;&nbsp; RPROVIDES:eudev-hwdb +=3D &quot;udev-hwdb&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
<br>
--<br>
Alex Kiernan<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB25574BDFF88A33D9399205CF82D39SN6PR11MB2557namp_--

