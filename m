Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F499C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:45:37 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.135])
 by mx.groups.io with SMTP id smtpd.web10.15811.1707392730487834421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=oPBUnIg/;
 spf=pass (domain: infinera.com, ip: 40.107.244.135, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIuhU0e2jFGq5w92di/GQQ/KGJVQQ/XPB15AnCrXZv3kDrS5MFjjD55xKck3OLNqIjvKQ2EyaSHlrZO09i58pRjF/o8QYUO3RBFCA5wAmfYmsZG2E7AjC7/2RSy5DNJTNxDJxA2tzFff2VAcH4e1k3P58vwjCOc9iQWvWAeOjvLIGyxYVX+sZqQrAnlNU/EEx53g02joy/AZGnwOWfnhYUDM/aOXFars9TooKsk6th30TN96fRKOZbF9MESJw4Civ+mqm756PeZ3/tFMDRv6OP+0B7g8mLQGFW8hVI/Y9TLnD/cCsRyzyfzxZpQE92U/FYtSaov0E0MdLl/Xb2vcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o33RxTrvPoUEyZYCi1fK9GHI0PwThTPLcWqKGS3vles=;
 b=D7YUPlEUzDz5jlUvF40VJTyrPETERQBRzf8vVK1Sgf5j860N1/0Ly5RoXYv8xURnxKb1x6jxZsbdXtui3cE06R+YmHW0Uu3L/QiwsxPQzedDwpHh2DRYceFrpqg4RzxvC+fJ9rqX4nJwgCxAl0TkjVvekJWeMhaCuUevQeWDZ+hbWrntY9N8y6C2j/NcSAd0dnQxLJa5fbgiGPlc4ThTkm8TB/N/FuT3vt140s+gLfOgPeUqUZWXHVtltJsfiNvdt6ddsiQXGHmeXOfNfGOub8/UkDHQGc8JJ8PtuvCvAB8K7yXIt0iyZFPn8G3iDoEQzXtWT9add4QS7aQlNgsMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o33RxTrvPoUEyZYCi1fK9GHI0PwThTPLcWqKGS3vles=;
 b=oPBUnIg/wALNE2DBO4EKbaDs4DLbUfkFhGJWoSHUCrJXYzyBfE+eW3+aH8Xs488cTzJFjFYHxykazdluW3dVTQlUmhVIXlrNTLLMVhQB28BGXjl7jhCyf/qCchduCAKATnacxhQsNhpzfRskwmqx1NDNWGc7OQXWt7miPRz6mRKSbpsq5Rqe01C6cD7ErSbKfFV8RoVKQpLNlgNI6zVt/RAoZGUnrD4ERbT6R97ptyzDCUrHYRrPVO2U59JA6wTnUQWk3an50wZhgO9kvRwlq5/zzimceWyPS5xCM+vdyzphtMjv+kCfXdOR1B+AXuhlpnsKQ1WAlP+pqkfJySjTeQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH0PR10MB7482.namprd10.prod.outlook.com (2603:10b6:610:18b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 11:45:22 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 11:45:21 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Denys
 Dmytriyenko <denis@denix.org>
Subject: patch: grpc: point to the native protobuf compiler binary now fails
Thread-Topic: patch: grpc: point to the native protobuf compiler binary now
 fails
Thread-Index: AQHaWoPQtsKWVpjrA0q1H/dGQtb02g==
Date: Thu, 8 Feb 2024 11:45:21 +0000
Message-ID: 
 <PH0PR10MB461540FA7C12FFEA23710637F4442@PH0PR10MB4615.namprd10.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH0PR10MB7482:EE_
x-ms-office365-filtering-correlation-id: fcfd6082-d98e-409a-49e2-08dc289b6e77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2y4WuwRHyTBGNoCLJCWU46cDU76/+q04fnReTk14Aq1ssUTEkAwLFmYi+B4V8BtNrR8kPlTgd1ugswPUn0Y3sRrMhxOhygpPBX3Z1MhzjHaUQdU8osVeP3RKhxiCxOzteH2ZWYUAle33+iUr6ynvGjOFzQP9megOPDCZ7bajzjEeQrkU1Bc2yUXoCq61xJHfIzLtDz0lngWRYZcaNL/yPVMeJuDCe8cDw4THSirxeyA7gLlur5VWKM6f0Far0hUSPZ5fwqYRFgxxEg0RiSAnkFsqsd8CtdDp3d0rLWHbpeTyFOVQPs4xdCeP8fnncQRoIlFikKI13rr6+rw1lz1xroJPmGw5emOVTdIJS90jtEqhtxdaktak0c1ehWoiWx4eHEwkkFrayp7v/K3/IP4NuP53DIEmPWw5pgbTRHohn39hpQ1Bk3l6MtFVE7+h7/0P5dn7n41ckjFit6PfDrfmWJkzv6q5IgWc9BZtGrr6VUuviXhil5AzweCX6XieL+NqS5lABn0SyyHLOZygk38uvsVzp56s2eFin2i8lHfH2bMWxQy9twt7Cycxbb70x7abu03liCX+NSPAsbDtcM6yWP1pXqAo5ce08gbiWquWSjP91G9mp/+hrRmDBq7JK3eu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(122000001)(33656002)(38100700002)(86362001)(71200400001)(110136005)(316002)(91956017)(6506007)(7696005)(9686003)(4744005)(478600001)(2906002)(5660300002)(64756008)(76116006)(66476007)(66556008)(66446008)(66946007)(8936002)(8676002)(52536014)(26005)(83380400001)(41300700001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?M4fUn+RvB5ydMoVorpa5/vqYe+HQg13lYGHDMFjj/WSoQN7ajeNa4vvDU0?=
 =?iso-8859-1?Q?0Zhv+YkM2P4K/JtDD6QOVj3/VAmdROnb0boS6wBdBLk///89JrwnN1HZdU?=
 =?iso-8859-1?Q?AJmfcJw1jHaNT9U8iTwqcRJTIazdFrXeuSek2bbo5Ug4IaA3gu36tdMC7A?=
 =?iso-8859-1?Q?fwwDLyyv35ho4dYmXfGjWa8Bp5+gUH4xM3pnhEcQUC1vz+H7iPM8ml0RVj?=
 =?iso-8859-1?Q?PDw1Ms6PdTAy0Z0tiGzAFfuef8ykCkg8EG+lBJXopEhfEhkOvjegDnNROK?=
 =?iso-8859-1?Q?8sBapX9GRokkD05KBQiA/aFQq9Q3qMQIV3CUhUWpZdzvHhaEHCeskWU7Pj?=
 =?iso-8859-1?Q?RiKpNm1jkfwC16C5+IyPKMd425GEw2tMvbYBaei6EtZevF0whcsnjVqi/B?=
 =?iso-8859-1?Q?YHxRhXIuFKB4Y/n7HJqChHr3HOIn2rwdLdqi0EKCVj3772vo9DIOF7SWFq?=
 =?iso-8859-1?Q?qg5Wvdx/AcvW/wEh/p7vTpITX+WGle9q0FEtX5wWDnVDCoyT6cp9vx01A0?=
 =?iso-8859-1?Q?3l3CIrihXWktHN3zVloM2Rd6+9MK2/TW6OK0ptNgwqXuYaNj0Z+kpWgnqJ?=
 =?iso-8859-1?Q?VP3IMtoKU94mQEvH3xuDz3o5jCDlA6ZWcANNd8rL/xML779hmaOiChDXRE?=
 =?iso-8859-1?Q?imCiw9B9wU6ndn5rz0iaI474i5bryydec6H8Qy72uviA2QsH9jMNqROo+Q?=
 =?iso-8859-1?Q?mC9xVQ1ImwzNjChgG3Y8EgwBNoDkFdInKFZRPUK/PCGc1KEh9ujBYL7ZTi?=
 =?iso-8859-1?Q?ApduM5fDwpT60XFLKi2FJBWPueK6gAoV/HpTV8XJW6Mm6eV7iWcafadY8C?=
 =?iso-8859-1?Q?4P+q0TF2utdQ1/4RYJn0pzcnZUBohiLjrUBnalvZwOGUJ1CqhuM2FU3qpR?=
 =?iso-8859-1?Q?rbWP6Whnbf4No+xiRFeLAd2gRdr0cjXPgJDeWXwuHIl9ukRXZ4FbQZ9Ne8?=
 =?iso-8859-1?Q?YfK5k8SbdCo6ibWcMpQlpJXxkxSC86Yk5e5N+Ock744vyF0/JVxiTA5XHe?=
 =?iso-8859-1?Q?0k8KjzNghBd7OEDdAj2SdsPBM3iyQ8zUbmkwB/ritthgG75vXOhtRPi5Sw?=
 =?iso-8859-1?Q?bEXINCiBL3Irhlj7Q/Ih7h4o5E7iNKtDQUtZ/UeVgpykJdP+nMhatduX3w?=
 =?iso-8859-1?Q?RwyvWufGEuQK9Y5cqQQTW+FSS7RhhSMJze2tDc0k2kkIsDGqY18LXe4MnZ?=
 =?iso-8859-1?Q?u94z2SkkFhZX3qQ+hVEFPYd1dujX5YmnF+/lxsO16TUPmz74ukD8kBXqow?=
 =?iso-8859-1?Q?IrUryyqSOUCZ5RZ56R+prBRsBo33iBrYhDwvBdtoXjfWzzUuOM67KTXufE?=
 =?iso-8859-1?Q?vTjRIfdEj+XHw+rqgPUiKJ62bivpZPySHdMNqDZtnre+ZVr2Y1Ka7SCd3N?=
 =?iso-8859-1?Q?BMvrq23qlH4eaNzKsWP5mBZn+ClzyQTYV4nkJFHmcY7D9EeRfFzlHv3EOz?=
 =?iso-8859-1?Q?eUmHQjCx6qqvQpFiYkLTM30r4LlQLEZQ0vTVz665RIoKIJPf3MuaE1kVNv?=
 =?iso-8859-1?Q?Qu0qvGpYwWSs5TEGBcZk2ce3XVV6Vj/q+865f9pmfBYhfSqzF/N+KUrG0b?=
 =?iso-8859-1?Q?blZ/LTb3/Imjz2zU/6fjqHADNAREu+F1lRIqkhlD2P2kYzlb71EiGbJWjH?=
 =?iso-8859-1?Q?KAJz3st7eWN9hyf+O2MpUm8IuKU8ySIyrs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfd6082-d98e-409a-49e2-08dc289b6e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 11:45:21.7528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0keKQ05Aaa153rkOQDOwdNmHGPNZO9aA9c/6YxoLgUVZHDY8eSyAjXitRX1Kv5RsEAAoiFAPSrxrHDx+Xk1YpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195139

The patch now fail to build sdk for grpc_1.56.2.bb for me.=0A=
Removing this line makes it build.=0A=
Please advise=0A=
=0A=
   Joakim=0A=
=0A=
commit 54885a5af2da26d7c84f8aff6fc845c2681b2890=0A=
Author: Denys Dmytriyenko <denis@denix.org>=0A=
Date:   Fri Jun 9 04:37:15 2023=0A=
=0A=
    grpc: point to the native protobuf compiler binary=0A=
    =0A=
    Latest version of grpc fails to build nativesdk variant since it finds=
=0A=
    and tries to execute protoc binary from nativesdk-protobuf instead of=
=0A=
    protobuf-native. Shortcut the detection logic by pointing to the correc=
t=0A=
    version of protoc binary in native sysroot.=0A=
    =0A=
    Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>=0A=
    Signed-off-by: Denys Dmytriyenko <denis@denix.org>=0A=
    Signed-off-by: Khem Raj <raj.khem@gmail.com>=0A=

