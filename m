Return-Path: <eduardo.barbosa@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ED0C3DA7C
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 13:29:13 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.web10.17906.1672406944587454022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 05:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: eduardo.barbosa@toradex.com)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2104.outbound.protection.outlook.com [104.47.22.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-GZPtOpDvPC6t03R-5bd2KQ-2; Fri, 30 Dec 2022 14:29:01 +0100
X-MC-Unique: GZPtOpDvPC6t03R-5bd2KQ-2
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:52::13)
 by GVAP278MB0812.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 13:28:58 +0000
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::dce:f3f3:5035:f9f6]) by GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::dce:f3f3:5035:f9f6%6]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 13:28:58 +0000
From: eduardo.barbosa@toradex.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [OE-core][PATCH] systemd: fix SOURCE_DATE_EPOCH conflict with meta-updater
Date: Fri, 30 Dec 2022 10:28:26 -0300
Message-Id: <20221230132826.35918-1-eduardo.barbosa@toradex.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CP6P284CA0026.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:15d::18) To GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:52::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0767:EE_|GVAP278MB0812:EE_
X-MS-Office365-Filtering-Correlation-Id: 32aa1723-394b-4f81-83e9-08daea69ceb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: uV4cEMmy1e0IxvVmLj3ru16Eize//fOzaJ7Sv8N/ubIouqkbpyK7PdzxZB8BFbm12aFJbmXz/BQDlKTVnLKXj6imwE+6Bt/2ikNHPpUtE+n6HUE3RVeRDyRYA5OCr4VaHhoiPvGIZzruGwR5rgY01GNMHb3gG20hqmZehrZxRZgGzceBvfbToqI+FOECJI6irBKXAW33svF5iZ9f8awOREWqwnnh3uKMtvzLCp/zISEUAMoJ4Dwxscbndnc8lLNUpOLNGkH5qu7vL33ExC++W1y8fvIcqGo0YsgaOEaGe8k6Oyg7gBpQ0BDjse2Th0lXWU2fCQh3dWBh9vO1HtbK/d9SkC93IutVck+HLcEVOI/hz3+UTsEvQPyM7d0Vj9tXDq467MKOh53vdvVmvpNHt53eMvFcHy7s1gzMRhuiPHnnMgdkcoSXv/sUPFKrPB9VYV2P0zmcM+HF7WYL4cH90E8UrGV9GXMbRBrJZNSLJy//8r1fMDZvgfzpnc7z/OMMGm9pZgQ56AjcPq/C+lD/LS/gKXE6w54DzHQrdCU0fNTeg1H6483vcd668KrCnaeA4rcsBs8gKtvuhlfQa6mXM+g8b5GN0Hun5ICadZJhcb6wWih/0A4FD5VyFvx2BrpLq8J33ukiKVrjvhND3h1SyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39840400004)(396003)(451199015)(478600001)(2616005)(15650500001)(6486002)(52116002)(6916009)(36756003)(2906002)(316002)(6506007)(38100700002)(83380400001)(107886003)(86362001)(1076003)(6666004)(5660300002)(66556008)(66946007)(66476007)(8676002)(4326008)(8936002)(186003)(9686003)(6512007)(41300700001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pSIDqcmXF7lrzWFNrO3javfv88mMw4FWpoKVJ8NcStxbNDjTiXqBKwkHFsQc?=
 =?us-ascii?Q?8+1xvaj6ELdBX2S4Rq3DLEFdzGMmyFkQ3t2mYJLsepCmRLOshMpQ2s4z4vZT?=
 =?us-ascii?Q?p6EDuK0uRQAGTm00ySpw/I2Bf0xgzHl9e6oK6lc2DkA1OOmTYqQGfc4Y68g5?=
 =?us-ascii?Q?ayv0V0Rs2dFUujVsTmB79pyP3dhVMvqnjopQlYkgKkCnX1YlDfVX+1apa4eA?=
 =?us-ascii?Q?kluTw8lLvhC6h4ugrqR75Yk0n8uksnZdrz89z3hXKfPFA8xYfMSASsg3bWSf?=
 =?us-ascii?Q?ALc4RRhrjmHvS/cFVjIVQOaUXFV957f9VNu1VnvGX7L9piPzinGHBuboVFln?=
 =?us-ascii?Q?p+1h5QCrUQZG63f6HoRilOUr5Tm9waO2XRsAfJWWikYW6XKtbpW36yZfes9H?=
 =?us-ascii?Q?33uQh0qbn6PUZajjfumHqkWffyU5J5HZs65WgN/OAERhsULimJLnm6rjzcVa?=
 =?us-ascii?Q?helm61roxjuPENL9CU3yIyOFUWPtlJxUVf8N4E6mydZI6058UzYcithLpwL5?=
 =?us-ascii?Q?pr/kb5jqeJQh4sdFeop9UwyR7TduiOUT4kxIL4m5DzxBAqb4Ak3zhlKrVJhO?=
 =?us-ascii?Q?6AnUf1jjM9q5XNg7SvfB4T0t8xotN8+Safd/L5dn1M/b9ycmuNKB5BEjMp85?=
 =?us-ascii?Q?zoP7ryO4/mECFDlkl4gxuSnoBplNzr+nAlfAG+i8uoshAikI9w8kRWjDabrV?=
 =?us-ascii?Q?hCpdD0S95WkhvyL9QXRpWkwbrvpnlcSBv2Ka0ecRfsq2i4xzavQe6AjhlpNJ?=
 =?us-ascii?Q?BCoY2Eez8Q6fQ0R7KyCjzxae1hxzR8sCbfnaVltEExxuvgHkYxUhqEWR4xfH?=
 =?us-ascii?Q?uSyPhOUQGm4JIlQE82v0ZVgCHdHwvB27wIpMUDyuZum1s+vbZFCBHI28Bekt?=
 =?us-ascii?Q?kVvRRU+bHtKZTGJHonih3ZreeflahoBbv27/ZLsjTMvtLiR4RfJJIuKwMOkB?=
 =?us-ascii?Q?PUmY73zeSiqXzPRquQxu9K+7nOZPSV+PyR1K+gx1UH37NYiI72qqen6E1tSN?=
 =?us-ascii?Q?OZ0QuEL98Tte/Nn/U1NiI2Td6KGN2BvWHkPle9/0nz0tr+RbRT10KeiuGXS4?=
 =?us-ascii?Q?MX2OYJvSs4uRySCLUUFEvy2NLV7qDsBs+ZvXUpeDnll7/ktbc82pkB3OAQMN?=
 =?us-ascii?Q?MMbyVesami6hz4+yvVmWYEPFG8aqC+sZRrYFAx7HzDLUbI1txNrDrq68g8aW?=
 =?us-ascii?Q?TQYhR05DKnDfxacptmmurpB5iamx3OSr0Tru7wlQYtKPcxU6/lsMoO/X1tuV?=
 =?us-ascii?Q?nVB1bdtPcVpybyyME6lpz8sdq0AwdqgDwgqUxtVRk0QYSLekMewg2+iQpRZj?=
 =?us-ascii?Q?T5Jxp/7+P2Lc33AIeyLktgpNUOjpGzzUahM1p8rPOPcR8mDHT+gIxnfae71n?=
 =?us-ascii?Q?X/7eNPVO7lgPNrwRsvQFJJvPq/YBDtHKPkmja+ni8Gz+jOmLaW0iWnDUPuEk?=
 =?us-ascii?Q?j9yDGhITjTNUnjwqDTKq77vLPJEwmV5PqK+IbAbOu53Icsxc4jQU1sNGoAHa?=
 =?us-ascii?Q?UIYO2vGAIxm35OQDqW6sQNVff6wjkly8k3MUmvfWtu4YWeLkjy0ZLd7ZskNu?=
 =?us-ascii?Q?4OXZPvm90Jr5fvI9m4zgCEztV7mAU+2beWkcmrmW4Ix+J9PjEIzW9oKvz7pA?=
 =?us-ascii?Q?yfub4hmVgSZR+IixQJRJd1IEh74/v8IzzD/dFUAv04QhBvEC1uex+T3ckOJm?=
 =?us-ascii?Q?MiLxJw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32aa1723-394b-4f81-83e9-08daea69ceb0
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 13:28:58.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jZXlkfq2i+fZ6yFT9ozxV7srDA217yAG7+p4/vd8jPt9m52vb32N4tjmn4PTdxpE7rpmla9kG+8pw5ZJdzV14MllvpVDBQoEpfyUG8ojAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0812
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 13:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175139

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

