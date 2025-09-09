Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D2DCAC581
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 02:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3261.1757385925143700233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 19:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DpU8Ts1C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1347883a23=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5891e2I02071419
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Sep 2025 19:45:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=mrndzOMw2OlQdM5Ep8efejBPMjuhRKwaNfZVUhaGgUc=; b=
	DpU8Ts1CoJMxkMHYfgglElI4ivLh9LlomqdgOG1pMklFNTnRDI6Bq6pekzloXKMP
	MSfXo3qNfxzi6bjmua9iD3dryCciefKGgovKnMk0xYOMAXYxdofLaHjT0jHd3R86
	c5Ztvm+pN8OaNDpx1Fq2R78p1A0EwTB82Y6CKhHrIZvE9q97hatRrNhGOelkIiqD
	z3qqm5G7q87eW2SDGW7N09x8mxhjzpYFFLylY9F4cZdbv87UvOPkOGUBhVg36vWR
	nqutBZ7gd2b0d7H3Grmaww8Y+ETPpabmMJyyyNBqpXIp8+GNmqINO0XyVG6z40C7
	Y+sXUGSLFG+20JqtbwJBPg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80aawd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 19:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEdECiTLHSlMdMqatt1AvjqfZVAu3dRz4JhJ1PuJoRq/xzW3EnoVnyfElAxBGNyChT1Vh/ONoFYs4qC1rJGWB/yVr4ajnMYnP7XcLvoCQH82ScA1Wo9RNMa7ulJ7oGO5XxMNvEvjIrs0MlhN0dEJ27vjEH2c7n4NLPXPuxN+nJKDS7z1NwF3R2w58mfqy0M/OyY4ENQRYy2YJ4JOawjvcQ9YkxHWv/zByTNzmrdWPIYBtXaO87rSu/6P8t5IYySsvjwwogTxlWWCx9/K4PYtlm1tE2KnC/RknxoCCPor7Yzwc/I6kycc4MBSI7PGwROvRpvfb9GMM8jQxZiQjeIlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrndzOMw2OlQdM5Ep8efejBPMjuhRKwaNfZVUhaGgUc=;
 b=pH4t1HW8T0TZdOs9Dh5QjIq/mOPVuY0y0fEf2/hvp2xJlZK8KUjGgi8Wwc+Ac8TWZNrYYMxzRxEw52EyAPByaT/SpteiCYrEeROXda4kMGLN8u39E4lvpoWt2iZa61T3CDEE2YCRM+69uJK/r78fZU0mouGSejqdPbKLmVg0zUuiIZHliwMI+gL1JUuCq/B+dU8sn+f31Ovyjt7xP29X+eg0bmtH70oqofAMw0aDOIa7TL3K5jZohUpe5KlQa58FUdykx6uDm3Cns7LU5t4jZIpxjCp/vkNMC20WT/HeiMIjGSvKlAJG9wg47Lqcj7bOe2Y7PV9u20qkM4yaavYs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 02:45:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 02:45:20 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
        "Kokkonda,
 Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Clang - Question on dropping D144541 clang patch in OE
Thread-Topic: Clang - Question on dropping D144541 clang patch in OE
Thread-Index: AQHcIOz/oSMlv3kdL0O09kHIJ2gf+A==
Date: Tue, 9 Sep 2025 02:45:20 +0000
Message-ID: 
 <DS0PR11MB79014CF356CC7621C30E755AE00CA@DS0PR11MB7901.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-09T02:45:20.197Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|DM6PR11MB4676:EE_
