Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FABC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 06:23:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1878.1719469407454473824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 23:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6908088e36=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R50HnA017105
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:23:27 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvyvhgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3nyqoKQlhI/dwQIbjkcuSEpj1rBoi57/FXdUES1TJWBdo3wy+Sz4bBeIihyq7MwD6gUjMuC12Cwp3Oui3gjggLJfs53KoXr9gcr52wP21W31IG/Uf2snkB2ir2X2Vwcd1KTgIDOLeDPyxq3Dt9xU/35mL1UEiBquFx1BG8PVFwPhJELjpEGScarRjBn6UnXOEMWAoLYODicZ64y7Wtz14WXtscBtdymtAgaixoKP8Qs083g4JGV9DQZ4r6jUG+MijkiVmh0LbP/0kJkSVC8FFL8DFKpUoTFHLfNyTrL7NTF/AVTyXVMZgq0fSepFSyUe2skKX7EFhtXOApzX5/BXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrWX6/M8dZv/R722G3khxsOQixJlTu0PgITb0pCF7qU=;
 b=NwxJx/4pjPit7a7aj3zevW0ZTEjDY/0u5IrkZqe/V5SMseyVvDEqpWkT4d8NLRoR8WOv3F94Caoeqkuk0BR9JNW6pEAxCfcxfCvM/BskmfMU1YBGrgorSJDBCfDyfBhqpzkzISGT94H1Wh5MpGKBcz2H5X9JnI1HJY3fP19GulAx0ilZtVWrSsxBje0zZiH+4SDeo4EWHLhBKHQKStK1uLQSLCoDpw/l11mRXMp/Ja/4+Y5YEBEFjGyOwOZ/ALacFBMWQr2UCvHc9Mq5Lmj6Sx9cUNX1CYbB86/aAGWU7uzTOOyjXjF8Fpl6/+TJl1JqCxC+KO4zsDiBv6v12XqDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7606.namprd11.prod.outlook.com (2603:10b6:510:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:23:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 06:23:24 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Yu, Mingli" <Mingli.Yu@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest
Thread-Topic: [OE-core] [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest
Thread-Index: AQHayFnGBaHTekImbk2gCArefV4ceLHbI8vg
Date: Thu, 27 Jun 2024 06:23:24 +0000
Message-ID: 
 <CO6PR11MB5602FF6013A4A17963273427EDD72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240626230938fc033ae6@mail.local>
 <20240627061735.1942404-1-mingli.yu@windriver.com>
In-Reply-To: <20240627061735.1942404-1-mingli.yu@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH7PR11MB7606:EE_
x-ms-office365-filtering-correlation-id: 67251734-5617-40c7-fd79-08dc9671a625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?iZtydrvfWB0S11p2gr8tx4gz+UVQ+q4adlrZEQCpwjr435Ml96IhDO/mUepA?=
 =?us-ascii?Q?iW6n+bekDVWFVM7HUhh6mtbkM/iubbs7W/WGq7XD7BwlFwzZ1w800fGc5xBJ?=
 =?us-ascii?Q?KZhTauma7FOeTS/vlTwd38egQEa/uEsb73Ldpq7DkbOxJMbT5yCgNkrebES4?=
 =?us-ascii?Q?SQTigYLqrCXJH4Chji4jFFsTE6kvROTpU3tF06lSCgoorOnlEkj6L6n6liO3?=
 =?us-ascii?Q?YA3van01PHsOTiz3gJolpqLYiGJ94iJB3CRnJz42DDycw0AVa/N1DOgYvJhu?=
 =?us-ascii?Q?G/7Xca1bqIf+h6VN6ged5QtzAMv4N1Xu+PEEc2pcxigubE8FwYw8JVjnyPyO?=
 =?us-ascii?Q?B9NrNJfVMSedbobAJkbQ+WwCLi0xHPnZh/P12+kq4Hjx6SQ4eoEbCNPNGdWH?=
 =?us-ascii?Q?/WeAU+ZikdpwJHHJ0xSss0taMDzlYT6ZEdniHlNYT55ef5dw65oIMq+Vcvzy?=
 =?us-ascii?Q?rivyHWkey1xAApXO3w3wnb8ZvVtCYvdDYfKjB/Br5C+U4YvUKl8K+tLfg2cy?=
 =?us-ascii?Q?grEDJXxUZborUlxhX0s921iNylv4uAaIW3CQTCXEKvK1+L0poheNtZB4pc1L?=
 =?us-ascii?Q?g02+hCqLIicw6PWEXya4OF0l4jwbkHJJ/Npfb/JWcRXiTSN68M1/QbH7zqA2?=
 =?us-ascii?Q?uxXTIexGKOsPnutdN77zSwATvf0tInJdyf2A+C13eRg24AwPu13PLwMEUROE?=
 =?us-ascii?Q?GirWAKPiAlZAht2tAuHG/x2G/9gpP0Rrm0cWMMS1qafbsNmU6z/Cyz7hdXjY?=
 =?us-ascii?Q?UPkkUdFLZsKmhn97ViUUhuCWxng10WsBttx46Fwr6c4WZ9OkB1T6RZCs1fjO?=
 =?us-ascii?Q?gHXj9mkJHgDQjUFaRWs1uAy/W7sqtW4NHU6N3EK31ymHXQ91RTWLPmta1NJ9?=
 =?us-ascii?Q?hPKNzT2fpGmYMIP83cJGrXbY38ojfV8o8Mw6Mi1GSGkPb7gq29bMSCQQ/bBS?=
 =?us-ascii?Q?Gl2Ufs8ApsWz4w3T/6FTJOwBA7obvhIdMtWWfjt/Y7S1DOYi7g++VkN9Au76?=
 =?us-ascii?Q?ayuwmQMAUXvVD44sx6nrDM3wn9813IdTrszIhcOU0oQaXZ4fQ+rD8WC0VBaL?=
 =?us-ascii?Q?8v6a2zBglCM6UKKUmnqMukfJ5BkDyZxMPdS90XNMy/vpqfa4u355+jZFyhGd?=
 =?us-ascii?Q?VtvvDsnPeEGF9TqNTR6SDBk0itqeldDUbcdWE59jQTa8fzjlRAVC6CD/JnjY?=
 =?us-ascii?Q?ziydKUZv0/oAfUWKmWtMkDKyT1i2rSpplynyqWjvUGsi/wX4FD/NKuoUI2kv?=
 =?us-ascii?Q?ouVMO1H7cUsLkBCU1uyvFKoU7wuAX0mECKj+ApYV+OEOaGCBmwcltZW/xicZ?=
 =?us-ascii?Q?BKNzE3rW+qf4y6nqYfUedarBmVdCNFYehAfhHe7Y/ci6ZSTAMjk0DEDCTV+M?=
 =?us-ascii?Q?qPVBzQAJrFd5QILViSFmq4/qInyxHd1CRHYEDbeFJ9NQJGezBA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YkBjjYENwp3lOdOocWQHwu7thMdKEMJ5Py/P1RD7f5fLpCfdIM/vydWNzksy?=
 =?us-ascii?Q?0paweYal1SNndsSM9Lp+yb0oIS2x3FxoEYeyqlNWa1/ARgrJ/ITSm4GVzkZL?=
 =?us-ascii?Q?BB8YFJSadmajwOfK0ogaovPjU4Vs7VggG2fXnRoYls5+BaZ/zyzJpDwLoMuM?=
 =?us-ascii?Q?gL5J6EVGtcfVmkkMUPcVK0DlO3UOvNW2Te6GiqVGZJ6Cju+PqHOj+Fm93yMJ?=
 =?us-ascii?Q?OF4t20mI7UoFggl89bzvx16TXdr0jR0t+7RioZ/j/hzDAlIauhjKwQQRkq2f?=
 =?us-ascii?Q?9XQJZrX5vMHLaHUNjeiWZh++89NYxPM8cZjJpyL/rAMEiJ6MPgzFAcCqbi2C?=
 =?us-ascii?Q?2Y6SfWaZaF7Vu6vrojB2kQ83/29F3BXzS7OqZAbZwiB1Iw6T7Ji56/2RcU73?=
 =?us-ascii?Q?ft4RHORp7caukXXINJbGfJy5clpoA5Gk+DrzmTPcDXSorsW8wCs2cRAo36oC?=
 =?us-ascii?Q?+ou4C9U1rTCBO5kZ2rE+9t7KphvDAmbkZlcs6Dw1Js3muiSanmta4GSUtRek?=
 =?us-ascii?Q?ErmY2vFI9X1wjT2d+YFeEe21eyKvUnm/tbfMAq7yxjoNO2nA3DEe3J8rY3ZB?=
 =?us-ascii?Q?K3XhQmSBsCLkr5h5U+O1pfMc656DozcOm+rAiUXxH/xOwvF4jSDa3nHhiorg?=
 =?us-ascii?Q?JlYzFeENQ3yDbr1jLvoJowpM5zdy+6igwcGTGnm7ZF9PfYkWUylKAgdLG2yx?=
 =?us-ascii?Q?9MoUnA36YceZhLvd1mTdcM1Bt16vN4bmMvCYpafk2moht2MmuGdWj3j7njIw?=
 =?us-ascii?Q?GCu/R+zeP3vzqOCalyzMXEc4giKVOy5TR89/UQC7PufmU0gkAU0XAe3Az6RW?=
 =?us-ascii?Q?hp7kuqbvvL0WfnGYT2BB5Pg6bjJr/tQH4RPD6A+PvLwqfAtFb29Bfheeh2gR?=
 =?us-ascii?Q?ZTouWJWc0xz0bJaH8TJVxrpsG4wCyDFdu76/MuMlg59iX/gdcNH/RluNCswE?=
 =?us-ascii?Q?WaCxo1Q0q2It5KMX7gdynw2bDVuM/TLLBMNOyeN5FZqjCMm6FhuthgQN1ZDR?=
 =?us-ascii?Q?hctlas6KinkS+BCoUNMuib4TneWuu7ehVqsQL6z1p+v0ZzhCdgI6uVJ4H6MI?=
 =?us-ascii?Q?il991eKGrgro2hmZ6r4XFC02s5CnC24aNQccW3oBxvxikaVvEsNf8X1nhMrT?=
 =?us-ascii?Q?6XDZ/ngMtGWgC7RMkGAczvPNr7d4O+1NGTNO//rZ/R2XeGj0gWYPMKE4WnIn?=
 =?us-ascii?Q?FHJKUyODWqMRAJL4XM3UTZSCCX0Fb3DtrN1ktGKrZx5QNReFSVlKKJllcx57?=
 =?us-ascii?Q?3HqBsTvUwZ1kBUeEyKaeNHpa8H0Gi/e5dobfN/0aP++T/IlozIwzY0MmxZYP?=
 =?us-ascii?Q?wJQHorxtIPpfPdZtQr5LvGd4lA2Ez7m2Ns18NmRCpa0RVe5o8XwiSImRpUag?=
 =?us-ascii?Q?JfQlu7wOUgq9JBv0OCuZVtK8QzziI1aajUq6p8crLVlV/SjxgIowtPTF7rrJ?=
 =?us-ascii?Q?pCEbw+SYewEaoddF2hhGl5NC2yye6Zd0eiTPtJMEhKlYwgWjb/pJuQ1/4I55?=
 =?us-ascii?Q?FSLtX5udP1wGXhSgqpwhduI7e8zfi9yRYeeBYZz3hw8u17/J4Dn+8J9d6/Pv?=
 =?us-ascii?Q?xzqscsJvczfm+PiI0IqxFhA8sD86pWQj9ENA/nEq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67251734-5617-40c7-fd79-08dc9671a625
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 06:23:24.2194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaflCcHib25MFBhTS3jzfizXEt0HQ9i/3MDrhcpoh8Qu1z/CNHrtA33Glwz1jbTBWJQUN2WVXYifgt23KG2Whw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7606
X-Proofpoint-GUID: Eq3AGtNbSlUFL_K7aVHZyPeFKb22Eo9V
X-Proofpoint-ORIG-GUID: Eq3AGtNbSlUFL_K7aVHZyPeFKb22Eo9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=901 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406270047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201184

Just one question: the testcase's name looks like it's supposed to be run o=
n some NFS. Does it?

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Yu, Mingli via lists.openembedded.org
Sent: Thursday, June 27, 2024 2:18 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest

From: Mingli Yu <mingli.yu@windriver.com>

* Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below tes=
t/nfs/nfsacl failure.
  [19] $ getfattr -m- test/sub -- failed\n'
        'Can\'t exec "getfattr": Nosuch file or directory at ./test/run lin=
e '
        369, <TEST_FILE> line 24. !=3D # file: test/sub\n'
        'getfattr: No such file or directory   !=3D system.posix_acl_access=
\n'
        '~                                 !=3D system.posix_acl_default\n'
        '~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/attr/acl_2.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/=
attr/acl_2.3.2.bb
index ee86ce2cae..5ac085c322 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -68,6 +68,7 @@ do_install_ptest:append:libc-musl() {  }
=20
 RDEPENDS:${PN}-ptest =3D "acl \
+                        attr \
                         bash \
                         coreutils \
                         perl \
--
2.34.1


