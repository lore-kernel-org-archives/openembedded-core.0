Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53EFC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 14:08:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11878.1700230105303105154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 06:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cfLvQIb6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96853cf884=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AHCR0Dx002130
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 14:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=+r6WslKKsQ13a7lvXC
	Vtkvv4QjImy1ZteIuPx8rC1r8=; b=cfLvQIb6Irb71ZoZGqP9N6Xo8OllfSL/xu
	+Csinh/V2W0ct6gbYDe4XcVTnzJNG5NwgXAbY9J6VpMd6mvwxYhj0LHWkmedTBZp
	95kdiooEUgh+/s9xtB/nUXKaW0yMI+DY2w6YqscXyNaQpKD9MlwHGeU11AKrIcK8
	vr39AQBByFK9uO0WT2Dqlq6R5VmipbvGkH6lxiULTGN+UR3uKNTl+/8OglgWnNqi
	q3+/ZazC2473nwRKxwRz0LsM2FuLM5ZVN5Y7MumcQElQP6U8IMCAlLAlaX/v5s7D
	lh1NALivnhj07hTgrp4YN7wrTCDwM0yiLmGOF2l4kHVtVt9lwTYA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udyje0fc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 14:08:24 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AHE8KlZ010037
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 14:08:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udyje0fby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 14:08:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkXqBis1iJezathxeGGhKeKUnKp/8VMBOHmD5oVNtkd0915p08JOQY6aP8vaREQ3dZsrLRt92AwJ1cM8lieRbqYwC4WHYM9iQe1OPvD6DPWtsmZsrZc61d30n4mdwB3qsd8SZY7N3SY+c0AJjl8uMD09fIRT34ZsA1inJNmzFbjqRc/w15aJlKDzEuD5uagDwf9ihGjAQdipSo0lybmfW2rgnSCjIsU574RvCVzNDRzRiCL3DLgY7bN++8MYtFN3F+oZS7SIGNaysbrJRdIgeHfOgQV1EYdCMonb+gi9ya27DeoMY5HWBF+BVE3dMFF7vdoNJXgVN/SiVhSDS+oQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r6WslKKsQ13a7lvXCVtkvv4QjImy1ZteIuPx8rC1r8=;
 b=k2nkyzuUn5SE5MJJAQOQ5SGHyRdSu+DyVwg+0mmBKIFpvtaNjglb/OeBV1Gk0XI4x3hQbCxtx3EfhuHBA4OCs0qxQVml0bJDEHjGcgOMVcOgy9PBpvdArpz/cYK6p7zbxQMrDUtKev8748DYGqcYSzXh4SsXjjmHx1qi5gfe0RAO4/mIijstG3av6Myvt+PbDJKWXzgsVGa655nLTa9gMHKt5XI9JHNlvjRnwjYk9aRJ5nnOiz/QJcjNXe6OwSrCJrn+nxGIYZ1aXZ88E723yqWAQmgnIeUhFU5L8K3+W4KpdzHRnsVfcSXFDLfwOM/SrPPfZVtk+V9DvqoKOE0PHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 14:08:20 +0000
