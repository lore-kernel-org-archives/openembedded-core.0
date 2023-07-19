Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD75CC0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:03:16 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.135])
 by mx.groups.io with SMTP id smtpd.web10.5219.1689796995731244393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=PmHk4fz1;
 spf=pass (domain: ni.com, ip: 40.107.93.135, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUd4VGrmJVo2wBmuht9h9yRE05SUPmpUch3iRkzfTiQO3lIbVh2E+6ZZ2cEnCK/20G0ojBgyq9NgzKlM1h1zK8Mz4aonqf1PDS53jqx0+EwQnsWyDKEU7tIBNQi4Yql9DxjBlpqFMH5cWXuIIHw0jYHGxiKva4pvda1FDH071VG8Idgcii0edLFotMymyh10Ty81WHT0odgRvb1XC/BtNRcIUraQ7Nmmc203mT0ViOs+W9zgJXhJornZYMYh1lR6Mx1jTzrmrWA9UKc2CmWUpE2GIvx1AkW6GAgEGrCBWkijvtts9Gr6Kh5d4SYC5+dCBDunwP8kSQnwhf7QDNgKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6Kkc0NEkbzdFXfsX626DzbEjqsw4/IyGHaXqQ/IuRo=;
 b=DnV9YOlKw5DGPpl2HZ65iN/XqJ8Jr6Fet8ioB2msTYL4rgCK/RUetMuu12DFZkhLb+jktketlkp3rtqsUmuYqYn8Z7Dus27qV/oqPJnHtfw5Mx/y0sGhSwumUZ52Y61X7bcxHgfonc+oz5+9KuQqi7smmojat61YbnHagySguWK9ef1EVpbick/X6B1amJv04FA+l7MIf/yxryO9qsFBF3MwLJUVfp+7qZPvtYh6S5pOzkm/E2HaGZz+uhvuQ/Nuivp1fmzTBFp1iEsVItUCXI9NgeookfCNn+QE7T/HZ4Silg9sLVl9yfVH/LhtgffSLuwxRsUat8Uber6cXp1gVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6Kkc0NEkbzdFXfsX626DzbEjqsw4/IyGHaXqQ/IuRo=;
 b=PmHk4fz1b4j9GArD4ajQE8HIF/Gwm57e1GTVieu+NHtXRq7YFCROm/UIkYAylnRzsoVfU12GhZ7ye0gle9TLo3Z75JTxef9OIscLB/LVyV4oUp3mhtZuQ0KtOQHAjeOsF7f78N18i/T5PGHrsiPDeIDyf+iCxnb7il5JsFU7usk=
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ0PR04MB7805.namprd04.prod.outlook.com (2603:10b6:a03:3ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 20:03:14 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada%5]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 20:03:14 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH 2/3] bitbake.conf: Add new DEPLOY_DIR_FEED
 variable.
Thread-Topic: [oe-core][RFC PATCH 2/3] bitbake.conf: Add new DEPLOY_DIR_FEED
 variable.
