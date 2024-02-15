Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54713C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 10:29:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11196.1707992971894070725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 02:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jZgrJsX0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27755079e7=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41F6KqWt004231
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-type:mime-version;
	 s=PPS06212021; bh=Bxk/2y3o3SMlMHikRcNOBGOjrWAUnUpnwWMrbvSfYEI=; b=
	jZgrJsX0zdApijHV3JvI0FOGerdqUpMdBXwg348Xls/ty58RN02k1t0tutyoppaV
	sKFP8/m0nsMW0dLQhPDSIvLuDhUC/9MURp6YQVX+ryn8SOtVvtdGsN8u6KwKRygc
	hKRWMBLsZOALWMUaWNwLroLMBno8XRCFKpv3BuKSSBqv5DcBspklyD8IuJZo/F8t
	uqZRFUM3T+z92J48vU4PnSNQpLTZWVI+FefuQ/n2golnR/0dWDFve9Ss19/TUTKZ
	ry2ZQvUz0Lfegy51XpSVlt6eUp7OB9qGeZWPTpcnM4qTQGkhkBEJDE1KI2U3s3Uk
	gg6rBA9gUGcgnoEGjg5lyw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxvph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:29:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8IWS5Xk7zncSjrjO6Asl0sfSnO606ZT5TIHt0Py+FK516zWEoNtG3n2sgi6v43gjcAUdtZZcsCtJFExl5LZ4jiWIo6UUF/YavssgI3mJ51hp3OfyrlRVdU6ULd61gkPPvLDa7ZuZZCpIzB5IglyeFn5X3Tob3lkZWaTakd3nWtsGppwdrCRJuSAjFIv3Kp2AZMK+WOPhQYg66GMI1nIBV1XpopTW/2KOyAAD35NRj1EpJTb4ZDdn4io4FNDCp3bO0gH1E8bxvJxoTeEQrpSOobh4bRb6FIs6EGzk9mDjWTDdXrbyfOSwAKtLBqoTyPIAWBWQkJ9mzi/g93YVNmKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxk/2y3o3SMlMHikRcNOBGOjrWAUnUpnwWMrbvSfYEI=;
 b=IUCSbRU317/kAjyNSDD3AKBBnvzll475UcmkJ6ARHgjxUX2hFIqvOar4GzmqtehroFl6rNTiXyd8hklmEqhD3EhyBSUK6OmJ4fINdHRQg8bZixVf4VanCqK+mqLJHprIMUthetMfn1chk53nEc98h3YIMSKuBe3XPpV9wMaQWDpHSw6cwsOzZAtxPfZxDP+J6F7eJm8JzWJk6tL5gERJRdH2HS2QAabZVuk+0+WWzySLviwgiuwFhQ9ElEqI8UX+n9D8vWZAM9uKpVDMG2nJniR9WGtZfrjlPAvrJU9efObwrTDXJ9KUFNoLJMKuD3D16YvlFugpfCjeVKlfujSjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 10:29:10 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::4b9b:ba01:a91c:c089]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::4b9b:ba01:a91c:c089%6]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 10:29:10 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>
Subject: gcc: Oe-selftest failures analysis - x86-64
Thread-Topic: gcc: Oe-selftest failures analysis - x86-64
Thread-Index: AQHaX/kaokuay5ACJ0SSAEZu03Y3Hg==
Date: Thu, 15 Feb 2024 10:29:10 +0000
Message-ID: 
 <PH0PR11MB565801BE2CF2136D644719F9EF4D2@PH0PR11MB5658.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|DS0PR11MB7407:EE_
