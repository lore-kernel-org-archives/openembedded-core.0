Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7E11088E73
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 04:13:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3843.1773893573638259524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 21:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NH47XPAB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75383f0eaf=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3o3qJ3604454
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bqlXb62KT9IrJ33q0vxQ+BNuVV3aAUj9lgBZ9qLGcHc=; b=NH47XPABQ+lP
	DWMo4vIw19fzy+s6KvCxKIS+lUv8GumRGEsSi7BmAJJmhWm9yMY93W4mPJGQ9Xsi
	VjNxOP1sBGUpN+uFWv6OGvJufU031BK3dxbn0qcOl6/jc/gi1HBFI8PdO9HWfRCe
	VRZezbE0OD3dVSrJ8Ur1oRtKA+ZGJDSNrqKXELhdpUQOs1SmtYLQuW0QzT1qL3ma
	CsKE/q+99/SpHMjqZv/mB9fF27s5Yc+2yXiHUazb1YoFt455cpEqxAjgW3C8oMjj
	Aiealtnc5MRoOJSs56uiM4rayRk0skCh6lrszIjMZTDWtb7jhR7A4fEUx818Lfgr
	p34+tsDEsg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66bsp6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 04:12:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rgb+y0aflDFBBuibJZ0CFYm+UakAGsC3tRhp970jXCeYoCLBxIMlGDBh1TO3IUkya1vMYoNdQBW/KT2hlGgRAyM9i0y2Bk2u/Zm2o4P334LVTESnveUQ1Ylec7OZ7qhdqrjtybpqIH2CeKpNXiPb1ZgPxunqAh8i3FRblPR32mFYIQDA0IsxbF8EVdiS8zRED0C0feBXAwl1KLHxi781JMvzopUgusZvTAEWU1Jd64h+EhnzSHgwSN3K6rmFzfF7oSAdIjskX7Fz25mYdZMn9thnj4kYpsEBkDsEJ4LNJy2bqC9nGQHpQDA+e78/jipanXKI/apamLojqSEajHZwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqlXb62KT9IrJ33q0vxQ+BNuVV3aAUj9lgBZ9qLGcHc=;
 b=Jw8vqer3fgZL9KRkC1hPEQIWI8Wgdx9iKL3jb11L+V+0/dVpylBk+qJ8q2WB7Y+lGiEJ5EgQ8EThVi4boBWqvi4uGuwB5EhaRm221MRpJBiosSoguXWa6nDNJOOHXAnoTZ6butv4RG3ELhoGqfi+wmOKWeqyaQdVAR/kTFWtlrXLTLazkcNfCC3nLNhm3rZDub1AvH8pwnFXVKIqwGBDySklDTANpmIMR7NDKJGrKZFalG04MrmO5aIvB+g1StYWZxPT2hk1RtS9V/Kn37etsS+3yjirszC/CIDN02SnJtONlSxTlDlsemnfHePEye27jkxwyvSYborjaJrdYXlvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 04:12:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 04:12:49 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "hprajapati@mvista.com" <hprajapati@mvista.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
Thread-Topic: [OE-core] [scarthgap][PATCH] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
Thread-Index: AQHcttJK4qrBtvnrZ06bkRoOTwM5zLW1Pyig
Date: Thu, 19 Mar 2026 04:12:48 +0000
Message-ID: 
 <CO6PR11MB5602551F1FC6DF89226E8AB7ED4FA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260318122412.202963-1-hprajapati@mvista.com>
