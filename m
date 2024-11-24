Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFE8E6ADDF
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 22:38:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web10.6343.1732487894184507269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 14:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qFMqj/Iv;
 spf=pass (domain: siemens.com, ip: 40.107.22.68, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDJRlS7p0f5rLu+Bx5oIdX3T1Fu+NpNOAp8K+kRpqgAWwaPkDcbRT+sHOv+1kwP+U4V1CVUbjdYt/dPaILMnSLfHEIToPD+aX8welKaLEGBLqyhcuNQ05hn9rkjMicpsTCr4tgZIg12bX2S+UuANcribts6l8MX0ucDWQYb0hUL4uqLp5NFeIKDw1L+x/m28ZhzSODonL0JFr5Jf+g/3mXf+Xt1xoi8WbgECw1OWcFQXBd0d7rjF2DSOawClQfMVpySAsfsJJAnNNIznOarJsg1tMInJFL0k6CyGWoIxCNmrWmZVLRdBt7HZWOApHjPCA4Z96OT44n0IAkO/VUMr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruqjJct8kVdrOrcKBRcCE/vFS2iAE448yuKfeWxyouI=;
 b=t1EoxOrK5ai++ot1jkVrlnzxrrZ/niEHWEqDppi2rxRT/JXJZCGXCd61bBc1zd/44iApraZLodhJ7XCd4sYqVYgRp1/BcsMAJzP04hIi+bRlTZ8SbdXlUZA15pXzsgSJR4Vvfr4LH/x8P3x4heN8idKcjFwnONwXlsDkdipdsMOth9lh3dAIkIp9I4f62E/24X2ydby1x2lLi7osocazuFhtsrn9mvd32PKOZ58mTYIiQUFtbH1oQ/jWQqDMHfayzzUUxwL2V5eE0Zqefh0A8fzj3nlDplfEO3yCWUUS6SIKJe7VctN+D6rEnLuHHAgzZh38M1YPJSFFpFgo2B3MPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruqjJct8kVdrOrcKBRcCE/vFS2iAE448yuKfeWxyouI=;
 b=qFMqj/IvYBAZPZNJ2XDk1ZMXehgmyYRyukkJi38hEDPa2UP3SDG/NS4bNuWqjDbpYlVq3MifqxAmJNHSe1ozapFmZmmGNY+oahyHjMB78v/jJ2Em4cuGLxLOY4yFKNeDbuXGBJffRYg8Q2/NVVLCWxy1Sl3TWR1wwvu4wHO8tKCYS+iImonjEhOFiW0nVTvunFe9/GARLh+R61Xn6hxJEIGzSvl4NK6xEITZCz7ofrMeTtPVQomMOizV07porg4G1JYIu2G399y9OpCYghdtxPoTLjI94qSJSrDd4FMyXQMMuEC4nU6Pz3wDmqXqjO7EPifV9Bq1qJK6hTUgvFEenw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8476.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.11; Sun, 24 Nov
 2024 22:38:10 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Sun, 24 Nov 2024
 22:38:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for master on Sun 17 Nov
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 17 Nov
 2024 01:00:01 AM HST
Thread-Index: AQHbOOMHppjdKKeisk66KH+UMfJa37LHEDdg
Date: Sun, 24 Nov 2024 22:38:09 +0000
Message-ID: 
 <AS1PR10MB56975B57EF4DE96ECDC4A156FD2D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241117112234.0C8111003F5@builder.sakoman.com>
In-Reply-To: <20241117112234.0C8111003F5@builder.sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7b9b964a-8206-45d5-8bda-89f4705bdd13;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-24T22:34:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8476:EE_
x-ms-office365-filtering-correlation-id: bd1a315e-d321-495f-3c2e-08dd0cd8ac40
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?opO7QA7z8YFVj70Grxphz9r3USGSnuiD45YXpd1UZKmubiD9tueCezEyqsz4?=
 =?us-ascii?Q?tmIjWXZ8vU15MskRQRZE1RrFbKDEsQ01alADCCtRcaIOgKnrJfZ/ReWvZnx7?=
 =?us-ascii?Q?8rpz1B5eC0AW+CFxKXgLb/y0fU2VXB/ifR5ZGIOztRb/8l0wNOqda1/5QBBr?=
 =?us-ascii?Q?bSXG45LeZIWP2OgPh+NDUIPwTM29Rqvhj9yTRXW6eKNEbZcZ6gnJ2QuNjryc?=
 =?us-ascii?Q?pJADFhU+i/9uQsymrYBNDXF4Sg5OT58QIEtIfJAMaf5P8BsGLuZI65M9CWn4?=
 =?us-ascii?Q?aTUws3M7EVnPZKXOev9QyRBeO+D1E8XLXVa8ITuoLo8k/eVAlgKFyyfap9K8?=
 =?us-ascii?Q?zK/ZckVcWh5esn/Rc56/aCwTfO3Lk3sohUb1EIU65S0mMQYBqgFVWBIrhjpM?=
 =?us-ascii?Q?k2kQw6T6HufPs5Wn8oV7/kBY/jEhoO2Zvd7MKGCcMEAEqLfLjve4MPTKPsEp?=
 =?us-ascii?Q?BLTdUpvceft6ti9unJ0ysqerVcxkx6XKe8Bqmk6Uyi73DtIEiX8hgTyw0vmk?=
 =?us-ascii?Q?5HOCWUcBsgnmGVGgfvgCDN4JrOov+9TOlJnCuoGYkiXb281DqnWoPbfYao4o?=
 =?us-ascii?Q?QmaVIXs84LBRcqegEqoWgIPaSJMogb3ADG6jPmBr3bw9VpIBYphRG5qtF3Se?=
 =?us-ascii?Q?UrK7EKcKac8CaEkb5sycy6in5qxms0St3zj+luY/1dE/COMsIKN4Nh0+sgaT?=
 =?us-ascii?Q?SNlL1aXNSHsO+yisLGtJyEjxdbbkVKygPBexy0rVBMFGLBafU5bFk54kRxtm?=
 =?us-ascii?Q?vKw+wPqv/lHxLdLK/NQyDzPaVgBwo5pvGs+zlQvRExWDRzVYTHco1H9oJlTO?=
 =?us-ascii?Q?n3buhS/In8O4C1lKPb72KyIx1nk8jBiKqUvHdJHwXeGJavlkF+kWx/Dq29tf?=
 =?us-ascii?Q?f+2jE4SYFi0rkdmBwE3t16Ho8t+G60Yvyuv0gr5D4mVuuzyJwQ7Ljk/k5lSy?=
 =?us-ascii?Q?Lfa/2/9QG/fS0kSypSRklPFNQ8Yp1BArrlPeKPOmqmEzCo5gUxko1XPDXn2H?=
 =?us-ascii?Q?527BgLxo4QJAe2hxwBZQGZz45dBaVfuoIsnqFrjpKjZX9554CPJhs3DnEeSU?=
 =?us-ascii?Q?xJ8SgUizyat9MpxPYzDb2yNQ23fYZmP10H4AaKrwNlgGTWGPPAZBpiLuInyz?=
 =?us-ascii?Q?l4rRiMA1wAa+5J9YhgHYWdqbrGpRllH862KNdBmeKH9LRMU4h3vOGYQz/x+U?=
 =?us-ascii?Q?dZpe54qhUO0cm/0ApbclhuxfCTTWDdQtF5H5EOfM2DpjNhruwcjxUBPEkBva?=
 =?us-ascii?Q?//M65A4vj2gbFM3Twaog+RJPDnE3Gc1oh9Ig2tSgl2qK57ykwSKyfZRETTfp?=
 =?us-ascii?Q?IunFD+QIQjrLyUbHSzT9qJXF6RgMmD3ynII4KlTY07vNnV2Olr3JmtTuG+FW?=
 =?us-ascii?Q?2NCC21g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ODyt7IiV4LpJMHt/yvkYUlw+a+tQulb/ts5Tf5Rj+eTVVGixiJ+ODZOPEHfY?=
 =?us-ascii?Q?b3YoXS7QNiZ0izAHVIfKoZbZTfrYKYSBr0nDE0Rd2JqLylNRAgHmcZWvMFyN?=
 =?us-ascii?Q?ikucQHgy/IUONOmKw8ERrX/rZcKqMWZOx5fIBT4rtY/+GrLx1WA7Lav2Datm?=
 =?us-ascii?Q?wR9XD+TJBCpG1l91TOfx5oczwseMN8QBSRJbrl2JxV702WUo/CkK91e8Ud21?=
 =?us-ascii?Q?MyM55WcEQD7wmP/ItfEwbAQt32L1UPWUupVi/hM9isXWQBBhlHGRDsChV9w0?=
 =?us-ascii?Q?rIxsFaIOtkFUKaiOk8tsSd1O55KmY+nGMPifvnGkwStk5400idWHVAR+jTV3?=
 =?us-ascii?Q?q2+j7ke0RAj2cU64xX5w+uw6Y4wnVTm5xeqy4+mFcyHY8+rdV9Hry37beOO/?=
 =?us-ascii?Q?iykS3llLC0e3S/hM4pHNU6dzrKBr3XAK7aVBNJHUZ7SQLC56z++I9KD0KcTo?=
 =?us-ascii?Q?Sc9mRC7YO3QBSw8e/dwgldvUd/9OifClOLupwP6XP3bsK+184BvypZuBKL2x?=
 =?us-ascii?Q?1B6jxpkstipVXuh4OKgzx2b4XFIUouw/fygRxWWB1kkcRXDsPyXPF2GQu4Uv?=
 =?us-ascii?Q?cBKp2jgJhXZKd/oEPUhFjKjS94kN1rh9vBL4Yh11NVQ6f2drGn7PV5xGlaU8?=
 =?us-ascii?Q?eunZo6ZN/KBbTzCxqZ+D+Noaxpe7i2dTX90Xb5tdQ/+93mepbc9FGyULYeiT?=
 =?us-ascii?Q?X7UWtWI8hR+ZKMoz9XeX/Afeyyohs6PMingWHdlREH6KCZ/Crda0VcjTPfH7?=
 =?us-ascii?Q?btGohATdM32yn4/HjHjXF+1n9oE4wZvyjTn8PI86G20k6cmZFbQ1FSSHFmui?=
 =?us-ascii?Q?Rr0OIKIZ/OG20bWYqprHENgZhc67kYKoNGCJmPnSAv8/ZUgSwRy/qME3377b?=
 =?us-ascii?Q?/1sSmPcpu6l7NB/TPepBKqUuvBYmbOiJbl/e9H9dLsb3IRM9nvtUpdiCLwe8?=
 =?us-ascii?Q?cp9VvwngEy/XYspNlS0fbOqqClr+w53Q3N0ihR+Ey82uCf5wfZjKSemBrfyf?=
 =?us-ascii?Q?EuG+dct64j/MvsCRk3L4VrLFSDB2DkU4TnMO0iB6lC42JFompzhL42CE0rsc?=
 =?us-ascii?Q?ZLhD5A2Lp8P1VBhSjZr7qHojZjroDmMVE/FnsFaERlz6NhYsqaWodo1Th67U?=
 =?us-ascii?Q?xSE5+qhv6ECJ/ok+LKoMgSbJiU2sumcqH5HMKxVrtTXHbnHgRZKg1ExSFRqr?=
 =?us-ascii?Q?SxDbU0ghxme301qzmTTT2PG26piw4Q3/4ztEw8GCskqQffBCbqCLHRxetbVI?=
 =?us-ascii?Q?2yaIipBjRn5+5R8dJcsJXMhliuUyDFjgc9zV4SkQKv9VlKOg2YZTRfZOGHTg?=
 =?us-ascii?Q?DRrYxJlNiXy3j9dUv1NnTIQqN7qqoNcv1qB+Rtswm2hgx/rZm3oR/xDrsYJm?=
 =?us-ascii?Q?doxJhNvM6PYQFSX3foNLR67ddqUctkawO1MG1jjEtqga1jP7Jz7iO8EGFQ/2?=
 =?us-ascii?Q?XHtYpt2NgLyPSFS+E1M+Sh/rI0NgJw2CoC98rFLamVunaNmp9Ep+peuUt37w?=
 =?us-ascii?Q?L3RARFxogYRNUk2JMlL1iCvvfh4nVomMgxD3OBmEy+o4wu1668Wm2EwEwy3Q?=
 =?us-ascii?Q?MCgy81XZDSTWeqyQU+SZs5qRUxLnhYZFzBfqBVrk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1a315e-d321-495f-3c2e-08dd0cd8ac40
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2024 22:38:09.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yZGev+QuJdi8jTdRM1KTuMZ0dusTRd526mo7tCwlXortap3cRBHLHf2DviKNAFb+SAPScw0X3lNxk3ipswuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8476
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207717

Would be cool if there were also reports for styhead branch, including grap=
h on https://valkyrie.yocto.io/pub/non-release/patchmetrics/.=09
Peter

