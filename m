Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5665DC2FC1A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.186319.1692276425651255430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=PUSmWnd+;
 spf=pass (domain: welotec.com, ip: 40.107.105.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMDNK8LYni0z+i+3Ruy54rSovFpmwk/sFQywia8t9x26YBOGMixChLAtpFwlHzhWnGrsvVEwZvBuiJIdVD2CxkHsgRjeU9I7X/lil2o96W+t59QnO/j44Do8v+ViHINBNLfv8F/N6FX2nfiyNGqdE53VN/CwW7oAY6LUhZfl135ev+9qbndb3fMc7OwCLeqXj903cCOR/FQSdadBY2EP7114zuZU1EX4iL1bjk69LKq5P6hiIzpKRTBv3Neq/dV8WC251zufj5GECIQ6+5aYaJVvnoZ3J0maPKKVYZnZuKz5yBjfutwIhSvyzuvANyB8nIKMrPutJ3GdqgD68GQLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuWB4OW2oWzTbmhUw0YctqfzuX4mSo7O7DWPr+ZYWHU=;
 b=UVCmxogzuRWWxYrJOn4xqI8qjswhNRTkHcplDTkCSmpCFD8dZXHlAHl6vKVbcnRT4VmmZPLbiIiHVxiR2bVERpL9A0A1I8RfZMMNChlwr5MV8vf6wZ3JkEyeOkTcg+Ollui4V1c6CjoI9Qhtrhrwx/9CbiDjnAXiWeULAOQFJ0ixgjh0Il4YqWj5rUZW5Ucx7JxP8mkHxKKhHhBp0tnQYOGvcafDxgJSFYp0QijFxi8Mn1173y+/kia6Uuno85kekOlwv7qgrCGbNvnX9UnJdc9wtqtBxMXrmqMhj/a4+tgadLpzrQSuvL4LNJt1M2cx8G1HUlhA7GhkAhUzerlNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuWB4OW2oWzTbmhUw0YctqfzuX4mSo7O7DWPr+ZYWHU=;
 b=PUSmWnd+1OzsLOn3vNLEgy02MiNyKjHu+Dg6S4kYwfpd/+2jrS3h2KIFM1bxZZhO+cNHb94KZjrTf/P7+9oWn5V5gzuQxeoJdR3Qc8WBpjFfoWFhxVR/pG8HqLD/3MxMfV5SFjdLeaCpuu+2eUmNSO06r0KNQxP7Orix5CSJq/UZs5BgzmLhBYyeAP+3hpiecE/UqMoof2OTCGLRdyd6LXly/Hj2nHyK1cNwWcChLSyLNVKQb0t4ddoNffs5j1YDMSpTuEYJTJTqx1Etjh+gU9sTuENhvMNVVYcA3l+ECTOZA1CSWa7ZPzCzNxdMNy5EqvHKByXEY5arutzBHcEwvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7808.eurprd04.prod.outlook.com (2603:10a6:102:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 12:47:01 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:01 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 4/8] sstate.bbclass: add support for ACLs and xattr
Date: Thu, 17 Aug 2023 14:46:08 +0200
Message-ID: <20230817124612.1043464-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: eed493e8-da3e-4c7b-aa26-08db9f200d44
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CWJ/xkbI2SYv37jhnr7syaxoZgiraRAJP+540ljrZLrw5j33Cs3+Pwy5o4g8nTC2C51xJS+LJyVZppNUhmWA91TysdxLZQLWlqjf47jSJI8nKLKBIqUThcrOLTZIh0sBiVlf/sNeB9KQY+rFexAiyI/yqLRQ+aZDpoF27384lOpm39V1608weFmCntWbsVvrH1vjvtFMTB3iWFgLEq8S+RWKOZaYAGgQfzoQPzei2biVoVJAL9aq6HQIqUwPdH9l+9yhbDUYQnGc9C1ilIEpWqRGAQW1I+uJO8ifmbTQAw7piV7OLr57t880N/bpBTfPE36ZuOVspuCq+/4XKkq9Zn/PIkq1ovb7pULz3svFZqQhLqliZx4zVX09B0kWIKTrmg1aOUzIqWRZfKiX9Bk1Rvj6VSKewO+l873ZqnZhMkCZrAxf60ic7kv8ZmBcZZnmc525mMcjdty8P5/d0vEXOfLr3x85INUo8unRzu+1oav8jCaDUe9Ms0CESOLlj5fW0TJqCNY3+fWg0gjYhNoL+eff+jtF2TDjvQC9geffnTQtZs+hON4yICNYrRwVholtqpsXAJveTDgFx4MRjfzSusNQfuxYgKibwv9vqR/M4d/954NCL/flhDwv5aiV7EtE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(376002)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(86362001)(5660300002)(2906002)(36756003)(26005)(1076003)(2616005)(107886003)(83380400001)(6506007)(6486002)(478600001)(52116002)(6512007)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(38350700002)(38100700002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?clIQ6v6vUvSCQbetq/xe8h4mHUisnNkps/IYgaH3nxXvTa6/JJoJsgow6mWK?=
 =?us-ascii?Q?M2w6RsgBawI/3boFb8QsmGmWmLrCETC8OWG1PX6tbcafOcWMSsgZZQ9mt8p3?=
 =?us-ascii?Q?rCMEB9PpztTkJNoISFhCDP/7cO6aoDlAvljB09Rz3I3/gMTX/ZxCi32RnOti?=
 =?us-ascii?Q?5CpEOdtu9TAPa8M/OM9kVrmZK6I8UOangKjRB7PevhfX4oDi2ZW7MfYSijEA?=
 =?us-ascii?Q?a0ooBIvnHv7/WURSJGWyTJwiEOMKiGoYB0XV/xZ1jxQQpFBPLNghNC+YwUQa?=
 =?us-ascii?Q?ANNS1iKbuMYAoNbhoY7qMZYzNezyPNBlsfKbhTOzI6frO38WCU4WMZhoI8Kc?=
 =?us-ascii?Q?fjG2tW4bsgoN6yWTr0tKS/vD0JEW3IWaZKdSM8dYDxb+nBQ1nty38ySysHjC?=
 =?us-ascii?Q?PesiwyS+ot5y/3ASNEN9qEeoafIMWwJtPfynd1Rz8PNs0lPm2bWnSmgqsiG6?=
 =?us-ascii?Q?0b79Q4KyiP1tKTILbhU33z1XAvTunNRw6zZ/ysL4nxaQm/OPZeU9bwgDw6qh?=
 =?us-ascii?Q?n61pL/kUVjnQxNPqKD6uYkAL6wAOvKJ/SCJ56rUljtMm9O4fNrngAwaogC4f?=
 =?us-ascii?Q?MuZBtpxAFUx74yRnzrlY4SvOwQNLhaQNoQufL0Q/vFReZs/dQOrJbmpYwZLG?=
 =?us-ascii?Q?5dlGqB9JQNKX49VH2wVP2kzoABoedNCvaHJO4f8WHS9sqhjZ893NxSBcouwt?=
 =?us-ascii?Q?9RbrCZhkvJ44GQu2i1toJGaO6tmCXqWI84tOH06KJi03oBAx4uJyAMDweNDv?=
 =?us-ascii?Q?PjcosrJzXREfoSi/NCBgvpR6j7E3x9FUR1PxOwzQ5dSWVtqoXsJn3oBu0pcg?=
 =?us-ascii?Q?tCkETOa3KJcmjAL22WZ9OC+OrwmS7IZlghuH42v9fxqUsKlrlHHquEugK/qf?=
 =?us-ascii?Q?OlyEIxq0A2AmBMQhh/x9rRj0L2nr23WZyab7XcxJu2zqRkFexHuPsIg3XvsE?=
 =?us-ascii?Q?mtj1g8FjiyJELriK0fRlc361RJ4vWBquv4/QKSqay5owkB6SsJCGh58ITPH+?=
 =?us-ascii?Q?tdnl1rT8nbWjjuY+L+g7w3MQ0Fw9Ei889ev7c78Duqqhrl5xA9XUS26KiMhT?=
 =?us-ascii?Q?3n8Ep9HGHfdM9NcutUAohagpXw+3KJL6JqzoH3KRGz21/JvPEpOPEhWJ9eDh?=
 =?us-ascii?Q?cclFz3wTNqlxym9OIpYZ1u/BYWvpeURPyy/wPwjPq71+ExjvUkztq9wChSPu?=
 =?us-ascii?Q?nF+bvl9KVBT2mizm/8QQnFdIdT7E1gbkrYjHfNwcDmzeFuvk34ZBMsfKRpKF?=
 =?us-ascii?Q?2g83ZeSX6w32Btysi7Ru5UVvVr0nnKeR3OYbgLUFeHlAthWUP9DjvkbGtaaB?=
 =?us-ascii?Q?sDcWB47qQDe/nU/ErS4oDaEsvDS547of5OUQbQ17N0I0KQ8sJYSuetf3dzNV?=
 =?us-ascii?Q?NhMrEG/CAz0PkLCw+rIZ473HyVP5QB0n1Zgq+wqw1/LHBeSrEAsf+hBhmbNG?=
 =?us-ascii?Q?g3aKy4HFfdN9Ospf/bVr9AcQjde61XGYTW9WJue/QA2c39i/198QglpXSvw+?=
 =?us-ascii?Q?rftPOoJBVp4WzaOZEHOxPG2ei3Ol8SpfXYb2BoOcXPUH0IVGc+NopDTvzyRN?=
 =?us-ascii?Q?+uIBtCjrrOxdegnZ25FbRgq07T9ZUKsfu0/Ru6kC?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed493e8-da3e-4c7b-aa26-08db9f200d44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:01.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpnJpj2Uy0+pWbJVwmM+ZBBvd0vgTkPHtu+SY0eyN/kmIrdYIv8kOkJjDhkayCyTBosyi99wouqB8RVycL8aSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186309

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 95373fd60a..ac890fc98e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -848,7 +848,7 @@ sstate_create_package () {
 	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
-	OPT=3D"-cS"
+	OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-=
-acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)} --numeric-owner -cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
 	if [ -x "$(command -v pzstd)" ]; then
@@ -914,7 +914,7 @@ sstate_unpack_package () {
 		ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
 	fi
=20
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-=
-xattrs', '', d)} -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch=
 -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
--=20
2.34.1


