Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E64AC77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 12:52:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28272.1685278326668875857
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 05:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aUwNEDsI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55120cdcbe=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34SCop1S017490
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 05:52:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=PlL4ALsWi19He6wzSdqdnznLq8HRh43CK3PA6UOtuyM=;
 b=aUwNEDsI5o2m3WBhGI6dXM4mskH1bk6ar+p64R3eZbSp3h3rlDzcno0mjgpVzm9cFzLZ
 ufqScH1qqPbtFKtNfbbL3fO1VS12QhvhSqw5yZ/OPhweXblmhaUOhhAjz1tOPjeLqyW9
 1rbPI/3nKmds0CyuTbe8pj4R0KDYca+Sr43WgrFkljifWvT1ZCGZ8w0lR5gvkFNC8Z4b
 a51GZFsE8+lXvYB6Kjl8l1ILR3rVAIkX4bPKHMn/XAF3jadRK4YmxsdtHetq2RnZhlS2
 aDujTWiAxrIkx7938j4D+1RowLnmANfUiK+voy7qlHgClJ8tZQ0qOFEdtWuqV3IxSQTl 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcj8pr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 05:52:06 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34SCq50i018914
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 05:52:05 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcj8pr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 May 2023 05:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/vhr8qNPoUWhWviQ9y8sek16gZLP9eH8ROVNfwI2FN8u3fw90EahFpsgae7H5ybNj4Bs1gZEnu2D/E1Uv38mzLjFWRiit8GHCXgitE95lgvjV/hFKtKK2LkRfxCkGd+4NAGXTLhs/5HWMCl0mig6EDVX6H/JvUS27mgKnpvvy/pdCjczdKiAEuzN/VSqic7a6IG9Y/L534zWCMrr4ww6VDLBNGvfcb06Lupj2ZEjL07bqelmSUYYPhK64Kg00+p4pHUxMiD4UpW4eIY2VDd35NbBFwRIIhOWVBaeFBpjZHuklWRTAhwq6wLX2Um5Bf35JW9HjR3U7L50RKgthxrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlL4ALsWi19He6wzSdqdnznLq8HRh43CK3PA6UOtuyM=;
 b=jkHBDnWTJikGP6qAVhnUEqYT/+Mb9JdwzVi3vBQ0YXy/4VnfN1H2531Q0/7T7ap+HtcLiAg8I4S38WQCnRGfPywkQ+b/jd50DEAPE15o1EX4BOpPCxlCY5e4FQ0etMflrVvEepXpc6Q8k2tYRy2gjhq/NqyK2Mmm5dO5EP5W9TYRraMyXxqn82w2jamm4Hsab4KJEp91LAKYkIbDSRd8acLQTCHxgb6xyeqTjMuxqVnGe9t9rad+DgwrUXeo75wSENXlrg0U5GAmp8oXuvsCy3PSBf14ARfWEmxMU8+3VtnQI7rv1HHI94spGFzwKqEodzZRHSQBErW6cOJ6VXbz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Sun, 28 May
 2023 12:52:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6433.022; Sun, 28 May 2023
 12:52:01 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "schitrod@cisco.com" <schitrod@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
Subject: RE: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Topic: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Index: AQHZkTBOVmroIWwMLUm3v6XydG2/ca9vQcwggABgykA=
Date: Sun, 28 May 2023 12:52:00 +0000
Message-ID: 
 <CO6PR11MB5602E50D7AEA18519A55F239ED459@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <17633BD1C0C1B26D.6918@lists.openembedded.org>
 <SJ0PR11MB6717FDF0FA29DCBA25329983DC459@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: 
 <SJ0PR11MB6717FDF0FA29DCBA25329983DC459@SJ0PR11MB6717.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB6067:EE_
