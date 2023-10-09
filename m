Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97922E95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:46:30 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web11.63516.1696862785358144761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=JQeezuAg;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.88, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPmyrciFP/14RdPtxN+bvEsWs8YsT9o/BtCh0CC3hXGJ5mxKHc6PIiY0UIuwo08zK9X3YGZFdd+zx7CodRbwfb+sZRycuQshPoCz0gtXVeDMsa8P50tFxD8lyupNdIA1poNkH7RKQIqHiL2U5u1zzI+jr44CFB6yzJeg/WqOiauTYCQK2VcU6nNFJxk54Ie46qS54rXGHrp1pR7CKTYDCzy0AV5kDD++GBGU1YKBOh2aeCK8Dqwa4JWIXpR4WeEHO1MqG8Il+wPLpt3GSVCaPEJ/VG/GcL6q6H2zeaQ6Zq4xlxug9M+VC1KIl0EAENCKl4X1uUGl4tuWW19/N6MF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks51kN6EdBiN8q4wYQk8LCS3icGwZgPfCU8HFTKqRH8=;
 b=HqhcwyU5CL6ixLXJUhQiWUPxgSlmrhLeX/ygrz+qunFj9rVWojYi6o1KRMVVvY4o6wy5MP2dSSNHwy9gh8hg5v3cimI4S3qF+CMhnWRZyp4WZiUMrfEnnoHoXJljjtEDsLJHasg4koJ4E6YwD70HMKPQ8e4DiqGlMf8OtGgLG6ksaj0sVMsfi+5wgjtVpobqBp/GwfbZGVZRVV2n/PDLneJJ1LvV/P0WndPYqxyneO6OTtpbJ9rpXqMEuzW+2yi50t16YC4uuMoaaaK+WFpqTBBa4FOSrRfXRPugO1zjIcAmhrh61IBTs47iezTaKS6WO1U9OLK3TAEwCshUFXGj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks51kN6EdBiN8q4wYQk8LCS3icGwZgPfCU8HFTKqRH8=;
 b=JQeezuAgt9geb+FCGXuO7UDvQUJm/dYgA5k4L95AZVGG92YjZ1TkhFFEgjADVngK3KiujKkRJo2MY3Uge/2XsdpPVpPjn3jRs4fCtUQQvhFtq08dOZBnB/yoAoMk78HW34ajwPja1fueVnvfRW2x7OZf6LLoq2wKYGEgfkJHJsHLOHz6ncKyHF+DWRPtEaOldLH7HjZYnXzJLAhDnfVcrpCWrvEb78QzbOpl0eYiDV1xyR/HCwv9y3cNjpraZY0WJPn9hOCZNv3C/vEtZe2igVMYXTGSfsDSOooGX+iseYNpXo7PSyg5LpTC4SMxsnb9/L/ZJP76Q+BxkLd6QDPd8Q==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Mon, 9 Oct 2023 14:46:22 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 14:46:22 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] oeqa/selftest/devtool: fail if non-selfest
 workspace layer present
Thread-Topic: [OE-core] [PATCH 2/2] oeqa/selftest/devtool: fail if non-selfest
 workspace layer present
Thread-Index: AQHZ+UZggkUxKzYnyEGyamsYsCAkDrBBF+mAgABz6JA=
Date: Mon, 9 Oct 2023 14:46:22 +0000
Message-ID: 
 <DM8PR12MB5430DBB9C56A58C86FD733198BCEA@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20231007174701.1890063-1-chris.laplante@agilent.com>
 <20231007174701.1890063-2-chris.laplante@agilent.com>
 <CAEHHSvZwgpmps095TUSqd31kSvBW-7eTcYB8g2rQeXzAKdw_nA@mail.gmail.com>
In-Reply-To: 
 <CAEHHSvZwgpmps095TUSqd31kSvBW-7eTcYB8g2rQeXzAKdw_nA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=b164e559-5c9b-4f79-a05e-506f406f7925;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-09T14:45:02Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CYYPR12MB8731:EE_
