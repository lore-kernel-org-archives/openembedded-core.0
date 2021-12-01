Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6ADC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 11:51:58 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.47])
 by mx.groups.io with SMTP id smtpd.web09.91058.1638359516043814427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 03:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=I8noeC2b;
 spf=pass (domain: kpit.com, ip: 40.107.139.47,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REG1je4wOjdV3T6Q52GTekqPU/crhB+XXR7+GmqtNgaj9b54KFf04YyCu4Qn1b7OzJIS/HPt/pgWYwPw12bqHKX9hkgXmDBG1SCrnb87O1hBibHRdtpaKFWh33ASLHZCUFWkuwfiLv3X4LK+8Wbc2h7Hhw/TYSppUVwDr8p5XptR4uLQ4oYEu27VtSrMrtmZb0J/vmRVfJfn6ZjRBpw8uuVIhk1jrWy2uNV9Phw0GVVSIFPuwc+LAuV7MEUNJqTiCGKRDNF1e3tJfGppNjj1w4Vr3+DUMQyn+lqaEvOYrjfgcsqKJuDJ1QB8tEVETedG7eLumT7yEasy7GBJUjvB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGe6gkxTlbgnaFoxen1VjeYzGUSxQ89TY9X27x1+zNk=;
 b=gSM3CtNikp1aUP8amyrgZIWGX4remIyEr9q7aIP7/w+vNGMqtFcvgodLiBLNnlZl9hWrkPF5M6iU0HCmkbvbtEHuArTpbG4r3+NOdx4HkQ8fx0cPsrBcPIpjanLYTBBzgZ4Y2wEOUb36kAx7ZAjOT5cXXvGzdchPS7M8EyqsYCt3Oj8vW1cbpB6gtmvbt9GUaE2EQ5ILaX62NYNqMxqVdNPue48Q+PDHPnKjgtrv7fuYut/a5YRGk/cJzB5CooALohElXDHQs6W5HtPLb7RlkUH/k6diDkqjIFTkSq72ksZG0Wxh4Ae0Yku6xK+hZlYM4Yb4qs1BirKiMzeTkVrh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGe6gkxTlbgnaFoxen1VjeYzGUSxQ89TY9X27x1+zNk=;
 b=I8noeC2bW9HMd1p34ql61xrTa8KnYfS6hP4x4ZOBv7R7ro27lCY43CMSwluNY1HxZIV86bOWogrAXCewlvpW9MnI6pA4xrcNEU8ud7YEn4hOSecMESl41UCs3LhcKGSa2EO03iwcpt42+RZdhv0VwL4VHTD+c3tKv+Re92QdKuE=
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PN3PR01MB6791.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 11:51:47 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::582f:d8eb:a1fa:5a9d]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::582f:d8eb:a1fa:5a9d%5]) with mapi id 15.20.4755.014; Wed, 1 Dec 2021
 11:51:47 +0000
From: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sanakazisk19@gmail.com"
	<sanakazisk19@gmail.com>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH 1/3] dovecot: Fix
 CVE-2020-12100
Thread-Topic: [OE-core] [meta-oe][dunfell][PATCH 1/3] dovecot: Fix
 CVE-2020-12100
Thread-Index: AQHXu4FTJLpT5wdME0GXtQdG4U3UvawamXoAgANCmDQ=
Date: Wed, 1 Dec 2021 11:51:47 +0000
Message-ID: 
 <PNZPR01MB5278F620A63DD902F08C35C68F689@PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM>
References: <20211007133921.3753-1-sanakazisk19@gmail.com>
 <CAPxU0msn=h7LpgZ_fxHpkJFVx=VwLpOreer+nkbopSyB4Yxzmw@mail.gmail.com>
In-Reply-To: 
 <CAPxU0msn=h7LpgZ_fxHpkJFVx=VwLpOreer+nkbopSyB4Yxzmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 6ae89c25-bb46-44be-15f3-f3e609e63d42
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84d62b22-8040-4a0e-a837-08d9b4c0f432
x-ms-traffictypediagnostic: PN3PR01MB6791:
x-microsoft-antispam-prvs: 
 <PN3PR01MB67918FAD642DB827614003578F689@PN3PR01MB6791.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GjOgeFtGwe7PRRxG1gAOtZQ+fHl9rFQXwsfDzPfQK61jUTjfLobmlZuGrntV1ng+1IjLnj74vW37kAwfHBEZS71PzXz7hDfe0fRTGKEB5JG8qGGz9oUmDsMQHxw3vMTU+36MrYnq81lcGG3ajogzYizwlMG4M1mp3gVijfoppLaQ+aZw1D+r72j1b342y5IxnuIRRRCEgeZ5s1PqfiLKxzabxzw1AEe5H05FL0lP6a8eGw4toRn4uC40Yckh7CvCyB56P3FoSCJaTHL9qErA9lafr5+4QjoeIz+oLMdNRzkka61tWfnrrEaIxO7qSlhN3pNlWJpYAITQ/nDlxQKBtzPRupZ458NwDuC/bcrmqBGYNnCYyrr+oBCu5kh4hbOfAkCPh57J9Uzkq9Wrl4QjSel7H14os0VTuFVJyWoIGvyjxg4d6LRXnt91Lz3lOTEot5kkD6cEIGdC8kHOS0JHhN/PWx2lcb/RJgyTDuwsymR5Z4doUQi21XumU6wm7RADoD5lkFApGefJRZqGLjM7GRqEER15TVTjk5C8OAk+0tKkUIX5wHXGGh8QUGskb7Feo/YkLj42Pl6HMvIvcuz9D2JUSfU9ZOIwdWRleDvchFDxpUx6b1V8ffyyvorrLwYHIC/Bc7PD6V5zclonPcvaOTE9yucxLTDszZVKjSIMOeuIv1lNf5yBSSIVWgr098SGC74SYZuJMYoaF3vLM8eLx8zF5wQsWQpjq9Sfcftn2ZEwQ50kdJxqGOcDRZTx523L
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(64756008)(66446008)(186003)(5660300002)(6506007)(45080400002)(66556008)(76116006)(66476007)(8936002)(508600001)(966005)(9686003)(55016003)(2906002)(7066003)(4326008)(86362001)(26005)(19627405001)(66574015)(166002)(83380400001)(110136005)(316002)(38100700002)(122000001)(66946007)(30864003)(8676002)(71200400001)(7696005)(33656002)(99936003)(38070700005)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 O1uNcITJvjQTJjw1OBPoIj/W8yoL/vBzAOhQw8q4q17ii2ZDmMp6z4/f2D1bLMEzU60GF27nuiJ5/gEId1QPAu5JlTnVhF4Z1LORCx5C34p1twERE7cePjSK7u0JSdN0kgn/AOaWpuwtE+ekzQZGETbIWrbiJZgY3IIAuwKHmunxXvKTp7jqncI0bleGaj3q7ixo5+ajw/d0lXUybuR4IBNKymI0bRZLN1CIUfWtitAXMU2lh9DM01+6xCjBUdzFPpy4m/JvcL2Y5m64I7bZ8qJoA/ZzbQmgn4HczpMJxN8mrhnGYdVLr1U1zcvjyRMyEoUj6BEqjkK1sTq0RiaV1qMPaW//2WPAVfgpySJVpg/c6mOn0Ox7hrQ5E6kwgpQzkX7UrBxy3jtKI/cpL2pqUlXX9vfpUTkDK0+MgiDJs9/sXq3ALccLwpCLwpxIOJnh
Content-Type: multipart/related;
	boundary="_004_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84d62b22-8040-4a0e-a837-08d9b4c0f432
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 11:51:47.0797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4y34MPakM4getFbMBsHord6oJRYc0gStDkzEXgl7hBe0M3JLdpgeiCmxU8Nl8HqlcuEElQghLwJaUUiD7FRbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 11:51:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159027

--_004_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_"

--_000_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Sana,

I think you have used the wrong label [meta-oe]. Please use [meta-networkin=
g] for dovecot.
I assume that is the issue it is taking time.

right, Armin?


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:ad1401d3-f314-4d16-afb9-ef59d35050a3]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of sana kazi via lists.openembedded.org <sanakazis=
k19=3Dgmail.com@lists.openembedded.org>
Sent: Monday, November 29, 2021 3:32 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH 1/3] dovecot: Fix CVE-2020-=
12100

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.
Hi,

Could you please review the below patch?

On Thu, 7 Oct 2021 at 19:10, Sana Kazi <sanakazisk19@gmail.com<mailto:sanak=
azisk19@gmail.com>> wrote:
Added patches to fix CVE-2020-12100

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2=
-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fd%2Fdovecot%2=
Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%7C01%7Cranjitsinh.rath=
od%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637737773036592986%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DBjdSeg=
VMjGcFQOWkc6p16a1pDthqhqsT2a7EaZVltmM%3D&reserved=3D0>

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com<mailto:sanakazisk19@gmail.=
com>>
---
 ...-parser-Add-a-message_part_finish-he.patch |  76 +++++++
 ...-parser-Change-message_part_append-t.patch |  71 +++++++
 ...-parser-Optimize-updating-children_c.patch |  49 +++++
 ...-parser-Optimize-appending-new-part-.patch |  88 ++++++++
 ...-parser-Minor-code-cleanup-to-findin.patch |  45 +++++
 ...-parser-Truncate-excessively-long-MI.patch | 163 +++++++++++++++
 ...-parser-Optimize-boundary-lookups-wh.patch |  72 +++++++
 ...-parser-Add-boundary_remove_until-he.patch |  50 +++++
 ...-parser-Don-t-use-memory-pool-for-pa.patch | 169 ++++++++++++++++
 ...-parser-Support-limiting-max-number-.patch | 188 ++++++++++++++++++
 ...-parser-Support-limiting-max-number-.patch |  87 ++++++++
 ...handling-trailing-in-MIME-boundaries.patch | 133 +++++++++++++
 ...Fix-parse_too_many_nested_mime_parts.patch |  32 +++
 .../dovecot/dovecot/buffer_free_fix.patch     |  27 +++
 .../dovecot/dovecot_2.2.36.4.bb<https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb%2F&data=3D04%7C01%7Cranjitsinh=
.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637737773036602942%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Dy=
hkDr8YAhITEFAUS5YJ1ohlZ0oDFFPCKVu7Nq2T%2BC8g%3D&reserved=3D0>              =
 |  14 ++
 15 files changed, 1264 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-li=
