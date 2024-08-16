Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6288C531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 16:01:35 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.web10.151782.1723824090458971251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 09:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=bE14dlp5;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=BUv39q3K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GEs2uK013688
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 09:01:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	ppfeb2020; bh=hBwXMwuqXtitoyRS9StZWCFVPkp3/9i5woJ0A9xgs2w=; b=bE
	14dlp5jHnxp+CJRMayIa/8gk3Vfnnz1dQIM04v7zXlam0r1L6Eivwf6T/07pbpJW
	N5Oon/RJpy0tzyxYcAVMjeC9nqiAd4oiVN0ovS74UV6i8XdE2kk2Vtoe/vlOE4cg
	SBHE3auyiZ9RMC8sEtZwfzCYoKI8DoejgkmZ4sshFvJb29DRAcfQ1wjYxzGiOM2h
	SlDzdMgNYT1OmNone1mN+cb+kachRsMVAw7Be6AE66zjeEAx0W2X9Fw5Ai2QDJfo
	6MVjRoItrYfHbMCcadyEJCsb9EKY94LOavrE8JdmQDSJFXs/NZh/s+5XMYd47Cel
	hYiSgkGqBazt6GfxZtdA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 40x5gumhxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 09:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk2H68qYmmoF1YNQVncenBbq6hpIkYPcFcpiBSzlWi4GzyVMtFiBKVE1n5G1Ejv0J4P+5q79bf/SPMDv1brA+rzZmUlq+d6mKjN52Epnd3q8GDonjx0Yy5VHRStjJHUOxTdtmmKP8FTsT0i/vseLtUmnc2vcXy0gYHHEb3cM0i9gYAzmzd0y8Igy5ksA2Kv00VScOcfd1qu99qUDem5YLlfJtV4WQIXnR2NNDy6OeHP4kmwKHxgIYz2jrAO2c/8HEuUpE996T5kfkqePadavzVKGpK072UFXvw4XOxq1T9GELputcSCF33AQcAgDJzm5IF3Zs97TGbNdafqR7UMxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBwXMwuqXtitoyRS9StZWCFVPkp3/9i5woJ0A9xgs2w=;
 b=M0pG4GTJqst4oUnn+IsGvCpw3tnzgRVe+B7JoSwKSbjsFv5lNImOYCD+swdhE/noduCWdR04RuDhAwCEC4TfyQfxb58qtGj3ezboYN8JNDEUZYpwWsAT3DmGkDeBA6qJiruDAs3bBs9Q1QuB8RkQcwLt/VtpuqKXx06k00ROat0G/oRLvDyV++V2JZ+QP2a4BuhiRZtEdOS16FP2wCajoFYKgiJzOV+CF+CSBM4NwIao9ZIcEid1Q9MQsqNOHiIlQnFMB6SJfeYIpXr+cJb1KPK9KHLnP0atv+/P5oUjHh8s+G+aXcScmf5IoE3XzxM7YuuyYpVcF/L4NcQcJJ9bVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBwXMwuqXtitoyRS9StZWCFVPkp3/9i5woJ0A9xgs2w=;
 b=BUv39q3KInRK/UTumWOADRYg6/ylow/GRKfeQDZ7KU3vG9rw7KvhmCThHdR4SauL1pPqEI+8AYBr3HzGeW01sy26rUISdk1m3jGfeTHozL/lldRqftik5uVhX7CdV29KVEdMXxmPHqLShc2HU4z8vc3qrb9laPbF7Yg/aPEIYkU=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by MW4PR17MB5547.namprd17.prod.outlook.com (2603:10b6:303:129::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 16:01:25 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%7]) with mapi id 15.20.7849.023; Fri, 16 Aug 2024
 16:01:24 +0000
From: John Ripple <john.ripple@keysight.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-core-tools-profile.bb: Enable aarch64 valgrind
Thread-Topic: [PATCH] packagegroup-core-tools-profile.bb: Enable aarch64
 valgrind
Thread-Index: AQHa7/RQX9lrmGWGU0WGgkjKe6SsAg==
Date: Fri, 16 Aug 2024 16:01:24 +0000
Message-ID: 
 <PH7PR17MB61303D979AC126378F25F9109C812@PH7PR17MB6130.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR17MB6130:EE_|MW4PR17MB5547:EE_
