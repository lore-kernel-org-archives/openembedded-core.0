Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327F8C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 06:11:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23054.1786337860058452675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gultu+Qd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2682d7bd28=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4HD3S955433
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:34:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=G0W/TImTgWSQo96uvNdXsZeoinHS0SloQ/1lRlh1qQU=; b=
	gultu+Qdg03PBptxaZIoZ+Mdqexxr9dgb53YiD39Q44ban2Y2tltlIAH7O2pFaTX
	SO+bTbndQwnv88BU8S2bbfUqqv7CDcWKKDul3JzxOEgu9cw4K0Z334i01S7ThJFT
	yJE6fIvmKbBoaN8mrzGT5UYiaUhyW0/sHjOWja/kYdRzoO6ce+dTAgh3gTtk3PAV
	PB3WiUuD3o7AtQxFwyzuasVQfcthdy/PhD6qCkr2U1qMSlI6HErXr2Vabz8bHcdK
	BhB3mNqqQDd2xRlHrXDh5lxexCF62TfNqpOR/RYHVR4FWHVeHMC6xYPwQAlfuWgY
	ch7zRwu2l/OA9cgkAckU8Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwyr1sm8j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 21:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9Vf0xCqFpT9pqr4FMsTUGnHNHFuIKdZauGYHsrCy7vTFLXTJldZJzJMsbtkS9ZuLf/uKlpobT3czrwhatjS1LBzIEgE/GV1wUnt5PO7ZelSmrsR0rdFVwskMf2LilpX7mJO+JvWHW+OSBVTsPtmcUXaMO1iM6BQBsRkgNbnQPdrBblLk1+ZoLPqsVGMeqlNyKtSe+ZEpMHtUa5ODPHGWDo+Nbxx4Tc1kUZri4twzSVvuW7yE2W45oOyPPBDtbaXPGb3z4uysmglhL1OuMIeHLIjGNP6GP4qEI0+mbDGWM3N4p5JSI/cHsEPlaVIOojIg0MapqeKTNUTeQ9M8F/NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0W/TImTgWSQo96uvNdXsZeoinHS0SloQ/1lRlh1qQU=;
 b=IBOqF29BMSVj+unl7UDxdWuPbVKY80Cp3IsDD6Zfnc2pGsaY6xvjzlkHpL3UrDSd+qzuFy9vOSKz4ZG2fpcx2dVOSslnhnwJjAyYNcDN5za6iYMrYr0TEOczhAppn5mIQ4YvfNYKi8Y2LN8ttqhsbI/CIr8/ZBxiU0Sz8xSAUkuVZ+KiNPlJ60Mhrpg/XMJp4DQLT5c84ZaYAJzQWtiBJA4YLxTvQiyIFUmSXivngGNepLRCyOE7aIMfY+9zaNq6VIXgKZSQkvGSAdqxNvjxJv9GN4d7EurbYtn4u96xxUlWCsVQpns/FfEnYB+MKKFZsojK/01nckREs+ddt2+b5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:34:43 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:34:43 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Komati, Shiva"
	<Shiva.Komati@windriver.com>,
        Himani Barde <himani.barde@windriver.com>
Subject: Re: [PATCH] libarchive: backport fix for archive_read_append_filter test failure
Thread-Topic: [PATCH] libarchive: backport fix for archive_read_append_filter
 test failure
Thread-Index: AQHdKIGQFzhxMsFUHkettxyW5h+DMw==
Date: Mon, 10 Aug 2026 04:34:43 +0000
Message-ID: 
 <CH3PR11MB877447D383579D7A095B7E538FDE2@CH3PR11MB8774.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-10T04:34:42.776Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: 553ce11a-aa9b-43ff-ed77-08def698b358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10070799003|12006099003|18002099003|11063799006|56012099006|8096899003|13003099007|38070700021|6133799003|16056099006|10067099003;