b-mail-message-parser-Add-a-message_part_finish-he.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0002-li=
b-mail-message-parser-Change-message_part_append-t.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0003-li=
b-mail-message-parser-Optimize-updating-children_c.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0004-li=
b-mail-message-parser-Optimize-appending-new-part-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0005-li=
b-mail-message-parser-Minor-code-cleanup-to-findin.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0006-li=
b-mail-message-parser-Truncate-excessively-long-MI.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0007-li=
b-mail-message-parser-Optimize-boundary-lookups-wh.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0008-li=
b-mail-message-parser-Add-boundary_remove_until-he.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0009-li=
b-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0010-li=
b-mail-message-parser-Support-limiting-max-number-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0011-li=
b-mail-message-parser-Support-limiting-max-number-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0012-li=
b-mail-Fix-handling-trailing-in-MIME-boundaries.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0013-li=
b-mail-Fix-parse_too_many_nested_mime_parts.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/buffer_=
free_fix.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-=
message-parser-Add-a-message_part_finish-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_fi=
nish-he.patch
new file mode 100644
index 000000000..583f71ca5
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message=
-parser-Add-a-message_part_finish-he.patch
@@ -0,0 +1,76 @@
+From 667d353b0f217372e8cc43ea4fe13466689c7ed0 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 11:33:31 +0300
+Subject: [PATCH 01/13] lib-mail: message-parser - Add a message_part_finis=
h()
+ helper function
+
+---
+ src/lib-mail/message-parser.c | 25 ++++++++++++-------------
+ 1 file changed, 12 insertions(+), 13 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036612893%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DFCLemINLUPDa5Ih7I%2FjQI2JFQ38KNNvTPvtR6v8LGXY%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index b1de1950a..aaa8dd8b7 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -195,6 +195,13 @@ message_part_append(pool_t pool, struct message_part =
*parent)
+       return part;
+ }
+
++static void message_part_finish(struct message_parser_ctx *ctx)
++{
++      message_size_add(&ctx->part->parent->body_size, &ctx->part->body_si=
ze);
++      message_size_add(&ctx->part->parent->body_size, &ctx->part->header_=
size);
++      ctx->part =3D ctx->part->parent;
++}
++
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)
+ {
+       struct message_boundary *b;
+@@ -312,19 +319,16 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,
+                            struct message_boundary *boundary,
+                            struct message_block *block_r, bool first_line=
)
+ {
+-      struct message_part *part;
+       size_t line_size;
+
+       i_assert(ctx->last_boundary =3D=3D NULL);
+
+       /* get back to parent MIME part, summing the child MIME part sizes
+          into parent's body sizes */
+-      for (part =3D ctx->part; part !=3D boundary->part; part =3D part->p=
arent) {
+-              message_size_add(&part->parent->body_size, &part->body_size=
);
+-              message_size_add(&part->parent->body_size, &part->header_si=
ze);
++      while (ctx->part !=3D boundary->part) {
++              message_part_finish(ctx);
++              i_assert(ctx->part !=3D NULL);
+       }
+-      i_assert(part !=3D NULL);
+-      ctx->part =3D part;
+
+       if (boundary->epilogue_found) {
+               /* this boundary isn't needed anymore */
+@@ -1132,13 +1136,8 @@ int message_parser_parse_next_block(struct message_=
parser_ctx *ctx,
+               i_assert(ctx->input->eof || ctx->input->closed ||
+                        ctx->input->stream_errno !=3D 0 ||
+                        ctx->broken_reason !=3D NULL);
+-              while (ctx->part->parent !=3D NULL) {
+-                      message_size_add(&ctx->part->parent->body_size,
+-                                       &ctx->part->body_size);
+-                      message_size_add(&ctx->part->parent->body_size,
+-                                       &ctx->part->header_size);
+-                      ctx->part =3D ctx->part->parent;
+-              }
++              while (ctx->part->parent !=3D NULL)
++                      message_part_finish(ctx);
+       }
+
+       if (block_r->size =3D=3D 0) {
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-=
message-parser-Change-message_part_append-t.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_a=
ppend-t.patch
new file mode 100644
index 000000000..9f24320eb
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message=
-parser-Change-message_part_append-t.patch
@@ -0,0 +1,71 @@
+From de0da7bc8df55521db8fa787f88e293618c96386 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 11:34:22 +0300
+Subject: [PATCH 02/13] lib-mail: message-parser - Change message_part_appe=
nd()
+ to do all work internally
+
+---
+ src/lib-mail/message-parser.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036612893%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DFCLemINLUPDa5Ih7I%2FjQI2JFQ38KNNvTPvtR6v8LGXY%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index aaa8dd8b7..2edf3e7a6 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -167,16 +167,17 @@ static int message_parser_read_more(struct message_p=
arser_ctx *ctx,
+       return 1;
+ }
+
+-static struct message_part *
+-message_part_append(pool_t pool, struct message_part *parent)
++static void
++message_part_append(struct message_parser_ctx *ctx)
+ {
++      struct message_part *parent =3D ctx->part;
+       struct message_part *p, *part, **list;
+
+       i_assert(parent !=3D NULL);
+       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+                                  MESSAGE_PART_FLAG_MESSAGE_RFC822)) !=3D =
0);
+
+-      part =3D p_new(pool, struct message_part, 1);
++      part =3D p_new(ctx->part_pool, struct message_part, 1);
+       part->parent =3D parent;
+       for (p =3D parent; p !=3D NULL; p =3D p->parent)
+               p->children_count++;
+@@ -192,7 +193,7 @@ message_part_append(pool_t pool, struct message_part *=
parent)
+               list =3D &(*list)->next;
+
+       *list =3D part;
+-      return part;
++      ctx->part =3D part;
+ }
+
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -220,7 +221,7 @@ static void parse_next_body_multipart_init(struct mess=
age_parser_ctx *ctx)
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,
+                                              struct message_block *block_=
r)
+ {
+-      ctx->part =3D message_part_append(ctx->part_pool, ctx->part);
++      message_part_append(ctx);
+       return parse_next_header_init(ctx, block_r);
+ }
+
+@@ -270,7 +271,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ static int parse_next_mime_header_init(struct message_parser_ctx *ctx,
+                                      struct message_block *block_r)
+ {
+-      ctx->part =3D message_part_append(ctx->part_pool, ctx->part);
++      message_part_append(ctx);
+       ctx->part->flags |=3D MESSAGE_PART_FLAG_IS_MIME;
+
+       return parse_next_header_init(ctx, block_r);
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-=
message-parser-Optimize-updating-children_c.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-chi=
ldren_c.patch
new file mode 100644
index 000000000..e53090235
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message=
-parser-Optimize-updating-children_c.patch
@@ -0,0 +1,49 @@
+From a9800b436fcf1f9633c2b136a9c5cb7a486a8a52 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 11:36:48 +0300
+Subject: [PATCH 03/13] lib-mail: message-parser - Optimize updating
+ children_count
+
+---
+ src/lib-mail/message-parser.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036622854%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DfqD%2BZ9RImFsCrYFmfHvZZYR5IjkS1Q%2BcXMDPXENYT3A%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 2edf3e7a6..05768a058 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -171,7 +171,7 @@ static void
+ message_part_append(struct message_parser_ctx *ctx)
+ {
+       struct message_part *parent =3D ctx->part;
+-      struct message_part *p, *part, **list;
++      struct message_part *part, **list;
+
+       i_assert(parent !=3D NULL);
+       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+@@ -179,8 +179,6 @@ message_part_append(struct message_parser_ctx *ctx)
+
+       part =3D p_new(ctx->part_pool, struct message_part, 1);
+       part->parent =3D parent;
+-      for (p =3D parent; p !=3D NULL; p =3D p->parent)
+-              p->children_count++;
+
+       /* set child position */
+       part->physical_pos =3D
+@@ -200,6 +198,7 @@ static void message_part_finish(struct message_parser_=
ctx *ctx)
+ {
+       message_size_add(&ctx->part->parent->body_size, &ctx->part->body_si=
ze);
+       message_size_add(&ctx->part->parent->body_size, &ctx->part->header_=
size);
++      ctx->part->parent->children_count +=3D 1 + ctx->part->children_coun=
t;
+       ctx->part =3D ctx->part->parent;
+ }
+
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-=
message-parser-Optimize-appending-new-part-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-ne=
w-part-.patch
new file mode 100644
index 000000000..c35bf883e
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message=
-parser-Optimize-appending-new-part-.patch
@@ -0,0 +1,88 @@
+From 99ee7596712cf0ea0a288b712bc898ecb2b35f9b Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 12:00:38 +0300
+Subject: [PATCH 04/13] lib-mail: message-parser - Optimize appending new p=
art
+ to linked list
+
+---
+ src/lib-mail/message-parser.c | 28 ++++++++++++++++++++++------
+ 1 file changed, 22 insertions(+), 6 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036622854%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DfqD%2BZ9RImFsCrYFmfHvZZYR5IjkS1Q%2BcXMDPXENYT3A%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -1,7 +1,7 @@
+ /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING file=
 */
+
+ #include "lib.h"
+-#include "buffer.h"
++#include "array.h"
+ #include "str.h"
+ #include "istream.h"
+ #include "rfc822-parser.h"
+@@ -34,6 +34,9 @@ struct message_parser_ctx {
+       const char *last_boundary;
+       struct message_boundary *boundaries;
+
++      struct message_part **next_part;
++      ARRAY(struct message_part **) next_part_stack;
++
+       size_t skip;
+       char last_chr;
+       unsigned int want_count;
+@@ -171,7 +174,7 @@ static void
+ message_part_append(struct message_parser_ctx *ctx)
+ {
+       struct message_part *parent =3D ctx->part;
+-      struct message_part *part, **list;
++      struct message_part *part;
+
+       i_assert(parent !=3D NULL);
+       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+@@ -186,16 +189,27 @@ message_part_append(struct message_parse
+               parent->body_size.physical_size +
+               parent->header_size.physical_size;
+
+-      list =3D &part->parent->children;
+-      while (*list !=3D NULL)
+-              list =3D &(*list)->next;
++      /* add to parent's linked list */
++      *ctx->next_part =3D part;
++      /* update the parent's end-of-linked-list pointer */
++      struct message_part **next_part =3D &part->next;
++      array_append(&ctx->next_part_stack, &next_part, 1);
++      /* This part is now the new parent for the next message_part_append=
()
++         call. Its linked list begins with the children pointer. */
++      ctx->next_part =3D &part->children;
+
+-      *list =3D part;
+       ctx->part =3D part;
+ }
+
+ static void message_part_finish(struct message_parser_ctx *ctx)
+ {
++      struct message_part **const *parent_next_partp;
++      unsigned int count =3D array_count(&ctx->next_part_stack);
++
++      parent_next_partp =3D array_idx(&ctx->next_part_stack, count-1);
++      array_delete(&ctx->next_part_stack, count-1, 1);
++      ctx->next_part =3D *parent_next_partp;
++
+       message_size_add(&ctx->part->parent->body_size, &ctx->part->body_si=
ze);
+       message_size_add(&ctx->part->parent->body_size, &ctx->part->header_=
size);
+       ctx->part->parent->children_count +=3D 1 + ctx->part->children_coun=
t;
+@@ -1062,7 +1076,9 @@ message_parser_init(pool_t part_pool, st
+       ctx =3D message_parser_init_int(input, hdr_flags, flags);
+       ctx->part_pool =3D part_pool;
+       ctx->parts =3D ctx->part =3D p_new(part_pool, struct message_part, =
1);
++      ctx->next_part =3D &ctx->part->children;
+       ctx->parse_next_block =3D parse_next_header_init;
++      p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
+       return ctx;
+ }
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-=
message-parser-Minor-code-cleanup-to-findin.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to=
-findin.patch
new file mode 100644
index 000000000..4e63509b4
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message=
-parser-Minor-code-cleanup-to-findin.patch
@@ -0,0 +1,45 @@
+From e39c95b248917eb2b596ca55a957f3cbc7fd406f Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 12:10:07 +0300
+Subject: [PATCH 05/13] lib-mail: message-parser - Minor code cleanup to
+ finding the end of boundary line
+
+---
+ src/lib-mail/message-parser.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036632806%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3D5sSTe2RwNfkTH3eo7FTWGddobLgH2ZiWoG833kCB%2BO8%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index ff4e09e5a..6c6a680b5 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -260,17 +260,16 @@ boundary_line_find(struct message_parser_ctx *ctx,
+       }
+
+       /* need to find the end of line */
+-      if (memchr(data + 2, '\n', size - 2) =3D=3D NULL &&
+-          size < BOUNDARY_END_MAX_LEN &&
++      data +=3D 2;
++      size -=3D 2;
++      if (memchr(data, '\n', size) =3D=3D NULL &&
++          size+2 < BOUNDARY_END_MAX_LEN &&
+           !ctx->input->eof && !full) {
+               /* no LF found */
+               ctx->want_count =3D BOUNDARY_END_MAX_LEN;
+               return 0;
+       }
+
+-      data +=3D 2;
+-      size -=3D 2;
+-
+       *boundary_r =3D boundary_find(ctx->boundaries, data, size);
+       if (*boundary_r =3D=3D NULL)
+               return -1;
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-=
message-parser-Truncate-excessively-long-MI.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-=
long-MI.patch
new file mode 100644
index 000000000..1012d7983
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message=
-parser-Truncate-excessively-long-MI.patch
@@ -0,0 +1,163 @@
+From aed125484a346b4893c1a169088c39fe7ced01f3 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 12:53:12 +0300
+Subject: [PATCH 06/13] lib-mail: message-parser - Truncate excessively lon=
g
+ MIME boundaries
+
+RFC 2046 requires that the boundaries are a maximum of 70 characters
+(excluding the "--" prefix and suffix). We allow 80 characters for a bit o=
f
+extra safety. Anything longer than that is truncated and treated the same
+as if it was just 80 characters.
+---
+ src/lib-mail/message-parser.c      |  7 ++-
+ src/lib-mail/test-message-parser.c | 95 +++++++++++++++++++++++++++++++++=
+++++
+ 2 files changed, 100 insertions(+), 2 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036632806%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3D5sSTe2RwNfkTH3eo7FTWGddobLgH2ZiWoG833kCB%2BO8%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 6c6a680b5..92f541b02 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -10,7 +10,8 @@
+
+ /* RFC-2046 requires boundaries are max. 70 chars + "--" prefix + "--" su=
ffix.
+    We'll add a bit more just in case. */
+-#define BOUNDARY_END_MAX_LEN (70 + 2 + 2 + 10)
++#define BOUNDARY_STRING_MAX_LEN (70 + 10)
++#define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+
+ struct message_boundary {
+       struct message_boundary *next;
+@@ -526,8 +527,10 @@ static void parse_content_type(struct message_parser_=
ctx *ctx,
+       rfc2231_parse(&parser, &results);
+       for (; *results !=3D NULL; results +=3D 2) {
+               if (strcasecmp(results[0], "boundary") =3D=3D 0) {
++                      /* truncate excessively long boundaries */
+                       ctx->last_boundary =3D
+-                              p_strdup(ctx->parser_pool, results[1]);
++                              p_strndup(ctx->parser_pool, results[1],
++                                        BOUNDARY_STRING_MAX_LEN);
+                       break;
+               }
+       }
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c
+index 1f1aa1437..94aa3eb7c 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -642,6 +642,100 @@ static void test_message_parser_no_eoh(void)
+       test_end();
+ }
+
++static void test_message_parser_long_mime_boundary(void)
++{
++      /* Close the boundaries in wrong reverse order. But because all
++         boundaries are actually truncated to the same size (..890) it
++         works the same as if all of them were duplicate boundaries. */
++static const char input_msg[] =3D
++"Content-Type: multipart/mixed; boundary=3D\"1234567890123456789012345678=
901234567890123456789012345678901234567890123456789012\"\n"
++"\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
123456789012\n"
++"Content-Type: multipart/mixed; boundary=3D\"1234567890123456789012345678=
90123456789012345678901234567890123456789012345678901\"\n"
++"\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
12345678901\n"
++"Content-Type: multipart/mixed; boundary=3D\"1234567890123456789012345678=
9012345678901234567890123456789012345678901234567890\"\n"
++"\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
1234567890\n"
++"Content-Type: text/plain\n"
++"\n"
++"1\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
123456789012\n"
++"Content-Type: text/plain\n"
++"\n"
++"22\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
12345678901\n"
++"Content-Type: text/plain\n"
++"\n"
++"333\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890=
1234567890\n"
++"Content-Type: text/plain\n"
++"\n"
++"4444\n";
++      struct message_parser_ctx *parser;
++      struct istream *input;
++      struct message_part *parts, *part;
++      struct message_block block;
++      pool_t pool;
++      int ret;
++
++      test_begin("message parser long mime boundary");
++      pool =3D pool_alloconly_create("message parser", 10240);
++      input =3D test_istream_create(input_msg);
++
++      parser =3D message_parser_init(pool, input, 0, 0);
++      while ((ret =3D message_parser_parse_next_block(parser, &block)) > =
0) ;
++      test_assert(ret < 0);
++      message_parser_deinit(&parser, &parts);
++
++      part =3D parts;
++      test_assert(part->children_count =3D=3D 6);
++      test_assert(part->flags =3D=3D (MESSAGE_PART_FLAG_MULTIPART | MESSA=
GE_PART_FLAG_IS_MIME));
++      test_assert(part->header_size.lines =3D=3D 2);
++      test_assert(part->header_size.physical_size =3D=3D 126);
++      test_assert(part->header_size.virtual_size =3D=3D 126+2);
++      test_assert(part->body_size.lines =3D=3D 22);
++      test_assert(part->body_size.physical_size =3D=3D 871);
++      test_assert(part->body_size.virtual_size =3D=3D 871+22);
++
++      part =3D parts->children;
++      test_assert(part->children_count =3D=3D 5);
++      test_assert(part->flags =3D=3D (MESSAGE_PART_FLAG_MULTIPART | MESSA=
GE_PART_FLAG_IS_MIME));
++      test_assert(part->header_size.lines =3D=3D 2);
++      test_assert(part->header_size.physical_size =3D=3D 125);
++      test_assert(part->header_size.virtual_size =3D=3D 125+2);
++      test_assert(part->body_size.lines =3D=3D 19);
++      test_assert(part->body_size.physical_size =3D=3D 661);
++      test_assert(part->body_size.virtual_size =3D=3D 661+19);
++
++      part =3D parts->children->children;
++      test_assert(part->children_count =3D=3D 4);
++      test_assert(part->flags =3D=3D (MESSAGE_PART_FLAG_MULTIPART | MESSA=
GE_PART_FLAG_IS_MIME));
++      test_assert(part->header_size.lines =3D=3D 2);
++      test_assert(part->header_size.physical_size =3D=3D 124);
++      test_assert(part->header_size.virtual_size =3D=3D 124+2);
++      test_assert(part->body_size.lines =3D=3D 16);
++      test_assert(part->body_size.physical_size =3D=3D 453);
++      test_assert(part->body_size.virtual_size =3D=3D 453+16);
++
++      part =3D parts->children->children->children;
++      for (unsigned int i =3D 1; i <=3D 3; i++, part =3D part->next) {
++              test_assert(part->children_count =3D=3D 0);
++              test_assert(part->flags =3D=3D (MESSAGE_PART_FLAG_TEXT | ME=
SSAGE_PART_FLAG_IS_MIME));
++              test_assert(part->header_size.lines =3D=3D 2);
++              test_assert(part->header_size.physical_size =3D=3D 26);
++              test_assert(part->header_size.virtual_size =3D=3D 26+2);
++              test_assert(part->body_size.lines =3D=3D 0);
++              test_assert(part->body_size.physical_size =3D=3D i);
++              test_assert(part->body_size.virtual_size =3D=3D i);
++      }
++
++      test_parsed_parts(input, parts);
++      i_stream_unref(&input);
++      pool_unref(&pool);
++      test_end();
++}
++
+ int main(void)
+ {
+       static void (*test_functions[])(void) =3D {
+@@ -654,6 +748,7 @@ int main(void)
+               test_message_parser_garbage_suffix_mime_boundary,
+               test_message_parser_continuing_mime_boundary,
+               test_message_parser_continuing_truncated_mime_boundary,
++              test_message_parser_long_mime_boundary,
+               test_message_parser_no_eoh,
+               NULL
+       };
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-=
message-parser-Optimize-boundary-lookups-wh.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-loo=
kups-wh.patch
new file mode 100644
index 000000000..eeb6c96f1
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message=
-parser-Optimize-boundary-lookups-wh.patch
@@ -0,0 +1,72 @@
+From 5f8de52fec3191a1aa68a399ee2068485737dc4f Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 13:06:02 +0300
+Subject: [PATCH 07/13] lib-mail: message-parser - Optimize boundary lookup=
s
+ when exact boundary is found
+
+When an exact boundary is found, there's no need to continue looking for
+more boundaries.
+---
+ src/lib-mail/message-parser.c | 26 ++++++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036642765%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3D0oQHK5%2FjpqwH7BvP3mAedGOyY6vJxuIZfPtdY6dfQ0g%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 92f541b02..c2934c761 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -80,8 +80,14 @@ boundary_find(struct message_boundary *boundaries,
+       while (boundaries !=3D NULL) {
+               if (boundaries->len <=3D len &&
+                   memcmp(boundaries->boundary, data, boundaries->len) =3D=
=3D 0 &&
+-                  (best =3D=3D NULL || best->len < boundaries->len))
++                  (best =3D=3D NULL || best->len < boundaries->len)) {
+                       best =3D boundaries;
++                      if (best->len =3D=3D len) {
++                              /* This is exactly the wanted boundary. The=
re
++                                 can't be a better one. */
++                              break;
++                      }
++              }
+
+               boundaries =3D boundaries->next;
+       }
+@@ -263,15 +269,27 @@ boundary_line_find(struct message_parser_ctx *ctx,
+       /* need to find the end of line */
+       data +=3D 2;
+       size -=3D 2;
+-      if (memchr(data, '\n', size) =3D=3D NULL &&
++      const unsigned char *lf_pos =3D memchr(data, '\n', size);
++      if (lf_pos =3D=3D NULL &&
+           size+2 < BOUNDARY_END_MAX_LEN &&
+           !ctx->input->eof && !full) {
+               /* no LF found */
+               ctx->want_count =3D BOUNDARY_END_MAX_LEN;
+               return 0;
+       }
+-
+-      *boundary_r =3D boundary_find(ctx->boundaries, data, size);
++      size_t find_size =3D size;
++
++      if (lf_pos !=3D NULL) {
++              find_size =3D lf_pos - data;
++              if (find_size > 0 && data[find_size-1] =3D=3D '\r')
++                      find_size--;
++              if (find_size > 2 && data[find_size-1] =3D=3D '-' &&
++                  data[find_size-2] =3D=3D '-')
++                      find_size -=3D 2;
++      } else if (find_size > BOUNDARY_END_MAX_LEN)
++              find_size =3D BOUNDARY_END_MAX_LEN;
++
++      *boundary_r =3D boundary_find(ctx->boundaries, data, find_size);
+       if (*boundary_r =3D=3D NULL)
+               return -1;
+
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-=
message-parser-Add-boundary_remove_until-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_u=
ntil-he.patch
new file mode 100644
index 000000000..4af070a87
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message=
-parser-Add-boundary_remove_until-he.patch
@@ -0,0 +1,50 @@
+From 929396767d831bedbdec6392aaa835b045332fd3 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 14:53:27 +0300
+Subject: [PATCH 08/13] lib-mail: message-parser - Add boundary_remove_unti=
l()
+ helper function
+
+---
+ src/lib-mail/message-parser.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036642765%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3D0oQHK5%2FjpqwH7BvP3mAedGOyY6vJxuIZfPtdY6dfQ0g%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index c2934c761..028f74159 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -223,6 +223,13 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)
+       ctx->part =3D ctx->part->parent;
+ }
+
++static void
++boundary_remove_until(struct message_parser_ctx *ctx,
++                    struct message_boundary *boundary)
++{
++      ctx->boundaries =3D boundary;
++}
++
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)
+ {
+       struct message_boundary *b;
+@@ -364,10 +371,10 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,
+
+       if (boundary->epilogue_found) {
+               /* this boundary isn't needed anymore */
+-              ctx->boundaries =3D boundary->next;
++              boundary_remove_until(ctx, boundary->next);
+       } else {
+               /* forget about the boundaries we possibly skipped */
+-              ctx->boundaries =3D boundary;
++              boundary_remove_until(ctx, boundary);
+       }
+
+       /* the boundary itself should already be in buffer. add that. */
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-=
message-parser-Don-t-use-memory-pool-for-pa.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool=
-for-pa.patch
new file mode 100644
index 000000000..aade7dc2b
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message=
-parser-Don-t-use-memory-pool-for-pa.patch
@@ -0,0 +1,169 @@
+From d53d83214b1d635446a8cf8ff9438cc530133d62 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 15:00:57 +0300
+Subject: [PATCH 09/13] lib-mail: message-parser - Don't use memory pool fo=
r
+ parser
+
+This reduces memory usage when parsing many MIME parts where boundaries ar=
e
+being added and removed constantly.
+---
+ src/lib-mail/message-parser.c | 48 ++++++++++++++++++++++++++++----------=
-----
+ 1 file changed, 32 insertions(+), 16 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036652724%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DGRs5GCiBmuczWBA1M6QaLjiZvG3PLWVhs4LPoAU7LPk%3D&reserved=3D0=
>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 028f74159..8970d8e0e 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -17,14 +17,14 @@ struct message_boundary {
+       struct message_boundary *next;
+
+       struct message_part *part;
+-      const char *boundary;
++      char *boundary;
+       size_t len;
+
+       unsigned int epilogue_found:1;
+ };
+
+ struct message_parser_ctx {
+-      pool_t parser_pool, part_pool;
++      pool_t part_pool;
+       struct istream *input;
+       struct message_part *parts, *part;
+       const char *broken_reason;
+@@ -32,7 +32,7 @@ struct message_parser_ctx {
+       enum message_header_parser_flags hdr_flags;
+       enum message_parser_flags flags;
+
+-      const char *last_boundary;
++      char *last_boundary;
+       struct message_boundary *boundaries;
+
+       struct message_part **next_part;
+@@ -223,10 +223,24 @@ static void message_part_finish(struct message_parse=
r_ctx *ctx)
+       ctx->part =3D ctx->part->parent;
+ }
+
++static void message_boundary_free(struct message_boundary *b)
++{
++      i_free(b->boundary);
++      i_free(b);
++}
++
+ static void
+ boundary_remove_until(struct message_parser_ctx *ctx,
+                     struct message_boundary *boundary)
+ {
++      while (ctx->boundaries !=3D boundary) {
++              struct message_boundary *cur =3D ctx->boundaries;
++
++              i_assert(cur !=3D NULL);
++              ctx->boundaries =3D cur->next;
++              message_boundary_free(cur);
++
++      }
+       ctx->boundaries =3D boundary;
+ }
+
+@@ -234,15 +248,14 @@ static void parse_next_body_multipart_init(struct me=
ssage_parser_ctx *ctx)
+ {
+       struct message_boundary *b;
+
+-      b =3D p_new(ctx->parser_pool, struct message_boundary, 1);
++      b =3D i_new(struct message_boundary, 1);
+       b->part =3D ctx->part;
+       b->boundary =3D ctx->last_boundary;
++      ctx->last_boundary =3D NULL;
+       b->len =3D strlen(b->boundary);
+
+       b->next =3D ctx->boundaries;
+       ctx->boundaries =3D b;
+-
+-      ctx->last_boundary =3D NULL;
+ }
+
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,
+@@ -359,6 +372,8 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,
+                            struct message_block *block_r, bool first_line=
)
+ {
+       size_t line_size;
++      size_t boundary_len =3D boundary->len;
++      bool boundary_epilogue_found =3D boundary->epilogue_found;
+
+       i_assert(ctx->last_boundary =3D=3D NULL);
+
+@@ -391,7 +406,7 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,
+               i_assert(block_r->data[0] =3D=3D '\n');
+               line_size =3D 1;
+       }
+-      line_size +=3D 2 + boundary->len + (boundary->epilogue_found ? 2 : =
0);
++      line_size +=3D 2 + boundary_len + (boundary_epilogue_found ? 2 : 0)=
;
+       i_assert(block_r->size >=3D ctx->skip + line_size);
+       block_r->size =3D line_size;
+       parse_body_add_block(ctx, block_r);
+@@ -553,9 +568,9 @@ static void parse_content_type(struct message_parser_c=
tx *ctx,
+       for (; *results !=3D NULL; results +=3D 2) {
+               if (strcasecmp(results[0], "boundary") =3D=3D 0) {
+                       /* truncate excessively long boundaries */
++                      i_free(ctx->last_boundary);
+                       ctx->last_boundary =3D
+-                              p_strndup(ctx->parser_pool, results[1],
+-                                        BOUNDARY_STRING_MAX_LEN);
++                              i_strndup(results[1], BOUNDARY_STRING_MAX_L=
EN);
+                       break;
+               }
+       }
+@@ -678,7 +693,7 @@ static int parse_next_header(struct message_parser_ctx=
 *ctx,
+               i_assert(!ctx->multipart);
+               part->flags =3D 0;
+       }
+-      ctx->last_boundary =3D NULL;
++      i_free(ctx->last_boundary);
+
+       if (!ctx->part_seen_content_type ||
+           (part->flags & MESSAGE_PART_FLAG_IS_MIME) =3D=3D 0) {
+@@ -1081,11 +1096,8 @@ message_parser_init_int(struct istream *input,
+                       enum message_parser_flags flags)
+ {
+       struct message_parser_ctx *ctx;
+-      pool_t pool;
+
+-      pool =3D pool_alloconly_create("Message Parser", 1024);
+-      ctx =3D p_new(pool, struct message_parser_ctx, 1);
+-      ctx->parser_pool =3D pool;
++      ctx =3D i_new(struct message_parser_ctx, 1);
+       ctx->hdr_flags =3D hdr_flags;
+       ctx->flags =3D flags;
+       ctx->input =3D input;
+@@ -1105,7 +1117,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,
+       ctx->parts =3D ctx->part =3D p_new(part_pool, struct message_part, =
1);
+       ctx->next_part =3D &ctx->part->children;
+       ctx->parse_next_block =3D parse_next_header_init;
+-      p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
++      i_array_init(&ctx->next_part_stack, 4);
+       return ctx;
+ }
+
+@@ -1146,8 +1158,12 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,
+
+       if (ctx->hdr_parser_ctx !=3D NULL)
+               message_parse_header_deinit(&ctx->hdr_parser_ctx);
++      boundary_remove_until(ctx, NULL);
+       i_stream_unref(&ctx->input);
+-      pool_unref(&ctx->parser_pool);
++      if (array_is_created(&ctx->next_part_stack))
++              array_free(&ctx->next_part_stack);
++      i_free(ctx->last_boundary);
++      i_free(ctx);
+       i_assert(ret < 0 || *parts_r !=3D NULL);
+       return ret;
+ }
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-=
number-.patch
new file mode 100644
index 000000000..ae5254466
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message=
-parser-Support-limiting-max-number-.patch
@@ -0,0 +1,188 @@
+From df9e0d358ef86e3342525dcdefcf79dc2d749a30 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 16:59:40 +0300
+Subject: [PATCH 10/13] lib-mail: message-parser - Support limiting max num=
ber
+ of nested MIME parts
+
+The default is to allow 100 nested MIME parts. When the limit is reached,
+the innermost MIME part's body contains all the rest of the inner bodies
+until a parent MIME part is reached.
+---
+ src/lib-mail/message-parser.c      | 43 +++++++++++++++++++++++++++++++--=
-----
+ src/lib-mail/test-message-parser.c | 31 +++++++++++++++++++++++++++
+ 2 files changed, 67 insertions(+), 7 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036652724%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DGRs5GCiBmuczWBA1M6QaLjiZvG3PLWVhs4LPoAU7LPk%3D&reserved=3D0=
>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 8970d8e0e..721615f76 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -13,6 +13,8 @@
+ #define BOUNDARY_STRING_MAX_LEN (70 + 10)
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+
++#define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
++
+ struct message_boundary {
+       struct message_boundary *next;
+
+@@ -28,9 +30,11 @@ struct message_parser_ctx {
+       struct istream *input;
+       struct message_part *parts, *part;
+       const char *broken_reason;
++      unsigned int nested_parts_count;
+
+       enum message_header_parser_flags hdr_flags;
+       enum message_parser_flags flags;
++      unsigned int max_nested_mime_parts;
+
+       char *last_boundary;
+       struct message_boundary *boundaries;
+@@ -206,6 +210,8 @@ message_part_append(struct message_parser_ctx *ctx)
+       ctx->next_part =3D &part->children;
+
+       ctx->part =3D part;
++      ctx->nested_parts_count++;
++      i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
+ }
+
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -213,8 +219,12 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)
+       struct message_part **const *parent_next_partp;
+       unsigned int count =3D array_count(&ctx->next_part_stack);
+
++      i_assert(ctx->nested_parts_count > 0);
++      ctx->nested_parts_count--;
++
+       parent_next_partp =3D array_idx(&ctx->next_part_stack, count-1);
+       array_delete(&ctx->next_part_stack, count-1, 1);
++
+       ctx->next_part =3D *parent_next_partp;
+
+       message_size_add(&ctx->part->parent->body_size, &ctx->part->body_si=
ze);
+@@ -592,6 +602,11 @@ static bool block_is_at_eoh(const struct message_bloc=
k *block)
+       return FALSE;
+ }
+
++static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)
++{
++      return ctx->nested_parts_count > ctx->max_nested_mime_parts;
++}
++
+ #define MUTEX_FLAGS \
+       (MESSAGE_PART_FLAG_MESSAGE_RFC822 | MESSAGE_PART_FLAG_MULTIPART)
+
+@@ -616,8 +631,12 @@ static int parse_next_header(struct message_parser_ct=
x *ctx,
+                  "\n--boundary" belongs to us or to a previous boundary.
+                  this is a problem if the boundary prefixes are identical=
,
+                  because MIME requires only the prefix to match. */
+-              parse_next_body_multipart_init(ctx);
+-              ctx->multipart =3D TRUE;
++              if (!parse_too_many_nested_mime_parts(ctx)) {
++                      parse_next_body_multipart_init(ctx);
++                      ctx->multipart =3D TRUE;
++              } else {
++                      part->flags &=3D ~MESSAGE_PART_FLAG_MULTIPART;
++              }
+       }
+
+       /* before parsing the header see if we can find a --boundary from h=
ere.
+@@ -721,12 +740,16 @@ static int parse_next_header(struct message_parser_c=
tx *ctx,
+               i_assert(ctx->last_boundary =3D=3D NULL);
+               ctx->multipart =3D FALSE;
+               ctx->parse_next_block =3D parse_next_body_to_boundary;
+-      } else if (part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822)
++      } else if ((part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822) !=3D 0 =
&&
++                 !parse_too_many_nested_mime_parts(ctx)) {
+               ctx->parse_next_block =3D parse_next_body_message_rfc822_in=
it;
+-      else if (ctx->boundaries !=3D NULL)
+-              ctx->parse_next_block =3D parse_next_body_to_boundary;
+-      else
+-              ctx->parse_next_block =3D parse_next_body_to_eof;
++      } else {
++              part->flags &=3D ~MESSAGE_PART_FLAG_MESSAGE_RFC822;
++              if (ctx->boundaries !=3D NULL)
++                      ctx->parse_next_block =3D parse_next_body_to_bounda=
ry;
++              else
++                      ctx->parse_next_block =3D parse_next_body_to_eof;
++      }
+
+       ctx->want_count =3D 1;
+
+@@ -1100,6 +1123,8 @@ message_parser_init_int(struct istream *input,
+       ctx =3D i_new(struct message_parser_ctx, 1);
+       ctx->hdr_flags =3D hdr_flags;
+       ctx->flags =3D flags;
++      ctx->max_nested_mime_parts =3D
++              MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
+       ctx->input =3D input;
+       i_stream_ref(input);
+       return ctx;
+@@ -1159,6 +1184,10 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,
+       if (ctx->hdr_parser_ctx !=3D NULL)
+               message_parse_header_deinit(&ctx->hdr_parser_ctx);
+       boundary_remove_until(ctx, NULL);
++      /* caller might have stopped the parsing early */
++      i_assert(ctx->nested_parts_count =3D=3D 0 ||
++               i_stream_have_bytes_left(ctx->input));
++
+       i_stream_unref(&ctx->input);
+       if (array_is_created(&ctx->next_part_stack))
+               array_free(&ctx->next_part_stack);
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c
+index 94aa3eb7c..481d05942 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -166,6 +166,36 @@ static void test_message_parser_small_blocks(void)
+       test_end();
+ }
+
++static void test_message_parser_stop_early(void)
++{
++      struct message_parser_ctx *parser;
++      struct istream *input;
++      struct message_part *parts;
++      struct message_block block;
++      unsigned int i;
++      pool_t pool;
++      int ret;
++
++      test_begin("message parser stop early");
++      pool =3D pool_alloconly_create("message parser", 10240);
++      input =3D test_istream_create(test_msg);
++
++      test_istream_set_allow_eof(input, FALSE);
++      for (i =3D 1; i <=3D TEST_MSG_LEN+1; i++) {
++              i_stream_seek(input, 0);
++              test_istream_set_size(input, i);
++              parser =3D message_parser_init(pool, input, 0, 0);
++              while ((ret =3D message_parser_parse_next_block(parser,
++                                                            &block)) > 0)=
 ;
++              test_assert(ret =3D=3D 0);
++              message_parser_deinit(&parser, &parts);
++      }
++
++      i_stream_unref(&input);
++      pool_unref(&pool);
++      test_end();
++}
++
+ static void test_message_parser_truncated_mime_headers(void)
+ {
+ static const char input_msg[] =3D
+@@ -740,6 +770,7 @@ int main(void)
+ {
+       static void (*test_functions[])(void) =3D {
+               test_message_parser_small_blocks,
++              test_message_parser_stop_early,
+               test_message_parser_truncated_mime_headers,
+               test_message_parser_truncated_mime_headers2,
+               test_message_parser_truncated_mime_headers3,
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-=
number-.patch
new file mode 100644
index 000000000..52848bf3a
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message=
-parser-Support-limiting-max-number-.patch
@@ -0,0 +1,87 @@
+From d7bba401dd234802bcdb55ff27dfb99bffdab804 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 23 Apr 2020 17:09:33 +0300
+Subject: [PATCH 11/13] lib-mail: message-parser - Support limiting max num=
ber
+ of MIME parts
+
+The default is to allow 10000 MIME parts. When it's reached, no more
+MIME boundary lines will be recognized, so the rest of the mail belongs
+to the last added MIME part.
+---
+ src/lib-mail/message-parser.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 721615f76..646307802 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -14,6 +14,7 @@
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+
+ #define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
++#define MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS 10000
+
+ struct message_boundary {
+       struct message_boundary *next;
+@@ -31,10 +32,12 @@ struct message_parser_ctx {
+       struct message_part *parts, *part;
+       const char *broken_reason;
+       unsigned int nested_parts_count;
++      unsigned int total_parts_count;
+
+       enum message_header_parser_flags hdr_flags;
+       enum message_parser_flags flags;
+       unsigned int max_nested_mime_parts;
++      unsigned int max_total_mime_parts;
+
+       char *last_boundary;
+       struct message_boundary *boundaries;
+@@ -211,7 +214,9 @@ message_part_append(struct message_parser_ctx *ctx)
+
+       ctx->part =3D part;
+       ctx->nested_parts_count++;
++      ctx->total_parts_count++;
+       i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
++      i_assert(ctx->total_parts_count <=3D ctx->max_total_mime_parts);
+ }
+
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -296,6 +301,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
+               return -1;
+       }
+
++      if (ctx->total_parts_count >=3D ctx->max_total_mime_parts) {
++              /* can't add any more MIME parts. just stop trying to find
++                 more boundaries. */
++              return -1;
++      }
++
+       /* need to find the end of line */
+       data +=3D 2;
+       size -=3D 2;
+@@ -1125,6 +1136,8 @@ message_parser_init_int(struct istream *input,
+       ctx->flags =3D flags;
+       ctx->max_nested_mime_parts =3D
+               MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
++      ctx->max_total_mime_parts =3D
++              MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS;
+       ctx->input =3D input;
+       i_stream_ref(input);
+       return ctx;
+@@ -1142,6 +1155,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,
+       ctx->parts =3D ctx->part =3D p_new(part_pool, struct message_part, =
1);
+       ctx->next_part =3D &ctx->part->children;
+       ctx->parse_next_block =3D parse_next_header_init;
++      ctx->total_parts_count =3D 1;
+       i_array_init(&ctx->next_part_stack, 4);
+       return ctx;
+ }
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-=
Fix-handling-trailing-in-MIME-boundaries.patch b/meta-networking/recipes-su=
pport/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundarie=
s.patch
new file mode 100644
index 000000000..a81177d2b
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-han=
dling-trailing-in-MIME-boundaries.patch
@@ -0,0 +1,133 @@
+From 0c9d56b41b992a868f299e05677a67c4d0495523 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Thu, 2 Jul 2020 17:31:19 +0300
+Subject: [PATCH 12/13] lib-mail: Fix handling trailing "--" in MIME bounda=
ries
+
+Broken by 5b8ec27fae941d06516c30476dcf4820c6d200ab
+---
+ src/lib-mail/message-parser.c      | 14 ++++++++----
+ src/lib-mail/test-message-parser.c | 46 +++++++++++++++++++++++++++++++++=
+++++
+ 2 files changed, 56 insertions(+), 4 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 646307802..175d4b488 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -75,7 +75,7 @@ static int preparsed_parse_next_header_init(struct messa=
ge_parser_ctx *ctx,
+
+ static struct message_boundary *
+ boundary_find(struct message_boundary *boundaries,
+-            const unsigned char *data, size_t len)
++            const unsigned char *data, size_t len, bool trailing_dashes)
+ {
+       struct message_boundary *best =3D NULL;
+
+@@ -89,7 +89,11 @@ boundary_find(struct message_boundary *boundaries,
+                   memcmp(boundaries->boundary, data, boundaries->len) =3D=
=3D 0 &&
+                   (best =3D=3D NULL || best->len < boundaries->len)) {
+                       best =3D boundaries;
+-                      if (best->len =3D=3D len) {
++                      /* If we see "foo--", it could either mean that the=
re
++                         is a boundary named "foo" that ends now or there=
's
++                         a boundary "foo--" which continues. */
++                      if (best->len =3D=3D len ||
++                          (best->len =3D=3D len-2 && trailing_dashes)) {
+                               /* This is exactly the wanted boundary. The=
re
+                                  can't be a better one. */
+                               break;
+@@ -319,6 +323,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
+               return 0;
+       }
+       size_t find_size =3D size;
++      bool trailing_dashes =3D FALSE;
+
+       if (lf_pos !=3D NULL) {
+               find_size =3D lf_pos - data;
+@@ -326,11 +331,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
+                       find_size--;
+               if (find_size > 2 && data[find_size-1] =3D=3D '-' &&
+                   data[find_size-2] =3D=3D '-')
+-                      find_size -=3D 2;
++                      trailing_dashes =3D TRUE;
+       } else if (find_size > BOUNDARY_END_MAX_LEN)
+               find_size =3D BOUNDARY_END_MAX_LEN;
+
+-      *boundary_r =3D boundary_find(ctx->boundaries, data, find_size);
++      *boundary_r =3D boundary_find(ctx->boundaries, data, find_size,
++                                  trailing_dashes);
+       if (*boundary_r =3D=3D NULL)
+               return -1;
+
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c
+index 481d05942..113454ea0 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -510,6 +510,51 @@ static const char input_msg[] =3D
+       test_end();
+ }
+
++static void test_message_parser_trailing_dashes(void)
++{
++static const char input_msg[] =3D
++"Content-Type: multipart/mixed; boundary=3D\"a--\"\n"
++"\n"
++"--a--\n"
++"Content-Type: multipart/mixed; boundary=3D\"a----\"\n"
++"\n"
++"--a----\n"
++"Content-Type: text/plain\n"
++"\n"
++"body\n"
++"--a------\n"
++"Content-Type: text/html\n"
++"\n"
++"body2\n"
++"--a----";
++      struct message_parser_ctx *parser;
++      struct istream *input;
++      struct message_part *parts;
++      struct message_block block;
++      pool_t pool;
++      int ret;
++
++      test_begin("message parser trailing dashes");
++      pool =3D pool_alloconly_create("message parser", 10240);
++      input =3D test_istream_create(input_msg);
++
++      parser =3D message_parser_init(pool, input, 0, 0);
++      while ((ret =3D message_parser_parse_next_block(parser, &block)) > =
0) ;
++      test_assert(ret < 0);
++      message_parser_deinit(&parser, &parts);
++
++      test_assert(parts->children_count =3D=3D 2);
++      test_assert(parts->children->next =3D=3D NULL);
++      test_assert(parts->children->children_count =3D=3D 1);
++      test_assert(parts->children->children->next =3D=3D NULL);
++      test_assert(parts->children->children->children_count =3D=3D 0);
++
++      test_parsed_parts(input, parts);
++      i_stream_unref(&input);
++      pool_unref(&pool);
++      test_end();
++}
++
+ static void test_message_parser_continuing_mime_boundary(void)
+ {
+ static const char input_msg[] =3D
+@@ -777,6 +822,7 @@ int main(void)
+               test_message_parser_empty_multipart,
+               test_message_parser_duplicate_mime_boundary,
+               test_message_parser_garbage_suffix_mime_boundary,
++              test_message_parser_trailing_dashes,
+               test_message_parser_continuing_mime_boundary,
+               test_message_parser_continuing_truncated_mime_boundary,
+               test_message_parser_long_mime_boundary,
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-=
Fix-parse_too_many_nested_mime_parts.patch b/meta-networking/recipes-suppor=
t/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
new file mode 100644
index 000000000..97068345f
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-par=
se_too_many_nested_mime_parts.patch
@@ -0,0 +1,32 @@
+From f77a2b6c3ffe2ea96f4a4b05ec38dc9d53266ecb Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com<mailto:timo.sirainen@o=
pen-xchange.com>>
+Date: Wed, 27 May 2020 11:35:55 +0300
+Subject: [PATCH 13/13] lib-mail: Fix parse_too_many_nested_mime_parts()
+
+This was originally correct, until it was "optimized" wrong and got merged=
.
+---
+ src/lib-mail/message-parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 175d4b488..5b11772ff 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -621,7 +621,7 @@ static bool block_is_at_eoh(const struct message_block=
 *block)
+
+ static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)
+ {
+-      return ctx->nested_parts_count > ctx->max_nested_mime_parts;
++      return ctx->nested_parts_count+1 >=3D ctx->max_nested_mime_parts;
+ }
+
+ #define MUTEX_FLAGS \
+--
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fi=
x.patch b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.p=
atch
new file mode 100644
index 000000000..44f6564f8
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
@@ -0,0 +1,27 @@
+From 1a6ff0beebf0ab0c71081eaff1d5d7fd26015a94 Mon Sep 17 00:00:00 2001
+From: Josef 'Jeff' Sipek <jeff.sipek@dovecot.fi<mailto:jeff.sipek@dovecot.=
fi>>
+Date: Tue, 19 Sep 2017 13:26:57 +0300
+Subject: [PATCH] lib: buffer_free(NULL) should be a no-op
+
+---
+ src/lib/buffer.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com<mailto:Sana.Kazi@kpit.com>>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/do=
vecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz<https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%=
2Fmain%2Fd%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&data=3D04%=
7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036672627%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&sdata=3DEtIjL4RJbjLXHSYszXnYHY%2BF5fvzsAQujWnvHZfBuqE%3D&reserved=
=3D0>]
+Comment: No change in any hunk
+
+--- a/src/lib/buffer.c
++++ b/src/lib/buffer.c
+@@ -148,6 +148,9 @@ void buffer_free(buffer_t **_buf)
+ {
+       struct real_buffer *buf =3D (struct real_buffer *)*_buf;
+
++      if (buf =3D=3D NULL)
++              return;
++
+       *_buf =3D NULL;
+       if (buf->alloced)
+               p_free(buf->pool, buf->w_buffer);
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb<ht=
tps://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.=
2.36.4.bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e=
77d30f08d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63773777303=
6672627%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Dsc28CFI8cABij7QBJWpxQydQ9NvR8XZpY2ya=
GN2XwGA%3D&reserved=3D0> b/meta-networking/recipes-support/dovecot/dovecot_=
2.2.36.4.bb<https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2=
F%2Fdovecot_2.2.36.4.bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C=
a3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637737773036682584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DO1RxZ2%2Bkkkab2JR0uUCH=
QPfsr5hWACroAUx2oMnfnJk%3D&reserved=3D0>
index e21a94ad6..407604c81 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb<https://a=
pc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.=
bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f0=
8d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036682584=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000&sdata=3DO1RxZ2%2Bkkkab2JR0uUCHQPfsr5hWACroAUx2oMnfn=
Jk%3D&reserved=3D0>
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb<https://a=
pc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.=
bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f0=
8d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036692539=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000&sdata=3DIstkr9lJfE34LVBrjlpaIuEschXArHktrG8O5%2FJaj=
ec%3D&reserved=3D0>
@@ -10,6 +10,20 @@ SRC_URI =3D "http://dovecot.org/releases/2.2/dovecot-${P=
V}.tar.gz<https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%=
2Fdovecot.org%2Freleases%2F2.2%2Fdovecot-%24%257BPV%257D.tar.gz&data=3D04%7=
C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C353=
9451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036692539%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000&sdata=3D2juoHv19hqxGl7DDDut5251TTXhLbR7aqRmewfjALSI%3D&reserved=3D0>=
 \
            file://dovecot.service \
            file://dovecot.socket \
            file://0001-doveadm-Fix-parallel-build.patch \
+           file://0001-lib-mail-message-parser-Add-a-message_part_finish-h=
e.patch \
+           file://0002-lib-mail-message-parser-Change-message_part_append-=
t.patch \
+           file://0003-lib-mail-message-parser-Optimize-updating-children_=
c.patch \
+           file://0004-lib-mail-message-parser-Optimize-appending-new-part=
-.patch \
+           file://0005-lib-mail-message-parser-Minor-code-cleanup-to-findi=
n.patch \
+           file://0006-lib-mail-message-parser-Truncate-excessively-long-M=
I.patch \
+           file://0007-lib-mail-message-parser-Optimize-boundary-lookups-w=
h.patch \
+           file://0008-lib-mail-message-parser-Add-boundary_remove_until-h=
e.patch \
+           file://0009-lib-mail-message-parser-Don-t-use-memory-pool-for-p=
a.patch \
+           file://0010-lib-mail-message-parser-Support-limiting-max-number=
-.patch \
+           file://0011-lib-mail-message-parser-Support-limiting-max-number=
-.patch \
+           file://0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.p=
atch \
+           file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch=
 \
+           file://buffer_free_fix.patch \
            "

 SRC_URI[md5sum] =3D "66c4d71858b214afee5b390ee602dee2"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Sana,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think you have used the wrong label [meta-oe]. Please use [meta-networkin=
g] for dovecot.</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I assume that is the issue it is taking time.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
right, Armin?</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt; font-size:11pt; font-family:Calibri,sans-s=
erif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,255,2=
55)">
<span lang=3D"EN-IN" style=3D"margin:0px; font-family:&quot;Work Sans Mediu=
m&quot;; color:rgb(89,89,89)"><b>Ranjitsinh Rathod</b></span><span lang=3D"=
EN-IN" style=3D"margin:0px; font-size:14pt; font-family:&quot;Work Sans&quo=
t;; color:rgb(0,137,207)"><br>
</span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family=
:&quot;Work Sans&quot;; color:rgb(127,127,127)">Technical Leader |&nbsp;&nb=
sp;| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span lang=3D"EN-IN" style=3D"margin:0px; font-size:14pt; fo=
nt-family:&quot;Work Sans&quot;; color:rgb(176,255,69)">___________________=
_______________________<br>
</span></sup></b><span style=3D"margin:0px; color:rgb(31,73,125)"><a href=
=3D"http://www.kpit.com/" target=3D"_blank" rel=3D"noopener noreferrer" sty=
le=3D"margin:0px"><span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt;=
 font-family:&quot;Work Sans Medium&quot;; color:gray">KPIT</span></a></spa=
n><span style=3D"margin:0px; font-family:&quot;Work Sans&quot;; color:gray"=
><span>&nbsp;</span></span><span lang=3D"EN-IN" style=3D"margin:0px; font-s=
ize:12pt; font-family:&quot;Work Sans&quot;; color:gray">|</span><span lang=
=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&=
quot;; color:gray"><span>&nbsp;</span></span><span style=3D"margin:0px; col=
or:rgb(31,73,125)"><a href=3D"http://www.kpit.com/linkedin" target=3D"_blan=
k" rel=3D"noopener noreferrer" style=3D"margin:0px"><span lang=3D"EN-IN" st=
yle=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&quot;; color:=
gray">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:rgb(89,89,89)"></span><span style=
=3D"margin:0px; font-size:12pt; font-family:&quot;Times New Roman&quot;,ser=
if"></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" target=3D"_blank" rel=3D"noope=
ner noreferrer" style=3D"margin:0px"><span style=3D"margin:0px; color:rgb(3=
1,73,125)"><img class=3D"EmojiInsert" width=3D"621" height=3D"120" style=3D=
"margin:0px; width:6.4687in; height:1.25in" data-outlook-trace=3D"F:1|T:1" =
src=3D"cid:ad1401d3-f314-4d16-afb9-ef59d35050a3"></span></a></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of sana kazi via lists.openembedded.org &lt;sanakazisk19=3Dgmail.com@li=
sts.openembedded.org&gt;<br>
<b>Sent:</b> Monday, November 29, 2021 3:32 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][dunfell][PATCH 1/3] dovecot: Fix CV=
E-2020-12100</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"background-color:#F7F4A9"><span style=3D"font-size:12pt; font=
-weight:bold; font-family:'Cambria','times new roman','garamond',serif; col=
or:#ff0000">Caution:
<span style=3D"font-size:8 pt; font-weight:normal; font-family:'times new r=
oman',serif; color:#ff0000">
This email originated from outside of the KPIT. Do not click links or open =
attachments unless you recognize the sender and know the content is safe.
</span></span></div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div>Could you please review the below patch?</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, 7 Oct 2021 at 19:10, Sana K=
azi &lt;<a href=3D"mailto:sanakazisk19@gmail.com">sanakazisk19@gmail.com</a=
>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
Added patches to fix CVE-2020-12100<br>
<br>
Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fd%2Fdovecot%2Fdovecot_=
2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%7Cranjitsinh.rathod%40=
kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637737773036592986%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DBjdSegV=
MjGcFQOWkc6p16a1pDthqhqsT2a7EaZVltmM%3D&amp;reserved=3D0" originalsrc=3D"ht=
tp://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu=
4.7.debian.tar.xz" shash=3D"Ez3EjaXMHFbqouuikvIaxm2mO4MMa5+OC0cXL8SrVVtNrrB=
+CfYK+sV7Ngr79AEHSUkkEZyaSFkTHOj6AT5BdE3Yg2UhW4kiYsx8LGU2sV1YycC8WCm+MzesD7=
8ftUaF6KzTzTvLozjSdh5OJXn+NxYiMfOC2e8Yfl+XNkbx2xw=3D" rel=3D"noreferrer" ta=
rget=3D"_blank">
http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubun=
tu4.7.debian.tar.xz</a><br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com" targ=
et=3D"_blank">sanakazisk19@gmail.com</a>&gt;<br>
---<br>
&nbsp;...-parser-Add-a-message_part_finish-he.patch |&nbsp; 76 +++++++<br>
&nbsp;...-parser-Change-message_part_append-t.patch |&nbsp; 71 +++++++<br>
&nbsp;...-parser-Optimize-updating-children_c.patch |&nbsp; 49 +++++<br>
&nbsp;...-parser-Optimize-appending-new-part-.patch |&nbsp; 88 ++++++++<br>
&nbsp;...-parser-Minor-code-cleanup-to-findin.patch |&nbsp; 45 +++++<br>
&nbsp;...-parser-Truncate-excessively-long-MI.patch | 163 +++++++++++++++<b=
r>
&nbsp;...-parser-Optimize-boundary-lookups-wh.patch |&nbsp; 72 +++++++<br>
&nbsp;...-parser-Add-boundary_remove_until-he.patch |&nbsp; 50 +++++<br>
&nbsp;...-parser-Don-t-use-memory-pool-for-pa.patch | 169 ++++++++++++++++<=
br>
&nbsp;...-parser-Support-limiting-max-number-.patch | 188 +++++++++++++++++=
+<br>
&nbsp;...-parser-Support-limiting-max-number-.patch |&nbsp; 87 ++++++++<br>
&nbsp;...handling-trailing-in-MIME-boundaries.patch | 133 +++++++++++++<br>
&nbsp;...Fix-parse_too_many_nested_mime_parts.patch |&nbsp; 32 +++<br>
&nbsp;.../dovecot/dovecot/buffer_free_fix.patch&nbsp; &nbsp; &nbsp;|&nbsp; =
27 +++<br>
&nbsp;.../dovecot/<a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb%2F&amp;data=3D04%7C01%7Cranjitsinh=
.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637737773036602942%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DyhkDr8YAhITEFAUS5YJ1ohlZ0oDFFPCKVu7Nq2T%2BC8g%3D&amp;reserved=3D0" origi=
nalsrc=3D"http://dovecot_2.2.36.4.bb/" shash=3D"yxwOVBEuzSAaBcSQBxPl10IXtCK=
cTm9uGbF+rNxHJFtR4fjrhCNhtxT0Y3fAcrqGCQMKOjT5q2NnoKROYuX5RuFVejA+1+FtsX/YYY=
jjKJW9RbqQjr+yp8kpoU64qxmWX2G7tO2XomzcqsmaObjVvOt6DUvZncBnCi/yc4EIDn8=3D" r=
el=3D"noreferrer" target=3D"_blank">dovecot_2.2.36.4.bb</a>&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 14 ++<br>
&nbsp;15 files changed, 1264 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
01-lib-mail-message-parser-Add-a-message_part_finish-he.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
02-lib-mail-message-parser-Change-message_part_append-t.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
03-lib-mail-message-parser-Optimize-updating-children_c.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
04-lib-mail-message-parser-Optimize-appending-new-part-.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
05-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
06-lib-mail-message-parser-Truncate-excessively-long-MI.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
07-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
08-lib-mail-message-parser-Add-boundary_remove_until-he.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
09-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
10-lib-mail-message-parser-Support-limiting-max-number-.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
11-lib-mail-message-parser-Support-limiting-max-number-.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
12-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
13-lib-mail-Fix-parse_too_many_nested_mime_parts.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dovecot/dovecot/bu=
ffer_free_fix.patch<br>
<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-=
message-parser-Add-a-message_part_finish-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_fi=
nish-he.patch<br>
new file mode 100644<br>
index 000000000..583f71ca5<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message=
-parser-Add-a-message_part_finish-he.patch<br>
@@ -0,0 +1,76 @@<br>
+From 667d353b0f217372e8cc43ea4fe13466689c7ed0 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:33:31 +0300<br>
+Subject: [PATCH 01/13] lib-mail: message-parser - Add a message_part_finis=
h()<br>
+ helper function<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 25 ++++++++++++-------------<br>
+ 1 file changed, 12 insertions(+), 13 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036612893%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DFCLemINLUPDa5Ih7I%2FjQI2JFQ38KNNvTPvtR6v8LGXY%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"WmS3iEbURNRaVwJSRWo/kX0=
PuH9DjAPeQJ7sbvmYRSIzOcbFXr1cSf8ocVScS2JUfLzuvq1HbX4mWSpSDjW3P6hI4NgHJ1YxPf=
phpbZi1fq+dw1CtWntKAMGSmJmKSyAwaw73PqUBn8+nnvKcS/NSq+d13fxXhkLa52NSQ+TaUo=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index b1de1950a..aaa8dd8b7 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -195,6 +195,13 @@ message_part_append(pool_t pool, struct message_part =
*parent)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return part;<br>
+ }<br>
+ <br>
++static void message_part_finish(struct message_parser_ctx *ctx)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;bo=
dy_size, &amp;ctx-&gt;part-&gt;body_size);<br>
++&nbsp; &nbsp; &nbsp; message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;bo=
dy_size, &amp;ctx-&gt;part-&gt;header_size);<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
++}<br>
++<br>
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *b;<br>
+@@ -312,19 +319,16 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; struct message_boundary *boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; struct message_block *block_r, bool first_line)<br>
+ {<br>
+-&nbsp; &nbsp; &nbsp; struct message_part *part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size_t line_size;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(ctx-&gt;last_boundary =3D=3D NULL);<br=
>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* get back to parent MIME part, summing the ch=
ild MIME part sizes<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; into parent's body sizes */<br>
+-&nbsp; &nbsp; &nbsp; for (part =3D ctx-&gt;part; part !=3D boundary-&gt;p=
art; part =3D part-&gt;parent) {<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; message_size_add(&amp;pa=
rt-&gt;parent-&gt;body_size, &amp;part-&gt;body_size);<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; message_size_add(&amp;pa=
rt-&gt;parent-&gt;body_size, &amp;part-&gt;header_size);<br>
++&nbsp; &nbsp; &nbsp; while (ctx-&gt;part !=3D boundary-&gt;part) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; message_part_finish(ctx)=
;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i_assert(ctx-&gt;part !=
=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+-&nbsp; &nbsp; &nbsp; i_assert(part !=3D NULL);<br>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;part =3D part;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (boundary-&gt;epilogue_found) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* this boundary is=
n't needed anymore */<br>
+@@ -1132,13 +1136,8 @@ int message_parser_parse_next_block(struct message_=
parser_ctx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i_assert(ctx-&gt;in=
put-&gt;eof || ctx-&gt;input-&gt;closed ||<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ctx-&gt;input-&gt;stream_errno !=3D 0 ||<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ctx-&gt;broken_reason !=3D NULL);<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; while (ctx-&gt;part-&gt;=
parent !=3D NULL) {<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;body_size,<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;ctx-=
&gt;part-&gt;body_size);<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;body_size,<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;ctx-=
&gt;part-&gt;header_size);<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; while (ctx-&gt;part-&gt;=
parent !=3D NULL)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; message_part_finish(ctx);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (block_r-&gt;size =3D=3D 0) {<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-=
message-parser-Change-message_part_append-t.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_a=
ppend-t.patch<br>
new file mode 100644<br>
index 000000000..9f24320eb<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message=
-parser-Change-message_part_append-t.patch<br>
@@ -0,0 +1,71 @@<br>
+From de0da7bc8df55521db8fa787f88e293618c96386 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:34:22 +0300<br>
+Subject: [PATCH 02/13] lib-mail: message-parser - Change message_part_appe=
nd()<br>
+ to do all work internally<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 13 +++++++------<br>
+ 1 file changed, 7 insertions(+), 6 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036612893%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DFCLemINLUPDa5Ih7I%2FjQI2JFQ38KNNvTPvtR6v8LGXY%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"WmS3iEbURNRaVwJSRWo/kX0=
PuH9DjAPeQJ7sbvmYRSIzOcbFXr1cSf8ocVScS2JUfLzuvq1HbX4mWSpSDjW3P6hI4NgHJ1YxPf=
phpbZi1fq+dw1CtWntKAMGSmJmKSyAwaw73PqUBn8+nnvKcS/NSq+d13fxXhkLa52NSQ+TaUo=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index aaa8dd8b7..2edf3e7a6 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -167,16 +167,17 @@ static int message_parser_read_more(struct message_p=
arser_ctx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
+ }<br>
+ <br>
+-static struct message_part *<br>
+-message_part_append(pool_t pool, struct message_part *parent)<br>
++static void<br>
++message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
++&nbsp; &nbsp; &nbsp; struct message_part *parent =3D ctx-&gt;part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *p, *part, **list;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(parent !=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MESSAGE_PART_FLAG_MESSAGE_RFC8=
22)) !=3D 0);<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; part =3D p_new(pool, struct message_part, 1);<br>
++&nbsp; &nbsp; &nbsp; part =3D p_new(ctx-&gt;part_pool, struct message_par=
t, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;part-&gt;parent =3D parent;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;for (p =3D parent; p !=3D NULL; p =3D p-&gt;par=
ent)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p-&gt;children_coun=
t++;<br>
+@@ -192,7 +193,7 @@ message_part_append(pool_t pool, struct message_part *=
parent)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;list =3D &amp;(*lis=
t)-&gt;next;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;*list =3D part;<br>
+-&nbsp; &nbsp; &nbsp; return part;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;part =3D part;<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -220,7 +221,7 @@ static void parse_next_body_multipart_init(struct mess=
age_parser_ctx *ctx)<br>
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; struct message_block *block_r)<br>
+ {<br>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;part =3D message_part_append(ctx-&gt;part_po=
ol, ctx-&gt;part);<br>
++&nbsp; &nbsp; &nbsp; message_part_append(ctx);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return parse_next_header_init(ctx, block_r);<br=
>
+ }<br>
+ <br>
+@@ -270,7 +271,7 @@ boundary_line_find(struct message_parser_ctx *ctx,<br>
+ static int parse_next_mime_header_init(struct message_parser_ctx *ctx,<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct message_b=
lock *block_r)<br>
+ {<br>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;part =3D message_part_append(ctx-&gt;part_po=
ol, ctx-&gt;part);<br>
++&nbsp; &nbsp; &nbsp; message_part_append(ctx);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part-&gt;flags |=3D MESSAGE_PART_FLAG_I=
S_MIME;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;return parse_next_header_init(ctx, block_r);<br=
>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-=
message-parser-Optimize-updating-children_c.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-chi=
ldren_c.patch<br>
new file mode 100644<br>
index 000000000..e53090235<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message=
-parser-Optimize-updating-children_c.patch<br>
@@ -0,0 +1,49 @@<br>
+From a9800b436fcf1f9633c2b136a9c5cb7a486a8a52 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:36:48 +0300<br>
+Subject: [PATCH 03/13] lib-mail: message-parser - Optimize updating<br>
+ children_count<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 5 ++---<br>
+ 1 file changed, 2 insertions(+), 3 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036622854%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DfqD%2BZ9RImFsCrYFmfHvZZYR5IjkS1Q%2BcXMDPXENYT3A%3D&amp;reser=
ved=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/doveco=
t/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"hpi+4oThdKgq/hAL7tJ2i=
A0MFWu9G6yp9y/WK/2LSQEqIX/iLGfp7mwRHOtBqwCMv56Bjniuj7pDCm5UOv3Bq3cD2GcpZvGk=
RqmiIiiGsADK+2jDgtyI3JwobtzHBF0p+xLvwVKldperfqKc+6TkO0SqtqV075GdXZ1oA1+3w5M=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 2edf3e7a6..05768a058 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -171,7 +171,7 @@ static void<br>
+ message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *parent =3D ctx-&gt;part;<b=
r>
+-&nbsp; &nbsp; &nbsp; struct message_part *p, *part, **list;<br>
++&nbsp; &nbsp; &nbsp; struct message_part *part, **list;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(parent !=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+@@ -179,8 +179,6 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;part =3D p_new(ctx-&gt;part_pool, struct messag=
e_part, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;part-&gt;parent =3D parent;<br>
+-&nbsp; &nbsp; &nbsp; for (p =3D parent; p !=3D NULL; p =3D p-&gt;parent)<=
br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p-&gt;children_count++;<=
br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* set child position */<br>
+&nbsp; &nbsp; &nbsp; &nbsp;part-&gt;physical_pos =3D<br>
+@@ -200,6 +198,7 @@ static void message_part_finish(struct message_parser_=
ctx *ctx)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;header_size);<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;part-&gt;parent-&gt;children_count +=3D 1 + =
ctx-&gt;part-&gt;children_count;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-=
message-parser-Optimize-appending-new-part-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-ne=
w-part-.patch<br>
new file mode 100644<br>
index 000000000..c35bf883e<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message=
-parser-Optimize-appending-new-part-.patch<br>
@@ -0,0 +1,88 @@<br>
+From 99ee7596712cf0ea0a288b712bc898ecb2b35f9b Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:00:38 +0300<br>
+Subject: [PATCH 04/13] lib-mail: message-parser - Optimize appending new p=
art<br>
+ to linked list<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 28 ++++++++++++++++++++++------<br>
+ 1 file changed, 22 insertions(+), 6 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036622854%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DfqD%2BZ9RImFsCrYFmfHvZZYR5IjkS1Q%2BcXMDPXENYT3A%3D&amp;reser=
ved=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/doveco=
t/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"hpi+4oThdKgq/hAL7tJ2i=
A0MFWu9G6yp9y/WK/2LSQEqIX/iLGfp7mwRHOtBqwCMv56Bjniuj7pDCm5UOv3Bq3cD2GcpZvGk=
RqmiIiiGsADK+2jDgtyI3JwobtzHBF0p+xLvwVKldperfqKc+6TkO0SqtqV075GdXZ1oA1+3w5M=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -1,7 +1,7 @@<br>
+ /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING file=
 */<br>
+ <br>
+ #include &quot;lib.h&quot;<br>
+-#include &quot;buffer.h&quot;<br>
++#include &quot;array.h&quot;<br>
+ #include &quot;str.h&quot;<br>
+ #include &quot;istream.h&quot;<br>
+ #include &quot;rfc822-parser.h&quot;<br>
+@@ -34,6 +34,9 @@ struct message_parser_ctx {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;const char *last_boundary;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *boundaries;<br>
+ <br>
++&nbsp; &nbsp; &nbsp; struct message_part **next_part;<br>
++&nbsp; &nbsp; &nbsp; ARRAY(struct message_part **) next_part_stack;<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size_t skip;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;char last_chr;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int want_count;<br>
+@@ -171,7 +174,7 @@ static void<br>
+ message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *parent =3D ctx-&gt;part;<b=
r>
+-&nbsp; &nbsp; &nbsp; struct message_part *part, **list;<br>
++&nbsp; &nbsp; &nbsp; struct message_part *part;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(parent !=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+@@ -186,16 +189,27 @@ message_part_append(struct message_parse<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;parent-&gt;body_siz=
e.physical_size +<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;parent-&gt;header_s=
ize.physical_size;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; list =3D &amp;part-&gt;parent-&gt;children;<br>
+-&nbsp; &nbsp; &nbsp; while (*list !=3D NULL)<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list =3D &amp;(*list)-&g=
t;next;<br>
++&nbsp; &nbsp; &nbsp; /* add to parent's linked list */<br>
++&nbsp; &nbsp; &nbsp; *ctx-&gt;next_part =3D part;<br>
++&nbsp; &nbsp; &nbsp; /* update the parent's end-of-linked-list pointer */=
<br>
++&nbsp; &nbsp; &nbsp; struct message_part **next_part =3D &amp;part-&gt;ne=
xt;<br>
++&nbsp; &nbsp; &nbsp; array_append(&amp;ctx-&gt;next_part_stack, &amp;next=
_part, 1);<br>
++&nbsp; &nbsp; &nbsp; /* This part is now the new parent for the next mess=
age_part_append()<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;call. Its linked list begins with the c=
hildren pointer. */<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;next_part =3D &amp;part-&gt;children;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; *list =3D part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D part;<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+ {<br>
++&nbsp; &nbsp; &nbsp; struct message_part **const *parent_next_partp;<br>
++&nbsp; &nbsp; &nbsp; unsigned int count =3D array_count(&amp;ctx-&gt;next=
_part_stack);<br>
++&nbsp; &nbsp; &nbsp; <br>
++&nbsp; &nbsp; &nbsp; parent_next_partp =3D array_idx(&amp;ctx-&gt;next_pa=
rt_stack, count-1);<br>
++&nbsp; &nbsp; &nbsp; array_delete(&amp;ctx-&gt;next_part_stack, count-1, =
1);<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;next_part =3D *parent_next_partp;<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;header_size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part-&gt;parent-&gt;children_count +=3D=
 1 + ctx-&gt;part-&gt;children_count;<br>
+@@ -1062,7 +1076,9 @@ message_parser_init(pool_t part_pool, st<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx =3D message_parser_init_int(input, hdr_flag=
s, flags);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part_pool =3D part_pool;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;children=
;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
++&nbsp; &nbsp; &nbsp; p_array_init(&amp;ctx-&gt;next_part_stack, ctx-&gt;p=
arser_pool, 4);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ctx;<br>
+ }<br>
+ <br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-=
message-parser-Minor-code-cleanup-to-findin.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to=
-findin.patch<br>
new file mode 100644<br>
index 000000000..4e63509b4<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message=
-parser-Minor-code-cleanup-to-findin.patch<br>
@@ -0,0 +1,45 @@<br>
+From e39c95b248917eb2b596ca55a957f3cbc7fd406f Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:10:07 +0300<br>
+Subject: [PATCH 05/13] lib-mail: message-parser - Minor code cleanup to<br=
>
+ finding the end of boundary line<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 9 ++++-----<br>
+ 1 file changed, 4 insertions(+), 5 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036632806%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3D5sSTe2RwNfkTH3eo7FTWGddobLgH2ZiWoG833kCB%2BO8%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"RScP3wqzzxzReSbNVlxtrty=
kPI/WDrEOUp+M9R/+CTMhk3HLG3kPS81zEAsXfNdyCmabIsgv0kEXtVxwY05hlAlysPDa3ld32h=
ZltxE9udUx2Tm6Mi0ICqvEwCf9wcI+DTAY4J4Vba4DflO9gS47m9aASgjQ1ZYp5Yvi/hMB+OI=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index ff4e09e5a..6c6a680b5 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -260,17 +260,16 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* need to find the end of line */<br>
+-&nbsp; &nbsp; &nbsp; if (memchr(data + 2, '\n', size - 2) =3D=3D NULL &am=
p;&amp;<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size &lt; BOUNDARY_END_MAX_LEN &amp;&a=
mp;<br>
++&nbsp; &nbsp; &nbsp; data +=3D 2;<br>
++&nbsp; &nbsp; &nbsp; size -=3D 2;<br>
++&nbsp; &nbsp; &nbsp; if (memchr(data, '\n', size) =3D=3D NULL &amp;&amp;<=
br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size+2 &lt; BOUNDARY_END_MAX_LEN &amp;=
&amp;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!ctx-&gt;input-&gt;eof &amp;&amp;=
 !full) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* no LF found */<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;want_count =
=3D BOUNDARY_END_MAX_LEN;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; data +=3D 2;<br>
+-&nbsp; &nbsp; &nbsp; size -=3D 2;<br>
+-<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*boundary_r =3D boundary_find(ctx-&gt;boundarie=
s, data, size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (*boundary_r =3D=3D NULL)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-=
message-parser-Truncate-excessively-long-MI.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-=
long-MI.patch<br>
new file mode 100644<br>
index 000000000..1012d7983<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message=
-parser-Truncate-excessively-long-MI.patch<br>
@@ -0,0 +1,163 @@<br>
+From aed125484a346b4893c1a169088c39fe7ced01f3 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:53:12 +0300<br>
+Subject: [PATCH 06/13] lib-mail: message-parser - Truncate excessively lon=
g<br>
+ MIME boundaries<br>
+<br>
+RFC 2046 requires that the boundaries are a maximum of 70 characters<br>
+(excluding the &quot;--&quot; prefix and suffix). We allow 80 characters f=
or a bit of<br>
+extra safety. Anything longer than that is truncated and treated the same<=
br>
+as if it was just 80 characters.<br>
+---<br>
+ src/lib-mail/message-parser.c&nbsp; &nbsp; &nbsp; |&nbsp; 7 ++-<br>
+ src/lib-mail/test-message-parser.c | 95 +++++++++++++++++++++++++++++++++=
+++++<br>
+ 2 files changed, 100 insertions(+), 2 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036632806%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3D5sSTe2RwNfkTH3eo7FTWGddobLgH2ZiWoG833kCB%2BO8%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"RScP3wqzzxzReSbNVlxtrty=
kPI/WDrEOUp+M9R/+CTMhk3HLG3kPS81zEAsXfNdyCmabIsgv0kEXtVxwY05hlAlysPDa3ld32h=
ZltxE9udUx2Tm6Mi0ICqvEwCf9wcI+DTAY4J4Vba4DflO9gS47m9aASgjQ1ZYp5Yvi/hMB+OI=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 6c6a680b5..92f541b02 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -10,7 +10,8 @@<br>
+ <br>
+ /* RFC-2046 requires boundaries are max. 70 chars + &quot;--&quot; prefix=
 + &quot;--&quot; suffix.<br>
+&nbsp; &nbsp; We'll add a bit more just in case. */<br>
+-#define BOUNDARY_END_MAX_LEN (70 + 2 + 2 + 10)<br>
++#define BOUNDARY_STRING_MAX_LEN (70 + 10)<br>
++#define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
+ struct message_boundary {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *next;<br>
+@@ -526,8 +527,10 @@ static void parse_content_type(struct message_parser_=
ctx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;rfc2231_parse(&amp;parser, &amp;results);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;for (; *results !=3D NULL; results +=3D 2) {<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (strcasecmp(resu=
lts[0], &quot;boundary&quot;) =3D=3D 0) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; /* truncate excessively long boundaries */<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;ctx-&gt;last_boundary =3D<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; p_strdup(ctx-&gt;parser_pool, results[1]);<=
br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; p_strndup(ctx-&gt;parser_pool, results[1],<=
br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOUNDARY=
_STRING_MAX_LEN);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;break;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 1f1aa1437..94aa3eb7c 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -642,6 +642,100 @@ static void test_message_parser_no_eoh(void)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_long_mime_boundary(void)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; /* Close the boundaries in wrong reverse order. But =
because all<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;boundaries are actually truncated to th=
e same size (..890) it<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;works the same as if all of them were d=
uplicate boundaries. */<br>
++static const char input_msg[] =3D<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
9012345678901234567890123456789012345678901234567890123456789012\&quot;\n&q=
uot;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
67890123456789012\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
901234567890123456789012345678901234567890123456789012345678901\&quot;\n&qu=
ot;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
6789012345678901\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
90123456789012345678901234567890123456789012345678901234567890\&quot;\n&quo=
t;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
678901234567890\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;1\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
67890123456789012\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;22\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
6789012345678901\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;333\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
678901234567890\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;4444\n&quot;;<br>
++&nbsp; &nbsp; &nbsp; struct message_parser_ctx *parser;<br>
++&nbsp; &nbsp; &nbsp; struct istream *input;<br>
++&nbsp; &nbsp; &nbsp; struct message_part *parts, *part;<br>
++&nbsp; &nbsp; &nbsp; struct message_block block;<br>
++&nbsp; &nbsp; &nbsp; pool_t pool;<br>
++&nbsp; &nbsp; &nbsp; int ret;<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_begin(&quot;message parser long mime boundary&q=
uot;);<br>
++&nbsp; &nbsp; &nbsp; pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++&nbsp; &nbsp; &nbsp; input =3D test_istream_create(input_msg);<br>
++<br>
++&nbsp; &nbsp; &nbsp; parser =3D message_parser_init(pool, input, 0, 0);<b=
r>
++&nbsp; &nbsp; &nbsp; while ((ret =3D message_parser_parse_next_block(pars=
er, &amp;block)) &gt; 0) ;<br>
++&nbsp; &nbsp; &nbsp; test_assert(ret &lt; 0);<br>
++&nbsp; &nbsp; &nbsp; message_parser_deinit(&amp;parser, &amp;parts);<br>
++<br>
++&nbsp; &nbsp; &nbsp; part =3D parts;<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;children_count =3D=3D 6);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.physical_size =3D=
=3D 126);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.virtual_size =3D=3D=
 126+2);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.lines =3D=3D 22);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.physical_size =3D=3D =
871);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.virtual_size =3D=3D 8=
71+22);<br>
++<br>
++&nbsp; &nbsp; &nbsp; part =3D parts-&gt;children;<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;children_count =3D=3D 5);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.physical_size =3D=
=3D 125);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.virtual_size =3D=3D=
 125+2);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.lines =3D=3D 19);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.physical_size =3D=3D =
661);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.virtual_size =3D=3D 6=
61+19);<br>
++<br>
++&nbsp; &nbsp; &nbsp; part =3D parts-&gt;children-&gt;children;<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;children_count =3D=3D 4);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.physical_size =3D=
=3D 124);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;header_size.virtual_size =3D=3D=
 124+2);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.lines =3D=3D 16);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.physical_size =3D=3D =
453);<br>
++&nbsp; &nbsp; &nbsp; test_assert(part-&gt;body_size.virtual_size =3D=3D 4=
53+16);<br>
++<br>
++&nbsp; &nbsp; &nbsp; part =3D parts-&gt;children-&gt;children-&gt;childre=
n;<br>
++&nbsp; &nbsp; &nbsp; for (unsigned int i =3D 1; i &lt;=3D 3; i++, part =
=3D part-&gt;next) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;chi=
ldren_count =3D=3D 0);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;fla=
gs =3D=3D (MESSAGE_PART_FLAG_TEXT | MESSAGE_PART_FLAG_IS_MIME));<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;hea=
der_size.lines =3D=3D 2);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;hea=
der_size.physical_size =3D=3D 26);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;hea=
der_size.virtual_size =3D=3D 26+2);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;bod=
y_size.lines =3D=3D 0);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;bod=
y_size.physical_size =3D=3D i);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(part-&gt;bod=
y_size.virtual_size =3D=3D i);<br>
++&nbsp; &nbsp; &nbsp; }<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_parsed_parts(input, parts);<br>
++&nbsp; &nbsp; &nbsp; i_stream_unref(&amp;input);<br>
++&nbsp; &nbsp; &nbsp; pool_unref(&amp;pool);<br>
++&nbsp; &nbsp; &nbsp; test_end();<br>
++}<br>
++<br>
+ int main(void)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;static void (*test_functions[])(void) =3D {<br>
+@@ -654,6 +748,7 @@ int main(void)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_garbage_suffix_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_continuing_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_continuing_truncated_mime_boundary,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_message_parser_long=
_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_no_eoh,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NULL<br>
+&nbsp; &nbsp; &nbsp; &nbsp;};<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-=
message-parser-Optimize-boundary-lookups-wh.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-loo=
kups-wh.patch<br>
new file mode 100644<br>
index 000000000..eeb6c96f1<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message=
-parser-Optimize-boundary-lookups-wh.patch<br>
@@ -0,0 +1,72 @@<br>
+From 5f8de52fec3191a1aa68a399ee2068485737dc4f Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 13:06:02 +0300<br>
+Subject: [PATCH 07/13] lib-mail: message-parser - Optimize boundary lookup=
s<br>
+ when exact boundary is found<br>
+<br>
+When an exact boundary is found, there's no need to continue looking for<b=
r>
+more boundaries.<br>
+---<br>
+ src/lib-mail/message-parser.c | 26 ++++++++++++++++++++++----<br>
+ 1 file changed, 22 insertions(+), 4 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036642765%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3D0oQHK5%2FjpqwH7BvP3mAedGOyY6vJxuIZfPtdY6dfQ0g%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"ARwpTzDqS/KPPonhIEMWjH0=
4AZ+Mj0VJlWZf7OxSE+o+iTwrek6kBt5+P9HfVxNJgxRhQanzBd9p++JOe3wf0KiBGsoNAPwilg=
yXpqYDEF6zDQ0ZjIr/lG4oyur1HVFT5zt6UPo+pN3DwZayIdvUtg+vyCqeyAsFD3Q6JJk2QM4=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 92f541b02..c2934c761 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -80,8 +80,14 @@ boundary_find(struct message_boundary *boundaries,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;while (boundaries !=3D NULL) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (boundaries-&gt;=
len &lt;=3D len &amp;&amp;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcm=
p(boundaries-&gt;boundary, data, boundaries-&gt;len) =3D=3D 0 &amp;&amp;<br=
>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (best =3D=
=3D NULL || best-&gt;len &lt; boundaries-&gt;len))<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (best =3D=
=3D NULL || best-&gt;len &lt; boundaries-&gt;len)) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;best =3D boundaries;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; if (best-&gt;len =3D=3D len) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; /* This is exactly the wanted boundary. The=
re<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;can't be a better one. */<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; }<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;boundaries =3D boun=
daries-&gt;next;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+@@ -263,15 +269,27 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp;/* need to find the end of line */<br>
+&nbsp; &nbsp; &nbsp; &nbsp;data +=3D 2;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size -=3D 2;<br>
+-&nbsp; &nbsp; &nbsp; if (memchr(data, '\n', size) =3D=3D NULL &amp;&amp;<=
br>
++&nbsp; &nbsp; &nbsp; const unsigned char *lf_pos =3D memchr(data, '\n', s=
ize);<br>
++&nbsp; &nbsp; &nbsp; if (lf_pos =3D=3D NULL &amp;&amp;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size+2 &lt; BOUNDARY_END_MAX_LEN =
&amp;&amp;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!ctx-&gt;input-&gt;eof &amp;&amp;=
 !full) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* no LF found */<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;want_count =
=3D BOUNDARY_END_MAX_LEN;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+-<br>
+-&nbsp; &nbsp; &nbsp; *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, size);<br>
++&nbsp; &nbsp; &nbsp; size_t find_size =3D size;<br>
++<br>
++&nbsp; &nbsp; &nbsp; if (lf_pos !=3D NULL) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; find_size =3D lf_pos - d=
ata;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (find_size &gt; 0 &am=
p;&amp; data[find_size-1] =3D=3D '\r')<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; find_size--;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (find_size &gt; 2 &am=
p;&amp; data[find_size-1] =3D=3D '-' &amp;&amp;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data[find_=
size-2] =3D=3D '-')<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; find_size -=3D 2;<br>
++&nbsp; &nbsp; &nbsp; } else if (find_size &gt; BOUNDARY_END_MAX_LEN)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; find_size =3D BOUNDARY_E=
ND_MAX_LEN;<br>
++<br>
++&nbsp; &nbsp; &nbsp; *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (*boundary_r =3D=3D NULL)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
+ <br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-=
message-parser-Add-boundary_remove_until-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_u=
ntil-he.patch<br>
new file mode 100644<br>
index 000000000..4af070a87<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message=
-parser-Add-boundary_remove_until-he.patch<br>
@@ -0,0 +1,50 @@<br>
+From 929396767d831bedbdec6392aaa835b045332fd3 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 14:53:27 +0300<br>
+Subject: [PATCH 08/13] lib-mail: message-parser - Add boundary_remove_unti=
l()<br>
+ helper function<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 11 +++++++++--<br>
+ 1 file changed, 9 insertions(+), 2 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036642765%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3D0oQHK5%2FjpqwH7BvP3mAedGOyY6vJxuIZfPtdY6dfQ0g%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"ARwpTzDqS/KPPonhIEMWjH0=
4AZ+Mj0VJlWZf7OxSE+o+iTwrek6kBt5+P9HfVxNJgxRhQanzBd9p++JOe3wf0KiBGsoNAPwilg=
yXpqYDEF6zDQ0ZjIr/lG4oyur1HVFT5zt6UPo+pN3DwZayIdvUtg+vyCqeyAsFD3Q6JJk2QM4=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index c2934c761..028f74159 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -223,6 +223,13 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
++static void<br>
++boundary_remove_until(struct message_parser_ctx *ctx,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; str=
uct message_boundary *boundary)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;boundaries =3D boundary;<br>
++}<br>
++<br>
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *b;<br>
+@@ -364,10 +371,10 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (boundary-&gt;epilogue_found) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* this boundary is=
n't needed anymore */<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;boundaries =3D b=
oundary-&gt;next;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; boundary_remove_until(ct=
x, boundary-&gt;next);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* forget about the=
 boundaries we possibly skipped */<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;boundaries =3D b=
