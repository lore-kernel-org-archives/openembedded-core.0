Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A11C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 21:16:19 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.38])
 by mx.groups.io with SMTP id smtpd.web11.101860.1740431771230043871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 13:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=IGv4Yc2V;
 spf=pass (domain: prevas.dk, ip: 52.101.71.38, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btfPbPeBFh5t8Tv03B3sbS1iqSP3efxIj3yOwO1nT8oaCIiv290ty1UWG0dvhu6UnR4UHO/lPDows8Mtp9b+9J4dnWXbnxYzeYgu5VyNOgDHPrfE9XjOX/PTSWjE0pgCgdzdcwt3esCowuayStXBORhum+W7JWPKaPandPFIoCK49TkppYLs6M81qhW22FFVrvJQjQhUasf0H794cAiO3OMhlxEIWsi9Xw3E30dDSPexZnPZpq66q9RKdTJbrVv1/Fowd9JNej5YNCz+b1oacGnBlmXVaX6eYCACSk4EvHpDMMutWQ508Hh5s9clNyfcePtfRAwSmF3aEzeky/8lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp3LGEG7Z/lOFC0LKBu1MzRPVsgVBmDfI0yuUDn5AK0=;
 b=uI3PBVMATAzFf2hBAAqsRosuqWRtHVBy8hfmC6hVfAXb8owFeQTnmoMvpmrHGEljvxDFM9UFmNBAFHaf5hFqYXwQJsQdQokLNrjbfq2h5TImIGgEh4tk/CydzKnZu7scn5msZvFzvjRcmxIiwSlLI0NfgRjSM2K2OAfm6BjczrNgGiOmJauZ5wcQfnRZ5nCBsPH1hU7YPbZ8ZvkXXHRLbWizyBk9LsaXKdwAKw5I2iQBZ663ZQH65mduU719+RDkYxLxrZXc+T5Aj7zQxF0Ta2kamRDH01JleKBU+yjHHl49MgqVcgS7E2JqZnFmyvTi5CTfIpHSMCKJ/yOVVZce6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp3LGEG7Z/lOFC0LKBu1MzRPVsgVBmDfI0yuUDn5AK0=;
 b=IGv4Yc2Vkrfh0pGmOXjAuuVk8Mc8kWc2O+Ha73NI0Gr1jBPTSL85sf9zXjX9lmqeWlsmE0lZnnOpfnUgKlPKIA7eZfMOM6Pjm93T3UAa8cK1GuduulsomO04PTB75Q0K/Bb0NPnBO7kEN9j3tpek/NCE+pFPkxJ8KCDJLwuVknc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by AM7PR10MB3973.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 21:16:07 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 21:16:07 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] openssl: fold result of sed invocation into environment file
