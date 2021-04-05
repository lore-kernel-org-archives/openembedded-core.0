Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.80])
 by mx.groups.io with SMTP id smtpd.web10.1061.1617601260629987549
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 22:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Q/2YJ1Aq;
 spf=pass (domain: kpit.com, ip: 40.107.139.80, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1dXzKVt+L+64jOum5dKgbkpNiGXTxFE61K8H575jo+Egd93PFCjyZ8MWCdvtYKQgBEDbih0WdJzI/MWwEXhNRiUIakD0DnLBPr/XtQ2C5x8DvnsZ0+Ill2zv4rYD1KTdszsIOit7kcRvxKMkSeS0I7x3IzrTsl1eLBbnN0w+9HeGWkNqH/guPBhjOQL5DIIQOwS/mer254h26GOfuI5Ay/d6M42BpZjyCIaLrDQNOmW7J2cRwQJ0nCQT/8Alqu8m0MEVl/plocuS128u3pBMotxOIZO+jbCb0Or9XP2MtcMLXe0OUHkYGUGFCA9UorjdUsjxR67596YlOO/ZPUNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDNwMdVKa1gZMnktDU3UC5Ynl3SR9RY0/JK33NVFQhA=;
 b=CQbb8MVU5vMgnMUalBgl+J2wYwIbMy2j9dzBdBdoqIe9tj12bctCAtm6nSdYOQMs41lW8Ekz7mbVai3S3rsPTSKt66J3ULBek90nqy/qUT4mHVpKLxC8UiDCGyLwTs47Xnoro86thJpVpQ01nYYbBaVM/RUwkdkdSyNjUZixfqHgU3pmMqAPow/XdluXDcicJT2QX+rszDsKdOtmBXXabJZ6zN3NAvCl9z/JOeK4Omv/pda5Tuj07Tgw6/07SQbV2R9SW2YJ6ss2mzQVMfWZuOIG/pP89alO3XmqqUnZUWB7INt0mHBQPZEnw8Lov9SBVuqdZohDJvQjiFGWMg82ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDNwMdVKa1gZMnktDU3UC5Ynl3SR9RY0/JK33NVFQhA=;
 b=Q/2YJ1AqoSeFGeb9YSl1nSAXzpCKN2DKPi2vrde8GaxCNJCIVojPqBUsHcA//hUZ18pCKf41UAhCJj6XLMe68eW4cmaXsO1/6gfIk+HC0lvrKZ3m3sR1nK3VbU9zIjcf9YsHG6ou4JlTUPSFFfgqsqulU71sFbGJHkj2OSnL7dE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9::8) by
 PN1PR0101MB1327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Mon, 5 Apr
 2021 05:40:49 +0000
Received: from PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f1c4:b7e4:e3b4:aaa3]) by PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f1c4:b7e4:e3b4:aaa3%6]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 05:40:49 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][dunfell][PATCH] qemu: Add fix for CVE-2020-13791
Date: Mon,  5 Apr 2021 11:10:35 +0530
Message-Id: <20210405054035.11312-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [103.93.114.160]
X-ClientProxiedBy: PN1PR0101CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::12) To PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9::8)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from L-11851.local (103.93.114.160) by PN1PR0101CA0050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend Transport; Mon, 5 Apr 2021 05:40:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0b16d7-1bde-4159-59d1-08d8f7f55e30
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1327:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB132756CAA9D76247ABC8E24BF2779@PN1PR0101MB1327.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iKSrrjwixYWIBFoyO+Tp6/LyJNP9P2yz+lSCTbBqDH7cMB55DPqTCfvPYqLT4fHIX3x8H4kxXpQcXqtuHOdoWbBMaGYSPVx/ElIgGbdNLYWPnEDORObVWTMhXiEfOsRksCzSWav2r6lwBbHFvaPlGFhTSL/9RfFEOtKa0OPgtmCxhYyrh94T/XeuXNFL/aqH8XgH+NEiwJTDcEGRrBdNYv/bxvirwDI/AYclUWBffwMOr2iichIEywfnKfKMhWg7UfV4rBukEMetAXgudERZiocj0OYYTVoWsgRvOtrhndIFudWGGsevbLsnnrKW/cwPi7v1ngNKsN8ZbsDOxoW5QBbx2OUiiY6CU/1Wq7ZW1xbgmn04JyDXTaO2W8qhWAFeNSo+AYSspEsRNG1MRSPZJi584aTERJpxC5FtC4JgCGh0rSeoGXJEyNgNiUoOtdbGfpqmEuOzV12lBhlyikIfEMGvy+nfNEMAu4yZ9+eefXikJEMTVREVUTcUBLROkPqN1fRpnTsyL2Jb9rk5swIsyURKvjv9xjGPsuStnQd6jSAxyVHdYn6W6+SXPAn2fP47WTVhOYvMWhnkk9Rjsw5ugRmxVboPr1gAZOC3KKJiz/tXCSFWCpeoaSRZujfxS/QiKpoE2wB39cbNmjcvyKfS/2C3h+bkQSdUVAYZr4UUbIdQS592n/C1y1ykApBT4QLyr2xI43MOrWBURbZVyNRnREjirAzgRlLfpPG3T4g15sviyUP69qsKnSzMrELeKNY1X7iZjYKCDfihY6/5rxE/yJpuI/p74hD5WO/we2SVIww=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39840400004)(366004)(6486002)(5660300002)(4326008)(36756003)(6512007)(2906002)(107886003)(6666004)(186003)(6506007)(38100700001)(66946007)(478600001)(83380400001)(66574015)(26005)(66476007)(86362001)(52116002)(16526019)(8676002)(956004)(8936002)(1076003)(66556008)(2616005)(316002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a3B0bUxPZmQwUVczSHZBd1dObEhxU1U3cFdrY2ZpL0hSUVVRTC96aCt3V2Jp?=
 =?utf-8?B?bkQ2dGtzTHlCUlExUmlqbUxSQ1hNZGRFTkF2bzB0VWVGODlSL0NkaGJZS3ND?=
 =?utf-8?B?VFZYamY2ejVqMCtDcEFVUU92dEhPbjNDZ2NMS2xXSUhNZW9zS05hekR3NkhN?=
 =?utf-8?B?SXNHMVpRUHpxZENqNEFVd1M4OUd2WEt6K3pNaHBFRUdLRUt4cXp3T0NDOS9z?=
 =?utf-8?B?Myt3KythcVhOZFFxa01PK0JoZnpkVW9nMHVjbHh2RjY0dmN5aStwYkxSdWNX?=
 =?utf-8?B?SFYyWEtxb3k5NW85UTh4WXRSbEwyMVdiZGM5b2NvQTNBa2h1V25jV1dCTWIz?=
 =?utf-8?B?UU5TbXhFZndZRngwdDkwVkR6VHg3THlPNFMwTnppeHM5KzFQZS90T2NORjl0?=
 =?utf-8?B?elBJbHc5aHk0VjJ1ZGhXWWFTeklBbVFtY0xnUUFDTzJQR0svT1lqR04vT0Uw?=
 =?utf-8?B?SHMwdzJQY1Nwb0tjQ3NoMWJUT0I5cDhZZ0hORlV6NExtWm1xK2o0TlJQVVBz?=
 =?utf-8?B?ZzIxckJXN2JNVjZXSFJpU1k5RDRSbUc2ZlNzSHBiNGhtUEd1eXNHT2ZuQWxI?=
 =?utf-8?B?cHplTjNRTkZYeWFUNWFJUUx3QTRhbXBBdVh1SnhESFBUZTN3ZE5ZUk5qTHI4?=
 =?utf-8?B?YWZESTVNNTR4T2FQT244RVFjYWo3T0EwcWhSWmVISWV6L3NBWG40RW5HVksr?=
 =?utf-8?B?MS9xZ0pHRlNRUlo3NS9UZmlsaTdyU01uS2xDNkJtZG00U3JrNDF6Rk5UY1NZ?=
 =?utf-8?B?bmM0YUYyS0k0aGdWN0xHbU5yMjllaE5XMFdmQXF0R0FBeW4vUjZ5MmN5M3k2?=
 =?utf-8?B?ZytzU2QrYmw0blM4TjE4VVdDUytMaHdZWDlUUnFsNkNuclBQT0l4SWlHdGJG?=
 =?utf-8?B?bDh4M1I3ZHA4Z25OSFVQTVZ3YXphRDRDWGR2OE5kT0tCTFFibC9uWExLRGVK?=
 =?utf-8?B?b1hrNWN2VWNlbUoreVJBZHF0ZHJSaVFKYmpVVVdKdlhOMjFWRTZkaStETklH?=
 =?utf-8?B?cUFTd003dHplR1FyWW0wa2t5eWtvWnVhdncyQWVRQUpNM2QrR3RROC8vRGVX?=
 =?utf-8?B?czZhMGVhUjloS3RVaWVnc2RqUzhWZmVsRm1tVkhsUGs5V3I5TEdFT2FKNkMw?=
 =?utf-8?B?ZVlETHp3bHdqbkxiMmhUcTVnZWV2OEhSaE1WeUszTnJIbnVVUm5sc0tDcHIx?=
 =?utf-8?B?alJLRThFTlJzR0VScFg4cmxESVZJdER1dzJ5V25MRHRzY1FTNHRxcGd3dThS?=
 =?utf-8?B?bWl4K3lab3RpdjdZTjVxRUNDNWtTZmUwUUVZNlB4NVJLeGhlSHJLYWlQRlpB?=
 =?utf-8?B?MmlXTHdqbUN4V3h2dVp3dE9jU0M0aE44MUd6WlRlNXZ3bEZWS1pQNDdMbGhj?=
 =?utf-8?B?NWtrcEMyc0RQcTRlWDRtbHZ1NHdESnAydzRzOFdYNGY3RytidUdub1RsUUZI?=
 =?utf-8?B?M0xmTzN0ampueWduL2FvRWo4Rkc1ZFFxWDFvTHJkdVZpUUJsdFlMWURVeERs?=
 =?utf-8?B?NDlRdTVDNEt1MnhWUm5DTWg1QSs0U2pTNUZ6MFFvQnpGK3NHeGVQdmo2TDVy?=
 =?utf-8?B?VGppSjhwQzh3YUFRTGN3c3dCb0hZZHhaU2UrTHgyaDlJY2ZxanFkTnEwM3pC?=
 =?utf-8?B?KzIrNWxJTmcrZm5WVU93VjhkRnhDelhWSytnYWpZOHpkSyt5MTN3c1ZFaHF4?=
 =?utf-8?B?T0ZxeTlWREtwZk42dldReFo1bGkzdlhuRFZvZURQUHVOVmVHb2d1OCtjZ04w?=
 =?utf-8?Q?tEeRsZMXe33ozM6gGmopspZucjUl4ffOoqiJoZu?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0b16d7-1bde-4159-59d1-08d8f7f55e30
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 05:40:49.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1h505sXXL+ITzbULqib/IqUlkEA+PGJxST7eBjU0wskSWoi2cMyi0z+wq1whd2OprOcNdGFuLBvgODhNeqx9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1327
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Added below patch to fix CVE-2020-13791

CVE-2020-13791.patch

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13791.patch            | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 5e8d3e09ff..7f8053cdd5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
           file://CVE-2020-24352.patch \
           file://CVE-2020-25723.patch \
           file://CVE-2021-20203.patch \
+          file://CVE-2020-13791.patch \
           "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-13791.patch
new file mode 100644
index 0000000000..6582abce59
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
@@ -0,0 +1,52 @@
+From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 4 Jun 2020 17:05:25 +0530
+Subject: [PATCH] pci: assert configuration access is within bounds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+While accessing PCI configuration bytes, assert that
+'address + len' is within PCI configuration space.
+
+Generally it is within bounds. This is more of a defensive
+assert, in case a buggy device was to send 'address' which
+may go out of bounds.
+
+Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2020-13791
+Upstream-Status: Backport[https://github.com/qemu/qemu/commit/f7d6a635fa3b=
7797f9d072e280f065bf3cfcd24d.patch]
+Comment: No hunks refreshed and no warnings were seen while applying patch=
.
+Affected version: >=3D4.2.0 but patch already present in Master and Gatesg=
arth branches.
+Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
+---
+ hw/pci/pci.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/pci/pci.c b/hw/pci/pci.c
+index 70c66965f56..7bf2ae6d92a 100644
+--- a/hw/pci/pci.c
++++ b/hw/pci/pci.c
+@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
+ {
+     uint32_t val =3D 0;
+
++    assert(address + len <=3D pci_config_size(d));
++
+     if (pci_is_express_downstream_port(d) &&
+         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, 2))=
 {
+         pcie_sync_bridge_lnk(d);
+@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t=
 addr, uint32_t val_in, int
+     int i, was_irq_disabled =3D pci_irq_disabled(d);
+     uint32_t val =3D val_in;
+
++    assert(addr + l <=3D pci_config_size(d));
++
+     for (i =3D 0; i < l; val >>=3D 8, ++i) {
+         uint8_t wmask =3D d->wmask[addr + i];
+         uint8_t w1cmask =3D d->w1cmask[addr + i];
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
