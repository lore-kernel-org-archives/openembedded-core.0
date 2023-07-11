Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1ECEB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:20:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.1232.1689117602187039250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=UDtf4jo4;
 spf=pass (domain: welotec.com, ip: 40.107.7.71, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvP+p2wUo1luhVp0p8jHGVakg5J64phJuxM6/PXEgoeP4Y/Nsna3d4j584oedoBouSusVPd9i3PhxYy/jN2+U4mDH5WYe47jJ2EohVV4u1n8XPjDJo+eZtk2zOHLNxeqitvoSTd7xQzKabPVQwY0xdcJEuza89WRcqctBSgivmQJtZxvAevXxUJMTpK6sp7D4FYimXiw9WSa33kqAJ03uyPrYPXaB2pmM9xrXt/dB6ztsdvUBkLMszJmaaaoiSxFFs6PBzw/HDP7KBdE8TOWQiKwmQU4BVrE7oaDeS7KSWhGFBaXVseYRrYFPRgZ9PphO59Kdjf/E+QIZHrfeCZkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWza4x5sMKGr6WA3VgA4NcjzrhWX++jvVfN8ud+M9Wo=;
 b=JYM6+Q8IHrd9wKVVrHAM+2HqV0dG5vXmYYxwNmVG9OiYMSTICwDqn5NDBL18PRN+kYvZ9GMM5ugqP3Sv9qnw8QZLTcoQezKWdyi0xFvxyU6C4mAmodjfHQy2ZpLnqNsicqUHpRzM2OC1/KuQ5gVQaS0ucuopTqNeBG3qOIAe5hL7tAiqQ2gTwZCbBRK3O3EdEVbmNXoBWSP1/TIBFfVKvAiRjsc3wpkY6QmA9yD2JWaNcZyVXhm3WcKGcmV2uX6cKpxKb9hKvluFjJpqOzFM8lmf3tH2ewpUNEy0p8J9vCFJ266aLRK0yoZHde5WRTN6iAbLe+/jV2Lm9AjeYifdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWza4x5sMKGr6WA3VgA4NcjzrhWX++jvVfN8ud+M9Wo=;
 b=UDtf4jo4xKJjvgauLe+rQxVjYNVZbdtsIXQl3b6qkyD8HC8DyAZubSyu2VkjIPfG8V6vpjLVMeFY9L6vNO2lhHCbGps7r9qR4YNRYhzeLp6woaQkNIPYN9MNnw5idsj0UwS4AW+Yr2/KIEBTyWVGqsGwpMOGUgbuKnj7iI7sNBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 11 Jul
 2023 23:19:57 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:19:57 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Date: Wed, 12 Jul 2023 01:18:46 +0200
Message-ID: <20230711231847.2211186-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::10) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: e866b7ba-59e3-4738-3861-08db8265571e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GRQxNX33i86ZTHLm59HcP/Iy8dyHY8frV8/qIhfdHjSCVvpciuiB5Ii5A0rmTtymCrcMl/6MmYAfrSKSMBhXV53UdewUZkGvErcrkQpTU06ngmtaPkA+wc4cVXqVG5l/EE1V2F/nl2Ax4j+vLE8G1BYr7lR1VFfh2vVrbfiPWRogbW6pjlGTlBE9hzK7/V7Mb3DlMy2i3gGE7DIFIprmq0o4b4jIaQ55j9ztZmI0t/f7OPmpnWMWpRyahrjR5FP1Xc/AMJsy0a5161IE4JiVQFxZoUaqxVMg7Ypd60ppI/RK49Sb71Wl/02aixVV72laJepJbOHvjP0u2JlslP4ly7LUS0NcW4JIsAeUtDw8jiIPFbXbew84VNO/oLZly754xLy+sLCtF/3ooBy1aztWqf6HBFT6mIawVTRhkOBRO7NV4CzhrSsiEbJ7shj4K1subcJECngmRxLyhj3wPsQvRqxvyiByPyZ8OgimZbJ+d3fJ7hfgS6qndl1hKYywhaY4lvnfVTRGJnCg3CXJaG4p16paScbfcQopxFiS50dxcmIvc1dMNHe6f5bHC4bTDv3Qg35yow3iNmQpYfqJTbbeiFwqs2M5NbV2vLFbdiuNW40=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39840400004)(136003)(451199021)(36756003)(2906002)(478600001)(6666004)(86362001)(6486002)(41300700001)(52116002)(26005)(5660300002)(8676002)(8936002)(66946007)(316002)(38100700002)(6506007)(4326008)(66556008)(38350700002)(66476007)(1076003)(6512007)(107886003)(83380400001)(186003)(66574015)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aDlJNGyOd3IB4bWBZH2p+M13VniXMv0rnRHNWZRVfugEZb26FODv36jA0RrZ?=
 =?us-ascii?Q?2wwYRitqenEMbCXrQwbQTRgp/8J4GSGy66s3Pgukqru9DDyP98A7HtVSJ0+j?=
 =?us-ascii?Q?Dx0RGWabizxlO4Fdxo7amQOE1zYX2siDTHCUo8wX2KuAfxNA1+bcTtJfxB/7?=
 =?us-ascii?Q?S5nhW63owRUKggdxpo+xHmEIgsVI2ix6K3StvXdK8iip4paYRWQCmxhgRGwC?=
 =?us-ascii?Q?1vfgMDxKtK+7NmSV2CpovljmjYTDYS1jwnxmJSLmEUpkiYa2zO87Zw4eVqh2?=
 =?us-ascii?Q?Y70wzHOCbfhmJAiJyMUEL2+4ywD9zqnpJrhW+Px5AnT8lQ/FDMcMa+TIhsLy?=
 =?us-ascii?Q?3cEepJMQhNDHkKjkMrDZonILfWwWRzg4Z7j5KB8aIdcmEizDFC1pyoNgIAmd?=
 =?us-ascii?Q?qiSCOaRYDmKs9I0rlrJTNd5EKCNwer6ddvjxHrHQcan3oZ6e1aAyzRrKD525?=
 =?us-ascii?Q?5X17C5Pvp2fjPYxgp713a/uzVJSvSzezpjHsZl3zXPwjb+C7NM7e5mn18afQ?=
 =?us-ascii?Q?aal9s8fW0thjRD9JwkRZmnpuaYTETBSlvLZsDoc1dxH1u6HGHNbM4aouLnps?=
 =?us-ascii?Q?FRqYLYyXN/RNwxEaaFfROgGmgANoxJCHkZ3DOZbGL+OcF51ffgR/5FXIkwXO?=
 =?us-ascii?Q?XWvVVonic/fw0rHzxmnhWQt6fwyFKAoF7SxFzNO1+afS4Xipn+xuI/kG6T9i?=
 =?us-ascii?Q?VKvVsYMXALDNk6+2Gq23aYEpWKPnGrYQ0pXWsrjA8O8mxwBcxd4Rwim6hHvI?=
 =?us-ascii?Q?gj1yinvTLfXHL7kr52lq1oV5AvGdB33mE3Cs8uwDeQN2+Uq1gg+lY2o2gMAx?=
 =?us-ascii?Q?otow9E9PFuyzFC2E4T2jXVZBxAOSeXQ9XSkhrM9Jm5GOhJL+TS2cOnSLn6RO?=
 =?us-ascii?Q?1AtBJqnBalfHdy0S6j7QuIn15c/YiYoQXfT3PdMJ9LyU2uG0Q7CdIDh4YqeS?=
 =?us-ascii?Q?k8KRpLUSfi1oGHpcczAjepIRxJgyFG6TPZkqtxq9iu4OPrbjBuOp4brx4Wk0?=
 =?us-ascii?Q?9BEsG7veSS3G0mJnmHu2ZdS7xkPG97xe7q47f41kUqUUvqJsq3DW0XBQnjY2?=
 =?us-ascii?Q?fGOdYCjIhNCnTQjhOZ91u+CvxZkRaxXxjvrZ0V1u00H79/3LObrRzo7+pZHJ?=
 =?us-ascii?Q?eine7Bm17rVfa+zqfl/I8vAu0/JQWfJDJE3HAoLFw3MU4fTWtgRyIrwocPm0?=
 =?us-ascii?Q?wodTyH8GWjEleoczdUAxs1XxMaRxXoT7tSPrh9CUrApTamaZM6/79bFdkd/M?=
 =?us-ascii?Q?VcoBAcSV8J5c63MhTH1BnY1Yn91a8nr0BQD411k36VIKLTRTRUoOGwF2v4de?=
 =?us-ascii?Q?226B0c6x/qnCnGOM9ZfOxIhMYV1jGDo6o3xuEwQC9o6Mt0yMRLiBEFM/Amn3?=
 =?us-ascii?Q?e/wbWQOgvPudoqSwvFhc4OMThxXLN3DuGeiochsWMYW+P+ynJUgcaVPbFxHX?=
 =?us-ascii?Q?HBbfkENj/1Q2fsMYDG1P+7/w4EovtRARoL3gKwyAicakr3qKKtGMnC0dkMsU?=
 =?us-ascii?Q?rBUZu5NKHdoyRL/ZgBZVpdFUwnX1bl05LY/yYgI4VV1SFlBSECL7EB/rP0fO?=
 =?us-ascii?Q?cVrLzt0kZddE9y62lp5gJh9EgWOUkVPYTzT/EJU+?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e866b7ba-59e3-4738-3861-08db8265571e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 23:19:56.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaV0yM/yr3bVaEV35bfx4tIbz5oImTnuxHnjZHMTQpg0spTb0S4ar7FzrzH1abyn/94UdybrviUvOXa+Iw0XBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184156

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 70 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.5.0.bb            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..08ecf969a8
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,70 @@
+From f177abcba7d72fa1afd0bc23f38beb4fe88fc040 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 5 Jul 2023 10:31:13 +0200
+Subject: [PATCH] opkg-build: add acl and xattr support
+
+Add support for tar archives created with --acls and/or --xattrs options,
+PAX header format.
+
+GNU tar and libarchive already supports ACLs and extended attributes.
+We can now add this support as well to opkg-build script in order to use
+fsetattr or setcap inside do_install command and end up with a file in
+an image with the relevant ACLs and xattrs.
+---
+ opkg-build | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..8d9bcfa 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -145,6 +145,7 @@ You probably want to chown these to a system user: " >=
&2
+ ###
+ # opkg-build "main"
+ ###
++attributesargs=3D""
+ ogargs=3D""
+ outer=3Dar
+ noclean=3D0
+@@ -166,7 +167,7 @@ compressorargs=3D""
+ tarformat=3D""
+ if tar --help 2>&1 | grep -- "--format" > /dev/null;
+ then
+-    tarformat=3D"--format=3Dgnu"
++    tarformat=3D"--format=3Dposix"
+ fi
+=20
+ compressor_ext() {
+@@ -197,13 +198,17 @@ compressor_ext() {
+ : <<=3Dcut
+ =3Dhead1 SYNOPSIS
+=20
+-B<opkg-build> [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a>] [B<-O>] [B<-o=
> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destination_directory>]
++B<opkg-build> [B<-A>] [B<-X>] [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a=
>] [B<-O>] [B<-o> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destinatio=
n_directory>]
+=20
+ =3Dcut
+=20
+-usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-=
o owner] [-g group] <pkg_directory> [<destination_directory>]"
+-while getopts "a:cCg:ho:vOZ:" opt; do
++usage=3D"Usage: $0 [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_arg=
s] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]"
++while getopts "Aa:cCg:ho:vOXZ:" opt; do
+     case $opt in
++        A ) attributesargs=3D"--acls"
++            ;;
++        X ) attributesargs=3D"$attributesargs --xattrs"
++            ;;
+ 	o ) owner=3D$OPTARG
+ 	    ogargs=3D"--owner=3D$owner"
+ 	    ;;
+@@ -314,7 +319,7 @@ export LANG=3DC
+ export LC_ALL=3DC
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | s=
ort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $ta=
rformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data=
.tar.$cext )
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --no-recursion $m=
time_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs=
 > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=
=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $t=
mp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index b27e3ded33..edf730711e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'updat=
e-alternatives', 'virtu
=20
 SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
+           file://0002-opkg-build-Add-acls-and-xattrs-support.patch \
            "
 SRCREV =3D "9239541f14a2529b9d01c0a253ab11afa2822dab"
=20
--=20
2.34.1