x-ms-office365-filtering-correlation-id: efbed086-acfd-46be-1257-08dcbe0cadcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?iBAr1QT16DTvyb5MXFFPw7CK5Vnmsj1HJTdkG0UlmBwWcaVCW3G+JYUhul?=
 =?iso-8859-1?Q?2HPhLCkrwZXawJ72dC9CERiYQUAqUC/snidqMP3p+ijxdI3PfwTe4HpiK/?=
 =?iso-8859-1?Q?WaaUqeUipKSXGCa4MCDMn4zKgmK0bNbt+I6XavJxFZbnBK1f6ttquynT4k?=
 =?iso-8859-1?Q?LeMZ1vLXbEtJYNK9K0dGR7k/tqOxPhlVpcFXZH3Jchnr3IUtIbyNe3lV5T?=
 =?iso-8859-1?Q?/LatJhr4LaW3ULezDXhsVJ1ytIj+VcMiUfSBGNtXkzb4lUv6+CB22X6wNf?=
 =?iso-8859-1?Q?gKBksw6aul0DN6bfs60BJ5EC1//1Dso7kxWiVP+AGTRmSbGNpjEJS3Tvf8?=
 =?iso-8859-1?Q?rL+aGbVVW8A/vs5b086h79pLpQVywsmwqEtwWlE/aWaYjgGiHIyB5oQwVX?=
 =?iso-8859-1?Q?OrPs/DTS3CWk5hysfN4heMdkjQJFFTphd/cIf9c5om+El7SKupSc26LJ7/?=
 =?iso-8859-1?Q?obGy3b6PpBWLXgRKVrbnJ7DsfjrLtSxdGqg36GLJQwtkH5TLYgRh6EaGo5?=
 =?iso-8859-1?Q?iy4twc/dmYk4VpM1nobrRIzxw4Po3DWkJAS6tB6k0RNX2fBY0nPwCQqYJZ?=
 =?iso-8859-1?Q?wX58J8eXJDV2P1r7q5LS6bMvxu5C3NeAM40Yp7mwklmlpzSTeA16AkAMKN?=
 =?iso-8859-1?Q?W1Qvgkx/LOjc7FEYEQhnma2Z3NPXnERel11PT726djSxl6c1GERyC4DebJ?=
 =?iso-8859-1?Q?ZaJ5kK5uKaUvvCvjlravY9sOzhe/iJjF5o9TH9piLU5kvZ1l56dAg7PCtr?=
 =?iso-8859-1?Q?kAtr3+iICPlDtbJs8udfse5eAUOAgc4F3OBe/ogvi54309qgC5xqx5Hi3W?=
 =?iso-8859-1?Q?dJ6y7Lw7N7gtGYe/H4kRAB40s2mWOuIq9EN0ZGB6WrXpocEsaWbrBvzRLo?=
 =?iso-8859-1?Q?49KDQXCvMCvjnPpwSs3eFyHlIU7jw0VyNV0WQN2UZq17ubA72AIc8Ueqeq?=
 =?iso-8859-1?Q?A7glkVAONMLyzOLbSDsy83z4o20ncRHef5BdB4XzFPIWOVliCAwy/QDdfH?=
 =?iso-8859-1?Q?mjR69oEvO1quyshlfg6TP0gALeNOtCLCwgmRVuSZHz9Oj/dALrPq2k3jsH?=
 =?iso-8859-1?Q?J6qsyBI3AG7D0AuauNiY3vR3KSUTBgkxHrVhfJKm/07O8c/aT5rJmypVL3?=
 =?iso-8859-1?Q?d6EB/M31DesGvunKhAOJXr0VY8v9XCqPTeiGT3q9ft2kM+y6739c6eNBSR?=
 =?iso-8859-1?Q?PnNyvUj0z3muvsWv+9r9rFBh1yWRNCPUDr74rP+oLY+eC1hAl2z2eaJL3o?=
 =?iso-8859-1?Q?of20iFC7/jdRr5XMaU75Gw/FqHpQzgAEnLkEPeNsDVbg3kXivzlUiLnXfS?=
 =?iso-8859-1?Q?YI7JUDSh4rmyn4l9FLZ4Y5Qz8SngwyV2/b0W59nZaOphWy4NqxEsnKIEXR?=
 =?iso-8859-1?Q?vfqYqWEppJaZRl3YOKHQNrFfpugLNA0vp96pa0PjWgYVGlCQclpx2DAp2L?=
 =?iso-8859-1?Q?TgaVaKU5ECnQ++1QKIcD/STNeO1QazfPgP2TRw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?flLoW0cQw2G6wCpLOh1EPtEarY8upLczW+1bXEiPZxejtl3ql5J0AkTdRh?=
 =?iso-8859-1?Q?K/9UV2v90jxEg/ZDamd9PbwYMPoE0UsC/YdNmTWQ6Ejbfwkr6J9ARKNTIm?=
 =?iso-8859-1?Q?/8cwlMtJO/n/MrcZmd0KHSyqm+Ctf4OXwLZig0IfELQKgND4xlWpdJOwjJ?=
 =?iso-8859-1?Q?zLfnvh6EY9f938a8Kul8FxYiRSf4bX9nTi5dkeCNh2t6BDeVKAipSsFNkk?=
 =?iso-8859-1?Q?fH7TvVITXk8I01a484iE1LxkxVWU1Lg4fWhXuinSfCVkokfb6lTnr7JSky?=
 =?iso-8859-1?Q?bd1djuqerLOPzfFz9+K9hwY8fpG3R1V1Vjx7oYvxQ/ZeaaBH/fB4Uhx5AS?=
 =?iso-8859-1?Q?jgRMXowh71347BfMHb5ljgAj8c93PbeIQSiSo5BMnGJgzQZovE9aUDZaJC?=
 =?iso-8859-1?Q?sRMaFVIgR73Embu81gxecIkK3+0E1g1HzMSy+UVBf63HfugSNgrB9cTZsE?=
 =?iso-8859-1?Q?6MMZ38zYT+WVmFzQTzJy++PIJfM5xC5GXma7/4uVqBWMC1KYB4ANwDgQmw?=
 =?iso-8859-1?Q?BFdcTn1AZzmVDyIxxJTvVxxl6XGOOYQVUKDnFTFBT9hMAUCaXufpHApvSB?=
 =?iso-8859-1?Q?BXvmZM5T+aOZ75ciCiyrA9xhgfB8aKx+GnVEesLRtqrcM6ASx1yKZHVV/k?=
 =?iso-8859-1?Q?4UvDwBo2zPZhfD+ZJlCJYPrzc0XSnrG4N3quaG0qWcBccwNU/1b8zjeWTV?=
 =?iso-8859-1?Q?tc1tpuBBrcRPrrV6IF5cuLIAIUSLs2Sv+UAj2El3UHUk+LgKKKzkob8WPC?=
 =?iso-8859-1?Q?ajQ0zk3hwhIU4dpgMIN2TzxP32DQ4WFomuL0FMryrDarTuAkS7n+hrzGE/?=
 =?iso-8859-1?Q?zM7hIAq75bVUBpJCwfOvJXscfFdC2GXy4IBAuVb70dlvUdVZfAxT/Zk2YK?=
 =?iso-8859-1?Q?iTc8NRWZgL1WGqOtbVEHYfO0O6KfsmZm/tDckjBObwYAGTvz3yBxVP6nY9?=
 =?iso-8859-1?Q?wsZhpTbshox2vQa3ukSE8Pxi47ndyWZkJFyqrLcGLUbjBLdE875b9VwZMd?=
 =?iso-8859-1?Q?LCiL0s7yNfM4QhCGpzYvwwakPhvKxi85c700zkn5VYCeur1fRyzA/FuEjP?=
 =?iso-8859-1?Q?7vpXXTrCJ8NQx1nVEUb1XcGQq+yI02nGzybmCWKTjqsjfBMPJ+1Yr0N8JO?=
 =?iso-8859-1?Q?AWzCEbUCZEkQdFPPiIm7MP1KJhSKzM377DiVjePqjGMuP2Cwy8rOmhbiTh?=
 =?iso-8859-1?Q?iWKad3cfhENJEpjz8SVeiwAo+akSHQdpv3f6xYX0mau3oHqeyXkOy1iReq?=
 =?iso-8859-1?Q?Lq98P8ET2d6nJ4gBM6Awa7cIbxwduzKWYZl34d+wvFfEUMagYmZn+2SbHy?=
 =?iso-8859-1?Q?DIdbUDfnJbWmSXNQLdPU7cyL3KR4+5kQ6iSmcNsbFjIJTpLj67NYvc85lm?=
 =?iso-8859-1?Q?DtxcE2fyDWlfbzks6d53zPqqisI3DlKiSjBFFufYuo/QqhTRwXkzmHE+vv?=
 =?iso-8859-1?Q?6DInCm6zygVm2/Oc0gEXvAaTukT0dZva5VvwEnX2AgY9F8g+YPukK2zHhr?=
 =?iso-8859-1?Q?Nm0Fca7EFuwdUoz+xh4nJyTR3nnmGaU6b/+1aqU8+yXwkdRgLrYmh00SoR?=
 =?iso-8859-1?Q?7FF0bd4JwEnGWdo6B1rXMOVATEqR3EfCe9TYQBNimTMdGXUNG9I0jYBse8?=
 =?iso-8859-1?Q?x2V3HUqn+uE4TdAJ57rW4RHXvO6LT92MVM?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR17MB61303D979AC126378F25F9109C812PH7PR17MB6130namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DC7GAOskWsqJZFTtgcKEkJ3cd7Krt0NWvyCi2BHIbVV1Z7V1TggN7IcLTPbw6kV1pLGQmNiVBO5GHQzmxa4RWrBMpbVVLUpV9tCXJbnqvwF8S9kPel4cSU70g77X9epfO0pcIiz4FPCq+HnZcl5L5S5kK92EVqU5Czrgknj7Mz2Xi0PpabkS0S5L1aepl21bToT3jbf4dNCkHofHquSydgYHe5zxrABxZ0FSdWd5XDTfO9tWa2wvoFxCQIa4vVy7+nX3egakt0OesgEjOkMjDHTgeXsq+cPgwddjYjs6/3Fh9EzpM1VoVemjZAZYyEZodlPzZo6mJssm9axT6i5AkgBmaJVLrlEB3mIInFXvuk6DBAMg/ExezS9TPCInt5faYfvJITwCEZKAlcec5mO3aRQsfVVOFj/m2NXZNkimeUPVmn0GHKd8ALeQLgyKO50qHAaBAGnPZyL/e37BnS/9J1/Q4R13MfmefUDkx/j8wkVVeT3sUYgYhk99d74Rqpcup9v+kCPoGhFHu8/qz+rR+tjJTXXb2Ac0N3yJDyVgZZmWLoJbUwKewhGEMBhCDj1ABmx6n8pG6VQM4kQPNCvuwBm1NR60q9phsC7Fsj7bAiX/Uuvc82Zl3EmGggjIBCrX
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbed086-acfd-46be-1257-08dcbe0cadcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 16:01:24.4371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZFccStz8eYOBQasxXaAGxOC50btHEBM8z6DmpHg4lttNKCgWBL8SAwEud+o2jhkjSUVVBGcTyCWHxLIF7PY5q/nfeqobwSe5Q4WUUD3JdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB5547
X-Proofpoint-ORIG-GUID: JxuKthXW_4yjDy2jF-GSimzMIK1um3WM
X-Proofpoint-GUID: JxuKthXW_4yjDy2jF-GSimzMIK1um3WM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=810
 mlxscore=0 clxscore=1011 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 16:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203473

