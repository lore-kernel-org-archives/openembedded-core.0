Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D73C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 03:08:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3278.1742267323628327694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 20:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5172c2b624=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I1KU9g012238
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:08:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0tvmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:08:42 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52I38gtn007998;
	Tue, 18 Mar 2025 03:08:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0tvme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 03:08:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j17efLMd2htZe1I8febd9HzQJpQRcwEuj+AbCNF2QGXZWUKimmkPHc16jxqWjuJz0vauM2i6x8iMuK+dhSgGGLeUOTADN76XTuh09B6D3GriAkXk8rs5l6gjpmA8hDNFY/NUR6ShBrXcFkaWjBGe46n2XGlkDLkC064up+ixFiLAfdSI+mCOTI9j4kM84HGPRvHf6hLbOCqG+75nZGnebZyT6WXPn21IDBj7HWjSrhBkc7z32wEdfeGe0d+eTlur1KaTCWdr2Ir8QNgURPcatZjjGL7yvQu3lk5C6/yVnZKSeTdYfFRbcMuyUvVBYF2TgnQMFlPXveZ6AdZ8hdKnvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZjotIUSLnJvJHipYUNcqtv2Ilhtik9sPOrv+EwbOyc=;
 b=cDXUqhtAgXX7/ASskbQiwzavZKBQzsljrIFFsuy8S0XwclLTlR7q3adqmtq8YCtcWArOI955Jh7jul5zi46OBUcvHQyj0YAk8m/FA3bb1Pin++TKcJi9WkWfv1JVwl2mFcAjxDwb0r8/vkf8nWXqf84GNuc8hDk9v4fDLMJHw0RxrwVwyfKizdjHX7pQvlU3XOrcFPQAmRRGWIlpAjyv8WT/oBDuZUztdABp5gONUXzGP+AY4b43cdnWqF0T8dqpxUmBr/DPv2eWF3/fd2w61wfHlbgf0phNf9F7Z6S++uTiqhIYl5LFUfJrah54HElkXmvCNJ5FGlNIJn/x+JXkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 03:08:38 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.026; Tue, 18 Mar 2025
 03:08:37 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for
 serial-getty-generator PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for
 serial-getty-generator PACKAGECONFIG
Thread-Index: AQHbk9iophLJMlmsSkeK/Tzwzq5bubN3oZyAgACUdBA=
Date: Tue, 18 Mar 2025 03:08:37 +0000
Message-ID: 
 <PH0PR11MB5611CEFBF21B0DC8DC1A9818EDDE2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250313052729.1809525-1-Qi.Chen@windriver.com>
 <1F0B1D07-29C5-47BE-BA11-A49EA1022B82@arm.com>
