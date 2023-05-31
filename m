Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F089CC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 12:23:59 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.61])
 by mx.groups.io with SMTP id smtpd.web10.7735.1685514660367988008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=nWuDbLBa;
 spf=pass (domain: infinera.com, ip: 40.107.100.61, mailfrom: kenth.eriksson@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2DFO5nDRkmhFA9iTM2llW/bokc8EbOOyb1UYrWbycY0aaJKB8N1lJPWvTc1PE1dFmHNMmaS1Z2a/lQnhs3Hka3P1Kev1z88RdbUAMmZ1cWgIEHPlyvSHmqPGsXNXGSEc3ybVxOKvR3KYHGJ5ko2xWwFiUrvDID1/Q+pUruEwp0bE9lGj6laNfIGzN5ryV7df4IIeXtj/XBwF1eosmM5THvkGQ6ELdJla/fGqLJO96fAne6rtWHYjP57j/OJO4ZADuocJeUo3/T10Lrd98K5ZBLEQ+5PnAYqZPo+9DrQScHZGhNVdlHoIWkcZH6ANQrx7CcKJtzrfLnJ9DRQ4AvE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztW3lfFDncYwMCrkQyY8dJplR3p1ewrc+p+qtXzt6ns=;
 b=Zf5pX0Wqx4iVQGw4tf4oo1RhrFDWCFtgDLTUSMVO6soouMKqaswgFk1pqyfs9Z2huQCRy0nmXM9YeLP9RBqpVbJrMTrFIx0fkwemXXqAt8XNtWA/jdOYPafZJBQJzuN5JLOnznTrDeAnDvgBJe0UzPtpHNycJeBEm7c47QlvrQZVzS6H87U4pTOXQdXTCZyivqWMOJsXF/PoLEgCIFrZ1aOGQhdLVhceJBmILtV2Hc3Jn+q5LfZgPGcfSseyEI208/WeNkGhf52lFFTNZox3lYcE1l08CIo6HJnqy34IPMt/ettDI7k/aORg4b8fISL4b2Gl8EULit7c3DUrDw160A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztW3lfFDncYwMCrkQyY8dJplR3p1ewrc+p+qtXzt6ns=;
 b=nWuDbLBaGheBkFJVUgYEw2yyMaxryIDA+MgILvfPDKXWWf9I/JLPRJMnhM+gTFJzihdjSpmdDzSke/sssyfadB8U2ZrPkW66Potu9xwC4GOJEzRV3Y+zw+b7PaacMdT+PdCxEf7gFvLwu/1qhofuJ0tLx3QQ6ybM6SPrPuVEZuwrWHCHu2UppT9ENV2KiRq5e6vKEutuafEcZYXRu9t24fn/AAm/AyU8jrDYRIiqEFBVoeUYGJNH+tDSD3JwDojn+11YrJltYi8/ZaMl+dv62A9yn5c9CPvpNjygAekhATB07/XMQ5wklLtAj3+BZoVQvWG/xAsq9UcoVVAlLV/6sQ==
Received: from MW5PR10MB5713.namprd10.prod.outlook.com (2603:10b6:303:19a::12)
 by MN6PR10MB7468.namprd10.prod.outlook.com (2603:10b6:208:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 06:30:57 +0000
Received: from MW5PR10MB5713.namprd10.prod.outlook.com
 ([fe80::da16:b353:3d2b:8cdd]) by MW5PR10MB5713.namprd10.prod.outlook.com
 ([fe80::da16:b353:3d2b:8cdd%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 06:30:57 +0000
From: "Kenth Eriksson" <kenth.eriksson@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: cmake.bbclass poisoning from to /usr/include?
Thread-Topic: cmake.bbclass poisoning from to /usr/include?
Thread-Index: AQHZk4hj9pejJWjxTE2O4UqKei+cqA==
Date: Wed, 31 May 2023 06:30:57 +0000
Message-ID: 
 <MW5PR10MB571399FA26799656938F15B5E3489@MW5PR10MB5713.namprd10.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR10MB5713:EE_|MN6PR10MB7468:EE_
x-ms-office365-filtering-correlation-id: cdbfecd0-0151-4439-d23b-08db61a097e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J7kLe5YEKoawJh3+XUnpUPUDu4AoGP7Bh94+Fyt9S3X/TBhoZ/jaTe2k4NQKh4wHLmnOv8pN6oemSgIT0EVI8sG3BH3ShMXIuU6JimAEuj6hCxjAGjJbzpvh+n5rOCBEqUDtDThhcafK2NwiCMRq9QGer0MjAxXFCWp4MKFkDsrS9PvpS7HnHvbvALrPtBhwkJeK8/Bwjp+HxtrE/XlwI3huDwWf1aDeTAqS+Ek0QlzW2AKaXmEqy57v7lCwZMqKwBaJ1NEtzV5gIC3dpT3OPLaESLzak5HqUXEwbGV4G9+6PTujmJ2mjo/LSJv7BxlDZZrSA4wQC/YBeHScdKmATzW9UsifEnwd5Xityj1dl+BJc8MWeijGY4pvFK10A9+JFQOSPjBrQxzACpTud8u4gD1Ikx2eWspk9q52bzjN4KYUs8s2aoEagbfOYVPVP9HiWjQxl8WBIP2tVy9CH0KPXKeBJsyumkRr+nhqMcKaCa1PbYOQe74UgzIfQv2OmeYQgt8V4oRvcZT6rrfZ1vPgSgLU+72VCpIg/ySZYrDQ9kfK+31w1Pv6EIXyw/ySmBXB9M6rFOjtFC6Dh6inudvclHSwIuR8TPezvO+FIVFJw1WHSbZTXMvAO3l/+yx3RPxa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5713.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(86362001)(33656002)(122000001)(38100700002)(38070700005)(478600001)(71200400001)(7696005)(5660300002)(8676002)(8936002)(4744005)(2906002)(52536014)(91956017)(6916009)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(316002)(41300700001)(55016003)(186003)(6506007)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?iULEBjj9CCj+C5NsaU7ddIfxEZ4Mxtbi/2cX7ptRgk/Epd0tqVTJDYJDqa?=
 =?iso-8859-1?Q?9t0rDfuycmTfLCgIlfPQPikX0PR3JPI2Qsla8wxkYwHTsCvAB5WiqJ4CUQ?=
 =?iso-8859-1?Q?gnMKxDHRX69DYD3xqzQCW0Am4vZ2Y/TeJZl+rnC8Ak9CcppMdJsjLQ8Z1V?=
 =?iso-8859-1?Q?pFua3boTfLvBDJkHjAC4xZR+xuNPat/MF8jG0zF6lEFnUZrZQrkLf5DFV/?=
 =?iso-8859-1?Q?T21Cqqsinu4rScYhRo8PnGHkvk1OrqThCANEnuvOz6c08jQOYCDa0Y4vv+?=
 =?iso-8859-1?Q?p4FktX/H9mr95J1vsT25qXc1HBHGzhPR+5lO5rfTpnGpls24S8ZM4xzDxy?=
 =?iso-8859-1?Q?CpOyVCrnlJPt86YM9S+lMbBYyYqbcyladUiKlJKxK2C+tEa8QqnLufq8DY?=
 =?iso-8859-1?Q?NO8XSruwxmy+PauPz9WGh1sEP6VcIlf3hbDjoqou1N4U8vz8LjHQGrTR6Q?=
 =?iso-8859-1?Q?35873av8xYaftzWsNNhIg+jY/MTQtW4hS1Ek1FLt3hhj+WD/+ndfW1t50n?=
 =?iso-8859-1?Q?xyiPNb4fMj5cbN+j18PpSZudVuo9kAVlxLJ5uogEA/73RFDAiOlBscRvKL?=
 =?iso-8859-1?Q?XZ9NFfjuRBQ1Hh1v1UtYOh5Jz4om/Y+h2pmSkqF2GEL2ICdc0yQRUJNjB5?=
 =?iso-8859-1?Q?j7kq9glcOWUqolTsVy2PTGkXuUkfJpt7T75sBOG6EQMnlGdfuqJnt7D12O?=
 =?iso-8859-1?Q?Z/9EcEKwZHKyr8YkFkHkyDzxrLt9Ok4uphqM7s+NSyhb6/Wcs/sTNRMNoz?=
 =?iso-8859-1?Q?+Yi9wdsewu7+Qtc3+SAwMiqEA3QtTIt3LoEA4EeOtLuCQL2xzUgwd/bG2E?=
 =?iso-8859-1?Q?iVdMoWfIL4HnpTHTPnvWkE6Z8VcdTzuPI+SiJcFmo16Zmit8USOX1CG03I?=
 =?iso-8859-1?Q?WOYc0mXtMjbe2Pws+lT+LzjX3YLwAKXvZZEU4JDVqciZ/UqxPcxtenb1df?=
 =?iso-8859-1?Q?nWIArEe6hD8tmh8dmh3rr9oFDryLV5XtdpyEAtGFHcwrKR/cydyiRvr/bT?=
 =?iso-8859-1?Q?LMsKMNpoJ499YlY+7WFw2X7jszSfEoa5ig8eoU4c1987qNWLygWY9wjU04?=
 =?iso-8859-1?Q?bG8thrYbT70fjj4s9rYlFvHDNlBLVYNdvdhl+02kCnDxd1HWFgDJgkVbO1?=
 =?iso-8859-1?Q?4OkDW4VzGp/6J1fhuihRufV1mCzTB1Lqu+jTWYbf9wM47PYsqs9oJcnOpS?=
 =?iso-8859-1?Q?rUeg7WEtm92E2wUh8Hbp76DhJCFpVdfQB6OiKXumoQLtopgFumUJU6+dUg?=
 =?iso-8859-1?Q?ApTyLIb+QxY0uMTZakzwOyPRQa0Zf/NojgZ+7qE+QVoAyj1wUjfGDCMbI7?=
 =?iso-8859-1?Q?6itk9j9fgVOCbw80w5eR7UcRfVKIzSqmuxk5NVsd4JyJejbpV67lttRdEx?=
 =?iso-8859-1?Q?SrzPCiGKqPR6ZVp0o1wvxXKm2mJtKqN3dziO636RPbweza6j7oeh4aOrSr?=
 =?iso-8859-1?Q?m9sHqrikKp/DS/j3wlM/Gfxvcxthxz+7hfeSbz3aHfCZJbhrYRlI9+yhXn?=
 =?iso-8859-1?Q?+ipP7zjC72IwKkHtiMKYBpIs+fnQrrBa1CP3CEry0HRFUUuZUk3P5TqPhw?=
 =?iso-8859-1?Q?rQHXiBABcjgt0NlrfB6T4LFi0Y99IYYnR0IkqR8polwIZ9QiiGPg6YnTpa?=
 =?iso-8859-1?Q?1mJWM7G+g3xfM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5713.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbfecd0-0151-4439-d23b-08db61a097e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 06:30:57.3584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1J8vePqDgL0SnIUBo7Ucv/6nasPazTxcL1Z9s+iDArxZNRYHH1y8sSvE5mrYdjfykodc0QHaKTbS8hR5jl6Qjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7468
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 12:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182102

The generated toolchain file in cmake.bbclass uses ${includedir} for popula=
ting CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES and CMAKE_CXX_IMPLICIT_INCLUDE_DI=
RECTORIES. This results in include path pointing to /usr/include, is this c=
orrect? I expected to only allow header files from the recipe sysroot.=0A=
 =0A=
root@f932251cbb7f:git# cat ../toolchain.cmake | grep INCLUDE_DIR=0A=
list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES /usr/include)=0A=
list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES /usr/include)=0A=
=0A=
Thanks,=0A=
Kenth=

