Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71631CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 12:14:38 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.4683.1693570468009786852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 05:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=YIi95cOg;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=VtminWDt;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3438; q=dns/txt; s=iport;
  t=1693570468; x=1694780068;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PS8LY5azU9bAL8u3/0/hNDxUfCrewXnN8s4RmNT706Y=;
  b=YIi95cOgjx1wn5tvjw2BA69NThtIREwFodq1SUKEeW01bAnHqA1JaUaM
   viEf6d+UGhC6xwV2OUezAWFucoT5Bo6QJLMegGFTtjpMI8jedSOB39H7i
   aX44MgrsJzRaoPjnMOBXZAybRy6Mvq/BLC7lFYtE0iQ1ZoM6cr4d4uPHP
   c=;
X-IPAS-Result: =?us-ascii?q?A0A8AACq1PFkmIsNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEXBgEBCwGBZFJ0AlkqEkeIHQOFLYhkA518gSUDVg8BAQENAQEuBw8EAQGFB?=
 =?us-ascii?q?gKGawIlNQgOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBA?=
 =?us-ascii?q?R4ZBQ4QJ4VoDYYEAQEBAQMBESgGAQEJAS0BCwQCAQgRBAEBHxAoCh0IAgQBD?=
 =?us-ascii?q?QUIGoJcAYJeAwGcSAGBQAKKKHiBNIEBggkBAQYEBYEKAbFhCRaBLgGEV4MwA?=
 =?us-ascii?q?YUFToQsJxtAgU2BWIJoPoEFgV0CA4FfhBKCLolghUYFAjIJgiCDNSqJGCqBC?=
 =?us-ascii?q?AhegWo9Ag1UCwtjgRVROYE9AgIROhNKcRsDBwOBAhArBwQyGwcGCRctJQZRB?=
 =?us-ascii?q?C0kCRMSPgSBcYFTCoEFPxEOEYJGIgIHNjYZS4JmCRUMNARKdhArBBQYbCgEb?=
 =?us-ascii?q?AUaFR43ERIZDQMIdh0CMjwDBQMENgoVDQshBRQBQgNIBkwLAwIcBQMDBIE3B?=
 =?us-ascii?q?Q8fAhAaBg4tA0QdQAMLbT01Bg4bBQRmWgWgTIFgcgF6E0wQKj6UYrEyCieDZ?=
 =?us-ascii?q?It/jRmIIheFV6QImCwgp3wCBAIEBQIOAQEGgWUDNYFbcBU7gmcJSRkPjiAZg?=
 =?us-ascii?q?16FFIpldgI5AgcLAQEDCYtIAQE?=
IronPort-PHdr: A9a23:B893sxYLg1/DXaCiB4x/oKH/LTDhhN3EVzX9orIuj7ZIN6O78IunZ
 QrU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+YgBOAMirX1TJuTWp6CIKXBD2NA57POPwT4LUhsuw2/q705bSeA5PwjG6ZOA6I
 BC/tw6ErsANmsMiMvMo1xLTq31UeuJbjW9pPgeVmBDxp4+8qZVi6C9X/fkm8qZ9
