Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15550ECDFA1
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=dykohjIw;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsnpe0c0lOAWFRQepbfIesB71QqXe1fc0EWqPswwkzLBAnBU0cdQBiDczhfzINGc37PXe+WpFLChT+7Ikr08pHJaxdh6IgZYw1Zm2ZFAUKBAxJAc1JJ8KNVgFAJYF7FJqR49wsuzRIi2tSqhQAJUzGH5KOvKLiayTfxo1gn2PSKgNBwnew3Kri8TYh+d8qUdhNZZLIsp4ZspgW9EqWbwgtAKIfMj8b7gOtF8WFumC36Vszzli2v1JiKB+uw0NXnbXuD/C5yE7w9OczdOuho76enS+5VPc1SW05XmSomyhy0c79i5vflT+RdPpJ2D/RsB9dPMLQxMIekXSaetiP4m3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GUO5GD3n722Qx+ufdf0TaCbeh7PWlMbBjnUnYnPK6A=;
 b=aCmfCzt7OaXFnoanTPIbghzflZI8vw3qR+/dK+/kjEFIcWZ11Nl7tUXTHJ0Etb8RICdonDe/Q9KJdMq5KpdGsmoa9IhF+a3ZNWYcC1dqycprGaAKT6C0Dmgm0p1UB+LGWtN0ePYK9jpsuTpb3YPWSVm60OnLYaluJO/vb5jT1mFYUll8UQSdivdHl1a8mJ2XcTIDydshbSA8+25SrAe6Yc3zqGtMQGMlt+vicXqgfVKAdgli4Y0QWBexSmMYcsokW4qrtgoJIvPPrTq8CpdqIwPPCg3W1WwbWyLnLgeykrwqyKmuDhUWCtxUlrLd1whix+amq1ZSV7bVOSkYDqsLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GUO5GD3n722Qx+ufdf0TaCbeh7PWlMbBjnUnYnPK6A=;
 b=dykohjIwSArWlO5PWOfVhmmBFrghrRzpIqq7xL6kFqLauBa2782DhACMtDnSFRpZvEsYPLctwtdCuW4oPjVSO3l50L8SCRYh8Hwfo/PftPSgbHt5er9O3JOMWc2RfwKMzE/chP0fo19NoQl8hEBh5o6OQWDReMN7E6OVBlnrcLdwcoVQIQfPxwV5vgvvcfqQMa76PRBbvceTEmmaNNkTgRIIKFkjC29TLIlwtmZ20cLgAAv/OnHtQKxNHzskNX3J0g1PHuNt3vZzTaAfjqFlkB6hAFx+pyjCiHTkUe/GHcpwTX/5QN6Lm5s7Bzo1OBjlop0Ui0CX014nTATlJzYMAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:51 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:51 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 4/6] uboot-sign: Use bitbake variables directly
