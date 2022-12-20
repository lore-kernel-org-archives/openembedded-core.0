Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A0C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 06:34:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44734.1671518072413880109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 22:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=j6vhju2P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93534972cd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK6Srej030544
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=VP1Q9ytIXah+lI2+zUT44x9wW5k5EpByCo5obkq16u0=;
 b=j6vhju2Pz0rnlDbywVFhprOUZumaDyf7ZyPAdW2+DU1vXaZTH11Z6YBtY1bXR3GIo+Rw
 ji8uYHzjHlZqCSHYg3q4cCuReNIhtM+RAitaEnglGbkItJwe+LRFA8Lj4F5L3AL1Cy2v
 WvIOj+F8X4gqC+bIpZlMvTBiyB7F8jzt0G6cg6iP187hU8dRUSzPrydNxZAT1ysx6l3S
 4xNJ373kWUcKZguO4OvsHVYfsgYUELBboSxTxzYOlwhPgi2NNGF/0HaNIxLhdOznKR78
 4W4F+YMUYITvmGQ/lcjMwfPZiIQthZRTeNWbEuwIKyBbUIHi55/s5i9rTSgPqti109EG wg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301j41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwaxwGcQlIEuewMvayAaeiaJVEYzXYOK3FTu/IRSr+jDKKmVc71WQuIW5TmLkZ7cOLjlq4e0axf/mvCTz65IS89LkGxcoUNypXf7ezh78SpBb4bSZlNisE/LchaXhaRuFyN/WElxioUufxJ6yeJM8qxOfTJttQ5MzQEpDI90E8Z6IC3ULVyve3i0ns4gTlRy6wUXy+5BTgu1mArE5UBZvnW1xLPovFJvVoavyyR4XHAnipZlcFRnc1bl0adyT36ULs4x7JJjLKhcjq8UpMhUAKEKgWKggbeENyIX4eQAe56ikpYB+xae+nAzz2oDoeMWD92K5Jpg9Zbuks4lPHdLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP1Q9ytIXah+lI2+zUT44x9wW5k5EpByCo5obkq16u0=;
 b=Xf1h5yYp3iugN8Hxr/Sfc6eHGkgvwXnzalzBzgJnVjFpR5beuCabiAGwGD+S5gZOcIkK2WvOPcLGTQntcZfJiQBsLAmG9voZs65KazO6ts4Bo6uL+ShP9hM5C7sxpI6xsuyo5Vb4xmPHUAeNx5zxJUxDTW8u1z1RUyGCQWk7e/JUnYGyQKOWxiLusM3CHhPoCzThpZVWU5e0rCVub/vTfTXqomolzLKfRItc1hSI/UNUPs03MsJN3wyRQmXS/jat73s5Z8PCzzMrp7sBAutVNj7nnl976unOPzU29LmpwE611ycysVQolO60LFJHbTuoThpGoNuYBzcsg3sLMUi8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 06:34:29 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 06:34:29 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Saun, Manoj Singh"
	<ManojSingh.Saun@windriver.com>
