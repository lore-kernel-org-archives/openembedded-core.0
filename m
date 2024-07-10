Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34129C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 21:01:10 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.54])
 by mx.groups.io with SMTP id smtpd.web11.5944.1720645263342187223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 14:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=BHTmTGEv;
 spf=pass (domain: prevas.dk, ip: 40.107.103.54, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnh42cCNqHT5v57cyIYBNwepJ3BHQaUDgQhTrNltDvh2aOQ5aOE3xu/Q7jatyCXDnYUDBgp/RbfFFBOpiep3W2P0b2EwNLm2GtuGCg+PYdB8CsS4/NuW59PJTBwmw5dLDCD7WGLTzDBEA2OO4d7rUYvpLKYGDNst3CTdR2JOPRtkSB9FDG1gzk/8HZ1nQ6aHPr4eTCekosFSSC93m+X3llWH6aLJbAgr4QJbWT0DhqC1VzhZN5srkTETTPvWRuWn6dpKOUQkRviKOwYNDNcN9mikzFcjG3T+SWUczZIA7rbRlB5CHV9Wvv/0AtdDTQqe5VV5awUb6uzimA2RLw8LBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pSNOPl4RbRrr4EcseKgWZJD9VkWdz+k2tefoV9LCJA=;
 b=MGRwccuTyj7i7bC4zA/cteQ+7arljwEdX4kEllJxjqDICf57hnGCfojH0+FL9dwVBGBt7MBbRZ3+Xm+RidislTWwyZwPg/1/8jR5PveSKHTikbbLLwBpaiziHnsCjGsEqCB9SV4m0COeei0EPDXOq7GyqraTpu5lREpzMh9IS04xoLV0KvuNyPi4m4GvEMdIzqfO2dMA4mTChkcCCx5f61CE91j+Qor3jWBDvV7JGfrDXx+wYAwiv6ac6InMycKCCxLRYbyNTX1s5tkg0tvmypeg1x2HqNVmLrytMSS2JRZv5MKZmVufPV1YzJtOamXlYLhr+Tmw2J6W6p9p0/vXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pSNOPl4RbRrr4EcseKgWZJD9VkWdz+k2tefoV9LCJA=;
 b=BHTmTGEvFU4adNxGdhhsNDEg00isdddXnagbN+552EYlLvOEvUJ0fQANPOfmYHGMEmoydWJ0jkztioUPVrVhTCK5gdsovAq97fdNkZbPlOBRjiv5Z//a2HCGBhLpOz7HOitoZRbMfhPzILMJEsrKDm1WtOCw9BV5DwFyhTafkgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS2PR10MB7709.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Wed, 10 Jul
 2024 21:00:58 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 21:00:58 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Matthew Bullock <mbullock@thegoodpenguin.co.uk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] openssh: factor out sshd hostkey setup to separate function
