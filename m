Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D97FB44C8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 07:38:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15875.1777016284119252625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 00:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bt0ihJbp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85744c60c8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O3trVT183535
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 00:38:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=EGyhbt1IWp0HzYExlcLBMC
	8FA2XVXV9/jb653YqmQks=; b=bt0ihJbpQhcy3ZFFQKXZgkpUU1u5bJHFd97M9K
	SUDe5HtjPK5DsqnldedbqiyJIasecwH3vlnOeIdLianNLX6EEEefYkCTJiQdFjFE
	55RaR8gxQfUjsFK4T5bJWZWXXVx9h3pmglqmE3gT4RQcC1FHHB3nMtNKJgatU8Jt
	RRBitFTN6dlN7P6sJ/wHZTsAa8xXhve2JKXgVvH79z1pAxpL3bO544Cr/3iuqXR6
	jCw7cQcfPpAXO+pwPUXW8Zj8AVJiJJR99nOhtf4U+PIu2vH/4Fo/ksEbhEMtWf/x
	66LIa3pfgfcaQPsCOx+E2SsSKrHjIpQHUEYla+MxvZJCSQLg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8sr1peb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 00:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clnvxVg/EldmRbYemjYMDl+dC20qcFEPE+P+EM8QgRctKgPNS3G5kOGTMteoHbdTeQubrPfkPUuYjkfrizOi3ixFPBOQnH/egJqmAYhtpzIJhep0XMDqIsBzn4KkxZuEv8jq3ocHrMd+xt+8Waeck47tQbW3qEH8K7rxKi71D27/7kzsIHXYjxqzxLy3FXkCjv7nl1CHJuVtp7j2LUcPnnlDY/UvEFy2E4kG/hRB6GjUNsrOdS77pdxZfFKt+Y2Jxpsvky2XXrv3kqOhWJSv/Nll4jzRpMXSICbXlSfqDWAB5rzB2yuoSLtHNkoQkrHr7UXgFZeEiIQhFpiSUt399g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGyhbt1IWp0HzYExlcLBMC8FA2XVXV9/jb653YqmQks=;
 b=i7Z5Rx5mnYpAWoAcI9Tq395wabUCVFuPjVBdGmn5RIde4SfwBz7s7snPGL4xJdbw7XRuMNlVchVSUuulgh3XVFX4xxDjGsotNWMHu88FpBI2pZWGyTXOnmAUNopVi0IOzkz6jRJtIvLOYDa6dySj9GMEYpQjmyCEU4WotbOYhSAA2FDfnnpKFi2ASu4re1LKXT3MsKKCaynj6Llz8UPR6wqaK4WQnA0j+NMBNo+C8u6ofdVvlsrkgikKzD656v8Rs97lWFz1Fee0nW3lHT2O9ejXYHPi8oWAQYx+OkpaZ9suw8thLJ+0PLGGQvW+lxeEbXQ/jRqEh2/pFGe4cDZG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH3PPF310D5CFFC.namprd11.prod.outlook.com (2603:10b6:518:1::d14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:37:58 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:37:58 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: "Wang, Jinfeng (CN)" <Jinfeng.Wang.CN@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 03/12] libsoup-2.4: fix
 CVE-2025-14523/CVE-2025-32049
Thread-Topic: [OE-core] [scarthgap][PATCH 03/12] libsoup-2.4: fix
 CVE-2025-14523/CVE-2025-32049
Thread-Index: AQHc00UCogM852Fz4UO8+Xo/+Vz8R7Xtz5fg
Date: Fri, 24 Apr 2026 07:37:57 +0000
Message-ID: 
 <DS0PR11MB7312B681A9DFE464C3F99DE4822B2@DS0PR11MB7312.namprd11.prod.outlook.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-4-jinfeng.wang.cn@windriver.com>
 <DI0PBE3G6FDD.3A1SAHXZP0MYI@smile.fr>