IronPort-Data: A9a23:uZTMB6/lyXwous7GfYyVDrUDkn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jBNXmrVOKqNZzf9fo8ia42y/U9X65HQmIRmQABrqH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYnoZqTNMEn970koyw7dh2OaEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y4KMuQmT1tLog6Invxhk
 uoR6L6zUyYAa/ikdOQ1C3G0Egl3OalAvbTAO3X674qYzlbNdD3nxPAG4EMeZNJDvL0pRzgVs
 6VDeVjhbTjb7w6y6L69Q+Zrit4qBMLqJ4gY/HpnyFk1CN5/GMiZHfiQvoAwMDEYntl3GN/XX
 uYgRjszfTXNbyJECBRLB8dr9AuvriCvL2IHwL6PnoIw+2XVwQl73bThPdaQcduQSO1Rn12Ev
 STB52n/DxQQOdCTxDbD9Wij7tIjhgvyXIYUUba/7PMv3huYx3cYD1sdUl7TTeSFZlCWatRBE
 WoI5gMVrKke5BaUEoTfXAeZiSvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgKtjvR76KfaohR3i
 De0c8PV6S9H6+bNGCjNnluAhXbjZ3ZJcDNqiTosEFNt3jX1nG0kYvsjpP5KFKq4iLUZ8hmvn
 mjS9kDSa1jv5PPnOo2y+VTBxjmrvJWMEEg+5x7cWSSu6QYRiG+Zi26AtwKzARVoddnxory9U
 J4swJX2AAcmUcnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk4aZtcJ2G1P
 BKO5Wu9AaO/2lP0NcebhKrvU6wXIVTISbwJq9iNNIMVO8gtHON51HgyPBX4M5/RfLgEyPFjZ
 sjznTeEBncBAqMv1yutW+oYytcWKtMWmwvuqWTA503/i9K2PSfNIZ9caQfmRr5itsus/l6Km
 +uzwuPXkX2zpsWkPHmOmWPSRHhXRUUG6Wfe8ZMOJ7TdflE/SQnMyZb5mNscRmCspIwM/s/g9
 XCmUUgew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:hm6b6qh2JvzlohSULLsTA9rxX3BQX6h23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sdi9qBPnmaKc4eEqTM6ftXrdyRuVxeZZnMvfKlzbamzDH4tmpM
 VdmsdFeaDN5DRB/KHHCUyDYqgdKbq8geOVbIXlvgtQpGhRAskKgXYde2Km+w9NNXZ77PECZe
 KhD7981kCdkAMsH7+G7xc+Lo7+TvTw5eDbSC9DLSQKrCOJijSl4qP7FR+34jcyOgkk/Z4StU
 L+v0jc/KuMj9GXoyWw64bU1ftrseqk7uEGKN2Hi8ATJDmpoB2vfp5dV7qLuy1wiP2z6X4x+e
 O85isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5fjQnEMBM7LgpNicxqnBQ++2U4p
 g7hl5xhKAnVS8oWx6NvOQgYisa0HZcZ0BSy9L7wUYvDLf2I4Uh3rD3tHklZavoWhiKqrzO1I
 JVfZ7hDDE8SyLHU5jU01MftOCETzA9GAyLTVMFvdHQ2z9KnGphx09d38AHmGwcnahNB6Wsyt
 60eJiAros+A/M+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUCN2jWo5D67b0p7KXyEaZ4gqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvn3RabtMyeEVFcy+vHQ7Mk3E4neQb
 K+KZhWC/jsIS/nHptIxRT3X91IJXwXQKQuy50GspK104r2w6HRx6XmmazoVc3Q+B4fKxXCPk
 c=
