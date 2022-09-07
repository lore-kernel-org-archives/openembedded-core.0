Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4FAC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:24:03 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.80])
 by mx.groups.io with SMTP id smtpd.web10.5612.1662542633704864876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=s8s6kLui;
 spf=pass (domain: vaisala.com, ip: 40.107.5.80,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU/3qP0k8isfl7XlLt7qu/oAa82tDUD9oI2CZSDNzcIJz4usj/204cIedNj4hDi1fQw8TCf9NTE5J2LSqjE4gnWb483oE09Dw6SRY1f/G8hkluROeRFgreOMIjTrhKNpylqNIXas8uDcmhpmPa7ZxxtgbenvejjXYM3pfG54DmU11ATj0LhhpPGHaNQajCJ/TebKzwDKJc0hmbBxlub9gZswgU64RxFl408dwYMgVeaE7A/zlXr1sgjP1iQM9h993jzjUSQB7z5P6CcLEf3CziUpEeBMlUnTaKCJ1Xhxbhtxw2NUVFiO6ZtcqAKoDu4gsGae0aLCIh/9JqPT5giCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2r8ORTO9iSsICGfxac9vpXDX26gP02L36md7tGmDkE=;
 b=jEJaYuiqwI57AMbE2XLudCj6LyoQ1kUO696eQssAqvdteYbGAB+48EAQ0ya+T7Ly5lOtOAD/6d1VThbtag0padH6kXgzfygzoExbRPmWjR0u4dr9xc5UTatn/ja9TMVSy7dF2DQTq5tkFdcDIuPAL2UqsastwIMG6MGVFK6GaGvbwS9igOpcewmLYbp6q+6adAwA+4rEsxgT68SK+w2bNjgEXT93p9SAyZhUTCuwVmSQEQZScMJFFGJXQIEs25dc1Np9KCq1mFA7PcSDvw4/rr7FXgz/+kW0ZlGb1ysBC4MMFEW20tjak85XnIUHjduK/5BXV0rZL8TSeFTES0ooIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2r8ORTO9iSsICGfxac9vpXDX26gP02L36md7tGmDkE=;
 b=s8s6kLuiwKJM7qqrlgDtaTnQOy9dGr65h2k9teTR1RyaDeVIrYkA33YfbHUqIFfi2hJeuIRRLN4fahJBUnNTc6tv3yTjGi1JKnke7eSe6SuiumfX5zjJPN2oKzxHPKY1LAFrMuNSA1kR8Y/z7pWBG3y4iM/Xxy+kda6s8hAkf7ssEUzAHikjahl4pLnUoFsa2cV3w+ebx+BFsoHTjbAIC6DGVWfE645Bexirs9MyJuOwColswOWvC2/L3WWsoE6E/Z7K08nhwz/O7fouXIPZmMftnjsktVSdo8Ae/TcHQAAWnq8vbqXZZi2QwjDfrOeSTwjhtK9OnIlfMz+eaJxmgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by HE1PR0601MB2218.eurprd06.prod.outlook.com (2603:10a6:3:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 09:23:49 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030%3]) with mapi id 15.20.5588.010; Wed, 7 Sep 2022
 09:23:49 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv3] systemd: Add 'no-dns-fallback' PACKAGECONFIG option
