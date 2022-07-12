Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C186C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 01:23:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3985.1657589019363516808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qJWXFIXg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=41924d93c3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26C0rANu029085
	for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:23:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7T6dYD+Q4CniU8mAAZfT9wWDJU86DCiIugmcR4IM4Dw=;
 b=qJWXFIXg40rVNaPNvDlvxAUjzrwfGim8cCYxKhU63PWJ+AYYuHWrrrAFeDW9wNoufUNl
 7q1HChXYNXVwRRN9dMo3oWVOuJIhzMay8VHTjFFOjC59xQiYNFMFFJ84gMHNPysotV0P
 NnOiDFDxQfM8C3EQD0o3E2wAZS1JAALIrwEGPSV9grUhKeujoAchcqLiUeZiatdnhVKD
 Ao0pNsb0b2J4zUCyeywib3r1hxJ3HxvBLUkDzGjht8MKOWRPLNkUm+C1NXhAFdl5cmzA
 tMqRiNaKs8lNhsIGiRAurYl9gfZ03noB83uY6M5srx3ew2k4rQxHVwtQtC+7aluzQaXU WQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h74y4str0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:23:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC6qQ2/Xt0KnsMk3N6uDWM+OQw8rIJ9Zk22LN9RisHX5JEnL+ivVNSIYioC/Mej7RvsXkSQVX9JsFwGDsD+r2OVFaJYEG0lv/bidzX0Zz9bUuo8LRkumejMxoS/0jIc0Mf6/W6vsCM1Na52IGXtwT0VvtnM7mkQmci3+AwEDW36UjEhBtDsaIlZ3rcWgn5Ya28OjTORPaxlz9FSNfCovP3Xfth/6CuJT2jYt0ncVgmf3bv3zxKzXp6nN6W7ceGOu9w047Ok//A10Nc5cUKq9CZqqRxzT9aGe2Li+6MLJoZtju19dZpPY/VGczp8R0JOYu8mGgA2ZXywHoLU4GIo7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T6dYD+Q4CniU8mAAZfT9wWDJU86DCiIugmcR4IM4Dw=;
 b=jrx85qtmNH3ceKtJBER2c+k3qvgoDAYIrJnZveJK/nQoPyu6FlqZqF2BA6gQ4nhe7KSNr23xn8825XltEV9oUj/jhwQ8z7KOTKE4g1aeYw09OX760CFqxDG17MGKAqwJ7Qh+ahMlsoN8M6nr5phk6Owm8ECIufiyXnqQjnjfVuZQQzSOHqnBL17VZg6m+jtXyl+fISl2SIFYRmnJdoDVvHp/TeD/kRGntg8C9y03R/tO+z2dETOnbAmMzuP2q04nT0jPOgPpqDRw8FqsSCkskiquUosTGDhbj3gha9AFpkRMLsbN4vdwYAmQ/liohbw2w7luy0vseFLumJ+G/O9nCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BYAPR11MB2535.namprd11.prod.outlook.com (2603:10b6:a02:be::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Tue, 12 Jul 2022 01:23:36 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 01:23:36 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: fix CVE-2022-34835
Date: Mon, 11 Jul 2022 21:23:06 -0400
Message-Id: <20220712012306.34514-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0234.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::10) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdb7cbc8-9d80-47f2-1961-08da63a52461
X-MS-TrafficTypeDiagnostic: BYAPR11MB2535:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8O/6pHexNoNkSjcIcwqYInKX97FNzCPqeXtyfWkxDhbYIApFzT7AGQyoYCmrtUO872c9VM9dSW+eFRxjQUWNSHCjS88RQbW0Ic7ycvV44xwVJsTz4R+tKf9bmNvEdLh+4chgxWXwAyzxjZ0MXwEA6kB0IrJriLuGIFTmpwQq8mE0RUgyODANlZ4PZXKg3JV6M/YtV2zRoc22b8BEjyVLPtWru59deLlYP7JDW06JR7Jj2g1ZtgPHsZNPbxFo6HjAURhQ8X8WUkF1Xx/gIhXXJ5Hpbu3NEB+NavQ8h10FFyeFzFLz5ZGuFS3YVVqb6eUsmJHxvfqO9euc5ffKH5yCklUNmwj6qwZH0mG2owdnyNzoWnYV0V68/Cacxh5cah5BemIjwdsFSopZ5jLGesj0aD4DmHexMJ5zr77hPdxZifvrybs7+KNn21+O994XWJz5GavYUOsFIt6izClYfpeZrSj+liMDzQL3MXlVu6jttzLLgYXCd3dkmySxbDB5oN8BinbArUJcjID8e7hV02wPAKC2Lbvde+mULUA+kSjOEWWt9GmzT7aUtbsXjCobeqmSAi0/xy7ukG/OXA4cFWYyox76290DFSHlp9jsvKOagDxwMv7esVw5usb3ulSQFN/vZOAG+nSD6iOIs8W+9qHlG8ScsKPYaFxCemyAYswholfi3tFg4zgPgGYOyzBALLKQ/bii4S56gm/GGhVNTYq9xSKcXrSy2b13Q/wzwjoPtxXOFl6cpfoLXdlQdsVFtuACh3dZRuIvc7lca60hv22zhMBY/xNmvIMi4xI04cNNwRwTuaIBbvVj7gboyuboKEE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(66946007)(8676002)(66476007)(66556008)(316002)(83380400001)(2616005)(186003)(6666004)(6486002)(478600001)(1076003)(86362001)(26005)(8936002)(6506007)(52116002)(6916009)(6512007)(44832011)(5660300002)(38100700002)(2906002)(38350700002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C9UwlBWl/aBIgljWVv3HUjHTtfhE/PRHmrxhBmuLd/0jBf9HAIYUPkEiLsN4?=
 =?us-ascii?Q?0/gZZAriikiqptfMKKz9lwj8h0lLDH5B0+oimt4nP9nzFR0DehSzeW1Pcyxl?=
 =?us-ascii?Q?O3sKHk4xKrjuhpfyDUyZfvGYzPJSN2h6/c8BbvewdOlMEBEV2DhfMJEvgVoM?=
 =?us-ascii?Q?iadX5H8g8+/r6xkv/nweJftsR9CAoGkOQRfrVhNahfbtCciYUDWmREQlGBtd?=
 =?us-ascii?Q?oxKXdD6xOnteiCemPkAXhrkOPUsGsiHIHvDmjvmed7zMG9FmQJHzUavG0yo7?=
 =?us-ascii?Q?sdz18n/BbjhGeGENHfJFTnimYEtN4sBYstaq3RTQHkKYATNyQ08y2czB0ioN?=
 =?us-ascii?Q?JLsJ98K6asycq60Q37YmnBOg+mqNvQKGovpQ3E1Hj0C8STvP2qW0XnCpAOR1?=
 =?us-ascii?Q?CNwUci+7dltDYimOltgZlB4WO096wQTHtFqIh+VlZHz5VcIpd1b3BX3gx25h?=
 =?us-ascii?Q?Ff0ebW8a5hQpOKysw7UK7TfpwEsUa0yvc30+QoQf5rmuI8VBs2sewPVhJ0ob?=
 =?us-ascii?Q?uNPBI1iGPrOuSknbqvU8Zv1vxuy0YkJP+/izmjervl73hMbIT2nG4qaNG2re?=
 =?us-ascii?Q?rBG5U08VytQIo4qFJtcecHi+Hn5+9TaowIR5Nbhg0kLRrI5vRQaWnAq+NEkK?=
 =?us-ascii?Q?G+uXKXE70fmpYrrigA4iM0saGm7r2TxkyvQury1CKXg9SZRpjlml40z0zxSX?=
 =?us-ascii?Q?Cip0C7tJq6zZCEDHOlP9uOiKOMW/poh8BLEwH96GM4zhXpAvPLudVANxbkCx?=
 =?us-ascii?Q?w/22SlEVCR7d7FV7e9f/RLriMAIqlJ/pkJ7Bh0YkFwuT0ZCcGCtYuIgiP6VK?=
 =?us-ascii?Q?HlT8rdqV12BHmpkxtfr3V2h0v/qLKDXEuZ7Nbf1E5fNhF3ha1/Vm5za7Nznt?=
 =?us-ascii?Q?TnhNTUGOdN6KaBtqILgMCuOtFbDl0GKzGH19wiw9iNBY3qc+b3nfuvcWGy4s?=
 =?us-ascii?Q?DVR8QFFpJnmqBw7yGU64OHVlrSyPCd0qDKiZlMblQPerrBaUzYxDw/s3cl0E?=
 =?us-ascii?Q?S4X3rwlUUjHV7gtE5IpOlXAK7Bz6agbZNKtXLuO3Bik2SvH0HCc6ICdh/bMQ?=
 =?us-ascii?Q?9TEb7Zv4cMw0wbrwkFakb/e2sKuymzKG+jYOFJ3Vl7vL9XkB/NnNUzZSfR2+?=
 =?us-ascii?Q?KeY7K2xNc4NXxlSzm6ftbhiBMlL71yMcsQ6h6/KTamtXeGSAaGokGMhXkXx0?=
 =?us-ascii?Q?lNkUN1S1nWk2XJPbUjZAMmizrUXFAbrrBhVKTSyjsVpYtuhFC32vuslKPqKg?=
 =?us-ascii?Q?eRS/d1AtiMMsmCf/avYkZh3vLIXPhQy9+5P+cKTDqgYYL6Ja0MKzoW0yn/Xd?=
 =?us-ascii?Q?zQkmmlSwaKzLHpHtETnmaP0nXeURGe0q9Gde3Xr36dJYkUYycpg6Phil8wkF?=
 =?us-ascii?Q?nz7QFeqCKgted8JdIcGa543uAB8wbETzaK347rHDUIrkzaXblm0UxLxikpA/?=
 =?us-ascii?Q?0TCY8y1WTyCqrpJQT+UmlRwcTZ4lfbIO+YET6BqJygnwVIUnKbzrhnkuHGNZ?=
 =?us-ascii?Q?Ku7T7zKRyv+zey7tVI4VlSOhSe4FOwyve8HKJ62JRu8XYq2M2er9NV2wXcPo?=
 =?us-ascii?Q?AQBg1SQSK0aEpNqFfrrkgf4IgHiDyTTz9Eok3b2vvPAzA8+bEwOaNQTdFOWg?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdb7cbc8-9d80-47f2-1961-08da63a52461
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 01:23:35.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u7kGxe80qm0/U6DmDNQOkhAN4KZQV8DhkMljp4RxlIVBMUzsLRwZAt9rCWUOFuuvogrovHNNtDHEtztxBuwiVLlN4vfyEPMFx1xeunR3HHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2535
X-Proofpoint-GUID: PdEmASKxCT5V37HWM1mwkAnoFZwQWVvl
X-Proofpoint-ORIG-GUID: PdEmASKxCT5V37HWM1mwkAnoFZwQWVvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_26,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 01:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167887

Backport patch to fix CVE-2022-34835.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...ffer-overflow-vulnerability-in-i2c-m.patch | 126 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch b/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch
new file mode 100644
index 0000000000..04ded5b119
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch
@@ -0,0 +1,126 @@
+From 8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409 Mon Sep 17 00:00:00 2001
+From: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
+Date: Fri, 10 Jun 2022 14:50:25 +0000
+Subject: [PATCH] i2c: fix stack buffer overflow vulnerability in i2c md
+ command
+
+When running "i2c md 0 0 80000100", the function do_i2c_md parses the
+length into an unsigned int variable named length. The value is then
+moved to a signed variable:
+
+    int nbytes = length;
+    #define DISP_LINE_LEN 16
+    int linebytes = (nbytes > DISP_LINE_LEN) ? DISP_LINE_LEN : nbytes;
+    ret = dm_i2c_read(dev, addr, linebuf, linebytes);
+
+On systems where integers are 32 bits wide, 0x80000100 is a negative
+value to "nbytes > DISP_LINE_LEN" is false and linebytes gets assigned
+0x80000100 instead of 16.
+
+The consequence is that the function which reads from the i2c device
+(dm_i2c_read or i2c_read) is called with a 16-byte stack buffer to fill
+but with a size parameter which is too large. In some cases, this could
+trigger a crash. But with some i2c drivers, such as drivers/i2c/nx_i2c.c
+(used with "nexell,s5pxx18-i2c" bus), the size is actually truncated to
+a 16-bit integer. This is because function i2c_transfer expects an
+unsigned short length. In such a case, an attacker who can control the
+response of an i2c device can overwrite the return address of a function
+and execute arbitrary code through Return-Oriented Programming.
+
+Fix this issue by using unsigned integers types in do_i2c_md. While at
+it, make also alen unsigned, as signed sizes can cause vulnerabilities
+when people forgot to check that they can be negative.
+
+Signed-off-by: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
+Reviewed-by: Heiko Schocher <hs@denx.de>
+
+CVE: CVE-2022-34835
+Upstream-Status: Backport [8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ cmd/i2c.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/cmd/i2c.c b/cmd/i2c.c
+index 9050b2b8d2..bd04b14024 100644
+--- a/cmd/i2c.c
++++ b/cmd/i2c.c
+@@ -200,10 +200,10 @@ void i2c_init_board(void)
+  *
+  * Returns the address length.
+  */
+-static uint get_alen(char *arg, int default_len)
++static uint get_alen(char *arg, uint default_len)
+ {
+-	int	j;
+-	int	alen;
++	uint	j;
++	uint	alen;
+ 
+ 	alen = default_len;
+ 	for (j = 0; j < 8; j++) {
+@@ -247,7 +247,7 @@ static int do_i2c_read(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint	alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+@@ -301,7 +301,7 @@ static int do_i2c_write(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint	alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+@@ -469,8 +469,8 @@ static int do_i2c_md(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	addr, length;
+-	int alen;
+-	int	j, nbytes, linebytes;
++	uint	alen;
++	uint	j, nbytes, linebytes;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+ 	struct udevice *dev;
+@@ -589,9 +589,9 @@ static int do_i2c_mw(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	ulong	addr;
+-	int	alen;
++	uint	alen;
+ 	uchar	byte;
+-	int	count;
++	uint	count;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+ 	struct udevice *dev;
+@@ -676,8 +676,8 @@ static int do_i2c_crc(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	ulong	addr;
+-	int	alen;
+-	int	count;
++	uint	alen;
++	uint	count;
+ 	uchar	byte;
+ 	ulong	crc;
+ 	ulong	err;
+@@ -985,7 +985,7 @@ static int do_i2c_loop(struct cmd_tbl *cmdtp, int flag, int argc,
+ 		       char *const argv[])
+ {
+ 	uint	chip;
+-	int alen;
++	uint	alen;
+ 	uint	addr;
+ 	uint	length;
+ 	u_char	bytes[16];
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 0d2464d74b..f2443723e2 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -3,6 +3,7 @@ require u-boot.inc
 
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
+                   file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.33.0