Received: from PH7PR11MB7986.namprd11.prod.outlook.com
 ([fe80::129b:c89:75a3:df16]) by PH7PR11MB7986.namprd11.prod.outlook.com
 ([fe80::129b:c89:75a3:df16%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 14:08:20 +0000
From: "Gupta, Meenali" <Meenali.Gupta@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 4/5] avahi: fix CVE-2023-38472
Thread-Topic: [oe-core][PATCH 4/5] avahi: fix CVE-2023-38472
Thread-Index: AQHaGKqIqNERx3qeq0On2eRW7lxHl7B+jViJ
Date: Fri, 17 Nov 2023 14:08:20 +0000
Message-ID: 
 <PH7PR11MB79863AB60BF4708554893076E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com>
References: <20231116114450.1124133-1-meenali.gupta@windriver.com>
 <20231116163234fe55e02a@mail.local>
In-Reply-To: <20231116163234fe55e02a@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7986:EE_|DM3PR11MB8671:EE_
x-ms-office365-filtering-correlation-id: abeb51bf-bb02-43fe-b98b-08dbe776a744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e+IJMPsg1cxYxYmjoQCr0kWtj12W2LkGl0476PgyQKgH189VODThFX8HbACVMItvjMrbYklTIu8N0876bV6vAoRsOehVD9ztFZMtyaKdWoJOJ92R40CBM+fbJQ6LTUfNJbM+ufjlqLwN6egGZIEt8N/6vn/5nEFLaNoV3y8quzWw9youtu9BqnSqrbSjmPqLvDTWwVimet45Sf8thN+MQs/xFh8zKobnLAbTSW5xTkr++JUufSUDV5oMS2/M7jgiw2ZG/9l9xziRJiy5aIXedBKfd5Yypt7Qe7gPHZ8NliPmNEyMmKCALCqEMiJmTMfqxwj28mCabfQCvPfKizqOVvpNH7iuPQprbcsvLUBj8HTgxC2rwSF30oXPSX0oZAFLztXcx2XQmx+zfpbNubqeLy//BRNiyWrQoRBWUIybxXcQ+rjFWwuji9hZuJw0809Lu/S04nWnTN+3g/QYx5UkxseuLpXCF3tR0AFr5YkCsRPUliW2idPgWt2eSgk2HdExwwFNiqmFwIgWzZvXWsqPk1k8ObiKULM4wKgSrLwSIZPvvV8LeNMeEQSBnevOl7HFdLnNx9M5Gk4o+s/zhG7DyrEQm/R5Zknj3lnBU38OWSyfF2k5s4jeqF3AtY7Zu8U/jtGotN9lJ4N0eqbXqGMUaFKngcIhemqZSDypo2uc5ZmEQvWpomVzfytoJQ/pdXEP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39830400003)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(8676002)(8936002)(41300700001)(66574015)(66899024)(26005)(52536014)(4326008)(86362001)(71200400001)(7696005)(6506007)(33656002)(66556008)(66476007)(76116006)(66946007)(66446008)(64756008)(478600001)(91956017)(6916009)(966005)(38070700009)(316002)(9686003)(53546011)(166002)(55016003)(2906002)(38100700002)(5660300002)(19627405001)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5xQN54ksaDFzfSv78mkPDliAMiHMFRM4dqd+xyGhileVvZZkmARqruFTPvb/?=
 =?us-ascii?Q?goFZOxe2Z4QuGDUripbP4aeQAmfHYcS5QIfB/sZhu8qzgvEemdPl0wutiR+m?=
 =?us-ascii?Q?VHAeWbfoxNoZwKKKGhQS1RGK57Q5OOO+ceQsm4ickI/I8hdpt28WTcoqXqEe?=
 =?us-ascii?Q?5H8bbQw2JzNjrw1AlzyW3KJh1Cn0Gyegip1HKqGnTMm424vLxOR8cWDrIVeT?=
 =?us-ascii?Q?+/w5TY5YKJFwlkjXu1nIqEJw5Xt3/qXFRctJZb8CR8NiNB9CByf4wqa47d60?=
 =?us-ascii?Q?3IejC4a7P1Z7wJL6sYDBOyKl9ZcfHQqL1VkwwaniezgsjCkgwekDM6pRbt/Z?=
 =?us-ascii?Q?Jd447BGDZx5BBr5EJ1NxUSX/HI3OGdBwGj5kt8aDuFSnD7dHEWKS5fyOyPOs?=
 =?us-ascii?Q?24z+CiyrOfurWnU38pacRkm1YFjEq11t0SrAlv+GNSFagSWPZD/e6A9WlEx/?=
 =?us-ascii?Q?ewHi6xqMzmP/To4QCMf6S8BssjvWh2F32TQDF+p9NhQD+A4UH/O5Wh8l2paI?=
 =?us-ascii?Q?bREedLc6nCTZnqbDFfatCjhDp22DjLdprpliewaeuSj+SPQ6xOqdgc8BX9dz?=
 =?us-ascii?Q?wJt6XJw/BHa4L/Ok8RhzRTIvzFmnEJqeATQxLHa39/h4ly2k3c25CJsT31p3?=
 =?us-ascii?Q?aN8TCMNcltZpWcqFp2u/DFKarD5rJHVW2mpMr91czN/BujTb5v3bS8mvh8LP?=
 =?us-ascii?Q?ubm8GdKARU9TDwg9z8FcBnEzeHJRmi4x0oE9pokrA7k57OGYyv9RY25XUDos?=
 =?us-ascii?Q?n+sB1kRXYpWlOmOam8Sz/SNIrqrwH3OKY16vycQ0up2RK1KPlvvowe3FgVfD?=
 =?us-ascii?Q?LxqXG1Odm5LBBgefdTzGVHdXWxP7/VD1a1q5OYR5Kem6U5WIbtVcPEXPodYJ?=
 =?us-ascii?Q?JaVcSddW2q262tgN48eEqxC2AvTXMIc0tHTzsTF42RlRlUNkPbUQixeBqXEl?=
 =?us-ascii?Q?6abonMH8G4M+5gD002nLlkh6FeWpn90VbjwVwUFzsuUMLY9mVlUW1O+i0CoH?=
 =?us-ascii?Q?bTNY1YCzzmB71mfDZ/N4t3lN4SsfHxJMBBRFFP+Wl3Ssm8tz8RZ9znr9GiLb?=
 =?us-ascii?Q?56XDsK7qjAgV4un1jWbUm3H6qcOZ1GXXoOzFVelZywkNxgdm6WDOlZbwtL3R?=
 =?us-ascii?Q?AKNVqgZMklUMwweZHV2KZb7lUWAHdtjt8MgJw56VWtyKzNJ5mwrzRKG8pFIp?=
 =?us-ascii?Q?xhl/HHalEgUNuKxK7K0E7nM0eLbaBd2MmaEu3V+rouGrcmSlXPVXUX/7B7Ng?=
 =?us-ascii?Q?l00oznD5S10grhnr3NStG4W4c5GyKuwyLpJ19NnWD8rwr+xwqB8aIGFU9/fa?=
 =?us-ascii?Q?xINyNuQgA1OHdoLgayzMi4wy0wZJzngbu8YeCjIj2UuXr9AUcjjxh5TzdBWI?=
 =?us-ascii?Q?aQIYmB5BJXJzUVtUSUyZ56igN10sUgag4Adq1Q0uZ0cJEz2VohFvrihBbgph?=
 =?us-ascii?Q?kw6Pib3ho0DSM7l8BBGjUv2huJqy2D6gCFooKPD5sxYXO+oaVlRimDjerOBe?=
 =?us-ascii?Q?D6iwgYupMq74TpyH9f6r35QpwOTjatsq/JwEMxZztuY/giT8v0izWSqW9HqP?=
 =?us-ascii?Q?UUo37h4oTglrdaXEz2qzA0tFhpCCqG3AEsO8SvNQ?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB79863AB60BF4708554893076E5B7APH7PR11MB7986namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abeb51bf-bb02-43fe-b98b-08dbe776a744
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:08:20.0935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3jb6CIZ6AMFT+L7gewrAdn0mZZWoqdmqF1/DD0h6W/UG7HBlth+D8IzolTyUuhSFUbdK3IP+7V2PY2bzTTqEdIJSIdOdkLys/0gGNMy1ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
X-Proofpoint-GUID: N4q9WQftv-F9Fio_ZS0b4MLKzw1hEbck
X-Proofpoint-ORIG-GUID: LKr0TGz9toKRfZ5GDtijp-yadH_v5mcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311060001 definitions=main-2311170105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 14:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190850

--_000_PH7PR11MB79863AB60BF4708554893076E5B7APH7PR11MB7986namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Understood your point, will abide by your request.

Regards
Meenali
________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: 16 November 2023 22:02
To: Gupta, Meenali <Meenali.Gupta@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [oe-core][PATCH 4/5] avahi: fix CVE-2023-38472

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Please version properly your patches, this should have been v2.

Also please resend the whole series because now, I have to go and
cherry-pick patches from v1 because 5/5 doesn't apply standalone.

You hsould not push this work on the maintainers.

On 16/11/2023 11:44:50+0000, Meenali Gupta via lists.openembedded.org wrote=
:
> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> A vulnerability was found in Avahi. A reachable assertion exists
> in the avahi_rdata_parse() function.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2023-38472.patch          | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.=
patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index 9c903d6868..84eb1c554d 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -29,6 +29,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38469.patch \
>             file://CVE-2023-38470.patch \
>             file://CVE-2023-38471.patch \
> +           file://CVE-2023-38472.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/lathiat/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> new file mode 100644
> index 0000000000..a1de8e2a5a
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> @@ -0,0 +1,46 @@
> +From 8cf606779dc356768afc6b70e53f2808a9655143 Mon Sep 17 00:00:00 2001
> +From: Michal Sekletar <msekleta@redhat.com>
> +Date: Thu, 19 Oct 2023 17:36:44 +0200
> +Subject: [PATCH] avahi: core: make sure there is rdata to process before
> + parsing it
> +
> +Fixes #452
> +
> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024a=
e5749f4aeba03478e6391687c3c9c8dee40]
> +CVE: CVE-2023-38472
> +
> +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> +---
> + avahi-client/client-test.c      | 3 +++
> + avahi-daemon/dbus-entry-group.c | 2 +-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> +index 7d04a6a..57750a4 100644
> +--- a/avahi-client/client-test.c
> ++++ b/avahi-client/client-test.c
> +@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSE=
D char *argv[]) {
> +     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group,=
 AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NU=
LL, NULL, 80, "foo=3Dbar", NULL)));
> +     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVA=
HI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6=
));
> +
> ++    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVA=
HI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> ++    assert(error !=3D AVAHI_OK);
> ++
> +     avahi_entry_group_commit (group);
> +
> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_=
PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_ca=
llback, (char*) "omghai3u");
> +diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-g=
roup.c
> +index 4e879a5..aa23d4b 100644
> +--- a/avahi-daemon/dbus-entry-group.c
> ++++ b/avahi-daemon/dbus-entry-group.c
> +@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DB=
usConnection *c, DBusMessage
> +         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl)))
> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, =
NULL);
> +
> +-        if (avahi_rdata_parse (r, rdata, size) < 0) {
> ++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
> +             avahi_record_unref (r);
> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDA=
TA, NULL);
> +         }
> +--
> +2.40.0
> --
> 2.40.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190784): https://lists.openembedded.org/g/openembedde=
d-core/message/190784
> Mute This Topic: https://lists.openembedded.org/mt/102625030/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_PH7PR11MB79863AB60BF4708554893076E5B7APH7PR11MB7986namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Alexandre,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Understood your point, will abide by your request.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Meenali</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Sent:</b> 16 November 2023 22:02<br>
<b>To:</b> Gupta, Meenali &lt;Meenali.Gupta@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][PATCH 4/5] avahi: fix CVE-2023-38472</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Please version properly your patches, this should have been v2.<br>
<br>
Also please resend the whole series because now, I have to go and<br>
cherry-pick patches from v1 because 5/5 doesn't apply standalone.<br>
<br>
You hsould not push this work on the maintainers.<br>
<br>
On 16/11/2023 11:44:50+0000, Meenali Gupta via lists.openembedded.org wrote=
:<br>
&gt; From: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt;<br>
&gt; A vulnerability was found in Avahi. A reachable assertion exists<br>
&gt; in the avahi_rdata_parse() function.<br>
&gt;<br>
&gt; Signed-off-by: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-connectivity/avahi/avahi_0.8.bb&nbsp; |&nbsp; 1 +<b=
r>
&gt;&nbsp; .../avahi/files/CVE-2023-38472.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 46 +++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 47 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-202=
3-38472.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recip=
es-connectivity/avahi/avahi_0.8.bb<br>
&gt; index 9c903d6868..84eb1c554d 100644<br>
&gt; --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; @@ -29,6 +29,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}=
/avahi-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-38469.patch">file://CVE-2023-38469.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-38470.patch">file://CVE-2023-38470.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-38471.patch">file://CVE-2023-38471.patch</a> \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-38472.patch">file://CVE-2023-38472.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/lathiat/=
avahi/releases/">https://github.com/lathiat/avahi/releases/</a>&quot;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patc=
h b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a1de8e2a5a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
&gt; @@ -0,0 +1,46 @@<br>
&gt; +From 8cf606779dc356768afc6b70e53f2808a9655143 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michal Sekletar &lt;msekleta@redhat.com&gt;<br>
&gt; +Date: Thu, 19 Oct 2023 17:36:44 +0200<br>
&gt; +Subject: [PATCH] avahi: core: make sure there is rdata to process bef=
ore<br>
&gt; + parsing it<br>
&gt; +<br>
&gt; +Fixes #452<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/avah=
i/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40">https://github.com/lathi=
at/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40</a>]<br>
&gt; +CVE: CVE-2023-38472<br>
&gt; +<br>
&gt; +Signed-off-by: Meenali Gupta &lt;meenali.gupta@windriver.com&gt;<br>
&gt; +---<br>
&gt; + avahi-client/client-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt; + avahi-daemon/dbus-entry-group.c | 2 +-<br>
&gt; + 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c<=
br>
&gt; +index 7d04a6a..57750a4 100644<br>
&gt; +--- a/avahi-client/client-test.c<br>
&gt; ++++ b/avahi-client/client-test.c<br>
&gt; +@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UN=
USED char *argv[]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s\n&quot;, avahi_strerror(avah=
i_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &=
quot;Lathiat's Site&quot;, &quot;_http._tcp&quot;, NULL, NULL, 80, &quot;fo=
o=3Dbar&quot;, NULL)));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;add_record: %d\n&quot;, avahi_e=
ntry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot=
;TestX&quot;, 0x01, 0x10, 120, &quot;\5booya&quot;, 6));<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; error =3D avahi_entry_group_add_record (group, AV=
AHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120, &=
quot;&quot;, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(error !=3D AVAHI_OK);<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; avahi_entry_group_commit (group);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; domain =3D avahi_domain_browser_new (avahi, =
AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, =
avahi_domain_browser_callback, (char*) &quot;omghai3u&quot;);<br>
&gt; +diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entr=
y-group.c<br>
&gt; +index 4e879a5..aa23d4b 100644<br>
&gt; +--- a/avahi-daemon/dbus-entry-group.c<br>
&gt; ++++ b/avahi-daemon/dbus-entry-group.c<br>
&gt; +@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl=
(DBusConnection *c, DBusMessage<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(r =3D avahi_re=
cord_new_full (name, clazz, type, ttl)))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (avahi_rdata_parse (r,=
 rdata, size) &lt; 0) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!rdata || avahi_rdata=
_parse (r, rdata, size) &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; avahi_record_unref (r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt;<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#190784): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/190784">
https://lists.openembedded.org/g/openembedded-core/message/190784</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10262503=
0/3617179">
https://lists.openembedded.org/mt/102625030/3617179</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alexandre.bel=
loni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB79863AB60BF4708554893076E5B7APH7PR11MB7986namp_--

