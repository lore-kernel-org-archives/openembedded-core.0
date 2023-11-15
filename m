Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA8AC072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 21:53:29 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.26106.1700085200592251649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 13:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=SGEFNq1J;
 spf=pass (domain: welotec.com, ip: 40.107.105.69, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD1++KjwUcEeTK1lNl8cRaaZhMpRiA/5iEsA63n5DZlvsioomL+floGyztf5Qze6LVcaY48PF7d7FGb2/fsrWGZrn9JrtSXSDq9+JXqe6VaWbqg+bLpKJuhh/d2qyL6A7Pi+wf8fkvZOSP+sTsDVOycALuinC0QN9jftfyRWQH6mUqgYk0D8QBjJxD+42kKM6WX2jO0CbYrD2aJgabAixdB52porntFLawEt0YPds6cHixkFK6u/uVd3ugvIqI/nJ2RbtG6eTXGELeI1OqkLYAA/NR/cCPRdqLGZ08ZqiT7H5pJp6dtH+Xg6j6w4kGxCDrAPMzGqnm9Lrk8DQaBCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsym8Zxe7j6nlRMzWY3asZxSD8aI7gax0YvwALgCeXw=;
 b=YEpn/kcat9GlZHmr/zhqHaT2C6MYcJrEjeqFvSjx+43uaaroc46PVzru7KkasW0Bv272FD4gAuNizzIUgsLMTgfc2JYVHm0cWWhPNPV3pXU/OQgjJbK/6s+pJ6eTduBymH57bgH9BiVj5QrB3NfG41qvCHJKqfBkpcXSySHTndhs/HJnCaD0wn8iooy4DUWFJG4NDrJZkEVPOcbyDxlcMhKdU/MIQk18XSgrW4++qEUVa7a2LWRkEHZG8Nbyct+jbi22UcdToB49hG6JqXm/P9ePAbCMwPtDCBfgXrVTR8vuBux5xr1rWHZvR9D4QzxTB5LVsUXAJybYBiW8Y04uDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsym8Zxe7j6nlRMzWY3asZxSD8aI7gax0YvwALgCeXw=;
 b=SGEFNq1JOeaGkxTpZEPEWqmcfQCNHGj0rY2hT7yMK//B4LCDqxI5ty8jrair0yuEOQiq0ksYIeqfm9EKladPeBsgqMnkiqhD06pPeZqLh9hGem+DfDfakmhFb1u6Gwg8lA2ocmM5Qkn9NZ9jF+kwgv//xDZm7QUd2FR6PnYeC6JJ3lRSGw9JrSzZ1sCKd1rekbA85pBNI0E276UFEaBgQmww+i5P/u+yMv/WR03nSXIUaJ70szrR5c9g/ZkXsxnO8uK9++BVOJN31zA2EPCbgAExG6ZGI89iR42Vl7hDE9/XQJD8F3F0XhiIHlrNQIrlB/P+rSDIWSixKfNKgbmIIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Wed, 15 Nov
 2023 21:53:16 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:53:15 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v2 1/2] curl-native: add missing ca-certificates-native dependency