In-Reply-To: <DI0PBE3G6FDD.3A1SAHXZP0MYI@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-24T07:37:56.922Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7312:EE_|PH3PPF310D5CFFC:EE_
x-ms-office365-filtering-correlation-id: 2618cd2b-7298-4d05-690b-08dea1d467cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021|13003099007|8096899003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 sx4W6iGqqM/lNXvqodN3ojEoq2j8LhDMBiNlwmjjTS4mSxGIZuZkDtTIw3vAdFQJcyRYS+5f23g+BCRo6wuG6cNble7LrZNErB8IdaEKqGtZUKdmJoyTDNtydj18EFjRe+pVGbC35rzYW/Z0nT0R9xGTOAZ3TugZDw9WYWASebRQRs6jnuHvRKElPh2nUnI4OkweXM1avKkolTgbWm9swiAIC64XncY162secAor/eIsMDk4F9ugSE/PPiStQT2Hp6wX+q8GkfKJ5oUrKhNtp+4SUq5I1cpbSFfajmalKg0l2JqVLjmCQwb2915F3Ymeg2Dh8O+FAxV578KVrq7QAty/inikhMsoSUMD1YGtGB40xDejvGXEZ/9Ax780oLvQB57qbKJeVpw+ZRJGC9n+sAzDkt3dZpTve9ZvnyDz9GMwza9kGrtZh1SZY3JHrMe7aPD2HJO/OH5jQ/OH+cqRS5CyGIEQMBieexJpAHHWuPysX1I6Ej746m4itD/kaLG24DnLwoJi/TtNX8MJ1PcRKlkjMoRpkTkP9vBP53wnzZZV54m7GcTQdtFpgvj2R1uvik7TGAex3D3yg992pgsij5pCb1bi2/k9sHDm9hsVkS0SSwUvPYAF4DgEi1Ha268/k+DH2/byJ5z3SaZ9Bced5HqlipbOBoLP13ppA56+qEfqAiPPqQ9m6PSUQqCM7htgtlO1uY0kS9oDdsD44gBVWdlS3YwFyTTvyI8qFFwKkDoDnvlUOyp6IcabA9Kmp2VW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(13003099007)(8096899003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GDRcyMQzaQQgpAOjbujzi6lrTh/qP4RoRXYwvKZgmJcKD5ph9WZqhyjT1r?=
 =?iso-8859-1?Q?GUqckmw8grqJQjfdwE35oNcb9avZbJ1KJ52WSMqq6KXFkgih5TYP+4jOKG?=
 =?iso-8859-1?Q?T9OZVb9+s8REkc0YFKXj9kFJamzg9X7l1ojaZ0H+0faOhthndE07d+XN+f?=
 =?iso-8859-1?Q?+IBQwYM5x4Bjm9h8zArkLFdeks6/DtSDdFszkBcaARNw7Pz+LWbiu8bQjX?=
 =?iso-8859-1?Q?mtNDj8iqYevOguVSN1AOvh/1wpcalrNG5g17/C1hMAdIP/Thwhof04dhJB?=
 =?iso-8859-1?Q?RRVBz2qTaYG3aE9+ElYM5nzuPN8hZIkDksRSKFA7wl15ypLbpLLt1DSEeI?=
 =?iso-8859-1?Q?rUunEdqg7S661VnllpUN2deG2FVGhAZRObPaYsnEe4OhJIYhtH46OAwKr6?=
 =?iso-8859-1?Q?N8dZObXM+eaVFWchF1ixleQNHaPE90rLOCZ1aWrPZq2KPPAhsVJp12Lj6w?=
 =?iso-8859-1?Q?N9PuQqNHGIujGcn3mcooFLoIc1axYaO2vTgtZm2Hb+20df0bhazbRHKa04?=
 =?iso-8859-1?Q?SmNyWlFFhfkdXRACV8zRFV7FeMYlRFir3avV3LKbA4SCuvtk37rSdvC8g2?=
 =?iso-8859-1?Q?vcXdxiCR8i1gVjkd/vjsUi78UGMqCvuGilKGk0xczPojriMbt7OYU2Kn/f?=
 =?iso-8859-1?Q?Qga3Ahu5WzJf74XTiUPCsQXzw9C4Oq5lS3SgwJ0tjb7brBXFVlPjKhZ3ow?=
 =?iso-8859-1?Q?7OTh1ol2XnnxFmGynO1v71oNRvlJL8b4YGJfSpRnXNTswRdiXjsxVefyau?=
 =?iso-8859-1?Q?zPoky4lcwtUzgo5s+amUGkRBr5r74Qc6r6wkqkAlM9bCX2/6InJrOyXtgO?=
 =?iso-8859-1?Q?BXdEyxPhVLjGd/II0humoDoP2v3eHszZkNby0i8D3ZnZUgkI609AWU8/Ec?=
 =?iso-8859-1?Q?fVmfKWg5vRvGKT/kXfSpzFFNYtt2fOTygXw6ozYm+Vd1fnLG0rUxprkJ9k?=
 =?iso-8859-1?Q?ElR9iI65eMinKIhmn6+BtKbqynlP+iXjyfYtxyruhk7U5M53SMTjFCuZ7P?=
 =?iso-8859-1?Q?41KcalnoftLlp3oDI0vmV1XxlDhOjSnHAtLADZ9plYcqOU3sk7n7gRCJiJ?=
 =?iso-8859-1?Q?SKyIF0VzrroCRQM/LJUWdnpFdhHGx36eUTx2hANNL3VgOI3S1g8sqYxU0m?=
 =?iso-8859-1?Q?ehUZDzzNGvZwfq78D+WJZZO+svKnoUDYqgsT4sQn6fvpzmd07vNzJF9OwX?=
 =?iso-8859-1?Q?9df88Lm+dhT4u1/JfjZRuzpd4wT+tTkr7Vg1oRHu4AuuAhLjFnPZKKj8+r?=
 =?iso-8859-1?Q?UCb3Fv0luCIusfT7He+l0DzNGFjSrbyvurUWDHxXUf17bF0Ku3giq4DDoZ?=
 =?iso-8859-1?Q?mIHX9EcOCYKx8fsuLLJIhO6MuXROXbpQa2Iit/hUGV/0maANdM2JKG4+0g?=
 =?iso-8859-1?Q?dOXeat5jAJAd+zQz0I8kke/fpuQeoGW5AfXUx7bDCojiI4v7cyM0AQKY1J?=
 =?iso-8859-1?Q?NuWknMJNY3KeCz8xYETzMW+93HL15JvlhVfVQsG9mA1u+mwAaaoXcBb/s6?=
 =?iso-8859-1?Q?z4SaGMsIx73YxpDnbYpqtOwfGCHmyN1iesq4A2t8FLJcry/y5kjor8gJOS?=
 =?iso-8859-1?Q?LossV7kY5+EIpfYeBoKEYTDJ3x2o5PIvJ5MzycM15ssbQaxk4fhpL1WlOU?=
 =?iso-8859-1?Q?6QBfO7eLaQdV0IfNJSmAAWDsmWe30R1uwaRiZjL1WBHsKc31RT5FWZZ7Z4?=
 =?iso-8859-1?Q?6OnDPUREpIf6GIOFr+pQroJ0Bk8ZeIohTAo0BH51b2RLqNlfb832IT87iU?=
 =?iso-8859-1?Q?G2v32pU/OskCypufSHbvCf1x3kV0fveKib3hgEaH6TcelDEV7OPsLRSxzw?=
 =?iso-8859-1?Q?4aC1LfnqgRbBlE870dOvKrp08oIc33lNn+gShX96BF5G3C1H9qlQcpAZRY?=
 =?iso-8859-1?Q?8w?=
x-ms-exchange-antispam-messagedata-1: s8uYOGsdeLHQDQ==
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7312B681A9DFE464C3F99DE4822B2DS0PR11MB7312namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	p38lx6alabUoBd4tMVUPjkEXsUOSRdSv1SAZa/A1BRWJvNQ596PBcYLUcpBkRhW3WElyDZwxTUSnCDUmGklXEp9hnqeRk3EiMwvEGykyO+Tn6JhmhXmBoGx3CdU63Er6bjFpR30gpn9soWugsnfLy3yjhAQ3soLfDiDriMYBbXc+CIqhhmDjYg9goK/KJ6gB/mqxlU27+yWFPVbqysGNvhJndTPv1dGJOlecIyR/hMiWPxJAcbL+lgEtqwcpqtYF36IlXNaTOJGTOkz+JOLQZHQOsDm/3sSnUoPpApZSHf7TLsr0CoZedhekB3O8FXEWpLPyRXk8N3qjGn3pk8sgng==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2618cd2b-7298-4d05-690b-08dea1d467cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 07:37:57.9826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deFHl3dh+Lrtdx4Q6dVsaLYnJ+afjbT6pzDSuaQOB/WPrzfXH6hI+44I7hHgEDh4CsOiMjUzS8vSuZQFtvDcFyrzCv/cvYnTSIQmT3CcJZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF310D5CFFC
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA2OSBTYWx0ZWRfX+mdxpOhshnQ4
 E+XNp7jOvZLwJ1YzIBnVYGJplqD5Dq0Hyeb8sn3qRnmrcJAj94zy26fDtmA7DsFD9GHRryNCqA7
 clhG5j/aP52scnCrDmE5p9sJ9SeOQVjIKKy8IrFBU+ExyGxwxwq7FWLjg2Q/W8INjR8WHaxgNtP
 o3EDukBz2PiY/4QOsQcqD28YF/2Cq5LJ1bbC4fDTk+7J7UQAn5K0eZZWcrrCCnrbWF6W4NDPdW3
 t6qwZfDEC++Ft+jYIEO5AY3zm5q2DojJ/Y/D5nLo56ynpluZFWJ9A3kkws+6yTIwSzp/2rkM68E
 qGSFOUPF2fQpA2bQ4bnscGxlgLPIWzZa+ipbOfCPc0BE1wBc0N8ZA205Zm6Mo9vor/pV86XqfVz
 FfVSmj1zqc6jwPYEkxwQ1nn1zlQGqxix5HKmm/vh02Zb2fCLt5+3HuLFo0yqz18bmE09Tx4Mg+L
 aNskQgaoz9BSq3cegcw==
X-Proofpoint-GUID: qdcaSugYxomNfS8LBftoBgbjO4IgKSzk
X-Authority-Analysis: v=2.4 cv=PfPPQChd c=1 sm=1 tr=0 ts=69eb1ddb cx=c_pps
 a=25df8hqnvvr9QcO7WBwFwg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=FAyzRYK03jJLY_HdqGgA:9
 a=RXYO8_t8BpG4vBDb:21 a=wPNLvfGTeEIA:10 a=gGcjtf0SuBT2JHlcIbIA:9
 a=W5QGzvigYgZAaW4x:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kuTznsy0MZW3ROzmv1cxlxKmm2v3hOH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235841

--_000_DS0PR11MB7312B681A9DFE464C3F99DE4822B2DS0PR11MB7312namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Friday, April 24, 2026 1:13 AM
To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 03/12] libsoup-2.4: fix CVE-2025-1=
4523/CVE-2025-32049

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 ++++
>  .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++++++++++
>  .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   3 +
>  4 files changed, 415 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-145=
23.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
49-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
49-2.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..7815dba55a
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> @@ -0,0 +1,52 @@
> +From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 4 Feb 2026 15:08:50 +0800
> +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
> +
> +This is a simplified version of my patch for libsoup 3:
> +
> +!491
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/d3db5a6f8f03e1f0133754872877c92c0284c472]
> +CVE: CVE-2025-14523
See remarks made to 02/12 patch, they should apply here.

