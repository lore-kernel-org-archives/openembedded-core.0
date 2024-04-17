Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C1AC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:56:45 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.web11.23938.1713383803287475696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 12:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=T8QPB79H;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=BdQXS5GO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HJLgMH012625
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:56:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=from : to : subject
 : date : message-id : content-type : mime-version; s=ppfeb2020;
 bh=qtlSXVRVNtrTgBAlxd/9NxcZMb2akwUNaTdkUWc19o8=;
 b=T8QPB79H2guTfPcBVeoq09qAynbrqcj2nE+8WCuGkWm0s4pBkxUIB+i+98bCwTrqjRqj
 mSizlOIW0iQ0me/ik4TUPT0e8J96NvbUyDaRdrs81StiOVVRL7mnlkDSMqiMqk+nPz1v
 hWoGRWsAeRaPbiRI3LeZOwAY1Jt9Nw5XOIJqEyoHb6YMjB0i9HlD/yCrePtxEs0azZIf
 S1r4blR5kL+ISK0ZEqN2SfiDua8XyD47bp+ijvaGJiGJM1BnmDOsn6C6coMcJ3Kbcb2E
 2goWKI019fRBQZXv7iO8QLK2HtsRlhqfTYEkqUng3BtBnvXcc53YmUGwjoI9LIxZu2wb GA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 3xfsfgsytj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2Pbc4+1tPssWD3yHu6yOjhozmys+BIdsNxlP3zbdjaDrsfLLC8GRRarRhnsB7i3SF4icgjsJqFiPFT0B02fJZxKTzf9hshb3A4lSenEdYWtnUZrHiCue0LfR/onzL25KHDaHvEzdcbJCyKX/X1cN9M6mxVqIKpGbO+sjXEA6LDqxe4MqwFlo+gjaK69f2a3Q4Qgr1gQHLhA9XDG1demigMEQzx/GoRe3Uvag2MulQkpQ3PvoLrCgXopH+845bmFGCFG3XMlwjd/wBHbv9szEmh1LcT99xyAvmttbj+b8+8HpVV0h6fV9ntyL/7hY3FzSvGyp0GpFiX8bKNCKnVZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtlSXVRVNtrTgBAlxd/9NxcZMb2akwUNaTdkUWc19o8=;
 b=fhlU8gUMc2KOTewLQHsDY/qAEKf87FPHV709w3NXJEZIbiDh4uAALPGRhb/WVLoi6V1jBqv/K5/jvZdvyT7kw5ThCmf+aPNDrW+7ddZynXoqgKo/aDj/Kx6CuSrQ8j6AsMj91hyU6WzeTYeN8srwp9dlpNEUe4bQXZD3a/AwHUL1Qadkgha/PjR5Pxyy62qJ1iZSnb1GgiZ8w/V7G+aHFAaARxDuuzNlmmg7bZ6BDQaDT7sdvYOiFcIFU+GfOeHsLGd8ixkKR0vbCRjTI6XIYiFKOrW+r+PDIEbY8eYO815VrQuFEJPRbIKvNSJO3LWN1ZHuHQthr2OmpUqslPEa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtlSXVRVNtrTgBAlxd/9NxcZMb2akwUNaTdkUWc19o8=;
 b=BdQXS5GO7os9kO+UHS95q0lyMviSXcnUSPG0D/VVHB/k8C/Fhaq1n+BvkWLS5hxkJUukSo3YyO0tEK+7xu8lCKnmYq4i12JRV208YWVjvkjcsoHZFlBeBQi1IvTNugxkUsDlqj32F5QBL9Lh1q5UHYyMI91vg2w0wA7aEfKQVS0=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SN7PR17MB6894.namprd17.prod.outlook.com (2603:10b6:806:2e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 19:56:40 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::4b63:aa58:1b81:520f]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::4b63:aa58:1b81:520f%3]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 19:56:40 +0000
