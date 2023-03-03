Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113E7C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 15:41:37 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.52])
 by mx.groups.io with SMTP id smtpd.web10.26560.1677858089947607875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 07:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=sdxD/THm;
 spf=pass (domain: witekio.com, ip: 40.107.15.52, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYtk8czdnqydnslQ4XAtdY7Mifoo6RfQ0wBI4sJx5+u3za+QGWEeLvzzt+qjD7V1+bAH0WJASYiAfmUV797olgNVNBqqxYK2DQfW1EQd4OzXJdAiWsu9gFXx3tLgMxa5VqMPPjEvo97U5SdBmY+vSGYKdMM3OXrBhordPU54RMccTga7iYxjJ9lDERclyRHDqcBaF0gFRvP07IH1E9f4pYRJFN77MIMEUWXSi3LJncFbRl3iZcJz0Y7sa0ui4AxZlzagHYOaBuXqv8QiP1wPzggl4yrpJlGRdaub4J99aYpYujLwJ3CkXOixg37/ilkhcQasYjVE49BOHbuThAWx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5SZuTWDqqWI3j4xmWlXuGhJEhf6vfAF4rh+osMH0D0=;
 b=VBYYVex3pMyHMNT155+DC5A8WtU5ptwShEMRP1BaMnMBQW9NbGhGQNFjecgr3ZpXK89piyuTiD1fkRg186Zxy4zWJ2Ginyc7p/n7FTyV1MzJ+UnqHXPxHXF9DmF+oaASK3RiP8ocObpmOrA7PFVf+EZpoKqYEf9Eqe2IoEwaQNyOcEA8VieUQJa+ItqRvfCPup08JH6wDw+6+ixeQwCI+kBIWFU5Y5JD+ZvcKNM3MTShsEUbcuj/UAYxM34X+WfL7ZzhunPINFz/8j+9KYRGeTz5sxgXUu6zyw3/bErpLVk0m2o3lBf+ZNJX/RHRa9kdDpmEZPm/GQB9IrY29V/BXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5SZuTWDqqWI3j4xmWlXuGhJEhf6vfAF4rh+osMH0D0=;
 b=sdxD/THmbt46HShtMgLnEPw0Ja1tTsOxFzXGrYVE5PBkD1kabJkC0oOvmN1ZPrNia1K5lqGFCD48duS37qpKPnj7hwVN+nbkfi8SKEuNaMslIk/+tCu01PVjoce36klFTf6ouPHp85gqj8F3cD9FuxKdyoEyWOFf0EPhg8J9is56mUzRK5Ksz/0lskwROwfM8iaE7VyoSMUkAmSXL2MGE+zqTQ5FpgWS/WSLI3UM27vGETmeHaTaoQ/rX+XReMnSjlsDyetZcJwca8c6AUcdKjO6mRjITwh54fngx2wW5F/wf1j2CvbAjQsVv6OIKa6BDkDkvwhmOxhpkK6RwBoDrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DU0P192MB1925.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:413::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 15:41:27 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%4]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 15:41:27 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][dunfell][PATCH V2] bluez5: Exclude CVE-2022-39177 from cve-check
