Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DE0C04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 02:57:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6202.1691031467364612859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 19:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jVV2oTCV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7579963e98=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3732raYD018703
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 19:57:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=E8wnhKp8OCLLQP9W5mxF53cAp9ueU5Z6OAFe1hwoyxw=; b=
	jVV2oTCVjczQF47/sUmry5vj1RFMZhYqfETaSWxTXajQumOMZ1ofqfGDYd5Niy/h
	LlOaZxqz5mXXemKIBZJctWmT7ch9YPtwzGtwdIsYIWTS58xbwDMIU4yYuZ4w9Rdn
	1mszxFRC+Pj4Zoiz4S1u9qKRYHVNW7NsApTZyPu2yI8scBcQVngIkhi+b/PqWKfg
	iUg7Q6liHb02+/L6KNrQqz+7JVF7+2NHbuzsUbyza48SbncaK6NEHPeFsBxY574v
	jVksPO95ckBLhhtVJBlAMGuSs16aHsnbMjpP+odyzlGYTlPH2ru2FYU0PHx6l6PZ
	XADCeTyK6SexxFUdscyVEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqtrwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 19:57:46 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3732t7Hw020826
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 19:57:46 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqtrwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 19:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnpXPuR3Tp2JcuCcH+k/hgB4Egg0stVWl4cZYYx3wZgsHQL96rEbfqu3EjxLFxGD4mBE6tsYuo6H8M8y3aBckuYD3vsYXOjPblpTyMXUQ4v7Ri7QdBbAmrbMahx35t07cHveQ7jc/r7YHf7pVXLJIpuHRmU/gbH70B5dBWHcuX3heA95z0tDMBmAq2+UNoLkFBJxqUZ9+40ysbjikmy/2CKYjdiMdqv4DEkLKFu+g5swL1vEcg8UwVyPID+vqWaRWlX2eh3FCkypTJ3pROLxVqvyG3V78vOyatAG4rXh9DLJSCercD+mT8QGOEtKjeQrgbpGyPPz3HEY++xCyLfGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8wnhKp8OCLLQP9W5mxF53cAp9ueU5Z6OAFe1hwoyxw=;
 b=VbS8lxEbUUIXQYvLyrbIaQH0VG3Q6tFY4fe3EcwU5of0B7RD7m82e5a6DD/PmEfHu46jy7Ubj1d9xMOUCHX/t3/spp8mu/bzgw2j7Q+CqjNeariiO1ZPOJA9rmP1Q7zugca4KQbt726Lnk7SA7DZopiJrgI279dVVPjxQr3KJfgsik3Ef/TCUVr8ilN5ed5eb0Yn/RZZvfg/pLovjcl4M0nSzySuzVSWSabw6v79CaAGw/m+kFdt8j6JUE+CyljPly28jAy0pNAqmCakdiAhpstJ1y11cjB9NC+441tTizxu2RNIoWjnJjUv18zY+gVHQdcqWrATol+yObQeSBkUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 02:57:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 02:57:41 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Julien Stephan <jstephan@baylibre.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
Thread-Topic: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
Thread-Index: AQHZxU0YD1DHP6R9qUqeiReV8sGu8K/X4Wng
Date: Thu, 3 Aug 2023 02:57:41 +0000
Message-ID: 
 <CO6PR11MB5602AC59B4BC790DF4D954DBED08A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
