Return-Path: <stanislav.vovk@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD644CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:20:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.46])
 by mx.groups.io with SMTP id smtpd.web10.78699.1756822814848128095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G1aSsYfA;
 spf=pass (domain: est.tech, ip: 52.101.65.46, mailfrom: stanislav.vovk@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LokmS0xi7Dk7Poid09xn2PJPwTKLsbImvTL9503tHD5+R+SiLNwGQRzZsdvSSs+uFcVjf5SN9YQyF03kZW03pB4+NWh0ixG4bWbB1bXVd6HWX2peAXfAFn8g5WMgfgInOiCRASsEmWkvtiVCTmAWcKspRSJm5fIHVM8x6MUeoL2a04V+TYASrXrlBH80M8hzIMk3i8Ei4qo2/zsEjXW2NTocL1NvSvmgOBmSHgQIijbpqtwro694IWIMXeL7nYJBVQlunsy5OGGM5F/HplM/eLMbwuJATmDWLrjFk9OJL/P8CT22YRZty8LhMq4Gc3ZWvrO62z3hjS59HROeaRwN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RFz1hfy8TTaO1M8t3aEO/XwXvzy65Y+9tVHaod8hnQ=;
 b=t4PSuBuwzsyQ9eWvL6a53F/JY1NMgtaVLPzL2LrSoAEVBUz0X+vsxEqBKfFdnSnT0TvdONs2/IQMsVmtKawPKEdnGJuolqL6B+UfFtV6L8rpNGC/9hKA0vD2RdoKLWBs+1Q9fE4Pm6mElnv1rRoyGXmgNtHX5Q/22CBqa4ty6STb7OJP0WI0EL+HpldNMPJDYiXGa+MM6nAJLm8ghNQYWlXtE0rwoxwPSeBmm/xl/l3GEI3ZMqgo0VPYULq7RXrfrLFp5cu90vPSOYs+rm6IOrsh3P46IgMmTahtzXvnOokAxb7F0gU3tC6QD3ETaebbNzGolbhgP5YE7t853ED+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RFz1hfy8TTaO1M8t3aEO/XwXvzy65Y+9tVHaod8hnQ=;
 b=G1aSsYfAGWVlg/3hUGJqxWksEeqjwVy22vADr/Ii4MGFeSn0T3aVTgqqDYL/g7IN5HdKwGUaC757dbrA8t382aiWF/99iwo0hif40jKz8PYs/Ydr4zW5mZmrq11pyJNFR2E9ohAyE67+9H+ayplQysOBD4ws1+kewK8rz7519SfuSe5xRBINfCe7tEyyq/7MLZCyK1oVTRVN6UwzZ0UIE+DXYESh9y/ce++9YH4xj3b2sNoGvbz0LjOlt7uMvT5hcJ3dWpxFRFs5hedpeJ9/mnjR2MhrRKaTPtcTV0Th6WogFpeSZHDbr6JY57v06KV73fIEeQHW5LLaDRTLjOk5+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1697.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::20)
 by PA1P189MB2662.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:461::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:20:09 +0000