x-ms-office365-filtering-correlation-id: 93db9787-2a70-45fe-4399-08dc2e10f29f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OjYaAMNm5Idjp0IFk1xZi2iJEWUckmslQdQE/RhVZwv5zJo3Tscc7XOxxMdWA+jOKE140ZMKcqMOFtV4P/VCSmlQ90xnsugl5c5QzZ8vc9XSpKtlVjVgqvdXuj1S4vjqc4ozjex1NnSVH5gcltIBPYkONlW1Pthtri876HU1L3/2nJeeeXeNZjxoYh5gU8VaCSth2E8lkE4IrTH2NG2SL+2nfV1cTY2yr/rurWvM6p3igV7UXdQkLzU73ka7w1DkxDeJ55LhxRrPM2E80gLQzA8J8CXVJvxa/Db2KWFVI+2QJwL4JdrhSpzthopXLvcuzIPU+V9Q/8+WtUsDFOBAHZQqoswzdcIc+YcFxdabTRh5kKLAim1rQ5cojBFA1xlLvf2MDYj77fmbgcLbu30wptBxY7S3B16Ja1WEnM2PU9f/WVqh+qYoFh0a+XhjBmY1sr4VyDDyynjOs77Cv7TmcHGwUkbRYl4kx7FHG2Lzs+ZaP4G2bpd5XnASIKALxHly+rXxMvODCPIsB8kKdXOlm/6GbEVEvTPVwM+y8UDildhZfX5ZwxrGI8tZLoLAlGhldEmcJIcxIzLquMbZXORhfB5DIiOhGw15YEj8IQC9onI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39850400004)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(7696005)(71200400001)(84970400001)(55016003)(19627405001)(86362001)(2906002)(5660300002)(41300700001)(52536014)(316002)(54906003)(33656002)(38100700002)(166002)(38070700009)(9686003)(76116006)(1015004)(478600001)(91956017)(966005)(6506007)(66446008)(4326008)(64756008)(66476007)(66556008)(8676002)(8936002)(6916009)(66946007)(83380400001)(122000001)(26005)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?B5ba6v5AxD24OyZ4Eq6SxhKF93BKXu4cJxaqxMeOoT6SuHfb6ZwsGviBY4?=
 =?iso-8859-1?Q?7iTJgym5kSbbndEEuU0ijxF6i48oWsoy2oQ7lPTsiStxM9Izgq4BYY9lIc?=
 =?iso-8859-1?Q?f0XJovj8UwL46xyjm9Vmm3rOTAeN91zrKw4nW/AEDpRz9mlH2cwkPsi7oR?=
 =?iso-8859-1?Q?Nbh/f2vweRljc/mZIdFrevovEUQ3i/QW5LY76Y6SXxuKitZRm8zFITTdwi?=
 =?iso-8859-1?Q?zUvoB7zAJKPpbGDVUFXFYZLJaCEP3F4B0NbuzO4Nh965XLCAEkSqHsI+OP?=
 =?iso-8859-1?Q?V8pZxPrClliL/cyfVu3Q8tZmrMMJNh+0DJNoK+537lMoWxILhTar6sMN+a?=
 =?iso-8859-1?Q?gxnb972GHKg87nSzAmdDxgzKba1cS2O4sh8WQTeWv9CqFplnwIQ/gopq6u?=
 =?iso-8859-1?Q?KCls4kyIfAW0pCJTm73IuokYNot5855yv7kUJAP+bUaU9oepjKglfIm4/x?=
 =?iso-8859-1?Q?qMNxFm02F321Q4OXaeNk59SGh1qHlqxELnZ6ZD8mPBGraxDKIZztIJpkhG?=
 =?iso-8859-1?Q?QocRU5M2pZZS1HQDOLQIMNbfQ3aLQphvxPkDiumrToC2u2/ZFdQeYPeZjV?=
 =?iso-8859-1?Q?BwavhX4rzxpEb1WqWTGH+NCuMbvA6GzORGTrjMMy3zCkiHolDi+9nFYxQO?=
 =?iso-8859-1?Q?Kc2UXqJc/bDhXumYBph1c7bwaoER6xVylrsbth5PW6L2l2TUpAe67TjnNh?=
 =?iso-8859-1?Q?fucDF4wZalvYaZsuvz5hD7FxZESomwTihqpeDch6JgsvOJ5s7xXJ+7c0ss?=
 =?iso-8859-1?Q?gEZ3HHEGUBglUuOFTbdKdJNqOCafFx/+qEPIdVyavPpvKxXv2oHPps/XM5?=
 =?iso-8859-1?Q?/oiqYcyHu2MKWDGq/gXE1xa600PTtsxxPt2UjAVw7sf/uqmCBYIWP6kj8u?=
 =?iso-8859-1?Q?dQY5AnzMoHrj4DCZ6bwd0eQoJY7IovI7hyKkyU6H936GhxbT09eyY6yFa2?=
 =?iso-8859-1?Q?qCxsJsZQ6jTObMwbir6bCZ6ibQMffeth4tqRSCZJL9M8qFvqbhsFGzag4H?=
 =?iso-8859-1?Q?N4d41iBwyhmosSu89tWIWY0JZCSJLmK+4Sm+RXJdiayUvcrkeXZisDZl38?=
 =?iso-8859-1?Q?6eBC64u0AK7IE04jaNLqO6Sg6bEvcTDeW55Fl/iT6hrzcCDq+vq4/DlAju?=
 =?iso-8859-1?Q?UwlzVVJ+IdQNExD2CdYvKqPb1zphSG6ydFvd+o0WJt2Kexb0qazjCTZXEQ?=
 =?iso-8859-1?Q?IYdS87LGtmf3eKqC07chTWKBUw7UM+AuWmixHJINp7zyrHgtAfJEGb50BF?=
 =?iso-8859-1?Q?ZuI5ni1KAB/QTI7prX+JntHnbBsbfjYRX2fL9zqHLtrxdpMS7X6RIx2bxX?=
 =?iso-8859-1?Q?vr7b9Kt7N6E4lG/f6buJpJnGUUDWfCdFWG5riWnZHkG5UQvBz9eujXR2JV?=
 =?iso-8859-1?Q?daiX9UePan4GsXJ6jOcG7uKhIrL/AsVXNeP9IeH6TYIaXu9jWwHbtHe8D8?=
 =?iso-8859-1?Q?wJGIMknqnzjBxqYC7HspFoewNTt2seQs8jSyAAQV9Hu2oMlHCFA6R7XVJl?=
 =?iso-8859-1?Q?0/CYYLZCbggS1f2eVHZsSGArwFWQ/zknLTKLvvd5AhwfZRG+0nHtSLmPxx?=
 =?iso-8859-1?Q?3vP6wrWBIFf8mWqMsnlZelEUDLHNx3pnnZbl6NnUvnzcnh63YuUWHlaJP3?=
 =?iso-8859-1?Q?oj3J4nqjIDqvzs0IvtuKiY7D/m9+32cmFapaWxIvgHbbM6EvVdMkDErQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB565801BE2CF2136D644719F9EF4D2PH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93db9787-2a70-45fe-4399-08dc2e10f29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 10:29:10.2351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlfQqC0l+cCMVfw32kdD8WZnko0jnYcbz+bWqifHSHCIuwBy+Vfi2A1EUK+RLz5a9uqQFg7DHXS0w7boiB52hDjxVssPSI+cfRm1Q6Cn26c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
