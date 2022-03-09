Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740A4C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:45:23 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.103])
 by mx.groups.io with SMTP id smtpd.web11.448.1646847920228620915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=jmzewgBa;
 spf=pass (domain: arri.de, ip: 40.107.15.103, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1tYoVfonLoudadDayyEx5gTypcmwNw//+BWBtz6EcS/c2YjpOmyyKdX5mxI+mNq6lAwHCbDBBIebs44gKgCXx2a35FwjYfJrkHbFUkC8egHgkbA0EY17edWI7TDpeFxn6oJZaCrC8lxdLYX/HnZvkSyGpcov4t+FUlu0goH9XKdXaXbzsnexGVLF6lPI8lfFYpG477w6M7rvCE6ypaXy1NW9P8fS+c/HCwdk5voqVyzwujCZm/1jcC++OLQFwGEwPdYzxlg/kqSY4gGU1ttP8R5/gEUPseZb3EOpRVjURa5djUaI5cuFZ73c3V9F+JczHQ1sQ6UMRzdGQwwX7SOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0kNWDxt6b39GDL7ECNPg1vhWgp3C9UeTr8cUrbgnsc=;
 b=nfRWEb1Usf8YTVoQTf9PCBcVFmce8Wd/wU9onZlypzM7E4Y93UP/Oi36VQsFbiXdwsi1oYMI0seE8NG0icSxFnHkfK+wYk0aOGQQ+ffv8jsWQZ1H9N7mYVDNrtFfQ8jNA6DTQaYznhcPpMgbJADZ99yTKxuwPKw+U98dkZFqynbuSowpMI11+MVdArd1fK0f3gzcyJbhAv4eu/Pz0WcZNuTqaykIXOkWZiqyGC5MLAhjXlQEj5vLEeFSqs0TW09BgEfcQxHzCLcPcL7wRjNdR9pxzTF3GoUlGLJm5GAXpqpmcd+l0R8es4+f/ef7z2G4OmJNSBlx/t6gWYis61490Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0kNWDxt6b39GDL7ECNPg1vhWgp3C9UeTr8cUrbgnsc=;
 b=jmzewgBaoHELUNrOeM7W9bS0h//DzFMzwO2aSwmGJRiU7kIGNzTeXPP9DuZ1EWg3BvmSjjk1b4pE0Z+1k6YXi02Q0oxplduPi+7zCqt1bMJUGO8Yg1+Q9YgPTIH5tO61uOQ3driXMI6GlCzJ5M5jZrL3R2YZuiYkOkw/UK9uJlg=
Received: from AS9PR06CA0331.eurprd06.prod.outlook.com (2603:10a6:20b:466::28)
 by AM0PR07MB4819.eurprd07.prod.outlook.com (2603:10a6:208:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.13; Wed, 9 Mar
 2022 17:45:17 +0000
Received: from VE1EUR02FT007.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::6b) by AS9PR06CA0331.outlook.office365.com
 (2603:10a6:20b:466::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 17:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT007.mail.protection.outlook.com (10.152.12.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 17:45:16 +0000
Received: from localhost.localdomain (192.168.55.52) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 18:45:16 +0100
From: Christian Eggers <ceggers@arri.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glib-2.0: upgrade 2.70.4 -> 2.71.3
Date: Wed, 9 Mar 2022 18:45:15 +0100
Message-ID: <3186329.44csPzL39Z@localhost.localdomain>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: 
 <CANNYZj8Bp8VoLctKQ7nYoSa80GTHoy8+ZYuHeHkH1m-=hKHJSg@mail.gmail.com>
References: <20220309161659.10526-1-ceggers@arri.de>
 <CANNYZj8Bp8VoLctKQ7nYoSa80GTHoy8+ZYuHeHkH1m-=hKHJSg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.55.52]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 053d9644-d653-49a1-e7ee-08da01f49277
X-MS-TrafficTypeDiagnostic: AM0PR07MB4819:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB4819D4424BC90F25F3203A36BF0A9@AM0PR07MB4819.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VSV3OMXj0JkZ2t3cvN+Y5DDTMa41XFLY8X5VcpjRvK6CZ06ZCzdn3bOgP0z7nQfpGC61m0ZzsFWdos2hxqbvvYgi/6UTF9/n5+CBumWFAY9uViwhEOz4qV4ZDrnQchUJvv7DKncRHiAtZi19T3+ZgYqUDI9J4sbY4TTiFirBl+4fr9LLeOy3PFrx9ROoLWJOY0HHXJToVKD/j+Il/ZVXjJvdl15/yZgMOF+XrTRLw50HY9ut1J+oKAJfy+ta9GhhxteqbS4rQE2vqnbsHN4EaJauULrZsWRk1NP2m4YL5DcitaXObNoQyqxhwPNMXKLEMBYzHd1ZSavjVqNkbwovEjMGOeVTthYhbvcsVQn8TUAd2A3YnX17tQXfJmM9EjoYODmyNjaz00BDRvwiEjtEqI94YfzD+WwA/XYF+woVSd1M+4eLUpkF0O289gUMzpjLP96cdJeaO+FzgpeeoYRLj1l/UZLJd6jtaNFZjWACNuaiI9pIvIy1kXtA7PwQOzlrwN+C8PhyK1CTp/9rueWgZ3x8E1LWKqtujzXAiSAiUXgz1G8tMfwO4b0JaI5iJlbQ/fjzOkZWN+XHCx7V81frP1R8GbM797OY7tdUoiuuXm855aULVS8MjJMlrS1HtXfx1Z684DVXJNkZV0sScK4VRlQ/NgHdRV/AyJb+wm1f6zqzmFrBqVE2XLvJ7UdonEtowhmsKOthcmJYDld9vp9pMtfvZ5tJBNDQ0yQNff7uTuZGwhYIUjZ0Ya47pqo8Mau9pKlPXaY3Y9OpFMvuZlxMaNFA4JYif/Oclt1lMYHR3UCQjcIuHBWGVASyM1+UyxIuHk5HiJepXDQm59sMHNq35cy10OYxnKhkhfDofUdlK7rsgW8sHMSAwiO9EPRGmR87
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(186003)(336012)(8936002)(5660300002)(16526019)(356005)(4744005)(82310400004)(426003)(966005)(316002)(55016003)(40460700003)(6916009)(36916002)(7696005)(86362001)(9686003)(26005)(81166007)(70586007)(8676002)(4326008)(70206006)(36860700001)(2906002)(47076005)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:45:16.6857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 053d9644-d653-49a1-e7ee-08da01f49277
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT007.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:45:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162986

On Wednesday, 9 March 2022, 17:52:49 CET, Alexander Kanavin wrote:
> 2.71.x is a development release, and should not be used. glib follows
> odd-even version scheme.
I already supposed something like this, but I didn't find any
documentation about GLib's versioning scheme... Would be nice if
there were some docs about that (particularly as the GNOME project
moved away from odd/even release ([1], search for "even/odd")).

regards,
Christian
> 
> Alex
> 

[1] https://discourse.gnome.org/t/new-gnome-versioning-scheme/4235



