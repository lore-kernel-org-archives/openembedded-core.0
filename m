Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE861C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 05:24:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3418.1668576239192948051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 21:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FXBzWNef;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=831974c6ea=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AG5Dsxm013029
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=FJMK0IsjQH+xQeMGzfb54rtnm3HJnbJJZxRXGQYF0c8=;
 b=FXBzWNeftcQLe1xkVDklQhOJNKWwnQg1tWGhUbA6pMfYFuNiGLon/g4RkKmCkJXfh02v
 EPeDrl5hDbT1yzrWwDw8oY8tngTkPjM4TZd7DMkrivF/iLZBD+8CWuNN0zUi1WBFXN4O
 JxUkju+PAHo676CCcULsNL6J5p+reXLyOEHVsjYAIqAGBlpoNclAxRA9sc78ylufV1Jm
 6tlYV15GomPZapTZeWf5Zs3hcQft7LjAnz6TAVmddbfqYLscwcKst0WVLD4xv7hhH9NB
 DJCObN5i/12dlYT9nbK6eAtvvWYzTyT9Bthjp5YtQc3AUZkNlaJSJ85nKdV4yYFC8oNU LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2fab2t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:23:58 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AG5MqLE032134
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:23:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2fab2t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 05:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3ntOklHSR9LRvlJV5S26grlkb8Qn3c4mV3SEPR5egbqjJ8yZSCj0JjuSCzPuXREMrLu6RvgywP0ZuUNH4KCpqdK32LQvM2nE9IhUJFjPqcRBKS8NIkj5wThcy3XtGl0WLmMkKTxQQj5hZLN5kyxZk3E0QlIP2jG8s3n3wtOjySDsej73mYzYyjW4l1Om+kSGRK4J1gDJklS20NyHqQKBDeE5Fh8zIG8p7Lhb/PZMyE2MDy3vBZfD7jOMypn7H1FnonCJMDKx6R5S6Py1ulQjfItaQtCkBP5KML4gN/z1Eaj38mIM9DN2LXl7it80TvvFiBQuq5JO2Wwc3P7TcxfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJMK0IsjQH+xQeMGzfb54rtnm3HJnbJJZxRXGQYF0c8=;
 b=i3ZXXZkisJKlyomy6S9aDAQEeAFtp6HSg3w1nSra451paWF7jEiGXitSwMF30rnO2SCzEtUt5f8VWmLH9hey2G7aXUJQ3S2SZXlwfSJ7/V1MXJrsjQSf0sE53A88rXvfwLeei+7i3omgu8eX0tp8D2/HaA2UMKZNBW30a0JyEm3vgPH0eqSySpzsTvvFGuqdr0SG/vT9s2nNlQV/zPjEzQ58P0aMHcvslQATWkheJDTcXchwdLo4wZ7Rgg1+1kjrkgLjovsTcz6NAY1blmWREvJOpA4zfttlSPPT4i1PxYZ0hUiFJAiF5GS+etEEpe/zFxVXSkAy5j52sK2f0Rf4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 05:23:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 05:23:54 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] resolvconf: make it work
Thread-Topic: [OE-core][PATCH] resolvconf: make it work
Thread-Index: AQHY+PiS8x1U+XLla0m/kvRE5YIDGq5AcrIAgACSeBA=
Date: Wed, 16 Nov 2022 05:23:54 +0000
Message-ID: 
 <CO6PR11MB560289B3996392BA0995F49BED079@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221115134531.34920-1-Qi.Chen@windriver.com>
 <Y3P48Cty8ArRrIkY@mail.local>