This commit link is right for this patch.

> +This patch is a MR for branch 2-74, but not merged yet, maybe it will
> +not be merged.

... then you can't mark the patch as "Upstream-Status: Backport". Maybe
the "Submitted" status is more apropriate.

Yes, Submiitted is more apropriate.

But, then, do we really want to use an unmerged patch?

It is a bit long time since I made this patch, I remembered that I checked =
the related code logic, seems reasonable,  but I am not expert at this soft=
ware.
and I  remembered that I had test with the POC in issue https://gitlab.gnom=
e.org/GNOME/libsoup/-/issues/472.  I need to double check this when  I spli=
t
the commit  per CVE as you suggest in 02/12 patch.   What is your opinion? =
I am also ok that it is better not use the unmerged patch.

Regards,

> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c         | 3 +++
> + libsoup/soup-message-headers.c | 3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index ea2f986..6cd3dad 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMe=
ssageHeaders *dest)
> +             for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> +                     *p =3D ' ';
> +
> ++            if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_mess=
age_headers_get_one (dest, "Host"))
> ++                    goto done;
> ++
> +             soup_message_headers_append (dest, name, value);
> +         }
> +     success =3D TRUE;
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index f612bff..bb20bbb 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdr=
s,
> +     }
> + #endif
> +
> ++    if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_head=
ers_get_one (hdrs, "Host"))
> ++            return;
> ++
> +     header.name =3D intern_header_name (name, &setter);
> +     header.value =3D g_strdup (value);
> +     g_array_append_val (hdrs->array, header);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
> new file mode 100644
> index 0000000000..64e87cb1ec
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
> @@ -0,0 +1,229 @@
> +From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Feb 2026 16:20:02 +0800
> +Subject: [PATCH 1/2] websocket: add a way to restrict the total message =
size
> +
> +Otherwise a client could send small packages smaller than
> +total-incoming-payload-size but still to break the server
> +with a big allocation
> +
> +Fixes: #390
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/db87805ab565d67533dfed2cb409dbfd63c7fdce]
> +CVE: CVE-2025-32049
> +
> +libsoup2 is not maintained, the patch is backported from libsoup3, and
> +change accordingly
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
> + libsoup/soup-websocket-connection.h |   7 ++
> + 2 files changed, 107 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 9d5f4f8..3dad477 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -85,7 +85,8 @@ enum {
> +     PROP_STATE,
> +     PROP_MAX_INCOMING_PAYLOAD_SIZE,
> +     PROP_KEEPALIVE_INTERVAL,
> +-    PROP_EXTENSIONS
> ++    PROP_EXTENSIONS,
> ++    PROP_MAX_TOTAL_MESSAGE_SIZE,
> + };
> +
> + enum {
> +@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
> +     char *origin;
> +     char *protocol;
> +     guint64 max_incoming_payload_size;
> ++    guint64 max_total_message_size;
> +     guint keepalive_interval;
> +
> +     gushort peer_close_code;
> +@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
> + };
> +
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +
> +@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *s=
elf)
> + }
> +
> + static void
> +-too_big_error_and_close (SoupWebsocketConnection *self,
> ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self=
,
> +                          guint64 payload_len)
> + {
> +     GError *error;
> +@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *s=
elf,
> +     emit_error_and_close (self, error, TRUE);
> + }
> +
> ++static void
> ++too_big_message_error_and_close (SoupWebsocketConnection *self,
> ++                                 guint64 len)
> ++{
> ++    GError *error;
> ++
> ++    error =3D g_error_new_literal (SOUP_WEBSOCKET_ERROR,
> ++                                 SOUP_WEBSOCKET_CLOSE_TOO_BIG,
> ++                                 self->pv->connection_type =3D=3D SOUP_=
WEBSOCKET_CONNECTION_SERVER ?
> ++                                 "Received WebSocket payload from the c=
lient larger than configured max-total-message-size" :
> ++                                 "Received WebSocket payload from the s=
erver larger than configured max-total-message-size");
> ++    g_debug ("%s received message of size %" G_GUINT64_FORMAT " or grea=
ter, but max supported size is %" G_GUINT64_FORMAT,
> ++             self->pv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION=
_SERVER ? "server" : "client",
> ++             len, self->pv->max_total_message_size);
> ++    emit_error_and_close (self, error, TRUE);
> ++}
> ++
> + static void
> + close_connection (SoupWebsocketConnection *self,
> +                   gushort                  code,
> +@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
> +             switch (pv->message_opcode) {
> +             case 0x01:
> +             case 0x02:
> ++                    /* Safety valve */
> ++                    if (pv->max_total_message_size > 0 &&
> ++                        (pv->message_data->len + payload_len) > pv->max=
_total_message_size) {
> ++                            too_big_message_error_and_close (self, (pv-=
>message_data->len + payload_len));
> ++                            return;
> ++                    }
> +                     g_byte_array_append (pv->message_data, payload, pay=
load_len);
> +                     break;
> +             default:
> +@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
> +     /* Safety valve */
> +     if (self->pv->max_incoming_payload_size > 0 &&
> +         payload_len >=3D self->pv->max_incoming_payload_size) {
> +-            too_big_error_and_close (self, payload_len);
> ++            too_big_incoming_payload_error_and_close (self, payload_len=
);
> +             return FALSE;
> +     }
> +
> +@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *=
object,
> +             g_value_set_pointer (value, pv->extensions);
> +             break;
> +
> ++    case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++            g_value_set_uint64 (value, pv->max_total_message_size);
> ++            break;
> ++
> +     default:
> +             G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> +             break;
> +@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *=
object,
> +             pv->extensions =3D g_value_get_pointer (value);
> +             break;
> +
> ++    case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++            pv->max_total_message_size =3D g_value_get_uint64 (value);
> ++            break;
> ++
> +     default:
> +             G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> +             break;
> +@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +                                                                G_PARAM_=
READWRITE |
> +                                                                G_PARAM_=
CONSTRUCT_ONLY |
> +                                                                G_PARAM_=
STATIC_STRINGS));
> +-
> ++    /**
> ++     * SoupWebsocketConnection:max-total-message-size:
> ++     *
> ++     * The total message size for incoming packets.
> ++     *
> ++     * The protocol expects or 0 to not limit it.
> ++     *
> ++     */
> ++    g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESS=
AGE_SIZE,
> ++                                    g_param_spec_uint64 ("max-total-mes=
sage-size",
> ++                                                         "Max total mes=
sage size",
> ++                                                         "Max total mes=
sage size ",
> ++                                                         0,
> ++                                                         G_MAXUINT64,
> ++                                                         MAX_TOTAL_MESS=
AGE_SIZE_DEFAULT,
> ++                                                         G_PARAM_READWR=
ITE |
> ++                                                         G_PARAM_CONSTR=
UCT |
> ++                                                         G_PARAM_STATIC=
_STRINGS));
> +     /**
> +      * SoupWebsocketConnection::message:
> +      * @self: the WebSocket
> +@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payloa=
d_size (SoupWebsocketConnection
> +     }
> + }
> +
> ++/**
> ++ * soup_websocket_connection_get_max_total_message_size:
> ++ * @self: the WebSocket
> ++ *
> ++ * Gets the maximum total message size allowed for packets.
> ++ *
> ++ * Returns: the maximum total message size.
> ++ *
> ++ */
> ++guint64
> ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConn=
ection *self)
> ++{
> ++   SoupWebsocketConnectionPrivate *pv;
> ++
> ++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL=
_MESSAGE_SIZE_DEFAULT);
> ++   pv =3D self->pv;
> ++
> ++   return pv->max_total_message_size;
> ++}
> ++
> ++/**
> ++ * soup_websocket_connection_set_max_total_message_size:
> ++ * @self: the WebSocket
> ++ * @max_total_message_size: the maximum total message size
> ++ *
> ++ * Sets the maximum total message size allowed for packets.
> ++ *
> ++ * It does not limit the outgoing packet size.
> ++ *
> ++ */
> ++void
> ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConn=
ection *self,
> ++                                                      guint64          =
        max_total_message_size)