In-Reply-To: <1F0B1D07-29C5-47BE-BA11-A49EA1022B82@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|BL3PR11MB6409:EE_
x-ms-office365-filtering-correlation-id: e4ea5d43-9c0e-42c2-6948-08dd65ca2d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?wQQl3Rk5/1PO1AE5sgD4tAjeHhjMwXeSibl5RTqbjBOtEfyPufVZBTC+1ZbU?=
 =?us-ascii?Q?NWUVKiZrm2PRq5Y1KqpQyFCSo02rt+Ufi/Tvlb4/nLGiaqE9+szXzDGwcHuh?=
 =?us-ascii?Q?ZbTDSE0ys5zMS9csIjoQ0X8gfIyVTonz3FJBqbzKi1ChHGZZ+OZ472iKR/oB?=
 =?us-ascii?Q?AEnunCZeP7IVu3QJTqsqUyxxBhX1oubPbTlddh6/vPaZ1AhWoq+RykNdx9iz?=
 =?us-ascii?Q?qpme1AXh6Y+96i0DwxBvXlLQqXum0el9Ny9sv8/xUXyal2jX0s4bJIqypzsw?=
 =?us-ascii?Q?5KCY2FvCxWnSHekis6CWdvndNeQBLxbbD2wxqC2jDOJd7sShv2Q1h2HjRdGx?=
 =?us-ascii?Q?r7JrqLGrdsb1qrms0v7CnRbYAQhgMmT6QguseJHOwG4BpWHOoduFTiltm9pV?=
 =?us-ascii?Q?ERSlBqyFP8N1mMNPKHNQv3ZEuLScC6ANcoL3q1lS5F8ztBSQDwQ6NwwGgJMQ?=
 =?us-ascii?Q?Lu6WeUY6gTZuQhhYNV8g5ZE1bDbglGTINkd+X+krLw9ttlC9FSq4CqNhublX?=
 =?us-ascii?Q?KfHAlRaUaIn+Iat2BFPQ+C18PhTE0jl0OaXmpLo+XtL2UEbn/4fzjtt1HbB0?=
 =?us-ascii?Q?kc18m3cL0szfdS9ZjqanMYMqzirKMWVC8d4pPqtZ9hSInsdjDA48Pob8dRmj?=
 =?us-ascii?Q?TxlUj8k3usibAT73xDZwf5wfGeFS0jHUyDqwq6I2/rqqQXUnUcmp6o10Ewku?=
 =?us-ascii?Q?VuF22sDkefZJYEkEACkffujkAInZdhFwaVrNQ92EUNL8s8W0cUucCH3UEX3S?=
 =?us-ascii?Q?qQnVmYDwWFlzLIjfsSy4NfxgdCh2Kr88NHAOkGpXpKPLYjEzhvOm011r3efj?=
 =?us-ascii?Q?QSJuEH4vRP9CKkTKpJiPQF/0QEHcNWe9gWbnefTuPfQ2+PN1JCIF8pmsTf/e?=
 =?us-ascii?Q?+ZK0mQcVivYwA0qFPDSmxRMzgN56k0aCJGHKRTGKzAtQpjw6el1fIx+dBVLz?=
 =?us-ascii?Q?QzUnEzuZ06DQEfWvEUfS/ZXnaRxIZW2mYPNlL5QC8AyVaRmr/gUUKVPC0Inn?=
 =?us-ascii?Q?L0MUi8bGAivPC0thNfJD2kjy6QBr33DvWpBNS9v+l2lSmOYdBFLDVa7ul6wj?=
 =?us-ascii?Q?nMwacxfDTmJd+kCODIOCJm4AZdwNcU0BkPpDe5oQf92vpfhgJZastkJtXQEo?=
 =?us-ascii?Q?VlMM45KWF6LchogFaB6uZOLFrj4A9TBO1I/6H1oHPkNQX72njZ/mthgllN76?=
 =?us-ascii?Q?B9zBddW4qn8iJrPHkvtZDj0WPA5M7X6MkH6CLaIZuaVjCUoewoL+tpwQ1Euu?=
 =?us-ascii?Q?iBFCqG+VCR7E5/1hWRFUZmtrlJRzdyiQUVBGmC/o/gOz7mV0dHW00Yw+xqPf?=
 =?us-ascii?Q?AHzjJdELnpxgwLml/WaGNRL71Sgl+ngqXH4MpIh/gEpFAnFRLRbGPclTNfNS?=
 =?us-ascii?Q?sBAw1SpLaw00EToDXmncY/G9ASXGL+CdpixpHa5rdRC0Gnww2DWedEMDVAOR?=
 =?us-ascii?Q?sh5VTcWIXPyeGLiXz5Zt51kA0SF0CaYQ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+QFwJDJLZRygpg0tHXjer6P6gDrhMifTcMyU/UMgiYGHkw1n8Ra//5g1dk8I?=
 =?us-ascii?Q?2NTi4TET04oIbWaL7Dhg6QNLKAci90Y0+Pvx/+No6HmtzkpRJEZwpvNP8MRL?=
 =?us-ascii?Q?0l3yxIXBxL5gH2bm+VEVh9Dp0CMqYLQ1hQ+dySkSzvSbo0OeVdGCrC4AWBLU?=
 =?us-ascii?Q?Y/EzVYvR9d30Bt+Fpk2ZkXhfN41efjQACiNAWee0uOkOcNphU/fSGmmNVHj5?=
 =?us-ascii?Q?5FCc/KVNHYmtakAOImH+z/8BBkBtSLHWJHEJ/TTBlVDvIdv+OZr2t+iTrXXT?=
 =?us-ascii?Q?EAEkSNG3m8GVsRp11YzR+B1UDHHIKVhX+w1zeFJFD4pptciYjsSMLxTt9CBL?=
 =?us-ascii?Q?FAw3qR5NqE0/E+cl9Ied/bNVmh8tcvXPmvx4UAkDYrfdus3+K1KnVYYB8SXk?=
 =?us-ascii?Q?T3oGRCeE3z195Sz59sheeJu64OI1WxUOmoLoFxVRqE+ss6ANXg995zBDwsPF?=
 =?us-ascii?Q?xnLI1tpng6RK/tGH6vE/fvzh+OVcU+uUyX8JU/sQCwgoUUkvuJnkVoIowe9T?=
 =?us-ascii?Q?a2rwwtu/4JdVlIwJETYhYqBhvJXPKmaZ5qUGvZ3e1d4kKRF3HSYDmL5uoytS?=
 =?us-ascii?Q?Nt/NE5r5wozGOtHtFNzpM3E560+96ccsQueRn8t67VEAJjCANtUGYMSXFVcv?=
 =?us-ascii?Q?f9a9KA8QsZeHIbGGzhAZ8BsA125x825I8JLUbuTByywhpdao6+O3oUEzpyY2?=
 =?us-ascii?Q?T/L0fy/yz1YYfKCutrZe2bs+Xxd9Yz3WoM1vr2E5HKTL7aqidfy+QYxAsoav?=
 =?us-ascii?Q?ulyan0RmXoXjyeHY6XaHP3WyKCTvaXepZUmRvilZwL5VqrjIIia8jebKreyX?=
 =?us-ascii?Q?f+AtjPjPUScf8o5E5RGxdmEE9jhrVYqra0qUtz2j4z/p3MAt3ge/OJXCxIx7?=
 =?us-ascii?Q?revu9bPB8gmHT+MyMlf80CLu+MP1GH/+U1VwIeKGwDxYAF45sMw7JnmMb4GV?=
 =?us-ascii?Q?Atj4ZSeiYrPazhJetMw7gve5BfkKbYksV7ikHm9r6MZbpfEbUGcFP/mx/gCN?=
 =?us-ascii?Q?1Hh0kYAQvuGU2KVlufacMePR452uGoMjCxfhtiNN42iBfi/WKxvrTOlqJpQn?=
 =?us-ascii?Q?LqPP3KG2zoPNPhHDWMujAWodH0v8ue9PPDCvzcU2laYYWXSwDuQhH67Z3/F5?=
 =?us-ascii?Q?iVufYQP/JFM2wbR4LAeW7H78xPyqwzstEUBJ0jdU7Oq7q2JWn4xWi5WWTddT?=
 =?us-ascii?Q?EBqnYcO9ZOxZ/QGllFu4jbNhpn5VqT7Fggj250vBagg2Do1yCsgYv55PGtyC?=
 =?us-ascii?Q?If/K6Vh+oq1OFAiWwy7oFBnmHo4rHbO8pWgHK1mQP/+vmR0zq8P94qYrei6H?=
 =?us-ascii?Q?sO1eNNdhsJpGm5QErX1xRDNLwaPFeTSXXpn1ZwcKFi6MJxoAw0GLPBcl53kX?=
 =?us-ascii?Q?x6MbF8UkN5RrPNaZAaNrDaku6z2B56FS81Gg+vi6rlR47TNsZdnU/8PHtF2P?=
 =?us-ascii?Q?H1155qMvkspHKFWvfolwUEjdLWb1TLmHAvklfg7a2rCfO8MESec+zodMyp4V?=
 =?us-ascii?Q?oLRIzBkI1fNJIWXeG8BThEs1siTZmF1EBIM8OTeVEuNecbZPGrTHYaHw1wbP?=
 =?us-ascii?Q?kWJCX9yExxtsrA1xT0XVV5jTKmqeNkwHIRUeoJab?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ea5d43-9c0e-42c2-6948-08dd65ca2d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 03:08:37.7640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTndlTRqC4H9zonRug1yawknaMZiFfE4jtAApDJy3zA9+Hjn92TG1XtciSDtA9dP1mVm/0/CShGXYPfMU1u+eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
