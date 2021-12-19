Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B782DC433F5
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 12:17:00 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web09.15969.1639916218969098128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 04:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport
 header.b=KHyABxlq;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=442; q=dns/txt; s=iport;
  t=1639916218; x=1641125818;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ulnAUy7GYVVPEHmu8bta++7ydzXs2/eKiJNcIqyUIQ8=;
  b=KHyABxlqZRpd/tyFvIs8c/ykTIqUQmGzxyjLPSNb2IbDD94Lt6Qafwtd
   nRjckLLRzRSeK+fPH4bOu2lzqmySeHq5QiZy7BS9CqBDMB27ex9n1EP+9
   oAYY8/nhtOAwc2XSZ+4YLm1WhcGCp0K7PeTefNCWep37L2Aj/G+EqZ4SL
   4=;
IronPort-PHdr: =?us-ascii?q?A9a23=3ANzVfsxKNs47vkd1QptmcuWEyDhhOgF28FgIW6?=
 =?us-ascii?q?59yjbVIf+zj+pn5J0XQ6L1ri0OBRoTU7f9Iyo+0+6DtUGAN+9CN5XYFdpEfW?=
 =?us-ascii?q?xoMk85DmQsmDYaMAlH6K/i/aSs8EYxCWVZp8mv9P1JSHZP1ZkbZpTu56jtBc?=
 =?us-ascii?q?ig=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3AZQa1MqxJElwaBtQtny16t+cDxCrEfRIJ4+Muj?=
 =?us-ascii?q?C+fZmUNrF6WrkVRyWEdXmyGafqMNjekLtF1bdyz9xsE75eDytBmTgo5/lhgH?=
 =?us-ascii?q?ilAwSbn6Xt1DatR0xt/paQvdWo/hyklQoSGfJBcokP0/E/3a+G79Ckkj8lke?=
 =?us-ascii?q?5KlYAL6EnEpLeNbYH9JZSJLw4bVs6Yw6TSLK1rlVeDa+6UzDGSYNwtcaQr43?=
 =?us-ascii?q?U4sRCRH55wesBtA1rA3iGsiUFX2zxH5B7pHTU29wueRf2VaIgK6b76rILCR5?=
 =?us-ascii?q?GjV+VImDcmo1+e9eUwRSbmUNg+L4pZUc/H92V4Z+WpjieBiaKd0hUR/011lm?=
 =?us-ascii?q?/h2z99MqZusUi8iP7bHn6IWVBww/yRWbPEXp+OZeSHu2SCU5wicG5f2+N1pF?=
 =?us-ascii?q?EwwMIgS9+p7DG0L/vsCJRgJbwufnKSx2L+9R+xmi8gvIcWtO5kQ0kyMZxmx4?=
 =?us-ascii?q?e0OW5vPReDB4sVVmWZ2jcFVFvGYbM0cAQeDpS/oO3VnUmr7wrpk9AtwukTCT?=
 =?us-ascii?q?g=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AjD7VA6pLH00xbVZlwRD/ZL8aV5t/LNV00z?=
 =?us-ascii?q?EX/kB9WHVpm5Oj9vxGzc506farslkssSkb6Kq90dq7MA7hHPlOkMYs1NaZLU?=
 =?us-ascii?q?XbUQ6TTL2KgrGSuwEIdxeOk9K1tp0QPZSWaueAdmSS5PySiGLTfrpQo6jkzE?=
 =?us-ascii?q?nCv5a4854Zd3ASV0gW1XYeNu/0KDwTeCB2Qb4CULaM7MtOoDStPV4NaN6gO3?=
 =?us-ascii?q?UDV+/f4/XWiZPPe3c9dl8awTjLqQntxK/xEhCe0BtbeShI260e/W/MlBG8zr?=
 =?us-ascii?q?m/ssu81gTX2wbontRrcZrau5h+7f63+40owwbX+0KVjUNaKvq/VQUO0aOSAZ?=
 =?us-ascii?q?AR4Z/xSlkbTp1OAjjqDx2ISFPWqnbdOXAVmiffIZvyuwq4nSQ/LwhKUPapzL?=
 =?us-ascii?q?gpAyfx8VYvst1nza5H6WqFqpJcDBfNmznK/dTTTRFtkXy1rBMZ4JAupm0aXo?=
 =?us-ascii?q?0EZLBLq4sDuEtTDZcbBSr/rJsqCe90Eajnlb1rmH6hHjnkV1NUsZSRt7UIb2?=
 =?us-ascii?q?K7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/ezLPqlhibkLF6YtHO9ALf?=
 =?us-ascii?q?ZERdHyBn3GQBrKPm7XKVP7FLsfM3aIr5Ls+r066OyjZZRNxpovn5bKVk9eqA?=
 =?us-ascii?q?cJCgjTINzL2IcO/gHGQW27UziowsZC54Jhsrm5X7bvOT3rciFZryJhmYRpPi?=
 =?us-ascii?q?T2YYfBBHtmOY6WEYK1I/c44+TXYeghFUUj?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A8BgBwIr9h/5FdJa1agQmBWYFSVQe?=
 =?us-ascii?q?BUjcxiA4DhTmFDl2dRYEugSUDVAsBAQENAQFBBAEBgU2DOQKDMgIlNAkOAQI?=
 =?us-ascii?q?EAQEBEgEBBQEBAQIBBgSBCROFaA2GWy4BATgRAYEAJwQbGoVCAy8BpAgBgTo?=
 =?us-ascii?q?Cih94gTOBAYIIAQEGBASFCxiCNQmBOoMOi0scgg2BWIIwhTyDTYIulQmBWaF?=
 =?us-ascii?q?znk0KJYMdBZ9LFYNdAaN/ljGmIwIEAgQFAg4BAQaBYTuBWXAVO4JpURkPkhK?=
 =?us-ascii?q?KXnQ4AgYLAQEDCZB8AQE?=