Date: Wed, 10 Jul 2024 23:01:01 +0200
Message-ID: <20240710210101.2634538-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0034.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::15) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS2PR10MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8e849b-da95-4174-5612-08dca123659f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6OZQHI1kSyFoLwSDmUA4U+4GST1FR8JcJ/w/Egx4IrK4/cR74RryKMMHRsZ0?=
 =?us-ascii?Q?yBs1oDpmnGST353NJ7SXwISUacWSrsUrta4VrPvvT1+zALek6LvC3duwAqGi?=
 =?us-ascii?Q?zfWCuqG6/lua60rJosKpu4sZYZEs19Jif+vtM8O53aVVOuv3Gsvav7A1sk0e?=
 =?us-ascii?Q?QNu5EzOy1MgZ4R8dMVz7nlD5saDutifurqF4tC9zqgKqYq4ZSrqEYNNhIfeg?=
 =?us-ascii?Q?7nKQaC2zYZj0haThpcSrRThCRgzgU2U7dn8XNEOmBfUiM3v7awAxxPG2q8f0?=
 =?us-ascii?Q?QCc8RoymYT3QIzsTTNMfAB1IMEAdCGTg36IthkbH8tuSF5wWm7mJ5IPa3eFs?=
 =?us-ascii?Q?Ggnp+IB7WIrvvdETrxh/ZmZ1jrIwe4gdxqxRYi1mMufGrtvy0DODO8UMyTDj?=
 =?us-ascii?Q?OwP29bD6SQasBhHE0U3sJsFQJjJL0/1M7r+//KNSQXoJQ9qHV0CpBRpGl2gi?=
 =?us-ascii?Q?ETjPRdGKqyct8fQRAuK8MgAiVSanuFw7a3/xfsMQq3jhpH0xCo3e5oQEZlxb?=
 =?us-ascii?Q?hC3bhXFXDXxBSowMub8OCVag/SVhN//4qPOyrpZW3NS4o/2cGvBMu+1ZlMyh?=
 =?us-ascii?Q?yulPSXTL8lExlg6e1htFohYabyw8w9gyJIhd80LzDCbjUxaS5NYaBPARSfNb?=
 =?us-ascii?Q?AKgiOU73dbmpVGj7VRrrX3fCIu4pp8GXMZ4ydMsSveuRJmYOM5c2XCba/hcS?=
 =?us-ascii?Q?BQxT/BoZpIGPOgMV1QnfOCfqs8wO4Fek+jN8Px6Mwu52E/JsCWJe9IEt0z9r?=
 =?us-ascii?Q?1RKwtRyNSR4yYvHeVr/pGM+C00tf35Eb4L0tcIPetP09o4z8n2+2VoDNJypq?=
 =?us-ascii?Q?oJiG5cCxxger7Zo3JyhUFc5461OSvsYFONmx2U2ApXOxdU7rxjGtmlNIDI2P?=
 =?us-ascii?Q?nSQ9dHdS40KqXIdzVIMfsZf82p+XbaSdT2X9RcMtlUShgOFtyQLXMnZ08u+k?=
 =?us-ascii?Q?NCEf2U0suIuiCIUXGKmLF0Nu8Kgf0XFDpwDncUfZtPyciIbe5HffdK8ZAvv+?=
 =?us-ascii?Q?oamJlibskBs18sblcY1Z7riHOUnkhlNw3oi9stMg/0tUIqH9TgzV0KTSzFDc?=
 =?us-ascii?Q?sYXuNKQi9PRL+GOskO2r2ORJnf+CeNtu/SeUoae7XbOzbrVeBk2npdBj14G5?=
 =?us-ascii?Q?XbiU2wKt4J5pKFp++82RN8TVYfP55SCzAw+ejcCIUt0X98Tzf8LhG6su8fuC?=
 =?us-ascii?Q?5BUa4z3Y9L7sLzPvyN3tqdjtreaMVkbYHuqC2pcxrahvfzKiiB5OxT0JNFZk?=
 =?us-ascii?Q?k1Sb55Q44W4h5GbxLJi3noPS+AQCD8VP278MXDStuIcu9gzCP/SRiHldY8WI?=
 =?us-ascii?Q?K9MuCohweGQIFtJK7U1tgGh45Ws5kmKB6z3eyYgHPPRLCuhbE0acGe4y+S66?=
 =?us-ascii?Q?tPlkejJFqiHKpJZTeAMFNDTp6NctS76BHTLg5XQBB7rFHSZpyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mSW5yOnSZ/92fg8pMOrwZwrMMpoY5iKWFt6qrolILSXgFWMHglczID9szIvp?=
 =?us-ascii?Q?9VXRfBtAHHM2HyQrxD+H1pJ2rSQZ6uMKgeb3GDtx0TijGju3F3wxy4Mz6aRT?=
 =?us-ascii?Q?6bCEkkBRRkxshbp1pHc4IX8t3J8ofNSdGyPS6U6Sdd1awWzoUB+BqPCcHJaE?=
 =?us-ascii?Q?soToZYCwae35qXeUNhKA0DCpxfL68j22mamxuLN41/aLZ2dRt/1IJBuwUgpD?=
 =?us-ascii?Q?EnbdYxck0uGlcGcnhut7MLvAslUqjQlxvf84gHg7MvRdgRB6XJg+MQta6nsC?=
 =?us-ascii?Q?/XQFaCpxtSH4caAMGN7uMIAgSAF7gDk53ECaAhJGHfnwLkLsb1gJ4rn3zeJ7?=
 =?us-ascii?Q?7+Fpdb7hRE0YhylZPmAajcsj2aFCP6KTLSVDvGAgoW33DqG2rlLbt/54KE8q?=
 =?us-ascii?Q?wq6oQ9dAImg7nJbR173ResIHfaEzMvnZ60RGo1cF8xm68YcP9xseIRPK7CJC?=
 =?us-ascii?Q?qfFGFd1y3vw7zCbHn8iGS4xpkic/kJ3pJ7iFjzKj10/8jHJMj4ZD1FFRD3Ss?=
 =?us-ascii?Q?brX9ds0a8emhxdjJtBcuLwU5Odb5E7I5PQSi5YeVpGfnC8RnZll7yguemoNK?=
 =?us-ascii?Q?KPyhRaixOFRnz43VnYbAJGCmtL+P4GHnL0y1BO3FRWiHjS2a2y/DdnkLw7He?=
 =?us-ascii?Q?nY5dEiKDwZud3biFoVgl5ZIHZTZycowG0hr3YCYv1IeXditduWPUKougIbYQ?=
 =?us-ascii?Q?u2BZbLTV4ugGfW5toO/2aUBpU+ylI6LFwqk1azJTHqfkkshOgqrxrXhpQhpq?=
 =?us-ascii?Q?Ulv/WoFYmiWiCZEJVoj1GnrrmePat40NZLk3U97yml/oZHnYjzDdiffp6d8j?=
 =?us-ascii?Q?cvLllPXndOlZzROiYnHvAHR7NRdGibaobaumfZh1hDd4VanZvG9A6hi5BEaa?=
 =?us-ascii?Q?713xeqOtpAHgoJ6aooqWHy9NZhI1BinMn3HZl0AkjnhRGGNgDQZdZg2kw2a9?=
 =?us-ascii?Q?B0552Ca2hoLygZTebblUEyK6sy59i5z5QhXu6aKxFci5zODVXaHs5eSWfcD8?=
 =?us-ascii?Q?k0guJTaP8lijNppsX3RtZx49+EqufdCkl66Ja6N72r5SL0KQfXFOPoY1POIw?=
 =?us-ascii?Q?/6uEjDGqFY5MlU6hKu5LKGQ/WxvCMt0oGAseRFwQKKuETKCrpT6l5I7UEFGW?=
 =?us-ascii?Q?RUNR5GwqVUJAQhIVl+s0xUgN6/jZcK7Ly3zEDCQuVvg/4SVKP7fbknCLq+BT?=
 =?us-ascii?Q?GAF38J8w8Gge4su4oiS/ysOobKvE7/n9kxKECJtE0hW64TRZJl6GRPNnZxqw?=
 =?us-ascii?Q?5lq2CD2Kee9mE17TdVuDmGPENwN8dAi4vehexKx0bcGNrvCdvdFd6QJr/SGT?=
 =?us-ascii?Q?4B5Zd5Q7vFZGGCtC8y4jbQNlTY3s3RbNbeY8uYVrmTo+lz/sRZ/gmnCByMy2?=
 =?us-ascii?Q?74Ijqyz5flTQiZKSizZraLeWNvHzy7JbyWT9sOYcFUgsc8sZWNWsyhMtn1Uf?=
 =?us-ascii?Q?KHyhH1odDhtdP2qJ7eNfVZ02Vc3VULt2DUHTCHd5BVfnTt1H3WL8To/NjmDg?=
 =?us-ascii?Q?F+fr3yKdrIbQZ7fBCJ6Cdvno9YqM91HLPvxclqaz0EQgbHMC+vqObagwHsPs?=
 =?us-ascii?Q?otKY9K1FZv8IQoLYMreigclT0igBCpoVoYpdUt3/5jJbdfjN34eiMjatzKWq?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8e849b-da95-4174-5612-08dca123659f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:00:58.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vM87Hg/jcH6kDrY89LluI27n7bi2HNrijU2zGvi22jdv0Ks6GlGVLbJJQ+b9vrQ8ZWNYdGCpXG2GUbs1DpOoK8KN4xi3rdGRjA2sTUKno6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201748

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Commit 0827c29566 (openssh: allow configuration of hostkey type) broke
our setup. We make use of the 'Include /etc/ssh/sshd_config.d/*.conf'
and put a hostkeys.conf file in there, configuring the types and
locations of the sshd host keys.