X-Proofpoint-ORIG-GUID: bvcDsBsQ4mNB2zRQ_-mgWVkUOZ1RXjR0
X-Proofpoint-GUID: bvcDsBsQ4mNB2zRQ_-mgWVkUOZ1RXjR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 mlxlogscore=884 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195507

--_000_PH0PR11MB565801BE2CF2136D644719F9EF4D2PH0PR11MB5658namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,


We are analysing the test failures reported by the autobilder at https://au=
tobuilder.yocto.io/pub/non-release/20240204-3/testresults/qemux86-64-tc/tes=
tresults.json
The autobuilder result summary as follows:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
qemux86-64 PTest Result Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-----------------------------------------------------------------------
Recipe                       | Passed       | Failed    | Skipped  |
-----------------------------------------------------------------------
gcc                              | 124420       | 37        | 23809      |
gcc-g++                     | 196231       | 39        | 17314      |
gcc-libatomic         | 27                 | 1           | 27              =
|
gcc-libgomp            | 3407            | 16        | 1981         |
gcc-libitm                 |   24               | 1           | 24         =
     |
gcc-libstdc++-v3   | 9705            | 32        | 5464         |



We started with 'gcc.dg' module failures(13 failues, listed below) reported=
 in https://autobuilder.yocto.io/pub/non-release/20240204-3/testresults/tes=