In-Reply-To: <20230802142432.2296716-1-jstephan@baylibre.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH0PR11MB4773:EE_
x-ms-office365-filtering-correlation-id: 945db1c8-5627-491b-7765-08db93cd675e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vU0fgIMq7AxJB8dI6u5jwHipToVcfBlEJBzFi8crmGC8TW76xwd6/7Noy+1Z9R8DZmF14g9ssZP+jt01pj0Y+l2agx/g3wnX4LJPpIECu3D3JOh9iwGIEsytKhBtPAM7oX2N7HuryclU9WAbI1dntr/aQgqD9zmCY3LC11KCjVvSnO5aqQIzvjUqEn9R4neoVnw3s4sPXAu2f3ZYKub1ESHmFEccFgxhGvwlUcVTBWhEAhX+NjIAKIGuJuAPTqiPu+CN8zELLVtYVySQijZWSDUDmds5ttOTJ7Rj75vU8RXyqNPdu6ItecniuSa/KQWKXACiLafRtCSQbknN204W5Cf9RRREOZer8FD/noL0Fn6SnAAF12Ao3xw535E+ZSY850gDn0F1hfPrScWsyljz7zbRE0F9kYnVMWZi4lgRbo7jQkKfAJYbjE+9sDF7Mj/Y+XpbPvU6Pli519IwQBgSWR3teB8ulqWEFxOFlBJhUuPxXbOQhVB/wLOqvqEk++btvNIy0Tua5VtDSZvR3kF7Mrs4nSN9PZqn8y5KIu8I3AlMQYrBUtAgL5orc+gluTFar6/byRB7FcG5wY7fG0Tco0dH3dUlf6o8hTP3ynB0xgwL9GBiEzcrKsw84RJ7y9f3Y5a/Lw0dAqnAdnIs6RD64A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(451199021)(53546011)(6506007)(26005)(186003)(83380400001)(316002)(76116006)(2906002)(66946007)(64756008)(66446008)(66476007)(66556008)(5660300002)(52536014)(41300700001)(8676002)(8936002)(7696005)(71200400001)(966005)(9686003)(478600001)(110136005)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NW+Zqp03yeeiGFGNC2DIz7ORLLRhpqS65g4Nfa9S8fr/VIrcc3y9p4pitT+a?=
 =?us-ascii?Q?C2d6bk7Uqu2TBSp91XHWFDtEnroumqaHjoFVFb72d/Xce5bxwD/o68w8Lxdm?=
 =?us-ascii?Q?xg4cFWJcvbUNlAwQh7InLki3KAPTa93PO2q4ea1jG4UE06uvwtx4/VKt2J4b?=
 =?us-ascii?Q?R8FRS91LTP70OhWrjvlZoddXOfA7gbpZVMf5C6fOfMhp+75d2OgK3H6ofpEs?=
 =?us-ascii?Q?V/7xHhVKtYm47Zrycqy5PxHXaX8uGN5sO7ELGyR4zbIfgEreqaKP1CHOaGXQ?=
 =?us-ascii?Q?pN/uPgQF+BBFAqCLTNWTIJU4t+Sl9ILcddWRMJtMXdkB4YqvJOE8xRkVRgsF?=
 =?us-ascii?Q?8CMuT5md8gBvP+YDz0Z+fvWOf+Rj47Ygww82YZmHfiMQTzcG8BIhEiDpg3Zw?=
 =?us-ascii?Q?9vc5rmI63R8aiANIa8NPuklIcwtSch6MoKqcKSLWCZIbr2IEFtwkIuKwMlnp?=
 =?us-ascii?Q?9vu4xltYuq4J5kEFI8hsqG+Co8AeoR7m9nvztkcVcCFnTkXH5kAzq8k2FLqR?=
 =?us-ascii?Q?k3ij15fl9jdsGFssCMLYbWRyF1CQfndCdCT0g18MgqI/dFab+ZviIPRXbOQS?=
 =?us-ascii?Q?5OEqFNOSXNwLAkkCSm4D/pkLZBH3D+MEX3dGcJgYP6HtGsK9W7IXEgvmhis7?=
 =?us-ascii?Q?BFjxEQCP+lK/DokkwUfAoSuEf6gnMWI9+gRkpZ2aN2v50w32/F/9jaivA2sR?=
 =?us-ascii?Q?l0rs7tZ4ZMVMUjzB4+0+1AqlTHOlXo+a01VRjqKWNmvAfgzH87mvzwRxnPGj?=
 =?us-ascii?Q?MaXoAc131OZVgGxMSV+dURbOB8aPQvU2c4ZCynJ2QdBefEfbvSJf8WEfjrYE?=
 =?us-ascii?Q?cfQM0vg5Z3+SaXRJcWlywUC6vLRFnBiO+QFxp7ZVPLZgHQp8P6M22twfiB8a?=
 =?us-ascii?Q?tRnFHIl/P7JAnEqLakguTEfdcdQjEyKAIyrrScbpW3GNN1029MfG5RSmKE98?=
 =?us-ascii?Q?8KidLOtinyjfHmYtikGO5jG8Padcf3SF80m2KN0+TVtzaC2HIRTW5K04lPg0?=
 =?us-ascii?Q?Hi+/sXNohVBNQ/joPyAR7bB/qLbs5TQeRJpMupbBAop3ae39dAV4avLSyOUu?=
 =?us-ascii?Q?K/wr8iPiDHNeTifRamE/CBZs8GU3aPFAO3w/mIOltgOMoXds9Tmgzmsq+KKD?=
 =?us-ascii?Q?t6ajw+Pdr2o1B0yYOdUsdSa0UwGFRm4AAczxaSpmHGobni9KRMk+4QdcrFCT?=
 =?us-ascii?Q?UMECDkAP8HSS58B1EJMQr3w7NpHuqcUAWBu9KJdR8ViavaaWpTktna8aQLfW?=
 =?us-ascii?Q?slyWZomMSBAfOEy3Xo7aRi34lgsmXuxnVWRrysdcuAsr0n+zSHutZXaMzguN?=
 =?us-ascii?Q?qSkMUvUxZbzdUbVRlExJUtc9Gsw+rAl/9CN78qmof7/QdISfa7itp45nlYJt?=
 =?us-ascii?Q?4znur+QEecJdXvoCnq1RfXNdJF2lDkeor2jYhAxR1TxnS98IFZ2SMbx8SNRL?=
 =?us-ascii?Q?KUNpDl2NhQitmSUKydTcpt/wvcFi7nIWna9leipFA/dw9KeJhIHtKKo9kpYD?=
 =?us-ascii?Q?N/umJJfwytMUCoO+zpWPvNl8XGePjTG6yAJ0O40etplU6OrIYtGtBh25kwSW?=
 =?us-ascii?Q?T6HsELybnzcajDS5bXG34qmnfDoApJL0InTeI14u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945db1c8-5627-491b-7765-08db93cd675e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 02:57:41.4366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5bqRmgn66o3LOYqz/IIVdxZqop9djiE6zL0TPOMm150J99NxEqA9HpMKulwE8roH+GbaXmXyqa7JS7pKe/tZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