Date: Fri,  3 Mar 2023 16:40:26 +0100
Message-ID: <20230303154026.1685-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0058.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::33) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|DU0P192MB1925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0315872f-7ffd-40c4-d057-08db1bfdc07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+8Hplj+wzKqLLDPeOFlfHQwOv2F0rFuI8t85xYTSivdLSZcVTL8dd6zi3/T04ZWT6IWNzYpOObIhOO9KwPwKO2yoBNka2JbbbF+As1fGtfZbBGhftSTcBHuL4P1Bz8eNG36kS0Z3uGTY3ZsR0iIgTiUCxo6WXBhl8/JGNQBhDQCyTQ9jQAxB+t1+YkZxvrwnZY0wYjul3ntIAvzA3RJLPetLDPqtSETc2ZRZxDO6KE66QbQ7TJma7KrFRILQZCdi7X1YoAoBpN0GG8Qe1zefJvkgdfAHmnVXU44yj6BMSeOkXoXYt5xL91Kh2lMv9FRZkfm/ppboaztcDB+24AizkFa8MoTG8JlKgGNZYfdkf7HsbuKVQqbuTSogzpD+gV34ciafBn8AyN4dMB1zBa4QYKHczYWW+Hrkc9weRv2B9ksxOcW10erU6ldLcDVO/iXj/86GtG0Gg1Obo5HO21aDJ4nZntEs66odJZDSoBRbJBhcIM8clKAOIS6+vjXhmanN+JUcM6ycyFuhDvgWTBDnpw2UraOLg6lKODnkPlV0Z0lLRb7DtQ5h0bFaYsrRVafjyFIdl3YFq2UsqnTDud1BJljRq5E30ba9wAAH3gyXAl3Kvnc2ImyG0K7NZsXXLLUhbGv21PUJWwmsHrlJac7QcpJANin/SEblzDRv51/PT8qC3AjbsHX46NUTvQmvxvdK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199018)(36756003)(107886003)(1076003)(6512007)(6506007)(9686003)(26005)(52116002)(186003)(2616005)(6486002)(41300700001)(966005)(66946007)(8936002)(6916009)(8676002)(66556008)(66476007)(4326008)(2906002)(5660300002)(316002)(38350700002)(38100700002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ktf7SGkH1uQGIjYSD/m+jocMN8Wso0WbDGc3xsSXah+7v5TuvCFOyrXT73ra?=
 =?us-ascii?Q?YJFhgFmXwRkSqwlYaWIpzKU34x0r42dA6kXu8Tz15+ToSbvoX3KOqxRKg97Z?=
 =?us-ascii?Q?34HGpUcsat+tzUB9ealwwrTBhXQV4Rl8AirHFkhD8WVpo8+G3Hmt5tAUqHMw?=
 =?us-ascii?Q?GX6Y0E3ikivUEp93Vrocfv1goWImB6YhhdSfEAh4j2WMe4RS+SO5A8NOql8B?=
 =?us-ascii?Q?23xvIJ9SPZghb4rT3lNzvipiiUSrKYUWtbGfELjMzA83gB5Grqkkw0DQBTxN?=
 =?us-ascii?Q?XhVpsn5h46s/E6AhJuBPs/Xv2p2S5eW21zIstynW04Dcjk/1rdvYNGH9NwMd?=
 =?us-ascii?Q?QFijLMnO8atfqOl5PCxP2JkqMZbQe2O53/ejIuiUJhkkPSEmOO8OkERJQMVN?=
 =?us-ascii?Q?v1QyDFABC5Q4eBY9EE1ld2ydR5IxJNsDij7UweFb+hKmv30FRw+geFcXCh6g?=
 =?us-ascii?Q?8f3RmbBGuQs97JnLV0Jwu0sWjhejSC3wiEZ5SQPK8ULdTEN8HyNcG06pR7D/?=
 =?us-ascii?Q?FJODr9S2XKUXwAsxp4MCU4DYcCGTJmfGFxxqPSv9RP7zAVayaA5uIrQ0QK+d?=
 =?us-ascii?Q?XUaZ6HU3Ael3P+aWH4vGUHE9lanTSFnKPfFDWDzloXPlXZ5qYwUZLgBDvfEa?=
 =?us-ascii?Q?AdCXEUONkDjCy25CHMziPeTbbh8+8VW3IIUXFs5mq1iTGtU3YNjD70RHKzsS?=
 =?us-ascii?Q?f3bTwylEyN3+MdTLezC10WNEWvJIiPZ58ghtMZSnusrucVX06LGzLbnL5kin?=
 =?us-ascii?Q?QBYacBNNjIHB6aof+LnPo3u8knQ9LfteRG0v73QkZ943dm+o4QstM2t+9JHg?=
 =?us-ascii?Q?uvEfYeO9F25sXyesWR7JNdCchaYn9t8RXsnFEEyC9jPS+D8W1H1/Ur0VL5NA?=
 =?us-ascii?Q?sRcPmiOBfLvHWFk09OoX8fusEmruWV9PSuZcBAdafJEk95i9Tqxs6iE6ARKg?=
 =?us-ascii?Q?qN6YY9idpOzCCWyl7TV4WlIhJOlKxZlXHGcCajNNv29+iApORZjh8SD3Tv0l?=
 =?us-ascii?Q?fc25nrY5DVEYIEES9Hzr0y2gN0fWDBpuBaq+/n+kx9aRpKqsahWeOdtYOLt+?=
 =?us-ascii?Q?NqJCYkXtOwM1/3dUB80fqPw21vPb3HvXXrwMVta0p2Bitw9QOJgaoHaVtPnK?=
 =?us-ascii?Q?non2lE2Kxt5G0vM4/UAJaqFandDlzav6ZRaQ6MpIa+Dz5ErJ0bPMgay5lgVL?=
 =?us-ascii?Q?Uhi6YoiicwO6J02HJzqnI+YNxROrM0CsOEx0P449WdEqS1xOD+7vt5uPt3li?=
 =?us-ascii?Q?dFTAScARgkjbucuUdmPgUxv7HEl/ULsb74suc5UfF+W5lt1MaQwIWy8vdBKs?=
 =?us-ascii?Q?3Bi4um0iodc2WHShIXDeV8Bfr+ZbxIj3ULx0yIJ7deqglMAnM6X7sWJEJsyB?=
 =?us-ascii?Q?b7PixtkYCWeN8O30aIXQK0JjWG1btpnKFn89UjRyftsKJGR8Kuu/ZWcU80Jg?=
 =?us-ascii?Q?n/RGo9X3DEBjj4jnS7FKvOHiFdhzwGaTuPI/QAU56FWdt24A+azh4omwQO9G?=
 =?us-ascii?Q?ypZLmPe7YKoc0Js6Odvm4gkDLt/oQG+0cankVNAsrAIRS1nrBsV1ycPHXcRx?=
 =?us-ascii?Q?Tw/agrCNjHSymSywUEjSRli3at9LN8RvZUgkXefV1BOA9uFMs+WnO6RITchC?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0315872f-7ffd-40c4-d057-08db1bfdc07e
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:41:27.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: droFxjt4C0XhbQx7T7Lu5k4MsEegLi71uYYO9IFmF2uBKPtddv8pzYkbsiMjDrKZ/+B6F63QkpXZ7VAHI53H8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 15:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177987

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

CVE already fixed in CVE-2022-39176.patch

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes=
-connectivity/bluez5/bluez5_5.55.bb
index e5353bd815..be74a35e0a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -6,6 +6,13 @@ SRC_URI[sha256sum] =3D "8863717113c4897e2ad3271fc808ea2453=
19e6fd95eed2e934fae8e089
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST +=3D "CVE-2020-12352 CVE-2020-24490"
=20
+# Commit 7a80d2096f1b7125085e21448112aa02f49f5e9a, e2b0f0d8d63e1223bb714a9=
efb37e2257818268b=20
+# and 0388794dc5fdb73a4ea88bcf148de0a12b4364d4 to fix CVE-2022-39177=20
+# already backport in CVE-2022-39176.patch
+# https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
+
+CVE_CHECK_WHITELIST +=3D "CVE-2022-39177"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?=3D " \
--=20
2.25.1


