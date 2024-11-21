Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBB1D75BA5
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 03:05:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2587.1732158343425747471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 19:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105544ee82=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL2TwvF029913
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:05:43 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7w14r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:05:42 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AL35gU8016814
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:05:42 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7w14n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 19:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdDMwkWV7njHyEQWi0pyINvsdKxlZQari3zXQxZfNbdh0g8b06rKUvzvwotpS5I5GlHD5E15ZiiMdUf6qqOUnCF0LHfT1PoOcqmgHoZgrWGlsjSMyQFNbLeFPZrzu8gI3e8DM9eF8PnbRZ735Qz3St0c55DnnlrqNbC6AQsOL7ptJ2/KrCy4a1ktHmCMfDqsauCEMBTO5RT1qKGIfaGxgQB597Yo03TtiHZgr1TDBMaFMIJ97NjChVNZEK5F+oBNIVHB8bXx419phHdLUjxqAybu16MmjTlevxKNiI142Y94Ayg2iQO5HQLz9ZpmGZC+iuQE/vEl6Retlg7DuuCijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj3MoNdaEB4H0NHcKTLX6xf80uV3O8y74sJqDXzFOe8=;
 b=UsgYBuTUMPCApuy5avwGp+bN7L3si2yHbQciQ2GyFtVFrA6dNUzHIBcQqxwqC7GwhvX8DtkqszeN5cUMix3cyPnhssV3gg4baLTT7Ah6EZcUpBEVv3hejfbQ2/fJOqkLJBeZsjYlHd8T8LblbKSxlT+SWGHWrm0zoAe+zddxaIMVGvTrVVQXxZX5ylBfUcKzG5K/6gAgEEro4t++8YcDVHAsDFzKVIIlW9Pru5SkyKuwVDUSkhdGErGIFmcKbVRsOf8tmlrOKx5y7J0ABRjmQ+Bz8j4ptaBHEMmzCv/kSt6vW8h/KX2d8ZSkZItMG9mkKCM5hKO/uBQV8B46SyH0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB8668.namprd11.prod.outlook.com (2603:10b6:8:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Thu, 21 Nov
 2024 03:05:38 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 03:05:38 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>
Subject: Re: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant
 spdxid-hash symlinks to save inode on host
Thread-Topic: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant
 spdxid-hash symlinks to save inode on host
Thread-Index: AQHbOxAhe1HuoeYPJk6E9fAg8Y2YdrLAP00AgADKuz4=
Date: Thu, 21 Nov 2024 03:05:38 +0000
Message-ID: 
 <PH7PR11MB760898B3583343368546A10394222@PH7PR11MB7608.namprd11.prod.outlook.com>
References: <20241120055036.1002075-1-hongxu.jia@windriver.com>
 <Zz310kI3gqaIi7XE@bootlin-mathieu>
In-Reply-To: <Zz310kI3gqaIi7XE@bootlin-mathieu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7608:EE_|DS0PR11MB8668:EE_
x-ms-office365-filtering-correlation-id: 8b06ea7a-3dc0-41bf-8cf4-08dd09d9604b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8y8hwUXwV2p3BnUC2Kmg/BT5LEbV6ZAtziBzTAlcRTFsvw3qX9ExXR6E3UWr?=
 =?us-ascii?Q?SGBXbz94cpsCgnFwDG96LA+BDODmdQgdU1cNpsoNWVKnK67soa7c4AC6vEtP?=
 =?us-ascii?Q?gGf/uJvw07VwkX5w+HTOAVkTwHMZJlzNE+rEc6LiPNLVoR1jPz8TNw/D+35j?=
 =?us-ascii?Q?t9cJ/nyyLx3hNfMA57NXTNSVcjRRlD2e3qy+soT4YA40WfcVnvWhtCesXh3F?=
 =?us-ascii?Q?fpCD3zkJWCLqdQZ2C+GrChcRVYDBjRZvwiRJ8oWha3apXnXX5TIFnGVopX9w?=
 =?us-ascii?Q?rOlYPK4bG1AlQCBiuCZ8cbuu106glJrrheEszdp7kifSEUhdcUVXc9/WWLNL?=
 =?us-ascii?Q?3Fv31JsrjpFjzzVpFtldN0XbgWARp/nGvAx7CNEULjXZ5ZdREEVO1lAr0TyO?=
 =?us-ascii?Q?PY59IIbXKfGNpHVG+b6hOQuG+FzQZgIiKNPP35FeVJcn6GNjG6ke3QVc2VOo?=
 =?us-ascii?Q?tfdUVAq7cBebFlx7R9zFOIBoFijGluA+vHvhniqu3WnW9WwsPWBJKu/u9dRX?=
 =?us-ascii?Q?xCm5qTHDFIWH86wFd7Kn08jMsGszSHb49BejEZ3OwEj/tb3B8uACQEhQJU0E?=
 =?us-ascii?Q?bMAm8uFzzDT0qowJMuBp+5aADAggT6SKoEO//HvLCaOZbALByFEwDOas5TxV?=
 =?us-ascii?Q?9FCF889xc/AmcxmNitDo5GW2souYi4Qb7EQfcSQoiHGc4e1UZhWKckDVLAAc?=
 =?us-ascii?Q?BBEidNyQeF+eD7/zSpv10X78cThkvrytwm1YqQ0bDouoOKjNYtogpM2tc38Q?=
 =?us-ascii?Q?rs8Lon5vuHcMWy8QgbR+LU7dLYo3r+YW5ZaZW2Tve1CU2wNsPBzxDghSp4M/?=
 =?us-ascii?Q?QiHgHa6OP0uew1VuIyYpg8pf8bpasalxXTwfWT2e38heh+BBHBLF+HXYPZsF?=
 =?us-ascii?Q?FszYKrtD59ctenmy1qwyNOI1QuTU1fkEgRXNd+1UH2/QC1Ti0Nh/BwtI0dm+?=
 =?us-ascii?Q?2+sBR8bxrpUeM8whnnAF9yBvjkEqPrmOxLmC/EfK7VVpjwYXMUHzeCf5ebcW?=
 =?us-ascii?Q?3wRNaZ6cGQRDdrhvCKgm7dyxDA1re6uLUNEgIMY98esC0XyKMfR4DMnVgL2j?=
 =?us-ascii?Q?vH5iSLC68mrIIIkTqs0UPLb8DhuGNm+jAklkzP3JR7NH5j4ZAZUdcikwsOrs?=
 =?us-ascii?Q?FJqLcsR34ktYOGMkVf0nQRhhJ7ZkrhQ2bAfljWkofV7CXxqP2Nemmh6Eyuff?=
 =?us-ascii?Q?PKV2NBZakNyYIWok0oJL/ZpzlBEXQNh3f0CjzxtRz6giy1FW9J2VHmAB3k8C?=
 =?us-ascii?Q?BADCSGRWNgP3WVRpRctbD3s4HBgop06+iRbvmUE4nOMRwcOnymiDMWQdyOro?=
 =?us-ascii?Q?/2B3UAI/xFXi84z/MPJJeQiQ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GaVOcNFMcR+lN8LfRIxw6FZ0GjVBO/i+31Ccx+o/drG1dAW3CiBXAr8zLhoH?=
 =?us-ascii?Q?DqPc18iYnR3Q+E0WBMj27awtYIWm6fJlTu7YOwQRhaXLzNN2XMjRKSEz6Rou?=
 =?us-ascii?Q?L/94kCK+UYUMeGJtagmUrDlcdXJxnm20wi+McjBwsyLdVLl5kp6Nk88OwjWV?=
 =?us-ascii?Q?bXheHHpXT+ug/sOLTxivBVqSC9wfMuoGEGo3POgAA4datjOanosC7pzLULA0?=
 =?us-ascii?Q?ha2AjmmkmXYAxVBFmx76Rp51u/4eRsTXV9lDEvgwfBZjxH29Q6aZsRuXh5yp?=
 =?us-ascii?Q?9QlD/WemF0+YHJTnRdpC1HNybe6wXrXAK1URrlFOAenAhWUxjr9pkdG3wwEo?=
 =?us-ascii?Q?g4UNWrUy0Gt/0g7+mBwY3DDHVnHBZ4sIQ43ZWQ2feTt0UMg6ufNRv/l0k6T1?=
 =?us-ascii?Q?Y+wR7QvNEp95Bxy1NXzH9T9MG3bafwOUtNIrpGN6u1Ff/wVJeszyoyy80gU5?=
 =?us-ascii?Q?Jcq8tFTAkrun34GjCRJ2fFGiZOhsSd8UNkRQVzxEFCK/tRVIJGwlBf9YKAeh?=
 =?us-ascii?Q?vnQhUnLu+mybdTGHdupcTSGURBQ0VIk0MerQuN3rBba3QPMhhULj//VAD1eo?=
 =?us-ascii?Q?tjz1ZEhvH2PWDHg3/IQYAmDkVhL+nHYwzN2BWgHq9bBsMk0X9HZn6LIjFJ1R?=
 =?us-ascii?Q?uQGpMY/W9H/0nEckL1J1FJbA2Xy3bKTNs8bk7ACbyy7P30V6kh8oIeCw1lgg?=
 =?us-ascii?Q?v4xAewP1LZtK/gnx1tH06etg5RjBIqZK1XsZar1G5mp5bf8VjJjaGRwTzkhR?=
 =?us-ascii?Q?5rpOqxNbmj5nH6LweI3n7kA5sIHFgcSOUcCtoEidNipofU/YMS40URZzwtCp?=
 =?us-ascii?Q?Tz6Qchkq3r3o0jq3kHWozG87Sw2zVKb/xEWYROmf7LWFaD7JoUIBEoOhrYjq?=
 =?us-ascii?Q?83cK8L3ksCZX3I5iiP6FuWul0gpqmCObGw2CmJ8VU6Y+aP4svhLiz776D+4R?=
 =?us-ascii?Q?j8P3DX47GRgci1KL/o6PWG7FPPzuRJIRYkE0blWJkAPY3ztCZthrPETjaAyc?=
 =?us-ascii?Q?HMScqkUB92aPAHtPfzK3Cytfx70moUh7xINz0/zqOQjqeyPMSjlP6SvMS7bz?=
 =?us-ascii?Q?nkwo3yrDNgWj3lGkXinm98pGkwHoftnQjacUQD5gRA4QLirZXCttHLQnZLd5?=
 =?us-ascii?Q?1EShnqKjmQLeNkHmUcS8HVjOIz6GqXktF9gM8AFolj7WZUc0rNhhjfA6rCb3?=
 =?us-ascii?Q?5zDNa0f+fXimlrmeNEoHfwLTv8hlijymf4Mda+PFCnmh1oBU6nokDdETznBj?=
 =?us-ascii?Q?EV6/TGclQJJuN54z2BcC0f6ILiYma5l4raGc7W735ox61Z7k3ikgLWAN1CiC?=
 =?us-ascii?Q?Lsz+dU5XYwMDWdG4wuolseK2I8Oc6RsOegelkyh5hAlr6231r4pCGBeVpxNa?=
 =?us-ascii?Q?8x8aHLOeUAb0Z4+9+EpL8lt1AcemIKeYFWoPEfYZVpJ4erNt1zD04ikiV6dm?=
 =?us-ascii?Q?IWSE37JUgHqXWyH5CnGYvTwcVLV1BU04NylVSZXgFy9S+xXOXvmh5BUg23qW?=
 =?us-ascii?Q?yaQgnB6CabyOX81b16miUSy5v6FilqraeRBRiZw0FcOHdNrZKunQBL9Yv0T9?=
 =?us-ascii?Q?N2bDwtrqmy4LYYvUMCWFwyuuMUjIkIa1besJZuLO?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB760898B3583343368546A10394222PH7PR11MB7608namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b06ea7a-3dc0-41bf-8cf4-08dd09d9604b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 03:05:38.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xH/8SEi3Mnkm9ysf/56876le7EfdA2RUEs0NaRVtTLWZ9gms+TzUjpLGTMpvlMIERcXXoL4/XVEDN0ZumGmRE8FbKdi5wmp3slumgJCHAGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8668
X-Proofpoint-ORIG-GUID: mGM0lzktZnQffKwzSswgZNBq9pjmiGe8
X-Proofpoint-GUID: BNH_zo0mF-vNDpCuqdTiFLwHtJcqYP9z
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673ea386 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=1NXzIEW1abPgPPcUCjwA:9 a=CjuIK1q_8ugA:10 a=NVceAmN0WaSAmCRtL5cA:9 a=gqLrsan792s0mi_e:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_01,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207497

--_000_PH7PR11MB760898B3583343368546A10394222PH7PR11MB7608namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
From the error log, it seems you do not apply patch '[PATCH V2 1/3] sbom30/=
spdx30: add link prefix and name to namespace of spdxId and alias'

There are three patches for this review:
[PATCH V2 1/3] sbom30/spdx30: add link prefix and name to namespace of spdx=
Id and alias
[PATCH V2 2/3] sbom30.py: reduce redundant spdxid symlinks to save inode on=
 host
[PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source cases for core_image=
_minimal build

[...]
Exception: FileExistsError: [Errno 17] File exists: '../packages/python3-db=
usmock-dev.spdx.json' -> '/srv/pokybuild/yocto-worker/qemuppc-alt/build/bui=
ld/tmp/work/ppc7400-poky-linux/python3-dbusmock/0.32.2/spdx/3.0.1/runtime-d=
eploy/ppc7400/by-spdxid-link/python3-dbusmock.spdx.json'
[...]


As comparing, after applying the patches I my build, the link should have "=
package" prefix and "-dev" suffix, runtime-deploy/core2-64/by-spdxid-link/p=
ackage-python3-dbusmock-dev.spdx.json -> ../packages/python3-dbusmock-dev.s=
pdx.json
//Hongxu






________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, November 20, 2024 10:44 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; JPEWhacker@gmail.com <JPEWhacker@gmail.com>; Jia, Hongxu <Hon=
gxu.Jia@windriver.com>
Subject: Re: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant spdxid=
-hash symlinks to save inode on host

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue, Nov 19, 2024 at 09:50:33PM -0800, hongxu via lists.openembedded.org=
 wrote:
> Summary: SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode on=
 host
>

Hi,

Thanks for the v2, but I believe this is causing some issues on the
autobuilder:

ERROR: python3-dbusmock-0.32.2-r0 do_create_package_spdx: Error executing a=
 python function in exec_func_python() autogenerated:
The stack trace of python calls that resulted in this exception/failure was=
:
[...]
Exception: FileExistsError: [Errno 17] File exists: '../packages/python3-db=
usmock-dev.spdx.json' -> '/srv/pokybuild/yocto-worker/qemuppc-alt/build/bui=
ld/tmp/work/ppc7400-poky-linux/python3-dbusmock/0.32.2/spdx/3.0.1/runtime-d=
eploy/ppc7400/by-spdxid-link/python3-dbusmock.spdx.json'

And same kind of error for several packages, on most of the builders.

https://valkyrie.yoctoproject.org/#/builders/64/builds/408/steps/12/logs/st=
dio

Can you have a look at this, please ?

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_PH7PR11MB760898B3583343368546A10394222PH7PR11MB7608namp_
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
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
From the error log, it seems you do not apply<b>&nbsp;patch '[PATCH V2 1/3]=
 sbom30/spdx30: add link prefix and name to namespace of spdxId and alias'<=
/b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
There are three patches for this review:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
[PATCH V2 1/3] sbom30/spdx30: add link prefix and name to namespace of spdx=
Id and alias
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
[PATCH V2 2/3] sbom30.py: reduce redundant spdxid symlinks to save inode on=
 host </div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
[PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source cases for core_image=
_minimal build</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[...]<br>
Exception: FileExistsError: [Errno 17] File exists: '../packages/python3-db=
usmock-dev.spdx.json' -&gt; '/srv/pokybuild/yocto-worker/qemuppc-alt/build/=
build/tmp/work/ppc7400-poky-linux/python3-dbusmock/0.32.2/spdx/3.0.1/runtim=
e-deploy/ppc7400/by-spdxid-link/python3-dbusmock.spdx.json'</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[...]</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
As comparing, after applying the patches I my build, the link should have &=
quot;package&quot; prefix and &quot;-dev&quot; suffix,
<b>runtime-deploy/core2-64/by-spdxid-link/</b><span style=3D"color: rgb(237=
, 92, 87);"><b>package-</b></span><b>python3-dbusmock</b><span style=3D"col=
or: rgb(237, 92, 87);"><b>-dev</b></span><b>.spdx.json -&gt; ../packages/py=
thon3-dbusmock-dev.spdx.json</b></div>
<table>
<tbody>
<tr>
<td style=3D"width: 101.417px; height: 60px;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
//Hongxu<br>
</div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Wednesday, November 20, 2024 10:44 PM<br>
<b>To:</b> Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; JPEWhacker@gmail.com &lt;JPEWhacker@gmail.com&gt=
;; Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant=
 spdxid-hash symlinks to save inode on host</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, Nov 19, 2024 at 09:50:33PM -0800, hongxu via lists.openembedded.org=
 wrote:<br>
&gt; Summary: SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode=
 on host<br>
&gt;<br>
<br>
Hi,<br>
<br>
Thanks for the v2, but I believe this is causing some issues on the<br>
autobuilder:<br>
<br>
ERROR: python3-dbusmock-0.32.2-r0 do_create_package_spdx: Error executing a=
 python function in exec_func_python() autogenerated:<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
[...]<br>
Exception: FileExistsError: [Errno 17] File exists: '../packages/python3-db=
usmock-dev.spdx.json' -&gt; '/srv/pokybuild/yocto-worker/qemuppc-alt/build/=
build/tmp/work/ppc7400-poky-linux/python3-dbusmock/0.32.2/spdx/3.0.1/runtim=
e-deploy/ppc7400/by-spdxid-link/python3-dbusmock.spdx.json'<br>
<br>
And same kind of error for several packages, on most of the builders.<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/64/builds/408/steps=
/12/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/64/builds/408/=
steps/12/logs/stdio</a><br>
<br>
Can you have a look at this, please ?<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB760898B3583343368546A10394222PH7PR11MB7608namp_--