When we use the 'meta-updater' layer, we get a conflit on
SOURCE_DATE_EPOCH variable. where sota.conf.inc exports,
globally, SOURCE_DATE_EPOCH=3D0.

This ends up in systemd's TIME_EPOCH constant, that is used
clock_apply_epoch function to determine the difference to the system's
clock. And since there's a big jump we get the following error message
while booting up:
  systemd[1]: Current system time is further ahead 15y after build time, bu=
t cannot correct: Invalid argument

So, instead of creating a function to read the environment variable, we
can call get_source_date_epoch_value directly, since this is the way the
variable SOURCE_DATE_EPOCH is populated inside the recipe.

And, this way, SOURCE_DATE_EPOCH can still be used. If the packageconfig
is not used, '-Dtime-epoch=3D0' will be passed and when time-epoch <=3D 0,
meson build script will read the value of SOURCE_DATE_EPOCH before
trying to calculate the timestamp via git or by stating the NEWS file.

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core=
/systemd/systemd_252.4.bb
index eb6f5ecc17..e63b2bb681 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -191,10 +191,7 @@ PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysus=
ers=3Dfalse"
 PACKAGECONFIG[sysvinit] =3D "-Dsysvinit-path=3D${sysconfdir}/init.d -Dsysv=
rcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D,,systemd-co=
mpat-units update-rc.d"
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
-def build_epoch(d):
-    epoch =3D d.getVar('SOURCE_DATE_EPOCH') or "-1"
-    return '-Dtime-epoch=3D%d' % int(epoch)
-PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
+PACKAGECONFIG[set-time-epoch] =3D "${@get_source_date_epoch_value(d)},-Dti=
me-epoch=3D0"
 PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
 PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
 PACKAGECONFIG[usrmerge] =3D "-Dsplit-usr=3Dfalse,-Dsplit-usr=3Dtrue"
--
2.34.1


[Toradex Logo] <https://www.toradex.com/>       Embedded Computing
Made Easy
Choose Us<https://www.toradex.com/how-to-choose-system-computer-on-module-p=
artner> | Products<https://www.toradex.com/products> | Developer Center<htt=
ps://developer.toradex.com/> | Community<https://community.toradex.com/> | =
Careers<https://careers.toradex.com/>
Join our webinar:<https://www.toradex.com/webinars>
- Implementing Power-safe Atomic Over the Air Updates | January 20, 2023: R=
egister<https://www.toradex.com/webinars/implementing-power-safe-atomic-ove=
r-the-air-updates>

Meet our engineers at:<https://www.toradex.com/events>
- Embedded World | Nuremberg, Germany | March 14-16, 2023


