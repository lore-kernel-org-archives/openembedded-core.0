Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92633C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:00:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web10.10162.1699959629235343840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=geUS6DeL;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.76, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpTS2y8M5RnLCJjtBmEeQ8LdM41etjEMBVkdyJ2VnomEhFBzvSQ5RQRLjpuU5eHR+EhzHPWsIUtw5Hgu9MqzQ1HklQ5i2n9s0qTg9eIqE1tJQ8C58jkl60d3SkfKrqLnyuXQHtJIsSc00PdKJQhGFzJxfz6EAkatGx/Vw0DE11EBUDj13DGRl4FC3qdpYnACa8xEmGKJRL6JNFe6zA4YLf5+ze14u7g7OzoNH/GNAzb0HxnkanusfV/7o6TFX39D2G5BIiHqbueOpGrcE3orG4DCxu3zmbfl5H/i/S4Zm53roBSU9eZRf6SxGxtAMofWyfLfpT4Sx8u3Csoq4ann+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnKg7CaELlrQ38XHAoFn17kzMy0eGyPX6eMcvvs446s=;
 b=hTCu9r5VCv3tOmxk0LB4VLU9SsieISM5bvayjShrFZJUx4ttDzkSwTvuZbyusBIPTzaaU9Cwpj1XkrKoHGlm2sk78G3ONxRIyZAg9Wkz+57qAd/QJzlizivs6HgnBeXTjb2yUMcE06oy9wVIKrZCvAg7ZHj7QJmJpIqtKn//PZuCIGe9bIqvSG37S0CdZ3CdESRLOXdDK5irkl8QgmTS6U3kv3dWJZBAsrRvufRG3ihZYZ7npWmQa9LBKFdwTCAmdfNgvMo+uUcbDAuP34rQrETr4BgGXz+0Gb6MHOaxh66HuRmoRa0aOkwY5qoVY5WHjr6R2VBKq61MB8YQqrcScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnKg7CaELlrQ38XHAoFn17kzMy0eGyPX6eMcvvs446s=;
 b=geUS6DeLQu5dsDwXK3O7cu0MgztzmMQRFF2td5MyPv2uTXVn7UnA1cRQXTOz2llmTBBE/vBcItilAYF9TcERzXPpHfBxB3a6mAr0jrwkX9NFkJJGG8VzfwXBBJ7pNtjtXOr6/WIvkKNJPtGMwpQrgUfSrc//k/a20mGm0LQe/4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:00:25 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 11:00:25 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Malte Schmidt <malte.schmidt@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 1/4] systemd: use nonarch libdir for tmpfiles.d
