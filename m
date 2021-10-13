Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD19C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 19:14:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web12.1542.1634152446383048855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 12:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com
 header.s=selector1-siemens-onmicrosoft-com header.b=LgB9eWfW;
 spf=pass (domain: siemens.com, ip: 40.107.22.75,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8yKDzXB2Sts9V1EZXKAgD61iXDQslXBWIukndDlIKpvUhFs5VAAIC7xZRfcAMQJJCqdFGBevgrAM3PvI5VxIp69KVbnYXtiXDBa6XTAKck0MW/qFi52ebT3e/MgEQYsLaWsIHU++ufxS4JyKXDfnbcP3IWQGQo0vSdKhmq5iExCl9siCoY0pzzcq2lK4v9vEDBphTUuzaa/ltGGZhTHV+QQtUKnDDqxA6xVMZM4R+4vYgObXs6riIVpml71VfrtiYye6LnrZjau+p3E9IsNByPNcQ2H106SdOvfSAQ83BhrIan7wFPXlbiRvxiauR03ylE65nfT2LDQpJjtEW6rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nb+pOJDOII4X0TtuzE5Mngj5Rx99QaZa8DO/ua8owW4=;
 b=JwRCFFudgP7PjN64Xs7k7X237AorAkI+YWQptIwI+HGZetSPIcbmSkdkIIFMvKPpfz08eRd+wC4u+M3OdVQolyUuwVICv8w/TP+SVDHQjxdeGmcb6XY/2HpoPO/TZUnzG5q644ZQBeQeAn+wScaDCTC4/NF7vT8jIdDgHxuLNABKbgAchMhlrHrlT3nIDrsWL+oj8eiJZMLQckxcoB3HTKSbqZTc7TQdVeBULUd+VrbFg0zyJyD4eI5b2Im93yBBGKgoDnCWs4J0TAdCpaDvXqFrjWkUgdIR5xI+SkJ6yquqnogXbIzpsigfWl4rbnXna+TDUBjrHwFV1kQU4QH1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb+pOJDOII4X0TtuzE5Mngj5Rx99QaZa8DO/ua8owW4=;
 b=LgB9eWfWGLLc2hY6mN+b8ano/OKnGuGUJhwHAfiuzR5xRaxOrXbTO5Pz8lULEQ6SkiSrGe/4R7RS+So/ze820mXHCVs+DjeHZbCN7JMnEhgjbnN2LZ9cY/BJzHVMuit7JtFstnSu4UL6ecHqzQAFomll7kI1tJerQqCheTJKhXA=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB4492.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:22c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 19:13:58 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774%4]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 19:13:58 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: libpsl: Add config knobs for runtime/builtin conversion choices