In-Reply-To: <Y3P48Cty8ArRrIkY@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MW4PR11MB7032:EE_
x-ms-office365-filtering-correlation-id: 6cfe26aa-a579-4be7-3309-08dac792c142
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bxDbHTCDVvjJd0tYjsQWsdGI+nIybP+8Td2TTT2VBfi0JilDkMTYOviJAJYpbWNvEEwXfY3OS9jVDgABBc/Im+xnCsQyd7m5EZvHi9GtaoKQQ9LIZoHl2WBN8roxVT7p5anqL+MIBNgUWYevEAyMgroKGiM0Zi+2ig9KTIcqBcZ+CAbONyBini2b19N1V9qYSZnFO/F+C0/y8WO/tDEESgBbXiLXh3YL+CkWhH6xYE+JlOY7tXQGz4JEryW1xgNBnXzmPE2GTAOGz1JKoNGax8dxIwSEIS1xfPZWqiQwmGb4bJU79utWE9Iam0hmGJvliv+d/ffsMqxQXA1535tY2VsvjH5eFm4Y1hG1gOaeyIDAzXo3MgxnBjUnyOkXVRAt8sa7O+ohfsOM8Bp1LLehrR6oYE5e0H8lyBpsKmyxoCOCYp+pfM3GlBa+9yiBdYJv7sYLP9bYXe1WVW7p2ba9y4OlJUXa4Xrk92LNvY1Kbg/+dK/xxlO58uXP4UpAn9JXxguHKuCkd5jg5XM82UVaO2QWdGznmfODRfxteK32sNBo7uylI75Jd4UIOV1UL+DjAJ16LP1b6l7CU8vRpGeADr3H3GS5S4eo7FDpUhm3QEw3ow9Jj/QgWVfgOfENcaHvthhXZF5G8d4QIL0bkU++t18kFEr7W54n+YzW2zi9mZoHn+R1uhH0yfobHdJfDElIMUhfBei/ldLPoiU27bHQ23uAXGEZiMIkDOFtssH9qZYw4oIf8qpyIy+nIhQkIxC8Bd/9ZuCO/021KPx6Pdb3ltXwEHsrGUu/9bxZoXfG2O8iA+0vvezLk393lqCR3JU44Y630HGUo4AIRpwebmYWOS+D7en0HRawEBOlmArbaY4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199015)(7696005)(66899015)(478600001)(2906002)(9686003)(71200400001)(53546011)(55236004)(6506007)(966005)(26005)(186003)(8676002)(4326008)(66946007)(66446008)(64756008)(66556008)(76116006)(66476007)(122000001)(316002)(5660300002)(6916009)(41300700001)(52536014)(8936002)(83380400001)(33656002)(86362001)(55016003)(38070700005)(38100700002)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Y4pj8czUGSaRgO7yESJWcKBQJmfWLScw8caokF7jP/3Ev0QIOFny2gGENjli?=
 =?us-ascii?Q?pA6XRnb93zDFJjE+f0AEXA1z9KKEgae2V1IiInneHzPQThj6O7Aj0ULfdNAb?=
 =?us-ascii?Q?Zb9tdq+kinT95CYSr0K6gmhB3Y7NdwqeX1ecM4dqI9odKFuYyAYcFRpSSJdZ?=
 =?us-ascii?Q?kUBYHeRo41doYjIjSKpLCZn3wpLdocHu6bnNV5O5TshvuOEEKehDcncGYvO7?=
 =?us-ascii?Q?R6IFsmzfT0AajyJiIRAPNa4Ha5URjVCdqisJjvGLRIvkQB4KqP4t4JkDASRZ?=
 =?us-ascii?Q?A30XUR+YEQVXYYm28gY46IbOlNhitW9tQ6rLH2UTfhXeJJKO7xu1HQIYcAbk?=
 =?us-ascii?Q?rsNGCs8ud8MDPxa02xp3B8IWQM4aqoXq9rrODOR6b15jyt/4btf0s30D8EQ1?=
 =?us-ascii?Q?m6+lwt/I1bmJNB3PvNuJx0a2k7oy3zZAQL2NnbvK+munGGrYF6/RMnJsv/q0?=
 =?us-ascii?Q?4FnIyMMJ+o7u650wQNttSVLVKE/9PPGCx7Pq0Jwbuo0mf1HGanvCUUBN7ZUE?=
 =?us-ascii?Q?L9Z3avR7fg1NXfKLZHbgjsMCE8Yo+DvIpeeclyTL655S8wqHP4swr2FTtr9f?=
 =?us-ascii?Q?zlevsrVuxWb0TE698cS+JsJS+0w+R5BVLUXng/Rv36YM+mE/3toSQBiJ7fi4?=
 =?us-ascii?Q?fgsB0a4slPhhfSUM+i1MokIvwaNTooZ54Nl3LZ2wKpulOzXwqNgHCUub4uce?=
 =?us-ascii?Q?GnOPImJsmLqC7kiIUsbQ1FMz7eHYKzmoBBicg5IIubNONk+ZOWHM7h2X4rEL?=
 =?us-ascii?Q?7PAVDpOcd2BmDtC4TfdFqTqKnilvBg3yqPsuDunCznzHspTyIH86J2+UsHbW?=
 =?us-ascii?Q?6uZvGdQZgyc6NRh7Q99VZDIGbropn0pjDVHcmIPKQKcqPFDdiEtSj6tgqRl9?=
 =?us-ascii?Q?WXZiLSl0Z7J8xc4Qfhg+j+NdHbQVP9/IGgesP1hMoBjem6LELWSszfXKhSaY?=
 =?us-ascii?Q?SICjtW+HelVRFSnCRplHSgAMODxUjZXIpV8V/RQ/g1mHK5wPwYOKQimTp9VP?=
 =?us-ascii?Q?ksTUwBvv3KNo1sCle6KoKnSRtrGr9T31QNMxRO/fkZoeXUUVoJKmerrTPMqe?=
 =?us-ascii?Q?TZlVKQbkrfBNOGocfmByn0MirmMGo/IsvtB7ExjDHoTxr8sPfLaJtVHmvv4n?=
 =?us-ascii?Q?d9FPG1nRLIJRoWlgmpXnLu04v2bFgKHKKByNO0YMHrb7dp4/copFA61egZDa?=
 =?us-ascii?Q?udyqkg0eJehbCBzbZV1K6iTZ8+7rPjVeh1Qnz6xek74dHbD17AUmIHfs26F0?=
 =?us-ascii?Q?IidCYyH/QKJ2PkDvNImsrRCq6e7A3f/qi/3NDb8GzEEMWeWMcGAOvH+Ne2XW?=
 =?us-ascii?Q?hE1VFOA2uglYQq0nWW7Wk7uyj0xFWeCz1OFKkPMSt+0cpMtO9U0ozNnb+NGQ?=
 =?us-ascii?Q?sL/jDiy/ZaxWDFHOpIHR2ZjjaoUOIIaQ9XeYBepp221QkLfdiLUwqeRMjY4O?=
 =?us-ascii?Q?8uSi1QoKLzV9i1H8WUKdExhuhHeVrCaZP7a/mRJHeuas9mf2ftTueF9KG6AU?=
 =?us-ascii?Q?meP5JSJp7U+p7sUwV+rzBP9RM38MlepnKeG/yH1jKqC+jReScwU+bjJKIeyA?=
 =?us-ascii?Q?HSCLhAHgYOmHuTgNj/51ITQGVp6YA8wOxMzppREm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfe26aa-a579-4be7-3309-08dac792c142
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 05:23:54.7215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KoEgLY1Q1PMYGYb69FLpNtJSZjLNwRyt25NwhyQYb9GeCdG/5yEI9yPRhASWAFa+vym6nd4SKOeSua5TZytQ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
X-Proofpoint-ORIG-GUID: gzlUpem2PIJIy_PWjPYisjKkaxc-wanT
X-Proofpoint-GUID: iyO1vfLyGN3YgK_lFfPW20mB_UwZa3ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173378