Date: Wed,  7 Sep 2022 09:23:33 +0000
Message-ID: <20220907092333.3248421-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::13) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc44218-b44e-40ee-74fa-08da90b2ac2c
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LRdyNFVwKfdTA/Tx68R0R1lDq7x70s36RwTV2pCqwPdg6h9r1uIiaNWR4kB3TGJGXZ3NpIrIxMP+VvhrEfOAHppgZ3zkMEgbh7rYbgYmdyV75hImUXLdkmQgYBT5/kFi71wQefsw0bA/YRcQTPnbHPYMQtNKVeXBy/AAN2uDKOFIt0hJiICXGvEdhBuT2iNzgM8NXN2cuaFh/rSi1G4e1OKiD060yYcMiu3HIuCVK7Fmxvx7eoTnOB/wUCqiqbsPP4iDl27dd7PQnO7UsyocQRG3vAnh44wX37YgYLFbgNoTgoGd6m3InYc7Zk2Vw859QRP520wF1yQfwdR4kRanT8+Dz7UuGR7skaDm7s3hprclHlh7gvIaQJY6WXLBUzbbA+kMo9J26yvvgfUOcPVi6cNO5gVzbjzSZ2I1hJxLSSrtS5R7eSqk9HmZhBTkjVJOBDZuF/S9lzEP24MtQMimQ0lBZyPgF6S8PI4dKxnjtCJMXv9b3IYB0mygmCw5PFf8ZT8PJuGB2EbizZ1CqQe521IRhygwhWFI/GxNM27cfLh+rp/UZ9cohAsPQ7rpT3bbBCNHLGNu1uk+AfUQqlIvZMXC4hXxwoKsKan0O3nxRMd8pF+2MJvq8PfjbJK6yhd064aP2KwlNKeoFqrK6wjv+DwxdjSYYX+Rq1yN86NnCCC5iIm+V5wgXujjebvIwOkTkgIW6KXZlKWiVkR582z68YlosKk9rs1p+00kztaEI2UWEMSN7Ln/YLeETyJRI/nxe6QA/qsZ9/y2qN2qDS4MJ8JJkjtIHbrfpaECOh71mUY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(38350700002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(6916009)(6506007)(2906002)(44832011)(5660300002)(8936002)(2616005)(1076003)(186003)(6486002)(966005)(478600001)(52116002)(41300700001)(26005)(6512007)(6666004)(86362001)(107886003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0+4tCPOjDQxY0czdKVsUCO+qn1kUxmkSbM0IxTLYefa7iCU9xM5/iuoO4pSy?=
 =?us-ascii?Q?zzF1RiPFvw2QGp95/WCXvDqmoN24XUm3akYP9THt8u2ZtAlw0osyW/nwBQgz?=
 =?us-ascii?Q?DCcjesRUduBn8qsSQ6T2eTZhHlime2QjSS7YWJ9iZ7ROaY/TFthFp41p0rip?=
 =?us-ascii?Q?Y8288MxPYfyO+AptUeRdV9Q6VzoJ1cFUA5iC8cx9KM9ervnqQNaW3wIBbqEl?=
 =?us-ascii?Q?L22yB7F/rSr6ivHmlKrbVBZ04kHtvp7jZaXKeAE54g1jI7Fymkabb3cTip8y?=
 =?us-ascii?Q?XKSb1uF1ok1fBzJNFdGV3yyuRgkP/qQtP/lHcdL7PwGsP46M3XgLU3X5TFs1?=
 =?us-ascii?Q?cg+DWVhzaf93k2Bna+pIT0ukWDmnnRCTgOscEhVuIYwOGt2sVit+OWIoVxhN?=
 =?us-ascii?Q?005ERO67/6kMuzMQzvQaIuW82vpz7ZRtt2u0qB0JkIInb7Ne7jtFRpURNIU4?=
 =?us-ascii?Q?H1aXdDRmr7yh7FzqH+zxWR5ybJGPcTz4/+gn6j3Gg/OZ/vJe4JmId1bERCZs?=
 =?us-ascii?Q?J/OXwT1xCQuPqetVuehZBOEOHke3sU/nAWuP3/JM5ItiUjE4XvvffYZs3yYW?=
 =?us-ascii?Q?MLxrJR+OM4AIC7g5keGubcJV8xtxU53UvfFMYdAPe1Ag+1xI7iKfk0MnJarg?=
 =?us-ascii?Q?ZSaLMXeaKmZx+XnmIsGdxLvSkEhKhltTDIL77gNHlQoNtu5qLqNTnm+UXTQq?=
 =?us-ascii?Q?ZqPuZXvd0Ovoc0cyfYveXBsOHLjPxBHGKlYBWKbpaJ3S+Cy/G/PWFp0wBz9F?=
 =?us-ascii?Q?odjxl1Q5pK/p15TVEEDOKk47SURwh69QkejxKEpDBgeFS68jzRj6LyUdS6NZ?=
 =?us-ascii?Q?bcV42Be7a+uLcA+tewUqCo1mIikUGn7y9SWbCWgxBX29WATTeixFZcX1QFt3?=
 =?us-ascii?Q?aVyXu9tH4kqqOAikGHUmW20fp3dLaumY7y3l4EqWBq18XgLYgFiPkVGg3D4y?=
 =?us-ascii?Q?G8j11AWEpaAQCU3Tiy+F098KPgwBzmANuN8W+Z2FO4qChrdM5U2kBhoKxF8Q?=
 =?us-ascii?Q?CvFDnIeEsH6LuTElEvBfhIWwv+b/fnLGoRWKRJpxYwDPiSU7+xLqBGSRu+c6?=
 =?us-ascii?Q?Q/I0MEbaMfTAOXOwlbL1vpHr0b51XNzIn7WmXGzgJdwN2iYggABkVH/2A65Y?=
 =?us-ascii?Q?V82ScRz8buMp3M8mT+PMxeU0GAuIyjORL8QzIqCNUivK9rZKTQxcmJix3M4C?=
 =?us-ascii?Q?KVZzWI8fUXctbYg9iPpAvhXSy2ZyJ+I5VF2VWb+UAnmcmkpVgUv6qNGpI7uq?=
 =?us-ascii?Q?mWjBzi0TZogZQC/BmEbF4+H1q62ettEM4w5Any67P+RVNDDcXc1BneWXGopW?=
 =?us-ascii?Q?ET4PMR8j3Ak6xOYyEjDsOMu37Otj5ZPIcGSNWv38Ii9m/rssizhtnzTaOPnp?=
 =?us-ascii?Q?QaQZax27iwa3rUnncXdNKMgu1mkZIVQCcz9kuizIOH28iTdQrcCzAkoiDfVQ?=
 =?us-ascii?Q?9uLiv0CG5+tgbceTxf+59Ux/V6GvZ4GK2QLxerq9P6Tcjjpm1IY5UTPGoxMe?=
 =?us-ascii?Q?RFfKQmiF1MReS1r8XPiVGHNoqzjwh812Z5/71toyG6PrnAI0eAbAvf1qoXAa?=
 =?us-ascii?Q?OsqDkS7R/H+2opgqKJvcUf2qBQCYIkTAKM2yAcJVxIz8NS9Vh/NGDPKF1KOV?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cc44218-b44e-40ee-74fa-08da90b2ac2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:23:49.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 43cfyU6XM6fH7uBT+TlZosV0QXY6fBjMQ9eprOT1TDI+KmhFsX0+ULq9MUtUGDYTWpma1O2LrIezSUyvHy6lDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2218
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:24:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170380

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then adding that value to systemd's PACKAGECONFIG, the output from
runtime 'resolvectl status' command no longer contains the following
line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0=
.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dn=
s.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.c=
om 2001:4860:4860::8844#dns.google

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core=
/systemd/systemd_251.4.bb
index 8497e24af9..910ea71bf6 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -163,6 +163,7 @@ PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse=
,libxslt-native xmlto-native do
 PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Dtrue,-Dmicrohttpd=3Dfalse,li=
bmicrohttpd"
 PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-myhostname=3D=
false,,libnss-myhostname"
 PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dnetworkd=3Dfalse"
+PACKAGECONFIG[no-dns-fallback] =3D "-Ddns-servers=3D"
 PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse"
 PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Dtrue,-Dnss-mymachine=
s=3Dfalse"
 PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfalse=
"
--=20
2.35.1


