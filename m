Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346E2C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:09:07 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.133])
 by mx.groups.io with SMTP id smtpd.web10.14420.1707491344010201817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=kjmntWtp;
 spf=pass (domain: infinera.com, ip: 40.107.94.133, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFGQy/h7uAvbGbJjKfWkOi7SKTiv2VNVHJZnTMsuUdrvQv1coZCE7v77oDyZZeSQtFIZokWGkZ6Pjdd5ijJJIwouw6yet919k1FwVl4e6CgwjGR/kppV4yNlAmyLdGWilPjOdEgCefh6mKJRUfoidPxWbVhB3w7+llh3lqX1cmi7G3PzEjn7M2uDp9zGXpeW2V1WY7nBK8Uh9zJFdAGVUGCjeULIDGaSBJeDRvMHMIFx5GnR6KrrE/w6RfK7iXbNkksIIWt7Wboza5MFFK9HUumcaFl2TX2LaPP6juUZPcpTOpyKgqMMWNdfGcM++0LnPzuod/QW1PNAC1eQhgLXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f0QFeuTiXyXAZIB7fryMSG8bidKTDBMizYttlCYtyE=;
 b=M6sKmkm5DfWQwD+tMWdqgqyrQsZu5DgyGw/96dc1+ZWDIA6UjGibKsCP/E4wcoYMQHs7AFga7lD0i5BCXI0XDC2hH8dY0HTOFXLsGaBfKcSlK90JxBaAnYQQfm20gcwxjjnj7+VvQeiBFogxgQiEone/j1IU1b4VQvrFXfo4xszovtZNVaUZ/RHgdTTXxXlnBkQYm775QeLHdW2LDNFeiyGXBHchEQqNAbRU3lJ0rJXXHFPzqjdLabCI/o8wn8rARg6sEfFvEHujOKn9iQDul4y5/Qs/0vCFFxEAFGULYIcyh7Sxc+WPfYQt2Tzuz+sxb0SJeLc28UHYse4QkXwd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0QFeuTiXyXAZIB7fryMSG8bidKTDBMizYttlCYtyE=;
 b=kjmntWtpQ0Tjc1wc9DtGK4HQRwRD1gNCkFlwb2fvBy/ISGSHyUQ7iSYRxwyJ8UObx2JuFds8EcGxw4OQBS7NEQ7WsMuz9KbsxRJ5AqUTaavB7Ml32sZ6m+5d4JY2TBtgglQSxBFWKlSb+K14PDGAezErDZQoKitZmJ7bPdEaaNKAyHTY2hQ7fzzDsJJ1NRd7jCTVHFN22+f1F7cf/6GBaqMFiu77qBeABB/jCZF+CIgfiYqyIonY0Jw3JmAwgIbQvtNEKo2w//2wXDdIQ0hwpbGTOOmdZ25/9XWU5NWdGOyU8Q6OanbK6K/FviMq7v1Hx0Xdh6wcHpH1zGa+jMns2g==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 15:09:01 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7249.038; Fri, 9 Feb 2024
 15:09:01 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: nanbield: grpc_1.56.2 fails nativesdk build
Thread-Topic: nanbield: grpc_1.56.2 fails nativesdk build
Thread-Index: AQHaW2H7nw8tDhqAGESfJbXCj/WL3A==
Date: Fri, 9 Feb 2024 15:09:01 +0000
Message-ID: 
 <PH0PR10MB4615E510D41E24701BFDED30F44B2@PH0PR10MB4615.namprd10.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|SJ2PR10MB7059:EE_
x-ms-office365-filtering-correlation-id: 44b9a48b-5772-48a1-fc68-08dc29810c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 29jGc/vdQ70kYC6yTfPzI1/SwobosZ47tOAjGCK9CqMwK3Dm/6p5xM74MKI09ZQYSo889K56YPlNPGXxXiwPe57GyetLS++vLDcohO+LaMgnRNIQfbw4wOWQqGVOmb362txFIVala3CSNnDriXkQSbqPuf1dF5u+vLwjJk8kW4ti0yql3tXJezeWGYPBV9VfBgPN+d32wZDx0GK7pggnPQorNumwOlPq6wor0EgLGPFOMbHgRDHAhBetKWdRjzXIeO7Ld37/mxxADND4v0GxiomjXyNtBRs/C/0oFA6S7oRK+S20loefx90RBdifQe3mGaArA+hyAvp+aFwsjujRC5lSaHhiF6mWBO+LMZhyzoJzZMFE9eEZ3QpKBEilrZznVhNqzDnvd/8HVsQ8vHjq/LqQaoxv5q3WByFADfScPRk1QSb9ztnVpg0K/dSrwRcIgUKQGSTfZt2J/DjH033As8haokfO1m2nTNFyw/4ZUprX0pNzO1PE31USeOVjkYCzLu+kQb2rxYgm4aMiI/MmskfuHMEmkQtfQxaY8y7zMlOR6j9ON8KTEH3HFuN2E3lsUpwV3LSHk9sYiuUAObzV7CoaZmsyxKjP6MXhb+pWfk2P3Lbq5D/Gb4A7rjNde73X
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(122000001)(38100700002)(86362001)(55016003)(2906002)(5660300002)(9686003)(478600001)(6506007)(7696005)(26005)(41300700001)(83380400001)(38070700009)(33656002)(6916009)(8676002)(8936002)(52536014)(91956017)(316002)(64756008)(66446008)(71200400001)(66946007)(76116006)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?m/Lh/R1N1JVLiI9sCzjE5S8QdAjNMdqdlsBpiqfpbwLwyiaLfrBBwZW/lS?=
 =?iso-8859-1?Q?ctSAr+t/zWsURow93erdMHW2ublv1HDmUM0kfEaAIlVlRpq+bkVp+PaWQ5?=
 =?iso-8859-1?Q?f0XfXSQwnxt9sKJ80yg4WD2sKfW0KCev+AyHZfA5squK6BzM8f0wjRnRgD?=
 =?iso-8859-1?Q?lfJlPlc1VgbLpuHDST+y6Vxs4/yBXKbwn6I48DJE8Sy/vFaU9ziMZSgpWI?=
 =?iso-8859-1?Q?f4xWKWOT+aUb4aRMvEFot2o3ISLGQ8s9AHWqIOV628nwYGhAerbDKBg018?=
 =?iso-8859-1?Q?EJTYSjgo0yE37rj9/7OsFvYwb1nazj76cGwj1hdnLnqBPPE/4GQ6bmGlpp?=
 =?iso-8859-1?Q?lNgdi833lqCUKBVkJNRKOKK3Ac33qifhSdag7u5N2VQ7yHr2/sVZpstzfN?=
 =?iso-8859-1?Q?uDS4uN2wngbx5AI/OUPe4hmlkmlXlh2RTdNn5b1sHAUeKQhS97dsquKR4h?=
 =?iso-8859-1?Q?kHQf1o2+iRYkGRK54FwwCTylwjB4fpealyioPS6IRusfRDtsb79J2mlWu7?=
 =?iso-8859-1?Q?uir0YqfV149YpIt0Uecn7OHY9NU8M9afkdICTSOY4bwFtgKR1a9uOhMGId?=
 =?iso-8859-1?Q?KbAIMSHmcN7ry6XffvAiBuwyLEnt8qULhHdNHjvQAxQritPyUepvoeQBFD?=
 =?iso-8859-1?Q?bx8S/D5NpqVh9s1uG9IOVUIlcQ8SKvB6lVPQf51i14HKcxlUbLIMEoXHyu?=
 =?iso-8859-1?Q?cagbz2DKUZOBOjtvK/Isl4+Qb1Ir5EhWSx59NPJqG8Gz1w+wvYf9vDxPRd?=
 =?iso-8859-1?Q?DWOfDZlEP+Ipg1LVuDAqM0baMRNkMqcfO98yfUGe0ri+r6E9ZUD2JnZyre?=
 =?iso-8859-1?Q?i+b7fbppbFdEFKUlxsm4RUEjMAAZNd2s43LTL05ajQcW//N6xEyfmiFDvR?=
 =?iso-8859-1?Q?2/ZxdRPa1cG5oSXkZWSsHBRQYS4acI/+V/bgSpir7WHug+4TFqtqaJ5H+k?=
 =?iso-8859-1?Q?+LKpwATBIQUNCpjcoVabQMw+IBz6fQfY/J6600F1guqQpX3N3TYyclkIsR?=
 =?iso-8859-1?Q?vWQ/GXK8jGVyXe7k41zZne3Q1UKezYhCYz4/UAhVMsFouatUuKQ8+G5jKd?=
 =?iso-8859-1?Q?wP8OjxVaaUs/vj6qce4CtrlYKtMbDkNzoXDXDpm5Ui1JCy3W/jqWvGNFws?=
 =?iso-8859-1?Q?R4O+1Vl1KZTmdSAQpVAutt9qYhATTv3hduZgARQS99eKmDwkRWh7kriwyc?=
 =?iso-8859-1?Q?wH1v4vaHQmi+C/aTVWQTiocHMAvHO+cIZ2Mz8NVNp+pKjZELLqKYHiy+Xs?=
 =?iso-8859-1?Q?gjfpVC04umd+qVvF6Ky3KjBVV87T/DVFw4mfndEhI0tuq2g85b5x+VipDg?=
 =?iso-8859-1?Q?0TrMiKv+Ztv5J18GXX8U7ql8ybbG4Mamg4r3Rea8qOkUClATFlgASHqApe?=
 =?iso-8859-1?Q?w3hS043JsE3yFf6rcdJkLORDY19w5CblFg4qupyUDglVfB4uEdbnZXfwIo?=
 =?iso-8859-1?Q?UScWOSqdI91akoGuJDqZ7jcqA7p3+nkUDWiwzEeN1Hf12BJB8oWPRS9snU?=
 =?iso-8859-1?Q?8xifrgAta5djlp2iiPgLs74JGXS4Wt1ddExBr50d0fUF7jsmow75QZPCQo?=
 =?iso-8859-1?Q?CTTd50spyxTZF5N93Qbwzyqw36psGV5n0PhdhUB7NDRM+FKbo+eZAlAfAP?=
 =?iso-8859-1?Q?uq4F0w+bf3IQXW3Lrkb8FxK952FxA38P9R?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b9a48b-5772-48a1-fc68-08dc29810c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 15:09:01.2290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELaZYQlqBBPiVpdY7lHn9+QQSmqX9fpFo5Xc3JWtfAB9Zn1xqfAvwl9X0V4olG1Cjfe/a5LTDlOqRADKXg3SAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195226

Whatever I try I always get:=0A=
|   The imported target "protobuf::protoc" references the file=0A=
| =0A=
|      "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-x=
rsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x8=
6_64-xrsdk-linux/usr/bin/protoc-23.4.0"=0A=
| =0A=
|   but this file does not exist.  Possible reasons include:=0A=
| =0A=
|   * The file was deleted, renamed, or moved to another location.=0A=
| =0A=
|   * An install or uninstall procedure did not complete successfully.=0A=
| =0A=
|   * The installation package was faulty and contained=0A=
| =0A=
|      "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-x=
rsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x8=
6_64-xrsdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"=0A=
| =0A=
|   but not all the files it references.=0A=
=0A=
Looking at failing path:=0A=
s /home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-l=
inux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-x=
rsdk-linux/usr/=0A=
./  ../  include/  lib/  share/=0A=
=0A=
There in no bin dir at all. In lib there are lots of libs, including libpro=
tobuf-c.so=0A=
To me it feels like bitbake somehow failed to install  required bin/protoc-=
23.4.0 files=0A=
but misses the bin files as these are normally not needed when building.=0A=
=0A=
or perhaps it is rewriting  the passed path? What is passed to cmake is:=0A=
"/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-li=
nux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc"=0A=
=0A=
but bitbake somehow rewrite this to:=0A=
=0A=
"/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-li=
nux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xr=
sdk-linux/usr/bin/protoc-23.4.0"=0A=
=0A=
Notice the change to "recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-=
linux/" in the middle.=0A=
=0A=
 Joakim=