tresult-report.txt.
    ptestresult.gcc.gcc.dg/analyzer/data-model-4.c (test for excess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O0  (test for e=
xcess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O1  (test for e=
xcess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O2  (test for e=
xcess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O2 -flto -fno-u=
se-linker-plugin -flto-partition=3Dnone  (test for excess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O3 -g  (test fo=
r excess errors)
    ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -Os  (test for e=
xcess errors)
    ptestresult.gcc.gcc.dg/pr56837.c scan-tree-dump-times optimized "memset=
 ..c, 68, 16384.;" 1
    ptestresult.gcc.gcc.dg/vect/vect-ifcvt-18.c scan-tree-dump vect "vector=
ized 3 loops"
    ptestresult.gcc.gcc.dg/vect/vect-simd-clone-10.c (test for excess error=
s)
    ptestresult.gcc.gcc.dg/vect/vect-simd-clone-16f.c scan-tree-dump-times =
vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
    ptestresult.gcc.gcc.dg/vect/vect-simd-clone-17f.c scan-tree-dump-times =
vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
    ptestresult.gcc.gcc.dg/vect/vect-simd-clone-18f.c scan-tree-dump-times =
vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2



Out of these, except 'gcc.gcc.dg/vect/vect-simd-clone-10.c' all others are =
fialed in gcc upstream.


We've analyzed the failed case 'vect-simd-clone-10.c' and find the root cau=
se, it is the bug is in gcc test suite.

GCC Bug raised - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899


We are working on other module failures (g++,libatomic...), keep you posted=
 here.


Thanks and Regards,
Harish sadineni

--_000_PH0PR11MB565801BE2CF2136D644719F9EF4D2PH0PR11MB5658namp_
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
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Hi =
all,</span></p>
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br=
>
</span></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
We are analysing the test failures reported by the autobilder at
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20240204-3/testresu=
lts/qemux86-64-tc/testresults.json" target=3D"_blank" id=3D"OWA20c75a83-e5e=
d-512c-6770-e6470c6d5e9b" class=3D"fui-Link ___1rxvrpe f2hkw1w f3rmtva f1ew=
tqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1hu3pq6 f11qmguv f1=
9f4twv f1tyq0we f1g0x7ka fhxju0i f1qch9an f1cnd47f fqv5qza f1vmzxwi f1o700a=
v f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fh=
gqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5z=
n moz-txt-link-freetext OWAAutoLink" title=3D"https://autobuilder.yocto.io/=
pub/non-release/20240204-3/testresults/qemux86-64-tc/testresults.json" rel=
=3D"noreferrer noopener" style=3D"margin-top: 0px; margin-bottom: 0px;">
https://autobuilder.yocto.io/pub/non-release/20240204-3/testresults/qemux86=
-64-tc/testresults.json</a><br>
The autobuilder result summary as follows:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
qemux86-64 PTest Result Summary<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-----------------------------------------------------------------------<br>
Recipe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Passed&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Failed&nbsp;&nbsp;&nbsp; | Skipped&nbsp=
; |<br>
-----------------------------------------------------------------------<br>
gcc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; | 124420&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 37&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 23809&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |<br>
gcc-g++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 196231&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | 39&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 173=
14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
gcc-libatomic&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 27&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 27&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
gcc-libgomp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 3407&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; | 16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
1981&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; |<br>
gcc-libitm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp; 24&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;| 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 24&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
gcc-libstdc++-v3&nbsp; &nbsp;| 9705&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5464&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |</span></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
&nbsp;</span></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
We started with 'gcc.dg' module failures(13 failues, listed below) reported=
 in
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20240204-3/testresu=
lts/testresult-report.txt." target=3D"_blank" id=3D"OWAd65f5ac5-34bf-48c2-7=
bfb-04e0b42bdcf9" class=3D"fui-Link ___1rxvrpe f2hkw1w f3rmtva f1ewtqcl fyi=
nd8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1hu3pq6 f11qmguv f19f4twv f=
1tyq0we f1g0x7ka fhxju0i f1qch9an f1cnd47f fqv5qza f1vmzxwi f1o700av f13mvf=
36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1=
olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-tx=
t-link-freetext OWAAutoLink" title=3D"https://autobuilder.yocto.io/pub/non-=
release/20240204-3/testresults/testresult-report.txt." rel=3D"noreferrer no=
opener" style=3D"margin-top: 0px; margin-bottom: 0px;">
https://autobuilder.yocto.io/pub/non-release/20240204-3/testresults/testres=
ult-report.txt.</a><br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/data-model-4.c (test for=
 excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -O0&nbsp; (test for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -O1&nbsp; (test for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -O2&nbsp; (test for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -O2 -flto -fno-use-linker-plugin -flto-partition=3Dnone&nbsp; (tes=
t for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -O3 -g&nbsp; (test for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c&nbs=
p;&nbsp; -Os&nbsp; (test for excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/pr56837.c scan-tree-dump-times op=
timized &quot;memset ..c, 68, 16384.;&quot; 1<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/vect/vect-ifcvt-18.c scan-tree-du=
mp vect &quot;vectorized 3 loops&quot;<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/vect/vect-simd-clone-10.c (test f=
or excess errors)<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/vect/vect-simd-clone-16f.c scan-t=
ree-dump-times vect &quot;[\\n\\r] [^\\n]* =3D foo\\.simdclone&quot; 2<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/vect/vect-simd-clone-17f.c scan-t=
ree-dump-times vect &quot;[\\n\\r] [^\\n]* =3D foo\\.simdclone&quot; 2<br>
&nbsp;&nbsp;&nbsp; ptestresult.gcc.gcc.dg/vect/vect-simd-clone-18f.c scan-t=
ree-dump-times vect &quot;[\\n\\r] [^\\n]* =3D foo\\.simdclone&quot; 2</spa=
n></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
&nbsp;</span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">Out of these, except 'gcc.gcc.dg/vect/vect-simd-cl=
one-10.c' all others are fialed in gcc
 upstream.</span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
We've analyzed the failed case 'vect-simd-clone-10.c' and find the root cau=
se, it is the bug is in gcc test suite.</span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">GCC Bug raised -
<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899" target=3D=
"_blank" id=3D"OWAae513d64-2fd8-4bcd-18e1-e3ac32880f28" class=3D"fui-Link _=
__1rxvrpe f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy56=
8 figsok6 f1hu3pq6 f11qmguv f19f4twv f1tyq0we f1g0x7ka fhxju0i f1qch9an f1c=
nd47f fqv5qza f1vmzxwi f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7=
 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1l=
qvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext OWAAutoLink" title=3D=
"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899" rel=3D"noreferrer n=
oopener" style=3D"margin-top: 0px; margin-bottom: 0px;">
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899</a></span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">We are working on other module failures (g++,libat=
omic...), keep you posted here.</span></p>
<p class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
Thanks and Regards,<br>
Harish sadineni</span></p>
</body>
</html>

--_000_PH0PR11MB565801BE2CF2136D644719F9EF4D2PH0PR11MB5658namp_--