x-ms-office365-filtering-correlation-id: a63af54a-0ec4-49b3-a2be-08db5f7a547d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OkiaBEnKNjHPUbJaabTHdG+cCM2UH780Lz6h+9L5x8u0URHDNyALIJgQmUU/RMxhjYZ+85AFTPR6y+D8JmMoBXBjjJqpYQSxZ7UDQqt0rAnO5VI9AQDpi1t4gBKcoSaKtcYas9Onx+gpCL/sLOq0pbFjy5vZpS6ozKR7kDCYftqM198ZFaXED6EIisMOgf8u6B1OaBCHcGaWTaZV0ZrdWSd2vKPF10Srku4RKVLA/R5etQ0+v3yoC6Psis2dPZHINd0LrLw9I66lDNPdRkaPX6KrYwhhsap1/ZfeIAVgBr+UvE1ndqgAs7/ZINx6q4UOSOM4jznKb5aaZcq4kTXFvY4PbxBY8SK2wyEAJoiIHvT90jOGtWSwHTcuvn9ChEHwkGB8b9exMz4xiraEiJsi+7G144Y7lnBG+hKNMzoeIfxxd3/iqQGvUyxQzHu3CuIlDIW+ESXTECQi0STgmi8O9bmQaPngCFk8QfgcdX0z9a9cUZJsLYWGzmedfAv4+ZdQPueD5csJW9axqduX6ykrcfD+7J/Sq3QTx2cV9cQcrjkQ6/v1oNxASln7eCUQOz22kJJyBOg6pZwFtNVUQvTZaOjRCNZMItd3tgAVDnXgnpQ1qLDw8yfwvIJBSu0Z/oz+YlawsmBeJdhWvoKX87OhLQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39830400003)(396003)(366004)(451199021)(83380400001)(33656002)(71200400001)(5660300002)(316002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(52536014)(966005)(122000001)(8676002)(8936002)(41300700001)(38100700002)(7696005)(86362001)(55016003)(110136005)(2906002)(6506007)(38070700005)(9686003)(186003)(15650500001)(478600001)(66899021)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9JPSl29l7U+7c6lOTx2j0oU6pzEk8LgXUIZ5pB5Q0ayrByEWTCnoreldUuR1?=
 =?us-ascii?Q?ukx71+QtKfQFNjxbGw5cSem000UsU/f4RB41jGPI1MtDGvHuP6R0hcHp4c5i?=
 =?us-ascii?Q?3g5ML9sy30ErmXBGyU5iIWE0pWzsGW6uxYbJ+y2QsVhACGA0i7vQ5DzAcwG7?=
 =?us-ascii?Q?MG/vY/1ZigU0b92KoTb8jyJW1N//bpv29ISQq3HWoqneUUDF6O9/3QyjNjy+?=
 =?us-ascii?Q?rWnbZaGmriapu+s/+dqQRD55GtkKQaDN9hYFp2cdbymaTOjcZlOpw58hiK/c?=
 =?us-ascii?Q?OHaZNVD0x2NtwjlLsvLoBtcTvAkfwLeDEGPn95HsaxBgb/7rVTgPfpilA+Ir?=
 =?us-ascii?Q?IvVjxbn0xBQssJLQrqMYDBCM4Sb7pR1GI1Awpws2XuOjp+3QXTse2fMekNCQ?=
 =?us-ascii?Q?M6BX/LskXBAL4R5CUYF6GbxZWoLDogEADMo7NmQt3rjF4rbz2RDGS4/T6LC8?=
 =?us-ascii?Q?w4g+9gqfgU8FhDmc8rVRYjdSfMqPdughy3ji0pL9+7J+BwigUAg72ZJ5LNhV?=
 =?us-ascii?Q?c1SQiZGYFBNvNAra4h15/112hijyWHmykT/zDSltj9fFrU+Bdbcy6oHpv8ld?=
 =?us-ascii?Q?CZ1yzdjBfAqNEeZMlNS0YzmDByyozTUI2itkS6rIlCglQAvPVVK0Uy4Xcs1U?=
 =?us-ascii?Q?JcSUx7akUjvFF/MRtK45jvEk1Qp4BXw7IIXtQ/quyI8XhDea4n+++tlSelc1?=
 =?us-ascii?Q?JD5Na7QDOkz8J0msyCN8g8210ujYaqIzO74kKOT80rfYIkK9DNqVg0Dm+ETf?=
 =?us-ascii?Q?ct9/JokBw7q26d27stB08SYHC/nhCiK8x917MWOblWhMdpz3AgNHuhU08viY?=
 =?us-ascii?Q?p8TL8KnKLxL7FrKz1dM3H0TRbnGJqH5+G8jTXPRSCwJ9oSlOHAhYk19R7a2E?=
 =?us-ascii?Q?Ui+Lq7Wpr22ZEQM/fjkKuDiCIfJetpn3bREleeEJbrEhMsUYhqZBURK23odw?=
 =?us-ascii?Q?WB6YDz0SNniMrBqelAnbtAigaOrqvIK2Xh9vZfzNargVXmKKtyQkLp350tG6?=
 =?us-ascii?Q?M2l2KylJwAYpveWmtiyHHxkgpyuyq4rnSdVtEdYMsaf3AkH0MEbdnQ/x0IOi?=
 =?us-ascii?Q?SAgDF5jXd4tPHzDmM3+aWR6qdE6UHWx4FQ10N4DrcHgr0fmIzNtbvbJQfB9z?=
 =?us-ascii?Q?WXL7il+LnKXM7gvn/+KiJkQKYja8mPIGdgDwsS0XH3K1FOgmCIG8s3KZdoNR?=
 =?us-ascii?Q?+MyDHd62x2VW6Ax9wiaMs47xw3OeyCBka5BjRFmcTG5VqmaCJLle4Ohu7+Ch?=
 =?us-ascii?Q?wl+MHBCgXLpyjigb1NXwDsgvWqOfOPCUytHVHwxTapwK4gyCcRjbWJZlj85p?=
 =?us-ascii?Q?VzHlF/7IBanVlaemmztuj4JHKaLAR+E0HMgnqzs6w+5Ildl23fuXT2OKfJAw?=
 =?us-ascii?Q?tuJArIYoPj3Ko6tPWV03ZOBC04Hd1uKkqTEbhHZQfnd4jHsc88emm1uBJT2g?=
 =?us-ascii?Q?UhH7pY0SZl1jmuJg9mwY+mI9zMHrH4Sp7J4xXFEGoIxWuJ56KXsELMB3QrPH?=
 =?us-ascii?Q?onjlNUGXq5C42AMQ9rogHrtKXgcC/8vG5JF+xtjB4bh5oGQokh7oXV9CpEy2?=
 =?us-ascii?Q?gelzTSHk14S4Vpiw2hCyemu2rl14R1o9ECybGsyw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63af54a-0ec4-49b3-a2be-08db5f7a547d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2023 12:52:01.0784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XElJjJOapUgLtfiEkiYaDsPXq8FvaEH7UaLVs/tTIo5fyacspxy9ZVVQGvnoDcb9uRsVmPj0m4ntJ3WPpbEXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
X-Proofpoint-GUID: PHL7oNN7Qi87gu5tAyfiChvthbAVBHO_
X-Proofpoint-ORIG-GUID: Fv8L3smD90niSgN1ztNef2gXS5XvbNCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-28_09,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305280110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 12:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181818

Thanks for the patch. I did check the NVD database before I sent out the pa=
tch. But when I checked it just now, I can see that there's really no 'sqli=
te3' for this recipe. All 'sqlite3' refer to the node js package.

Acked-by: Chen Qi <Qi.Chen@windriver.com>

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Sunday, May 28, 2023 3:10 PM
To: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; openembedded-core@lists.openembedded.org; alexandre=
.belloni@bootlin.com
Subject: Re: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

Hi Alex,

It looks that due to https://github.com/openembedded/openembedded-core/comm=
it/8800976e79d65956218ab462d9644d0661579301 commit.

"CVE-2022-21227: sqlite3-native:sqlite3 https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2022-21227 " is wrongly reported on master branch:
https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master=
.txt

Ideally CVE-2022-21227 CVE is applicable to https://github.com/TryGhost/nod=
e-sqlite3 which is " SQLite3 bindings for Node.js".
"https://github.com/sqlite/sqlite" is "Official Git mirror of the SQLite so=
urce tree".

Please review the case and share your comment.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Sunday, May 28, 2023 12:18 PM
To: openembedded-core@lists.openembedded.org; Sanjaykumar kantibhai Chitrod=
a -X (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com>
Subject: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

This reverts commit 8800976e79d65956218ab462d9644d0661579301.

As per NVD database "ghost:sqlite3" product is specific to "node.js"
CVEs reported against above products are not applicable to us.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
index c246d42fdf..9a0de08553 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,7 +18,7 @@ S =3D "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
=20
-CVE_PRODUCT =3D "sqlite sqlite3"
+CVE_PRODUCT =3D "sqlite"
=20
 inherit autotools pkgconfig siteinfo
=20
--=20
2.35.6