Date: Wed, 15 Nov 2023 22:52:55 +0100
Message-ID: <20231115215256.867653-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: JN3P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::17)
 To DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6475:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd67f41-9961-4e25-4a05-08dbe6254512
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K304HrP96qb4RXvqIwluY7CuZeF5EcA0xnajl7mCBrGQDPlgULZFO1SFIbT6cbgkc3X2rAdyIykdZfYEyLTnw5IO4cfWVaEeSP3ql5tsOkUfMRGYJG12K3YDruz8tVOA+1KzzOMWbYXp/p5Gl0odgYEExehvuAfiv4N28k38hsPoUeQzF1XnltC09M73OhzdW944jK0uNuBll7bjHtyB00OyAA7rUM6S9Qq1Cq1Emk3HKQQsPMsLwDOtHM6slMMwWx9vVy5OkM9FqHDrhlf5HZ9s1TDBRT7fBIVfrKmDuN0J9zL4PJXdUh3GBC7qKDWXfvM37IpU0k/5WoQMv5cKh/Hu7SK39Nx2dd+RihrvnnqktquYMCfmRD/FyAPpCuolSFfPa/+G7P7PyDga4mM82q/iWtRjrgTc+FAODx+BWiqyQzF6rSXROQ/88ER0qQQSR4bPqk5gsTrq/YhU5+15w6YvVb/EgUxErl6mFTcU8K6hH0kn3p53r3MYhG6bTkgyElbE4PRrATy+fVO0lZpgX/ou6UR3jyuE9KZkJmUAqeyxbxFWAXUpV9x6r1s5av6+vNkqy39wj3riRycSZKuyEDp0GameVt+yKKwcDhwWbQBL6a2vBI7ypVQ9K7zt8Wqz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39830400003)(376002)(136003)(346002)(396003)(1800799009)(186009)(64100799003)(451199024)(6506007)(478600001)(2616005)(6486002)(6512007)(52116002)(107886003)(26005)(1076003)(6916009)(316002)(66556008)(66946007)(66476007)(6666004)(4326008)(8676002)(8936002)(4744005)(2906002)(38350700005)(38100700002)(41300700001)(36756003)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lhFHL3+iEU3aIdDeN5Ulz31Ktu0n2qmd584MRkxzGIRXdXFn2q2ro8XdR3AJ?=
 =?us-ascii?Q?hkEZDXO1VOsMzeRPhkV44EO+Au1orBrdJQRu1i4+eV5iozRNy/ALUFI7ulYz?=
 =?us-ascii?Q?nDwpbtX8XtgFPgFxhr1olP4sON1EnAZomE7w1KFAcOaoiBvX2PvxOYB/xysJ?=
 =?us-ascii?Q?ymamo8zzNFyhe6R+0/beJj+ciBWgNtlg03QEbvL/wutSra7Iq3kv8VPvRVf8?=
 =?us-ascii?Q?X2IFEfz+qF3GplAyhxxoB9b2sA82xZYex1KSutMWwFaiXfAlVm+0DoVdK7QF?=
 =?us-ascii?Q?WUUdrtXqvOi4fOHClnpz+TK7HmUY6BbFAGGy19931n31u7TPSnX5D7eKj3Cj?=
 =?us-ascii?Q?9hWoKUEjfJrSCXgxZlLT8iOTs/PIe1NbqiiFxyqo3JXoQ00Ntc8rysBy0F8G?=
 =?us-ascii?Q?RuCAp7LjhSI5FcMXbze4Mz+T4yuWmR0ymKBY2qpL+0swLQUfqmTqKN3oithj?=
 =?us-ascii?Q?nXsFK5+lBilCMu1jbXtUGnnSB/mDSL1mDHjGPQ1u40rUNgQV0u5qr90VMFb1?=
 =?us-ascii?Q?2XEp5+vURBwxh4cQ3OkuHv3zKhKrJeftR9H1oFxNwg6YNqSkc1kJe6x5O5Ra?=
 =?us-ascii?Q?qxEyrDHgkInphV+UX8xFxhGznoaE82kCLNORJgZNtgV943q9Nz9txVHJ0GQT?=
 =?us-ascii?Q?bvmK2Wr7lC7aXWzbuvcrQ9eszks/GVIzbZngjEYtO/o8cPycvHnij7A3p8uf?=
 =?us-ascii?Q?nzzLYr3SxpV6Dk6yqBQfmU33uXIQ+WXHI5WEuU5hr0G5vHFVZrUCNGZUJWBv?=
 =?us-ascii?Q?ULrEQKbteW8em0ha1n4YuA7vDDYMF6e2UaGm185tC01D/3dA3NJD+oF3z41q?=
 =?us-ascii?Q?MD0NITYEEqVUNGqxG0T9PhwE7EPqZGVvhV5DgnHGOXDRvMpquJ8JxCyIGTrs?=
 =?us-ascii?Q?01oxCkbiicb7T1CouvByVJaNnYJBr7emE6priCYbXq2M9uXVTmAPb2tjgeUS?=
 =?us-ascii?Q?tnFyJhVmNHJlxLDW6WTFzoDxf/iQ6aRnNe/Xml7lJcHpyGAN7WV/tSZopXlE?=
 =?us-ascii?Q?YquXCFjkdhRbHiO6UWuKUn+URbO/CmW0nYadFKx/a4aEmmL9tDN95GdmIqha?=
 =?us-ascii?Q?toPjl34yFFX66ASOTDLbqs+y+l6pxiVFxCy87GA6LlewyG/JDetqgTsvDCIh?=
 =?us-ascii?Q?DNBnmiet7sze59f7tTRu3SMxGpB2hRCZel9fgB8/0bwGb+wI/xi2ET4o4IKT?=
 =?us-ascii?Q?0HV7FtNjTB9HKg70KT0SpCHB8pnTjkRD2PIGaHbAX/lfuq70nu6mIoBe/6Xb?=
 =?us-ascii?Q?SxyQs+17TPz50Mmj8klp6nNCTBzICOgEo0I565akJVwT/EqHduzxzbPfUsnC?=
 =?us-ascii?Q?7WlYSm9dB3ijS8wD3OE8syTdHjbhlk5NQzCCNlcPAT35rJqJIUTwYVwyhJAJ?=
 =?us-ascii?Q?k79kkNiak8kfRTPUf0elb+SGkrTzGtmjPP0sQnBtqisrSCy+TeyuB8eiQ23f?=
 =?us-ascii?Q?qxPrlPVg9qVmXKawe/fO8U0SU6K0vEcEb5jP8iaxpmidRjPqJIJ1YV5edV2q?=
 =?us-ascii?Q?HmeVmuZWRo2mWLSffDIqmh9REsDjQrTtap8ZGlnuD4Wq519Mu55UxBNAWOcZ?=
 =?us-ascii?Q?wPCDUciMbkCM/lKdmkTahlkCdvgnW0ijvCp+86BT?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd67f41-9961-4e25-4a05-08dbe6254512
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:53:15.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7AuvO/goA6F+MqL1EHRuCmL4f3C30IqpE9kJ/yyvxb4dwzatMUdNCCCSlOhCsYO2Zw/WPgt4aY8aqFYkg1Upg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190743

By default curl is being configured with:

--with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt

which causes an issue for native build, when calling
curl-native command, as certificates file is missing.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/recipes-support/curl/curl_8.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support=
/curl/curl_8.4.0.bb
index 5f97730bf4..f0e09868f6 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.4.0.bb
@@ -130,6 +130,7 @@ PACKAGES =3D+ "lib${BPN}"
=20
 FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
 RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
+DEPENDS:append:class-native =3D " ca-certificates-native"
=20
 FILES:${PN} +=3D "${datadir}/zsh"
=20
--=20
2.42.1


