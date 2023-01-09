Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBCDC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:02:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.67074.1673254946264853324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=dTV9WiIl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0373bec93a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3098MaWZ022079
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jan 2023 01:02:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qCsxkn01SOFEzDh428jzHiGTozn77j+UInAPcpn2zl0=;
 b=dTV9WiIlOB+Er9EaYJ4pPGnAgxgy6/tMo6+7PerjvDX7IrGvK23mBN3fm2E5GDgqc5iT
 tbcWFBb414WbCvOt03ZO5gh9mkahCbyhjJnFF1EwjsBXQQ1Aqvfd7udjZFMmW+USr0j0
 jyaxiVJDh7Px7+URfEwF7hvvbXHloSsJtajdPRyuMep04nHewgo3V85+JDstHMHO2DxE
 gX+9Rs7bh4VCywUbZe3LGQlD+Du97Q+a284it+cq1oEHHcjgEWosy5+o8OVWRZQLdbg1
 +EZQpHPpOSaevrTpYaGwMRMDm3QtUoAke+aBbWVF7suHYIWVFHqBuF13jEnDafUs8RF4 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8shvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:02:25 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30992PDX019444
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jan 2023 01:02:25 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8shvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 01:02:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk4/FyyD2+NBoF7HP8u6MZHBcPVC5x0weUpwJk2Uaiq7col8SNk4pjR+Tk7YTEUrt60x7SrUqQaPyCOvtVNoQeWw8SO1SkIxOQpJTnXnubABdOHtJsZnQAalEjEzwg3SE3g1wdupqny7SPMkL57R44nEhI8f3L9/s+odhFfiLMYDV++HAQbCKfKkgmxRhPVctg75/YQxSfrk4zXYXR2LD78b7ZHMbW6j9U0AWRPPLpdiC1BbxCANGzsl5473JuJ5PoG7syEJcRhbC4N1WS+fTuOMRpqarGbqsCheaGjeuSDiIFWXFoIJJG8HGBJEc+AjzDJW8KAFKZ4DVNeKnG0Mow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCsxkn01SOFEzDh428jzHiGTozn77j+UInAPcpn2zl0=;
 b=T3dRco9g/i616CL7HDCs7s7N92SmcboqeoeoZ2dgUoKSu2N1M5ocILRhCyMQIFe9kfLwoj6Vi9n9WJ2OyoPET6pNqnbBucjdF2EqllaE0Xk0HdMp7dwMeYJvHN6rZkoFgUZsGYHbKEdG4+MeaBJrIcl41NTN5oc8BdYkf1pWwN/1BJS8qEmVsRDOa9/OywKNzrxP92lnnVU2HxPGu3MOmunyIhHaFcd8EpJttmzUvUk1akpNx8dnFQKrKXfzDfpk+FFxrR24U8qCR5Trowr04muw2TjIZgNNo90wb1Hjrbw/dl6eJxTDD3DBVPxsBIuMbVMOMSOWtcoYN+z9OK8abA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 09:02:21 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:02:21 +0000