Date: Fri, 21 Oct 2022 19:37:24 -0400
Message-ID: <20221021233726.1751124-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221021233726.1751124-1-sean.anderson@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: f78696d1-645f-4480-92d2-08dab3bd44b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tWmEeChQSTTJFM456lA4MIpZIFHge/yX6cd7fVXU9j44ZUSXwEc7U3CxuVWU9NweB6Arie5KNgV1vPFeD0sYnYi8s7gHee+eMxjYA51+SaLPa+W/jQ46YlqCrVLwJmk3+GJhqxC0ZFFAq3o+P6lzsHmjSik8Mpse9V4koW8pXJweWHHAuWdYyrDlc94qoMuGwas35DHphS4bckC0xXrWCa4O7o31EB32eqXqoEmjTUi+u7ySlP87F70zyMIMPIet1gnDgcAj8zV+jWk6QYGDUmPNWHsqpx9ol4/JnPUUyE8W5MglT3MAIbLW1vfQ9fiqbevyptdaVyjHDmKOabIHy+WOr17l5NhepsOaB5mPJwhVyk0p2NGv3JxOhNc5DRIsyEgccjPwhqql4Waat/+U8wB5OzzYwT+98TTDW4qFhFsO0npQGwo8lNRwmbMixIJjmsHl6foo6QQAEdMjHk4ojeJGK6Af0wSFrxMVZlwIZfI6bAi1ahVC9I5qD2LGWXmUyEh4R+BfGsGtuNZSB3ejYy2DKZVf9j7K98JB5Smv4M81NcpLcA8+gM8qCEpgDa+ZbhxxdSFWzRsMnlcU53JYjWGGwDcCtfA4a/IX61oTVZ7B+dFWZwMKc2/u9rP8TFf+I4KecxWMXOWmPguajJUD49h4ds16g15+I+klVCQqbI9TJKWpM0xa60W1dDcMG02w6NmM1E+OnJsa8NfiO8rPJ4OQDz6xVVeiJPrnZPkne5ryvw8ev7KxFAviAp38N5qgrx5pskFZgrS6pH/Hw41pyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vuo6gqPhw6OJhpwwdV48/ZW107RC+1WSnHP4GDl7mWYFSc75L+NB7v0Ly24c?=
 =?us-ascii?Q?gxi/I4qcusgrZSSCxyA9uIPW6fHT5wG7X6MNuHsN5Pc75TaCghCPlWEepbtT?=
 =?us-ascii?Q?5UA/xQGKBS6rHExAX+pWd6LldV/9cTzzKoHb6ugof+PL6O5GEQjKWlkFW9iR?=
 =?us-ascii?Q?pfCfMKZlPPdFHOUH2NjgVAIOL2ZS+/i3e6TvYLzn3DKfSDnFXef4FCzt6+0D?=
 =?us-ascii?Q?Y9dnVibpe4Vmk6aS7eKO7M5+cMdQV76M1FWtvo2KqIf38j5uGkbZ5nA5bODG?=
 =?us-ascii?Q?K8Njdt7zlTw4fP8Mbzf+6WHC8o1k5o1hsicTZqztJCr8WSIySPGMUlrgiDph?=
 =?us-ascii?Q?ko03yyRkBCkyo2MRPocz67dl3iyko08oCiSVSyeheyCMi8We44QmK1DbSo2D?=
 =?us-ascii?Q?fsl6WpbTcW5AetFswO2gXdOOkAzSLs3w5v9mlN9cufdws29Krpmob0flPN/3?=
 =?us-ascii?Q?tkgoGk3fjO5ZxhrOWef4JUNYuJdMna7RJDLXFreJsIXA2k/Yrq5QbKOzLWe6?=
 =?us-ascii?Q?9t011moRX6nQymq6Ta9UQbFLlnFVGy1k9zKa1bm/6tPO6zu6D5RLl9rmwNiL?=
 =?us-ascii?Q?qF11Ip72KLKSLLrdrT6sXlc/PIhIwvYjS6Mx7nuTQ9EvuJ0Euxi77dv4yxT8?=
 =?us-ascii?Q?qcRsMN+G9xl08ZDjKMTC0ZTk1HkVRp+FDSjyIysae1kr1YI5wzXzYVgmxr3s?=
 =?us-ascii?Q?U4M8yitznzcVG4aBGffnp1mPiv6ynD4dgbBmVpMPAJTGOOHhekJe22icHPOz?=
 =?us-ascii?Q?Zmy84CqraTznZs2tr5WqamZgnU4NZLqlfE3Ux4pSd/4orsx1b41j0Lzec4YW?=
 =?us-ascii?Q?QDbDqnZg81yCSw7BXckgHORFikeyaLeGGGIKpGqX/ccBppZVCfAq0oDiyzSx?=
 =?us-ascii?Q?BcumgwfPAMvsQtj+fMMEYHDAGdlVDevb3mpsMptjfHhHcs9/ouS7RG0G6kOX?=
 =?us-ascii?Q?kbHCn4LZSQ46gLO9NpkoEWOrx03Q7bsWdUfjuJU9ZS0pIVHRUkVFZTh8II2Y?=
 =?us-ascii?Q?ftx6IcLiy4vJPy/OP+Gn0Yl+8CM/UIICj50NP/SwiJMdzHNSHeeL55jDFm3l?=
 =?us-ascii?Q?MDoLU+vKtBMLPMOBUwtGWvWOEWzeoj7EZHR2JRZq6hyUQnxybvkrewBkuOkX?=
 =?us-ascii?Q?81R7/X/GbV4LllF7gOJIL3FR+djshxitNWle4p5ktnuhuWgmV6jiGeMayLFk?=
 =?us-ascii?Q?CDb8VSnNd4SZejtAs65ynPxVsnxt227PMkmhv3zsFJqekdoOLj8KxKKDnu4d?=
 =?us-ascii?Q?2n6zoCH5VeHrZl/4tPBLOwQHdxYaone6unz1fkIiGgzwXJ3EgjNapd1T7Uck?=
 =?us-ascii?Q?9/rcesGfPyQI0EmD6JVmYTsVzzWRKZdL3U3yr+7nUfagowgJMWAy0UwMf/61?=
 =?us-ascii?Q?sYOJw6Ee2r19hUsqUYojcQu86pBv0wdt3H6kT8aYnBOdgLBauqKQWkvDsmY0?=
 =?us-ascii?Q?qdMn0bwdiZ7mzbRSXIJD44tud/otASU+MJgHSnZcX89fvUYGjbxnoH321X8c?=
 =?us-ascii?Q?gB9u7I1vG0IqOncs4vrJf5eK0xKaCob4WYi/S6WcGKK8kzkHdJ/dK1pOFwBx?=
 =?us-ascii?Q?uPY5cWHADJa6+XaYcfSjW6MuLNWlfPQt2qFHN59tkpAa8zLv72bztTEuyCx9?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78696d1-645f-4480-92d2-08dab3bd44b9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:51.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPkxHqAM9BJVpor5/QdePbHdXSXnP7aspXzuWqPkw6tduSzes6lxwNwim4mMOjE5AzABHry8UZN6hMy02Kpxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172053