CC: "Mali, Narpat" <Narpat.Mali@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        "Kang, Kai" <Kai.Kang@windriver.com>
Subject: Re: [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
Thread-Topic: [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
Thread-Index: AQHZFDyF2yMpg6zsG0iAnDopQZKata52UULt
Date: Tue, 20 Dec 2022 06:34:28 +0000
Message-ID: 
 <MW4PR11MB58228FD9C6AA67968C7C494584EA9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20221220062956.609061-1-manojsingh.saun@windriver.com>
In-Reply-To: <20221220062956.609061-1-manojsingh.saun@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: 40e3004b-a7b2-4cce-795a-08dae2543f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B5oQAyhjDNhwe2ASMM4MM15Dq7eGazzrW4Wp6wJK0cfR0EKqadgOjpqhr7clGzMMiVuRpFfTtUlb3wn+kVh6q8ekKd4iNYoQOYZOTpoYjMBnLkLOkIoh4qrRo2KZBYEFPiP53isigTk2ontZpe79TsV+a0hvb0Lwo0J2UqDlcq4bLSrrQY1pyaolpt0zN7oZS/1f1b+tlCPyrRdYxyrS/TRbnMCepHggkdDjJ5zuD0vxzkDTgS5RgWD8AaFDeAWmT5AKRYs27ly4bNFNp0ZD19mrTWpzsVNKk7+59qGuPeHvphaSk8eHJRFbzIaGgR8du8bIDB51mGnOr7f1KCUq+/8rJbrdIEFspdF3hqUcgRsuV75o0YeWwA0Pq4uGhD0CMRceNvrekwM5f6fB3UspJgrTXm2pdIAw6icWJHqCUGU2zK2T9ouaawlHqmAIci8kCfQ4WTJiQakvEQdk+oJz3++c2WiyURU9R7eW0gylqzEis8p7xa8GfL5BHQh6WhmQaqhZH/Jbzis2lpsuAvo7WufPm9DUZJIfnh1Ag8gv5rvZhx0EDSazFcyZ41MhkKfnXwh9wt3nKOlrLLk0bJFXxJVUkpX7pOx3PfiJd5P3VyIvVugqW5F7J74a5w8FMRG8+SlaZZwuhy25XJNTrcikcpMCpEuNwn5csv3ddT5pBPC7QKkBndKWXuSFz4WHUlYbVH+cwTP12B8RoprzvlYRoIOYhnv0riUEMnvnCTlkmCSCFaX+8TU184hnvTXcREdbcSnl6u9Xb9ulHLGUbXlckA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199015)(122000001)(83380400001)(38100700002)(86362001)(166002)(966005)(38070700005)(33656002)(52536014)(66946007)(21615005)(66446008)(8676002)(66476007)(4326008)(5660300002)(64756008)(2906002)(76116006)(66556008)(8936002)(41300700001)(9686003)(55016003)(26005)(186003)(7696005)(107886003)(6506007)(71200400001)(110136005)(6636002)(478600001)(91956017)(54906003)(316002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F3uXdDVonjdL+3wH+qRDq3kkJU6OLBtUw/oZbvywOlD8CcSk6RQvq2eNAOYY?=
 =?us-ascii?Q?vep2AG2qfWXFCOkErwCImx/g9RQgjcOv+VY46+3aBLOjO6Bz5ZFLNU8p8t5G?=
 =?us-ascii?Q?ghxd+1s/YFg+8WomoGJ+7Bk2aMkslvlY3jBnoz0zAxHd5LMD1j1mxwNiDHGs?=
 =?us-ascii?Q?D7GEM9p8w+hYlOSCltYrPfacsKwb1H+KaAvkBKR/fvPhBu1G4FNMhS6SpwcH?=
 =?us-ascii?Q?QQFV82X7i0slQuClPg1aA4ulj0UimsjCGWBXDwpu+yOWNbIWEw7c5OG2KXyb?=
 =?us-ascii?Q?QxLkew7e5yrV8zqp7tOwmpJ7ie0fjLIDTWQzNHPnvd9djRkxdF8CW8uEn+9R?=
 =?us-ascii?Q?RbjAdgPou2ClRT6YYDQPMEbpiqwdAXczzy7H8y2PxfOWVeh9xl8FYSbFtJLL?=
 =?us-ascii?Q?j03NUJX0nG5JgG1FdEgNj1laVZ9RxPK6Qs9r+IGH8YH683yKiraPg/fxDFKR?=
 =?us-ascii?Q?JuSUHGHdLcT3T4bKY5cnpcK3NAsbGHCtQqBz010BJGLQ4lJwHB4xvfDDcS5b?=
 =?us-ascii?Q?631sSWqfDrTHAWJX83xzYchS/dgjZD0CtI8KBITSf1gXvMRTU1cOoYQ3ek45?=
 =?us-ascii?Q?1itHQliw8Xon3JXy5OJHZduD8NmApkPOAgB2vWWHYuhovWaGTXIz3cLyJsvW?=
 =?us-ascii?Q?yUA2K/w40ZY4EtSww1lZpYLW+3xzpIQHCrS8NxRNnq0iTkVdDooW3hq7wQD+?=
 =?us-ascii?Q?JXyFFcLCMDAbnxUNxnyu1LmO48Er1EBuo7U3JkmrkuUmltUHuCnPj2/h/qgK?=
 =?us-ascii?Q?ICnseoC99sQSGnNH+mWigmAdq2oavy+CJf/AZumD0oSn7O6UNZc4UmjjZcte?=
 =?us-ascii?Q?Uf05W8hgtRUorcFqzm5PKOYkkpacICWT0WFfsi8exb+GJzt/mSG9OlAztmeO?=
 =?us-ascii?Q?YWRiedU0xF5ImAOr6Hpz73VNdfnHiCiET9rfq1MnDe749BuAJjS2FNtQULUX?=
 =?us-ascii?Q?ilU3DNkY4YLV6JrWC1kV2enjf2bQ7CBHPau0e120GA8apkd2qKrFa2CWoYme?=
 =?us-ascii?Q?erbFx1t7GP19hVaq0CQGwafsb5PCif9Zlkn+bldHH0nHN2VyxLnS2gWD+kDR?=
 =?us-ascii?Q?bE5bNl9KvbMgmsUi6Fx4eXOzap8N8L9B0ASHA4SMvEBtMyza9XbTn/W8LdSw?=
 =?us-ascii?Q?5jqjftB64GjfJEJzFqIeawyARi8g0TuDUGiue3VUFTkYFlEerDaLui1db9TP?=
 =?us-ascii?Q?ZcHo+vj7YNZxJ8QjLiLnZ3zB1zzW6sf9OItJY9rDbOJO2Y+SsBJZVajhEU0l?=
 =?us-ascii?Q?Id8ML+2Hf2pcADcUtTEXXQ+sgP2AlSBYemSvHZr1jW1diPLvNoVnHGPpOwls?=
 =?us-ascii?Q?E+x+6fhRFpkhzhXxPCTtuGdcYXkP5Bz4DXW2RHMrzQ1PTS5WWDqU5fppZZ0v?=
 =?us-ascii?Q?j9DqlHJ8SjTtuMW74n0UiDScyO4HZo4TQjuI+30c+6jIio81Rsx5OXQoX2t9?=
 =?us-ascii?Q?2pZNM9SrlLyJYWySAOh0b2Sr/IoedeAcShD/jrR3HOS7EZdlw1PJZdrinOyt?=
 =?us-ascii?Q?JcbmmQfu+aE2Tb55j688q0f5M6Kv7XR1QF5BwPyZ8BOkygg7I+C8ob1RfUDP?=
 =?us-ascii?Q?Q6fv3jzLPQfTqfxBzngrJYRVA5TF95Eo29R+bgMTig7SZvXLQyUnk5RX0gir?=
 =?us-ascii?Q?vA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58228FD9C6AA67968C7C494584EA9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e3004b-a7b2-4cce-795a-08dae2543f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 06:34:28.9683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P78s1fm+qZ87YAsCeivzHCQ66rwg2qSaQXKUG8M7hekHkYjyrwewdb65QmUsWdLTXhKUBa/wN5x1Nr+11KA2saBV+ABQgHdT3aMdcz1r7q7bcs38L/6mWZQrBtyhRQpE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-Proofpoint-ORIG-GUID: IVDxWET8RyZb0isaTO_Vkm-t-0O5ji-a
X-Proofpoint-GUID: IVDxWET8RyZb0isaTO_Vkm-t-0O5ji-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212200053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174843

--_000_MW4PR11MB58228FD9C6AA67968C7C494584EA9MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Manoj,

Please remove [meta-oe] in patch subject, it should be

[OE-core][PATCH 1/1] libksba: fix CVE-2022-3515

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Manoj Saun via lists.openembedded.org <manojsin=
gh.saun=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, December 20, 2022 11:59 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Mali, Narpat <Narpat.Mali@windriver.com>; G Pillai, Hari <Hari.GPillai@=
windriver.com>; Kang, Kai <Kai.Kang@windriver.com>; Saun, Manoj Singh <Mano=
jSingh.Saun@windriver.com>
Subject: [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515

libksba: integer overflow may lead to remote code execution.

Reference:
https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html

Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlib=
ksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b]

CVE: CVE-2022-3515

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 ...e-overflow-directly-in-the-TLV-parse.patch | 42 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a-poss=
ible-overflow-directly-in-the-TLV-parse.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-ov=
erflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba/libks=
ba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
new file mode 100644
index 0000000000..e2cb842a4d
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-=
directly-in-the-TLV-parse.patch
@@ -0,0 +1,42 @@
+From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Wed, 5 Oct 2022 14:19:06 +0200
+Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dli=
bksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b]
+
+CVE: CVE-2022-3515
+
+Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+
+* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
+used sum.
+--
+
+It is quite common to have checks like
+
+    if (ti.nhdr + ti.length >=3D DIM(tmpbuf))
+       return gpg_error (GPG_ERR_TOO_LARGE);
+
+This patch detects possible integer overflows immmediately when
+creating the TI object.
+
+Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
+---
+ src/ber-help.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/ber-help.c b/src/ber-help.c
+index 81c31ed..56efb6a 100644
+--- a/src/ber-help.c
++++ b/src/ber-help.c
+@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_i=
nfo *ti)
+       ti->length =3D len;
+     }
+
++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
++    {
++      ti->err_string =3D "header+length would overflow";
++      return gpg_error (GPG_ERR_EOVERFLOW);
++    }
++
+   /* Without this kludge some example certs can't be parsed */
+   if (ti->class =3D=3D CLASS_UNIVERSAL && !ti->tag)
+     ti->length =3D 0;
+--
+2.34.1
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-s=
upport/libksba/libksba_1.6.2.bb
index f6ecb9aec4..c25c23ef0f 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo

 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-pars=