With that commit, we now get an extra "HostKey
/etc/ssh/ssh_host_ecdsa_key" line in the sshd_config. And while we
could avoid that by removing all hostkey-* items from PACKAGECONFIG,
other people providing their own sshd_config via a .bbappend now have
their HostKey settings unconditionally removed by the 'sed'
invocations, regardless of PACKAGECONFIG.

To make it easier for downstream layers and BSPs to define (and
preserve) their own logic for placement and type of sshd host keys,
factor out the new logic to a separate shell function. Downstream
layers can then simply override that by an empty function and keep the
behaviour they used to have.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 .../openssh/openssh_9.7p1.bb                  | 48 ++++++++++---------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.7p1.bb
index 69eade3ee7..4a08c0bd66 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -113,6 +113,31 @@ do_compile_ptest() {
 	oe_runmake regress-binaries regress-unit-binaries
 }
=20
+sshd_hostkey_setup() {
+	# Enable specific ssh host keys
+	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)};=
 then
+		echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_c=
onfig
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)=
}; then
+		echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd=
_config
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',=
d)}; then
+		echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/ss=
hd_config
+	fi
+
+	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)};=
 then
+		echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/ss=
hd_config_readonly
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)=
}; then
+		echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/=
sshd_config_readonly
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',=
d)}; then
+		echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ss=
h/sshd_config_readonly
+	fi
+}
+
 do_install:append () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -m 0644 ${UNPACKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
@@ -131,31 +156,9 @@ do_install:append () {
 	install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/=
volatiles/99_sshd
 	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
=20
-        # Enable specific ssh host keys
-	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)};=
 then
-	    echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/ssh=
d_config
-        fi
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)=
}; then
-	    echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/s=
shd_config
-        fi
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',=
d)}; then
-	    echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh=
/sshd_config
-        fi
-
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
 	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/ss=
hd_config_readonly
-	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)};=
 then
-	    echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh=
/sshd_config_readonly
-        fi
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)=
}; then
-	    echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/s=
sh/sshd_config_readonly
-        fi
-	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',=
d)}; then
-	    echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}=
/ssh/sshd_config_readonly
-        fi
=20
 	install -d ${D}${systemd_system_unitdir}
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true'=
,'false',d)}; then
@@ -181,6 +184,7 @@ do_install:append () {
 		${D}${sysconfdir}/init.d/sshd
=20
 	install -D -m 0755 ${UNPACKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/=
sshd_check_keys
+	sshd_hostkey_setup
 }
=20
 do_install_ptest () {
--=20
2.45.2