x-ms-office365-filtering-correlation-id: 93487b4d-628c-4728-3315-08ddef4aeb0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?FZ9ofp71H5Z51YA7v9B3JJoqxad40bvYbUWHFvVlihS9GX9HF2UaGbRC66?=
 =?iso-8859-1?Q?zgI+Ux7IZMg26mNa233wibeMTkR32/0p8G3wq4Fh4LgcaKm4aiJxDkutZC?=
 =?iso-8859-1?Q?VqDo79GfxYZior9jOi8tt23wA62J8PpoGhsgjTPrW6sOpnK0b3DONa1qpy?=
 =?iso-8859-1?Q?+j1EmAAHhdzQyltjYV3LCzUy1+bIO44/EWmecfgdJJ7Zoldic7ZOkAjutB?=
 =?iso-8859-1?Q?hTi7kRvTsgLOsbX27+ykkaoKNxTzzoOOv/vgH9Cg04PdXCqbV5awjAVeaE?=
 =?iso-8859-1?Q?InxBNv540FKZP/ZyOtB0H3c30pGGFyWcKb83EudfNB3agIGpMVj8HSPX3m?=
 =?iso-8859-1?Q?cvgGyMP147ZxMr31fc9PramEX1CoqSwgp0/RBt23rutvg8oQys0iE1DW1z?=
 =?iso-8859-1?Q?sLHnpT0IjoAbBNgHNUVqESUgGfzv5J6rpM+Q0C2cedahWx9DbpS0wHzh69?=
 =?iso-8859-1?Q?vAa/brWS26ZowJiV19MYLfMbh4LwMfOOeS0azQ8AZ9G2bb6Qb5aCmDK5Ba?=
 =?iso-8859-1?Q?BAnJWTnWqn4K6T7mhGu9dFA78V9YZiacpNaLkHycYHUtBK3G4BiW2UUD7o?=
 =?iso-8859-1?Q?Pv8Se4SdMTFME3MONOzuueXVkWH4pP+ZjHZCfEiTHMJI7W+wIlToAMP63I?=
 =?iso-8859-1?Q?FgIfHgeiHqFKw+v04IIbNIuXE+VWS5+ClFajDnZ4dB/KGopJo+NloWxr4K?=
 =?iso-8859-1?Q?/YJeWhGEJ5dICATU+wM2f9rh1hODAh+LV/MBzRaSegTzZM5vbvZ/b2Y6/0?=
 =?iso-8859-1?Q?5ZF41TunmXVL1T+BXFCzNHmwXIbPRGAxtlQ1RDDJBX3GhNM4ly11E96YOy?=
 =?iso-8859-1?Q?HHIM2LLQzi2xHZ6xXuvXJAaXlLc+QWbruvaX7j1ZCBos1VRmoIzb7pnAiD?=
 =?iso-8859-1?Q?gydDiT5oKNrhPOCJNGmpt53EZHpubxjRwij/rVlmwaV2nJXJUJ7cDjNngc?=
 =?iso-8859-1?Q?6DQqHM68IwgVU6gqNv3mMoh+KRnwKpwjr8Pfa4C6RphDS1oWjoHpvB7ANs?=
 =?iso-8859-1?Q?WxWO6uwSMzSxEnDJUuCRHzPJDTU5yKu5AgPN42pGLP1OfZ0RPKFh3TR8BC?=
 =?iso-8859-1?Q?/wMm3PBpyR1JqAwY7hU0YCKffHc+U3TeMObfw0yzOn1kQmVvZqzjVrYe74?=
 =?iso-8859-1?Q?dLFLdD2TMGu8RSvoMHRXQKj2JERtqgHvpct3BKScR9ldAzQ2K/kZ54nzOG?=
 =?iso-8859-1?Q?/UitHow9fEFSW4eDdEwPhkg0N257/g2Corb5lbMOWEMSlUWUzGwUFOlySj?=
 =?iso-8859-1?Q?fJaQ1seXe5HoaasW1W+D87Ysurz1NrZ0KGhhI5T6qGsQYJ1Nop+kvGFKwK?=
 =?iso-8859-1?Q?puDZ+Tfoo4nrtqsT5Ib0hIBXmTafk9H75KhVn3h5Y2G15dwrPagZpb8FAf?=
 =?iso-8859-1?Q?4oz9CuEix7wocGNihmqFCMa/czttUPiW0Q9vgyqaHGY1WBJKDaWOLS928V?=
 =?iso-8859-1?Q?N+zTRV2+/tyc/HAWUfdxI3B1yJQPpTzVk37xKD94OGwE9BFhop3sp3l4LV?=
 =?iso-8859-1?Q?8dLG5RC7GJQX2z2YpmHs+N?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MFagRKTdiuTrch+jKEakLX9/xo8i0utkFiYmKR3y+w1w8BI15azhx68j1G?=
 =?iso-8859-1?Q?eCzImT+ul/D821qvCR9HvPZhTgiIMRTcWdv3MvKgbq3MOrwfY6WABhp7Wm?=
 =?iso-8859-1?Q?FVRAidxQJ7ChwVCA19sND+QVRPJxZx1tyt3eKWBATWd+nN+dL0wmVeBbpE?=
 =?iso-8859-1?Q?VZK++H+PmvQS0wfm1CbtL4j3T6Mgkw17sQowqUXdwsZLudd8s6guAG3ab9?=
 =?iso-8859-1?Q?o22Mm4IPMc01IPJ8792RBBpPpgH+e9+HNn+XHiaiZVuLjl2cBlU5KGtLjV?=
 =?iso-8859-1?Q?Z6Uwlt7pFLNfkxfkHmJqCmpJaWTovKf8mUtWkiHEBZgyu5Yx4DiyRyVaIt?=
 =?iso-8859-1?Q?o2zGGkrxAww+f99EiiiW8vKctPuWRoP1KbCUMio7sknsy4wm51g0vxnJ5k?=
 =?iso-8859-1?Q?3PfyWjvwO/cKf7bvTZHM9E6hJbd/hJbCyHFzCi9I0OnlcIOE/0Xn72XHWS?=
 =?iso-8859-1?Q?xrhTATvxiIFaXPMOUqcrKHw1T/dQQWkSY4W+Yk9hxpAMHnjhLbgyJh/8qI?=
 =?iso-8859-1?Q?4KuwZ815ENocs6aeumkzpbMjfXIPhivOg9Jie+oIRsl+8POQnXpjp27XRL?=
 =?iso-8859-1?Q?L5VBpXZ8Ch4iccMIYGO3GH3CjsrZmWBKL4H/kq9b+XWI5BSh8Un/Kwsl4o?=
 =?iso-8859-1?Q?y8RH7Azv3GQfmFwU+neIxg64waGGbS3VoTn/M9Xlo3Bz2GutYncsrPsIUH?=
 =?iso-8859-1?Q?Xf/D7/rWexPvadkXqw1/2x2kMh85xMXA9a88oiJBN9N60FcbygmtylHFPH?=
 =?iso-8859-1?Q?4EcqNG4hknrWH6Xyj+rscJosDmFIpGFPpRfmXR1ixCUj32ZBvpq/SrtYJN?=
 =?iso-8859-1?Q?CWBt47RA9oSdv2awm/DVv7M+DwL4jgG80vs4/N1p2COWIY/rr0H3zrSilW?=
 =?iso-8859-1?Q?u0QxTuBWFoBXPKoH7cldCEmtLSw4+K65c9gUjuvnlc/7ZZYZYSgSGepFpv?=
 =?iso-8859-1?Q?SWffw8ukYGxxDVuKKZ+0AzkAMl/0gVI+y0+5uuzUDEHDRGHJ70AoSR0d/z?=
 =?iso-8859-1?Q?XRojg2hOc+zax4yqrRTY1icLqQpgknda+JpYh5+tdzdzREg4cmCnbsTTsJ?=
 =?iso-8859-1?Q?WuQAwtCATWsHIR9nrY8PB3GDP8bzAvQwZstQYg4FSQu+RtVJJzQSAUHHNN?=
 =?iso-8859-1?Q?KlslgL+8x3+U0gT9uXRzFUrVJg0pHihNn7g08ibs2yBapHeYvT54xTMu6l?=
 =?iso-8859-1?Q?ul3XQJmV0bPGs+z5J/vowQMwKuVBaJLrXaY1e6gH/mRVeUNgA6Okyd4i+G?=
 =?iso-8859-1?Q?MqdtOgevTVluX0Mt7kZoLLaR+6k4yf5DzOqQ2EE0jM1rtAxbkdL3JxU94c?=
 =?iso-8859-1?Q?z4z8zOF9lwXh6VJ1Me8X6EG1kOeMD0ZRn3GwYjBrpWtJjV24RmvC7HD+T3?=
 =?iso-8859-1?Q?V/1/2rYqpkV00FR0NJVrDrnoADyccv8z4W8vzedIsJnloKFAsSmWhZlagx?=
 =?iso-8859-1?Q?pay4G9NpHpyLzleW0SbvQ5H4ii8HNBn1ud7lI9kF4+r6ezN3zJaBlY83gR?=
 =?iso-8859-1?Q?omfFI8ibgmcx81pVtldVSrGVqKj7heteiUvgEH6rm0cpJ5tiTth790GwDh?=
 =?iso-8859-1?Q?cUTY8H5UCR8phSa6+w7DjP08pl4V2Ce51p93hNBycn6iAYo/HRilFiXbQE?=
 =?iso-8859-1?Q?JQQnN+hS28wiaawdcW9utsOzRHMYp+53jEzwuMwLvafGRYRcx51YQebg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB79014CF356CC7621C30E755AE00CADS0PR11MB7901namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93487b4d-628c-4728-3315-08ddef4aeb0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 02:45:20.5543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8HGElbVrkAErzXYUoCFJIIwvHUGpSPXi7UbGWj/4lVveGlyg0lPxZX+G1a4evmAFgiTZ7Ql0osq/i6yFo7m+E5aKuMZ8jzkWzeqGxH+loGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Sz74R7z1aGc-Z4YbIX40gvc2ow0XRUP-
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68bf94c4 cx=c_pps
 a=v8GUIODugtSPfp7/37T3jA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=guQCa1sg-x5M-nuNx1YA:9 a=wPNLvfGTeEIA:10
 a=zgiPjhLxNE0A:10 a=KNCt0EV0FFoIQ4JN:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: T-qnxk4f6L9vZeWQtVGdLywb7E-pnJkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAyNiBTYWx0ZWRfXyVFLfQBLQsg+
 X9Htw7uNJ7mAaS/fZ/Ad6/W9H19lAfR10h/jTQH51aedDXv8WtAJORXdtgwUfbkxfKd5erxDEL0
 /dAiIeN2oTw/beC/ymxUYXTkP4zYuLjnZPTSeDuzwFHIGPOOfnryaJMIbRX+V4Kk/QUQshMWznY
 vw7KzJKAgO5abSIUGCh9LQlaIyf/QRMSjdjbRbeu+QwnDxXxyrB3v11tmReY6E58h1PBQrRENM3
 MD5oKnp/l+ykIiDROrk/WHw+5e9B0ACr4CsmHxuJ3ADI3v75PTlO/r+p6RVnKPs1vwnRY2gBmnZ
 VJcamRQSd96dmOK2pp4qJ2zOVIDb/2PaAvBJPF66aWM+81rXweKnT3aZCS1QYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 02:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223088