e.patch"

 SRC_URI[sha256sum] =3D "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06=
f6ed4f6192c971"

--
2.34.1


--_000_MW4PR11MB58228FD9C6AA67968C7C494584EA9MW4PR11MB5822namp_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Hi Manoj,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Please remove [meta-oe] in patch subject, it should=
 be&nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><span style=3D"color: rgb(66, 66, 66); font-family:=
 &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif; font-size: 11pt; font-weight: 600; background-color: rg=
b(255, 255, 255); display: inline !important;" class=3D"ContentPasted0">[</=
span><span data-markjs=3D"true" class=3D"markdse4i8rx5 ContentPasted0" data=
-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"" style=3D"font-weigh=
t: 600; font-size: 11pt; font-family: &quot;Segoe UI&quot;, &quot;Segoe UI =
Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSys=
temFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; margin: 0px; color=
: black; background-color: rgb(255, 241, 0);">OE-core</span><span style=3D"=
color: rgb(66, 66, 66); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI W=
eb (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyst=
emFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; fo=
nt-weight: 600; background-color: rgb(255, 255, 255); display: inline !impo=
rtant;" class=3D"ContentPasted0">][PATCH
 1/1] libksba: fix CVE-2022-3515</span><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><span style=3D"color: rgb(66, 66, 66); font-family:=
 &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif; font-size: 11pt; font-weight: 600; background-color: rg=
