Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE88CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:09:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75968.1780999747669651212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G+O2Sy7d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0620ffd7d6=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599uIoV2303860
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 03:09:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=muRTtu4/7cKtHO4GogpVXP
	jL0C0WYakk2R1HXCyRNv0=; b=G+O2Sy7dm0JoO7er5aILwErzahqHqE5am2RmZD
	fv+WrcnWaPUp1cbUgxg1x/azx5vnnfUFm34UMdGbYq/nRfrhNtXepKZnmD2zWdix
	58bmFONCwcWKiqSySIXMmZfyicUmf6lLIwp8kBjOcUO3SxZVupl/GERfuE02gd5T
	3foZdrJEbRzaqJ9AA+hkN/GYsVLogc8xdUCwN65nDh4CFI4Z4hTwxH2hsuS3NFZU
	ReT61/tOEMfTqWeFFx7stEmN/mc4zfL25Zt/omVDBNiQNfCW64bK1/yFsMcFlFSF
	EtqpyUFRWOHC9WjG6rUFU+ISzjGqq3lu0R339rceFnWGrdTA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emety43g5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0NOkh2vdPP5Y9xXvXCWqFP4EX9qu6LrYTSYibob2XvcVcX/MMlrc9sJOLHgcR4PZssfmAB8GDQbG8CQMDHdEP+Ca2zat9TbcNuTuFelAv4szpipKmB623a/erwtlU5NwncOxlBiT42xdfQxCy/6EnRZsn/aiOyLKjO/uHvoG4C+HfN+CjmcKfDq72QIxhqCuFW3r2+DMMGbxH+IRpCQ/rmTPxWG8ADFiKOy+0bm9inzbGZZVq+SXkvbk5fTc8jtpk9SYLenyX3Z3srny+3i70iaf/kzMn0k8SB/aLpdsUUoSffWLfQacUetyg8mokS7qCf9PS4cD8ntXYjf5XiOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muRTtu4/7cKtHO4GogpVXPjL0C0WYakk2R1HXCyRNv0=;
 b=WaNJuwf74uPVBHQCYnOL15T9c+y7LJ0LZASwFkz7T8lIyNLdDg6NW8gZfAVzMhhMGp+0RK1Q4mFBY7OIhpBajaSLjUuGb8j0n+szhasH1tEiQGvF/yv5TDWEQW/rnIpliH5NcyT+xkYsNOY/+8D1HuGY6mryBM0RDNj0GMDaJetI/2I0CX8hGfAF1lTmy2Y4sKs0h25U5AQv4MuWzTF1yPzQ3H/qMgL2zXX8Bm8JBtMmpRkKi1UGh+7q0HXfUc8lPzodT5PP3CyG8ZdFhv68JTm0ZLLzltqb2940wj0PCnEP9Q4hYwgNZVq1z7yaHYQYiyZjpP8draCOQ1NQYdc1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:09:02 +0000
Received: from SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99]) by SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:09:02 +0000
From: "Jiao, Shilong" <Shilong.Jiao@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Jiao, Shilong"
	<Shilong.Jiao@windriver.com>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Topic: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Index: AQHc9+3IBgFEIc6TJ0KxxAVJ13Jl4bY17hCkgAARpLo=
