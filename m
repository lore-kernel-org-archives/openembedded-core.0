Return-Path: <kenth.eriksson@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D39C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:37:20 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.84])
 by mx.groups.io with SMTP id smtpd.web11.7788.1685515032815184236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=MxtQxAwL;
 spf=pass (domain: infinera.com, ip: 40.107.223.84, mailfrom: kenth.eriksson@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYkTkRJdG+lwWlhl72YmNvxbc73NKOmORfQlW2RwRiwfR4IG4mFpP0h2aWVfxpfGeGNnGPa7j1xOqpwFfRohokUoyALZqqUrr+edIF+//E22Xc5j28j2YxDWnZld9BN3HJD66mTZ8+pLYlYYhuiwqkwLPbtJTvUhbir2bfPOA55YYOcMac1gtXUcGSE8LJKNhC4H9/2byD/QFOD0MAcMfUiHssatQwXZ3l4cc5NYBtJiS3pR+6Mdh4SsLwp4QvrtbCqmDF8eC8GxFdCaI+u/qzDZlt6QhOkMDLmNptWpRThJ6GJbaqKIYQDT+4DYD7nqInj1mMubNglrggk8NnAbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32/IHZkIh1zFrukyxEZlKNy73l3Zn/hkKQlXswlunok=;
 b=SZput2LrQVdJCW3kLbGC0Gv2LMz9YNfXN6HlQFzNtt5OXi6mtkeWFmAO845N03QWCYGUsCRr56stRWaZYfnumNk9KIYJMlPlJrGp94BX9tpHmruBDFiFuk6jN1Zzi6NcpIBbGUmsnwWAIhokJkEaF7mFzUNmTS6BacR83aUjpXz3IBfDQOY54r++WN608zGQpVZ69gpDXATczUjhbwoOpddpX0DUgDMeqAp61MA9BemO1ThHla7aZrJzezC3m5sjMJckSJvCYpkwCHxHLxCqgYrYJKcUBYvva2+f96xn3tbU1w4xO8bhJuo+nPweZxtbhrnhhqPQDDVMD8dhK46H6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32/IHZkIh1zFrukyxEZlKNy73l3Zn/hkKQlXswlunok=;
 b=MxtQxAwLr3HTVexe0HOr7F1xWGf8p5Mlt7k1esyHh4FMQYCdw7QKvW4jG6OK8hMJ2xR1yq9wFaGmpNgBxTfPm6bPwfJ3OQ3uLVOwd1gl3Z0pg7ppaQwcbjTkHo3DqZj6JaPtSOWmpK2+Lx+EkQJvMZCsfm4tAWFSeGVTZo12lqDMBGdPEME074BjhGddq30Q5szi22E5doBGEDdB4pLcANSEMwjjFamN+rT3RT3gY/Khij7om1g3oX5l/HooHG9DwA5XcJm/Rzyyd/WS9GJhT515dEUK6VmDQrSeP2zXSBjvO1AMLxqLrdVkU4yh2FnrmAfwN3SNm6B4Ja4LPtD7iQ==
Received: from MW5PR10MB5713.namprd10.prod.outlook.com (2603:10b6:303:19a::12)
 by DS0PR10MB7430.namprd10.prod.outlook.com (2603:10b6:8:15b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 06:37:09 +0000
Received: from MW5PR10MB5713.namprd10.prod.outlook.com
 ([fe80::da16:b353:3d2b:8cdd]) by MW5PR10MB5713.namprd10.prod.outlook.com
 ([fe80::da16:b353:3d2b:8cdd%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 06:37:09 +0000
From: Kenth Eriksson <Kenth.Eriksson@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: cmake.bbclass poisoning from to /usr/include?
Thread-Topic: cmake.bbclass poisoning from to /usr/include?
Thread-Index: AQHZk4ocfvJRYfP2HEeSQ1e0KKEA5Q==
Date: Wed, 31 May 2023 06:37:09 +0000
Message-ID: 
 <MW5PR10MB57138077813F340A3EFF098DE3489@MW5PR10MB5713.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR10MB5713:EE_|DS0PR10MB7430:EE_
x-ms-office365-filtering-correlation-id: 6e1366bf-2ba8-4a00-a9aa-08db61a17575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dHTQUraggo5xAY+Hu/P5qOg88nzOm9pR7K63ejOWUcgmSFZSAYgEIyA8ECflZnRUUzDaEpJI71sxLU/jeG2ijPpqG2WbvsgXg6h8o6+pS+K3tTa1gDW/39ymnyfskWOfb9B97f3WxticEUs8bsrD8Bn3QbmJ+zqJUH1inyS1zi68zQRScu5Ycte5xKtlltpb7p+RhIvC8IbhmF6FMibZeoVtQ7EBGANdAiskP6TDQ+bHU2hEh4SSG+iSZFK9mNLLXXxMrvq0AX1wEmlQHvfkZxFcbjdqWWpYAIHBO+3+vaimTb5emv7AK8EEgm4pDWGhv6PxZTLIEQBQ8iRloyeGxwEZe/Ba7XeUkJTmClM9FQfM22ubIVd1ZETVA4+fdYdGYO0/OVg+Zqw9OniEpdZfeotgFkvJeESQ1FQBB/y9EHKQeDhI5Giea8vWciyep6Q7pVcOIe/uzuFVyeqrMz0iU0Eqym4MqccnS+83HgDfcj3BTO7q9HI4gRyKjgJk1z/LMoxDepGFPowV1eZ2llCPrSzLYwFl+zTHGWEm8eXaE6fwoKE90/lEyZvLnmKyUm8pNJ5K8FDQuPcxC3taUnCImDlke6sdEc4zHuwRBuikASIE6agU8riDgRwNMIAacv4C
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5713.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(41300700001)(7696005)(52536014)(5660300002)(186003)(71200400001)(33656002)(55016003)(8936002)(8676002)(6916009)(9686003)(6506007)(26005)(64756008)(66446008)(66556008)(66476007)(38100700002)(91956017)(316002)(66946007)(76116006)(2906002)(4744005)(122000001)(478600001)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?A63qWMZOyhq0bGHRpoqZee88GG4X3Rw6B/MdBuU/kgPSa8ddpbLEy2fAl4?=
 =?iso-8859-1?Q?t5QxQODwbeo731t1jigx49D/rB0do1OsxBHWRn/Ml2GwCWZKEkjlRSt9yH?=
 =?iso-8859-1?Q?RmUoqh6fhuYXAS8WZn/QffypBxGu4D6hXSnFXCsvt464VU6De3c6lhHxog?=
 =?iso-8859-1?Q?iQrjwffHtM7CsAZA2/O1igOblj5JTGeeIJ7BWg6SlJchApiMyDjQkqxFkd?=
 =?iso-8859-1?Q?O9ZIFQaz67dPbQn/0Si1G4qZ0sWqyLbj68hFI4ZCKEsaDkABUb5o8FgLKJ?=
 =?iso-8859-1?Q?hNH6r0cshPFl0jPR4xcltOtfol3ew/TgQDzMpZE8ASNhCrWAhjdCije5zN?=
 =?iso-8859-1?Q?WTUhiUO+UCnlEP4FoRgzRd7LDErBf/WM0bxc8ThCkPM/Z0X7RhHV9YPVku?=
 =?iso-8859-1?Q?khN+hSfEfAb7jsaMOYxS+YgxXCMDmA1RS0Qcj992Ekrn75MslWJFYhqPrc?=
 =?iso-8859-1?Q?iX9K1meG7JCRBVJYjxjMZpsvLnc7MxYHzCgsCyFV2FvoF6BO2CrfJOlPMO?=
 =?iso-8859-1?Q?vW+LNidf3lCQ5tjwFEv05/qTcubDBkuR2mTsfDZoxfcEAn7890gqh8lsEn?=
 =?iso-8859-1?Q?6HAsI4+p+1ca1PH67rr7Qz2Q/oyusYK/z7wsJ0FhF2b47m/ROaCRPdy4GS?=
 =?iso-8859-1?Q?VryIHYRU0Xtes1XTYcqEVq7exPw0DF5GbneseGMqYkvl2P992sWqa1+qT0?=
 =?iso-8859-1?Q?awPvvvNTtkI+89WcjbCRsCIEALnflh8XlzldXvgjYkbh4aMa3xOAwewZSR?=
 =?iso-8859-1?Q?0EPFQ7enqQSESBil9HarsLEMP9hzAleu5qZfUb7S0qF7bBYeUK5foIdRF0?=
 =?iso-8859-1?Q?lIVRNoAgAcxDaiBbOjWlZgCboX8CKmpLwbqCHZSp0wNTnrt6EzRZhOkFCW?=
 =?iso-8859-1?Q?ycmsdY/Db1Jhpsbq5NnpWPtwkYeIyDjZwGMLTCco5qMyeBBMTtqXPWL5E1?=
 =?iso-8859-1?Q?mfPOAYB4MkipUW0gLbCyDUypW0RL1wb/xBM1lpiXlx3PLdyEBLZcxWeXHf?=
 =?iso-8859-1?Q?CQeugTG1e3Uf0hbcKFilXVwrJFwNBxvzvz5cYxtea7Hs2HpD/EF0ARfJho?=
 =?iso-8859-1?Q?BVECvanz87TAB1jYyx4dcVOCdxVh8z7PGyx7vE0Vj7NScvF/f59+ojrG3+?=
 =?iso-8859-1?Q?TC3haWoU2CdBmqom+bTpAB1JGW1hMMxCj4K2kUaXv17dlFYrOanSBTq1Nl?=
 =?iso-8859-1?Q?FQf1p/TlmKTL2Fc8d+x1EcMC3+LC7fYho2yNgaCXcR9w4d6vapz4liSVdG?=
 =?iso-8859-1?Q?hRm/Wq7WRhOZvxo3UTgAaUJ9ecKIreOJVfsO9pKWRAXvNMXNoT2PI5RdC9?=
 =?iso-8859-1?Q?+z/Wo2a+1I4G/JOw4Sf0WRhCBCBDTi9agt9sCf2tGyvXhSpNy6ozWg/kBo?=
 =?iso-8859-1?Q?W6HUNV93vki5CcI+OGnDDtIHfgQZ1IMq97K94TCWvPV4JzbO7UrasZ8+4+?=
 =?iso-8859-1?Q?4kaTBKzDCcsiPuQBm+ZZQWGby/7LOA4ohXtyuqVctxEJTRvn6YeKetWNc+?=
 =?iso-8859-1?Q?vV36icwXWPDuWCIGBc1sqv9QBkioIxPB1pjEz2ooP0TehXuH8K4CqsZlyW?=
 =?iso-8859-1?Q?8amjoFCTuX+a8vmTi/Q02dJlDx/jtZWc/wL0BYMxViYtFbtBUQrf8H6XAc?=
 =?iso-8859-1?Q?xtF0wIJYDKHjrB5iWiF677BNv/o8ppzZCs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5713.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1366bf-2ba8-4a00-a9aa-08db61a17575
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 06:37:09.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzHpKGj5JXCef4K2nvfktroi1KVT9dv6d4tCTmDE0OA//EtoDWcZs6gZjmyZbBORTNXsHHqHT/v9xvNUljgIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181992

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