oundary;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; boundary_remove_until(ct=
x, boundary);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* the boundary itself should already be in buf=
fer. add that. */<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-=
message-parser-Don-t-use-memory-pool-for-pa.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool=
-for-pa.patch<br>
new file mode 100644<br>
index 000000000..aade7dc2b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message=
-parser-Don-t-use-memory-pool-for-pa.patch<br>
@@ -0,0 +1,169 @@<br>
+From d53d83214b1d635446a8cf8ff9438cc530133d62 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 15:00:57 +0300<br>
+Subject: [PATCH 09/13] lib-mail: message-parser - Don't use memory pool fo=
r<br>
+ parser<br>
+<br>
+This reduces memory usage when parsing many MIME parts where boundaries ar=
e<br>
+being added and removed constantly.<br>
+---<br>
+ src/lib-mail/message-parser.c | 48 ++++++++++++++++++++++++++++----------=
-----<br>
+ 1 file changed, 32 insertions(+), 16 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036652724%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DGRs5GCiBmuczWBA1M6QaLjiZvG3PLWVhs4LPoAU7LPk%3D&amp;reserved=
=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/d=
ovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"qRgHDFT3uN8ZknCzdhiZRDGc=
9FY74p8EVy+Od7MsAiq+dPI+KYu13pE7Bm51SjnEgSh4Gwjr1ESEa1m7Q4zo2hm2VeUlJ+tUtCy=
TO1cs0EmxU+EJ0UYWzgc5rlV48CUKSd1WBvmXuFJGoEAwmXmk0uDF9xUyUoA8ZYXDfVIW1Cc=3D=
" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 028f74159..8970d8e0e 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -17,14 +17,14 @@ struct message_boundary {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *next;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *part;<br>
+-&nbsp; &nbsp; &nbsp; const char *boundary;<br>
++&nbsp; &nbsp; &nbsp; char *boundary;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size_t len;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int epilogue_found:1;<br>
+ };<br>
+ <br>
+ struct message_parser_ctx {<br>
+-&nbsp; &nbsp; &nbsp; pool_t parser_pool, part_pool;<br>
++&nbsp; &nbsp; &nbsp; pool_t part_pool;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct istream *input;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *parts, *part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;const char *broken_reason;<br>
+@@ -32,7 +32,7 @@ struct message_parser_ctx {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_header_parser_flags hdr_flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_parser_flags flags;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; const char *last_boundary;<br>
++&nbsp; &nbsp; &nbsp; char *last_boundary;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *boundaries;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part **next_part;<br>
+@@ -223,10 +223,24 @@ static void message_part_finish(struct message_parse=
r_ctx *ctx)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
++static void message_boundary_free(struct message_boundary *b)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; i_free(b-&gt;boundary);<br>
++&nbsp; &nbsp; &nbsp; i_free(b);<br>
++}<br>
++<br>
+ static void<br>
+ boundary_remove_until(struct message_parser_ctx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct message_boundary *boundary)<br>
+ {<br>
++&nbsp; &nbsp; &nbsp; while (ctx-&gt;boundaries !=3D boundary) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct message_boundary =
*cur =3D ctx-&gt;boundaries;<br>
++<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i_assert(cur !=3D NULL);=
<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;boundaries =3D c=
ur-&gt;next;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; message_boundary_free(cu=
r);<br>
++<br>
++&nbsp; &nbsp; &nbsp; }<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;boundaries =3D boundary;<br>
+ }<br>
+ <br>
+@@ -234,15 +248,14 @@ static void parse_next_body_multipart_init(struct me=
ssage_parser_ctx *ctx)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *b;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; b =3D p_new(ctx-&gt;parser_pool, struct message_boun=
dary, 1);<br>
++&nbsp; &nbsp; &nbsp; b =3D i_new(struct message_boundary, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;b-&gt;part =3D ctx-&gt;part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;b-&gt;boundary =3D ctx-&gt;last_boundary;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;last_boundary =3D NULL;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;b-&gt;len =3D strlen(b-&gt;boundary);<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;b-&gt;next =3D ctx-&gt;boundaries;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;boundaries =3D b;<br>
+-<br>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;last_boundary =3D NULL;<br>
+ }<br>
+ <br>
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,<br>
+@@ -359,6 +372,8 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; struct message_block *block_r, bool first_line)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size_t line_size;<br>
++&nbsp; &nbsp; &nbsp; size_t boundary_len =3D boundary-&gt;len;<br>
++&nbsp; &nbsp; &nbsp; bool boundary_epilogue_found =3D boundary-&gt;epilog=
ue_found;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(ctx-&gt;last_boundary =3D=3D NULL);<br=
>
+ <br>
+@@ -391,7 +406,7 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i_assert(block_r-&g=
t;data[0] =3D=3D '\n');<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;line_size =3D 1;<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+-&nbsp; &nbsp; &nbsp; line_size +=3D 2 + boundary-&gt;len + (boundary-&gt;=
epilogue_found ? 2 : 0);<br>
++&nbsp; &nbsp; &nbsp; line_size +=3D 2 + boundary_len + (boundary_epilogue=
_found ? 2 : 0);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(block_r-&gt;size &gt;=3D ctx-&gt;skip =
+ line_size);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;block_r-&gt;size =3D line_size;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;parse_body_add_block(ctx, block_r);<br>
+@@ -553,9 +568,9 @@ static void parse_content_type(struct message_parser_c=
tx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;for (; *results !=3D NULL; results +=3D 2) {<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (strcasecmp(resu=
lts[0], &quot;boundary&quot;) =3D=3D 0) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;/* truncate excessively long boundaries */<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; i_free(ctx-&gt;last_boundary);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;ctx-&gt;last_boundary =3D<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; p_strndup(ctx-&gt;parser_pool, results[1],<=
br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOUNDARY=
_STRING_MAX_LEN);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; i_strndup(results[1], BOUNDARY_STRING_MAX_L=
EN);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;break;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+@@ -678,7 +693,7 @@ static int parse_next_header(struct message_parser_ctx=
 *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i_assert(!ctx-&gt;m=
ultipart);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;part-&gt;flags =3D =
0;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;last_boundary =3D NULL;<br>
++&nbsp; &nbsp; &nbsp; i_free(ctx-&gt;last_boundary);<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (!ctx-&gt;part_seen_content_type ||<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(part-&gt;flags &amp; MESSAGE_PAR=
T_FLAG_IS_MIME) =3D=3D 0) {<br>
+@@ -1081,11 +1096,8 @@ message_parser_init_int(struct istream *input,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum message_parser_flags flags)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_parser_ctx *ctx;<br>
+-&nbsp; &nbsp; &nbsp; pool_t pool;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; pool =3D pool_alloconly_create(&quot;Message Parser&=
quot;, 1024);<br>
+-&nbsp; &nbsp; &nbsp; ctx =3D p_new(pool, struct message_parser_ctx, 1);<b=
r>
+-&nbsp; &nbsp; &nbsp; ctx-&gt;parser_pool =3D pool;<br>
++&nbsp; &nbsp; &nbsp; ctx =3D i_new(struct message_parser_ctx, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;hdr_flags =3D hdr_flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;flags =3D flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;input =3D input;<br>
+@@ -1105,7 +1117,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;chi=
ldren;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
+-&nbsp; &nbsp; &nbsp; p_array_init(&amp;ctx-&gt;next_part_stack, ctx-&gt;p=
arser_pool, 4);<br>
++&nbsp; &nbsp; &nbsp; i_array_init(&amp;ctx-&gt;next_part_stack, 4);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ctx;<br>
+ }<br>
+ <br>
+@@ -1146,8 +1158,12 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (ctx-&gt;hdr_parser_ctx !=3D NULL)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;message_parse_heade=
r_deinit(&amp;ctx-&gt;hdr_parser_ctx);<br>
++&nbsp; &nbsp; &nbsp; boundary_remove_until(ctx, NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_stream_unref(&amp;ctx-&gt;input);<br>
+-&nbsp; &nbsp; &nbsp; pool_unref(&amp;ctx-&gt;parser_pool);<br>
++&nbsp; &nbsp; &nbsp; if (array_is_created(&amp;ctx-&gt;next_part_stack))<=
br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; array_free(&amp;ctx-&gt;=
next_part_stack);<br>
++&nbsp; &nbsp; &nbsp; i_free(ctx-&gt;last_boundary);<br>
++&nbsp; &nbsp; &nbsp; i_free(ctx);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(ret &lt; 0 || *parts_r !=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ret;<br>
+ }<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-=
number-.patch<br>
new file mode 100644<br>
index 000000000..ae5254466<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message=
-parser-Support-limiting-max-number-.patch<br>
@@ -0,0 +1,188 @@<br>
+From df9e0d358ef86e3342525dcdefcf79dc2d749a30 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 16:59:40 +0300<br>
+Subject: [PATCH 10/13] lib-mail: message-parser - Support limiting max num=
ber<br>
+ of nested MIME parts<br>
+<br>
+The default is to allow 100 nested MIME parts. When the limit is reached,<=
br>
+the innermost MIME part's body contains all the rest of the inner bodies<b=
r>
+until a parent MIME part is reached.<br>
+---<br>
+ src/lib-mail/message-parser.c&nbsp; &nbsp; &nbsp; | 43 ++++++++++++++++++=
+++++++++++++-------<br>
+ src/lib-mail/test-message-parser.c | 31 +++++++++++++++++++++++++++<br>
+ 2 files changed, 67 insertions(+), 7 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036652724%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DGRs5GCiBmuczWBA1M6QaLjiZvG3PLWVhs4LPoAU7LPk%3D&amp;reserved=
=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/d=
ovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"qRgHDFT3uN8ZknCzdhiZRDGc=
9FY74p8EVy+Od7MsAiq+dPI+KYu13pE7Bm51SjnEgSh4Gwjr1ESEa1m7Q4zo2hm2VeUlJ+tUtCy=
TO1cs0EmxU+EJ0UYWzgc5rlV48CUKSd1WBvmXuFJGoEAwmXmk0uDF9xUyUoA8ZYXDfVIW1Cc=3D=
" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 8970d8e0e..721615f76 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -13,6 +13,8 @@<br>
+ #define BOUNDARY_STRING_MAX_LEN (70 + 10)<br>
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
++#define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100<br>
++<br>
+ struct message_boundary {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *next;<br>
+ <br>
+@@ -28,9 +30,11 @@ struct message_parser_ctx {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct istream *input;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *parts, *part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;const char *broken_reason;<br>
++&nbsp; &nbsp; &nbsp; unsigned int nested_parts_count;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_header_parser_flags hdr_flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_parser_flags flags;<br>
++&nbsp; &nbsp; &nbsp; unsigned int max_nested_mime_parts;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;char *last_boundary;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *boundaries;<br>
+@@ -206,6 +210,8 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;next_part =3D &amp;part-&gt;children;<b=
r>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D part;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;nested_parts_count++;<br>
++&nbsp; &nbsp; &nbsp; i_assert(ctx-&gt;nested_parts_count &lt; ctx-&gt;max=
_nested_mime_parts);<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -213,8 +219,12 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part **const *parent_next_partp;=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int count =3D array_count(&amp;ctx-&gt=
;next_part_stack);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;<br>
++&nbsp; &nbsp; &nbsp; i_assert(ctx-&gt;nested_parts_count &gt; 0);<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;nested_parts_count--;<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;parent_next_partp =3D array_idx(&amp;ctx-&gt;ne=
xt_part_stack, count-1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;array_delete(&amp;ctx-&gt;next_part_stack, coun=
t-1, 1);<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;next_part =3D *parent_next_partp;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+@@ -592,6 +602,11 @@ static bool block_is_at_eoh(const struct message_bloc=
k *block)<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return FALSE;<br>
+ }<br>
+ <br>
++static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; return ctx-&gt;nested_parts_count &gt; ctx-&gt;max_n=
ested_mime_parts;<br>
++}<br>
++<br>
+ #define MUTEX_FLAGS \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;(MESSAGE_PART_FLAG_MESSAGE_RFC822 | MESSAGE_PAR=
T_FLAG_MULTIPART)<br>
+ <br>
+@@ -616,8 +631,12 @@ static int parse_next_header(struct message_parser_ct=
x *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;\n--b=
oundary&quot; belongs to us or to a previous boundary.<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this is a p=
roblem if the boundary prefixes are identical,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; because MIM=
E requires only the prefix to match. */<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; parse_next_body_multipar=
t_init(ctx);<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;multipart =3D TR=
UE;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!parse_too_many_nest=
ed_mime_parts(ctx)) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; parse_next_body_multipart_init(ctx);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; ctx-&gt;multipart =3D TRUE;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; part-&gt;flags &amp;=3D ~MESSAGE_PART_FLAG_MULTIPART;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* before parsing the header see if we can find=
 a --boundary from here.<br>
+@@ -721,12 +740,16 @@ static int parse_next_header(struct message_parser_c=
tx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i_assert(ctx-&gt;la=
st_boundary =3D=3D NULL);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;multipart =
=3D FALSE;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parse_next_=
block =3D parse_next_body_to_boundary;<br>
+-&nbsp; &nbsp; &nbsp; } else if (part-&gt;flags &amp; MESSAGE_PART_FLAG_ME=
SSAGE_RFC822)<br>
++&nbsp; &nbsp; &nbsp; } else if ((part-&gt;flags &amp; MESSAGE_PART_FLAG_M=
ESSAGE_RFC822) !=3D 0 &amp;&amp;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!parse_too_=
many_nested_mime_parts(ctx)) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parse_next_=
block =3D parse_next_body_message_rfc822_init;<br>
+-&nbsp; &nbsp; &nbsp; else if (ctx-&gt;boundaries !=3D NULL)<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;parse_next_block=
 =3D parse_next_body_to_boundary;<br>
+-&nbsp; &nbsp; &nbsp; else<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;parse_next_block=
 =3D parse_next_body_to_eof;<br>
++&nbsp; &nbsp; &nbsp; } else {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; part-&gt;flags &amp;=3D =
~MESSAGE_PART_FLAG_MESSAGE_RFC822;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ctx-&gt;boundaries !=
=3D NULL)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; ctx-&gt;parse_next_block =3D parse_next_body_to_boundary;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; ctx-&gt;parse_next_block =3D parse_next_body_to_eof;<br>
++&nbsp; &nbsp; &nbsp; }<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;want_count =3D 1;<br>
+ <br>
+@@ -1100,6 +1123,8 @@ message_parser_init_int(struct istream *input,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx =3D i_new(struct message_parser_ctx, 1);<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;hdr_flags =3D hdr_flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;flags =3D flags;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;max_nested_mime_parts =3D<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MESSAGE_PARSER_DEFAULT_M=
AX_NESTED_MIME_PARTS;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;input =3D input;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_stream_ref(input);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ctx;<br>
+@@ -1159,6 +1184,10 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (ctx-&gt;hdr_parser_ctx !=3D NULL)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;message_parse_heade=
r_deinit(&amp;ctx-&gt;hdr_parser_ctx);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;boundary_remove_until(ctx, NULL);<br>
++&nbsp; &nbsp; &nbsp; /* caller might have stopped the parsing early */<br=
>
++&nbsp; &nbsp; &nbsp; i_assert(ctx-&gt;nested_parts_count =3D=3D 0 ||<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i_stream_have_byte=
s_left(ctx-&gt;input));<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_stream_unref(&amp;ctx-&gt;input);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (array_is_created(&amp;ctx-&gt;next_part_sta=
ck))<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;array_free(&amp;ctx=
-&gt;next_part_stack);<br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 94aa3eb7c..481d05942 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -166,6 +166,36 @@ static void test_message_parser_small_blocks(void)<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp;test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_stop_early(void)<br>
++{<br>
++&nbsp; &nbsp; &nbsp; struct message_parser_ctx *parser;<br>
++&nbsp; &nbsp; &nbsp; struct istream *input;<br>
++&nbsp; &nbsp; &nbsp; struct message_part *parts;<br>
++&nbsp; &nbsp; &nbsp; struct message_block block;<br>
++&nbsp; &nbsp; &nbsp; unsigned int i;<br>
++&nbsp; &nbsp; &nbsp; pool_t pool;<br>
++&nbsp; &nbsp; &nbsp; int ret;<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_begin(&quot;message parser stop early&quot;);<b=
r>
++&nbsp; &nbsp; &nbsp; pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++&nbsp; &nbsp; &nbsp; input =3D test_istream_create(test_msg);<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_istream_set_allow_eof(input, FALSE);<br>
++&nbsp; &nbsp; &nbsp; for (i =3D 1; i &lt;=3D TEST_MSG_LEN+1; i++) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i_stream_seek(input, 0);=
<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_istream_set_size(in=
put, i);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; parser =3D message_parse=
r_init(pool, input, 0, 0);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; while ((ret =3D message_=
parser_parse_next_block(parser,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;block)) =
&gt; 0) ;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_assert(ret =3D=3D 0=
);<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; message_parser_deinit(&a=
mp;parser, &amp;parts);<br>
++&nbsp; &nbsp; &nbsp; }<br>
++<br>
++&nbsp; &nbsp; &nbsp; i_stream_unref(&amp;input);<br>
++&nbsp; &nbsp; &nbsp; pool_unref(&amp;pool);<br>
++&nbsp; &nbsp; &nbsp; test_end();<br>
++}<br>
++<br>
+ static void test_message_parser_truncated_mime_headers(void)<br>
+ {<br>
+ static const char input_msg[] =3D<br>
+@@ -740,6 +770,7 @@ int main(void)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;static void (*test_functions[])(void) =3D {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_small_blocks,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_message_parser_stop=
_early,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_truncated_mime_headers,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_truncated_mime_headers2,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_truncated_mime_headers3,<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-=
number-.patch<br>
new file mode 100644<br>
index 000000000..52848bf3a<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message=
-parser-Support-limiting-max-number-.patch<br>
@@ -0,0 +1,87 @@<br>
+From d7bba401dd234802bcdb55ff27dfb99bffdab804 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 17:09:33 +0300<br>
+Subject: [PATCH 11/13] lib-mail: message-parser - Support limiting max num=
ber<br>
+ of MIME parts<br>
+<br>
+The default is to allow 10000 MIME parts. When it's reached, no more<br>
+MIME boundary lines will be recognized, so the rest of the mail belongs<br=
>
+to the last added MIME part.<br>
+---<br>
+ src/lib-mail/message-parser.c | 14 ++++++++++++++<br>
+ 1 file changed, 14 insertions(+)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&amp;reser=
ved=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/doveco=
t/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"LQQ/W73lYJ2SyQOu4MMMi=
cBuzkzu5tldjavBS040bXcwCMavPN90LJ8B79/ppUHbNV1p1gl0UCO859jWPI0TGW4/W5p/AuIg=
VpvDwUHO/dRTHdm+lsY+QXP2zeYGwjR0aHHjhXMBzFJIkSRg4MQU+jdJQsSwwUxdIXV1/Tc8zgc=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 721615f76..646307802 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -14,6 +14,7 @@<br>
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
+ #define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100<br>
++#define MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS 10000<br>
+ <br>
+ struct message_boundary {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *next;<br>
+@@ -31,10 +32,12 @@ struct message_parser_ctx {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_part *parts, *part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;const char *broken_reason;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int nested_parts_count;<br>
++&nbsp; &nbsp; &nbsp; unsigned int total_parts_count;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_header_parser_flags hdr_flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;enum message_parser_flags flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;unsigned int max_nested_mime_parts;<br>
++&nbsp; &nbsp; &nbsp; unsigned int max_total_mime_parts;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;char *last_boundary;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *boundaries;<br>
+@@ -211,7 +214,9 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;part =3D part;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;nested_parts_count++;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;total_parts_count++;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_assert(ctx-&gt;nested_parts_count &lt; ctx-&g=
t;max_nested_mime_parts);<br>
++&nbsp; &nbsp; &nbsp; i_assert(ctx-&gt;total_parts_count &lt;=3D ctx-&gt;m=
ax_total_mime_parts);<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -296,6 +301,12 @@ boundary_line_find(struct message_parser_ctx *ctx,<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+ <br>
++&nbsp; &nbsp; &nbsp; if (ctx-&gt;total_parts_count &gt;=3D ctx-&gt;max_to=
tal_mime_parts) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* can't add any more MI=
ME parts. just stop trying to find<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;more bounda=
ries. */<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
++&nbsp; &nbsp; &nbsp; }<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;/* need to find the end of line */<br>
+&nbsp; &nbsp; &nbsp; &nbsp;data +=3D 2;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size -=3D 2;<br>
+@@ -1125,6 +1136,8 @@ message_parser_init_int(struct istream *input,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;flags =3D flags;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;max_nested_mime_parts =3D<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MESSAGE_PARSER_DEFA=
ULT_MAX_NESTED_MIME_PARTS;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;max_total_mime_parts =3D<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MESSAGE_PARSER_DEFAULT_M=
AX_TOTAL_MIME_PARTS;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;input =3D input;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_stream_ref(input);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ctx;<br>
+@@ -1142,6 +1155,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;chi=
ldren;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
++&nbsp; &nbsp; &nbsp; ctx-&gt;total_parts_count =3D 1;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;i_array_init(&amp;ctx-&gt;next_part_stack, 4);<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp;return ctx;<br>
+ }<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-=
Fix-handling-trailing-in-MIME-boundaries.patch b/meta-networking/recipes-su=
pport/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundarie=
s.patch<br>
new file mode 100644<br>
index 000000000..a81177d2b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-han=
dling-trailing-in-MIME-boundaries.patch<br>
@@ -0,0 +1,133 @@<br>
+From 0c9d56b41b992a868f299e05677a67c4d0495523 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 2 Jul 2020 17:31:19 +0300<br>
+Subject: [PATCH 12/13] lib-mail: Fix handling trailing &quot;--&quot; in M=
IME boundaries<br>
+<br>
+Broken by 5b8ec27fae941d06516c30476dcf4820c6d200ab<br>
+---<br>
+ src/lib-mail/message-parser.c&nbsp; &nbsp; &nbsp; | 14 ++++++++----<br>
+ src/lib-mail/test-message-parser.c | 46 +++++++++++++++++++++++++++++++++=
+++++<br>
+ 2 files changed, 56 insertions(+), 4 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&amp;reser=
ved=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/doveco=
t/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"LQQ/W73lYJ2SyQOu4MMMi=
cBuzkzu5tldjavBS040bXcwCMavPN90LJ8B79/ppUHbNV1p1gl0UCO859jWPI0TGW4/W5p/AuIg=
VpvDwUHO/dRTHdm+lsY+QXP2zeYGwjR0aHHjhXMBzFJIkSRg4MQU+jdJQsSwwUxdIXV1/Tc8zgc=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 646307802..175d4b488 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -75,7 +75,7 @@ static int preparsed_parse_next_header_init(struct messa=
ge_parser_ctx *ctx,<br>
+ <br>
+ static struct message_boundary *<br>
+ boundary_find(struct message_boundary *boundaries,<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const unsigned char *data, size=
_t len)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const unsigned char *data, size=
_t len, bool trailing_dashes)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct message_boundary *best =3D NULL;<br>
+ <br>
+@@ -89,7 +89,11 @@ boundary_find(struct message_boundary *boundaries,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcm=
p(boundaries-&gt;boundary, data, boundaries-&gt;len) =3D=3D 0 &amp;&amp;<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(best=
 =3D=3D NULL || best-&gt;len &lt; boundaries-&gt;len)) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;best =3D boundaries;<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; if (best-&gt;len =3D=3D len) {<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; /* If we see &quot;foo--&quot;, it could either mean that there<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;is a boundary named &quot;foo&quot; that ends now or there=
's<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;a boundary &quot;foo--&quot; which continues. */<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; if (best-&gt;len =3D=3D len ||<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; (best-&gt;len =3D=3D len-2 &amp;&amp; trailing_dashes)) {=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* This is exactly the wanted boundary=
. There<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; can't be a better one. */<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
+@@ -319,6 +323,7 @@ boundary_line_find(struct message_parser_ctx *ctx,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;}<br>
+&nbsp; &nbsp; &nbsp; &nbsp;size_t find_size =3D size;<br>
++&nbsp; &nbsp; &nbsp; bool trailing_dashes =3D FALSE;<br>
+ <br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (lf_pos !=3D NULL) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;find_size =3D lf_po=
s - data;<br>
+@@ -326,11 +331,12 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;find_size--;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (find_size &gt; =
2 &amp;&amp; data[find_size-1] =3D=3D '-' &amp;&amp;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data[=
find_size-2] =3D=3D '-')<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; find_size -=3D 2;<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; trailing_dashes =3D TRUE;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;} else if (find_size &gt; BOUNDARY_END_MAX_LEN)=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;find_size =3D BOUND=
ARY_END_MAX_LEN;<br>
+ <br>
+-&nbsp; &nbsp; &nbsp; *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size);<br>
++&nbsp; &nbsp; &nbsp; *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; trailing_dashes);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (*boundary_r =3D=3D NULL)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
+ <br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 481d05942..113454ea0 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -510,6 +510,51 @@ static const char input_msg[] =3D<br>
+&nbsp; &nbsp; &nbsp; &nbsp;test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_trailing_dashes(void)<br>
++{<br>
++static const char input_msg[] =3D<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;a--\&quot;\n&quot;=
<br>
++&quot;\n&quot;<br>
++&quot;--a--\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;a----\&quot;\n&quo=
t;<br>
++&quot;\n&quot;<br>
++&quot;--a----\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;body\n&quot;<br>
++&quot;--a------\n&quot;<br>
++&quot;Content-Type: text/html\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;body2\n&quot;<br>
++&quot;--a----&quot;;<br>
++&nbsp; &nbsp; &nbsp; struct message_parser_ctx *parser;<br>
++&nbsp; &nbsp; &nbsp; struct istream *input;<br>
++&nbsp; &nbsp; &nbsp; struct message_part *parts;<br>
++&nbsp; &nbsp; &nbsp; struct message_block block;<br>
++&nbsp; &nbsp; &nbsp; pool_t pool;<br>
++&nbsp; &nbsp; &nbsp; int ret;<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_begin(&quot;message parser trailing dashes&quot=
;);<br>
++&nbsp; &nbsp; &nbsp; pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++&nbsp; &nbsp; &nbsp; input =3D test_istream_create(input_msg);<br>
++<br>
++&nbsp; &nbsp; &nbsp; parser =3D message_parser_init(pool, input, 0, 0);<b=
r>
++&nbsp; &nbsp; &nbsp; while ((ret =3D message_parser_parse_next_block(pars=
er, &amp;block)) &gt; 0) ;<br>
++&nbsp; &nbsp; &nbsp; test_assert(ret &lt; 0);<br>
++&nbsp; &nbsp; &nbsp; message_parser_deinit(&amp;parser, &amp;parts);<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_assert(parts-&gt;children_count =3D=3D 2);<br>
++&nbsp; &nbsp; &nbsp; test_assert(parts-&gt;children-&gt;next =3D=3D NULL)=
;<br>
++&nbsp; &nbsp; &nbsp; test_assert(parts-&gt;children-&gt;children_count =
=3D=3D 1);<br>
++&nbsp; &nbsp; &nbsp; test_assert(parts-&gt;children-&gt;children-&gt;next=
 =3D=3D NULL);<br>
++&nbsp; &nbsp; &nbsp; test_assert(parts-&gt;children-&gt;children-&gt;chil=
dren_count =3D=3D 0);<br>
++<br>
++&nbsp; &nbsp; &nbsp; test_parsed_parts(input, parts);<br>
++&nbsp; &nbsp; &nbsp; i_stream_unref(&amp;input);<br>
++&nbsp; &nbsp; &nbsp; pool_unref(&amp;pool);<br>
++&nbsp; &nbsp; &nbsp; test_end();<br>
++}<br>
++<br>
+ static void test_message_parser_continuing_mime_boundary(void)<br>
+ {<br>
+ static const char input_msg[] =3D<br>
+@@ -777,6 +822,7 @@ int main(void)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_empty_multipart,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_duplicate_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_garbage_suffix_mime_boundary,<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_message_parser_trai=
ling_dashes,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_continuing_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_continuing_truncated_mime_boundary,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_message_parser=
_long_mime_boundary,<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-=
Fix-parse_too_many_nested_mime_parts.patch b/meta-networking/recipes-suppor=
t/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch<=
br>
new file mode 100644<br>
index 000000000..97068345f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-par=
se_too_many_nested_mime_parts.patch<br>
@@ -0,0 +1,32 @@<br>
+From f77a2b6c3ffe2ea96f4a4b05ec38dc9d53266ecb Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Wed, 27 May 2020 11:35:55 +0300<br>
+Subject: [PATCH 13/13] lib-mail: Fix parse_too_many_nested_mime_parts()<br=
>
+<br>
+This was originally correct, until it was &quot;optimized&quot; wrong and =
got merged.<br>
+---<br>
+ src/lib-mail/message-parser.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036662676%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DgpACJA0gDis8jXyJLni4kovu%2FkMiVNT%2BTbGWAm2QhHQ%3D&amp;reser=
ved=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/doveco=
t/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"LQQ/W73lYJ2SyQOu4MMMi=
cBuzkzu5tldjavBS040bXcwCMavPN90LJ8B79/ppUHbNV1p1gl0UCO859jWPI0TGW4/W5p/AuIg=
VpvDwUHO/dRTHdm+lsY+QXP2zeYGwjR0aHHjhXMBzFJIkSRg4MQU+jdJQsSwwUxdIXV1/Tc8zgc=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 175d4b488..5b11772ff 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -621,7 +621,7 @@ static bool block_is_at_eoh(const struct message_block=
 *block)<br>
+ <br>
+ static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)<br>
+ {<br>
+-&nbsp; &nbsp; &nbsp; return ctx-&gt;nested_parts_count &gt; ctx-&gt;max_n=
ested_mime_parts;<br>
++&nbsp; &nbsp; &nbsp; return ctx-&gt;nested_parts_count+1 &gt;=3D ctx-&gt;=
max_nested_mime_parts;<br>
+ }<br>
+ <br>
+ #define MUTEX_FLAGS \<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fi=
x.patch b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.p=
atch<br>
new file mode 100644<br>
index 000000000..44f6564f8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch=
<br>
@@ -0,0 +1,27 @@<br>
+From 1a6ff0beebf0ab0c71081eaff1d5d7fd26015a94 Mon Sep 17 00:00:00 2001<br>
+From: Josef 'Jeff' Sipek &lt;<a href=3D"mailto:jeff.sipek@dovecot.fi" targ=
et=3D"_blank">jeff.sipek@dovecot.fi</a>&gt;<br>
+Date: Tue, 19 Sep 2017 13:26:57 +0300<br>
+Subject: [PATCH] lib: buffer_free(NULL) should be a no-op<br>
+<br>
+---<br>
+ src/lib/buffer.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2F=
d%2Fdovecot%2Fdovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036672627%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DEtIjL4RJbjLXHSYszXnYHY%2BF5fvzsAQujWnvHZfBuqE%3D&amp;reserve=
d=3D0" originalsrc=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" shash=3D"XEC6U90S89BSA341y/I/gUC=
G240T5NwjInN5dFBtKl1Cp3lpb/NYVaqUclOcyqHnonC+52VMbqcpC8croMW5nKXhfqoHKyte7k=
pXSCv5ZV1Wgdo6Wtn0BlwuXSWg+J96QHhjnmeQJsTvKQLBnL67BK7fvtXAOllpmOkimv2RsHs=
=3D" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/=
pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+--- a/src/lib/buffer.c<br>
++++ b/src/lib/buffer.c<br>
+@@ -148,6 +148,9 @@ void buffer_free(buffer_t **_buf)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;struct real_buffer *buf =3D (struct real_buffer=
 *)*_buf;<br>
+ <br>
++&nbsp; &nbsp; &nbsp; if (buf =3D=3D NULL)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>
++<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*_buf =3D NULL;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (buf-&gt;alloced)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p_free(buf-&gt;pool=
, buf-&gt;w_buffer);<br>
diff --git a/meta-networking/recipes-support/dovecot/<a href=3D"https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb=
%2F&amp;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30=
f08d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6377377730366726=
27%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dsc28CFI8cABij7QBJWpxQydQ9NvR8XZpY2yaG=
N2XwGA%3D&amp;reserved=3D0" originalsrc=3D"http://dovecot_2.2.36.4.bb/" sha=
sh=3D"F31t0sW4Ux2F4yLYCgMMwWBPfjvKsfcM66nssrzfX8rj58a+WtvOF1KuL+Beqho1/ASYI=
3D4sIxCl2wE4sZnyeQFQJsJhgATgZfufLDYlxW6/qTI6TUj+sWN0oaxypLGWBqkcmKiZ7lJLhEu=
X97Zn62bhjF3Ta1e+r9TJ1DNRZI=3D" rel=3D"noreferrer" target=3D"_blank">doveco=
t_2.2.36.4.bb</a>
 b/meta-networking/recipes-support/dovecot/<a href=3D"https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb%2F&amp;da=
ta=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b31f6=
cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036682584%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000&amp;sdata=3DO1RxZ2%2Bkkkab2JR0uUCHQPfsr5hWACroAUx2oMnfnJk%3=
D&amp;reserved=3D0" originalsrc=3D"http://dovecot_2.2.36.4.bb/" shash=3D"ZT=
YVJpxWimXrECS2PY+8NMU6n7KydV+NU71dZvyicflLo6xEPKTDVtG4q7pNiPPkYmB6ydkumdv+4=
Q6GRMcj1Rf2qvNovwif1OUk/R+3oZo+8YeqoXnwyBQWnSlatiQcy0pphRob4Xqn3k2TFJQFd3k5=
0ms1+jq2ApNCbu1vLpg=3D" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2.36=
.4.bb</a><br>
index e21a94ad6..407604c81 100644<br>
--- a/meta-networking/recipes-support/dovecot/<a href=3D"https://apc01.safe=
links.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb%2F&amp=
;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b3=
1f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036682584%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000&amp;sdata=3DO1RxZ2%2Bkkkab2JR0uUCHQPfsr5hWACroAUx2oMnfnJ=
k%3D&amp;reserved=3D0" originalsrc=3D"http://dovecot_2.2.36.4.bb/" shash=3D=
"ZTYVJpxWimXrECS2PY+8NMU6n7KydV+NU71dZvyicflLo6xEPKTDVtG4q7pNiPPkYmB6ydkumd=
v+4Q6GRMcj1Rf2qvNovwif1OUk/R+3oZo+8YeqoXnwyBQWnSlatiQcy0pphRob4Xqn3k2TFJQFd=
3k50ms1+jq2ApNCbu1vLpg=3D" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2=
.36.4.bb</a><br>
+++ b/meta-networking/recipes-support/dovecot/<a href=3D"https://apc01.safe=
links.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot_2.2.36.4.bb%2F&amp=
;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7Ca3789b2666974e77d30f08d9b3=
1f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637737773036692539%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000&amp;sdata=3DIstkr9lJfE34LVBrjlpaIuEschXArHktrG8O5%2FJaje=
c%3D&amp;reserved=3D0" originalsrc=3D"http://dovecot_2.2.36.4.bb/" shash=3D=
"n5IH/Vt2cHL7v7S+z/0m+32pyNwtP6BWIKcafCNwfAdHdUK0D9McEN4s0N6xl5MwixWV38vNnC=
oeGjtHI+Q2jCsf8w6en5tE12eMT9X0vCMvsMBgZjIRyiaey3uZEi9qQi6KqhvTLAAnfT4svyjTG=
7dzJVCXAp8N0HhKw7xcIPA=3D" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2=
.36.4.bb</a><br>
@@ -10,6 +10,20 @@ SRC_URI =3D &quot;<a href=3D"https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fdovecot.org%2Freleases%2F2.2%2Fdove=
cot-%24%257BPV%257D.tar.gz&amp;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.co=
m%7Ca3789b2666974e77d30f08d9b31f6cc1%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637737773036692539%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D2juoHv19hqxGl7=
DDDut5251TTXhLbR7aqRmewfjALSI%3D&amp;reserved=3D0" originalsrc=3D"http://do=
vecot.org/releases/2.2/dovecot-$%7BPV%7D.tar.gz" shash=3D"Vi6d0XgKyy1MTNQbp=
p+O7xKgFyWuQWLFRbrX/sBPHuzXjovY/0nfNV/a+WWmsPiOvrYxqhqAjMr9BhpQymJkNvHQaGc1=
+HYT8cGAST6P94tG04nMbzV5j6ejjqjFuTrxhgcuilCpCgHyYYZX6wwG1SRfcNMGL70WYpeGHq0=
cUZY=3D" rel=3D"noreferrer" target=3D"_blank">http://dovecot.org/releases/2=
.2/dovecot-${PV}.tar.gz</a>
 \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://dovecot.service \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://dovecot.socket \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-doveadm-Fix-parallel-=
build.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-lib-mail-message-pars=
er-Add-a-message_part_finish-he.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0002-lib-mail-message-pars=
er-Change-message_part_append-t.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0003-lib-mail-message-pars=
er-Optimize-updating-children_c.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0004-lib-mail-message-pars=
er-Optimize-appending-new-part-.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0005-lib-mail-message-pars=
er-Minor-code-cleanup-to-findin.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0006-lib-mail-message-pars=
er-Truncate-excessively-long-MI.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0007-lib-mail-message-pars=
er-Optimize-boundary-lookups-wh.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0008-lib-mail-message-pars=
er-Add-boundary_remove_until-he.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0009-lib-mail-message-pars=
er-Don-t-use-memory-pool-for-pa.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0010-lib-mail-message-pars=
er-Support-limiting-max-number-.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0011-lib-mail-message-pars=
er-Support-limiting-max-number-.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0012-lib-mail-Fix-handling=
-trailing-in-MIME-boundaries.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0013-lib-mail-Fix-parse_to=
o_many_nested_mime_parts.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://buffer_free_fix.patch \<br=
>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
<br>
&nbsp;SRC_URI[md5sum] =3D &quot;66c4d71858b214afee5b390ee602dee2&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_--

--_004_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_
Content-Type: image/png; name="Outlook-drhpbotj.png"
Content-Description: Outlook-drhpbotj.png
Content-Disposition: inline; filename="Outlook-drhpbotj.png"; size=22485;
	creation-date="Wed, 01 Dec 2021 11:51:46 GMT";
	modification-date="Wed, 01 Dec 2021 11:51:46 GMT"
Content-ID: <ad1401d3-f314-4d16-afb9-ef59d35050a3>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_004_PNZPR01MB5278F620A63DD902F08C35C68F689PNZPR01MB5278INDP_--