Date: Tue, 14 Nov 2023 12:00:15 +0100
Message-ID: <997d53a3599a9c3c203f3ea538df1e411241b2c2.1699958492.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1699958492.git.lukas.funke@weidmueller.com>
References: <cover.1699958492.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 53868322-a54d-484a-24c7-08dbe500e7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IzgPmE0+eqTl2SYZCQSxvWjadv6bMuubeeAxyovtnF9W5KwKbpJ/kxm2BqpdpLNDxIcRivdSLDT+c8Yz7e3AkLcyEUvKegj7E2OQLo98vuRVCS8svx1WPLg2q6DkTKzYYXaZgA4V0KNDubOeUdvqKPcU225v9ggj37tGHKYVvQ8ljVtSJwfxqwJsrIb9lPg+8k3+43soasyQtUsUlGUmH/tc3bHg7VxyUT0GDEeShLlEt9tKX4Cua/SqopyuODmELy4PHehPe/c9HuZquHyMHbfFVy34LidClyQH05/lcOG0riCEe473o75LeVPK5Ba+0fZymKkVKGJPLkBIQmoMxZwm/FujT4jjrfYITMep44y6HTq/Llh4BShrbEviz/rM2mN7PMeFX1cNpPbsy3uevSEKsnMzF5mZZgO70cRl12bdk1TMDOLX5J6aya0r5SwGE3dcsIVsv7PnQ2f5KE6PbfSGYolUHLW+wrqoi0iptrbz3/iq+Rg/S0m0gPxA3C1I2/rQMx5LwmdQ99DjjO0K05AHjrzAs5jLYj3QHFsAgZsskR6LWDkaeZB7RVMLqKHNzj7e8I9ywtWRf7QcTc/7kdbcwDsO0Lw74aokt5ejODU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(83380400001)(38350700005)(26005)(107886003)(2616005)(38100700002)(6666004)(5660300002)(86362001)(4326008)(8936002)(8676002)(966005)(6486002)(478600001)(41300700001)(66476007)(52116002)(66556008)(66946007)(6916009)(6512007)(9686003)(54906003)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?82lUe+PGxXi2OPXmoWVF9Z2s1ooGYD4yvdgBLtk1gkM88lafrwkgm8guRbNM?=
 =?us-ascii?Q?G77I5+mcgVO5GfVG8RarkpzUF22aQM5y7nmjCG/8fII8PL3gNydITcuJSs1u?=
 =?us-ascii?Q?S/FsbiF3JGsF4Cw7L1Tu/wR3Zxek8ZvjstM2PswCL3Z+vRxYN92DX6WGZgz6?=
 =?us-ascii?Q?g4l7ydCZn2bWgBS5758gLu2U1Wdy+PW3HavrDXWTOq4fcAHKh07p79ZJugsb?=
 =?us-ascii?Q?4mCFltlo0wHUQACYA4jT8vljX+UIkD/wFkkW+wtXA5VRNXYAV9pcF4gBkRjb?=
 =?us-ascii?Q?/DAlcoVqkXgwcqDQ+csBvaYnUAo3g1lHOLe+Eir4wE63pcMd68F6gmoOfpqu?=
 =?us-ascii?Q?rlhYWjhOuk3P92f0OVzIPhJQtvNpea3/iCWYDdqjhrmV5lOpSMrSFv3x7KyE?=
 =?us-ascii?Q?d42IbV7VdDv5MLcEQ+g4+dk3antR7Cjg8wVaR+GDScC8Erql6Bk60H7WRo3g?=
 =?us-ascii?Q?fhpj4eXlbFfGi51IOIamDEWOJBDEWnbiL2rDu61LJtg2gFOK2VlxPz+PwzGW?=
 =?us-ascii?Q?5b9Swe9E3KJRMU4ZSH3Ad6Ex+mijBYPAFMAXDZclS1ohUOJJOeiLw6Z0opAU?=
 =?us-ascii?Q?eqrLpRzmLJMDE20TEHpuaIhYokAEw9gQCv7rK92NKxZ0ZqNA4DhOOC7iNwpt?=
 =?us-ascii?Q?vMBSvFM6C9KEF+e27iYx0co6UOeMdI90szRMdv8+0I9dasvDJ3DR/d3hWSuQ?=
 =?us-ascii?Q?fRqAidqHlOjjX6sUdVssvHVOHJ8EF0up+PPxq3ahVkJ5J7fWyBxxk6AGFoxw?=
 =?us-ascii?Q?SHl4B7/UtzvVUpV7DaTOM61tZNWZ9PqJj2hGVGUcGn/jVpRmbp5bwc1vbJGF?=
 =?us-ascii?Q?Mp4Q6et7x1hxyipMkeiUFDmbbfigkPP9gxl/id6SO22yR+oODCh/PnBgfIf4?=
 =?us-ascii?Q?pKGa/xQmsj05M8L351o+tWY99lvX4HM1Qdk5sFmWl1J14qUDjbthOYnMwe6k?=
 =?us-ascii?Q?yeZ5d3PPPmz4gmw0AZ1QC6Gtg47VdmERDKBvuVOYht0Q9ynVLrLub+Drumlk?=
 =?us-ascii?Q?9EzPpnpss6gh/FAnZ7HJhp6LnUIEXNChJH/D4TVBkdBptPh44Sj2Pbb280Bj?=
 =?us-ascii?Q?6hyuSJ9r0pQwzW+0c89SN3ENM9lr9dowblxJ1w85Yq6rVdIh/V2iW6mdMOnL?=
 =?us-ascii?Q?B8p/O8nRfbKBsSSuAKtxwvAClQlSi97Jiw1gSdRvgThnop7zDZpoYgVZ/CqX?=
 =?us-ascii?Q?EKvKi/WLvNthIlrHQeiDYsemSZiKRFA2l3Bh8R28DTp2o02UvpWJPTpUjZFP?=
 =?us-ascii?Q?81O1mM/HbMsNr+k1HpHo0gIlNJYOdQfX6pNuNLgLam97ReGP5NehdfkqjWn4?=
 =?us-ascii?Q?+WlaVvucvMioLd/eWXOipbJEhVI0FLonUjg5HS1bPSJ7LcfP9LVS4JPJiENp?=
 =?us-ascii?Q?AEAa86AEV+yeejwV3OYma0amY3ClhgrBosp5EwujPMuc3H8BgBvxXV00SbC8?=
 =?us-ascii?Q?3GSh/+Q4csXclOc6SgaZCnij9S+e1G2Isd2t87Rwi36JCxMI5ZxC6v1dTSmt?=
 =?us-ascii?Q?ZlFvWJ/njlY0zhgif/DroPpdUgkqzjGI/8xj0t5znce13nVIP14AnwRkMIwR?=
 =?us-ascii?Q?NK5PF6GO7zCLI81ZMEq5C51SwINbET3UPx5Ul3ms+L5TgLHb+BLO3QnmH5JR?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53868322-a54d-484a-24c7-08dbe500e7c3
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:00:25.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTyzJWvygXVCAcJRZ8pg9wYppRrIVlio3vyN9FrNxUi5sS5vsAW9WvM4xMKgFMdSMuk/FBzCfdNIZ0ovhiVzdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190493

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core=
/systemd/systemd_254.4.bb
index cc0e29fdd2..48d467dfdd 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -282,12 +282,12 @@ do_install() {
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/sy=
stemd-udevd ${D}/${base_sbindir}/udevd
=20
 	install -d ${D}${sysconfdir}/udev/rules.d/
-	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -d ${D}${exec_prefix}/lib/tmpfiles.d
 	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
=20
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpf=
iles.d/
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${exec_prefix}/lib=
/tmpfiles.d/
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; =
then
 		install -d ${D}${sysconfdir}/init.d
--=20
2.30.2