From: John Ripple <john.ripple@keysight.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs.py: Fix logger error message format
Thread-Topic: [PATCH] rootfs.py: Fix logger error message format
Thread-Index: AQHakQEq08iZYXZd9E2zxmFmoE/rIQ==
Date: Wed, 17 Apr 2024 19:56:40 +0000
Message-ID: 
 <PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2@PH7PR17MB6130.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR17MB6130:EE_|SN7PR17MB6894:EE_
x-ms-office365-filtering-correlation-id: a8408401-db65-4ee0-d531-08dc5f187f6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gkDFZYA1OHJg+2q7GPOX7sIMKiktY4dBwvWXNxnbEN/0BQSCs4B2BPhng7ENOhFxp9c+OlLM/ZQ72TMO7Dvj6LUJIF/MERkvOVXxcG9WjkqIdH6F3imuNrbDLz8FKWVMRxzcAhhYlbvwEoHpgHWNSWuUxxfS1HdnQ25jkY+fdsSp53LfFRTxnGG151WXpRLoFbCjoDNErtgiv8qJIYz6ducEdYyGbC3L6GZKZ9yP2AhH7yT8RzkxmsTKQkD32YTsuRr0Q3TNdcNVV2ZE+Lylg4yH8jVfsRjwa7ihhuHs/5ikDRvbbGRkzO28puSA/GBtRWz9y4Rm3X4eReFGb7NVkyQgzjTsKtivT1nLZeXRuLIIGedWkhPnpendZApYkSkAPScbKqAP99nId9phOnV2Hnfpj6HIO/cX80GM6cOZUlw2HZMVAejksfpBxWOSDAuYK0zt0FsnRr94dn2wsF5MEljdQ7a8/0VbLIMFliZehiur8Dkccyd86DByILOq05CoKDXdnXKYD6v+PWlLcyQnY4QEyF9b+VWPplvmh3hyTpJZO+wuLuloP7nyaFR73qwknXodNEN/vrIy4uRlfh0omIf6jgTFDqwHrCI+duDV82EDXCCaMcw0EGroZxDIY5+zO/uPjd/6CKJu/1pUUeAI0K93Fx6i/1A0aLUyijEmkHhNzeF1uD/Y1dS5fIenM/eZD9f4pHO9+N3YKOJO+twfn9clPB441GKGpsRRcuv0etg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?j143RdGJUGsTl5jsFuXNeTUJ07KCNJsTQEThWORugPS/a6u71PbHksDPQd?=
 =?iso-8859-1?Q?zUpOU9cAW+LqLRWOR8r4AVOD/oBx1RN5nyrbBODWWCrpGvTub4g69ywRrF?=
 =?iso-8859-1?Q?KywTdzIMZeqJaH4uyVR5ZraJFLipJZpagpO/MuT96nXH9e+bxWASzhglK5?=
 =?iso-8859-1?Q?9cW9W8gB252CsNAXAzF3zoLURZqIC4WilU+yeyRhQ+cblqFjPi0EJp8rTl?=
 =?iso-8859-1?Q?wnKw0c7IUNEQ9yRwA3EFPsVVdP1Bm4V6cKjXs5Eye9hzWcs5bcraq27GjU?=
 =?iso-8859-1?Q?aD5HbSGbFEYHWuDPQCMS05CcYaRF34IOnUW3L6fuXkqCLQi20WCfdczBwL?=
 =?iso-8859-1?Q?YtZhKlSpy2RPQe6lm89FGXBLrG2YH500XGb+Qgayw7AeNeCVn3YXttGZpL?=
 =?iso-8859-1?Q?d9zsau4k/54ON14Xio6YxdynY+UJl1g6RXPNd08n1LuFMKFQ008NHmSV85?=
 =?iso-8859-1?Q?V2U0A0Anzzf+bNfF9S6rApVDZVanVzyVYRRTzwMwVOL6/4+ScVIVK7sCfo?=
 =?iso-8859-1?Q?ep2JfGFsR7b+o2arbBX3F9lx4VLHmYSH6ksn/0XIx9dmTCqPWu4VrK2bd2?=
 =?iso-8859-1?Q?3TaOOxFaKVITje2+wg3+evL65IqM+hDm+CUrB6a63qwqIRfrZV708lf3ih?=
 =?iso-8859-1?Q?Cyf7hP0jT6LVFCj3gdOkjVYxPHzK7BTmRYpYsliYqFbQsg9zGTTWUnf3PO?=
 =?iso-8859-1?Q?jYPxP2te6XOqOO2xzJG111KVgTFSnhZkMlmDDrOfiLUc/bBtK5GkXy7Q8X?=
 =?iso-8859-1?Q?H4O7cZlC73Ynywjy4v9cvw9Slqr4EJ4LoyR4yIpmDsGPMMzFaglRIRQANi?=
 =?iso-8859-1?Q?Kjsp/H4p02UHrzFdVJaN1u9r6pBkeVFUvDWjQKlmar6MHGsUTI2RYFmdwN?=
 =?iso-8859-1?Q?BoNyxAxXnb23oTJys5e52WWn05TdOb6u91rdqwdkONQ5G2rAdyKLinPwNb?=
 =?iso-8859-1?Q?abiL/4rb09l3Dhmo9yVNgP1uREm9Tes2KBn2irrYYnOkKMj0RVUil6iaPT?=
 =?iso-8859-1?Q?sQTsCyIItdp0sRC4j+npbgFZQWU6EvaKpcHPEOk6vpbA0iTfjrz/T+b6nP?=
 =?iso-8859-1?Q?yoCOqnUhFcVFkOT1sOCq6MaRaojbfUj3gftoT3wvkTpMvdKClLbVK60lmz?=
 =?iso-8859-1?Q?ylvxO5KV6+q8jkLh8h/0s1Fku9InltiuMqyAShl6jldKkkxGuo8Y3c+eCu?=
 =?iso-8859-1?Q?OR3eL0dQUAxgeN3sTDMjhS8LNhPPEbTZxfebOb4feOnH8hmfiQlsjLgQ4Y?=
 =?iso-8859-1?Q?8QEufs/dq1eWqCPoCcPrxrTZIeSBef2DUbsNGgE8Qio5kybKfCL5sYinW/?=
 =?iso-8859-1?Q?b2rYO9uhj45+QEQNUO105dh8ZU1WfYJoeH1uuvJ+/KCtTzRK2WTF7SnyvF?=
 =?iso-8859-1?Q?LVIf61rXoTYxsmhbeEaKZDKeuOKwYikYkYGnP1axGVaZ5vEQthU94JK6Hz?=
 =?iso-8859-1?Q?phb1poc9xAqxZCLk60RQlJzmj8woM4322HGRPjFHGUMWH9QcvZz0tpkjPa?=
 =?iso-8859-1?Q?YPw0e20r/ki6W3EOIuGOFIINRgR9v/pC7QpwdoxU6BT+oM2cc61YDI8jT7?=
 =?iso-8859-1?Q?LBmUnXcHACnqfQLmxN2LayCoBglaUbrNl+VBr1zWgKxc73X8M+oAB0LjZc?=
 =?iso-8859-1?Q?R1Cmq2+UwWD9vNaYJ9aL1ITgvmfKeQwpl/?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2PH7PR17MB6130namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KOYVkErIbd0yku3+6MKPwrfzgvevk7sNv08JnSFp+LFXnaopABCV6latDUy8oPJZPfYgWLT+ycLe37akjz6eZqlxDY8tXhjG7lyh1y8RqZKIBzac4l5075m5LgU7wu36ZMlJYbYd/8igwZqSHfmPknZWe3uZKu8Xusta1YD8scy3x/wcGv8L9zAjNOBvSXnV4ZOtzYgYgdzXIQ6J855U51UrG1TBrY/h8Luib4CXxx96XXtpoW2HhB36WJtfVRn91fT92LLpWTduZsL68010XnbWaLQFlRDWLuI007+cqIMVZEasw06OwlTrhag+9jOTHD+xx6FEdGpP+VfrVYI/59I9jAmEuWQtRWMY2rYuFksbffZpCOKSTkzjzVVUxIcjJ6Mzb6YhPbPDaiNOttQa7zV2yNZVRhNaBCzxOhjMf5vf5OuYIAdZKan1ifSTRf1UsKMmyX8A4AoIImFeCYJEZICc5UWad+1CuWX+mFucCS2WuFxIsTBIOxbRz+TFqTXLOUFhwPiib5OxNtKXdFF5vqaxa49PTkMQ4yxm7kX+bEV9Pt9jQ+2O9wflIydQmYA/KLsI7rCwh4Lqig9SdK6tZAvnHJsYYpx6vk+SIYxhmzDAGNHL1gc2hHvKvaUbo4p9
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8408401-db65-4ee0-d531-08dc5f187f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 19:56:40.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXOsJ2gZDmW7yL/3Uc2WSYtaOPw8h7tYvJAdwE3uMoF04HoBo69oVDl19VDaOGTzown2zocuf1VTdVkaToG9lhe4NtN29yeJaHHNQdlGZuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR17MB6894
X-Proofpoint-GUID: vjkIZAbH1ohylT9u8ndhDP1mW54py-6G
X-Proofpoint-ORIG-GUID: vjkIZAbH1ohylT9u8ndhDP1mW54py-6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_17,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxlogscore=718 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 19:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198476