X-IronPort-AV: E=Sophos;i="5.88,217,1635206400";
   d="scan'208";a="949746019"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 19 Dec 2021 12:16:53 +0000
Received: from mail.cisco.com (xbe-aln-005.cisco.com [173.36.7.20])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1BJCGrpQ005786
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Dec 2021 12:16:53 GMT
Received: from xfe-rcd-005.cisco.com (173.37.227.253) by xbe-aln-005.cisco.com
 (173.36.7.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 19 Dec
 2021 06:16:53 -0600
Received: from xfe-aln-004.cisco.com (173.37.135.124) by xfe-rcd-005.cisco.com
 (173.37.227.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 19 Dec
 2021 06:16:53 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-004.cisco.com (173.37.135.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Sun, 19 Dec 2021 06:16:53 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO1FHJ4HPQlHtJa96C8e0lUIwSOULdBTd1jpKL8ysy+29kfFvsibX6o3x/yjqfQs0H3oq4kYRthtFVuCN9Vzfsm6CDs/ZO4B7ko3RdHbYKNBpsVGmiHgnwd7UCZREsBUrXnl4ynNKpKdpMQy3bJeyHgNFYX6BOTVtNF5U7eZpkrC64SuXL2iz9xP0GdNVBmwJ+3BG2obo9aI5QcD24w2mFo0A47fYOTVUacuWFRW+y2z99oxWIc9Qb2n54i0CaiqaA+Vb0Hq84nbD7az08+FFuSTeduDHT1+0iTx1yVGCzIHJ9NJnSekhhVAIi2ZqegOGVUOYcnnx3UL9BeetHSwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulnAUy7GYVVPEHmu8bta++7ydzXs2/eKiJNcIqyUIQ8=;
 b=QIQH50vSbd8k8BSjF1E1Xg5ziN3I40p0u7pN1QSZncYI1Asq00A0hTaAQB7HtWzI7t8/FOSGch9wMPrdSK9OnNTfra8Ne7Xygf9WJdbtmUq9LDJC3FDmxolu1c2luOQWiVOo5+WyXMcJiU5i8C+4D+xc45KzLIu6VBz5IaFr1GWH5BG2a04l4RJmudl7jNVvpH8gxM5uCWrB/zdgYrcb9WdebxApkO2nYHN08Tg1TCqAcdtAZdj3We2WuQeBJtgYozf7SSQnjEIpRWyEcSPYY3r5g6WaMDK039gOL8jP2/j0tyxHo/9SfOvommXJ2bWfeFXFVlghQ4ZmvyqnU2UOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulnAUy7GYVVPEHmu8bta++7ydzXs2/eKiJNcIqyUIQ8=;
 b=x0+t/dUtfByPuz0lyOru6G68ZbDHPqzhht8w5eKN15YePunPjfvlDtO24qkYP0yT7cbnfM08TgDv2uX4effoQt3Z+GJ23ViKOqBE9y/e5enVGcZ+qRJZa5AsHNtn5KK8oS420h4jygZfQ6bbKzVoFcWvrl+LLkrATp5KGObnTJA=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Sun, 19 Dec
 2021 12:16:46 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3150:dd81:6bcd:eeb8]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3150:dd81:6bcd:eeb8%6]) with mapi id 15.20.4801.020; Sun, 19 Dec 2021
 12:16:46 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Manifest for host (nativesdk) is empty