X-Proofpoint-ORIG-GUID: tzoie66ofWDPlU1aIGBxJxKXl4OQUbY6
X-Proofpoint-GUID: wIGj6Z976kdNvtdupUSgXckqjegzI_Da
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 02:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185449

When ' include conf/bblock.conf' line can be more flexibly added to/removed=
 from local.conf, is there some specific reason why we should put it in bit=
bake.conf by default?

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Julien Stephan
Sent: Wednesday, August 2, 2023 10:24 PM
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core] [PATCH v4 0/5] Add bblock helper scripts

Hi all,

This is v4 for bblock script.

Improvement from v3:
* Add self test
* Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows t=
o
  display a Note when recipe contains locked task(s)

Limitations:
* Silently does nothing if given task doesn't exist
* Silently does nothing when resetting a recipe that doesn't exist

Improvement from v2:
* Add a function in bb.cooker to compute task signatures
* Replace the findSigInfo function by the new created one. This has the
  following advantages:
    * findSigInfo needs the task to be already built to get the siginfo
      file, meaning we cannot lock a recipe on a fresh build
    * we can now generate the signatures for all available task of a given
      recipe
* Check if a given task is already locked. If so, don't duplicate
  entry in bblock.conf

Limitations:
* Needs to taint tasks that are locked, to display a warning
* I may be still missing some checks on user input
* Silently does nothing if given task doesn't exist
* Silently does nothing when resetting a recipe that doesn't exist

I did some tests using qemux86-64 and qemuarm but I may be missing some cor=
ner cases.

Improvement from V1:
* Signatures are now package architecture specific meaning that if you
  switch MACHINE, the lock sig will not be taken into account
* I added the -r option to unlock recipes
* I added a -d option to display the current bblock.conf
* Added an include directive for conf/bblock.conf inside bitbake.conf
* Added -t option to specify the tasks to lock/unlock

Limitations:
* I may be still missing some checks on user input
* I need to find a way to get the list of tasks ( by default still lock
  only the do_compile for now, unless -t is specified)
* Do not check if a particular recipe/task is already locked when trying
  to add lock. So entries may appear multiple times
* We still need the signature of the tasks to be already computed before
  locking. Need to find a way to generate it if missing

V3: https://lists.openembedded.org/g/openembedded-core/message/184932
V2: https://lists.openembedded.org/g/openembedded-core/message/184697
V1: https://lists.openembedded.org/g/openembedded-core/message/184584

My branch is available here [1]

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/commit/?h=3Djstephan/bblock
Julien Stephan (5):
  bitbake.conf: include bblock.conf
  bitbake: cooker: add a new function to retrieve task signatures
  sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
  scripts/bblock: add a script to lock/unlock recipes
  oeqa/selftest/bblock: add self test for bblock tool

 bitbake/lib/bb/command.py              |   6 +
 bitbake/lib/bb/cooker.py               |  16 +++
 bitbake/lib/bb/event.py                |   8 ++
 meta/conf/bitbake.conf                 |   1 +
 meta/lib/oe/sstatesig.py               |  13 +-
 meta/lib/oeqa/selftest/cases/bblock.py | 146 ++++++++++++++++++++
 scripts/bblock                         | 182 +++++++++++++++++++++++++
 7 files changed, 371 insertions(+), 1 deletion(-)  create mode 100644 meta=
/lib/oeqa/selftest/cases/bblock.py
 create mode 100755 scripts/bblock

--
2.41.0