X-Talos-CUID: 9a23:HVfKyWDbcw9L9Eb6Exhh6nQyBtwMSXzc4GeKHBPlK2VzaZTAHA==
X-Talos-MUID: 9a23:O9Gq6wqHH0JAgYkHWM4ezyl7DcJB6p2CMW8MzYQntsW7Ph4zZzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 12:14:26 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 381CEQrD024427
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 12:14:26 GMT
X-CSE-ConnectionGUID: yq2gsyWZQ5iLoPGMUi4t8A==
X-CSE-MsgGUID: EVFPGfDqTUWztWUg6B1/WA==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=dnagodra@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.02,219,1688428800"; 
   d="scan'208";a="390779"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 12:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RelTpNnSZfoT6IHcWIhij+jbOi8C8N0Ne9tvT093g6y/Ww3tbq2AsHnYF+785gaxNKUC0PFh+MS25qjt24OQp2LKNiVLrU5gzgMOpBLKkFARX+p9O0sJTUgG3wvuJL3byWdwkr04Q2ZHpvwjK0gMu9nskMOKPzpNCNb4vE76K/h1Nbv0WEDwJINbDtbeEILLtuAc+7mxA1MQWGUbZ9f5jpL2rjxGZUHnzidBSGifReqw4SnSpbzrwaNDWCySx7RTnLUNRI5VCt6L841J+c5AH16/WQk6v8qvQ55UOyLDMflaeHg3a1DfdlxoO14Nvf2I3V3T7QJ2vMtgxrK6BQ4tJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY2IDP5JbqV3OUX474Cf/gzRlQUffsdVH0jrK9R1Nac=;
 b=XzYw7BrVD3I4aEa7laATcKX6Raox25//ogjZBLZwuqZILiVA5uvnPzs8s0HMw38/BG7LgTdBd4U3RQMyEkmix4N2+FNSFu3BOljCdko8YI01d17ToljX+xowmZm07KawYTrQ2q8y8a0sv85DSR64E1dmel0u72nKj5UnOoPeLCAztCina2ayyMp8CF8KVMzJdM4wCrHjhEVxDgnxbeK0U0DgcsW2MRALS1LmAN2hPznFS2PG0JDGrRX8G5Memvic19B1nkBIeJIK3kUsuSI8O90PNWbHd6lsYN7r3W+CBGyyxHST/hf3y3YgmLM+btZiGvkVty6VMjhwOJ2QAIM0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY2IDP5JbqV3OUX474Cf/gzRlQUffsdVH0jrK9R1Nac=;
 b=VtminWDtvKrcPIRmtQ19EPFdgflo5cCVEvOJEwvWLqPUFV0P1w8B0Yafs67OdjrVYh2tJILa9lyLof0rVGWYAcXnkehndm9Po564us/zfPHs94ftgyPS1EfPfBkYNqijCyRhpTiHMeIJyeTdAB9M0/WZe4/yGbaobW7EPzOhKnc=
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 12:14:23 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::2e4f:d939:e8d3:1900]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::2e4f:d939:e8d3:1900%3]) with mapi id 15.20.6699.034; Fri, 1 Sep 2023
 12:14:23 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
        "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Topic: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Index: AQHZ3IriHaT1DV2PUEC9CPagzAANMLAFwcwggAAWoOA=
Date: Fri, 1 Sep 2023 12:14:23 +0000
Message-ID: 
 <SN7PR11MB6971CD9B46029E4DC9D030A3D4E4A@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <1780AAD9BF6EA98C.27804@lists.openembedded.org>
 <SN7PR11MB6971D172A62262F969B5A85ED4E4A@SN7PR11MB6971.namprd11.prod.outlook.com>
 <AS1PR10MB56979FF52E47FC8AB6626A66FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56979FF52E47FC8AB6626A66FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b35c4074-0472-4dc5-9437-8856c5792d38;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-01T10:16:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|DS7PR11MB6127:EE_