--_000_PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2PH7PR17MB6130namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This patch adds a missing "%s" format in a logger.error call. Without
this addition the logger itself would error out and not print a useful
message.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plu=
gins/source/rootfs.py
index e29f3a4c2f..c990143c0d 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -43,7 +43,7 @@ class RootfsPlugin(SourcePlugin):
         # directory, or modify a directory outside OpenEmbedded).
         full_path =3D os.path.realpath(os.path.join(rootfs_dir, path))
         if not full_path.startswith(os.path.realpath(rootfs_dir)):
-            logger.error("%s: Must point inside the rootfs:" % (cmd, path)=
)
+            logger.error("%s: Must point inside the rootfs: %s" % (cmd, pa=
th))
             sys.exit(1)

         return full_path
--
2.34.1

--_000_PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2PH7PR17MB6130namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
This patch adds a missing &quot;%s&quot; format in a logger.error call. Wit=
hout</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
this addition the logger itself would error out and not print a useful</div=
>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
message.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
Signed-off-by: John Ripple &lt;john.ripple@keysight.com&gt;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
---</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp;scripts/lib/wic/plugins/source/rootfs.py | 2 +-</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plu=
gins/source/rootfs.py</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
index e29f3a4c2f..c990143c0d 100644</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
--- a/scripts/lib/wic/plugins/source/rootfs.py</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
+++ b/scripts/lib/wic/plugins/source/rootfs.py</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
@@ -43,7 +43,7 @@ class RootfsPlugin(SourcePlugin):</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# directory, or modify a directory outsid=
e OpenEmbedded).</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;full_path =3D os.path.realpath(os.path.jo=
in(rootfs_dir, path))</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not full_path.startswith(os.path.realp=
ath(rootfs_dir)):</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;logger.error(&quot;%s: Must poin=
t inside the rootfs:&quot; % (cmd, path))</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;logger.error(&quot;%s: Must poin=
t inside the rootfs: %s&quot; % (cmd, path))</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sys.exit(1)</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return full_path</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
--</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);">
2.34.1</div>
<div style=3D"color: inherit; background-color: inherit;" id=3D"Signature">=
</div>
</body>
</html>

--_000_PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2PH7PR17MB6130namp_--