--_000_PH7PR17MB61303D979AC126378F25F9109C812PH7PR17MB6130namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The Valgrind recipe has had support for aarch64 for 9 years but the
packagegroup-core-tools-profile recipe still excludes valgrind on
aarch64 builds. This patch adds Valgrind when building the
package-group-core-tools-profile for aarch64 systems.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profil=
e.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index b3a24b71de..f471cf977c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -50,7 +50,6 @@ VALGRIND:armv4 =3D ""
 VALGRIND:armv5 =3D ""
 VALGRIND:armv6 =3D ""
 VALGRIND:armeb =3D ""
-VALGRIND:aarch64 =3D ""
 VALGRIND:riscv64 =3D ""
 VALGRIND:riscv32 =3D ""
 VALGRIND:powerpc =3D "${@bb.utils.contains('TARGET_FPU', 'soft', '', 'valg=
rind', d)}"
--
2.34.1


--_000_PH7PR17MB61303D979AC126378F25F9109C812PH7PR17MB6130namp_
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
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
The Valgrind recipe has had support for aarch64 for 9 years but the</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
packagegroup-core-tools-profile recipe still excludes valgrind on</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
aarch64 builds. This patch adds Valgrind when building the</div>
<div class=3D"elementToProof" style=3D"line-height: 22px; white-space: pre;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
package-group-core-tools-profile for aarch64 systems.</div>
<div class=3D"elementToProof" style=3D"line-height: 22px; white-space: pre;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 22px; white-space: pre;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Signed-off-by: John Ripple &lt;john.ripple@keysight.com&gt;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
---</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;.../packagegroups/packagegroup-core-tools-profile.bb &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; | 1 -</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;1 file changed, 1 deletion(-)</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profil=
e.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb</=
div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
index b3a24b71de..f471cf977c 100644</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb</d=
iv>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb</d=
iv>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
@@ -50,7 +50,6 @@ VALGRIND:armv4 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:armv5 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:armv6 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:armeb =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
-VALGRIND:aarch64 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:riscv64 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:riscv32 =3D &quot;&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;VALGRIND:powerpc =3D &quot;${@bb.utils.contains('TARGET_FPU', 'soft',=
 '', 'valgrind', d)}&quot;</div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
-- </div>
<div style=3D"line-height: 22px; white-space: pre; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
2.34.1</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit;"></div>
</body>
</html>

--_000_PH7PR17MB61303D979AC126378F25F9109C812PH7PR17MB6130namp_--