x-ms-office365-filtering-correlation-id: 86c15deb-5812-48bb-9f0e-08dbc8d681b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IYaPNA0ZBf/vu2UZGRLAU3I8xd+QYxyB9/6U1MH9tutGWAfamIQMZZoTPpKOUU7nzFUY6LX7kiESReY7yi6o6mtBvzng5bks40ZGfNwxxeIO7F69fEazwQphBH4O1vMpLZyORc7k5LxjXB1NsHaru7iOVenGZpS/c22ehQZtOSUNHtxLEzF2zbN2/kqks5kKANVgOyuV+EsewOCgL3WtqgKmq/DRzwrjGpGxonHV1C00nl8yGyRv1ElFGRAur5qbbVyecB0j2b6rCRqhrRlCVFg2d/guQQA89a/GR5OZRp3a7hQF0wDyvBRE4XzrDpcXuC5vMX1jXRzrqZ9Y17QgU311fy8ELPGHhNf2o8dW3S4JdQLmZ5VsWsCi7F8GdXmY9sdbyh/4b4LiCEAEb2Syi2Pq6vNzSvossUGQBkWVuA+CHSoHw1RmIDBW7THON/haxY8ihKXfv7Q4zhAyYDlnzMRNbKu8XavKOj+pMXZCp9BaG760WI71vph43PBsCcO2JjapW5HPbwT4OJY9WeBDiyMNNceqSXPEuHbheSc+lsXM0GUTuHSj7stKG/2Ifs3NklakTgxf1bpHcsCvkF7bt5E3CvhMK6Q9F013r9qaFCk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700005)(86362001)(33656002)(55016003)(4744005)(316002)(9686003)(5660300002)(2906002)(66946007)(76116006)(66446008)(66476007)(66556008)(45080400002)(52536014)(6916009)(478600001)(64756008)(41300700001)(7696005)(71200400001)(6506007)(966005)(26005)(4326008)(83380400001)(8676002)(8936002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7yGkAST1SY5HscF4koD8HQOUAcxTTFkZdmh1gBJX1yoUmT7dLzcBbnBOnOjL?=
 =?us-ascii?Q?6Xd9Pf8ZP2VigMFxPmlzryJxhl6zHPR+ez3jb5fgGq2lXcVZFoEUejiw2q7J?=
 =?us-ascii?Q?C4DOx6yS5ERKW0U1RvBpa62/uNyQixL6KW4SJqTeZlgIskCtB+25ajjOZmLg?=
 =?us-ascii?Q?BPOBwUhfrMsW0Bqo8fqq0H+nGx8D9KtbY+Hn5xUAfE6R9GGAB3hHEii5/FE6?=
 =?us-ascii?Q?22rAuHuUIHUyO0Bh1HSbcvwNg4AZlOtKgT6KTze3CugtEmbQ+kGuyP1PoHAU?=
 =?us-ascii?Q?433ImIK1Wl2Ok65jXR2Oo6Xw06XnpO9d3FMyvBfhx9l7kwDT9qnIf7iNQzXw?=
 =?us-ascii?Q?KsC/VGq+KUmCMkgE/xqHHxTtWgBTZL40I0DH5UR+zBUuaTvLwKq3BGzBHVli?=
 =?us-ascii?Q?GISXzV/KZDio0fft+/PkaVdvnTGQOrL4oM3z1sH0g/SGu23DpN5awU8JGPMe?=
 =?us-ascii?Q?1mzmYO0wPYjBtMyGLHwKXSyPMdqXH4b6qFiKwMy1rl1utfZHAmA36G+nCkQp?=
 =?us-ascii?Q?j3HF4a+4ChVPeTGLOC3UTX5maxSqLxcua14HR1EZvUMc3m5NxoFGuVGLIFM+?=
 =?us-ascii?Q?bhN7S25QknzXohVWSWrBISZYFnDWUBq3aldlKfx9XCIAlp9H7eyf67qRIfeJ?=
 =?us-ascii?Q?lk44W7u7kZyFhRpxL7Yma3RKgHZD03w53VHVI55M2trRIwUJC238+T2zjQtF?=
 =?us-ascii?Q?ZseUvDsClQCcGJ/9rE+aRACqX/X2eJuGZLBJ4nmKBh2+tCbl48V81J8/3sA5?=
 =?us-ascii?Q?Fd8m0kTP3ja88/zKGFxqeFWxKyfvLLmoUZRhFq14k/8nwZgr2yDZ9xzG7z1U?=
 =?us-ascii?Q?UT9zdTgNAO8kkJHyneUrcuHEW0RTKVFcwwQqna+endqTlaTRUeBLTYFnlKFc?=
 =?us-ascii?Q?H0otqewgjPNwhP57CVff1sM5qovIYCsz+/0ccXLIb+oB8pnV3kdoDvtKeayJ?=
 =?us-ascii?Q?fMWL5Wii/cjzBpgp54g6Eo8weCSz/bS9KQV7WA1vWRzGNgNqfR/SqZbdi38x?=
 =?us-ascii?Q?fhMVZlakMDKCt0LPSepDQe2xot5ecc/TYc/QDOgmbGkCwGPEvS2tArtRrbO3?=
 =?us-ascii?Q?KwsSnpSlDjC68hsqKbGeI7o1nAV+1RYB+rlewqc5ZQn/HC5eH59kCXX0UhM/?=
 =?us-ascii?Q?hoRrjnSowSkJBzP/z8iJsr7NMIv608dclXFtW81DX2HkosFy0lSiyePPll4J?=
 =?us-ascii?Q?UpOJZzUfQ2VGzu5fg29xIIwlE9tRm9Gx+h9YqZ2TcAs2Y2/6tkH8veFhJjz9?=
 =?us-ascii?Q?ltnLJTCsfX01x4IQmhz1FVD7eVviLeFpZcKlslvWbgE7CHPjbgglVHQZZxMK?=
 =?us-ascii?Q?Vrk9pEvCJfY0n4QLQd1+SJFwhUjSSGFFUN5QWsIeSVK2TfVUgZx0SZmeOw0p?=
 =?us-ascii?Q?zaR9rt7PTOVRwadwIxy0yZE+9WwkpjSeFbBzukgKpRtGI1SixEO2ihau32IA?=
 =?us-ascii?Q?Alf2RxRRt0FHB1LtVwtnOkTm2G09wU2lDMgwkMpylbBQowNQDKPKJfKgvCrW?=
 =?us-ascii?Q?69YZp96U6Tv8RoetovSPvnL796Y082tWOn077V9RIsEX/XTiZ3pNUCwBqYEy?=
 =?us-ascii?Q?+WQZtayOOwcXF7dB666Ow5bIGsfotxNp54mSUiXc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c15deb-5812-48bb-9f0e-08dbc8d681b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 14:46:22.7371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGdsKKYrKPyxV1z8hQdy9muxpTx2Simn/RX3OVBTHsJMPvZ+DG5GTySFN6gFnlrD3bV9Qz6dsg3kkJ2oOm90mP4kThGWF0dHDcYq2D8vslo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188841

> FYI I also sent a patch to fix this issue the day just before you :) You =
can find it
> here:
> https://lists.op/
> enembedded.org%2Fg%2Fopenembedded-
> core%2Fmessage%2F188767&data=3D05%7C01%7Cchris.laplante%40agilent.com
> %7C34ce8f731f6f4590172108dbc89c6739%7Ca9c0bc098b46420693512ba12fb
> 4a5c0%7C0%7C0%7C638324346300462677%7CUnknown%7CTWFpbGZsb3d8e
> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DX3V9v4pUxmNJh%2Fb0w9OVdzgvqiDXgfjQYB8iUb
> 904BU%3D&reserved=3D0
>
> I do a check directly on the setUpModule. I also noticed that
> devtool.DevtoolAddTests.test_devtool_add just hangs if there is a local
> workspace but I didn't investigate it ;)
>
> Cheers
> Julien

Ah, very nice :). It was really frustrating me (plus it was a Friday) which=
 is why I spent the time to debug it.

Thanks,
Chris

