Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB7C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 08:25:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.7167.1644913513841613565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iHPkoXjL;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90455372e3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21F7TWr6014160
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:25:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=wcN0ATfQi9dwnin8EuFuDH/XIqUqWx8vnBpmYyIGTjI=;
 b=iHPkoXjLseSCi3nXAOHNmlHOVeOpbmTyRu+qdkqmaECugcOBDJNyxL3TBhkX9IGe1P0L
 a8F9snFaSD8kGRLj45oeTt8J3/RslSAjAP8H5fsZ2Y3Q/FPlAkhGvppHAacyWqYt4ZfT
 og/2QiH6+vTv+WP8u995CGICOWRMp5oKR5Gi2kuxkMkvwKyvWoJfao7Tf77dKJcYZxPb
 UyI0DZAs0cV1olI8JNuIV4Qo1MtJiRXq4X/oZ8utKD+PGuuq3QBZ+jWwf//nCFo2siFN
 HE1x88vXojZliQThZS4TryVtpydXwqrr2lIvbV2s8Egq7duYh//sDR2UAKozL8JYAjLv ag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e83j4g5tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:25:13 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21F8KoGD023500
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:25:12 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e83j4g5tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Feb 2022 00:25:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8eltRdDo2+9P/Aqn0Rm32lu1tO35yMRllu//61MMrWiMiV/OZ6C/0UjB1hNJCEHd4jPsXrkhTk0NEMTqmM84Wnw5IxMbGBy5uoc/sce198OePAdnhf68QHm5fmbmm6mCPNMO8uM7IEoP4YluAiFdgRlBHBnfY9+9Ypo4TldfBWqlc+7Xh9su/2MTGH4tIKGQilzrfoNC22O3yyZT6YizNeJiDx/3x6s6jFu11+hCbI3FGO/gICVdE+Yqjf5jhdF59TC7VXqL0Fa8o2QMDdofwzCT6S58CGp3FlZywaEzskdhFdVsnKkVgotIP6tudgHXrLxL9TwpsaR6wBKPsQb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcN0ATfQi9dwnin8EuFuDH/XIqUqWx8vnBpmYyIGTjI=;
 b=Yu+J5s+x2UIkf6ufZHD/im0gRl3KViVl0WaOfQdowdhdBF396805f4UKXfm/rRfCR+ZbgPdrq9wJ/6Klh0z+PzElyrsUGZ642VEe93uL8Ejc02a9AuhuCVgH1cSTH2iH1XqzRph/K9NkY2/ZglI12egANVhxdh9XFvYkUfwRxldpYfO6RSFyd7Yy0Ho4HbnOPJIkSSW4V87u4B32bspLweJNflpkWtrwNmVvREPlXpWNr2aCcFNM7tDNF5ITC+13w8xEo6Z2U9HvVgbZjReYdRMX6vOL1vJdsPe3tUdgplt2HlPItMZ86gAOA/TcLQ/l7RpGg12h+vXDfNi/r0RPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by SN6PR11MB3501.namprd11.prod.outlook.com (2603:10b6:805:d4::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 15 Feb
 2022 08:25:10 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::59bf:ead2:b7e4:5029]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::59bf:ead2:b7e4:5029%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:25:09 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
Thread-Topic: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
Thread-Index: AQHYIkUW+qDwoj3CG0iJ/4xu/tDcHQ==
Date: Tue, 15 Feb 2022 08:25:09 +0000
Message-ID: <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
In-Reply-To: <20220208225310.1685131-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MW3PR11MB4633.namprd11.prod.outlook.com
 (15.20.4975.019)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