Thread-Topic: Manifest for host (nativesdk) is empty
Thread-Index: AQHX9NActaQNxm/lbES9g5XUwf15LA==
Date: Sun, 19 Dec 2021 12:16:46 +0000
Message-ID: 
 <PH0PR11MB490252E71EAA39C3EAF277ACD77A9@PH0PR11MB4902.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d4ce9864-832c-26cd-ecba-6b095578fb5c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a95a6090-f23e-42c0-2423-08d9c2e96d50
x-ms-traffictypediagnostic: PH0PR11MB5160:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB5160404E6A85B9ACD4B88CCFD77A9@PH0PR11MB5160.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u1Q7IGOuIEbXHWyPc0NlFg6HWHCzKWhrIworga01mUAiK0gJ4SfR9P3WC9NA2SuuKwpcfmaP547fY/3J1u9pa0gCqwKHjNslCy4Yb1nI3D4oAaEpBtCe789eRhwEEz536do0otpiT3gZqSw2hoUL6hIMAncln1azFySY4dmesEMcxi7fIsG3V7FMDP+dZ0KvPLrS/zIPql7fZZWGRUvuTFBwN6UVqxfCtAI9YkPnQ2MvxPJwnhmAVvOoLzWiGQburEwShXQz7Ub4SWijr09Atrlldk5M1CPXxtngCx4c7OhUxYrE/1yqXozuR/yO5S+XyVZw//UGYm+ljYzEma93YyyyQro6xf/cPWyQo1wYYjw82BPU+yGxCmN1q8izNiMQIkgqEGwviQhOS3S9kSfmD9cikUrP+VGRAI3G71Z6AfoTa3LgaXc2glOmIysDTVPwYnaZeGXmCSXyDJQVlrdhvgTpeFfqQGnLM8GKeiVHXThoe7RxzJOGMAOcYQ+gAPWjh1Q6LjAlZP1rvTYGdPC+krzNYbeyp8uzll+x9G4ywi8vOA0ZdteLlyGPnwD/wmBHeMbR7BoZQiAW5xpDZgno458qOI1JSl6fcujJ2fHZqk2JQ5aazvcz7r4ctEVVp+BLgru8ngxFP+UvODrvuUKLIfBTBnyeoLc2qitXI8PPIOGIALp3IeVK//5DqtRONKBx7ncwuPshODUKI/A0pdzBFA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(508600001)(55016003)(186003)(66946007)(66556008)(64756008)(76116006)(66476007)(91956017)(9686003)(26005)(8676002)(6506007)(71200400001)(6916009)(7696005)(33656002)(66446008)(52536014)(38100700002)(122000001)(38070700005)(5660300002)(2906002)(316002)(86362001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RMh/e6kL88A9XSF0btXCsmePYf1ojnyRggsX1ygSpYfd8lgj+1wUzk84XR?=
 =?iso-8859-1?Q?Uy6NyZIJhWwUTuUXS2QOAHb3EwOkxHxi7lcynyBJy2ezSMRBnNLpyvuj0e?=
 =?iso-8859-1?Q?Q/waJjKLXt2Rq/+Voof3O9TBHDCDfxZbelobUm0hiKVHUcc3pgBwy0CLAj?=
 =?iso-8859-1?Q?j6DqQdR6/x9fhWsb/eknVgpyF3YBRC2G6rxpPLx5hkc9b1Nj+48xiutGx/?=
 =?iso-8859-1?Q?AmCpck9XDI+0MvfR/u7jladB5e/brTpJvq7bRN6IhT20w10xEOUp75nrQz?=
 =?iso-8859-1?Q?SFf8dcNGT/C02cLMQAkjxQ4AbV6YxeDaeWKNvm1pV4x/CnIFetWrjuHAUk?=
 =?iso-8859-1?Q?MDI4WEIr/Jak6tnn8Cegyv+Qoql7O5FRpZJ6IV8KcUXg0kX5FEhUUbkuUx?=
 =?iso-8859-1?Q?m4fAaslY0oG2jha4+j+4E68TXK7oK0p7W9hVr9XCTd/tv22RAe+lXEh9Ps?=
 =?iso-8859-1?Q?6soFRReubJxK0cY2ZXaiINmg9M3uBD3u8/PyJ81igpIDS5sEWQyROtjW/n?=
 =?iso-8859-1?Q?6Y4XQoH9vsegFoIPL7npP/+srCpZIc9MXhJIHfWF3tjBUnaAc3lOv3EDKG?=
 =?iso-8859-1?Q?jtcl7b/OXZ57GhzEE4TkhJwlLty1e22SwXFqQAPmQfc9ChIG3qUCEtHC4n?=
 =?iso-8859-1?Q?jmlE0A1bPlK6LLF2Lvr5AvjClW4hlbb/em3UNDi1qCI7MNAS+8Ncrc9XZ9?=
 =?iso-8859-1?Q?4k8C4G9f03QL3Z8xaythg7BTG6sNhudVbO1dZjtweTNzqc9FCYwbtx7/4f?=
 =?iso-8859-1?Q?f7S0oQgnlRD6pvT5On38lutW0Vb6hbYVeDVKaLcruulPGOU3Zh3mcaZc49?=
 =?iso-8859-1?Q?/ahQ9BAj/fF7F5TE0hvyZo6BdOEIgSU6Ae1ecT1z3sKjEXh2DuYQTdDV7X?=
 =?iso-8859-1?Q?WuTpeLw9yLs86i4pOhau4AUWGjcQB5VNNAKOGVO2mM2m4lnakCpKOOJcKU?=
 =?iso-8859-1?Q?M2ypxZNPlvwBzxfBMbESUzpjGvJQ6c7c1xaFbFa4zJrrAluCeXQ9wCT440?=
 =?iso-8859-1?Q?9jp9mQVk76b15MW0PDwyCu9yjiDM0rXd4PK5boXm0BhUzVBTKs4EI5im7l?=
 =?iso-8859-1?Q?KnExZTJ2X0yWh1h+z8TwiNNsO1pF0U1Fo2JXwxhDSAOtI67Or3RIEcVdjk?=
 =?iso-8859-1?Q?IWrEqsvMYFBE8ACJPOm5bzMdte2jDR+cWDk54U0kzbdjNgtnbXc+NsT+94?=
 =?iso-8859-1?Q?HXYvS+s8w0qxPoPFVukH1St3y2Eg1/7qt7tVoDobA020/W00L2p1bhBHkN?=
 =?iso-8859-1?Q?so5T4VuAvd6nMBsYU4IUHw81m6EQSiYVs12CKpEd8JIyUJpt44MMo7w7Rt?=
 =?iso-8859-1?Q?h/d3AxryrdTDBBHvmuotgGrFkPPDPeccqbgK4Rw6ylGMc6SV9BMy76/hZC?=
 =?iso-8859-1?Q?7PuTiKMM8jmyjLAcxebOHDQk79OH6SmuZ7NNh21LmBn685T9Jzd8F9XWBE?=
 =?iso-8859-1?Q?vEPRSZFD/BKiCJwyStneIt/9c2JXjL5lCWMjDDyQ0hRb7ua9XI3oK2NN4I?=
 =?iso-8859-1?Q?tuz0aqhDB1eA2Z+APxLz+Af4h82A+TSy1eTjpqadzjMkQnXGIDtfEEMxtP?=
 =?iso-8859-1?Q?tZZBXQHE3e/RHJusTzRouoXhZruuRbkr+lH7V9/gOkEON69bp6SFxdZPG0?=
 =?iso-8859-1?Q?iApxXKclMMMJG1q2QrwhoqQOwW1EaDpAElkAuQ7AfzUgr/b08TAKUBzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a95a6090-f23e-42c0-2423-08d9c2e96d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2021 12:16:46.5279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 JVJJx4faHoEwInDuiLY/YxsH473cP433X1/KJ2GPNO2WE7wwBUM8A+2J1+4wmM0gYCm1/xQcMnv76x/PveWbiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.20, xbe-aln-005.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Dec 2021 12:17:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159845

Hi All,=0A=
=0A=
I'm working with gatesgarth and after 'bitbake core-image-minimal -c popula=
te_sdk' into .../deploy/sdk=0A=
contains image installer .sh and manifests *.{host/target}.manifest. Host o=
ne contains list of nativesdk packages.=0A=
=0A=
In honister target manifest is ok, but host manifest is empty.=0A=
So, my question is it known behavior/done in purpose or not normal behavior=
?=0A=
=0A=
Regards,=0A=
Oleksiy=