In-Reply-To: <20260318122412.202963-1-hprajapati@mvista.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=395a14c9-9197-499f-9833-f24e6d72ff2a;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-19T04:11:02Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7474:EE_
x-ms-office365-filtering-correlation-id: e0737059-25ce-4855-6ac7-08de856dc838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 7mFlyx6EYdccYN/XXFBnEcXKtJOcEtuo/2Mtr5WGIVeTAbhUMCitAxhi9xG/bxwuf2nQusv51LcRCbb+VTvhg7jgNiERYKn6fitbzNhnwa4JjSuoxHPRUuru9q9yY3OJiZwacgzc0g6XpbqBU2vPPADoLqt2J7RhQjRrA4mcfDZ6KkykkZOGeOJBCE+YvwRkLrNd6su9Obtppr4FQTq+ADZJ0Qrg9TUplFfbQmklhnuteDc5fJbIHM1zSBizF76aapNTApb27FxODHXUGNFgq9v+ADcCWnCegHUabnnOAp2aeW9oPwqKLxmPOA7e3Zl+gK+8on+0YOnOdFswerccKiSs7LczrjnKOeG2OVn23VkiPy/emm/FJ3/VI4jThs6VjoEWRS7mcqTAktsy2Z9B2QcbQ9POq8MlAF+2uulE/GRinKJHt7wwqx/TtiXf9CVL2/IYEbPiPYJnZJ7rzk8DI4SbwyMXK4QWQNbnsG6t8LauGW8sLZtQUh/bwfIPP+y41sE5OibTH4YdpAg6ttk6Lk2JeRlDbkzITgHI4S2kW7Ra+ih+KaQ8LPcR+JQ0iTjDndjqwRYNof6czdOScDMZoz3ac2eTxcS8MVIxtNwlcqhji1Fr6PjjreLda+Try+6J/VY1CtFFUMFeRnxRNgH17ygCugLblFSB2TcV6JOFQ+z/AuzmjeBt7Pw6hQ+P4JyZeg7y6Vi7csLy3yA+JkNCWQ2rFKb6dMOEdWQ6pkwZMRtvB+dgDwqlOSPGLX9SwO/k
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5jVKUFm4FPF/DBY6yT3CMhgyRjF5RZotWOWqTjR3dz1LeA+TzSEOsgEz1DB7?=
 =?us-ascii?Q?DJfcAOXlH3usfELM1l5W40wtcd4MMUaIq4KEttAYZXnsPK8qekdaO+37C4Oo?=
 =?us-ascii?Q?sCV50EvjfDAq/tXy9CFugbRvP2N9O11NZsjbn403zUuD0Ll6tarpLYFX6PZI?=
 =?us-ascii?Q?6OjpoPsgt0/VhtRZE/p0dcywG2hoYWmzyD1DNi8bxfIRtLRd/12wLHcRldqR?=
 =?us-ascii?Q?cfRdxcprKKPp1ZbwW8hwEOOXKgP+ZMrz7FpYuDvzMOH+i4t/wQINnZhUaacZ?=
 =?us-ascii?Q?Gi8KML9g5ikLSVmP+ii065kfMTtrRHEXw/TCVy7FFoDTDFmbMHtDWJikwxiO?=
 =?us-ascii?Q?HTML9/0ev5je+jzCQtxlzxa07oKoqBRv6D2szowotqXsxQ2xiGUQljgXFhTJ?=
 =?us-ascii?Q?eTxw+juN1Py7yaepvnQCyP8Z3ehr856tu/jw00mu+R2dPy/n94BQyLO84DxB?=
 =?us-ascii?Q?zy0NY/AWwiKi602dXXAyndvtdYFOmslQavIiYMUmxhsM6E5lAQJaoahqnOMz?=
 =?us-ascii?Q?2pTFsLxr4B6uTyVQDJiaEBAMVO8JF9tx3FGbtkmHbKPdXzE5NeNfQwrdS/4a?=
 =?us-ascii?Q?tfcUAIxZT6WSW0CqQ6sZ1LztGnW0erE5mhO0wW2YfGaoC41n5KKkGdXHr4pW?=
 =?us-ascii?Q?jZiMG1MiiVTZ9rPZa/s8upoDF/zfkSsLnLsyELsBhFLVRtSsnVFn82Xzw6KZ?=
 =?us-ascii?Q?JA/Jj0SSI0IqWmMAp0eYU2C18zT+nRhOCuem9YFL64rPDW+GWZqs62xPFDjT?=
 =?us-ascii?Q?UcRIHtvp5Zgx1G03M2xwU7Wxu0cgefpsUx/iJ4r9HRw5bQ74uA8Xa+UU18X/?=
 =?us-ascii?Q?9THOpZ7idDj0tVtcvwONIIK8vdEa/9rSqPrb1aazxOZR8Tf3+KCJn52sE79Q?=
 =?us-ascii?Q?puWCHqi4H8lIRNjgM9DVKgdQDf6mq69BCPnmjgHt/pckY/kewHzKYfUC4+5Q?=
 =?us-ascii?Q?if9INzBeO9MwgVQi5gJ/xXMrLByH93Wsgikpk4g9QHOo8SKhmduTVqvQpxs4?=
 =?us-ascii?Q?FKOBhvIEu2RtPL2tKzLjPaG8t6nTXS8hlObVAwsPETIH2oMiNnLrHklwabr/?=
 =?us-ascii?Q?UJ4AtW396mVHHe1fEMVRfDXz0ZNY79E5PdGq7cqDTTRwaLlWVCvHDoiA89Mn?=
 =?us-ascii?Q?7MScUs1qHjKFVkP4PFyHrks599AO0ym2ugoeeTWf0KkJpAUb433JOPb+MkOa?=
 =?us-ascii?Q?ih2PlFNlwq7t3DQ8M5whtCCki6zt1CgU/bBShHRrGb7/CxiCDmXHnX4Rjx+4?=
 =?us-ascii?Q?lIjRH6ANnjk7/HJLme5APre5Xs8KnCGzWACEww8q5e1NhyMVQKrnVzhmLk0O?=
 =?us-ascii?Q?7XNodoXvF7902TrEFJ7ManIZlbHSYugB6+j3ScglFIhGiC0MCLa8bbdFFo25?=
 =?us-ascii?Q?MoTPhGcjunIG/XXV25zfuRTuTNaFAaitT3Wqx8rZswt39TexASrqyqH0CBvq?=
 =?us-ascii?Q?Bv8QGayDoSz060YycQ3UMHFL29+Ia2njToC7yvMFxg+U3/sCE2HUcvC5Tz4I?=
 =?us-ascii?Q?SYZnegmKbWCEfr9InQqxPZZcv+zRv+Uj69C5SRJisvVbWqr13zSr6VKe143z?=
 =?us-ascii?Q?L+9xX9+oIvS2IKplzH2Ib8rEfdozHFqvNIne+jWG2P+SiGWSd5wjSlGCj9hi?=
 =?us-ascii?Q?IxOZo2ZxlcGNKTfg82mxnSOP8NM3GxxTPFV48dE96jbKkh+dEQyWLeYBEJdh?=
 =?us-ascii?Q?CtTSaY/OeWXuV19bo6U+rqYYdch9zB00rm98jEStSqEgrCCH8adBiJJlMF0K?=
 =?us-ascii?Q?mjmOPOjWOg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	julXu0gX/e174TMHtyAGjVJbqa0ngTLrmofqZuXK0nUbDCj1NwcRzZ1SqYA3Ql+ZgXW5yl4eWrMFEVgcfcN8rFRRZStJBm3lZjlkneaENomoo2OYeOSXgOyIvKHuXaMHjSo/DOy9jmxNWLbTQgdFQxJlOiSYLIbUoSykhQ8vFAzuJyIJbUrn6bNhm5upeVFcp1wIIB+FVGB1Dcp0fwjAg85kkf9JJom7OpA9Gu1Rb34cSczvIV1jPAPB9d2pYqHbAyoScpJZKgP+BCGwGyYA8O/aqP45ZZBAbTj2S0HrOc7FwykA9m5o0d5j228NtVngkGyVIFD7ditdl6bV3Xee3g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0737059-25ce-4855-6ac7-08de856dc838
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 04:12:48.9726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bca49I+VCRX07i/I0s1IJMPO4g0D1Q0GKWBj6OZ4eLvIPMJ1mxpKOMsgwqGiqzBtqSimBIugihx8E7xg61htig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 1W_rzt7DBUimvv64juIe_IveZYARQVZU
X-Proofpoint-GUID: CWSv0ZRu07i2BUMNbFNvkHVgDCmt5AM6
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69bb77c4 cx=c_pps
 a=/vhbQW8ajZ2wERCzDUYoLQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=xNf9USuDAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=J0Tn2xNtAAAA:8 a=Q4-j1AaZAAAA:8 a=fk1lIlRQAAAA:8 a=mK_AVkanAAAA:8
 a=iox4zFpeAAAA:8 a=gwr9P_I3kYu7UEPoAQUA:9 a=CjuIK1q_8ugA:10
 a=9ZcRxastL33iXWX1AWsW:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=U75ogvRika4pmaD_UPO0:22
 a=3gWm3jAn84ENXaBijsEo:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMCBTYWx0ZWRfX5KPMuHf4uMxn
 yfJogW4Xk2pkBOQ5JWzShgL5vjvHNt/2cuRNHvDonzj5oLIp7oNtsYCtc6jkxV4t4KjZnyRJpu2
 3ir4+GW0Fvis7btSFBCqKsT6lSTJDCiGA135zrO6QFM1chF+hDMQyN/C5cKAf97yJ9wISgORiyM
 1BF1PGk3z1dws10oFDL1weLJOKT9TvjXWhlALu7Hxlw7MVDceTIDNeJ94KkLx77vaCJK4JxcU+y
 3d9AQpETnDmt2nAoVhq85gR0Zy5VJkJXuIPIJ2+af9emfac/ekqfYqDTgc9yFW/U+jiewqugXB3
 5PJjRrfrFGfLI+rpZi+J2chQNFW9PegmeFZTiFS56qlIL2nTKczU04VnS3ssLwW4Ctq8x1C7Ldf
 NwOi+A/2J3WNNn4jDKySrmW9NtQCraDay6ubyohNZBEtYlYQQVGzSEqtbwZN3hzOL/iZ8rhSKz6
 Of1n5sWCFiX1hcDGVIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233457