--_000_DS0PR11MB79014CF356CC7621C30E755AE00CADS0PR11MB7901namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I'm cleaning up our clang patches in OE and I am looking at the one we have=
 from
D144514<https://git.openembedded.org/openembedded-core/tree/meta/recipes-de=
vtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSE=
T.patch> (The one that adds #undef TIMEBITS in sanitizer_platform.h).

I see you already got the main fix for that TIMEBITS=3D64 error committed L=
LVM upstream
in D140812( Commit - 26800a2<https://github.com/llvm/llvm-project/commit/26=
800a2c7e7996dc773b4e990dd5cca41c45e1a9>) for Linux in sanitizer_platform_li=
mits_posix.cpp.

In our builds, I haven't seen any issues without the D144514 patch. Since w=
e're only building
for Linux, can we just drop the D144514 patch and rely on your upstream Lin=
ux fix?

My Question is: did D144514 serve a broader purpose for other OSes that we =
might still
need to account for? Is there a specific arch or multilib config you'd reco=
mmend
I test on to be 100% confident we can drop this?

Thank you.

Regards,
Sunil Dora


--_000_DS0PR11MB79014CF356CC7621C30E755AE00CADS0PR11MB7901namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 14pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Khem,<br>
<br>
I'm&nbsp;cleaning up our clang patches in OE and I am looking at the one we=
 have from<br>
<a data-auth=3D"NotApplicable" title=3D"https://git.openembedded.org/openem=
bedded-core/tree/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_=
TIME_BITS-along-with-_FILE_OFFSET.patch" class=3D"OWAAutoLink" id=3D"LPlnk8=
55154" href=3D"https://git.openembedded.org/openembedded-core/tree/meta/rec=
ipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FIL=
E_OFFSET.patch">D144514</a>&nbsp;(The
 one that adds #undef <i>TIME</i>BITS in sanitizer_platform.h).<br>
<br>
I see you already got the main fix for that <i>TIME</i>BITS=3D64 error comm=
itted LLVM upstream&nbsp;<br>
in D140812( <a data-auth=3D"NotApplicable" title=3D"https://github.com/llvm=
/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9" class=3D"OWA=
AutoLink" id=3D"LPlnk403133" href=3D"https://github.com/llvm/llvm-project/c=
ommit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9">
Commit - 26800a2</a>) for Linux in sanitizer_platform_limits_posix.cpp.<br>
<br>
In our builds, I haven't seen any issues without the D144514 patch. Since w=
e're only building<br>
for Linux, can we just drop the D144514 patch and rely on your upstream Lin=
ux fix?<br>
<br>
My Question is: did D144514 serve a broader purpose for other OSes that we =
might still<br>
need to account for? Is there a specific arch or multilib config you'd reco=
mmend<br>
I test on to be 100% confident we can drop this?<br>
<br>
Thank you.<br>
<br>
Regards,<br>
Sunil Dora</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_DS0PR11MB79014CF356CC7621C30E755AE00CADS0PR11MB7901namp_--