> ++{
> ++   SoupWebsocketConnectionPrivate *pv;
> ++
> ++   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
> ++   pv =3D self->pv;
> ++
> ++   if (pv->max_total_message_size !=3D max_total_message_size) {
> ++       pv->max_total_message_size =3D max_total_message_size;
> ++       g_object_notify (G_OBJECT (self), "max-total-message-size");
> ++   }
> ++}
> ++
> + /**
> +  * soup_websocket_connection_get_keepalive_interval:
> +  * @self: the WebSocket
> +diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocke=
t-connection.h
> +index f82d723..d2a60e9 100644
> +--- a/libsoup/soup-websocket-connection.h
> ++++ b/libsoup/soup-websocket-connection.h
> +@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
> + void                soup_websocket_connection_set_keepalive_interval (S=
oupWebsocketConnection *self,
> +                                                                       g=
uint                    interval);
> +
> ++SOUP_AVAILABLE_IN_2_72
> ++guint64             soup_websocket_connection_get_max_total_message_siz=
e    (SoupWebsocketConnection *self);
> ++
> ++SOUP_AVAILABLE_IN_2_72
> ++void                soup_websocket_connection_set_max_total_message_siz=
e    (SoupWebsocketConnection *self,
> ++                                                                       =
      guint64                  max_total_message_size);
> ++
> + G_END_DECLS
> +
> + #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
> new file mode 100644
> index 0000000000..f9c894aaec
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
> @@ -0,0 +1,131 @@
> +From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Feb 2026 17:19:51 +0800
> +Subject: [PATCH] Set message size limit in SoupServer rather than
> + SoupWebsocketConnection
> +
> +We're not sure about the compatibility implications of having a default
> +size limit for clients.
> +
> +Also not sure whether the server limit is actually set appropriately,
> +but there is probably very little server usage of
> +SoupWebsocketConnection in the wild, so it's not so likely to break
> +things.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-server.c               | 24 +++++++++++++++++++-----
> + libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
> + 2 files changed, 35 insertions(+), 12 deletions(-)
> +
> +diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
> +index 63875f3..a3f8597 100644
> +--- a/libsoup/soup-server.c
> ++++ b/libsoup/soup-server.c
> +@@ -216,6 +216,16 @@ enum {
> +
> + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
> +
> ++/* SoupWebsocketConnection by default limits only maximum packet size. =
But a
> ++ * message may consist of multiple packets, so SoupServer additionally =
restricts
> ++ * total message size to mitigate denial of service attacks on the serv=
er.
> ++ * SoupWebsocketConnection does not do this by default because I don't =
know
> ++ * whether that would or would not cause compatibility problems for web=
sites.
> ++ *
> ++ * This size is in bytes and it is arbitrary.
> ++ */
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> ++
> + static SoupClientContext *soup_client_context_ref (SoupClientContext *c=
lient);
> + static void soup_client_context_unref (SoupClientContext *client);
> +
> +@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gp=
ointer user_data)
> +
> +     soup_client_context_ref (client);
> +     stream =3D soup_client_context_steal_connection (client);
> +-    conn =3D soup_websocket_connection_new_with_extensions (stream, uri=
,
> +-                                                          SOUP_WEBSOCKE=
T_CONNECTION_SERVER,
> +-                                                          soup_message_=
headers_get_one (msg->request_headers, "Origin"),
> +-                                                          soup_message_=
headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
> +-                                                          handler->webs=
ocket_extensions);
> ++    conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCK=
ET_CONNECTION,
> ++                                                      "io-stream", stre=
am,
> ++                                                      "uri", uri,
> ++                                                      "connection-type"=
, SOUP_WEBSOCKET_CONNECTION_SERVER,
> ++                                                      "origin", soup_me=
ssage_headers_get_one (msg->request_headers, "Origin"),
> ++                                                      "protocol", soup_=
message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
> ++                                                      "extensions", han=
dler->websocket_extensions,
> ++                                                      "max-total-messag=
e-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                 NULL));
> +     handler->websocket_extensions =3D NULL;
> +     g_object_unref (stream);
> +     soup_client_context_unref (client);
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 3dad477..e7fa9b7 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
> + };
> +
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +
> +@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> +     /**
> +      * SoupWebsocketConnection:max-incoming-payload-size:
> +      *
> +-     * The maximum payload size for incoming packets the protocol expec=
ts
> +-     * or 0 to not limit it.
> ++     * The maximum payload size for incoming packets, or 0 to not limit=
 it.
> ++     * Each message may consist of multiple packets, so also refer to
> ++     * [property@WebSocketConnection:max-total-message-size].
> +      *
> +      * Since: 2.56
> +      */
> +@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +     /**
> +      * SoupWebsocketConnection:max-total-message-size:
> +      *
> +-     * The total message size for incoming packets.
> ++     * The maximum size for incoming messages.
> ++     * Set to a value to limit the total message size, or 0 to not
> ++     * limit it.
> +      *
> +-     * The protocol expects or 0 to not limit it.
> ++     * [method@Server.add_websocket_handler] will set this to a nonzero
> ++     * default value to mitigate denial of service attacks. Clients mus=
t
> ++     * choose their own default if they need to mitigate denial of serv=
ice
> ++     * attacks. You also need to set your own default if creating your =
own
> ++     * server SoupWebsocketConnection without using SoupServer.
> ++     *
> ++     * Each message may consist of multiple packets, so also refer to
> ++     *[property@WebSocketConnection:max-incoming-payload-size].
> +      *
> +      */
> +     g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESS=
AGE_SIZE,
> +@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> +                                                          "Max total mes=
sage size ",
> +                                                          0,
> +                                                          G_MAXUINT64,
> +-                                                         MAX_TOTAL_MESS=
AGE_SIZE_DEFAULT,
> ++                                                         0,
> +                                                          G_PARAM_READWR=
ITE |
> +                                                          G_PARAM_CONSTR=
UCT |
> +                                                          G_PARAM_STATIC=
_STRINGS));
> +@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_si=
ze (SoupWebsocketConnection *s
> + {
> +    SoupWebsocketConnectionPrivate *pv;
> +
> +-   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL=
_MESSAGE_SIZE_DEFAULT);
> ++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
> +    pv =3D self->pv;
> +
> +    return pv->max_total_message_size;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 7e00cd678a..915d735da3 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -41,6 +41,9 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-4476.patch \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
> +           file://CVE-2025-14523.patch \
> +           file://CVE-2025-32049-1.patch \
> +           file://CVE-2025-32049-2.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
>


--
Yoann Congal
Smile ECS


--_000_DS0PR11MB7312B681A9DFE464C3F99DE4822B2DS0PR11MB7312namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openem=
bedded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Friday, April 24, 2026 1:13 AM<br>
<b>To:</b>&nbsp;Wang, Jinfeng (CN) &lt;Jinfeng.Wang.CN@windriver.com&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap][PATCH 03/12] libsoup-2.4: fi=
x CVE-2025-14523/CVE-2025-32049</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:<br>
&gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt;<br>
&gt; Refer:<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/472" id=3D"=
OWA0d1658cc-3b98-ae82-fb1f-6fad33926ba9" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472</a><br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/390" id=3D"=
OWA60a5c9da-8522-49a0-3c29-6e56f70a9170" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390</a><br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; Signed-off-by: Jinfeng Wang &lt;jinfeng.wang.cn@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../libsoup/libsoup-2.4/CVE-2025-14523.patch&nbsp; |&nbsp; 52 ++=
++<br>
&gt;&nbsp; .../libsoup-2.4/CVE-2025-32049-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 229 ++++++++++++++++++<br>
&gt;&nbsp; .../libsoup-2.4/CVE-2025-32049-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 131 ++++++++++<br>
&gt;&nbsp; .../libsoup/libsoup-2.4_2.74.3.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&gt;&nbsp; 4 files changed, 415 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-=
2025-14523.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-=
2025-32049-1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-=
2025-32049-2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.p=
atch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7815dba55a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch<br=
>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 15:08:50 +0800<br>
&gt; +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)<br>
&gt; +<br>
&gt; +This is a simplified version of my patch for libsoup 3:<br>
&gt; +<br>
&gt; +!491<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472" id=3D"OWAd0f2e41=
6-8151-1cfc-5945-0afb7383961c" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f013375=
4872877c92c0284c472</a>]<br>
&gt; +CVE: CVE-2025-14523<br>
See remarks made to 02/12 patch, they should apply here.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">This commit link i=
s right for this patch.<br>
<br>
&gt; +This patch is a MR for branch 2-74, but not merged yet, maybe it will=
<br>
&gt; +not be merged.<br>
<br>
... then you can't mark the patch as &quot;Upstream-Status: Backport&quot;.=
 Maybe<br>
