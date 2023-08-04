Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B571FC41513
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=JUGdDYut;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITbNoS9KU752Mv4tOE7oUzGZS0YPSrSVf4EKvMDkejvUoNGoJp+eB0dXeHR9Y4LsHQHFRgUPU3kpRy/z8jDnSn9/xllzmkoj17PEGvXPQNwgOBB3HvAJ1FDoSNDCKYLjBiNqUMkrah1dpUuN4ZFKntV9Kq3g51IV9aqpsWi2CH7O5+1PuT0gwJGnExjpZuxm4l3JLQ0WanqBBkRoO42TAB+Jkd/bMUvz2CgL1zx8UVAY19jOgwSM+CrLnZUZEg6i5YJJMHEaeuXITmY1f9Uqj/H2fNHeY+bF03rbclwv4BYojFSe+JGqXNyIfjPF5RvCIBvrbIrNARgAXzPfz415bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=NrNnDDjT9m9Mb/3zaXvHUSFe+pynXUjqvdaBVC6i7qbegJ1BthHHLDPv1U7cWC+5lNUYkspksL1cQPqeEiYQSIYHRhNBimQRjWR9i2nk+glL0b59CdNSx3f2CGfYHSnUwptf5bIPSh1FQsJw/cwEQK6ZYGSKVCm3L+xQnyxvo1zfXwnEgWVOheddid5hZ9dhnGFJxZIB59GFerdwKKTnvmYWe6rO8+YB2DQPz/09UUWNA1uybmbB+u3/oBH6L1BC4TdrzO13EKu5h2g90RWtaYVrFedmxcJFDGuw4VDPgwsgfFb4efhDWo1T35lBcB+YcIH15tbcsMPOqC1Zvf6ZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=JUGdDYutoL/Q5NSh2k8I1NUCbEwjMhFa30FP041UxhzuFOm9zlS9e3VmKYGMijTzS04v1ygNbO+noDsDOXxw2Zi2mWUbyJfCdPLdIZN/Rz5dIGSRWOasgU3qt5hozlDWKd7icvYYjaiOsO+vKsCac8rOWZPN3YkYn/pzvVn9V74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:08 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:08 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 2/7] package_ipk.bbclass: add support for ACLs and xattr
Date: Fri,  4 Aug 2023 10:43:10 +0200
Message-ID: <20230804084315.55768-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: abaa7b55-ff6e-45c7-9864-08db94c71b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SCRnhEd8I+nay7W9RmFZpou+RrVs5OH/BvJ7vTJcnnXQLmy6IlhSMywftTXLLS9nYEwJvRqHq7uoKMQ64ZmkBu2wbPB/N8keXxFFF9SksHEkfmmnGl0ESpMsM6TdMY8SqPa6d3/zfJ3yCf3H0G7H4oJLpiExXd7KjqAsEOfrMSqpjATOiFhO+GTJuFmb9wtOQNkQgUM66gJg/HvotLDRXv50RcjvBIfnpcjyUQC+J5ebt+av7ng+lRro6O6Hag2OsJBev+lMEfE9qOHGQp7kaHPE05me2MiIWaUD3PswoGGC14kCYjQ4Ov20KIwAGjL3uOAL0P4cZZFZ2l6wRB/VCNhfwKRJQFloepZ1QDJg9NkfO/3eEUQDQVDuWCYsvnjoXO8CjKXZzmFcxTvRjKRaWOkJ7fz4UVmEgGMGfMJJzP/RZ30J6Hj0zQZHV00zTN6nCMC4cYyG+rRsh1uoFxYVSfZYDg2UgX7Uerw85w89zmY7WC/kAMECfs4yww8eo9hWh04PM/zT7GmtaHcneh5dJWQn+rvCwSFSq42V196qRqIUto89b6MQt/lJQirXzRpmBfKIaPrgQ+hqDc3xESdIXaPY0DqZbjYOFQf5aRgCSiM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(966005)(6486002)(6666004)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T670UaVWYGHH167c7RgEu843sNPHRHrpBbGUoNAoO7vfjkugPpnEWgg+tPkY?=
 =?us-ascii?Q?UsqIYFqaBowUVG8RfbLdX4N4idCmMFNdMOX9WBx6Zs9QywpGD9NzZdX7fLc7?=
 =?us-ascii?Q?VqROhXOyynsZXnBMwnspv/IgVVDefsXFGJyD6p8LTu/q008IsHesSuHJQ+GS?=
 =?us-ascii?Q?erIlavcXkGrfseLMlsJxvUs2SV3MFdzQQiB1vVNhEbZqkrh9VlLZEPJH6zPG?=
 =?us-ascii?Q?I33X9FZlDDx7HYfpuqTg6XgsO/eMk86/BjcslD6Ci4jgq6WNblOCMjzrPFAg?=
 =?us-ascii?Q?7McYkQ0W3w6iF3radRe7t0FCZMEtuk870TLiipIFrE0d4Wy+3dkzQCzULV/Q?=
 =?us-ascii?Q?DKPxhXQM5/RMeAhVr8dgZgHZf2k5uzClqzcWd2ObFYv80ruQNsjSNcjIsNXp?=
 =?us-ascii?Q?9tsOn1Gpxc6BulhSFsDKy5h79Z4JCS9yQaslWZrLaeUzhxocon3YwW4ktN1t?=
 =?us-ascii?Q?q8d3kWPh/OIur6lKhU+P72pey38mQ7IhfW2fHpbdB8NBkC2mooh/aWNwVUVF?=
 =?us-ascii?Q?iXgoXli5axPuwO+qklBv67fv6Gi/R+gdfGx5Cqctmr7VSYsK4N+EsIY54Aqo?=
 =?us-ascii?Q?LkZ3Udp27bIYAA1ChcZGscKrhzTwGJ4yhXrA28Hr5WEaPO3ImcoACSaYk6zU?=
 =?us-ascii?Q?cAmfEhz5fj3ggKKcGjnX91lpJFXuRrQobsTsobrssyB6rP4V1Ngvq6pBODya?=
 =?us-ascii?Q?pHZin0Qdni1Hp1EWpgZZgPAVxYeheXgk29CBL+KHaRQNy20l0Zq5tpvECc5R?=
 =?us-ascii?Q?YiKrf4mi6db3FEav9K6Jch+i9eQxvcb9vZOsvUXIjmb6rp/MZ0Rj0V0Q5CAa?=
 =?us-ascii?Q?feiGNc300dHiPtyupjKkbby3apzdoNG8e2VhqrzhJYlEHZmk0ddUMlqvlK2/?=
 =?us-ascii?Q?Tn3vMA7m9xKckhuS3WTD2KOySoe+cIzlASBDrXK3cPBGSiEahlET6u+FFwIL?=
 =?us-ascii?Q?B7OUYO7ki+/9uuvt7MDj65OmUZHKcUcgWRyyBJoPOACsRroy821VbT+4pjDP?=
 =?us-ascii?Q?s2rCj+Q328HVssF4GHN8PvTgyT4nDbbjbTFsrrG/LTNV+W7eBRu476vugNpf?=
 =?us-ascii?Q?e55HCiK3puiBzIYssI0ajMVTvfUydqovQbu/5VcuGLh2vHdO8rhgaOR6BWRc?=
 =?us-ascii?Q?Y+zG28+VpvDdTO3PQ1O5XT3v8gH/Ruvd3oEQQMq7LmAP/gEGLFPJA0R+qryR?=
 =?us-ascii?Q?IGM5Cfgp+joT65yKEqz0NEd27wC4k159JwRZGSYNUMzBVKM5cbUi80IGoFZQ?=
 =?us-ascii?Q?WLIDVasw0u2GbTOLBHjyD2fwah4HYbkoQ49lVnrPsypc79cFuI4ha8lYlmsv?=
 =?us-ascii?Q?7liLAw3fQAJPpL/BH4qgFdwFnmSwuhKCNOiTV7Kt1IMxl9cmD1ksW+bMrGId?=
 =?us-ascii?Q?pG88PlwqO1b6g+wkwogGcT+5fWwtxcBM9JPOuHP4iCfTPiSKJEZQ4zuRLCxl?=
 =?us-ascii?Q?cIsbqoFkCj8gybjWNVJDdbIfMfJHLS3/NTA9RL+q3S5owFRuC679GLTvPncr?=
 =?us-ascii?Q?c9WXjt11LNa3Qkd45dw9Oz0661KFMql/YEMn5eXhlWQeT0mOfj4e7H0n2NAX?=
 =?us-ascii?Q?rj46bFDHUXek0znKMnK/3ZMbWWeU3rl8agN/C6c+?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abaa7b55-ff6e-45c7-9864-08db94c71b7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:08.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFqTuyVjInxO1WjbwOKJBFNUTnEetlR6+N7kbzR+EPHAvDuzztqfwYSX0Y9fSiXuEmOTfjrCzqiuIkvR8jmY/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185511

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


