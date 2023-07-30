Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7000EC001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 12:47:30 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.85])
 by mx.groups.io with SMTP id smtpd.web10.71934.1690721244401164090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 05:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bW8GJRzf;
 spf=pass (domain: siemens.com, ip: 40.107.247.85, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSKUPlHxcK+Pv5xq5WNJOz7rdhCbVXr+gNWrDBKicuPTzheBmyVEX394G9Y4vEwLkXj3/duJZ4Ov0dcrF0hkWe0ErcEivdOFqWcqkstqqfAh5XNWR7bkUW4KNolZghVTD48WkFK9zhyPcazTIUIRl0rpm7oWmr+y/fmGGmKDRW+ST4Xv4Fjxq2Oc2oIaB2N+7XoY36/qUvUNnhZOFbc/k/fjmMCQKAdbX6Dtc9kU8eIL9RCfRSk2L2GewC4daN1pDhxc5MTGQBNo6XtVO0S0mvxI1H1tGQR+4lv/DNot21KpxlNpBkmiCO4YCg2Lnrt1qJne9mdvPrisjfrSIC6aFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTazULC11Idi3mdSvvWCWUTeahofxx/0Cz8oeBwOToo=;
 b=Z8c9mrYeqzcM9i9hkoMz3PJ+EFkMRWbMIxT/MZ5UjA1qA3HRhno8a40htdMvkpnIFCwL2moXWptSyoBb/JM5kUbms0U5AZNZ/ZF/Sp6it7dW2KgxaeEWTLO17t9c8NAfee9EXlTkHCLZsNHnb9JEwgYvy/Q1raU1qqjwuvEwq32wG4zSI2vmxX3OQ56/F4yZp/ZxToWDc+qeuc1E+iJ5crdC5r5yMVWLCWpGEibGqr5yrQI7rZ+irYNUXXQzNgwlLQpz+zRrDGe+h2r0rDYef9pk9VjiqDcCRYjjW3+YvuBDMi/Ntlpj+oC0t//i8I/E1Q+PLEGJO5JgbN0OXukB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTazULC11Idi3mdSvvWCWUTeahofxx/0Cz8oeBwOToo=;
 b=bW8GJRzf/rBl7g730IaY859kNrAs8Q7IQlqtyrB/ow7O3pVMKjTYIQ3hm3vaMejUkBAaKMlENg9NYlZcVwq9bmcN+YUWpOJ0OM3eWHZFsblAvv8x/+0j1lzu0Y3yJrNvIq5sBUp4JZ3HnGDlAg8/HNwYsK0m+Aun0FpDiw6Ap7KUbzP1UK3HhK4UCp+SSOezh469PgShTTWvLhG1fxxT7e8udrj8yF8JbSS6K9KZrXRBGZkJx40eKwlIAr738tcsoS/MSw5M4hEo9tAblRKz/FKXa7L3HOQWl93V2tJT7Zv6JibGNCTyYQJUv5fxbqmDQq2agbB/2F7NW2baRq3NcQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sun, 30 Jul
 2023 12:47:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6631.042; Sun, 30 Jul 2023
 12:47:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
CC: "steve@sakoman.com" <steve@sakoman.com>, "Valek, Andrej"
	<andrej.valek@siemens.com>
Subject: RE: [yocto-security] OE-core CVE metrics for master on Sun 30 Jul
 2023 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 30 Jul
 2023 01:00:01 AM HST
Thread-Index: AQHZwtgCM2zm9Vr1sEi3tVp3dVb0CK/SQP7A
Date: Sun, 30 Jul 2023 12:47:20 +0000
Message-ID: 
 <AS1PR10MB56975725132E64B56D9A78E8FD04A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230730112128.9FCA6107139@builder.sakoman.com>
In-Reply-To: <20230730112128.9FCA6107139@builder.sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-07-30T12:47:19Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a9de0ae9-5914-4fde-b5f7-200e28d3ff02;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6020:EE_
x-ms-office365-filtering-correlation-id: 7cfd4855-f7d0-4572-5dc7-08db90fb1d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y3FvFbt8Oohe0Xp5AcWdQ+Wlb0XjZynv9IMnuKnyc1Ye/HTRpm7idSetXoT4aFZrbSheAN6vSlyUr/0tub77VDU5gwLEfHj75lUoX6QdyV4UwmFliVXdgmM840QI2baxCw2jUBl/fcZrbqVPs4R96UoHF5utC5dG69CzhYSMp9AoNaNCPpVqAxL+3W+nRIMUtMcNt6RPocPCxyyEuEbhYQZ9nIY2/KO5/sxaBGPi99ynQzu5sbB1CeCIMILhYE7C7hHAOmPu28ywURalScNWzkru82E5NQfVEDXcuZN+CgKD5rqbBbY8pl1pih+n0xilkSaf6GOa/KVL0Y4NxXyBKze1eGVWBmfPjUC1KjPfpsSoolCBnNbOjVe7gFY4C2T0Js2qEVHlKzp3EsA0ZWy8JJZGlvYrKk0/Ukp7RFVHBEGI96teHw2Ed2lEKYfVhjpGiYk5X8S0mCgT92Na1bISUkVOsXyOX6ANEB/1BhV5Csr0MfBT9nFzqrv+4R467hRm+GOGcz6jNHDFou5MiYCKyWvGWJ4goUPhFjBJ642RDmW4l+KqeNH/wsElch0/dSMurCzUtG+aN9AgJC23wBU4BcLi4AYK+khsWblHr0bwS/8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(5660300002)(52536014)(6506007)(53546011)(55236004)(8936002)(8676002)(186003)(83380400001)(26005)(478600001)(316002)(76116006)(66946007)(54906003)(110136005)(4326008)(66556008)(66476007)(66446008)(64756008)(107886003)(7696005)(71200400001)(9686003)(966005)(41300700001)(86362001)(33656002)(55016003)(38070700005)(15650500001)(2906002)(82960400001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hpv2Bp7r19StTJOsDm/yATScMURJteSw/fy51dDxMuKXbA5c40761aADQZQ3?=
 =?us-ascii?Q?mePhHhIHlyaFLPT8CqiTiE2xaBKzhJl6beOmIZ4maPyC6RzEPhF9mGmV47NN?=
 =?us-ascii?Q?URCvNcVQUyKJE325VjZNuUPtCr2P1Tcmsw4Usq6TNsb+wvErDJhsov1Y96T2?=
 =?us-ascii?Q?bMUqDul7OROEtpYTFwnShq/oYY3EjdM10Pv+VzYIybwycr6QlSt4xc4Pj5EE?=
 =?us-ascii?Q?AcPff4710EonqePlp2zOjUBdSdJO5LODP4Bxv4El3s0BO4YwzZ7tBSYmRBWA?=
 =?us-ascii?Q?6yn0ikEYvsdZW+LbI13DmKJehAK+rXIA4+DJUH80Z/1NdTj989CHKtX4QeWA?=
 =?us-ascii?Q?xKhWs8+dCLyQH9VpOvhf5ZaI/uo/ouvxkkgv4NKAQsrUIKuxARamiQOL9rm3?=
 =?us-ascii?Q?TSCZ2l1LFXDN4KJULTUKCvHszJP7aV3ggf0J9tjpyPMmeNYkl0yeh3yObWAQ?=
 =?us-ascii?Q?hJ7byiPsDSSflkvt8zV3LI0abQQ3TU7v6QDj6bhm32Q6BojPbNClAdhvYVOz?=
 =?us-ascii?Q?9cnxV6qRfyz0jFsrL2N1GKW/pMJaUM/Fl1RppHiJnAK7jll6CIJnCM2ijTMs?=
 =?us-ascii?Q?9AEQMzsJAVp154JJx5X4PC3XVa2spAjY8c65B+VtbAwlwsLtSXckRJnp0qM8?=
 =?us-ascii?Q?ZckZs8mBTBrbHNbbD4GgtoQfHUCOc/7YoTNC8oD90fdREqe+bkklBvcKPywz?=
 =?us-ascii?Q?eLuhc82GutEuCvbHZZ/o1UnjpAdBJoQPS8K2gjaBska+FxhgabaPjCY4orJq?=
 =?us-ascii?Q?KbnEI3PE2sQ/8IbWduoydX710HD57fHqa5EKl3/oTfMVsS8qeIzicJqjo8II?=
 =?us-ascii?Q?PVCew1u1d/IJZwhK56iti4l0u2ZYR/szfv+Vsfx1JakpdkmUryA+CxJZNdKp?=
 =?us-ascii?Q?RLEFa/i9+VgVkIMUAT6vHimc/EViaSsvUlLThYFeXaN9nBsE9WYVj9VKxgBj?=
 =?us-ascii?Q?4yJmKoN+1XaMzeSRaOZwP0g1jsCp394QI40D5X1bTkUtRTCW3XDa2tqXiJfC?=
 =?us-ascii?Q?FpTB41g1g33btavTP0TJNof8Ql4YzabDNh2lSyL3U+iEAj5Bgt0Vdd7QIrHH?=
 =?us-ascii?Q?dlZaZDADSCwuf/lZiITxuGSmyGMEjyYqp2TZ3QsvVD0xr+bF+wTY72rJBZah?=
 =?us-ascii?Q?JlIMDap8NKV04/l1djfYaVh8FW8OuGRfDYjXM41VtrS8ZH6LH99ZouszKIA7?=
 =?us-ascii?Q?yPOFHkulS2FnAMJuNnw20iGYh4LjpbDONLM/ZsZd6KzGUcnrXVsVba7R5dXU?=
 =?us-ascii?Q?hJALZGcl7cRvGAo1GHgj8tJvfu58PqdhpxDQwVuc/MM/KUxKzmrSLAKGApkS?=
 =?us-ascii?Q?Z0htKE+C7zvcFc2WCMeF9nzkxdVcH6McIbR4U4PSZE0O8uqPKhuYV50pWLYl?=
 =?us-ascii?Q?L8A/rSIW4EtM0P+/dg/pScIrTpe+Y/TtK6mZU5bfcW+dXTevVEPVEfsxXp5X?=
 =?us-ascii?Q?0yagm45j74MX2lvt56exu8e2Deo0bX3keoL5PThQ1BfJgor/NevvTuEFdeHw?=
 =?us-ascii?Q?QEskG3jVNhBbGiljFIjvn5hFVER2yazrmzsu/GQ6b6E8Dyh6arCDNVmkWy4E?=
 =?us-ascii?Q?qKbwj4d/xnE+wwwBnb3mYuvpo9eb3CbaU6ln7aT0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfd4855-f7d0-4572-5dc7-08db90fb1d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2023 12:47:20.2744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KkA/qef8o6VcXxU9+sHPTbULWqaDsaIPlIm/pNQdqWI7f+3gAmh9/lIBpt9rvtkJ5U5XvzZxB1EBF6rg40Mxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185070

Some old CVEs are coming back.
I think this is a regression from CVE_CHECK_IGNORE conversion.
http://git.openembedded.org/openembedded-core/commit/?id=3D1634ed4048cf5678=
8cd5c2c1bdc979b70afcdcd7
I'll check these tomorrow.

Peter

> -----Original Message-----
> From: yocto-security@lists.yoctoproject.org <yocto-security@lists.yoctopr=
oject.org> On Behalf Of Steve Sakoman via lists.yoctoproject.org
> Sent: Sunday, July 30, 2023 13:21
> To: openembedded-core@lists.openembedded.org; yocto-security@lists.yoctop=
roject.org
> Subject: [yocto-security] OE-core CVE metrics for master on Sun 30 Jul 20=
23 01:00:01 AM HST
>
> Branch: master
>
> New this week: 31 CVEs
> CVE-2020-24490 (CVSS3: 6.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2020-24490 *
> CVE-2020-25668 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2020-25668 *
> CVE-2020-27777 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2020-27777 *
> CVE-2020-27815 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2020-27815 *
> CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-33065 *
> CVE-2023-0160 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-0160 *
> CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-1206 *
> CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-2176 *
> CVE-2023-24329 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-24329 *
> CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-2975 *
> CVE-2023-32250 (CVSS3: 8.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-32250 *
> CVE-2023-32254 (CVSS3: 8.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-32254 *
> CVE-2023-3268 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3268 *
> CVE-2023-3269 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3269 *
> CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354 *
> CVE-2023-3446 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3446 *
> CVE-2023-35823 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35823 *
> CVE-2023-35824 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35824 *
> CVE-2023-35826 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35826 *
> CVE-2023-35828 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35828 *
> CVE-2023-35829 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35829 *
> CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-3618 *
> CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-37769 *
> CVE-2023-38409 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-38409 *
> CVE-2023-38426 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38426 *
> CVE-2023-38427 (CVSS3: 9.8 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38427 *
> CVE-2023-38428 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38428 *
> vCVE-2023-38429 (CVSS3: 9.8 CRITICAL): linux-yocto https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2023-38429 *
> CVE-2023-38430 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38430 *
> CVE-2023-38431 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38431 *
> CVE-2023-38432 (CVSS3: 9.1 CRITICAL): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-38432 *