Received: from AM9P189MB1697.EURP189.PROD.OUTLOOK.COM
 ([fe80::6f26:aadd:2401:d568]) by AM9P189MB1697.EURP189.PROD.OUTLOOK.COM
 ([fe80::6f26:aadd:2401:d568%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 14:20:09 +0000
From: Stanislav Vovk <stanislav.vovk@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Stanislav Vovk <stanislav.vovk@est.tech>
Subject: [OE-core][scarthgap][PATCH] libpam: fix CVE-2024-10963
Date: Tue,  2 Sep 2025 14:19:16 +0000
Message-ID: <20250902141916.844754-1-stanislav.vovk@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::16) To AM9P189MB1697.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1697:EE_|PA1P189MB2662:EE_
X-MS-Office365-Filtering-Correlation-Id: b67feecd-39c9-4cd0-d041-08ddea2bd27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tj9u+dKRz4Cp8Hn2MBZQQ/+qZ7SyTo2W0kxkoYmlJ4XDEfDxy4B8go+zeDed?=
 =?us-ascii?Q?oQpSdWma6OVp/W2ME7ZmUzpJofTfWHV3l2GTT7IDjxnwdm+K/+TE94XcWVFh?=
 =?us-ascii?Q?lTIN0kKMDODFd3nEMLmM9DHoFKC/wZ6dEU/Raf4LQGoh/VeziUQ1yclknNHT?=
 =?us-ascii?Q?iQK8jNtd0kiBUUZs6yJt4+2Y1jl+cjJ7ZOv1n+S5xWThlaL9rWU3ohua8BGO?=
 =?us-ascii?Q?lCuqDBtOIZdhBa6xtC89EOe3gmR2pQyRmq0eaQ6Cyk2jHUUYr68ayg0CXtgz?=
 =?us-ascii?Q?3mNjTT4r5vaWkxrgCl3hCIgo+aXJZG25oX9lDFm8N9foDYw/0p81+fuCzs4q?=
 =?us-ascii?Q?vtBlzu8gbb4aAs8iqjH/5HIDLRxMrCu8d8IP2405lb9TCUZigFKHCBG063EZ?=
 =?us-ascii?Q?ZezYhf5WIRiYEZaL9BDXs+Th4DpzXIgrkCEWjF1JksT+SVF0Ikt7LL8Jt7C2?=
 =?us-ascii?Q?Hk/VBYQO4s1xwOcSczlior0K0zVcsRMqFoXYR6Vw4AuhBncURsQ6PdJi454v?=
 =?us-ascii?Q?/H9iXY2cQAqXY4URGMcOTpd7ehSSQLcK9WwLUgqDy4tAXx+mVDRgEhcCcILd?=
 =?us-ascii?Q?8eXrpQSNroMZPEKZTY2Yj6iH0y3Rahp7g4RxhqAVl2VXA0GdNzNntbpGyE3I?=
 =?us-ascii?Q?Gs5A9kzKi4V0bgMFBMspOu4v3BR0WfDbm1xdSJ/rk4Mqf3L4rZa+cTPvoQ0d?=
 =?us-ascii?Q?SZ917mYPbeHHFUUU2pFjpXcRO+Ps4cu6XFttqHxZeAa0J+ABLcjCT0b9r3yS?=
 =?us-ascii?Q?ED5ClgN4wSRk7lHlDm9+GYv8a0xxc0CBUqS+edBHS/+CJNm0I8CWJWHgVYW1?=
 =?us-ascii?Q?3sOcSOxeWlDU1JC+VjmQOGmFTnvVoPOzselpRKjtV9Nu96w6h9qA3yfNZfDw?=
 =?us-ascii?Q?JDPw4XIrVO1nagOwLzp+3hjxhNxeFke3ps95mdkdLkUb3tahRKUq1AcPK9rE?=
 =?us-ascii?Q?mToilQSfpHbGz8MUSsmABBxH5P/LUO1byPzHhXeXyARtoWvQbg0TBYI1mzRB?=
 =?us-ascii?Q?oHkd/0Jl1gkjN5BQzk9eHn1zYj0jiXLY6A3hI8sFGRI2L2ns2c2NLO6cW92s?=
 =?us-ascii?Q?6O6H4iCIHISGgIGX2X3bwYIxx0jsi1RwXaSFrvf0y+eo0MEPZSnxlo/qqfjo?=
 =?us-ascii?Q?ItudvRSPeRK8BK/uM3zVHIcs8FEXTECi5+67IyOzu1YsMo406oRrVP2qMi21?=
 =?us-ascii?Q?cHtvhbtHx92F2+5arcI0iyRdd26EW2eqpj7ypPOGKiajm23w3WVzcpkq/JrW?=
 =?us-ascii?Q?7QsrKBtFxMjEDDc7UMUcPv3PfwgbA6+jV34xvrwP35f1O8TktyeQHQ9RK9ec?=
 =?us-ascii?Q?WllVIB/dzO+MEqYciN9tyfKrSp40eBaCgQVCNUiriRlD0takQh93ziNZGDpd?=
 =?us-ascii?Q?r/Hbep8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1697.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LSrtUyI+gU/gZt/MbycBFBjUbnUk5krMrRu9Qy6LM8DDWWKBuOwKYoNl7bC1?=
 =?us-ascii?Q?xtuVzCDzcTcSfU/4xJ9UHiaygrzJ4yE0Jvmnrx0P7FZ1UAH7WphXyjWC7b4q?=
 =?us-ascii?Q?t7Nus6DuBZ6zYRGETqp6fFhgcRdZrs3tqV36m0oy907z+DEYbax4KIPhJNbt?=
 =?us-ascii?Q?yUik8Xo5HNiE73JjTAxz394cr89YO3/6P6j5YUkEAN2xVkh1FjNMhzRa6jLc?=
 =?us-ascii?Q?Qm98j2DXEIQYTM3KRJOYsu/tCiRI/AowoQNwDm6U2IRSz+Q33yU+9u3fj7qG?=
 =?us-ascii?Q?80TK7BIGZ3dLEAHe+MSDQm4DX5mcxbe0HzjmIEB8bIjsfeq6kHrwb+pjPOf3?=
 =?us-ascii?Q?4gxdS7rhVrRkTQWNAiaDyiWpM9ipw1zT+UcnMkycauYqE/FzR6kx/xYM8crM?=
 =?us-ascii?Q?ZCm+wPhmkSXxw9kn1YL/oXCImA0Agkhqeo/9Vbnf2zfMcjZD160GNCacoUNT?=
 =?us-ascii?Q?ATuHVEZFKIt1gWpq16b0cB9W19fmyicLQAZqiSoeZ/xhTiDKRuSGix1kYIDN?=
 =?us-ascii?Q?R+/Pn8c2LscJSGEGpu5NJB4/tjH2rZKrRXkKYGNsd3BcYkyA1of11FGJcROt?=
 =?us-ascii?Q?SYdQuuFiNnFSAw/YMLNGMaTwlyLUCDFVtqng1LAEIEpkH70x7HoEttdKYVCR?=
 =?us-ascii?Q?AAtOdyc30uBzD0xksymz03Bi0Ru/vaR105uBIBLqLdELlRRpSbBzWir5yWla?=
 =?us-ascii?Q?6ap8H3oIATR9dhH8DcRi7iIg+tsemAn2SWqxqxNgZMq3+3VvsBkUOVvzX6rg?=
 =?us-ascii?Q?ZLgZd5nI0BuLdofftQW64+l38wqUIoIR84qrxAac1StB+6goW2sYlg5k0BiQ?=
 =?us-ascii?Q?eQGMUcp5XLrYiYJAzqKc4vZ1qgbBZYqVdQ5kHUPThy9pbw3emklfNGczJT/I?=
 =?us-ascii?Q?aN3Rp0zcGrTjrBS4H8jlb+LMJN5uVH+02S0SqbWPT4Wuu+tBct5fISg7lIWT?=
 =?us-ascii?Q?sRdY0WTjFe8whxAyfhBDMb0D3A/rsGtkYHzIAECQE9wLiw7I2jL8Zis74tFe?=
 =?us-ascii?Q?p7KDjS0duGt6xvKE+d5Oi8zOrQeZenXRGRbct8rRnOZYXhzfKZilRN19Davw?=
 =?us-ascii?Q?J2wu6fmsH58ahnw0F0gcmxHL3kw+J+MA57XiQBgxajgJ+aX27G/MPv9dpFLt?=
 =?us-ascii?Q?0FVWoO3Mt3JyuCgxeE5kRKVGoi7f+VZy0EOEv20nWLTcbdyzzpA+2V8e4QC3?=
 =?us-ascii?Q?efuwv5ZQTgJMzssDvF2coesd643UvcrfEmZfYrC1Eko3lTjFbZZf6bQcmDuy?=
 =?us-ascii?Q?drC3xzv2LMJvhGtG1EC+xz7JmG8Ppg+2IB4BEcjYjs9jVVtQWJV3HseraCmh?=
 =?us-ascii?Q?3LcN7kpE+5t5Vvc2BznnmfpPzlk+jEVvSzAmoNmlj7s0xhZxjneuTwJAVc7q?=
 =?us-ascii?Q?/28CVNvW5aBbvBYvf5rrmsyXFrgEneFH0yyopPP5dyYVi4o84P/KkgJ2JOlz?=
 =?us-ascii?Q?ibv/5MdvY3uV8Lp2drHlakcKjDRr8uBUo/AFF37ObW8mcbMNvgIZakctlv9p?=
 =?us-ascii?Q?xFPGLOKmnX5YV4NaTmXAI1J+t9fjwM7i6W/6n639DRRRq4xa37SkLYowR2AO?=
 =?us-ascii?Q?W4gxVRbuVbvqpM/+C8EY9ef6mianT5D5ngqYGZ4587+PSFnk0qK128TU0EXm?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b67feecd-39c9-4cd0-d041-08ddea2bd27f
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1697.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:20:09.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sw/XKNP8g9Hw11MifhTbq1wuiANeSO6YMd4ErhhAJcelJ5bDahMmGer74LqtjNbOYk2Xvl+PjyoQsZCqM4ywNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222731

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commi=
t/940747f88c16e029b69a74e80a2e94f65cb3e628

Signed-off-by: Stanislav Vovk <stanislav.vovk@est.tech>
---
 .../pam/libpam/CVE-2024-10963.patch           | 265 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch b/meta/r=
ecipes-extended/pam/libpam/CVE-2024-10963.patch
new file mode 100644
index 0000000000..b79831f0e5
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
@@ -0,0 +1,265 @@
+From f9ccee5c4c6cb0d4197b08ebeb36c1dceffe82e8 Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@suse.com>
+Date: Thu, 14 Nov 2024 10:27:28 +0100
+Subject: [PATCH] pam_access: rework resolving of tokens as hostname
+
+* modules/pam_access/pam_access.c: separate resolving of IP addresses
+  from hostnames. Don't resolve TTYs or display variables as hostname
+  (#834).
+  Add "nodns" option to disallow resolving of tokens as hostname.
+* modules/pam_access/pam_access.8.xml: document nodns option
+* modules/pam_access/access.conf.5.xml: document that hostnames should
+  be written as FQHN.
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/9=
40747f88c16e029b69a74e80a2e94f65cb3e628]
+CVE: CVE-2024-10963
+Signed-off-by: Stanislav Vovk <stanislav.vovk@est.tech>
+---
+ modules/pam_access/access.conf.5.xml |  4 ++
+ modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
+ modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
+ 3 files changed, 105 insertions(+), 17 deletions(-)
+
+diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/acc=
ess.conf.5.xml
+index ff1cb223..158fc7df 100644
+--- a/modules/pam_access/access.conf.5.xml
++++ b/modules/pam_access/access.conf.5.xml
+@@ -220,10 +220,14 @@
+       the fields they are ignored. However if the list separator is chang=
ed with the
+       <emphasis>listsep</emphasis> option, the spaces will become part of=
 the actual
+       item and the line will be most probably ignored. For this reason, i=
t is not
+       recommended to put spaces around the ':' characters.
+     </para>
++    <para>
++      Hostnames should be written as Fully-Qualified Host Name (FQHN) to =
avoid
++      confusion with device names or PAM service names.
++    </para>
+   </refsect1>
+=20
+   <refsect1 xml:id=3D"access.conf-see_also">
+     <title>SEE ALSO</title>
+     <para>
+diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_=
access.8.xml
+index 010e749e..1182c907 100644
+--- a/modules/pam_access/pam_access.8.xml
++++ b/modules/pam_access/pam_access.8.xml
+@@ -20,15 +20,18 @@
+     <cmdsynopsis xml:id=3D"pam_access-cmdsynopsis" sepchar=3D" ">
+       <command>pam_access.so</command>
+       <arg choice=3D"opt" rep=3D"norepeat">
+         debug
+       </arg>
++      <arg choice=3D"opt" rep=3D"norepeat">
++        noaudit
++      </arg>
+       <arg choice=3D"opt" rep=3D"norepeat">
+         nodefgroup
+       </arg>
+       <arg choice=3D"opt" rep=3D"norepeat">
+-        noaudit
++        nodns
+       </arg>
+       <arg choice=3D"opt" rep=3D"norepeat">
+         accessfile=3D<replaceable>file</replaceable>
+       </arg>
+       <arg choice=3D"opt" rep=3D"norepeat">
+@@ -127,10 +130,37 @@
+             Do not report logins from disallowed hosts and ttys to the au=
dit subsystem.
+           </para>
+         </listitem>
+       </varlistentry>
+=20
++      <varlistentry>
++        <term>
++          nodefgroup
++        </term>
++        <listitem>
++          <para>
++            User tokens which are not enclosed in parentheses will not be
++	    matched against the group database. The backwards compatible default=
 is
++            to try the group database match even for tokens not enclosed
++            in parentheses.
++          </para>
++        </listitem>
++      </varlistentry>
++
++      <varlistentry>
++        <term>
++          nodns
++        </term>
++        <listitem>
++          <para>
++	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
++	    addresses will be resolved. Which means to allow login from a
++	    remote host, the IP addresses need to be specified in <filename>acce=
ss.conf</filename>.
++          </para>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term>
+           fieldsep=3Dseparators
+         </term>
+         <listitem>
+@@ -168,24 +198,10 @@
+             "Domain Admins" contain a space.
+           </para>
+         </listitem>
+       </varlistentry>
+=20
+-      <varlistentry>
+-        <term>
+-          nodefgroup
+-        </term>
+-        <listitem>
+-          <para>
+-            User tokens which are not enclosed in parentheses will not be
+-	    matched against the group database. The backwards compatible default=
 is
+-            to try the group database match even for tokens not enclosed
+-            in parentheses.
+-          </para>
+-        </listitem>
+-      </varlistentry>
+-
+     </variablelist>
+   </refsect1>
+=20
+   <refsect1 xml:id=3D"pam_access-types">
+     <title>MODULE TYPES PROVIDED</title>
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_acce=
ss.c
+index f70b7e49..d06496c3 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -97,10 +97,11 @@ struct login_info {
+     const char *config_file;
+     const char *hostname;
+     int debug;				/* Print debugging messages. */
+     int only_new_group_syntax;		/* Only allow group entries of the form "=
(xyz)" */
+     int noaudit;			/* Do not audit denials */
++    int nodns;                          /* Do not try to resolve tokens a=
s hostnames */
+     const char *fs;			/* field separator */
+     const char *sep;			/* list-element separator */
+     int from_remote_host;               /* If PAM_RHOST was used for from=
 */
+     struct addrinfo *res;		/* Cached DNS resolution of from */
+     int gai_rv;				/* Cached retval of getaddrinfo */
+@@ -148,10 +149,12 @@ parse_args(pam_handle_t *pamh, struct login_info *lo=
ginfo,
+ 	    loginfo->debug =3D YES;
+ 	} else if (strcmp (argv[i], "nodefgroup") =3D=3D 0) {
+ 	    loginfo->only_new_group_syntax =3D YES;
+ 	} else if (strcmp (argv[i], "noaudit") =3D=3D 0) {
+ 	    loginfo->noaudit =3D YES;
++	} else if (strcmp (argv[i], "nodns") =3D=3D 0) {
++	    loginfo->nodns =3D YES;
+ 	} else {
+ 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
+ 	}
+     }
+=20
+@@ -730,11 +733,11 @@ remote_match (pam_handle_t *pamh, char *tok, struct =
login_info *item)
+=20
+     if (tok[0] =3D=3D '.') {			/* domain: match last fields */
+       if ((str_len =3D strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) =3D=3D 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet network n=
umbers (end with ".") */
++    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet network n=
umbers/subnet (end with ".") */
+       struct addrinfo hint;
+=20
+       memset (&hint, '\0', sizeof (hint));
+       hint.ai_flags =3D AI_CANONNAME;
+       hint.ai_family =3D AF_INET;
+@@ -805,10 +808,43 @@ string_match (pam_handle_t *pamh, const char *tok, c=
onst char *string,
+     }
+     return (NO);
+ }
+=20
+=20
++static int
++is_device (pam_handle_t *pamh, const char *tok)
++{
++  struct stat st;
++  const char *dev =3D "/dev/";
++  char *devname;
++
++  devname =3D malloc (strlen(dev) + strlen (tok) + 1);
++  if (devname =3D=3D NULL) {
++      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name: =
%m");
++      /*
++       * We should return an error and abort, but pam_access has no good
++       * error handling.
++       */
++      return NO;
++  }
++
++  char *cp =3D stpcpy (devname, dev);
++  strcpy (cp, tok);
++
++  if (lstat(devname, &st) !=3D 0)
++    {
++      free (devname);
++      return NO;
++    }
++  free (devname);
++
++  if (S_ISCHR(st.st_mode))
++    return YES;
++
++  return NO;
++}
++
+ /* network_netmask_match - match a string against one token
+  * where string is a hostname or ip (v4,v6) address and tok
+  * represents either a hostname, a single ip (v4,v6) address
+  * or a network/netmask
+  */
+@@ -866,14 +902,46 @@ network_netmask_match (pam_handle_t *pamh,
+ 	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
+ 	  {
+ 	    return NO;
+ 	  }
+       }
++    else if (isipaddr(tok, NULL, NULL) =3D=3D YES)
++      {
++	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
++	  {
++	    if (item->debug)
++	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", to=
k);
++
++	    return NO;
++	  }
++	netmask_ptr =3D NULL;
++      }
++    else if (item->nodns)
++      {
++	/* Only hostnames are left, which we would need to resolve via DNS */
++	return NO;
++      }
+     else
+       {
++	/* Bail out on X11 Display entries and ttys. */
++	if (tok[0] =3D=3D ':')
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=3D%s is X11 display", tok);
++	    return NO;
++	  }
++	if (is_device (pamh, tok))
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=3D%s is a TTY", tok);
++	    return NO;
++	  }
++
+         /*
+-	 * It is either an IP address or a hostname.
++	 * It is most likely a hostname.
+ 	 * Let getaddrinfo sort everything out
+ 	 */
+ 	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
+ 	  {
+ 	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
+--=20
+2.43.5
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-exten=
ded/pam/libpam_1.5.3.bb
index 815085cc82..4c27767ab1 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM=
-${PV}.tar.xz \
            file://CVE-2025-6020-01.patch \
            file://CVE-2025-6020-02.patch \
            file://CVE-2025-6020-03.patch \
+           file://CVE-2024-10963.patch \
            "
=20
 SRC_URI[sha256sum] =3D "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773=
b3c54b0a818283"