uboot_fitimage_assemble is called from one place with the same
arguments. Instead of using shell variables as intermediaries, simplify
the function by using the bitbake variables directly. Removing a layer
of indirection makes it easier to determine what values are being
substituted in. Some variables can't be fully converted, but they will
be addressed in the a few commits.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/uboot-sign.bbclass | 30 +++++++++-----------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 4b5912a01d..85e23b963f 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -311,14 +311,8 @@ addtask uboot_generate_rsa_keys before do_uboot_assemb=
le_fitimage after do_compi
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
-	uboot_its=3D"$1"
-	uboot_nodtb_bin=3D"$2"
-	uboot_dtb=3D"$3"
-	uboot_bin=3D"$4"
-	spl_dtb=3D"$5"
-	uboot_csum=3D"${UBOOT_FIT_HASH_ALG}"
-	uboot_sign_algo=3D"${UBOOT_FIT_SIGN_ALG}"
-	uboot_sign_keyname=3D"${SPL_SIGN_KEYNAME}"
+	uboot_its=3D"$(basename ${STAGING_DATADIR}/u-boot-its-*)"
+	uboot_bin=3D"$(basename ${STAGING_DATADIR}/u-boot-fitImage-*)"
=20
 	rm -f $uboot_its $uboot_bin
=20
@@ -333,7 +327,7 @@ uboot_fitimage_assemble() {
     images {
         uboot {
             description =3D "U-Boot image";
-            data =3D /incbin/("$uboot_nodtb_bin");
+            data =3D /incbin/("${UBOOT_NODTB_BINARY}");
             type =3D "standalone";
             os =3D "u-boot";
             arch =3D "${UBOOT_ARCH}";
@@ -345,8 +339,8 @@ EOF
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
 		cat << EOF >> $uboot_its
             signature {
-                algo =3D "$uboot_csum,$uboot_sign_algo";
-                key-name-hint =3D "$uboot_sign_keyname";
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
             };
 EOF
 	fi
@@ -355,7 +349,7 @@ EOF
         };
         fdt {
             description =3D "U-Boot FDT";
-            data =3D /incbin/("$uboot_dtb");
+            data =3D /incbin/("${UBOOT_DTB_BINARY}");
             type =3D "flat_dt";
             arch =3D "${UBOOT_ARCH}";
             compression =3D "none";
@@ -364,8 +358,8 @@ EOF
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
 		cat << EOF >> $uboot_its
             signature {
-                algo =3D "$uboot_csum,$uboot_sign_algo";
-                key-name-hint =3D "$uboot_sign_keyname";
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
             };
 EOF
 	fi
@@ -400,7 +394,7 @@ EOF
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else =
''} \
 			-F -k "${SPL_SIGN_KEYDIR}" \
-			-K "$spl_dtb" \
+			-K "${SPL_DTB_BINARY}" \
 			-r $uboot_bin \
 			${SPL_MKIMAGE_SIGN_ARGS}
 	fi
@@ -430,12 +424,8 @@ do_uboot_assemble_fitimage() {
 		cp -P ${STAGING_DATADIR}/u-boot-spl*.dtb ${B}
 		cp -P ${STAGING_DATADIR}/u-boot-nodtb*.bin ${B}
 		rm -rf ${B}/u-boot-fitImage-* ${B}/u-boot-its-*
-		kernel_uboot_fitimage_name=3D`basename ${STAGING_DATADIR}/u-boot-fitImag=
e-*`
-		kernel_uboot_its_name=3D`basename ${STAGING_DATADIR}/u-boot-its-*`
 		cd ${B}
-		uboot_fitimage_assemble $kernel_uboot_its_name ${UBOOT_NODTB_BINARY} \
-					${UBOOT_DTB_BINARY} $kernel_uboot_fitimage_name \
-					${SPL_DTB_BINARY}
+		uboot_fitimage_assemble
 	fi
 }
=20
--=20
2.35.1.1320.gc452695387.dirty