Date: Tue, 9 Jun 2026 10:09:02 +0000
Message-ID: 
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
In-Reply-To: <18B75E544A0EA1A3.61226@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-09T10:09:01.530Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6678:EE_|PH0PR11MB5880:EE_
x-ms-office365-filtering-correlation-id: 8d671858-b8ba-469a-57eb-08dec60f217f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|13003099007|11063799006|4143699003|8096899003|56012099006;
x-microsoft-antispam-message-info: 
 BQ4K9Oh334m7Y9w9nYpGE3LeHQjqvqwWnjD2Z+ZQTLIGT5UdJPkITBOZk+15rpdFURVaKyq+Y8mJm/WRmtoPotgl/6XqDxhXN/tEE2zzQhM+RWUFpLb2V92TEWEF7FXeUig8rhrfPy2g4U9yD69MRjJ+NuHzdJW736FTGo2a5NfHpdSzaat0EyoeZx270SNL1oo1nvVKe7+YBcAWto3F6sWB7X4kwNYU4N/WSA9yPWUE782F+SXIGjqwddMUfL+sokt2bQqwFaClpckK/KYf/UiLjhQLYOeJGm8gCiN5HK1CgTsl8dAkyOdb5OO98oGKj/xYVphyP+wreELllro7hV20ZYCBWSHWgMI4vwj3HfbkxWOehALqRJzoqoT8jaalwmpvYs5LT79HxEBjzPab7T4QlctJ23cIHV+68B3j05VIC+tpOP8FgkVn8mhGqI+JrC1N3/SmvALbv14fKBLMSuv4B6WFgBt/XP5Ffkf5cw5BAIKHZwrodp0aGn1gEydQmYZg/8+PI56bgTkwlHwGDjQnh/ugphe91BjuurZ8pCsd+VsWLQiBTa8KehrhJ9Z87fwY9Q+P9encwdJUKREIAhH+oaAZPTAbyFRwL2MQusgqLmd3R064YL3SQPb8oqUj9bcl3VZOoIyHNgVT22lLn8Pnr32gcjMstJ4kQY3sq6bZ0pXdLrcM3ZCDzSv4K6OB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6678.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(13003099007)(11063799006)(4143699003)(8096899003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rq91C7FcxEaLPDzwJHyPysBxZJb3F+DEgNP8uIKKh5lXSBn/LeJBPugYO4JY?=
 =?us-ascii?Q?gIanGqZCCJqeJ6r3yAxVVlMHCXojlWMNwjGr+fLrx1O5i4IvL6OOG6HaqyS3?=
 =?us-ascii?Q?YNrHl0uyKwTKDBVGwIAHtTDtshnETTMtqJ8yNXu2yEIITmVmHcDAMdQ4UYP1?=
 =?us-ascii?Q?eV6xsAYpRv8xbbXqvHphboB0Zsrz2Q/dUEmLyI+OOa+7y5ot1fgy5+7j46Tz?=
 =?us-ascii?Q?wd39ug1ldtQPZ/sN9U/a/TgAOcM3/O41Op/pvXtg/EWrWXv21XutIqnybqnD?=
 =?us-ascii?Q?E+R/cwakRZbdz0C4bcHpRBhs+1IGXPMPZIEJk9f42jUIu3JIxqTj3+uRrYYV?=
 =?us-ascii?Q?mA5QJwD/n0R5M7A5h+ARz/W5W1tdvpHKVMd4bqom+ssZFeFmUc99+XY8ztsK?=
 =?us-ascii?Q?6JhI06rxmyfrKHtqHVMft2Yu0uIxUObcOR4utWnuFCClM20Vd09Hs7Q86eDh?=
 =?us-ascii?Q?mxHm9Ad2BwJ/l/JffmY555+V6CpgOnpDufI+6ScrrXAQ2hxi8uPEBZnd+d8/?=
 =?us-ascii?Q?ZL2iS5lQ//JuSPdtR90Hdp8yRUGAiTiRU7KLvIVFNqIEISJsjsVx4llqSSqD?=
 =?us-ascii?Q?Hsd75s2QcmKBr2CSySWlHXOP5atOKyIMa50QKSxcue9IQOaYL02NAdKOOucA?=
 =?us-ascii?Q?NK7bBcqGt2lTXPH8Wq+A0BVKIl3M3IdmOoavpzVjFpAR5sSwUyem9ULqBH10?=
 =?us-ascii?Q?ivypaNGddsuh+HZLrfZEhYLJQ84HZBgM5+kyAhjMFhhauZ6+KQXM+Ak7H6Uf?=
 =?us-ascii?Q?xOg1Mt7iHZVFq4W1Iopsbs/tMPLJ0ANH9SXLYWKsJhWVafnsL0JBa76S2xXb?=
 =?us-ascii?Q?RZEpmsHz7p3i2R3S7Yy/yMRde2w2ATn9E4a3padbm3vUFBOL3aAM5dVakEMQ?=
 =?us-ascii?Q?YjDI0BVf/W6tvEGc+ZbcwgxpIP4v1GiPMd1c5+4TrRk3exxO6yr3aFSX7esp?=
 =?us-ascii?Q?/8l/ToXNr4YGbHbDfr/av159YXCoFelDt/aAIRH6e8k5Lk/2PISeWb0Mo0bJ?=
 =?us-ascii?Q?RS9NXOstuZgGcTbtTAVWuxoMVT+Otk7cenW2WhQFiYXhR6tedlal4ww7p0IX?=
 =?us-ascii?Q?s1pkgVVb5DF3Sk0Iui9dUVzkfwbrtm8ejTO98XUZkaBvBgIaM3vilcMJO6iz?=
 =?us-ascii?Q?SLXQjxiELssw4xPxJpY7QAwXMCjaSGjX8FAZFYqfloGZNjCAtHaT2M9zOsDN?=
 =?us-ascii?Q?ziE2EIPHU5LyruK0GaMlGCelM2NlmNOcNwBhwHmsPhDewfOElttbKrA8JOcG?=
 =?us-ascii?Q?IGXNc75Gi2FK8QIRrSAdYAHM37YfDWiQNKDsvkrdow42+Yqe/ctqDmHkg/+/?=
 =?us-ascii?Q?o5umW0U7/mDUM6b6JJ0GGaULv2GwWmDVjQO6VJ+KzBKIczQO2eXIyKb8qqq0?=
 =?us-ascii?Q?c0KMw0hfhX9Ezf3LnXKNJ9Lihr8kl4NhfedW5KTGqrGM0HGu+CSyKlhrG0Xa?=
 =?us-ascii?Q?mou7GQU5zV0x+IqA5GoJN06XNAWLQ3Ol0Zm4NCFMpu36LVdI0pri7dMxVWt7?=
 =?us-ascii?Q?3LYBv+vqJ7hslSQmlwSCK6gSw7fulTrZ5Ci1wjd+xdlc3pnEAuWeJpwrBCuE?=
 =?us-ascii?Q?CcJzx/9ya4HmvuuXpIhlII9tGFJiWbLP1pQ3+ctmXlUV5+tCTyP7NuhuzcDG?=
 =?us-ascii?Q?K4GEGufM4D7cNAhQLN7tJvky2qB6ciZJ7xTQwG6r+FmzxLHa/iD/Bu++2+W3?=
 =?us-ascii?Q?zNhLSXpPs7K24ZuxMeMsnD44PakWuIeIwdBVwrtOWpWxNy3X+9cRUhBerNVn?=
 =?us-ascii?Q?OTCG0EJvXw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB66786F424595B04D017F6116801D2SN7PR11MB6678namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	HADzLWa/mCrIbznObMf8HGio9SP3cW6ncMKLAgIdBQ2ejSbpQ9zeGK0BGki8A+ubxEmyxQ4benWrM3/7/Qi8zHsWv6iYXd9lbWPqs9jqEcONHNs2VnOkFuOFeUW22u1MdgrSs1zsEJN2FEa9y2Tni6KHjTHkuCJFLoNcG7uX5Fervoje8iidaso8o7Z9w5LwxPCrittfsfyKyRbzILWEZtCR4kxVI6l+4IpbA16CEOdZ/1u6akZNzOEJ/gicFg5MHN9To3X2uhegnNDfjmmZEo/l/kmPKjOg3QA9+Lre976wIRssd09/qYoX+JTEb9Uw1wbm3zYzUnMm6P3CbLwhDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d671858-b8ba-469a-57eb-08dec60f217f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 10:09:02.1680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BqyYpVOSwH+CiCkEge0WxCP4Wa/ylny7wIyO3t3ceV22F7ns6Tb8bwPaTuomZwrRf9xvlOij/hFtAfwnk26WliNmFFYBTK7OXbgm+wmXa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: CQAinNTe98n4y68kv_6W2YRPyehEgDzz
X-Authority-Analysis: v=2.4 cv=VKjtWdPX c=1 sm=1 tr=0 ts=6a27e643 cx=c_pps
 a=3Rvb9JmgCdrss5EpqVD9LA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=CwbX3IkpJHe_1w7eqLMA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=mUl6Hyuh6JB9lIfumj8A:9 a=JBOX0ZceRBovQOm2:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NCBTYWx0ZWRfX8REoUlryk3ii
 46J+lQ7UlPUoAgGuj5b8i0d/4MxnFwYogOIzpGxWqEDQTFc6Y8VrLdmWuaM/Qnv//3t+9+ijuKc
 VeMMYb3cmU5H+NNuh+u6v8G+RwgrpKAhiNzYHrvFhTMCXXJDvPyv3TVUwyWPH5c6LDycBh5Qbaa
 awAqtiQ6wDOpypyw1f67w1ynMAm2vd6oPyLh4Y5LHLTX241tjvWhzyOsP5CQH7xSXlhKg2hv+85
 4IVMlpTnfzBxfiRtzPbNtVVoHlWUMlGq+C5GeBbpcV7Hf2RsyV8C7r1SWXZeLRg999l41rpKmOh
 yVpg3if1SpvppF9IewzegCPLjw6pn0gIl2Z73h7ILZ4TCu16Mv0wq/yOsQxOGtvd6ZAR60ev+Ss
 Vz1n4Ze6FVuAI10B2cRXhtInl6GaMZium1IOCZVdl/PaawvvgsZK1Ee4HaiG86sQw/HGo2YdI1d
 vCpQDzY7wAjL7FPsccQ==
X-Proofpoint-GUID: OfAjNmtE5ZR6TRnQ4ZGxCqpm7wEjddvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238286

--_000_SN7PR11MB66786F424595B04D017F6116801D2SN7PR11MB6678namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Quick update on my investigation:

I've tested these failing cases locally in my build environment, and
interestingly all 8 tests pass:
- test_lazy: PASS
- test_move_items[html_entities]: PASS
- test_move_items[html_parser]: PASS
- test_move_items[BaseHTTPServer]: PASS
- test_move_items[CGIHTTPServer]: PASS
- test_move_items[SimpleHTTPServer]: PASS
- test_move_items[xmlrpc_client]: PASS
- test_move_items[xmlrpc_server]: PASS

This suggests the failures might be specific to the autobuilder environment
or related to test execution order. The test_lazy failure in particular
looks like it could be caused by html.parser already being imported when
the test runs.

Could you help me access the detailed error messages from the autobuilder
logs? This would help me understand the actual failure mode and create an
appropriate fix.

Thanks,
Shilong Jiao
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Jiao, Shilong via lists.openembedded.org <Shilo=
ng.Jiao=3Deng.windriver.com@lists.openembedded.org>
Sent: Tuesday, June 9, 2026 17:04
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

Hi,

Thanks for the feedback. I'll investigate the failing tests and work on fix=
ing them.

Looking at the failed tests, they seem to be related to:
- test_lazy: Module lazy loading functionality
- test_move_items: Python 2 to 3 module renaming/moving tests (html_entitie=
s, html_parser, HTTP servers, xmlrpc modules)

I'll analyze the test failures from the autobuilder logs and send an update=
d patch soon.

Best regards,
Shilong Jiao

Best regards,
shilong
Tel:84778559
cellphone:15910943969
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, June 9, 2026 16:55
To: Jiao, Shilong <Shilong.Jiao@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue Jun 9, 2026 at 3:41 AM CEST, Shilong via lists.openembedded.org Jiao=
 wrote:
> From: Shilong Jiao <Shilong.Jiao@windriver.com>
>
> Add ptest for python3-six using pytest to run the test_six.py
> test suite included in the source package.
>

Hi,

Thanks for your patch.

It looks like some tests are failing on the autobuilder:

Failed ptests:
{'python3-six': ['test_six.py::test_lazy',
                 'test_six.py::test_move_items[html_entities]',
                 'test_six.py::test_move_items[html_parser]',
                 'test_six.py::test_move_items[BaseHTTPServer]',
                 'test_six.py::test_move_items[CGIHTTPServer]',
                 'test_six.py::test_move_items[SimpleHTTPServer]',
                 'test_six.py::test_move_items[xmlrpc_client]',
                 'test_six.py::test_move_items[xmlrpc_server]']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3794
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/522
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/505

Can you have a look at the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SN7PR11MB66786F424595B04D017F6116801D2SN7PR11MB6678namp_
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
<div style=3D"font-family: Tahoma; font-size: 13px; color: rgb(0, 0, 0);">H=
i,</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Quick update on my investigation:</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
I've tested these failing cases locally in my build environment, and</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
interestingly all 8 tests pass:</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_lazy: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[html_entities]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[html_parser]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[BaseHTTPServer]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[CGIHTTPServer]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[SimpleHTTPServer]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[xmlrpc_client]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
- test_move_items[xmlrpc_server]: PASS</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
This suggests the failures might be specific to the autobuilder environment=
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
or related to test execution order. The test_lazy failure in particular</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
looks like it could be caused by html.parser already being imported when</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
the test runs.</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Could you help me access the detailed error messages from the autobuilder</=
div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
logs? This would help me understand the actual failure mode and create an</=
div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
appropriate fix.</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Shilong Jiao</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Jiao, Shilong via lists.openembedded.org
 &lt;Shilong.Jiao=3Deng.windriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, June 9, 2026 17:04<br>
<b>To:</b> Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;;=
 openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.opene=
mbedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-six: Add ptest support</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Hi,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Thanks for the feedback. I'll investigate the failing tests and work on fix=
ing them.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Looking at the failed tests, they seem to be related to:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
- test_lazy: Module lazy loading functionality</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
- test_move_items: Python 2 to 3 module renaming/moving tests (html_entitie=
s, html_parser, HTTP servers, xmlrpc modules)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
I'll analyze the test failures from the autobuilder logs and send an update=
d patch soon.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Best regards,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Shilong Jiao</div>
<div id=3D"x_Signature" class=3D"x_elementToProof">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Tahoma; font-size:13px=
">Best regards,<br>
shilong<br>
Tel:84778559<br>
cellphone:15910943969</div>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Mathieu Dubois-Bria=
nd &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, June 9, 2026 16:55<br>
<b>To:</b> Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-six: Add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">CAUTION: This email comes from a non Wind River =
email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue Jun 9, 2026 at 3:41 AM CEST, Shilong via lists.openembedded.org Jiao=
 wrote:<br>
&gt; From: Shilong Jiao &lt;Shilong.Jiao@windriver.com&gt;<br>
&gt;<br>
&gt; Add ptest for python3-six using pytest to run the test_six.py<br>
&gt; test suite included in the source package.<br>
&gt;<br>
<br>
Hi,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like some tests are failing on the autobuilder:<br>
<br>
Failed ptests:<br>
{'python3-six': ['test_six.py::test_lazy',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[html_entities]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[html_parser]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[BaseHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[CGIHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[SimpleHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[xmlrpc_client]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[xmlrpc_server]']}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/3794">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds=
/3794</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/bui=
lds/522">https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/build=
s/522</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/bui=
lds/505">https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/build=
s/505</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SN7PR11MB66786F424595B04D017F6116801D2SN7PR11MB6678namp_--