suggested_attachment_session_id: 737686f8-ae6c-3f2f-2985-6993c29db2f3
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed12acb-006a-4f1c-aaa0-08d9f05cae23
x-ms-traffictypediagnostic: SN6PR11MB3501:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB35016FFE4EA1E395755428D794349@SN6PR11MB3501.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xiw6SO7UIaZ2Tdfx+owR9Oeq9jAM2ficSClHMtJOBtZJxi0OnGvLyLH0MH+MZg9yWTqnX0DFbbSmSELSMwOHx6vuq3Ami1TzttGF4UHCUS/ANuKA2TcTOzVxwNkOxmkV/ZsJ/EUVasVtV3V4hLivT5t5EYsVJ7LjRXGAVnBXccj4ckCCCBqXrQkBE0QNWpRTKKQJuH3s+zmO5AmZs0+EfPZm8FCFBsxpqNcVbeB62bikZOf02F2++F9IvZdqDgdfyu6aPhsGkQZIKEIUVrMgJF/68nb3keOdgW/njSncuUKYk96OmmR+v9wqQr729lYWxhnQnhXbYXNE4P2DwlB9vs0hrN+b8c5aCY8PdmDpVkVrHfuTsVqyYEbs9Plkjo/a2tK4Z1FbNPOFfILs7yZSemuK1SB9yYH9ElWmMB9PXg+6bxri5lEAObuwJyyNhRsuKKnSVtmfQQPsmHLkii08l43ehr8TP0RVCBoRjQBGbkkP+scp+LuRBDZDBs8MQAOJVhViscBT1yZgDkDv8gELHTl8IS+MgSNMI75M4LY3lgx79w4rPAzh/h+QDDdKIwx7X+sk1M/Db6c6Hjjo+kJ/6PBX/kIUG+/BOZNsaOUx72ZsZk49zCazwhhkSxnWtaOJyT/K1xPrN2/1IWV8fo/V2n+Wcf/nJEL1vvKRWpq3qjzxTmatufM/Q3JTIBYJMb+m/7Dbtr1FTmdVwE5FWTnib5F1PvFEXCabMEKESCITDtE3VPXaTVW2UvicjjqO/v4dzrsuCOFfhiE+awR7xkBq6C0Y9NmiNjWT/wJaLA+sspp9J0bIqcX/ekH1nJ3Pvi8JRJ+usFaCSzRztJpuIdqSP/l2UE8eChC4i+oWXJcu/v8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(86362001)(31696002)(91956017)(66556008)(76116006)(66476007)(8936002)(64756008)(66446008)(186003)(66946007)(26005)(19627405001)(21615005)(31686004)(316002)(110136005)(166002)(122000001)(38070700005)(5660300002)(36756003)(38100700002)(2906002)(71200400001)(6506007)(6512007)(83380400001)(508600001)(2616005)(6486002)(966005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?eb3RGuuKPi0tMi0D9kMSEp0VVR598xw09d/70QJcGYhgOYF/RwK1yotIqW?=
 =?iso-8859-1?Q?jSWDHnhjo5aMF+ZvA2v5BFIxh/AC/JEr7hvXMhJxkyg9goqKuLedsSFo8U?=
 =?iso-8859-1?Q?gcVR8iE2/l3Mk/zDTod4wYhYvmEn/A7W1AGxu5kIAfccaH23Ywnm2BDRCx?=
 =?iso-8859-1?Q?vLHdGfC64exH5nMllJEZlxDmxg5c/GR/hlTCsUWGPieY8IRrBxNKSyyVYN?=
 =?iso-8859-1?Q?MyGB0FSl4vmFsTqBE7XeYERZqtxODNJcDOxvrA/C/yYEyUV7/0SAzNjII+?=
 =?iso-8859-1?Q?AM68yviX8gBz17Njavl6Mx7ltUwaAhCkwa8XKkoGo8Rzj++JwuwGjh+0vE?=
 =?iso-8859-1?Q?34qiOlZ9d3H9DcYtHTLTQxzRlR4yRiOd2dnUUzTxZ0+FWXqCDxg44eLJYk?=
 =?iso-8859-1?Q?uHYAAzRoINxU+7u01sROVRXTyrhT37VPV94ZGgWh0aChGtH5r9stM7v6nU?=
 =?iso-8859-1?Q?yJQkWh740oasAVbH+BA1XGD3aNR6CKxN8l/tDkpLgO40pqM7RcXXbemP/x?=
 =?iso-8859-1?Q?FrMrj9sepBUXauhxs+DckLnivxRUlsQHaKcp6Rvma39h5YajQ0WfsgwBID?=
 =?iso-8859-1?Q?s34FmzYIhb3UmkUMUQf8RUZvnlW3GoH7BNgem/f0GG4c9aeuUiFXYH6BNZ?=
 =?iso-8859-1?Q?gq82LIwSPvPQ+/PthKqjUavLr/pmk2oaXgsBSSHpUASnw+YmFX+2l6N2RV?=
 =?iso-8859-1?Q?5tSNtuQJWMOoV1EF8w7XrzKoYOBzzUqDuJTbrKPrS5GG76c4LG9VybwT/M?=
 =?iso-8859-1?Q?XCpEmcI/s9ld9X3zPTR9nPxmoKeXEdQcQOEvrg9TKEjvgf0oyNF83ypYO6?=
 =?iso-8859-1?Q?4SBseYKpqGT1dhmwjVuTE3Wuyzvt3Y6J0kqyylda0WGauxUdvCOYZXAR+f?=
 =?iso-8859-1?Q?HGss+s816kQ9xJEOEWUxe5U/6sJyUiqzlOdBKxITsg58bYAH1wzD8I7Bbk?=
 =?iso-8859-1?Q?k71ZH1RCMASQwAs+y3bCEv9mHhXeDmbifoegOVyylqQEecXZBzWY7LmN7/?=
 =?iso-8859-1?Q?pGgQ9uqY1zRO1Whld4+IqvQrux8kbjeSWK/Fi2cSIGo7YkkAB3f2HTaoSp?=
 =?iso-8859-1?Q?DSzc+Gl0YHdv3M5m2r0jDyEVWq+c3rS57QreM+CCgRz5ZliYI/CnOvpxUw?=
 =?iso-8859-1?Q?mjPrvyYjDb2OAzx2NyBkMy4O9e9hhiacSU5gs/GDRHJ6g16phNVpU4I2Pj?=
 =?iso-8859-1?Q?0JTsvzqFK+mC9fJr6QPP/1140Io2ihKSNl4qzNVgflMydcr+EH+Y7K2eZQ?=
 =?iso-8859-1?Q?aeIzyfNdfU2JTawFr0bCrp0qdHDQBOeTPXSftYYKZF/O8b5uj2WtVsPhNr?=
 =?iso-8859-1?Q?zotmmNUghVPs5RAgzl7yCNPUpIjmNG/Hzg9e7+/3p1oiaiVn9I8RTF51z1?=
 =?iso-8859-1?Q?R4VhUAiYxS41f9qBj13XvBZEuOWLA3pFVK/6ulLoMQc8ShaTQXMLRH93SU?=
 =?iso-8859-1?Q?Ce1vosIh4eabrjeXfeRPiUrfrWsoVN4ZOdscOya1FFQWcw+q1wQM4YWuns?=
 =?iso-8859-1?Q?HXEoSAcBmgHbR9VLxrdM6vv8yL6uEfbUYEkdgMFPcxi4yGGxmP/H5aaEgP?=
 =?iso-8859-1?Q?frFjqwydPNVewsPvZGpDc9aejXw73HRS3s0laZ1xkxRb9lHSWlv5DVgoj2?=
 =?iso-8859-1?Q?v3C4OdLL0P/JR098SFmx/DnIr7FFIRQqWzBHo5KCzVNT5CaJdamlNUG4Y/?=
 =?iso-8859-1?Q?odtN1Wbgk2LxTnOoDG2JVHgJ4QFpFHVA1mJvGfzhxAGhBzydE2C1eqdRQM?=
 =?iso-8859-1?Q?89Uw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_333ededd79c48a21b6a58012b5f793e3windrivercom_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aed12acb-006a-4f1c-aaa0-08d9f05cae23
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:25:09.7460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WMpFO9w1Hw3GyV1oFXaDpdyfa0lgIAXUeBap4uqyYUoZjJkhHpYhBq85AGcTvv0ZAtExcxu2kiSROJGhnZaF5SAMM/h28mMNnZCMG0GP2EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3501
X-Proofpoint-GUID: X0u_1fAzPnmFrDN2GJ6n7lcMAtKlsLWr
X-Proofpoint-ORIG-GUID: UvGC_lUMgmxlVtNAp95Ntemftxb90W6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_03,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 08:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161743

--_000_333ededd79c48a21b6a58012b5f793e3windrivercom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 2/9/22 06:53, Khem Raj wrote:

diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in=
-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-cr=
eate-thread-failed-in-unprivileged-process-BZ-.patch
deleted file mode 100644
index 3283dd7ad8a..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unpriv=
ileged-process-BZ-.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com><mailto:hongxu.jia@windriver.co=
m>
-Date: Sun, 29 Aug 2021 20:49:16 +0800
-Subject: [PATCH] fix create thread failed in unprivileged process [BZ #282=
87]
-
-Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clo=
ne3]
-applied, start a unprivileged container (docker run without --privileged),
-it creates a thread failed in container.
-
-In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined. =
 If
