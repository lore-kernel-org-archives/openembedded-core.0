Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web12.10712.1594885665553085258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 00:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KbaDKQEZ;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmldzUfSljKSA8vAQTFJ53QczqATOCuIdz+pOT+Ygn3Dz/jTI4ePFI26HTpZwyJq7cv34cx3C9lOtUdqv03YZpoq4HnW8IDaFI6nuNa8XfwvX86Nh7ta88MZ27TeVxf9c1psF7OkVYmy77qD1sYsqLFwEmsZqTgRDnSn+r3Kubc84u9VWVXFEFITxywBs3074psC9I4CyXHbvjhH/9Liu0gXhoBff2gE9SjmTCNXsZz6ghEkfZS/0Bw+rWq6SiywDcAGUeyKYOH0r1lF+hVThgbFFfIACBEmmT2kujvW9KjrGfBmQB1Xo3MdUv/q1IlO8tTyCm1toPU9SWY4bG2COQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXxeBQmVEG1L5w2AcYxD9b2TFFdaWp/c7HLHxqYiaWs=;
 b=f4a2GbCqwa/dSaruAoWihMXO0JILTMe475jhHw+8rT7H8PXR5kmUVn8U28eMv60Ak4wwNOsakBz8+TxZp6JAUKz2E+lmq1M42zXqwmRp1N9O8WHyYsutqJ/gPkUzn4BnnkmvqecgON9Ui2JnBiZa8HwR6mx6HPqSM4qoryQu7wIcXWgeP0rZZyPbqfBqKoqMM7ottiGYOViq/Kis3kOINQYXBHYK9cmtFXSYHEwvoKxFJXBbDURn6arKlE1hmEDLLrS7OK9+17kv+3+YGFGdNPl/Mo+Df/JBlVCTg1w1odc+FNTRUmsK6tBhlkSiJuHJisIupm7KvA5f4CS5uZ+R3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXxeBQmVEG1L5w2AcYxD9b2TFFdaWp/c7HLHxqYiaWs=;
 b=KbaDKQEZQADJAm5ra+4vyXSTbTICLn5z1uLKnXUtRyi4t+sy5hALaFLmJXlbveun7rfq2tYGosTb4i5gqZQqL5laAAac2w5HpwHbh66PFQv6oDOl1GEPt6jkasCbQtsOpFSWYeburm8zRlN/QOOQteimKisjF6p7dZmWiQ6jnn4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2558.namprd11.prod.outlook.com (2603:10b6:805:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 07:47:43 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 07:47:43 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
From: "Changqing Li" <changqing.li@windriver.com>
Subject: [RFC] Deterministic build problem
Message-ID: <142fdb0e-3fe5-de2f-44b3-ad8919dc2b1f@windriver.com>
Date: Thu, 16 Jul 2020 15:47:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: HK2PR02CA0172.apcprd02.prod.outlook.com
 (2603:1096:201:1f::32) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR02CA0172.apcprd02.prod.outlook.com (2603:1096:201:1f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 07:47:42 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 677fbed4-7e1b-43ad-33ec-08d8295c85a8
X-MS-TrafficTypeDiagnostic: SN6PR11MB2558:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2558D820F31A40D76FE6A6A5827F0@SN6PR11MB2558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pep7H1VfKpfD8haCO6vETEgulk3LWSt6GBm6zLyu/VM8qUwcbl0yW5WrS5ynJ8x06OmFDUIzPEHqW+7/878JrmBen82HbtAPF+s6M7fk4aDBxNzgVvCACVamE0sswpOpQt6vmyuL1ND97R009Zrm/bh0Y5t4hrxL5PiayFUz0LbQBP3pnALbGgNk8CefP43ZkR2pSnj9nvRNO94uB2ePJwnNQgDTimppuFGaApYt4dvk9mKyi9Ky7Xsrwyz0ShLuXcaKza/teqduYMDN5aDDth6XFHhVq4fRYj7mHlsCTJ6+ZKnHmgm8iEwF6rRIl9pxzvZhPXnmjdMuNC5kgqLJlnFq+I2xtq33KP4QS5Ozic0c4epNKmqnnCzQ8NLg4qdDVb+ibrKy6iJX6AtNcXG85OX6KtS6NpUhwsX8+0dnFWRbUgsdXyGMmWHI085kJaL3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(39850400004)(136003)(376002)(346002)(956004)(31686004)(4744005)(8676002)(86362001)(66556008)(478600001)(186003)(66476007)(66946007)(44832011)(6706004)(26005)(2616005)(8936002)(52116002)(5660300002)(316002)(16526019)(31696002)(6666004)(16576012)(36756003)(6486002)(2906002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rr3RegeqcoL9h0fW++dtj12MKBsdzMttET4noeYoY3gmfv+z32aHdJQsLC3FvZD2ZaT5vJ1K+yykOklo2gfY90Utd0knaqvHY4ZlJblySx0sqM6/YMlAkJXYUdDY9aInEc6RAJzVBNsZZREf9A036K42LyY9ztb9uc5GDxZli4ApICTO9E8Cg+i85cZIQF0i5YsJnkj+/2FBymlU8QXwdzc02Ny1iW7ANlPAX2zewJleenMZ+RKyKAY3VXJhp2QBFIE8R8whyB4MZBOx3WJnrKa5VAj3Yp0S3IUvnqBrUseTc3+NCfiBcL3KTR9bPXrdBn4iK8cg+lU2ZY539ozWRcmVoTqeE+GiNFJYQ75htUOaNrNesytCzrriY6A+KyNbrMB6fcBQLjzcRD/z5XmEzalymhNmUkXrrPR/YhP23W0xzrMX9ZnpOxYEBkDucaJbs/xJWdmCDYF8K6JWxjQkFSEA5LtINU+xP9nh6lddBQs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677fbed4-7e1b-43ad-33ec-08d8295c85a8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 07:47:43.0647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0j9l9SZNSXMhpuVtMRdmH6Q+E4rz0CoaKAnFTM+DgrC9jPJNNYy5GoVy4M44Nt0pMJaOrRsQEFoefs+G9oWVy/yQpdnp8JaecHKyub/odk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2558
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi,

There are several recipes have broken deterministic build problem.

wget/quilt/tmon/vim/vim-tiny

Here is how to reproduce it:

bitbake recipename

add "bb.note('test')" in do_fetch of base.bbclass

bitbake recipename


we can find for above recipes the installed files under ${WORKDIR}/image=20
is different

since the different configure between 2 times' build.=C2=A0 And the=20
differences always caused

by different NATIVE_SYSROOT,=C2=A0 the second time build will have more=20
native binaries installed

during the first time build,=C2=A0 and influence the second time's configur=
e=20
task.

eg:

wget:=C2=A0 do_package installed rpm-native

quilt:=C2=A0 do_patch installed quilt-native

vim:=C2=A0 do_package_write_rpm installeddd glib-2.0-native

tmon: do_install installed pkgconfig-native


I know we can fix per recipe by patch configure/Makefile or change=20
PACKAGECONFIG etc, but this

seems a common problem,=C2=A0 is it possible fix this in common framework?=
=20
Thanks.