x-microsoft-antispam-message-info: 
 1ZXFfEQYeEFO7Inxe5Gq+BNixtCFSvTUvEjMIwjm56+rfvuwmmt6TPRfFV3vVomqYBTgy0i6ThDA349ccw8cduzgmR2eApMmvzRcN1xs8G0gK/HCp5On/43/JiLYxCiY0Jn1gDZlLMprEkIPTcurX0LDBaz4Oz4RFf960FkeAaVnoBxwcVP8xSoNeFZY5f94yIz3a+sYSnoFA3mv3m5NhNA4SzlrUx+9Db/uH6maYVGXxV3t+cU4KqRqveTfIZEvHmLBDG0H+dUVr0Ge22EFaQrcPzEYf+4OAurIaOQd3qkjTRIBwjErHMmfsmBS3U5q8xkJeUkRxQxG5tPDMOZy1B0OEDFyFaUQzE+cnv2v+jJCOaorfjrPcOI5sbp5rfwx3xxcPlwI/1OskvY8imKzbCUs4vD3KmVt5AMK+q67QikVyonJGB1YScl+OVzdrc65+dbQqrxzwv376YW4gXNc3TCn6Ux+KON4VHxCbjebuYDgU1HnL6SF2JAUGdEvCtQRvrZ2Cmilbnww5xlWQgwjjt5pSdPYl9EcYu2yRGxq6/3wtr29WWA3dshSSnWR5I4CDnjnWSuRpSVSerzOlN9MT3OR34CecpnE7tI3i/ITslYVDdb1pKbHjqwl90NZs2/9EoLkdpBdYGwXbtVN/AWWkrf/W2oYMepB+B+K48bO5K8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(12006099003)(18002099003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021)(6133799003)(16056099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Y1FDyXgd+++8znJIwlCJVeDqhplooABmJ2zO1DKfjA1wm4gWjzetZvig?=
 =?Windows-1252?Q?IDCV1OVoXFd1q229NrPK/nQiuCekKgUxLgNmTVjXlFOuhJhgs5T33giC?=
 =?Windows-1252?Q?hIxavwFagA5l6aZsRuusaI5p8DFE4SuUHWpL2VgVNzuiJC2MB1wjZN2S?=
 =?Windows-1252?Q?Basue8Z5+d8+CYZZERHwiGMo1dYKb2LMQ0xcju4RHTwoxGJ0AgHh48J0?=
 =?Windows-1252?Q?PAHPxJsqrqtt/25yoEe8nhT/EBMugIbXxvKu25PopFSd16jLylNBck9y?=
 =?Windows-1252?Q?FWqBK0AFJWE4/Jmm4cpReUQXi9EeeIKJQb4SqZWBIcnjJ6sJnwHsfSur?=
 =?Windows-1252?Q?L1nkkp1/9pkNGcCgwjeg9cdiWHI3te2OLEohuJkuXASlR5quexG1VSZu?=
 =?Windows-1252?Q?nN9PKnGUJg+0EEuMSr9OC7okiGPYw88r979Gd8t9kWPJHz4BWpcEfn9v?=
 =?Windows-1252?Q?adKujw1bfKKKb+5kWB49x3RMvIOTtTn18//JZAudErlKPmK6iiGuyzYY?=
 =?Windows-1252?Q?uTAlcHqKDkffSso3NWiNgenu8Kt9WN+Iw36ANt3BDJ59JO5bg4uViLul?=
 =?Windows-1252?Q?8LAt9fOZkiJjFHDXvDjQJHVmHKJNfhvU8seYalMX/MfrO05vI9Hn5Li2?=
 =?Windows-1252?Q?JHxLZkyz+iNUDvO7083O4aoQR6HFB97IqrDwD2g4PH/XJmgyT+tw64Sj?=
 =?Windows-1252?Q?2YsyiJPZVLBMdg3sEQ12K6riDpDydZeb3UI/uq5o4eujDp32rgaaIE6o?=
 =?Windows-1252?Q?NqxlS+i2RMDciUycvZXCruUOI1viT5uxJtfoFckNxNQFv6hpd3m30Y6F?=
 =?Windows-1252?Q?SxMxbL5FKGJ3IlFGxGATUkF2J+UEKJvDg/oqYL4NwvjoczhR/RzgZQdq?=
 =?Windows-1252?Q?fisM3WbnI+mSnUddoqbIdvY1mq3YLZOTFRasMqzRSnZn0ZA2OA8XbzdG?=
 =?Windows-1252?Q?44tzePkNYNWDC2F39azp5S313qXS4GbWCJk8PeF4vfxX4neljjIyyki+?=
 =?Windows-1252?Q?Xask8FovQwzaKe5Z/NWxhxsbyU7YFsTnnKBopikTcJc5kjZ3R6uE4ji8?=
 =?Windows-1252?Q?uUjAgLZW614sNJNj6hJEIjHWprdliSf9hbhw5ovGn/6alJVtIqCeH3Vj?=
 =?Windows-1252?Q?5yRc1u8Xp9WHwjQgNtyadh7sFh/5Nl5Qyghr2AktYrjVsyPLXldffTiT?=
 =?Windows-1252?Q?v9wm43qaBRk1PNvLy+HQDr8o/AEVYdzoYn4rIi3dhMK2w/K3tG+iVIxS?=
 =?Windows-1252?Q?GAAz7uyJ7Zm8DZZFt28UDI5ZK7wducOHxXHc1tcJuE1saJ1xpjkOy+WH?=
 =?Windows-1252?Q?1nvuMXTGTZIFXpO/+lD8/wBRD731AVm02cOX7YaNpX4pRU5RwZGyXceQ?=
 =?Windows-1252?Q?6szBJLuSvqvcwhOyy/GHtqjZd08rIChFtzdTx0yZ7dIUlxPjmx1OM9Sk?=
 =?Windows-1252?Q?2lSgKgS51JgGcA0rjBZuR3I2yQEMlp5fL2SlftsLS8zuokFxZsWlJdy8?=
 =?Windows-1252?Q?6+dMXWe3Fx6+6xRtXo5lQ9EQT1Alo5DbeCcyrcmrfNVGFhV2Smqv3TrY?=
 =?Windows-1252?Q?bx2GbdEaE7H2JQcM/VC6ep2YNZ/+JFYrS3zYdz+x3uuhlkbA7kO7JbMG?=
 =?Windows-1252?Q?I/DvplsJpQbjsw6xSuslCyTW6TxO9M27n6yL+DFv+bHhgL80VQoD1BP9?=
 =?Windows-1252?Q?GhAc+PZE2Ic36ThyAwA86VXvHxW2zdFiQEYyB9a3uDXOt903Rjd0DZ5V?=
 =?Windows-1252?Q?LJF8cRGXuJgjPohvQ2fpPWiZRosnDH6vRRFF5B9k1bIKJaooKWqxar8Z?=
 =?Windows-1252?Q?1RD7RVRSYmZSusypSBAl16ZQ+bIcYz2yO+1VE3Hf4dFwSdqlTQwA3RQb?=
 =?Windows-1252?Q?ESy4ynyO+2Sdg6yFkF0XkY7JGS7KIg/ZPqudZ7Abk2wc8mEQ9vd5L0+r?=
 =?Windows-1252?Q?XEjvUPP4?=
x-ms-exchange-antispam-messagedata-1: AYKwA5AIarVUQD3ewGSfAUPSOkmYR3YJFd4=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CUceIkz0E6STBXnirV7MeEvfQxjwBKQ5AzhkWJm/qStbRbl1gHJL2Lmn9cnjE1Ax4oIZLKQPiCtnIrCSWNz5nzTgGB1T2pJIcNd0Vbpu6M6u2WnZ5nKV3RHDgG6brcBW83AKzWaZ556JbbL2fN6U3VvwbT6wzc73zn9N1SW5LR1qLp59cyXYZBaPrdIsGcv3tZWUp/g3lBnJtPkvcYAvROdaiQzSohyZ9DqtTPj6g93oVSE6RC8CycM7tsm/0TgwaiMXUPEoHEZ8Kx1o/dwYnIGCNMcyKiknKLtcrWxmw94UKzIeZ/cmy2Qrmd/p5RxoNwydwV5lPbsbHWmAFwdKxw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553ce11a-aa9b-43ff-ed77-08def698b358
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 04:34:43.7212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeOrjq8OQI2y+HFtu6O0R1ajimNde5lDxdUzglxyyELpieMRLgxy+epie9bjmKKCckw6Lr3PX9EO7a9mYuMkoecaTXyyrMc4eOg+1jcIuy5sTwtdjeBEr2mSumIDACYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfX5xEWQS1rL/lk
 ZLfaHsUkzANzao2Z6Rrb7VsEX9NLF1wba6k94vvKQrv6jWVwX9LdlqN9xZGa4eGtERBPOVtsOLv
 sIkCGgVsAjPWV9/4NsncxGIu95+0Y9wDwxu1vrsz9pvPGWqLa/KBIK5htxZkLZGOGny4nb9R3Md
 4NGg5F1dHQaj9iCld+5Vd32dlAgPwuxRE0tUl7dfZMbITySXM+zqBw7y9ECop+zTujYiHxMeqi5
 W/botkQOw4E8yLOduoBlPYu43KmGw32GoyxmYvlNKEM6wokSNL0sc+9ue93703IEGR/4DbWS79y
 AgpVZC9h1w1G25eaZXQ2nYG9JJQqitOnUiCsHqjVesT/SIbGaxz0IaV1l6gQ/7igB2TctCO7sip
 L1B8JDTQFsQCK7blt1Fy5SNY5ClyAwo8HTeBGb9YGDo4Ms6s1Buu/r4MFtPQ0BkbEXpLLCsm8kP
 uiHvHZ+zVj/EQa/m83g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfX9V6f2+JoOZDT
 FFWnmU3diG83TJLbikjKxWUl5fW5DPg2cvr6iDBFGtecZ+pDx6IPb4z0SwbZHt8V+CXEQKA2+Yw
 pQysF3AxErK7GRcjWgNX/EAFaWVoJ8v47mYr979ytbNPps7D2CYx
X-Authority-Analysis: v=2.4 cv=Z5Lc2nRA c=1 sm=1 tr=0 ts=6a7954e5 cx=c_pps
 a=E+RN6GuJaivtKjsQX17oSA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=tyuvAb6jAAAA:8 a=KVw7aSyUq2OUZOWIxHEA:9 a=pILNOxqGKmIA:10
 a=L4pqCS8NAZTdlyclMG0A:9 a=TM4M2-37IDDxoHlM:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=fYNom5PXsM5enKJDCoVv:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-ORIG-GUID: fRr_6sNjCSPB2oipsM4mKQstiq4PQM09
X-Proofpoint-GUID: fRr_6sNjCSPB2oipsM4mKQstiq4PQM09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100035
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB877447D383579D7A095B7E538FDE2CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 06:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243110

--_000_CH3PR11MB877447D383579D7A095B7E538FDE2CH3PR11MB8774namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate sends. I had an incorrect From email address in=
 my git config which caused delivery failures, so I re-sent after fixing it=
. I didn't realize the earlier attempts had gone through to the list.

Please ignore this version =97 the correct patch is the one with the update=
d From address.

I've verified my git send-email configuration is now correct to avoid this =
in the future.

Sorry for the noise.


Thanks,
Himani

________________________________
From: Barde, Himani Ramesh
Sent: Friday, August 7, 2026 1:05 PM
To: openembedded-core@lists.openembedded.org
Cc: MacLeod, Randy; Komati, Shiva; Himani Barde
Subject: Re: [PATCH] libarchive: backport fix for archive_read_append_filte=
r test failure

From: Himani Barde <himani.barde@windriver.com>

Backport upstream commit 50b585bb ('append_filter: Use last bidder for
filter') to fix test_read_append_rpm_filter ptest failure.

The archive_read_append_filter() function used a name-based bidder
lookup loop that could fail to locate the correct bidder due to a
desync between the loop index and the bidder array. The fix replaces
this with get_last_bidder() which returns the most recently registered
bidder.

Upstream: https://github.com/libarchive/libarchive/commit/50b585bb

Signed-off-by: Himani Barde <himani.barde@windriver.com>
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Use-last-bidder-for-filter.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch
new file mode 100644
index 0000000000..8e1eb0e938
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch
@@ -0,0 +1,188 @@
+From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:27:17 +0200
+Subject: [PATCH] append_filter: Use last bidder for filter
+
+Appending a filter implies appending a bidder. Always use the last added
+bidder, since it was just added. This avoids desync situations where
+previously added bidders could erroneously match.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/50b585bb]
+---
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
+ 1 file changed, 22 insertions(+), 50 deletions(-)
+
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
+index 8de1b2ea..9dd9f536 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -33,14 +33,25 @@
+ #include "archive_private.h"
+ #include "archive_read_private.h"
+
++static struct archive_read_filter_bidder *
++get_last_bidder(struct archive_read *a)
++{
++  size_t i;
++
++  for (i =3D 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
++  {
++    if (a->bidders[i].vtable =3D=3D NULL)
++      break;
++  }
++
++  return a->bidders + (i - 1);
++}
++
+ int
+ archive_read_append_filter(struct archive *_a, int code)
+ {
+-  int r1, r2, number_bidders, i;
+-  const char *str;
+-  struct archive_read_filter_bidder *b;
+-  struct archive_read_filter *f;
+   struct archive_read *a =3D (struct archive_read *)_a;
++  int r1, r2;
+
+   r2 =3D (ARCHIVE_OK);
+   switch (code)
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+       r1 =3D (ARCHIVE_OK);
+       break;
+     case ARCHIVE_FILTER_GZIP:
+-      str =3D "gzip";
+       r1 =3D archive_read_support_filter_gzip(_a);
+       break;
+     case ARCHIVE_FILTER_BZIP2:
+-      str =3D "bzip2";
+       r1 =3D archive_read_support_filter_bzip2(_a);
+       break;
+     case ARCHIVE_FILTER_COMPRESS:
+-      str =3D "compress (.Z)";
+       r1 =3D archive_read_support_filter_compress(_a);
+       break;
+     case ARCHIVE_FILTER_PROGRAM:
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+           "Cannot append program filter using archive_read_append_filter"=
);
+       return (ARCHIVE_FATAL);
+     case ARCHIVE_FILTER_LZMA:
+-      str =3D "lzma";
+       r1 =3D archive_read_support_filter_lzma(_a);
+       break;
+     case ARCHIVE_FILTER_XZ:
+-      str =3D "xz";
+       r1 =3D archive_read_support_filter_xz(_a);
+       break;
+     case ARCHIVE_FILTER_UU:
+-      str =3D "uu";
+       r1 =3D archive_read_support_filter_uu(_a);
+       break;
+     case ARCHIVE_FILTER_RPM:
+-      str =3D "rpm";
+       r1 =3D archive_read_support_filter_rpm(_a);
+       break;
+     case ARCHIVE_FILTER_LZ4:
+-      str =3D "lz4";
+       r1 =3D archive_read_support_filter_lz4(_a);
+       break;
+     case ARCHIVE_FILTER_ZSTD:
+-      str =3D "zstd";
+       r1 =3D archive_read_support_filter_zstd(_a);
+       break;
+     case ARCHIVE_FILTER_LZIP:
+-      str =3D "lzip";
+       r1 =3D archive_read_support_filter_lzip(_a);
+       break;
+     case ARCHIVE_FILTER_LZOP:
+-      str =3D "lzop";
+       r1 =3D archive_read_support_filter_lzop(_a);
+       break;
+     case ARCHIVE_FILTER_LRZIP:
+-      str =3D "lrzip";
+       r1 =3D archive_read_support_filter_lrzip(_a);
+       break;
+     case ARCHIVE_FILTER_GRZIP:
+-      str =3D "grzip";
+       r1 =3D archive_read_support_filter_grzip(_a);
+       break;
+     default:
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)
+       return (ARCHIVE_FATAL);
+   }
+
+-  if (code !=3D ARCHIVE_FILTER_NONE)
++  if (r1 > ARCHIVE_FATAL && code !=3D ARCHIVE_FILTER_NONE)
+   {
+-    number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-    b =3D a->bidders;
+-    for (i =3D 1; i < number_bidders; i++, b++)
+-    {
+-      if (!b->name || !strcmp(b->name, str))
+-        break;
+-    }
+-    if (!b->name || strcmp(b->name, str))
+-    {
+-      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-          "Internal error: Unable to append filter");
+-      return (ARCHIVE_FATAL);
+-    }
++    struct archive_read_filter_bidder *b;
++    struct archive_read_filter *f;
+
+     f =3D calloc(1, sizeof(*f));
+     if (f =3D=3D NULL)
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+       archive_set_error(&a->archive, ENOMEM, "Out of memory");
+       return (ARCHIVE_FATAL);
+     }
++    b =3D get_last_bidder(a);
+     f->bidder =3D b;
+     f->archive =3D a;
+     f->upstream =3D a->filter;
+@@ -162,37 +149,22 @@ int
+ archive_read_append_filter_program_signature(struct archive *_a,
+   const char *cmd, const void *signature, size_t signature_len)
+ {
+-  int r, number_bidders, i;
++  struct archive_read *a =3D (struct archive_read *)_a;
+   struct archive_read_filter_bidder *b;
+   struct archive_read_filter *f;
+-  struct archive_read *a =3D (struct archive_read *)_a;
++  int r;
+
+   if (archive_read_support_filter_program_signature(_a, cmd, signature,
+     signature_len) !=3D (ARCHIVE_OK))
+     return (ARCHIVE_FATAL);
+
+-  number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-  b =3D a->bidders;
+-  for (i =3D 0; i < number_bidders; i++, b++)
+-  {
+-    /* Program bidder name set to filter name after initialization */
+-    if (b->data && !b->name)
+-      break;
+-  }
+-  if (!b->data)
+-  {
+-    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-        "Internal error: Unable to append program filter");
+-    return (ARCHIVE_FATAL);
+-  }
+-
+   f =3D calloc(1, sizeof(*f));
+   if (f =3D=3D NULL)
+   {
+     archive_set_error(&a->archive, ENOMEM, "Out of memory");
+     return (ARCHIVE_FATAL);
+   }
++  b =3D get_last_bidder(a);
+   f->bidder =3D b;
+   f->archive =3D a;
+   f->upstream =3D a->filter;
+--
+2.54.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb
index 63c66eea81..35b724ca39 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"

 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypt=