-__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
-
-As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
-CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
-was specified by an unprivileged process (process without CAP_SYS_ADMIN)
-
-[1] https://man7.org/linux/man-pages/man2/clone3.2.html
-
-So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
-fix the issue. Here are the test steps:
-

Hi RP,


I found this local patch was removed from glibc, we have to get it back and=
 regenerate uninative to avoid the thread creation failure in  unprivileged=
 container


//Hongxu

--_000_333ededd79c48a21b6a58012b5f793e3windrivercom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: 
 <BB6B2E92EB21BA4E946E451ED1E1903F@windriversystems.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"moz-cite-prefix">On 2/9/22 06:53, Khem Raj wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre">diff --git a/meta/recipes-core/glibc/glibc/000=
1-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes=
-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-=
.patch=0A=
deleted file mode 100644=0A=
index 3283dd7ad8a..00000000000=0A=
--- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unpriv=
ileged-process-BZ-.patch=0A=
+++ /dev/null=0A=
@@ -1,79 +0,0 @@=0A=
-From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001=0A=
-From: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongxu.=
jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>=0A=
-Date: Sun, 29 Aug 2021 20:49:16 +0800=0A=
-Subject: [PATCH] fix create thread failed in unprivileged process [BZ #282=
87]=0A=
-=0A=
-Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clo=
ne3]=0A=
-applied, start a unprivileged container (docker run without --privileged),=
=0A=
-it creates a thread failed in container.=0A=
-=0A=
-In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined. =
 If=0A=
-__clone3 returns -1 with ENOSYS, fall back to clone or clone2.=0A=
-=0A=
-As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,=0A=
-CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS=0A=
-was specified by an unprivileged process (process without CAP_SYS_ADMIN)=
=0A=
-=0A=
-[1] <a class=3D"moz-txt-link-freetext" href=3D"https://man7.org/linux/man-=
pages/man2/clone3.2.html">https://man7.org/linux/man-pages/man2/clone3.2.ht=
ml</a>=0A=
-=0A=
-So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could=
=0A=
-fix the issue. Here are the test steps:=0A=
-</pre>
</blockquote>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">
Hi RP,</p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">
I found this local patch was removed from glibc, we have to get it back and=
 regenerate uninative to avoid the thread creation failure in&nbsp;&nbsp;<s=
pan style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt;">unprivileged container</span></p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">//Hongxu</span></p>
</body>
</html>

--_000_333ededd79c48a21b6a58012b5f793e3windrivercom_--