These two patches have already been merged in busybox repo.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Hitendra Prajapati via lists.openembedded.org
Sent: Wednesday, March 18, 2026 8:24 PM
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [OE-core] [scarthgap][PATCH] busybox: fix for CVE-2026-26157, CVE-=
2026-26158

Although the patch was not merged yet, Debian already took it ([1] & [2]).
Since busybox CVE handling is slow, follow Debian decision.

[1] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/000=
1-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
[2] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/000=
2-tar-only-strip-unsafe-components-from-hardlinks-not-.patch

Details:
1. https://nvd.nist.gov/vuln/detail/CVE-2026-26157
2. https://nvd.nist.gov/vuln/detail/CVE-2026-26158

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2026-26157-CVE-2026-26158-01.patch    | 197 ++++++++++++++++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    |  35 ++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-20=
26-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-20=
26-26158-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-2615=
8-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-2615=
8-01.patch
new file mode 100644
index 0000000000..8649f4dfa5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01
+++ .patch
@@ -0,0 +1,197 @@
+From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: tar: strip unsafe hardlink components - GNU tar does the same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti =3D tarfile.TarInfo("leak_hosts")
+ti.type =3D tarfile.LNKTYPE
+ti.linkname =3D "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size =3D 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+--------------------------------------------------------------------------=
----
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 b=
ytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157, CVE-2026-26158
+Upstream-Status: Backport=20
+[https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31b
+b7685b1a1cb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ archival/libarchive/data_extract_all.c      |  7 +++--
+ archival/libarchive/get_header_tar.c        | 11 ++++++--
+ archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
+ archival/libarchive/unsafe_symlink_target.c |  1 +
+ archival/tar.c                              |  2 +-
+ archival/unzip.c                            |  2 +-
+ include/bb_archive.h                        |  3 ++-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/archival/libarchive/data_extract_all.c=20
+b/archival/libarchive/data_extract_all.c
+index 8a69711..b84b960 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archiv=
e_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name =3D (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name =3D (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute =
names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t=20
+*archive_handle)
+=20
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c=20
+b/archival/libarchive/get_header_tar.c
+index cc6f3f0..1c40ece 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t=20
+*archive_handle)  #endif
+=20
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->n=
ame));
+-//TODO: do the same for file_header->link_target?
++	strip_unsafe_prefix(file_header->name);
++	if (file_header->link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header->link_target);
++	}
+=20
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a=20
+directory */ diff --git a/archival/libarchive/unsafe_prefix.c=20
+b/archival/libarchive/unsafe_prefix.c
+index 6670811..89a371a 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+=20
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp =3D str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp =3D=3D '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *=
str)
+ 			cp +=3D 3;
+ 			continue;
+ 		}
+-		cp2 =3D strstr(cp, "/../");
++		cp2 =3D cp;
++ find_dotdot:
++		cp2 =3D strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp =3D cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 +=3D 3;
++		if (*cp2 !=3D '/') {
++			if (*cp2 =3D=3D '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named =
"") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp =3D cp2 + 1;
+ 	}
+ 	if (cp !=3D str) {
+ 		static smallint warned =3D 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *st=
r)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str) {
++	overlapping_strcpy(str, skip_unsafe_prefix(str)); }
+diff --git a/archival/libarchive/unsafe_symlink_target.c=20
+b/archival/libarchive/unsafe_symlink_target.c
+index f8dc803..d764c89 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list->data ? "hard" : "sym",
+ 				list->data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are=20
++(attempted to be) created */
+ 		}
+ 		list =3D list->link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c index 9de3759..cf8c2d1=20
+100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursi=
ve_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+=20
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name=
) */
+-	header_name =3D strip_unsafe_prefix(fileName);
++	header_name =3D skip_unsafe_prefix(fileName);
+=20
+ 	if (header_name[0] =3D=3D '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c index 691a2d8..5844215=20
+100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)
+ 		unzip_skip(zip.fmt.extra_len);
+=20
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+=20
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn) diff --git=20
+a/include/bb_archive.h b/include/bb_archive.h index e0ef8fc..1dc77f3=20
+100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t=20
+*archive_handle) FAST_FUNC;  void seek_by_jump(int fd, off_t amount)=20
+FAST_FUNC;  void seek_by_read(int fd, off_t amount) FAST_FUNC;
+=20
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC; void=20
++strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+--
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-2615=
8-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-2615=
8-02.patch
new file mode 100644
index 0000000000..1380a6f72e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02
+++ .patch
@@ -0,0 +1,35 @@
+From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: tar: only strip unsafe components from hardlinks, not symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in tar=20
+archive hardlinks, but it was being applied to symlinks too which broke=20
+"Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157, CVE-2026-26158
+Upstream-Status: Backport=20
+[https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31b
+b7685b1a1cb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/archival/libarchive/get_header_tar.c=20
+b/archival/libarchive/get_header_tar.c
+index 1c40ece..606d806 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t=20
+*archive_handle)
+=20
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header->name);
+-	if (file_header->link_target) {
++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+--
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
index d870e2ee10..228bfdadd3 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -62,6 +62,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://CVE-2026-26157-CVE-2026-26158-01.patch \
+           file://CVE-2026-26157-CVE-2026-26158-02.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
--
2.50.1


