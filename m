Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A98CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:19:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152041.1781608765716737026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 04:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WlP4bU3k;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WlP4bU3k;
 spf=pass (domain: arm.com, ip: 40.107.159.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SZVf3MkM+p8U5ultNmMnZviyfnVMcoyrUwzXrsxqP73RbZGZ00FzIpzOseT/+JTCAk9XIsHgnHaKA+GQ1dINNUCmm5H5kl0JQCIvM9jjkSHuebroS6u0JmbUZF5lTBzMRBaRPoIk4/+DZLhnu/jYduVg2oJe5ZNePUYJ0aGYK9srPuiBLthCy25yfs9yT8i68HBtC6olIcHtnAcX+sDD/3gKZ6F+OATsueipgoLiuISfFJVvjHJ0uZVPsynBo6HVdKBk6smUgoRmknqJqKtfoPYo4tS/pDVCYqF5b8bawEan+j3+TXmyluXRZnbZFfHgEci+A3UYyu5ygb5V7nCVUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyooHUbVL5vJPdLZidC7dhE/P3ocIxEN2LF82i95Cos=;
 b=uQPPEhX1+POL4RGRx+f27CICh0EaaCyUPn29ub+kmWomIFYfKB7HaFFx3y0Y2Lbuw9DYW/d++KfKxtnrKiAS9R0r/a1h98IitbGy30lHFn9JNQ9hF5kAjC5FaL36468m3UAHUba68xEAS42ae7kY+stLIueZAFyS301euEhjjxMJ5fRkVnoe1hUN9ACCgooIdlJenKqo4fg9mRmqF3xmMcRi/+IrhuySsrL1GCBqWFurLGa/E3RFokqQv38UH2xzCCCR0OSDL9K1IH/FPSALGnv/QHhABWX0RcktprItxtbw31W21MAtzZOH4O/Jxwg4VKi1Ol/u75mmfgxt9fnqkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=smile.fr smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyooHUbVL5vJPdLZidC7dhE/P3ocIxEN2LF82i95Cos=;
 b=WlP4bU3kK7Rnhv5tBG/5T+W+q6z+tqRkJnIBq+sRTfJrgjQMMC/kzbbhb9B0zhCKG58iyICM2IHvt7PuHCoSYN14DOoh6kv7Du2hdrqeLjntz6ICwaEJQ0Zi7eZxvUjGjBFA2W5RWrRucuAkK4BMb6cmlFqN9H01CAT2M4fdQCk=
Received: from AS9PR06CA0073.eurprd06.prod.outlook.com (2603:10a6:20b:464::17)
 by MRWPR08MB11805.eurprd08.prod.outlook.com (2603:10a6:501:9a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:19:19 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:464:cafe::97) by AS9PR06CA0073.outlook.office365.com
 (2603:10a6:20b:464::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 11:19:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Tue, 16 Jun 2026 11:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm1B3qUSlIpUhQULw5pyfjzHkTaP/CC/gec8Fbr5jIP85ToSVm/OpOG1eAiRBk96nQ8I1GQou9a7GUBEwJRHhfC0YieTbKTOwVVb3LBRf30mv/oX7BowJqrb8cDX1gaz4LDom52NnTQTW3vDEgqJLn6CvZ5w58jqVQV4fbxFARRMaQoKA7mrhfPUneWuoNt/oY2HU+2Vdb4/O569Yqhv5U+mbkdiyBld/wOjCo2DLUqJ+rvsnpfpJbCmAxexPJei5nP7ME25vuQflH22VHAuiVEEkRBBxMtyfzDfe2Ulj4r3EL8OKGNGVFda3n1avIbOCUbTb2/Wcjo9SWy2MxmIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyooHUbVL5vJPdLZidC7dhE/P3ocIxEN2LF82i95Cos=;
 b=oNxiycxMkIFo0fe8FachBxyzIKQuVYUYlosQ4uaCM2k0hueVELbz+piC93SPLE09VUljj95Hp7nBImqqY7gr7gQdNIHwzSeHY/7pkdxLpiIpXsRvZ+A4mNKppzRGwZhcxa4tLlA8xWsXkagT2Q8NP9sqlB+848UHStdTMbwV9Nle4l+7zmrTwhbGOIkBc/d2NgWrVvuoB6xoJJQLbMDgkZzkbCkBUJQaEGH29DP9X1Q4CiwiUkeo/UGbuq0fzcoN4MHMSCFNq7STcJfZhssUy4xoy3sJrfALwVpF1b0+0eLu1aRjM6AD+F7dn3/RQowoFLYMr6CAeFDJ+LSAeK4Alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyooHUbVL5vJPdLZidC7dhE/P3ocIxEN2LF82i95Cos=;
 b=WlP4bU3kK7Rnhv5tBG/5T+W+q6z+tqRkJnIBq+sRTfJrgjQMMC/kzbbhb9B0zhCKG58iyICM2IHvt7PuHCoSYN14DOoh6kv7Du2hdrqeLjntz6ICwaEJQ0Zi7eZxvUjGjBFA2W5RWrRucuAkK4BMb6cmlFqN9H01CAT2M4fdQCk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI0PR08MB11449.eurprd08.prod.outlook.com (2603:10a6:800:2ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:18:15 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 11:18:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libinput: upgrade 1.30.2 -> 1.30.4
Thread-Topic: [OE-core] [PATCH 1/2] libinput: upgrade 1.30.2 -> 1.30.4
Thread-Index: AQHc/YGo9wEBOSUzb02dgQ3TlRLdi7ZBCJeA
Date: Tue, 16 Jun 2026 11:18:15 +0000
Message-ID: <403067FE-DF56-41BD-90AE-C6646A94928B@arm.com>
References: <20260616111643.4091790-1-ross.burton@arm.com>
In-Reply-To: <20260616111643.4091790-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI0PR08MB11449:EE_|AM1PEPF000252DE:EE_|MRWPR08MB11805:EE_
X-MS-Office365-Filtering-Correlation-Id: 145a659e-2ce7-4bb7-5c49-08decb991b77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|4022899009|366016|1800799024|56012099006|6133799003|11063799006|3023799007|22082099003|18002099003|38070700021|13003099007;
X-Microsoft-Antispam-Message-Info-Original: 
 xq5vMczPSmKaCIplCyIigEx5oqYBqIPGqk8em6Q36QbnR+TVSXk7YV/rd2/wnVqfq5WbK/4Eh8SSSlan90nI94gUHZ6PcWZrsq2E8OzUxCpB/b821a+oGfwP7LKUXDFfIDhTtQRZ0T+xGxXvR0OjebR4BRIJUgboa03uESJfTjBCI5aWgBUQ0VPDFB+UJ+eNGZnwxn+DjvF2uUOqmG3X579kA932DMHd6N9Lk1m1i01Ynw3/0Yam+Ur75QsdIIlxdS8koyt6rgVC2zW0jriZ5rYSvr/CO0SXxx9GbwbNOWN0TMhBB7fjTe2tVNqW0jGEhx+cyTtOqRPcGhNDoMYvjxmap7C8Y0ltZq4oWLEhsyRzUu+LhK+G4eKuwCDig7UFV5dQJdhjx71wjibRK4XaL1tGkHCw8kywYmw6S/mLLVuh0KS6eeL+YryIqxMrpFqcNR/Y1zSQUxLnWAw8Vp0pjUYLAehiyP9z4qNEeWZRZbl6PLUwkJHPrKQUChd9tckkWNugoCMRgfRR4iCU1NoRD2Hv5R6o5EX0kGCg9tcSsdlsluCZ9Oa5RwnTgcDfzuA4Rps3ej5R9yzOZ4CzSJYb+CzsAc0x9olXjuiwGKFbtlxOxGvoqF4tLmB1fZgTTK33TwAuCQJcEl9gIb09NMx8wf4njHaPs5pvi04E8Jb2f+AYepblElSXgnJqVIg1oRMj
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(4022899009)(366016)(1800799024)(56012099006)(6133799003)(11063799006)(3023799007)(22082099003)(18002099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40068430E1CE1443994207C335E55339@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 rbm0MBJsAi1pf2brdT0U/BEHBdM6Pf8IA6hwYWdTuI+YrxpuIANp5RfNQWHYxfu9DsyInhcPrAyAumuCyGrvHD6XF726ONwDm933jKvS1yb/oF80WF7pwOwqz3kQQ42X162+1c25GC0aPxboohIJ1xNu6QpiKMxGfaHaKfoy1zhO0tUq/1muTUwk6XoOXtyPo39n7tyBANrXfUdi9e0t8Wy9qZeIpnCU0foDU1U4JIv9QnK3kBBbs8P55nTG+eeuB4KM/RLSLEEsBEhyok6KbBXC/o60d2MCDwINRlhk1ChBe+haRrdRqWTKhh0l8rLllzWtIMvwj+OPGSaooHmRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11449
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f597ee5a-2e0c-4e90-7c2a-08decb98f621
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|14060799003|23010399003|376014|4022899009|82310400026|1800799024|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	eVNCXidvEQpEZFJ/KYYuAql0IjfRmZG4FH6jqeDeVvtvfiLqFVkt8Z5jye7J7g+6Ov4PCRPwdEHoqqpQ4qM8MQ4TQujvW+XBuCXP65rn3rN4iyIe5P0niggHozt++NQ9YhyZn+RVSQ9wspKQ6NlroYyAR6Mm3MgotvTomoOUvq545CjO0rgV/luCZvVNdScP4H6+yZ2w/mPKw43Oa5GA5ZYN8fNGqARGc1YeHACd76YoTtk//quQHG4utdvnppgjbnk9L9ifbd6aRs6hZzrfuO9JSgbGOtrRpGcRfGMbGo77sju5aa62SBWPWTsgVvM3LamYvKNxziDov9vW5hxeWzVHQsX9StpNTTkC1VKD+WYavZ6o91tFOh1QX9dHdZlXnGQUgUfxTb38glKqbY0D9UTzncpu0/Ns5VOv4fYbLKRnfwSVRsYEkUtL83C1d6ITDdSWQbC0OwegO52VB0Tb5VDnGjj46Di8JuxB5VPzJwahcg2yYp+lNzvZH+Rshx8+m421WSzuze4AGzimHds9FBmenhhU+c74d6fnpwPJUAURkp3U2jf+fidGrkyD49bw/TMcsYcXwjhtusvybhAm44NX+5vGUur7zTJBQBs3QHT/FEdl3NmbODKQcWecA29AOOreHswIkjRiA7GM8khYosXRFzz74OAMIiHaTzyJHoVn7eSn+7jPhK7nfoDV6sVH
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(23010399003)(376014)(4022899009)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SaXE2CT+OjqwhUBIi5SG869yfh0E/OgWTqbNpIh4MjSUVPmXR61n4LznbE0Ih4QoaH7gwZ162G8MuRFR/mBcsbur0QqSVKWuK524KY340K+1ger6bmBEJj84iGzOLUrMlGcIUt8A/tJpzQbFFp1+hEZL6fxxLrqltH4IEBuYJNwFuyPWTTEoC4ItWGnYzW15xbwR7KWXSzg/2XAzRaqZmze+yGwoSp7e8jbgcSROA1M3ExmU1X9mFbMXYW8YSOdxcm0vabNecJQMEsaX2k3DV5kiQJEGGA5t544kjMbr96Nvzc7gXs9XOD/zEDwMCnaffUK6OKwk5vqyEHjoQoQmMoxKsrnw5kfw28XL7oCd9Egct2lbdziUGc846NyxPVdDS2hmH39DplpuOvem67G8TWLfVXZnhl60wJVoUGenD4Tk0NNx4Yz3uDC+Ix1UAqLx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:19:18.3963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145a659e-2ce7-4bb7-5c49-08decb991b77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 11:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238892

Note that I sent this as two upgrades because the 1.30.4 upgrade is a good =
candidate for the wrynose branch as the only commits since 1.30.4 are CVE f=
ixes.

Ross

> On 16 Jun 2026, at 12:16, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> libinput 1.30.3:
>=20
> This release contains just the CVE patches that we backported.
>=20
> libinput 1.30.4:
>=20
> This release contains a fix for todays security advisory: CVE-2026-50265.
> libinput-device-group now sanitizes the PHYS value which prevents local
> privilege escalation through udev property injection. As said in the advi=
sory
> this is only a security issue if you have a udev rule in place that allow=
s
> users to create uinput devices.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> .../wayland/libinput/CVE-2026-35093.patch     | 124 ------------
> .../wayland/libinput/CVE-2026-35094.patch     | 191 ------------------
> ...{libinput_1.30.2.bb =3D> libinput_1.30.4.bb} |   4 +-
> 3 files changed, 1 insertion(+), 318 deletions(-)
> delete mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-35093.=
patch
> delete mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-35094.=
patch
> rename meta/recipes-graphics/wayland/{libinput_1.30.2.bb =3D> libinput_1.=
30.4.bb} (93%)
>=20
> diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch =
b/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
> deleted file mode 100644
> index e0119caaca1..00000000000
> --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 356c498fd4ba25ec99f6866fc96847ec3d1f16bf Mon Sep 17 00:00:00 2001
> -From: Peter Hutterer <peter.hutterer@who-t.net>
> -Date: Mon, 30 Mar 2026 11:35:35 +1000
> -Subject: [PATCH] lua: force text mode for loading plugins
> -
> -luaL_loadfile() by default allows for both text files and precompiled
> -lua files. Precompiled files are not verified on load allowing for a
> -sandbox escape.
> -
> -CVE-2026-35093
> -
> -Fixes: #1271
> -
> -Found-by: Koen Tange <koen@monokles.eu>
> -Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_reque=
sts/1459>
> -
> -CVE: CVE-2025-35093
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - src/libinput-plugin-lua.c |  2 +-
> - test/test-plugins-lua.c   | 69 +++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 70 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
> -index c6f99a5f..2a09a64a 100644
> ---- a/src/libinput-plugin-lua.c
> -+++ b/src/libinput-plugin-lua.c
> -@@ -1362,7 +1362,7 @@ libinput_lua_plugin_new_from_path(struct libinput =
*libinput, const char *path)
> - return NULL;
> - }
> -=20
> -- int ret =3D luaL_loadfile(L, path);
> -+ int ret =3D luaL_loadfilex(L, path, "t");
> - if (ret =3D=3D LUA_OK) {
> - plugin->L =3D steal(&L);
> -=20
> -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
> -index aba8f6c6..e61806d3 100644
> ---- a/test/test-plugins-lua.c
> -+++ b/test/test-plugins-lua.c
> -@@ -1204,10 +1204,79 @@ START_TEST(lua_remove_plugin_on_timeout)
> - }
> - END_TEST
> -=20
> -+/* Pre-compiled Lua 5.4 bytecode for the following source:
> -+ *
> -+ *   libinput:register({1})
> -+ *   libinput:connect("new-evdev-device", function(device)
> -+ *       libinput:log_info("loaded from binary lua file")
> -+ *   end)
> -+ *
> -+ * To regenerate:
> -+ *   luac5.4 -o /dev/stdout /tmp/plugin.lua | xxd -i
> -+ */
> -+static const unsigned char binary_lua_plugin[] =3D {
> -+ 0x1b, 0x4c, 0x75, 0x61, 0x54, 0x00, 0x19, 0x93, 0x0d, 0x0a, 0x1a, 0x0a=
, 0x04,
> -+ 0x08, 0x08, 0x78, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
, 0x00,
> -+ 0x00, 0x00, 0x28, 0x77, 0x40, 0x01, 0x9b, 0x40, 0x74, 0x65, 0x73, 0x74=
, 0x2f,
> -+ 0x31, 0x30, 0x2d, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x2d, 0x70, 0x6c=
, 0x75,
> -+ 0x67, 0x69, 0x6e, 0x2e, 0x6c, 0x75, 0x61, 0x80, 0x80, 0x00, 0x01, 0x04=
, 0x8e,
> -+ 0x51, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80, 0x00, 0x01=
, 0x13,
> -+ 0x01, 0x00, 0x01, 0x52, 0x00, 0x00, 0x00, 0x81, 0x01, 0x00, 0x80, 0x4e=
, 0x01,
> -+ 0x01, 0x00, 0x44, 0x00, 0x03, 0x01, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80=
, 0x00,
> -+ 0x02, 0x03, 0x81, 0x01, 0x00, 0xcf, 0x01, 0x00, 0x00, 0x44, 0x00, 0x04=
, 0x01,
> -+ 0x46, 0x00, 0x01, 0x01, 0x84, 0x04, 0x89, 0x6c, 0x69, 0x62, 0x69, 0x6e=
, 0x70,
> -+ 0x75, 0x74, 0x04, 0x89, 0x72, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72=
, 0x04,
> -+ 0x88, 0x63, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x04, 0x91, 0x6e, 0x65=
, 0x77,
> -+ 0x2d, 0x65, 0x76, 0x64, 0x65, 0x76, 0x2d, 0x64, 0x65, 0x76, 0x69, 0x63=
, 0x65,
> -+ 0x81, 0x01, 0x00, 0x00, 0x81, 0x80, 0x8d, 0x8f, 0x01, 0x00, 0x04, 0x85=
, 0x8b,
> -+ 0x00, 0x00, 0x00, 0x94, 0x80, 0x01, 0x01, 0x83, 0x01, 0x01, 0x00, 0xc4=
, 0x00,
> -+ 0x03, 0x01, 0xc7, 0x00, 0x01, 0x00, 0x83, 0x04, 0x89, 0x6c, 0x69, 0x62=
, 0x69,
> -+ 0x6e, 0x70, 0x75, 0x74, 0x04, 0x89, 0x6c, 0x6f, 0x67, 0x5f, 0x69, 0x6e=
, 0x66,
> -+ 0x6f, 0x04, 0x9c, 0x6c, 0x6f, 0x61, 0x64, 0x65, 0x64, 0x20, 0x66, 0x72=
, 0x6f,
> -+ 0x6d, 0x20, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x20, 0x6c, 0x75, 0x61=
, 0x20,
> -+ 0x66, 0x69, 0x6c, 0x65, 0x81, 0x00, 0x00, 0x00, 0x80, 0x85, 0x01, 0x00=
, 0x00,
> -+ 0x00, 0x01, 0x80, 0x81, 0x87, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x80=
, 0x85,
> -+ 0x81, 0x85, 0x5f, 0x45, 0x4e, 0x56, 0x8e, 0x01, 0x0b, 0x00, 0x00, 0x00=
, 0x00,
> -+ 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0xfe, 0x02, 0x80, 0x80, 0x81, 0x85=
, 0x5f,
> -+ 0x45, 0x4e, 0x56,
> -+};
> -+
> -+START_TEST(lua_reject_precompiled_files)
> -+{
> -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> -+
> -+ /* Write the binary bytecode to a .lua file in the tmpdir.
> -+ * Binary (pre-compiled) Lua files must be rejected by the
> -+ * plugin loader for security reasons. */
> -+ _autofree_ char *path =3D strdup_printf("%s/10-binary-plugin.lua", tmp=
dir->path);
> -+ _autoclose_ int fd =3D open(path, O_WRONLY | O_CREAT, 0644);
> -+ litest_assert_errno_success(fd);
> -+
> -+ ssize_t written =3D write(fd, binary_lua_plugin, sizeof(binary_lua_plu=
gin));
> -+ litest_assert_int_eq((int)written, (int)sizeof(binary_lua_plugin));
> -+ fsync(fd);
> -+
> -+ _litest_context_destroy_ struct libinput *li =3D
> -+ litest_create_context_with_plugindir(tmpdir->path);
> -+
> -+ litest_with_logcapture(li, capture) {
> -+ libinput_plugin_system_load_plugins(li,
> -+    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
> -+ litest_drain_events(li);
> -+
> -+ size_t index =3D 0;
> -+ litest_assert(
> -+ strv_find_substring(capture->errors, "Failed to load", &index));
> -+ litest_assert_str_in(path, capture->errors[index]);
> -+ }
> -+}
> -+END_TEST
> -+
> - TEST_COLLECTION(lua)
> - {
> - /* clang-format off */
> - litest_add_no_device(lua_load_failure);
> -+ litest_add_no_device(lua_reject_precompiled_files);
> - litest_with_parameters(params,
> -       "content", 'I', 6,
> - litest_named_i32(EMPTY),
> ---=20
> -GitLab
> -
> diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch =
b/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
> deleted file mode 100644
> index 405a262b03e..00000000000
> --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -From 45dfd0f0301af855f068df27b2e40cc9f5713acd Mon Sep 17 00:00:00 2001
> -From: Peter Hutterer <peter.hutterer@who-t.net>
> -Date: Mon, 30 Mar 2026 09:41:08 +1000
> -Subject: [PATCH] lua: separate the API from the metatables
> -
> -Previously we had one vtable for the libinputplugin and EvdevDevice
> -objects. This allowed plugins to call __gc(), a decidedly internal
> -method.
> -
> -This fixes a use-after-free: A plugin that called EvdevDevice::__gc()
> -frees the plugin's copy of device->name but leaves the pointer in-place,
> -a subsequent call will thus cause a UAF read.
> -
> -Fix this by separating what is the object's metatable from the public
> -methods that are accessible to a plugin.
> -
> -CVE-2026-35094
> -
> -Fixes: #1272
> -
> -Found-by: Koen Tange <koen@monokles.eu>
> -Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_reque=
sts/1459>
> -
> -CVE: CVE-2025-35094
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> ----
> - src/libinput-plugin-lua.c | 54 +++++++++++++++++++++++++++++----------
> - test/test-plugins-lua.c   | 33 ++++++++++++++++++++++++
> - 2 files changed, 73 insertions(+), 14 deletions(-)
> -
> -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
> -index ac828f7f..c6f99a5f 100644
> ---- a/src/libinput-plugin-lua.c
> -+++ b/src/libinput-plugin-lua.c
> -@@ -562,6 +562,12 @@ libinputplugin_unregister(lua_State *L)
> - return luaL_error(L, "@@unregistering@@");
> - }
> -=20
> -+static int
> -+readonly_newindex(lua_State *L)
> -+{
> -+ return luaL_error(L, "attempt to modify a read-only table");
> -+}
> -+
> - static int
> - libinputplugin_gc(lua_State *L)
> - {
> -@@ -673,7 +679,28 @@ libinputplugin_log_error(lua_State *L)
> - return libinputplugin_log(L, LIBINPUT_LOG_PRIORITY_ERROR);
> - }
> -=20
> --static const struct luaL_Reg libinputplugin_vtable[] =3D {
> -+static void
> -+setup_vfuncs(lua_State *L,
> -+     const char *metatable_name,
> -+     const struct luaL_Reg *vfuncs,
> -+     const struct luaL_Reg *public_methods)
> -+{
> -+ luaL_newmetatable(L, metatable_name);
> -+ luaL_setfuncs(L, vfuncs, 0);
> -+
> -+ lua_newtable(L);
> -+ luaL_setfuncs(L, public_methods, 0);
> -+ lua_setfield(L, -2, "__index");
> -+
> -+ /* set metatable.__metatable =3D false to prevent a script from getmet=
atable(),
> -+   which is blocked anyway but safe and sorry and whatnot */
> -+ lua_pushboolean(L, 0);
> -+ lua_setfield(L, -2, "__metatable");
> -+
> -+ lua_pop(L, 1);
> -+}
> -+
> -+static const struct luaL_Reg libinputplugin_methods[] =3D {
> - { "now", libinputplugin_now },
> - { "version", libinputplugin_version },
> - { "connect", libinputplugin_connect },
> -@@ -685,18 +712,18 @@ static const struct luaL_Reg libinputplugin_vtable=
[] =3D {
> - { "log_debug", libinputplugin_log_debug },
> - { "log_info", libinputplugin_log_info },
> - { "log_error", libinputplugin_log_error },
> -- { "__gc", libinputplugin_gc },
> - { NULL, NULL }
> - };
> -=20
> -+static const struct luaL_Reg libinputplugin_meta[] =3D { { "__gc", libi=
nputplugin_gc },
> -+       { "__newindex",
> -+ readonly_newindex },
> -+       { NULL, NULL } };
> -+
> - static void
> - libinputplugin_init(lua_State *L)
> - {
> -- luaL_newmetatable(L, PLUGIN_METATABLE);
> -- lua_pushstring(L, "__index");
> -- lua_pushvalue(L, -2); /* push metatable */
> -- lua_settable(L, -3);  /* metatable.__index =3D metatable */
> -- luaL_setfuncs(L, libinputplugin_vtable, 0);
> -+ setup_vfuncs(L, PLUGIN_METATABLE, libinputplugin_meta, libinputplugin_=
methods);
> - }
> -=20
> - static int
> -@@ -1073,7 +1100,7 @@ evdevdevice_gc(lua_State *L)
> - return 0;
> - }
> -=20
> --static const struct luaL_Reg evdevdevice_vtable[] =3D {
> -+static const struct luaL_Reg evdevdevice_methods[] =3D {
> - { "info", evdevdevice_info },
> - { "name", evdevdevice_name },
> - { "usages", evdevdevice_usages },
> -@@ -1087,18 +1114,17 @@ static const struct luaL_Reg evdevdevice_vtable[=
] =3D {
> - { "prepend_frame", evdevdevice_prepend_frame },
> - { "append_frame", evdevdevice_append_frame },
> - { "disable_feature", evdevdevice_disable_feature },
> -- { "__gc", evdevdevice_gc },
> - { NULL, NULL }
> - };
> -=20
> -+static const struct luaL_Reg evdevdevice_meta[] =3D { { "__gc", evdevde=
vice_gc },
> -+    { "__newindex", readonly_newindex },
> -+    { NULL, NULL } };
> -+
> - static void
> - evdevdevice_init(lua_State *L)
> - {
> -- luaL_newmetatable(L, EVDEV_DEVICE_METATABLE);
> -- lua_pushstring(L, "__index");
> -- lua_pushvalue(L, -2); /* push metatable */
> -- lua_settable(L, -3);  /* metatable.__index =3D metatable */
> -- luaL_setfuncs(L, evdevdevice_vtable, 0);
> -+ setup_vfuncs(L, EVDEV_DEVICE_METATABLE, evdevdevice_meta, evdevdevice_=
methods);
> - }
> -=20
> - static void
> -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
> -index 4d687203..aba8f6c6 100644
> ---- a/test/test-plugins-lua.c
> -+++ b/test/test-plugins-lua.c
> -@@ -526,6 +526,38 @@ START_TEST(lua_disallowed_functions)
> - }
> - END_TEST
> -=20
> -+START_TEST(lua_gc_not_accessible)
> -+{
> -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> -+ const char *lua =3D
> -+ "libinput:register({1})\n"
> -+ "assert(libinput.__gc =3D=3D nil)\n"
> -+ "function check_device_gc(device)\n"
> -+ "  assert(device.__gc =3D=3D nil)\n"
> -+ "  libinput:log_info(\"gc_not_accessible: ok\")\n"
> -+ "end\n"
> -+ "libinput:connect(\"new-evdev-device\", check_device_gc)\n";
> -+
> -+ _autofree_ char *path =3D litest_write_plugin(tmpdir->path, lua);
> -+ _litest_context_destroy_ struct libinput *li =3D
> -+ litest_create_context_with_plugindir(tmpdir->path);
> -+ if (libinput_log_get_priority(li) > LIBINPUT_LOG_PRIORITY_INFO)
> -+ libinput_log_set_priority(li, LIBINPUT_LOG_PRIORITY_INFO);
> -+
> -+ litest_with_logcapture(li, capture) {
> -+ libinput_plugin_system_load_plugins(li,
> -+    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
> -+ litest_drain_events(li);
> -+
> -+ _destroy_(litest_device) *device =3D litest_add_device(li, LITEST_MOUS=
E);
> -+ litest_drain_events(li);
> -+
> -+ litest_assert_logcapture_no_errors(capture);
> -+ litest_assert_strv_substring(capture->infos, "gc_not_accessible: ok");
> -+ }
> -+}
> -+END_TEST
> -+
> - START_TEST(lua_frame_handler)
> - {
> - _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> -@@ -1219,6 +1251,7 @@ TEST_COLLECTION(lua)
> - litest_add_no_device(lua_register_multiversions);
> - litest_add_no_device(lua_allowed_functions);
> - litest_add_no_device(lua_disallowed_functions);
> -+ litest_add_no_device(lua_gc_not_accessible);
> -=20
> - litest_add_no_device(lua_frame_handler);
> - litest_add_no_device(lua_device_info);
> ---=20
> -GitLab
> -
> diff --git a/meta/recipes-graphics/wayland/libinput_1.30.2.bb b/meta/reci=
pes-graphics/wayland/libinput_1.30.4.bb
> similarity index 93%
> rename from meta/recipes-graphics/wayland/libinput_1.30.2.bb
> rename to meta/recipes-graphics/wayland/libinput_1.30.4.bb
> index efd51809d8e..8ce3d0d62cf 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.30.4.bb
> @@ -13,11 +13,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1c=
10bc0fb037dc76c46ef8a"
> DEPENDS =3D "libevdev udev"
>=20
> SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.30-branch;tag=3D${PV} \
> -           file://CVE-2026-35093.patch \
> -           file://CVE-2026-35094.patch \
>            file://run-ptest \
>            "
> -SRCREV =3D "042c5e6fd9cc910307027a1522453794b29f2c72"
> +SRCREV =3D "7ad8b37ffcc71aceb8eb4d079d22490e87168f49"
>=20
> UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>=20
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238890): https://lists.openembedded.org/g/openembedde=
d-core/message/238890
> Mute This Topic: https://lists.openembedded.org/mt/119831384/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