Message-ID: <44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
Date: Mon, 9 Jan 2023 17:02:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
 <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:3:18::30) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: a7adf6c5-351f-4f29-fae3-08daf22037b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sy6E6HtBq6jlwrWinXYP6/l/4e+UmXfOsaNHx4Mvs8n+NjchzwSYFKEar+drmo295gS8tEBnKf+sr+c2ZwbBKsatgSVZq6/FOM7C29DIXtHC0P5bzB5M7v7iLnQA2AWVEvCooYajvfDXkJ1BOU+aN8JCoSiEUyPRo0haD5OqaXGKv2Zq0cCT0+Pfs/I5ZEGhHOdjuXfe1TSg9wmxr3mzy7P0/ks1Qs8NvMseTiV1aFuAnlyttY69vOe3DgMOF04Kccpjl+Hh/Ty1qt5SCU9SWSdMDXjLSa0mqfhYFpMVEqGC0AUsY0ewhtuBMsbpElWlPN0eQlgKT4Yk6Z9wP4ZSZMIMmLrYCCUjk14b6e15DelsAWX98rMlpnlEPWH13VSlz0EHFLkhtv495L6TGX4t8leIOtTVPG6cIo1DO8+h4bLt/r93cLmIejNBy5VU5m52dCJ1uVrTghgfBDEZdfZDIoFZENaRBEIPznJsNr8TyJcfkBsh5nceN+jrv7WO9oRuv8EAyWwg+dkCrfAtP3iQnlRr5450Bg3Dd4uVb2iRXogPMg2DaeZHjhwRoOHxrPjtf4OJJZxLZIrYb/NjJLkq4w2jVz7UxSccC0/8NVQ2x4OD5+yEqqp71iNoT9kY27gbZ4yaAinz0K4thij1xliJSp4lCB3bixJcIEo+oPGkS4wY8MiZu0cv9q+ljbP15u1wOzuYrEGaa+8b02QAeEv6o6eGkIJ+I8Q6/Cg8h8n/gosVDqopI6sQvinCq8dWeQCnRw6WAzz3UGkNgh3mpoHTysezthmaGbOGPQW6UU6orec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(451199015)(53546011)(2906002)(66899015)(6506007)(6486002)(966005)(478600001)(6666004)(186003)(6512007)(26005)(31686004)(110136005)(316002)(2616005)(8676002)(36756003)(66556008)(66476007)(66946007)(4326008)(41300700001)(8936002)(5660300002)(38100700002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1h2ajloOW5YKzhoS1ZiRzJndWJUaDBLaXRqQ1p2SUlodjd5R0xjT3lsTDIw?=
 =?utf-8?B?TWpOdkVuejJ0S0txaXRrcFljL2JRNWxaUUhzbUs2Y2NTT2NWaE9IY002U0xG?=
 =?utf-8?B?WmZTZERwakYvUWZSellUd2R0UlI3cjB2QnNYcEhBNXZtV3VjN1NQY2pzRDNp?=
 =?utf-8?B?dHhEODJGcU95b3VCdDZwVyt1c3lSK0NBU1VCREphb1k4SC9PdnpqN3NqaWFZ?=
 =?utf-8?B?Vy9reEx5NTJmZzJtQU56d2NWNm50dzFBZHlWUVNLNGhQaks0LzBUWi9YYzBE?=
 =?utf-8?B?UWFXNjUwRnlvdjVqU1I4MVl4TkVZeXhNMGEvZGhZS0hOQTByTWVVNTlpWk03?=
 =?utf-8?B?ZWNkN2d3UEtQTnlUQ0E0NE5wYWNhMjFoalRLd1hCU1RpNUxRcEV4SnFvSHhy?=
 =?utf-8?B?YmYrVEFJZWFqQ052MXQwOVd3eVd3blZjMHY4NnI3V0h4c0Q1NGhZQU9vb0lR?=
 =?utf-8?B?bG5BenM1M3h4M3pLaG5zNTlLUk13UzF0OWVnbkVqVzFnSkdETU9WMXdKUXRO?=
 =?utf-8?B?STJtOTY1UVY4SHdaR1pJeitkb29Zd1h1NXRNY0htamYyeWhzUTJaV2tKZmVp?=
 =?utf-8?B?MVdBUC9iN0VjaFB0OHVud09xV2VjTVZSeHlOWlNQL2FaVUZSUjFYaGFtTG5j?=
 =?utf-8?B?MEwrempiNW1qWEN5UXBlRk5pckJKYlg5bXVaREpjY25rMXIzTXlFb3hRR214?=
 =?utf-8?B?SEpwdGxVak4xMG9YUHJONTVyb2Rucm50bDBCVnc3d202ekdtTEpYZGlzZ3Vu?=
 =?utf-8?B?THBCOWJXVFplZkhwaWw4UElnc0x1Nm9TNWRuYmVDR0VaOEw3MFptZjJscjVU?=
 =?utf-8?B?QjZKWUZWTmNCeHRhdmU5QkxmSFZtY1IrWk05THRXKzRzekxJclZvdUhFdy9Z?=
 =?utf-8?B?enJlVWRucXhMMUUxWFo2cnFtZHFxRXA3ZDdYT3UyQVZWa3NtSTRyZWxrMk4y?=
 =?utf-8?B?aDNKTVZ4NjVWS0Vtb1ZXMUxJOGtYVkhnVTVyenNlRWJrVWlMMEN6L0NEQWt1?=
 =?utf-8?B?aFM5U3ZBWVEwUkhzY0wxdXFKaUp5Y3RuQWtYZjd3UzFXRlM0K2lyLytoUTdJ?=
 =?utf-8?B?RU5DaVNVSkRsNzFQR1NSVGh5UXRGem5JeTcxMVBReUJiMUQ4b05TWVk4RVM5?=
 =?utf-8?B?endaNENvSlpPbDVlQVY1eDVLdUw1ZnRiOTYrT21Ta21lTVB2UlhyZ0RSV0Jj?=
 =?utf-8?B?RTBZcXp5OXVJQUI0RTJGd2dKTW5yR01wWTl2VFZnci9MZlY2bVVyZnJKS2Js?=
 =?utf-8?B?K291ME1RTHJqY3VGQ2ZMUE0zMUplN1gvcm9rdC9tM3dTUVFIbDF6OTNWY2ty?=
 =?utf-8?B?QUgzS3lXK3JjcnZrYzR6YTFGQjhVN2hvajJIckxMTndyNnhUMmR1ZituRElO?=
 =?utf-8?B?SFpmZTdIWENJZ3grTG9ua1Q5eFJvTjNiZEFGOTNlTkJwL2NiaG5YUCttR1RZ?=
 =?utf-8?B?SC9Vb1BPaFlsaks2ZDdZMnRMbVB0QXVYRy81RXkvRW00VTFPVUFwWjJ3NVRp?=
 =?utf-8?B?b2s4MDNDYmxoMnRTZU1Ba0EzTzVuZEhDZjZ5dUpOUXB0R2ovVGdabXc1NVF5?=
 =?utf-8?B?ZVp6eUVZTHB6UkZ6bngzZDU5c1RYT1oxZXhXL3dpUTNlRkVnem9yRk5pK0ZI?=
 =?utf-8?B?MzNobmhlTHZLeUVxaXhXejJjSDZiMWhoNmJ3N1JrNUt3NkRYdENQMEZNMlhw?=
 =?utf-8?B?b3VDK1J3SkhUTnBxVjRQVm1vZEtvMCtORyszZ3dhWVdHb1F2bmJrWkhUZktB?=
 =?utf-8?B?bG9IYVROMjhudUxqQzU5UWRCODNVSkVaOUNQK3pwMCtRMzU5YXJSNDZzSW44?=
 =?utf-8?B?a2NmMkNxZU93Tm5kclBHcU9FemVjK012M0w2cVlwellCK1ptaloydnBGUmNh?=
 =?utf-8?B?SVFXdXdmUFZJdnVMWDJKN3dFaDNWSTdZVER3ZXNPYXJRTTdoQ05RTTdTN1lN?=
 =?utf-8?B?YW96MzVWTUdLWUhPaGcrazVvUm5tenltdEhKcUVPNlV4RUk3QWJzNWk2OGQr?=
 =?utf-8?B?YmgyandhMmp1YXBtWG5oUnpxcFM0UHFXUGp2NW84NzZENWpJZlVnb1hoTTlu?=
 =?utf-8?B?akZxYk81OHBzdFlIb0lqUE03Mm9kMmx6YytpdTdwenRSV1JPNGIwL1RuQTJp?=
 =?utf-8?Q?wup80J7AFEnzLK105iDmM+FOH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7adf6c5-351f-4f29-fae3-08daf22037b3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 09:02:21.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bisqE8BzbKB8w6yFoKk1PcXZtGe+W40C1ROZdZdThKFF7rlyHX90xeOXLUXCRUOjpc47zTynRKwcKhmtVaR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-Proofpoint-ORIG-GUID: H31pBft8W0O9aMr95KqPvFlSrt1Pyurs
X-Proofpoint-GUID: b7vz-5r2Sm1FqqgXRbqAqdG8xhAJoSL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3098MaWZ022079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175671



On 1/6/23 18:31, Alexander Kanavin wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Please stop. What problem does adding this solve?

Sorry for noise!

Originally, the patch is used to fix the yocto compliance issue. The=20
libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES=20
=3D "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for=20
libportal, how to solve the below yocto compliance issue?  Any hints?


ERROR: Nothing PROVIDES 'gtk4' (but=20
/build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb=20
DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in=20
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable=20
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',=20
'libportal', 'gtk4']


[1]=20
https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gt=
k+/gtk4_4.8.2.bb#n55

Thanks,

>=20
> Alex
>=20
> On Fri 6. Jan 2023 at 11.08, Yu, Mingli <mingli.yu@eng.windriver.com=20
> <mailto:mingli.yu@eng.windriver.com>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so
>     add opengl DISTRO_FEATURES requirement for libportal too.
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0meta/recipes-gnome/libportal/libportal_0.6.bb
>     <https://urldefense.com/v3/__http://libportal_0.6.bb__;!!AjveYdw8Ev=
Q!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-=
j03gjmDPWlNRZnPQeCyHk$>
>     | 1 +
>      =C2=A01 file changed, 1 insertion(+)
>=20
>     diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb
>     <https://urldefense.com/v3/__http://libportal_0.6.bb__;!!AjveYdw8Ev=
Q!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-=
j03gjmDPWlNRZnPQeCyHk$>
>     b/meta/recipes-gnome/libportal/libportal_0.6.bb
>     <https://urldefense.com/v3/__http://libportal_0.6.bb__;!!AjveYdw8Ev=
Q!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-=
j03gjmDPWlNRZnPQeCyHk$>
>     index ca58ef4138..cb3c5631d9 100644
>     --- a/meta/recipes-gnome/libportal/libportal_0.6.bb
>     <https://urldefense.com/v3/__http://libportal_0.6.bb__;!!AjveYdw8Ev=
Q!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-=
j03gjmDPWlNRZnPQeCyHk$>
>     +++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
>     <https://urldefense.com/v3/__http://libportal_0.6.bb__;!!AjveYdw8Ev=
Q!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-=
j03gjmDPWlNRZnPQeCyHk$>
>     @@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection val=
a
>     features_check pkgconfig
>      =C2=A0GIDOCGEN_MESON_OPTION =3D 'docs'
>=20
>      =C2=A0ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>     +REQUIRED_DISTRO_FEATURES =3D "opengl"
>=20
>      =C2=A0DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 gtk4"
>=20
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#175568):
>     https://lists.openembedded.org/g/openembedded-core/message/175568
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/175568__;!!AjveYdw8EvQ!adBoiCcCJiSyEFxuSwv8UUtX2iXZn=
-b1eKQaopCuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-j03gjmDPWlNRZnKVvR6Xd$>
>     Mute This Topic: https://lists.openembedded.org/mt/96090762/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9609=
0762/1686489__;!!AjveYdw8EvQ!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaopCuZ9qd=
hjna0B1gOcC8yDxUpHJNiEyo7h-j03gjmDPWlNRZnIi_Br3T$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!adBoiCcCJiSyEFxuSwv8UUtX2iXZn-b1eKQaop=
CuZ9qdhjna0B1gOcC8yDxUpHJNiEyo7h-j03gjmDPWlNRZnOpuie-v$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