X-Proofpoint-ORIG-GUID: 8AD6gpnlYzmQLhZilb8GGEai9yM9ZfKJ
X-Proofpoint-GUID: TQ0YjanKfQEKQNO4opZ_cmVLdSW561hz
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67d8e3ba cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=lye_pHiSAK7yCQ3xTeMA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503180021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213133

Hi Ross,

Let me provide some background of the problem I was trying to solve here.
Some BSP layers don't set SERIAL_CONSOLES, and they have worked for a long =
time with previous systemd. Now systemd-getty-generator is deleted by defau=
lt, and they don't get any serial console.

How about using the following solution:
Do not delete anything when serial-getty-generator is in PACKAGECONFIG.

I suspect deleting systemd-getty-generator will have potential negative imp=
act on getty@.service. I'm not sure though.

Regards,
Qi

-----Original Message-----
From: Ross Burton <Ross.Burton@arm.com>=20
Sent: Tuesday, March 18, 2025 1:47 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for serial-get=
ty-generator PACKAGECONFIG

On 13 Mar 2025, at 05:27, Chen Qi via lists.openembedded.org <Qi.Chen=3Dwin=
driver.com@lists.openembedded.org> wrote:
> So a better default behavior is that if SERIAL_CONSOLES is empty, then=20
> we put serial-getty-generator in PACKAGECONFIG which let systemd to=20
> generate corresponding service instances.

Whilst this seems like a good idea, it would also make the systemd recipe m=
achine-specific.  Considering systemd provides libsystemd and libudev, this=
 is not a good idea.

Ross