Thread-Index: Adm6fA0vj+tX8jG0dk2jzkFTaewTHw==
Date: Wed, 19 Jul 2023 20:03:14 +0000
Message-ID: <20230719200252.1203047-3-charlie.johnston@ni.com>
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
In-Reply-To: <20230719200252.1203047-1-charlie.johnston@ni.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN7PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:806:127::20) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
x-mailer: git-send-email 2.41.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4870:EE_|SJ0PR04MB7805:EE_
x-ms-office365-filtering-correlation-id: a9b01b4c-de57-4976-9797-08db88932fad
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ciUjZasHsv3uWzJ0VDzvhZw7u2ATQ3TGVIJrt8kTn/Ihf0uF5o+WYH1RgP2lxrTz6f9FjjDHRcRnjpEwC+tFP7Y8G/VAZiDIYsQmxuOhwrWUa34U68iC1oE0SNIKLl+g49ycGUiOpjC0eVygN9/EIbFiqkJQCICVvnuZEv72XXxZtE7pP6J1D12SpjKUYdVxVRc8NJWoJ0GijsuQtHk5w2RK6iUDdHEOWqHbb4+5fDNdp+5fILLIBoD7HRN9h/XPZVaivPemGZls1vuTd8xEaswioxp8L7SmSZGY7v8vjxBuRoBJnS91+BXpD9yh9OU9y+rizf99fC9MqNuc77sYHAyghqniiIYaVlqHOJ4V9JS8idnDCGj/kkWWf8Kboxug0t1V0eeUJ1H+bGYvTcp5cEYH0shkilQ8xMPWgOwofje4S1YN3Z/OxN8Z0yGmpwauDLd066UgMR1e/zeA7WrEWPfhQRXXUZl2NFpt8fzNpNT/8u8AOqVw7jNBYSgPH8lWDWj9impOJCiZ+WeR7+5QDmu9u3HYJ+gHg4cFXJKE7hxu1ywZ4cDv09JEi39NO04j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(4744005)(6506007)(1076003)(26005)(186003)(2906002)(6512007)(71200400001)(36756003)(6486002)(44832011)(38100700002)(122000001)(41300700001)(8936002)(8676002)(5660300002)(316002)(66946007)(64756008)(66446008)(66476007)(4326008)(6916009)(66556008)(2616005)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HXhVBS7I/G8ILTnwa0rzaWuZIAipqX3qdLpVkuLQRY02lK9DvLKfh1OtTq?=
 =?iso-8859-1?Q?vTTo6EULm2HtVxYi211ZhcGuEmngAd9UjdnRHZH/gtT8CBswQsFz5QLH8k?=
 =?iso-8859-1?Q?u5E00yeLsRFKVFKs2Dh2pbC639PzJSUcVRvw7kUnCdFTJor5fvyQ1N20Oj?=
 =?iso-8859-1?Q?nU1C7Y3bif4H6XWk1mWHdoTHHQO/lf448eEP2hPRsg9Ka2CqTD+kJzisb3?=
 =?iso-8859-1?Q?uMvaD/4qFLGz/ceEZoHrefrs/D5LND9OsXuwjvcie5NdxrynmtPsYKj1fL?=
 =?iso-8859-1?Q?4gaFeGjn9rj/GxNpE9UyUY95JbFPCvqQlOcfhs4ZxfrLyJO0smF3+cXs+Y?=
 =?iso-8859-1?Q?ZMRCYV9K+x+Hx33lZLtxVAdSUpMPPvXOV09Ylwaso1qY4VnN96jR4xbQDs?=
 =?iso-8859-1?Q?YZyRZC+y5BeiJBOb24DeNsZqSUkV2YeOBRgPlcKGQkW249nXg4h7CuceTj?=
 =?iso-8859-1?Q?P6BOW9R/5HN0WyjPOK1yAkNlsirytjvvurD5RjDfuNvoHwNOe8Ug7Zyy27?=
 =?iso-8859-1?Q?pqZQ3qDaM8fcxiKnOCPDM06o9IWqUTeBYr+mDEnSPFocZ9yZDIRTHuw1is?=
 =?iso-8859-1?Q?ZEMjFpC0yHb2oMNHEA6/QvSTWhjQNPM/K4vwQW0Ir5/K3XAZ19qzUzruuX?=
 =?iso-8859-1?Q?HdcX8jh7mecvPVNo9llpi2yvTCRhYIZpP4XXywJMNQXGLV/N5Xn2aS1xu1?=
 =?iso-8859-1?Q?6wly5xTqBbZwbPHFTM+36DgjZ5ijyDNttci/krjKKfeQnayxATQA54dki0?=
 =?iso-8859-1?Q?R2Z5PKV9OGwglefU6MiVealXP4Xnt2jdnCTLSiLVIjyqvzXrUzO+wdEJnS?=
 =?iso-8859-1?Q?Xi6dIVXFlSj/4QXaS++6ofAWTOUKq6a6cqVg3lAfK11SnJGYudy1CNQgnk?=
 =?iso-8859-1?Q?ovd5EL67WqXD9Kx1wZNn5A3cQERHlMIQhts86GNs0v98gAF6CmP/NXoQNI?=
 =?iso-8859-1?Q?20THNN5+4l1OK/YfcmtyP/E+iTOOdre6dvqQKTKsY7lBF778MwMrJXUXOE?=
 =?iso-8859-1?Q?sc0cuaJMm4TNtYRi+KXXeU5RqRphF51Kq4tSlPE6YpdMB+HbzX41A4PqEB?=
 =?iso-8859-1?Q?kmS8/USB99HfUk6ANTDfVr9VkB2WoyIl6zVlPNQA7bvwmFEROHWWWIIDOe?=
 =?iso-8859-1?Q?PeiYmUhevvYuIckzsNHryz1bxEnkTtzsBj02ZUA3Rd84hLSsqMdsPtNfvn?=
 =?iso-8859-1?Q?M2t4rGcCvFc9R8luCSKHqDBJXe7PiM3DxwXZnd0kkQttYh16umvsBJh9Ws?=
 =?iso-8859-1?Q?cIVdqHJmKY9Lbnn632XRpgYVU0qNEVGXxA9CUnMT3A42Qvbl8katCZs6qk?=
 =?iso-8859-1?Q?N2a13jw1V+/yKNxdAPzklXXJwkWmHOpOpFedaC/ND6Pi2j6PmAIM7+HrFq?=
 =?iso-8859-1?Q?nXaPvZdu6/C51f4GqNZ7pF6UQh0b8W4IsSTYKBLPnyFWksv+/rB5fMwlvu?=
 =?iso-8859-1?Q?XhiZT2Fowh+EDp15piJNm4AZ7vpB7jO0D4d0S+68aOmgEjGxe+jZ/cN8ed?=
 =?iso-8859-1?Q?FjshD2wLm35uoQH/McQwjuXh34cpq1/1zU9byJU76PGt+Hg04rJstC+rfg?=
 =?iso-8859-1?Q?99jKGsCk2IPFCs0lL7sKCGdvOp2mwYz9Ac3ASsFJenypiVFtk3FM8U0nfN?=
 =?iso-8859-1?Q?67tZLJ+RHQ/bzFqbMIsOtAhAIUrQHdl6qxtEb5APZdjc0+4AR6Q66PIg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b01b4c-de57-4976-9797-08db88932fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:03:14.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9/lyoxVq5lcKWGmvmV8ZRpSD3JQvg6DIEzdkrNdsAbyJFqKbk9kx/qSt9LCPIAh/VoV+6pzGB6GBHDxRwa0QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184603

This change adds a new variable that defines where
feeds should be created when building a packagefeed.

For now, the location is ${DEPLOY_DIR}/feeds

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8daaaad615..8c40937e62 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,7 @@ DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
+DEPLOY_DIR_FEED ?=3D "${DEPLOY_DIR}/feeds/"
=20
 PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
 PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
--=20
2.41.0