the &quot;Submitted&quot; status is more apropriate.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt;">
<span style=3D"color: rgb(0, 0, 0);">Yes, Submiitted is more </span><span s=
tyle=3D"color: rgb(0, 0, 0);">apropriate.&nbsp;&nbsp;</span></div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">But, then, do we r=
eally want to use an unmerged patch?</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">It is a bit long t=
ime since I&nbsp;made this patch, I remembered that I checked the related c=
ode logic, seems reasonable,&nbsp; but I am not expert at this software.</d=
iv>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">and I&nbsp; rememb=
ered that I had test with the POC in issue
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/472">https://git=
lab.gnome.org/GNOME/libsoup/-/issues/472</a>.&nbsp; I need to double check =
this when&nbsp; I split</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt;">
<span style=3D"color: rgb(0, 0, 0);">the commit&nbsp; per CVE as you sugges=
t in </span><span style=3D"color: rgb(0, 0, 0);">02/12 patch.&nbsp; &nbsp;W=
hat is your opinion? I am also ok that it is better not use the unmerged pa=
tch.</span></div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
Regards,<br>
<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/soup-headers.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 3 +++<br>
&gt; + libsoup/soup-message-headers.c | 3 +++<br>
&gt; + 2 files changed, 6 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c<br>
&gt; +index ea2f986..6cd3dad 100644<br>
&gt; +--- a/libsoup/soup-headers.c<br>
&gt; ++++ b/libsoup/soup-headers.c<br>
&gt; +@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, Sou=
pMessageHeaders *dest)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p =3D ' ';<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (g_ascii_strcasecmp (name, &quot;Host&quot;) =3D=3D 0 &amp;&amp; soup_mes=
sage_headers_get_one (dest, &quot;Host&quot;))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto done;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; soup_message_headers_append (dest, name, value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success =3D TRUE;<br>
&gt; +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-he=
aders.c<br>
&gt; +index f612bff..bb20bbb 100644<br>
&gt; +--- a/libsoup/soup-message-headers.c<br>
&gt; ++++ b/libsoup/soup-message-headers.c<br>
&gt; +@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *=
hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (g_ascii_strcasecmp (name, &quot;Host&quot;) =
=3D=3D 0 &amp;&amp; soup_message_headers_get_one (hdrs, &quot;Host&quot;))<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; header.name =3D intern_header_name (name, &a=
mp;setter);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; header.value =3D g_strdup (value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_array_append_val (hdrs-&gt;array, header);=
<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1=
.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..64e87cb1ec<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch<=
br>
&gt; @@ -0,0 +1,229 @@<br>
&gt; +From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +Date: Thu, 5 Feb 2026 16:20:02 +0800<br>
&gt; +Subject: [PATCH 1/2] websocket: add a way to restrict the total messa=
ge size<br>
&gt; +<br>
&gt; +Otherwise a client could send small packages smaller than<br>
&gt; +total-incoming-payload-size but still to break the server<br>
&gt; +with a big allocation<br>
&gt; +<br>
&gt; +Fixes: #390<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce" id=3D"OWAbd0e4de=
4-002e-7bc1-7c4d-3c3796c03e45" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfe=
d2cb409dbfd63c7fdce</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +libsoup2 is not maintained, the patch is backported from libsoup3, an=
d<br>
&gt; +change accordingly<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++=
--<br>
&gt; + libsoup/soup-websocket-connection.h |&nbsp;&nbsp; 7 ++<br>
&gt; + 2 files changed, 107 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-webso=
cket-connection.c<br>
&gt; +index 9d5f4f8..3dad477 100644<br>
&gt; +--- a/libsoup/soup-websocket-connection.c<br>
&gt; ++++ b/libsoup/soup-websocket-connection.c<br>
&gt; +@@ -85,7 +85,8 @@ enum {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_STATE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_MAX_INCOMING_PAYLOAD_SIZE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_KEEPALIVE_INTERVAL,<br>
&gt; +-&nbsp;&nbsp;&nbsp; PROP_EXTENSIONS<br>
&gt; ++&nbsp;&nbsp;&nbsp; PROP_EXTENSIONS,<br>
&gt; ++&nbsp;&nbsp;&nbsp; PROP_MAX_TOTAL_MESSAGE_SIZE,<br>
&gt; + };<br>
&gt; +<br>
&gt; + enum {<br>
&gt; +@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *origin;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *protocol;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; guint64 max_incoming_payload_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp; guint64 max_total_message_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; guint keepalive_interval;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gushort peer_close_code;<br>
&gt; +@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {<br>
&gt; + };<br>
&gt; +<br>
&gt; + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; + #define READ_BUFFER_SIZE 1024<br>
&gt; + #define MASK_LENGTH 4<br>
&gt; +<br>
&gt; +@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection=
 *self)<br>
&gt; + }<br>
&gt; +<br>
&gt; + static void<br>
&gt; +-too_big_error_and_close (SoupWebsocketConnection *self,<br>
&gt; ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *s=
elf,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; guint64 payload_len)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GError *error;<br>
&gt; +@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection=
 *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; emit_error_and_close (self, error, TRUE);<br=
>
&gt; + }<br>
&gt; +<br>
&gt; ++static void<br>
&gt; ++too_big_message_error_and_close (SoupWebsocketConnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guint64 len)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; GError *error;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; error =3D g_error_new_literal (SOUP_WEBSOCKET_ERR=
OR,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_WEBSOCKET_CLOSE_TOO_=
BIG,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self-&gt;pv-&gt;connectio=
n_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER ?<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Received WebSocket =
payload from the client larger than configured max-total-message-size&quot;=
 :<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Received WebSocket =
payload from the server larger than configured max-total-message-size&quot;=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_debug (&quot;%s received message of size %&quot=
; G_GUINT64_FORMAT &quot; or greater, but max supported size is %&quot; G_G=
UINT64_FORMAT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; self-&gt;pv-&gt;connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVE=
R ? &quot;server&quot; : &quot;client&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; len, self-&gt;pv-&gt;max_total_message_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp; emit_error_and_close (self, error, TRUE);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + close_connection (SoupWebsocketConnection *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gushort&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
code,<br>
&gt; +@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; switch (pv-&gt;message_opcode) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 0x01:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 0x02:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Safety valve */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pv-&gt;max_total_message=
_size &gt; 0 &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pv-=
&gt;message_data-&gt;len + payload_len) &gt; pv-&gt;max_total_message_size)=
 {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; too_big_message_error_and_close (self, (pv-&gt;message_=
data-&gt;len + payload_len));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_byte_array_append (pv=
-&gt;message_data, payload, payload_len);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; default:<br>
&gt; +@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Safety valve */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (self-&gt;pv-&gt;max_incoming_payload_siz=
e &gt; 0 &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; payload_len &gt;=3D =
self-&gt;pv-&gt;max_incoming_payload_size) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t=
oo_big_error_and_close (self, payload_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t=
oo_big_incoming_payload_error_and_close (self, payload_len);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return FALSE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObjec=
t *object,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; g_value_set_pointer (value, pv-&gt;extensions);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; case PROP_MAX_TOTAL_MESSAGE_SIZE:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_value_set_uint64 (value, pv-&gt;max_total_message_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObjec=
t *object,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pv-&gt;extensions =3D g_value_get_pointer (value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; case PROP_MAX_TOTAL_MESSAGE_SIZE:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
v-&gt;max_total_message_size =3D g_value_get_uint64 (value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebs=
ocketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; G_PARAM_READWRITE |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; G_PARAM_CONSTRUCT_ONLY |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; G_PARAM_STATIC_STRINGS));<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp; /**<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-total-message=
-size:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The total message size for incoming packe=
ts.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The protocol expects or 0 to not limit it=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_object_class_install_property (gobject_class, P=
ROP_MAX_TOTAL_MESSAGE_SIZE,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_param=
_spec_uint64 (&quot;max-total-message-size&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Max total message size&qu=
ot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Max total message size &q=
uot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_MAXUINT64,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAX_TOTAL_MESSAGE_SIZE_DEFAULT,=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_READWRITE |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_CONSTRUCT |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_STATIC_STRINGS));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection::message:<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @self: the WebSocket<br>
&gt; +@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_pay=
load_size (SoupWebsocketConnection<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/**<br>
&gt; ++ * soup_websocket_connection_get_max_total_message_size:<br>
&gt; ++ * @self: the WebSocket<br>
&gt; ++ *<br>
&gt; ++ * Gets the maximum total message size allowed for packets.<br>
&gt; ++ *<br>
&gt; ++ * Returns: the maximum total message size.<br>
&gt; ++ *<br>
&gt; ++ */<br>
&gt; ++guint64<br>
&gt; ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketC=
onnection *self)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; SoupWebsocketConnectionPrivate *pv;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (sel=
f), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);<br>
&gt; ++&nbsp;&nbsp; pv =3D self-&gt;pv;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; return pv-&gt;max_total_message_size;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/**<br>
&gt; ++ * soup_websocket_connection_set_max_total_message_size:<br>
&gt; ++ * @self: the WebSocket<br>
&gt; ++ * @max_total_message_size: the maximum total message size<br>
&gt; ++ *<br>
&gt; ++ * Sets the maximum total message size allowed for packets.<br>
&gt; ++ *<br>
&gt; ++ * It does not limit the outgoing packet size.<br>
&gt; ++ *<br>
&gt; ++ */<br>
&gt; ++void<br>
&gt; ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketC=
onnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_total_mess=
age_size)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; SoupWebsocketConnectionPrivate *pv;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));=
<br>
&gt; ++&nbsp;&nbsp; pv =3D self-&gt;pv;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; if (pv-&gt;max_total_message_size !=3D max_total_messag=
e_size) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pv-&gt;max_total_message_size =
=3D max_total_message_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_object_notify (G_OBJECT (self=
), &quot;max-total-message-size&quot;);<br>
&gt; ++&nbsp;&nbsp; }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * soup_websocket_connection_get_keepalive_interval:<br>
&gt; +&nbsp; * @self: the WebSocket<br>
&gt; +diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-webso=
cket-connection.h<br>
&gt; +index f82d723..d2a60e9 100644<br>
&gt; +--- a/libsoup/soup-websocket-connection.h<br>
&gt; ++++ b/libsoup/soup-websocket-connection.h<br>
&gt; +@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58<br>
&gt; + void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_keepalive_interval=
 (SoupWebsocketConnection *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guint&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; interval);<br>
