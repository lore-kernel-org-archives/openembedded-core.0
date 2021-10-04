Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25E2C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 13:29:17 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.92.72.105])
 by mx.groups.io with SMTP id smtpd.web11.9352.1633354156547385200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=tNGwAzVl;
 spf=pass (domain: outlook.com, ip: 40.92.72.105,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9rvAppFd+aR+9v22snf4kJL5yzgFbjcjuk9VHA3kyQhgsaMhq1BhUuB1e4L4/ggBJoknW8abuKk5NKHC2kp+T7hEZpa38Dv62BxJHzfbz9e3HP+rk0A3ERvipmXGFhPMoyDtqil/Rr/hQMHM0prMtzRfa57p8yO5lX7xm/qJbv+LRsY9pn0D+iDwvnwtqG43iCdF4VFI9OjN9zjVSkdMrZsAoZOtcOGSH3LNhd8z1khbKeeWVLQPv4hNFTrZ5UZrjt+Rwecn38xTnYKB1cLgTgKWW8zVaA9vglf9yUYYYjhIJMjtmpZF8OFusKv7YeWoMAu9SZtfPnvIWbwdgnNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmdS9B5EVZ2S63+uGYhKxdmi7gCvYUUiMnnGbRIjlmg=;
 b=aIQ7GGAw4pp5Kn2Nc0aV+ZrEANU9PqmctXoDb27p9CZOIzmlPv64xPdgdjA7PY/YDMI3IjrOARX8//bjtBHL9OB9QtPwEbBR9sQZU9gbHBaqyZ6pddwzjhCO3h7NtE8OdS9FZSq+wlgPVU3vJ4Nwqk3mRVjNcWBMYgDpJUj6KPL4pFGOsOxsuueRpdTek9bMWgUmMkWLKRileLT85P6N2MyZ9AfB+bntdREc7BYh6QgKX0zoTMtrAGGcXQGRd2JD+AFJy88sf6QwSAccO/2p7vtNN2a7FPwu+IbIPhJtedxZb5OALLNnkGM0mMHYbUzB249BmRMdL6qzrijoRj/PoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmdS9B5EVZ2S63+uGYhKxdmi7gCvYUUiMnnGbRIjlmg=;
 b=tNGwAzVlFypPOpUtjzxBO9+A31OgCJdT/Teij/4g4Lgr8Itu385AEPyoKxu758uYvGEPhcHW6WyvxalE5OMbhWh3pIYBSWq+qervHtBCqs2zREsHRjF4KYquRrHwh/cK70D+DRYG+Jco7Dgo/+obixPRXXM5TYzSU5UDQdKoQm4EUohTO9Agjkw3EzqVH4undC2Z0pRM9ZlK+JgE7joNoTTw7yL15gaZJ3q5s80EhvLQjbG1kGEA+l+IrWxGlQmI+jmTn7niMGydtwO706Z78Lc9lAPTnuVOeq8RPOPupvkH0IbZPnU1yPKX9wxEEpiLCvimK9kaS6V85PIP7lrUqg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2770.eurprd09.prod.outlook.com (2603:10a6:208:128::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 13:29:14 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:29:14 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 3/3] update-rc.d: fix append in DEPENDS
Date: Mon,  4 Oct 2021 15:28:53 +0200
Message-ID: 
 <AM9PR09MB46420CA5C827065A7E8AA58CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004132853.30543-1-kweihmann@outlook.com>
References: <20211004132853.30543-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [jE4vX7j+T1PhKo7hF1clv8svyreC091x]
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211004132853.30543-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (46.114.34.242) by
 AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21 via Frontend
 Transport; Mon, 4 Oct 2021 13:29:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc0b3da-895e-4e44-611e-08d9873af550
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj1Qpq0GWH60nyUjKXh22irfpRdoqP1ZrbdknfUjRvosCLBwghyIBz6Qw+ylnfM9rT89dQk8C3vE2X3cB04q4ov1nZgmbiupMW69FuiDfH0czkvlATxO//AZi8UThliCN2BIyu5c3qXjA3a8tRSXFH57d0kmJouN/n19vh+XsiXy2OcIdOHdAMvW4o+magREmX/1XqXNdAI1+B5AvEFvtVuzbtfUZCbwKRBrgPehnlS2Z5ySJT+UQlAnY+rvNCkPsJEc+pr6m3WQqtjNrbkkhru08vMAqeDD3VvkPNJr3WRmNCHUTgkmGn5QFFrKFnzcmV5M7/N/1CG/ff9xK+9jK3nbUR1ocEAFHgEtcK7ffzVWvgiPrauvdOesf+Y0X4uyTLVz3i/qYABqBwM83Hp9ht76PxxCKLpgQnfTs+lGvgW0Ec03L13n31W365pmJzZ+TbRRAkOnXvghFFXO5+CPizh0a6ptGppvCrK5qche1EZgAydig0J7ySKUxc02nlcMGAbj8LX2Cnc1vADB8gAmipHYTVAT+aYTU09l9Zd30cXT5Q0xjyD07vUi2aVQlYSHyw46q+AQCPxJmpF6zkgVqrpNf7P4ClsAo31cI5BVz3ocumSa6Holch22suLGo/CAbiskitnbfv80lIeX2dANMe+FONGzW9JFJm7W4XvWo0d1NBgP/YbtFNzcMZRErjzEyE4xFQl8y/QQcw==
X-MS-TrafficTypeDiagnostic: AM0PR09MB2770:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H0HvO6VRJLlfoDIHDHSgi/xIzVTgxnbHw9PqQVQy2iVVBdJJiagnYopw+oWEomY76xjhmW8jYt6af02AINO0RnEGjldSu9/sISIuuPyHuUK5bhi4Wtec9JseenEeXMqyv49syaJepDmGS9jnNObp9P7vGJmQ27tU4tzTk7mq/z1+IC+QZwpFQhNdzZmon7DXWiKz13KSN6HfF5q8UukdiAnZt9+AQnNgBDnh68qu8Snu1E8Y09UWpv6dbWqN21p5Kbl+4UbI74nzwuvbUqcQMJbXrN5wTIVishWiRtoXNEvb059F2Bz5kkiopX8ff9ZUXZ63jsdh6I2lp/iLco8LvgCc1iqTCokE0QlPWLOhuvb4jn8CYOh1ONja/qHGDeTNvpBVwFCdyiGVNUhgS8XhBMD3dMT71R+tgqBnWUQvd6QJnOW0PSEILtXQuYGVz9Re
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Cg7wMhNGJpbc7bNXoE5UVwMDEFEOPzM3BRK0yH8nBk1u6+KfP89LEUxCOsYUZ+XKQKACWFtmprU5WOIJ7XeD8/tT/gWiyPCoHaRRBBD7UPX+dBsGJh029yMieKbw2JXmZGu0s1rHUCSkn/OWAjN4jw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6fc0b3da-895e-4e44-611e-08d9873af550
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:29:14.6201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 13:29:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156589

fix the append with a leading blank, otherwise this messes up
DEPENDS when globally inherited classes add dependecies of their own

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/update-rc.d.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bb=
class
index 0a3a608662..921df98584 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,6 +1,6 @@
 UPDATERCPN ?=3D "${PN}"
=20
-DEPENDS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
sysvinit', ' update-rc.d initscripts', '', d)}"
+DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', ' update-rc.d initscripts', '', d)}"
=20
 UPDATERCD =3D "update-rc.d"
 UPDATERCD:class-cross =3D ""
--=20
2.25.1