o.patch \
           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
--
2.54.0


--_000_CH3PR11MB877447D383579D7A095B7E538FDE2CH3PR11MB8774namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Apologies for the duplicate sends. I had an incorrect From email address in=
 my git config which caused delivery failures, so I re-sent after fixing it=
. I didn't realize the earlier attempts had gone through to the list.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this version =97 the correct patch is the one with the update=
d From address.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've verified my git send-email configuration is now correct to avoid this =
in the future.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry for the noise.</div>
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
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Barde, Himani Ramesh<br>
<b>Sent:</b> Friday, August 7, 2026 1:05 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> MacLeod, Randy; Komati, Shiva; Himani Barde<br>
<b>Subject:</b> Re: [PATCH] libarchive: backport fix for archive_read_appen=
d_filter test failure
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">From: Himani Barde=
 &lt;himani.barde@windriver.com&gt;<br>
<br>
Backport upstream commit 50b585bb ('append_filter: Use last bidder for<br>
filter') to fix test_read_append_rpm_filter ptest failure.<br>
<br>
The archive_read_append_filter() function used a name-based bidder<br>
lookup loop that could fail to locate the correct bidder due to a<br>
desync between the loop index and the bidder array. The fix replaces<br>
this with get_last_bidder() which returns the most recently registered<br>
bidder.<br>
<br>
Upstream: <a href=3D"https://github.com/libarchive/libarchive/commit/50b585=
bb" target=3D"_blank" id=3D"OWA4e50f279-6d44-7f7b-c325-8acd2701e6b9" class=
=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">
https://github.com/libarchive/libarchive/commit/50b585bb</a><br>
<br>
Signed-off-by: Himani Barde &lt;himani.barde@windriver.com&gt;<br>
---<br>
&nbsp;...nd_filter-Use-last-bidder-for-filter.patch | 188 +++++++++++++++++=
+<br>
&nbsp;.../libarchive/libarchive_3.8.9.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 189 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-a=
ppend_filter-Use-last-bidder-for-filter.patch<br>
<br>
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch<br>
new file mode 100644<br>
index 0000000000..8e1eb0e938<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch<br>
@@ -0,0 +1,188 @@<br>
+From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001<br>
+From: Tobias Stoeckmann &lt;tobias@stoeckmann.org&gt;<br>
+Date: Sun, 2 Aug 2026 14:27:17 +0200<br>
+Subject: [PATCH] append_filter: Use last bidder for filter<br>
+<br>
+Appending a filter implies appending a bidder. Always use the last added<b=
r>
+bidder, since it was just added. This avoids desync situations where<br>
+previously added bidders could erroneously match.<br>
+<br>
+Signed-off-by: Tobias Stoeckmann &lt;tobias@stoeckmann.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/libarc=
hive/commit/50b585bb" target=3D"_blank" id=3D"OWAc6e76900-dc3d-5831-1465-be=
7cefbbe7cf" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"=
NotApplicable">https://github.com/libarchive/libarchive/commit/50b585bb</a>=
]<br>
+---<br>
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------<br=
>
+ 1 file changed, 22 insertions(+), 50 deletions(-)<br>
+<br>
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c<br>
+index 8de1b2ea..9dd9f536 100644<br>
+--- a/libarchive/archive_read_append_filter.c<br>
++++ b/libarchive/archive_read_append_filter.c<br>
+@@ -33,14 +33,25 @@<br>
+ #include &quot;archive_private.h&quot;<br>
+ #include &quot;archive_read_private.h&quot;<br>
+<br>
++static struct archive_read_filter_bidder *<br>
++get_last_bidder(struct archive_read *a)<br>
++{<br>
++&nbsp; size_t i;<br>
++<br>
++&nbsp; for (i =3D 0; i &lt; sizeof(a-&gt;bidders) / sizeof(a-&gt;bidders[=
0]); i++)<br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; if (a-&gt;bidders[i].vtable =3D=3D NULL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp; }<br>
++<br>
++&nbsp; return a-&gt;bidders + (i - 1);<br>
++}<br>
++<br>
+ int<br>
+ archive_read_append_filter(struct archive *_a, int code)<br>
+ {<br>
+-&nbsp; int r1, r2, number_bidders, i;<br>
+-&nbsp; const char *str;<br>
+-&nbsp; struct archive_read_filter_bidder *b;<br>
+-&nbsp; struct archive_read_filter *f;<br>
+&nbsp;&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
++&nbsp; int r1, r2;<br>
+<br>
+&nbsp;&nbsp; r2 =3D (ARCHIVE_OK);<br>
+&nbsp;&nbsp; switch (code)<br>
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D (ARCHIVE_OK);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_GZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;gzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_gz=
ip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_BZIP2:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;bzip2&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_bz=
ip2(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_COMPRESS:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;compress (.Z)&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_co=
mpress(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_PROGRAM:<br>
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Cannot =
append program filter using archive_read_append_filter&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZMA:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzma&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
ma(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_XZ:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;xz&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_xz=
(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_UU:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;uu&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_uu=
(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_RPM:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;rpm&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_rp=
m(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZ4:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lz4&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
4(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_ZSTD:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;zstd&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_zs=
td(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
ip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZOP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzop&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
op(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LRZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lrzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lr=
zip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_GRZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;grzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_gr=
zip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp; }<br>
+<br>
+-&nbsp; if (code !=3D ARCHIVE_FILTER_NONE)<br>
++&nbsp; if (r1 &gt; ARCHIVE_FATAL &amp;&amp; code !=3D ARCHIVE_FILTER_NONE=
)<br>
+&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; number_bidders =3D sizeof(a-&gt;bidders) / sizeof(a-&g=
t;bidders[0]);<br>
+-<br>
+-&nbsp;&nbsp;&nbsp; b =3D a-&gt;bidders;<br>
+-&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; number_bidders; i++, b++)<br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!b-&gt;name || !strcmp(b-&gt;name, str=
))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+-&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; if (!b-&gt;name || strcmp(b-&gt;name, str))<br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ARCH=
IVE_ERRNO_PROGRAMMER,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Internal err=
or: Unable to append filter&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+-&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; struct archive_read_filter_bidder *b;<br>
++&nbsp;&nbsp;&nbsp; struct archive_read_filter *f;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f =3D calloc(1, sizeof(*f));<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (f =3D=3D NULL)<br>
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive,=
 ENOMEM, &quot;Out of memory&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; b =3D get_last_bidder(a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;bidder =3D b;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;archive =3D a;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;upstream =3D a-&gt;filter;<br>
+@@ -162,37 +149,22 @@ int<br>
+ archive_read_append_filter_program_signature(struct archive *_a,<br>
+&nbsp;&nbsp; const char *cmd, const void *signature, size_t signature_len)=
<br>
+ {<br>
+-&nbsp; int r, number_bidders, i;<br>
++&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
+&nbsp;&nbsp; struct archive_read_filter_bidder *b;<br>
+&nbsp;&nbsp; struct archive_read_filter *f;<br>
+-&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
++&nbsp; int r;<br>
+<br>
+&nbsp;&nbsp; if (archive_read_support_filter_program_signature(_a, cmd, si=
gnature,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; signature_len) !=3D (ARCHIVE_OK))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+<br>
+-&nbsp; number_bidders =3D sizeof(a-&gt;bidders) / sizeof(a-&gt;bidders[0]=
);<br>
+-<br>
+-&nbsp; b =3D a-&gt;bidders;<br>
+-&nbsp; for (i =3D 0; i &lt; number_bidders; i++, b++)<br>
+-&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; /* Program bidder name set to filter name after initia=
lization */<br>
+-&nbsp;&nbsp;&nbsp; if (b-&gt;data &amp;&amp; !b-&gt;name)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+-&nbsp; }<br>
+-&nbsp; if (!b-&gt;data)<br>
+-&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ARCHIVE_ERRNO_PR=
OGRAMMER,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Internal error: Unable t=
o append program filter&quot;);<br>
+-&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+-&nbsp; }<br>
+-<br>
+&nbsp;&nbsp; f =3D calloc(1, sizeof(*f));<br>
+&nbsp;&nbsp; if (f =3D=3D NULL)<br>
+&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ENOMEM, &qu=
ot;Out of memory&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp; }<br>
++&nbsp; b =3D get_last_bidder(a);<br>
+&nbsp;&nbsp; f-&gt;bidder =3D b;<br>
+&nbsp;&nbsp; f-&gt;archive =3D a;<br>
+&nbsp;&nbsp; f-&gt;upstream =3D a-&gt;filter;<br>
+--<br>
+2.54.0<br>
+<br>
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb<br>
index 63c66eea81..35b724ca39 100644<br>
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb<br>
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb<br>
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D &quot;--enable-largefile --without-icon=
v&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;https://libarchive.org/downloads/libarchive-${PV}.t=
ar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest" target=3D"_blank" id=3D"OWAbba3fc97-ea9e-4b82-c8f0-26=
964f03324e" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"=
NotApplicable">
file://run-ptest</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-append_filter-Use-last-bidder-for-filter.patch" target=3D"_blank"=
 id=3D"OWA9f280689-3086-f716-2fe6-95390b7ee90a" class=3D"OWAAutoLink" rel=
=3D"noopener noreferrer" data-auth=3D"NotApplicable">
file://0001-append_filter-Use-last-bidder-for-filter.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch"=
 target=3D"_blank" id=3D"OWA54dfc41d-196d-cc6b-c910-c644dcae8695" class=3D"=
OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">
file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.libarchive.org/" =
target=3D"_blank" id=3D"OWA89351479-88f0-9c64-2cda-02e8c5801142" class=3D"O=
WAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">https:/=
/www.libarchive.org/</a>&quot;<br>
--<br>
2.54.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB877447D383579D7A095B7E538FDE2CH3PR11MB8774namp_--