&gt; +<br>
&gt; ++SOUP_AVAILABLE_IN_2_72<br>
&gt; ++guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; soup_websocket_connection_get_max_total_message_size&nbsp;&nbsp=
;&nbsp; (SoupWebsocketConnection *self);<br>
&gt; ++<br>
&gt; ++SOUP_AVAILABLE_IN_2_72<br>
&gt; ++void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_=
size&nbsp;&nbsp;&nbsp; (SoupWebsocketConnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_total_message_size);<b=
r>
&gt; ++<br>
&gt; + G_END_DECLS<br>
&gt; +<br>
&gt; + #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2=
.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..f9c894aaec<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch<=
br>
&gt; @@ -0,0 +1,131 @@<br>
&gt; +From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +Date: Thu, 5 Feb 2026 17:19:51 +0800<br>
&gt; +Subject: [PATCH] Set message size limit in SoupServer rather than<br>
&gt; + SoupWebsocketConnection<br>
&gt; +<br>
&gt; +We're not sure about the compatibility implications of having a defau=
lt<br>
&gt; +size limit for clients.<br>
&gt; +<br>
&gt; +Also not sure whether the server limit is actually set appropriately,=
<br>
&gt; +but there is probably very little server usage of<br>
&gt; +SoupWebsocketConnection in the wild, so it's not so likely to break<b=
r>
&gt; +things.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7" id=3D"OWAb3cc4a8=
3-424f-98ce-e91a-7e153b692e2d" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3=
b36f098cf69233b1df7</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/soup-server.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 24 +++++++++++++++++++-----<br>
&gt; + libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------<br>
&gt; + 2 files changed, 35 insertions(+), 12 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c<br>
&gt; +index 63875f3..a3f8597 100644<br>
&gt; +--- a/libsoup/soup-server.c<br>
&gt; ++++ b/libsoup/soup-server.c<br>
&gt; +@@ -216,6 +216,16 @@ enum {<br>
&gt; +<br>
&gt; + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)<=
br>
&gt; +<br>
&gt; ++/* SoupWebsocketConnection by default limits only maximum packet siz=
e. But a<br>
&gt; ++ * message may consist of multiple packets, so SoupServer additional=
ly restricts<br>
&gt; ++ * total message size to mitigate denial of service attacks on the s=
erver.<br>
&gt; ++ * SoupWebsocketConnection does not do this by default because I don=
't know<br>
&gt; ++ * whether that would or would not cause compatibility problems for =
websites.<br>
&gt; ++ *<br>
&gt; ++ * This size is in bytes and it is arbitrary.<br>
&gt; ++ */<br>
&gt; ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; ++<br>
&gt; + static SoupClientContext *soup_client_context_ref (SoupClientContext=
 *client);<br>