x-ms-office365-filtering-correlation-id: 8ad32700-932f-4f62-eb48-08dbaae4fab0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W1kbS/XfK2Vr36IO6AYbldtgxAJAtKReBB3I6M1jvxaR41CCHtRKhrDUjr3Cc1oKGJR92mYW3EVC+SVRd/WvtRmBSNTAMxaUmayyqzHyCQx2BBztsc20KKzkvujJ50P53rtte3k+Olka9X0kyGr1fw61zPie3y9WGQyX5Vy6JrcfLecM4oyRN/3yzpLtfiQKHlwXvEMXPWwZbNFPifxMnT6ZJ+pWGExTkSKN25N2G1GlLxtbpWPrJT+RDTTC6BS9bb7oGHFX4KaKa2a9HQJpfbBMXETpKQVDWPIxZPK645UV5f3j5Mup6EVhQsFxbZxIT4XD+65hqTkeq9yQecryCUbpZrwDBpDZkVTzmiMnc/CqNZDGtvA4Vg5/jO7PEwNR4kdnVyigrFwhjlXiEduSzlnr3pRxuo3ngVmXDoH3pbFRvXVZ1Sti1ESBQZ1FlEvactWhXbE5YKlBcwh+uMuTxeR2dgA1/e66iKpS+c2LYMhBDGnnLHv64AsXXxtz0MOwKRh1ZkjpCeZ9Egt7uUpSXr9iF/JieoKt/fnh8ZsxWGWDEPaEvCDDQk/dsNLtbGLdfkOjbEl6pJF97bH7NNeEAZGcTHc1wi3i9uEzRwf72EzuOClDNIcZSKJkefpMIs9Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(1800799009)(451199024)(186009)(71200400001)(2906002)(52536014)(5660300002)(86362001)(53546011)(122000001)(316002)(478600001)(6506007)(107886003)(4326008)(8676002)(7696005)(9686003)(8936002)(33656002)(26005)(38100700002)(38070700005)(55016003)(41300700001)(83380400001)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hHrkBv2w20mpvY6Cs6zZB8oCzMxO+krtdCcojaJmTYEjduZ6la4Zk5kP6mTR?=
 =?us-ascii?Q?mJfM4JMSx94UA87ICsj2+PQ2IxHjkfgYplj5iFo3LpbX118uyWuRRyO1G1Yp?=
 =?us-ascii?Q?P0nWhh65HXApP3+q4tl00IYaPabJ3DNPEIj4G4hIpHS0h6Zoh1TufLObV5+P?=
 =?us-ascii?Q?thR3VmxXeZWjP1fvyQpDLJVegqBm55ONs3KS/w5wr5b0uxTh+BWcqp7rpkve?=
 =?us-ascii?Q?De6+Dvo5EGKj8i8K9ChCv9Z6y4YujhkPIhBB9cXB+h5DAcea/Rpp/wT3Ah5y?=
 =?us-ascii?Q?dfz66wmxKIsPwtUyzkfkNqY9EyU5Tb3hntHlfuA06vWkLlYnaCY2G2eBCxZR?=
 =?us-ascii?Q?gSe/8GG97h7KBWRu6k9h6OH9wehvxWG3LykcVRS2zkzVcYErFoYKQZvSiGii?=
 =?us-ascii?Q?2zyQGnwfliNuZv5rF0hh++ChRqvdANh/dRhfoGeEXSF2v9x+aoYnF6n+7LHb?=
 =?us-ascii?Q?TIPvYyjzG8Dt/9OivzcU9F2Q19H3APYhPTRWAT/W3cGu5CHAUgPpKIfdYQGs?=
 =?us-ascii?Q?ir30be6MaJBrNfYupTtwNqYY/20dd3fOaOw6n+Phpcefgz2GGZyzvzfCaw2Q?=
 =?us-ascii?Q?xpNxRpoFoDAm8D2gjyKB7/JaXSYb6Ac4vkk4TKw1X92cM+h8mANVbdPoXvMb?=
 =?us-ascii?Q?qEiHeNpmvWLNHVHRqEuHR9441Qgo66oP9bGkF4vgeHco+cvHBeknfyeJT6Hm?=
 =?us-ascii?Q?td1xss4yAVRogKp8ow/xuApdJBualwMOTvoK4acMBVBBOMwG/h/KhWVzMWjY?=
 =?us-ascii?Q?mDmHXrUdcnkEqttd2i4IydU0SORwUbstYhsdH7xa11tDiUPNeSXwccbh2ix7?=
 =?us-ascii?Q?gcw7nB2nRps/J+GqH15qAwkgt31G4fpX2aT7aMbO5XwZASN4QHJPUkuEowcm?=
 =?us-ascii?Q?WBbge8ozepYkrrYSX40Rp6sRXBKF8GEwdmGmF0bxdAfnzKj5tWCz3G5V1mmu?=
 =?us-ascii?Q?Ww3cPxuvRC/IV354oleJo0WNzId3vrB3mQL72InZ3tU+oVeaXYcva86gr/ZE?=
 =?us-ascii?Q?thsxSNvQKOwblHyCuvYMeES88qEqFu/EqdJ7OexW09nwwmMo/COiRWNIYP7f?=
 =?us-ascii?Q?T/R0iSzOYfBnfDJKXFQjVd/A4KOw3D7Jrr/loF2CF4dfUXZaxTOMOTRButc0?=
 =?us-ascii?Q?pFFKuEX9lNJ/lAz2V6dKEuV306ZZPHmrZdvGo1itqp3vyvLKkAVgZwDeYU0C?=
 =?us-ascii?Q?6toXDvOc7FExBlL9bKLxdwdPCZCEJIMvQYkvb65eiC4/gJxBTMWZa7Yje5CE?=
 =?us-ascii?Q?fkleF5JgHZxH1VLyCN2risWhDtuH3N/d7HQUSSNcQqh2SLBwquORztNy+wle?=
 =?us-ascii?Q?hMPgyqM0ZY0WpXvFTPsFuxUYYamsWfGwOGaXXVU5vlat+/GEM8g7qG8cJ6Pr?=
 =?us-ascii?Q?67oc7a74WMJgTpERZqHUoVPi3EPvslvSH/fUoRCXTCUvAoz6YsmSdeHivKe4?=
 =?us-ascii?Q?bBF+1nNtu9bP73rLCkUPkLIVJ10C4us6iZ2bkLawCa7V50CWd5iFZbzAFpYY?=
 =?us-ascii?Q?w3HL1jYbdjPtuRfAKdZiqImCqradYIi5cHlk/PiQyKMH1d77u1vBzknXOX4g?=
 =?us-ascii?Q?j/TvzevgDTQ/s+wJl9M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad32700-932f-4f62-eb48-08dbaae4fab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 12:14:23.8220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYy044sk5eEIdntXeCveIHojF5YvUMhWyBq62Sy+F5LqEG9OY+7PBaCoqVRwldETWSog6BNAdzoDPs96MzMPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 12:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187005