b(255, 255, 255); display: inline !important;" class=3D"ContentPasted0"><br=
>
</span></span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><span style=3D"color: rgb(66, 66, 66); font-family:=
 &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif; font-size: 11pt; background-color: rgb(255, 255, 255); =
display: inline !important;" class=3D"ContentPasted0">Regards,</span></span=
></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><span style=3D"color: rgb(66, 66, 66); font-family:=
 &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif; font-size: 11pt; background-color: rgb(255, 255, 255); =
display: inline !important;" class=3D"ContentPasted0">Archana</span></span>=
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Manoj Saun via lists.openembedded.org &lt;manojsingh.saun=3Dwindrive=
r.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, December 20, 2022 11:59 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;; G Pillai, Hari &=
lt;Hari.GPillai@windriver.com&gt;; Kang, Kai &lt;Kai.Kang@windriver.com&gt;=
; Saun, Manoj Singh &lt;ManojSingh.Saun@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">libksba: integer overflow may lead to remote code =
execution.<br>
<br>
Reference:<br>
<a href=3D"https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html">htt=
ps://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html</a><br>
<br>
Upstream-Status: Backport [<a href=3D"https://git.gnupg.org/cgi-bin/gitweb.=
cgi?p=3Dlibksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b=
">https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dcommit;h=3D4=
b7d9cd4a018898d7714ce06f3faf2626c14582b</a>]<br>
<br>
CVE: CVE-2022-3515<br>
<br>
Signed-off-by: Manoj Saun &lt;manojsingh.saun@windriver.com&gt;<br>
---<br>
&nbsp;...e-overflow-directly-in-the-TLV-parse.patch | 42 ++++++++++++++++++=
+<br>
&nbsp;meta/recipes-support/libksba/libksba_1.6.2.bb |&nbsp; 3 +-<br>
&nbsp;2 files changed, 44 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a=
-possible-overflow-directly-in-the-TLV-parse.patch<br>
<br>
diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-ov=
erflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba/libks=
ba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch<br>
new file mode 100644<br>
index 0000000000..e2cb842a4d<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-=
directly-in-the-TLV-parse.patch<br>
@@ -0,0 +1,42 @@<br>
+From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001<br>
+From: Werner Koch &lt;wk@gnupg.org&gt;<br>
+Date: Wed, 5 Oct 2022 14:19:06 +0200<br>
+Subject: [PATCH] Detect a possible overflow directly in the TLV parser.<br=
>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.gnupg.org/cgi-bin/gitweb=
.cgi?p=3Dlibksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582=
b">https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dcommit;h=3D=
4b7d9cd4a018898d7714ce06f3faf2626c14582b</a>]<br>
+<br>
+CVE: CVE-2022-3515<br>
+<br>
+Signed-off-by: Manoj Saun &lt;manojsingh.saun@windriver.com&gt;<br>
+<br>
+* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly<br>
+used sum.<br>
+--<br>
+<br>
+It is quite common to have checks like<br>
+<br>
+&nbsp;&nbsp;&nbsp; if (ti.nhdr + ti.length &gt;=3D DIM(tmpbuf))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gpg_error (GPG_ERR_TOO_LARGE);=
<br>
+<br>
+This patch detects possible integer overflows immmediately when<br>
+creating the TI object.<br>
+<br>
+Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929<br>
+---<br>
+ src/ber-help.c | 6 ++++++<br>
+ 1 file changed, 6 insertions(+)<br>
+<br>
+diff --git a/src/ber-help.c b/src/ber-help.c<br>
+index 81c31ed..56efb6a 100644<br>
+--- a/src/ber-help.c<br>
++++ b/src/ber-help.c<br>
+@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_i=
nfo *ti)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;length =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++&nbsp; if (ti-&gt;length &gt; ti-&gt;nhdr &amp;&amp; (ti-&gt;nhdr + ti-&g=
t;length) &lt; ti-&gt;length)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;err_string =3D &quot;header+length =
would overflow&quot;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gpg_error (GPG_ERR_EOVERFLOW);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp; /* Without this kludge some example certs can't be parsed */<=
br>
+&nbsp;&nbsp; if (ti-&gt;class =3D=3D CLASS_UNIVERSAL &amp;&amp; !ti-&gt;ta=
g)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;length =3D 0;<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-s=
upport/libksba/libksba_1.6.2.bb<br>
index f6ecb9aec4..c25c23ef0f 100644<br>
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb<br>
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb<br>
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo<br=
>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/download/in=
dex.html">https://gnupg.org/download/index.html</a>&quot;<br>
&nbsp;SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://ksba-add-pkgconfig-support.patch&quot;">file://ksba-add-pkgconfig-supp=
ort.patch&quot;</a><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://ksba-add-pkgconfig-support.patch">file://ksba-add-pkgconfig-support.pa=
tch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch&quot;"=
>
file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch&quot=
;</a><br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;fce01ccac59812bddadffacff017dac2e4762bdb=
6ebc6ffe06f6ed4f6192c971&quot;<br>
&nbsp;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58228FD9C6AA67968C7C494584EA9MW4PR11MB5822namp_--