&gt; + static void soup_client_context_unref (SoupClientContext *client);<b=
r>
&gt; +<br>
&gt; +@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg,=
 gpointer user_data)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_client_context_ref (client);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; stream =3D soup_client_context_steal_connect=
ion (client);<br>
&gt; +-&nbsp;&nbsp;&nbsp; conn =3D soup_websocket_connection_new_with_exten=
sions (stream, uri,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_WEBSOCKET_CONNECTION=
_SERVER,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_get_=
one (msg-&gt;request_headers, &quot;Origin&quot;),<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_get_=
one (msg-&gt;response_headers, &quot;Sec-WebSocket-Protocol&quot;),<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler-&gt;websocket_ext=
ensions);<br>
&gt; ++&nbsp;&nbsp;&nbsp; conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new =
(SOUP_TYPE_WEBSOCKET_CONNECTION,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;io-stream&quot;, stream,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;uri&quot;, uri,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;connection-type&quot;, SOUP_WEBSOCKET_CONNE=
CTION_SERVER,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&quot;, soup_message_headers_get_one =
(msg-&gt;request_headers, &quot;Origin&quot;),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;protocol&quot;, soup_message_headers_get_on=
e (msg-&gt;response_headers, &quot;Sec-WebSocket-Protocol&quot;),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extensions&quot;, handler-&gt;websocket_ext=
ensions,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot;max-total-message-size&quot;, (guint64)MAX_=
TOTAL_MESSAGE_SIZE_DEFAULT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; handler-&gt;websocket_extensions =3D NULL;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_object_unref (stream);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_client_context_unref (client);<br>
&gt; +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-webso=
cket-connection.c<br>
&gt; +index 3dad477..e7fa9b7 100644<br>
&gt; +--- a/libsoup/soup-websocket-connection.c<br>
&gt; ++++ b/libsoup/soup-websocket-connection.c<br>
&gt; +@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {<br>
&gt; + };<br>
&gt; +<br>
&gt; + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; + #define READ_BUFFER_SIZE 1024<br>
&gt; + #define MASK_LENGTH 4<br>
&gt; +<br>
&gt; +@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebso=
cketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-incoming=
-payload-size:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The maximum payload size for incoming pac=
kets the protocol expects<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * or 0 to not limit it.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The maximum payload size for incoming pac=
kets, or 0 to not limit it.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Each message may consist of multiple pack=
ets, so also refer to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * [property@WebSocketConnection:max-total-m=
essage-size].<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Since: 2.56<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebs=
ocketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-total-me=
ssage-size:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The total message size for incoming packe=
ts.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The maximum size for incoming messages.<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Set to a value to limit the total message=
 size, or 0 to not<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * limit it.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The protocol expects or 0 to not limit it=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * [method@Server.add_websocket_handler] wil=
l set this to a nonzero<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * default value to mitigate denial of servi=
ce attacks. Clients must<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * choose their own default if they need to =
mitigate denial of service<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * attacks. You also need to set your own de=
fault if creating your own<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * server SoupWebsocketConnection without us=
ing SoupServer.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Each message may consist of multiple pack=
ets, so also refer to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *[property@WebSocketConnection:max-incoming=
-payload-size].<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_object_class_install_property (gobject_cla=
ss, PROP_MAX_TOTAL_MESSAGE_SIZE,<br>
&gt; +@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebso=
cketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Max total message si=
ze &quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_MAXUINT64,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAX_TOTAL_MESSAGE_SIZE_DEFAULT,=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_READWRITE |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_CONSTRUCT |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_PARAM_STATIC_STRINGS));<=
br>
&gt; +@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message=
_size (SoupWebsocketConnection *s<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp; SoupWebsocketConnectionPrivate *pv;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (sel=
f), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);<br>
&gt; ++&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (sel=
f), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp; pv =3D self-&gt;pv;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return pv-&gt;max_total_message_size;<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta=
/recipes-support/libsoup/libsoup-2.4_2.74.3.bb<br>
&gt; index 7e00cd678a..915d735da3 100644<br>
&gt; --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb<br>
&gt; @@ -41,6 +41,9 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER=
}/libsoup-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-4476.patch" id=3D"OWA5a20ab8b-124f-5480-21e8-c=
5e8792548b0" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-4476.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-2784.patch" id=3D"OWA5c49214b-a49d-9880-388e-b=
3ddf2cddbb8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-2784.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-4945.patch" id=3D"OWA8b949d85-1f92-1796-273e-6=
21e02a0820a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-4945.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-14523.patch" id=3D"OWA3b2a65f7-c924-879c-a9e9-a277282c2=
043" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-14523.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-1.patch" id=3D"OWA1332fdae-16b3-ad57-eca3-4886b7c=
2c781" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-1.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-2.patch" id=3D"OWA71719568-763c-68fe-ac4c-154444f=
eac01" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-2.patch</a>&nbsp;\<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb=
75ef7c5a034153df1413fa1d92f13&quot;<br>
&gt;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DS0PR11MB7312B681A9DFE464C3F99DE4822B2DS0PR11MB7312namp_--