Hi Peter,

It seems that cve-report.bbclass is already filtering out the CVEs based on=
 the vendor.
It would make explicit Whitelisting/Ignoring these CVEs redundant and thus =
my 4 commits can be skipped.
Thanks for pointing it out!

Regards,
Dhairya Nagodra

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Friday, September 1, 2023 3:48 PM
> To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> <dnagodra@cisco.com>; openembedded-core@lists.openembedded.org;
> Steve Sakoman <steve@sakoman.com>; richard.purdie@linuxfoundation.org
> Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-
> external@cisco.com>
> Subject: Re: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
> cve-check.
>=20
> What's the reason for ignoring this CVE in all branches when CVE_PRODUCT =
=3D
> "flex_project:flex" means it's not reported by cve-check?
> Peter
>=20
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> lists.openembedded.org
> Sent: Friday, September 1, 2023 6:15
> To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> <dnagodra@cisco.com>; openembedded-core@lists.openembedded.org;
> Steve Sakoman <steve@sakoman.com>; richard.purdie@linuxfoundation.org
> Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-
> external@cisco.com>; steve@sakoman.com
> Subject: Re: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
> cve-check.
>=20
> > Hi @Steve Sakoman @richard.purdie@linuxfoundation.org,
> >
> > Kindly consider this patch for "master" branch.
> > Apologies for the error.
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> > > lists.openembedded.org
> > > Sent: Friday, September 1, 2023 9:38 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-
> > > external@cisco.com>; Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC
> > > at
> > > Cisco) <dnagodra@cisco.com>
> > > Subject: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773
> > > from
> > > cve- check.
> > >
> > > Issue only affects Apache.
> > >
> > > Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> > > ---
> > >  meta/recipes-devtools/flex/flex_2.6.4.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb
> > > b/meta/recipes- devtools/flex/flex_2.6.4.bb index
> > > 1ac88d65ef..5be7351f4c 100644
> > > --- a/meta/recipes-devtools/flex/flex_2.6.4.bb
> > > +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> > > @@ -31,6 +31,8 @@ CVE_STATUS[CVE-2019-6293] =3D "upstream-wontfix: \
> > > there is stack exhaustion but no bug and it is building the \
> > > parser, not running it, effectively similar to a compiler ICE.
> > > Upstream no plans to address this."
> > >
> > > +CVE_STATUS[CVE-2015-1773] =3D "not-applicable-platform: Issue only
> > > +affects
> > > Apache."
> > > +
> > >  inherit autotools gettext texinfo ptest github-releases
> > >
> > >  M4 =3D "${bindir}/m4"
> > > --
> > > 2.35.6