Date: Mon, 24 Feb 2025 22:16:03 +0100
Message-ID: <20250224211603.4080996-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::18) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|AM7PR10MB3973:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b4ca7c-47b5-4b5c-c073-08dd551873dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DtRj6Gy5Ijk5MmtXfQCAHwt0NSISykz3u2ad0x0ZYSz+NS2JY2DrF1MMrth0?=
 =?us-ascii?Q?PKkyqzYUZZ0u2q6eWqgr+QX0Zn8NsKfXUhle9HIKJ5D0rL18UxibFuCBnFLy?=
 =?us-ascii?Q?YKiRf68oFtgH5CGmjDU4I+MRTDHTwk1Pe194UTkyOIOPk26KVeK8eRHSU0yr?=
 =?us-ascii?Q?N0HLPQkXpq/0cyHVWH646qQnFMcoSwBMCg4Xi1lsxoXMNzwK0fcy/SFLkMUv?=
 =?us-ascii?Q?tE0l6WLSxX01sf9fBdtgSGBcXei2MbFaYFUYBb71EZCRXaNTbQtmCUxmFl6F?=
 =?us-ascii?Q?VaQNE8PsnUVOsptWPvUMz7Rg99tCoSQsZVNRinqzHecCtlLXLtDvjw5FUEzO?=
 =?us-ascii?Q?wxfHhQ2/60KTmR3XP337oJEZ7R2mdjmUMlQFWagm5HFNqpV235EfQTUspBaj?=
 =?us-ascii?Q?uu+2Hpv7fzd3PzwWLNN0qCaJmwXz90b+pTlEMW5zZir7173UHlGSiQo+TpgD?=
 =?us-ascii?Q?VtcLVLw0Y33xAExRbGRdPi82yiRSzp07mrg54JJt0UpN3xMkv8CKPuUoNb/I?=
 =?us-ascii?Q?2KInrlXeJ6nuUW+khRiUXqD6usn1csIyaF7vuMnax3FjQp0YPyPdJmRgYfdm?=
 =?us-ascii?Q?/+3J0zOF93kpJsIBns1rHu3qse+tIX0fwZttyK7QAIztRZfckIKtJ2wkAO5S?=
 =?us-ascii?Q?gc2o9nTgabJatFcHuEOPJOdq/as+hGRegmNpIUGfbNsEJo+JnLdrrapHLJT8?=
 =?us-ascii?Q?82a80691qGmhpDS6RcTcd5Ci62stsBz4CMiqcsKMgEATlkPMJFhoz+sSvqUQ?=
 =?us-ascii?Q?USa3tUTSG46rNrRKoHalr87lgbSWxT0nEzb3Vh5vCg7w5mvOPIPzwmg+vhoS?=
 =?us-ascii?Q?bOlwLieq1eVKQzu2LHOeVwqBKJ6BkLoGH99quC8fNl8Z233+zMoN9aCMcZeL?=
 =?us-ascii?Q?uFVbtx20ftksVMPpvCOn5+p2R+JyzCDIjRhD+sU9XLoDs4srj9TUz8Ll8UTZ?=
 =?us-ascii?Q?7Biee2u7e2xAWgn6CKFWk0y0UIF8PvBqiku0ABpniURSoN9aM5zleb1QXW/Y?=
 =?us-ascii?Q?1CFSBVdnu2lWPy/1R3MK76ISWy5iE198sdSWAEcT4ZWBGJPmwAsBBcc9oBbu?=
 =?us-ascii?Q?WbU7BSVi6RgUHFccwtDainmu+Qby7UDXDuaSek+TXTd2YiSJCHNtHHWaPHPu?=
 =?us-ascii?Q?7cIGwC4ELf59zEv6PUvxgY0mIcXoU8B2dP9ioRnRS5TLMWlpv3QL8e0018qs?=
 =?us-ascii?Q?u30xsuCtNwf7mRdAOIf75xR9YyLfCZA4i0DslTWa0hjkTAQJC0hNnN+ik9Ub?=
 =?us-ascii?Q?TYWIrGyPfe+L9tGAjjBQM44fYauqyWddWLfERJDrTpYX2EX3SsBT4ShweYxs?=
 =?us-ascii?Q?nGnr6ZJIxStHpWIK0KY9ZAUdI4GLo557SrpSpZd7WsK5zY3L6nyXkDmFUox5?=
 =?us-ascii?Q?aqQAzCC6Fuve88nwEqc69bV7HhZNfa1LbKmjNyzmxIyv4vEsYujgvRen5NdH?=
 =?us-ascii?Q?Ndv4Xwu7XyG8zjPkw5c+gpbHUTtwG8mR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BzQVCuu6DFL2wLwhHuyKSockXpg9zJrLjqVIc17JtL2UXynOlxhOB1hLCnhZ?=
 =?us-ascii?Q?kwR9TWme6CK0U6yqJfss/snLL2marz3cOVNbWWDHHh5IU/RDD5LYbhDzyhdW?=
 =?us-ascii?Q?ARIjLdQ9tu7oaAQDwzED5cK6entDGaozoAAxlz0XBBLJpdLU7LMUSW5OqaT8?=
 =?us-ascii?Q?iR0mf0Rm/SfRe2ny9h+US6kARPnrVqTexcsodtL28yceGM1hJ/igbtxhaA+n?=
 =?us-ascii?Q?VJp7kDh5hzw/ZpcffKOrWX9zE0GUpuoIjY3kiM86hBWlttLzmroECTVu2R2e?=
 =?us-ascii?Q?vf+EGGGQ7L5necB0sIN26Hl+ERpu7s9FOk7/U1DzsIk4xt9GL8kuVrjIwtwS?=
 =?us-ascii?Q?+R6RKBTNyztZ9lVpHWvQdldebsdg2hcUf97PxlQTX3cX1NhR/9+dmvgk0Db9?=
 =?us-ascii?Q?M2uw+W/gKWmRDUK0AbMwwEFF7Lmy1iQ54PYhVfm6PhBl4pYFG1Oc72xGithJ?=
 =?us-ascii?Q?bUN9bhQSrWJfvytap4Lrznh8rkejzIMsdiJ7NsZ/jiRucNDzMlj0oBVQpbBU?=
 =?us-ascii?Q?KYd/cBRdreSvwrWNNjfe5VqsTld2PGKsVt9qX7x+oKeMb12EYxFgVuv6AqhT?=
 =?us-ascii?Q?PSvFAQd/AGllnvGNhRo1mICu8JnbrQ8Kci4sNPJ+Y+SRLoSD1OogmuXgxeIn?=
 =?us-ascii?Q?GYV808/4zw5wOJjTaEL/bV0yHrm2a2YBJZbneeU2jUuqWIvxaT+8OHjOSJWW?=
 =?us-ascii?Q?zK72nG4PsZUSKxzpX6gsZfNNDWhe9SOw1nct/2ANUc4SQv86GPxhhAdv2OWR?=
 =?us-ascii?Q?L09tE/c6leqChMayXeWN52dWQoGjcWTZw72CxO5bl+X+B3Xia3jV7HoIheDF?=
 =?us-ascii?Q?9YF84tvpSehRqzRxEHPnIaDmhTvO+xa6FFdfaOPtgFWt3YStGpPgxmn9iz0+?=
 =?us-ascii?Q?7ZVGJzmfZhL3TGecbvzJtWj6FcyBH3TVKg/KQsVHEMCQWCEP+TrbNtA3jIjf?=
 =?us-ascii?Q?sO6LxD83WLjqZUJDNoX5EsAdXrFd8anIZxoLX6Ul81NkChmBOZQyqERYEWk1?=
 =?us-ascii?Q?7euPFteOC3PigHq2RoYkEzo2KXCUgFGlRuonKbdPy6Uq+kLGwMJKkDNn5bLL?=
 =?us-ascii?Q?0nMMPp73rSu4RqzNOBRSB4+gvWfVijIKoarFBSTKpxJKkKe2BRSvtu712HLi?=
 =?us-ascii?Q?BsJyrzbwJE/ZxadBM68dRyTb/peBsS4V9jowP/W28MwTdB/jOuJizWi8eXgD?=
 =?us-ascii?Q?p/dRF+5Z9h8RR5y0/mODz2QZhJx6+YnSv+l9r+uuI73gmpZ9wf1O0PqmRnMs?=
 =?us-ascii?Q?+Mczrii95t8+u479dz1rO1U78RJBcioTJSCJVdAaXoT4YKlfTyYIHLfAq3sM?=
 =?us-ascii?Q?ilmTv0wtZFJlG5GoiA/nANaNSNTEspluutRyfiKubnZlXv6FQ+5v9hdF/mql?=
 =?us-ascii?Q?Q7+Ri9RDlaVVwk6h8O6NEGtgG89/lgVnGnV0Jgt4n8cM642QQyNYMqJHIQb3?=
 =?us-ascii?Q?wlZz8t7YeLjgPoyFTXiYI91ORdSeuKgD7Tit6bgY3FQ0VUmDtKfvqk9/GNcf?=
 =?us-ascii?Q?kXG1MWa5D3g2WPGM9I3+I0MNxvG/pXWc2Ml9T+mJliPn0qnMj09WEZ1xNMfT?=
 =?us-ascii?Q?+VNGKb3EIFDLlaRxkyWz95aRGpnLAj/m65FNwFM5H56H/Ef2F+2pD3+C+D0v?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b4ca7c-47b5-4b5c-c073-08dd551873dc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 21:16:07.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IU/tE6itgeIy2cVkA8yxyS5yrdJ72BC4l/o3FZOb/iRojho5oF1IaqkcaIv7IPqk5JSxBjNBWnY/PRp+vsGqK+pX063CiUDDaAEK7p0Uy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211850

From: Rasmus Villemoes <ravi@prevas.dk>

A long time ago, the environment.d-openssl.sh file was shared between
openssl 1.0 and openssl 1.1 recipes, and sed was used to make the path
right for the 1.1 version. Nowadays, with only a single recipe, this
is a bit roundabout, so just use the proper path in the file directly.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 .../openssl/files/environment.d-openssl.sh                  | 6 +++---
 meta/recipes-connectivity/openssl/openssl_3.4.1.bb          | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.=
sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index aadf1edcb6..d4b9047565 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,6 +1,6 @@
-export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
-export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certif=
icates.crt"
+export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
+export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-cert=
ificates.crt"
 export OPENSSL_MODULES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDITIONS:-} S=
SL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.4.1.bb
index ec7688b7af..e18ec4b1ad 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
@@ -186,7 +186,6 @@ do_install:append:class-native () {
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}=
/environment-setup.d/openssl.sh
-	sed 's|/usr/lib/ssl/|/usr/lib/ssl-3/|g' -i ${D}${SDKPATHNATIVE}/environme=
nt-setup.d/openssl.sh
 }
=20
 PTEST_BUILD_HOST_FILES +=3D "configdata.pm"
--=20
2.48.1


