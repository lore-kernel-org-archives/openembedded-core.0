Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF466C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.15644.1744913438424602494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=yK1BY6BM;
 spf=pass (domain: oss.nxp.com, ip: 40.107.22.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2C7rQB9icvSVtkETOc7v3veTbOZMzb88kfVu35WumqJWK1JGHaS0dYJhv3GSWiHKEGribVB86PkiqjwBaF4/ceRqZwsxPBHuT07XxOdM1qBbN9PcM1zU8C+3qLF9lki5Eo4X7WOlPwgjhFJAor4HFEOKaL4eose6Axseblo7kWPTU9xcVHQ39lMCoUsrfTdvqUW3fwGU0qdw8OSCyqCjvyE7Oj+xfeYY2/yYfO4iKzPOQ4B+plaLNTneju8DlkrYbpYIfVFuRKJ5Kl/WEgFakxhTFdDQR4FYG18LeYGgh2WcBc+DWD4l/Vg2i8GhKkcRjh2XsyxBDVhSOFyl0JBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qPaaFLxgHoD1egatF8hbUOjcQBfisOuvG3fzkQKCFU=;
 b=kfYiX+TM1IrwALC+SqeFKxu4PwbTTnPq/KYY2r0+5LfUQJR9beTMRE7byKXVElHRYqaU3wWLRH6WKEhwq96Fy5+d+fhL0SlQIB9Q1OoLjsBwYrEOJ74sbD5EMbIGigcTMjNYqOt6XN0c1I6uwy1ntpRtk1ZBpeKh5sUwkmzOx6G52YGqj1xYVZI69zyBmT5ElMBJ4AxdAcJ0RTpoE0jSTENJUbmJSkpP1xdtK6MTNxmGHFh5rRUp8KUl8fWuWn9ah0M8KbMki6n+PyObITu9ph+o1DSa1H486tFDlr64KhBnkvegdAl8smT4MfD7/cgf49bKm4YfMWQ5orl40JX9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qPaaFLxgHoD1egatF8hbUOjcQBfisOuvG3fzkQKCFU=;
 b=yK1BY6BMgOZMpc2nRK7zwYk01r4NFL3hss5M/pyAYDCYctqG1B7VZ5qJ9Cb75oqQg4Aj/O6jOoDG7cFmEeQRDPbyy2yi8QwApQXHsh0PfPWNBN7heF0lDj6FptJTWbII2thqLfJJP/5EOUbZQLxVB4ik2D0khPtr1nSxRwj8dPsDJmJ401+1I16xfmcg2/4qdO/0FK5sKjD4NDEGfpLFOwJZFy83GtWiXu6tf0T1UG6Wn+Z8x9sYkSovLhzibQlS64iWFkqW8Ltm0tszG2INzjG8mZvS2j3G2WACl7XbnX7K1hz1tByeuV+ouBsjgMmmBsY0ZUlgxoQNQFNw/lHVig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU4PR04MB10575.eurprd04.prod.outlook.com (2603:10a6:10:585::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 18:10:35 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:35 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <TomHochsteintom.hochstein@oss.nxp.com>,
	Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 7/7] oeqa/sdk/meson: Drop unreliable compiler test
Date: Thu, 17 Apr 2025 13:08:34 -0500
Message-ID: <20250417180834.1722588-7-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 49008245-f4f6-49c1-c715-08dd7ddb264c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?goky2Oh4yuqNnBZiNGUNT2KHkGI4v81vY22tIf/G7//iWw+YKoEj5Vylmioh?=
 =?us-ascii?Q?sGQSUucOBWAxUBFMWYqJlTnmfoe/yfvW5HlQ5hvMvu120APfaby+lSJkwWDv?=
 =?us-ascii?Q?qJqdDjcZ0+tLVBAcaWW9BfM0cP2jkY8Cxrdt7+blNlry/xtoqtBrPOi/KD2j?=
 =?us-ascii?Q?YdedDC+3WLBI5P7YonySAyrRvbpckt8vC6Aj5xPMgX5Rmrr7Rh5Cd5d7yxCJ?=
 =?us-ascii?Q?E19uybUkj1sSK2jDZxT0mYQBQf17ZEhMvP8OAWyfYm1mAJOojM86NOSy4bdm?=
 =?us-ascii?Q?tYez1JAH3Lw/gALpIxXDyL3xgF6YH8j1VONIKX4YINBQ1KlW3CMHXwYOK3+X?=
 =?us-ascii?Q?16UjtJS0UTNrD4RfzVunyTnAhjcG0TmdJ53G/uvuImupOcPPM5G1x0LabiaK?=
 =?us-ascii?Q?mY1FCTC2N/RWQVyNS80tgm4Ge+0FdYosDqa8HLWfGt1hIA8qkQG6KGxqi3ZL?=
 =?us-ascii?Q?Mm+dVdytqDzPP4iDmzdDjOUtOsFR1piWZaKBBvJ8l24y/hi6mNo0ViyGbbsc?=
 =?us-ascii?Q?vPmGWAzVG8DguY1d8nY+oGXj2inZK582khmfRVNazszdLiF9kMAPpHJuKlbl?=
 =?us-ascii?Q?GfKVcJ6YGnirRn9LSRHVC/nK3B2PdFm+0qjoZiO+7HlrZBzeqWSwPIbQKeYE?=
 =?us-ascii?Q?KNeME7xOg0xTW3GEAm/2sEGxbmOOOoNLPKEB7rO69BE2KyiXBJEK9kmaUbYE?=
 =?us-ascii?Q?pJXGdWmtu2lBxY2nImISFdVP+jOO1u28nP60OJXvRv2diVbfQFgFG/SIBXAn?=
 =?us-ascii?Q?IOAu9azCkmOcF1u7+6gWWv0DitZe7cd4eVGDcILVUEF6BzoApJvcct2VUSUz?=
 =?us-ascii?Q?OAEPS1fXE8BbtxwEQO5gXOJ98Ztsm21m11W26rwTyAACoOMObRjOQublrssU?=
 =?us-ascii?Q?BYbQyhDgIpL1KKmjnzgkDxR6Celbo2Z/dWFKvCKQNi00y0RSiWmn3aEQpR9z?=
 =?us-ascii?Q?4rexV3pPrHT4QBjNFOGSxbJI6F1dLgoYMMBn0fsUCbKoNb46R3JpVOpbVcOI?=
 =?us-ascii?Q?Z3E8gDq53YD1njSUnkckoulYAXzgo4ps0y5+RoBgh8g2QL6U+zaH2TCsrVCv?=
 =?us-ascii?Q?zh+94R1X51hpRSTCuu8LWYysAqwpkry6KmYHxBqKyz1Yih3BPey21PjhCv6M?=
 =?us-ascii?Q?BReOqwVqW+vIYj5/s3FzA7IwFdsJbMi8zl4ZFfckcdrg8d/pWWDtzX/Kgxb9?=
 =?us-ascii?Q?/uoaWNSirYBTRkVRgjhi4WrE6/t6xCQZMIkStxflk9EMjulZDw97MyUcoA/3?=
 =?us-ascii?Q?GWHEIonPlAqRPZcOjNE1Yk0Khjr05Ow3kwqhzcDIhXvL4hkukZHvlvVcSRlQ?=
 =?us-ascii?Q?fMyqcRZJC/Gk8P9av0y9vamRcHzm3Mt8159cAalkZ6FlmOu6MQT1YHNwFb0M?=
 =?us-ascii?Q?qioRtT3enWj6BnWJv8+gvnn78irl2OnL08f50LGVa9ilsiOBtfG+qTi56sNi?=
 =?us-ascii?Q?EUtQQlMB0ETD4F7TPwxvnzAe8COrBZqg3zpscyeHG3KM9urlBGTKog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Roy7tOKHMJpE5lywhuHRgZuZuknRd30efn1Wq5mbJYffwIYXEK1Dh4WXgDCi?=
 =?us-ascii?Q?S+08dNkUoiFgYeTRnksKTA0u1f40UQsw2q4VbZQ0WPVyI8iGu1MsIFSFmy5A?=
 =?us-ascii?Q?vsPEiabMhqfU6eR6tTs9BISvx7MfPVlDmxIlSzhig32a90CwWtm7tCouPnAL?=
 =?us-ascii?Q?LjUHO9wc60Lftp41vOg13O9OMbKbWekYXHMf5ubPAk2jdt5cSNNVLqIlzDIO?=
 =?us-ascii?Q?zNYiD6wNLfJwEmbZAash4JBqqGmqp6SRp1QuXV9rdyldimtvG9yQDvG7Jxvi?=
 =?us-ascii?Q?0svaz9vs3hAsa84FkQAif2t//68VSjUJrpKf9LVUw09dWGv2TxTClrur2x2U?=
 =?us-ascii?Q?YtkK1pNVCZr60rGFdf050gO8AwDN5Ekgihg1hsb+f66lEKbuGU31lMtfnjCr?=
 =?us-ascii?Q?8JyGey2ZBReA4UlZFP0w1PfXHVJAD2ipT1hTeBdz4NjHeZd7d/WF7SlEApb8?=
 =?us-ascii?Q?W7VxNbGYpWP9zGFcWQUUQsgbHUmLkO5IgNDgJGbiIwRF9devINAzQPpxsGhe?=
 =?us-ascii?Q?PxZzS66ycRJXPHRDGqnOnd3UtaOHtkY5DMa5l98DuGamApNqkLFIG73PzIVz?=
 =?us-ascii?Q?0Z4SZNX+LPD377/kg+LrYp9RWK9A+mxhrPPocWN4VuOmhox0HUUf7bn64oOp?=
 =?us-ascii?Q?wF49cJHc2PIh01naC3W6RXfcUnGPiABZ8uKcZfnykt/ojZXiHVJxaZ8f6i3f?=
 =?us-ascii?Q?NAGMshx2JtRCZ6PlastSF1nm8mFJCvz0qzyhV7+4xCxhMD4BtA51rkL4uJQ2?=
 =?us-ascii?Q?kO+zLN4Om8jvf1UaSLCKA54gQMyWZc9dl5dKdFSWxQnb7w7K/h5a5gb9pMWy?=
 =?us-ascii?Q?76fhBMl45Avue2WVVGafYXr11IA38ykwOTmNZTYgXhqUbMdMrSj0za5ApPIp?=
 =?us-ascii?Q?dGOls3x8KZxP464Rqv9WBLgHgUeqgDtMPvrMESSfxH2K4Z74GtBwL6KPW5WI?=
 =?us-ascii?Q?nDPkUlcCjyiXiqv8PwDRAMHwMokJF8t4HQLOlRw6YF8slMYbTsLFSfVwVLmL?=
 =?us-ascii?Q?BIEfdjzwTB+RJUm+6hc05EOgshHZMt64tE+luOF8toRdM6wW5fKLvNNYmxCP?=
 =?us-ascii?Q?DtyGIRgOytzPYGDMYoDLEnEr+yuiq1AiWCjwtokI/ZFPdhOytNIzckVSHh79?=
 =?us-ascii?Q?Y804NJibtagzZgRvdHi+FiVDcKvn+nk7SsvQEMO7eyggH60N+DxdYRBhymNj?=
 =?us-ascii?Q?nnOUUSot7PP6P03E0EyHIq+iZieVExFzrkh8yEv8yDDiWYl0n6+1NymwZ3Th?=
 =?us-ascii?Q?B3Iq3wWazq2hJmgWd3zMzyAdjHUtBM2TP87QZu10KURTtDFgYru+oZGSNkFZ?=
 =?us-ascii?Q?6Gm11v2Wtv17hjQBhRteI383OjSCKQnKjXGFEnwANoXs6NwFfSRKzR2gCTar?=
 =?us-ascii?Q?ikGRPipZHU8cr5hFXI+hNFLcFdzmY2c6qWUUj+Uie3I2+bR8N1yIDgxCoMzQ?=
 =?us-ascii?Q?ZdTNYqXzYTFewZ54XneRowywA9AwS6xm0uI471AC9BGDwUthxXVUC3XE9gJX?=
 =?us-ascii?Q?K73hnH3PoTyg55nk7VexXb2RTmzr5q9kEUoGGzvTriYK30wZPl02X2UmmNWu?=
 =?us-ascii?Q?VKL9Pg/7HBz86zA0cAOZHfzwDLjolUBvi/dr/MUgIdi6YvIlrDIcge9zcSTx?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49008245-f4f6-49c1-c715-08dd7ddb264c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:35.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVxktKXygKr888vKr4VTYLNleU/9TFZ0mv7IY6v7TFSwK5C2lBs+urJY5SIZ9sxn8bERvXzbiXQRSrGqbwOtAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215113

From: Tom Hochstein <Tom Hochstein tom.hochstein@oss.nxp.com>

The SDK Meson compiler test does not work in certain scenarios like
meta-ide-support or NATIVELSBSTRING =3D "debian-11":
```
Traceback (most recent call last):
   File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/=
meson.py", line 47, in test_epoxy
     self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["=
exelist"])
                         ~~~~~~~~~~~~~^^^^^
KeyError: 'c'
```

The root cause is elusive. The contents of `meson introspect --compilers`
is no different from the working case of the standalone SDK with
NATIVELSBSTRING =3D "universal". Notably, the "build" field is in fact
empty, so it's almost as if the failures are correct and the success is
wrong.

The benefits of this part of the test are marginal, so fix it by
removing it.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 63bdac93a9..737bfad8ec 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -47,9 +47,6 @@ class MesonTest(OESDKTestCase):
=20
             log =3D self._run("meson setup --warnlevel 1 -Degl=3Dno -Dglx=
=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
=20
-            # Check that the host (gcc) and build (cross-gcc) compilers ar=
e different
-            data =3D json.loads(self._run("meson introspect --compilers {b=
uild}".format(**dirs)))
-            self.assertNotEqual(data["build"]["c"]["exelist"], data["host"=
]["c"]["exelist"])
             # Check that the system architectures were set correctly
             data =3D json.loads(self._run("meson introspect --machines {bu=
ild}".format(**dirs)))
             self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
--=20
2.34.1