Got it. It seems that after adding those RDEPENDS, resolvconf cannot remain=
 as allarch.
I'll send out V2.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Wednesday, November 16, 2022 4:39 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] resolvconf: make it work

Hello,

This fails sstatetests.SStateTests.test_sstate_allarch_samesigs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4409/step=
s/14/logs/stdio

-  'resolvconf/do_package_qa': 'a309bf7fd05364ea8b524a605246f7929768bca1857=
13f913df0f3f1e5f1ce55',
-  'resolvconf/do_package_write_rpm': '1e136a6121876927c84587c8ec80794359ad=
998e09048c77e7d363ba756d41f0',
+  'resolvconf/do_package_qa':=20
+ '7bc9828812907356dc4e1fe5df96af30e195a99e54745e2a5ea96d24974b0142',
+  'resolvconf/do_package_write_rpm':=20
+ '7eeaacc3b706560a0bd9e889a661be05eef25250aff8c82891b7c70f09de7451',


On 15/11/2022 21:45:31+0800, Chen Qi wrote:
> The current resolvconf does not work. Make it work with the following=20
> changes.
> 1. Install normalize-resolvconf, which is used by resolvconf.
> 2. Add dependencies sed, coreutils, util-linux-flock.
>    util-linux-flock is needed by our busybox does not support '-w'
>    by default. coreutils is needed by the busybox's readlink does
>    not support '-m'. sed is needed because we want to avoid package
>    QA issue complaining sed is needed by no one provides it.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb=20
> b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> index 94fd2c1a70..3bf5ec6c32 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
>  AUTHOR =3D "Thomas Hood"
>  HOMEPAGE =3D "http://packages.debian.org/resolvconf"
> -RDEPENDS:${PN} =3D "bash"
> +RDEPENDS:${PN} =3D "bash sed coreutils util-linux-flock"
> =20
>  SRC_URI =3D "git://salsa.debian.org/debian/resolvconf.git;protocol=3Dhtt=
ps;branch=3Dunstable \
>             file://99_resolvconf \
> @@ -39,12 +39,14 @@ do_install () {
>  	fi
>  	install -d ${D}${base_libdir}/${BPN}
>  	install -d ${D}${sysconfdir}/${BPN}
> +	install -d ${D}${nonarch_base_libdir}/${BPN}
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>  	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>  	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>  	cp -pPR etc/resolvconf ${D}${sysconfdir}/
>  	chown -R root:root ${D}${sysconfdir}/
>  	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
> +	install -m 0755 bin/normalize-resolvconf=20
> +${D}${nonarch_base_libdir}/${BPN}
>  	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>  	install -d ${D}/${sysconfdir}/network/if-up.d
>  	install -m 0755 debian/resolvconf.000resolvconf.if-up=20
> ${D}/${sysconfdir}/network/if-up.d/000resolvconf
> @@ -64,4 +66,4 @@ pkg_postinst:${PN} () {
>  	fi
>  }
> =20
> -FILES:${PN} +=3D "${base_libdir}/${BPN}"
> +FILES:${PN} +=3D "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
> --
> 2.17.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173345): https://lists.openembedded.org/g/openembedde=
d-core/message/173345
> Mute This Topic: https://lists.openembedded.org/mt/95042786/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