Thread-Topic: libpsl: Add config knobs for runtime/builtin conversion choices
Thread-Index: AQHXwGZ5SD/9Otc2fEmK+5WS2+7uFA==
Date: Wed, 13 Oct 2021 19:13:58 +0000
Message-ID: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ccc536a-df7b-44dd-64e1-08d98e7d9c0e
x-ms-traffictypediagnostic: DB9PR10MB4492:
x-microsoft-antispam-prvs: 
 <DB9PR10MB449213A8BF41712A2DD7A56192B79@DB9PR10MB4492.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HZulK97o3Y4AJGJOqGzKX+YVx4yw4UwY5QNqxOAr+EgdrXzctkhr+YJ9cTuyUT9GXlkk2DjKz18Cl4jnjkp2yu28zi8dGQH/SyqWiJ/2kcnLgxc6WfkDemijwiJaI8m1fztrm7477bvk/OzVgdy0HEoLgdgtTP+/8M8g3N5K/brJ8NA6H1ewQa6Bb6Q4J+brnNTbP44gwR49bf7BpM0NX+zQPoFrPXq8sa9sGAvmIacgud5NV6+lXRTCN0vfDGi4G035mWYm5Fq6P4f8ZYJy+dBWR9sMqC8t9MFEerK6Z+ImZ4yWYNkSTAU2X1jCcV9DrzIcV2KThhfV5hHer+h5xRAZrqjONSLhKmAo2pJqqXU31HDPdtAKFB+/WmnkW/UECnOeD+pHceIhwD9uNwetzvHddq6La29AcqdGIqzAIQZsn7wquUS8Y9JUcc5FlyOTAEEYY/st+N5WCMQCwHOjs5lUj6JItvrDhkBrXX+CVir0V9L+oRdBDnPyvvZtYHj7k32IqVshmoWf8YwpZpnpb9/JyCKrAsN2jI/R6NArwG/pFS3R2PWIdk9+QqzAekJ91oVcm9HddKu28zSjP0CDWYxQ4PG0PZdzuwgL87+Og+CaWY9Bq8/EjuOuelEJZfIIs8UESwFEb6/4YPJXqZYlrnid2vSJbtoCzQRz19XPZVjtBZ/0CXFDReX6I4jzJRxtBNcnaMk5aCYbivUwSAqTSLkRYL8qG781lfIU+8/bKRrsTHRWZjjS+XaOhWj09Lg+2JjTohlBe/TMg3V9uMdjmmY19jwuKVtkGECZuegKxMI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(76116006)(8676002)(91956017)(6916009)(5660300002)(66476007)(66556008)(64756008)(66446008)(38100700002)(122000001)(86362001)(8936002)(6506007)(26005)(6486002)(2616005)(6512007)(186003)(966005)(508600001)(83380400001)(71200400001)(558084003)(82960400001)(38070700005)(4326008)(316002)(2906002)(54906003)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFdrUzZUM0ZmVEFZeExmeUZyTldiMCs1ZVdKdTEwOU1idFRSSmI4blpubGVp?=
 =?utf-8?B?YkE0d05CUWFmeG1NWmwrdFBPWktlTjQzSG9zaVBtcG8vMnRUS1JMR2FxR25n?=
 =?utf-8?B?Nm45U2FsT0FFOVBQM0Q3YUdBaENvbmYvbWgzdXY1M2FPVFlSenREa1MvQ2tr?=
 =?utf-8?B?Z2s3dzFybHM1QnV3UjA2eGJlendrazYwMWVpU1hOUGdkT1lHQW9aSjJUNlRx?=
 =?utf-8?B?UFJ0aTUzMHFJekVuQk5lZnFwRkdUVVhoalhVV3NGWnJCYkx0NFdjS2Jjcmo5?=
 =?utf-8?B?U0pWYnJ1NXg5TkorSDkxSVFIYS83dWV0OGJTaHBhcjZvK2hPWE9MT3NtaW9R?=
 =?utf-8?B?TXp0blpsUjBkSzZ4ek9zWWJVOC9kZm9NdXJJN2VIVU5MNmw4aFkwODBhalQy?=
 =?utf-8?B?RkdjOERkRTZBSmcyMTk4UWFHbFdSM0lGbmgwdnRuU1ZJOHJrU09WQ2RpVGE5?=
 =?utf-8?B?M29UU1JVUWJpUmd2VUlOVzhKVVlPNURiNHFsUFRVaGxlekIzQytBNTFQMHd1?=
 =?utf-8?B?elpVSnRqVXFvd29vMVZ6VjhXRFFaTU9Dam8rMnhHcTNEMTdvUjNTQXJuSkdP?=
 =?utf-8?B?aG1SQVdNWTlqa2l4bEtCakZvb1RzQ1JZRUF0QzMxcUZXYjc5SytzWGhONW9L?=
 =?utf-8?B?d3cyaEZsUnFMS0RRbmRjWG9qNjkrTmw0dHI5eG04UmNJZ2J4Z2FaRjdTVHZz?=
 =?utf-8?B?d3lBYVZGVXhGOXRIVUpCUmZaVFJ5cFF4cG9Hc3RuTFJ2bWR2WWQ0THczOGtD?=
 =?utf-8?B?YzZDUXZaSDExYk1yYUJ2S042OXpzbUJ4V2trM25za1R1UG5UQ0NaTXAzOWRT?=
 =?utf-8?B?OGlEancxdmVma1lJalI4ZllZb0VxVEZOL1JUOTh4YU5RQlZnYXdXL2thcWh6?=
 =?utf-8?B?WUZpV0JkSDErTVFRV1ZWaldMRk8vY0JiZHhsa3lvRUUwRWVCNW5rUkNiV3Jj?=
 =?utf-8?B?Q0RvUW1sWXpNYWVHYkpVOEpGeHVTN0Z0ajdpTGFpZWo2SkZTMng4TVhVdDdE?=
 =?utf-8?B?RWxESFU3dk0wSEJ2ZWhJZGNwMGhDWWhrelAyendJRmlPYW5sWUl3SzBvMHFZ?=
 =?utf-8?B?dDNHaC9Xa2hRVGd4WDUvVmNBVUpER00vaEFxTnZiZy9rb3NyRndDVU1GYkRF?=
 =?utf-8?B?V2VtZ0VuUHoxdGJkZDJCbUhsL1R0RDZkWGg2VllCOEg2dElQdk1CSGtkMi9L?=
 =?utf-8?B?UTN0aE00cVBUbG1Jdkltc2g1Y1piRERteWJ3UUJPbE9Vb0p4RHAyTWF4akRE?=
 =?utf-8?B?azZXeDFUTGVGaGhEZERKTWVkT09jZDMrTDQxRm1xSE9GNGsxZVZvQW96UUkx?=
 =?utf-8?B?RGN3YjNqZE80Vms4aGRQMW44dUJHOS9KT1cxRVU2Tkdic1JFQXJvRG11alF4?=
 =?utf-8?B?YURFV2tTRTBNd3dDWHVPNnYySHZLbHFlN0tUd0lOZ25ON0dkSHp2bUMrQVNC?=
 =?utf-8?B?WDJqM0IweCtIa0MwN3N0UFdDUjVTaGFVZjJ4aXBnd09ISndNV2QxUVNBUytm?=
 =?utf-8?B?c0NhVFl0TWMwV0VLdStWRWx0eDI0amhDZVQ0ejRYU0R6bnZ4S0I1N25UL0l4?=
 =?utf-8?B?bWI0OE5POHNWaFdXWmpvNlVPYzNPd3QrU21SNG9ucVl4M081dDFvdVRjSE1j?=
 =?utf-8?B?TEFJbVE0bTdieXBEckh5d081MVU3c05mc0JDV1V3UVJoOWoyYm1qL0cyNm1u?=
 =?utf-8?B?cStrSlpTaXdWTXoxZ1FkRWduKzFlVjdLZ1BXWEhibHF6eUVxZTZaUGFud0lo?=
 =?utf-8?Q?eXMxUWzE0LpBy1T6fTC1LvMj5AnPLEqEQPj9fgp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A593FABB89C9A4ABD4280CD481AB126@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ccc536a-df7b-44dd-64e1-08d98e7d9c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 19:13:58.8427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ilDFIgxR1lPXcJImCTSNkdosbo1BWRk4B3TNXzAkg9U76fPcgZqCWQw90FM08Ztsz/A5wUtCznfZ/Ibrhb0hnOpav+jLMBFskun5zuOSMSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 19:14:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156920

SGVsbG8gU3RldmUsDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGluY2x1ZGUgdGhpcyBjb21t
aXQNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21l
c3NhZ2UvMTUwNjI3IGludG8NCmR1bmZlbGwgYnJhbmNoPw0KDQpUaGFua3MsDQpBbmRyZWoNCg==

