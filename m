Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6661ACFC5FF
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:24:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.120])
 by mx.groups.io with SMTP id smtpd.web11.53018.1728588265155994271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=33ex/1Hi;
 spf=pass (domain: navimatix.de, ip: 40.107.105.120, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vtl6FC+ie5FnefNdpDwQGue0ih7LrFEhPXMMTArqTQP8ZlBwebsCn6ZmzPJmpQoSSnt7haFTXtW7nggOgjbkopQLZ0vSrOWFa63Q+ApnKD3bNMhY8T+nUz44rXNSGpPMPmP0ldZIdlXAgVKyepd3dh5i3vQDNLd5J1vejSjGx7wlT8yQdslVf0PbUih10apKWRf+GzxVJO4tCx/2fn+UntCldglPPcyhBF0NPZpTuKeZRkISJeTVDQQpvWPsZJT03/wcZCakp76lZJhF40o8wCC8zM/8Kilfe7SK32nbD3cimNe2t5KEhYF2KFFht56plLTTIW4URnyNWKTf964mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQpi08K3DzTeeS2mtBzz7SX4mRPHrtEuD7D9RHw+ilk=;
 b=HdhxDbxWI8XTUuS1kDmXuQW0BIqi3S3FjJv++i5ouZJic25/YJdmN82QOVSnOQtXDIskEUXhSn3Yxug0oiQxFa7gsorPE2myUy08HbBQKyar3GD5iRZ2Mkn6hi/vVJ2Yy9nPJNU9lB9vabzo5iJTsMM08RJQNOumIAmNS7WLK3qU5f9gehUwsL1XeB1tdbMugvEI5sHs1Ad063H91q25jgVTtTeIXXPGcHt5fdC0Iqa8uIS7E8DzycajltYCOMSaecevpoKu3A2ugV6U65GKCDlmQSYr0SniIF354pUjAzZPns/juBX0gLq4PwacZL85Dkfl+bIpmdxJw0ZIKgLDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQpi08K3DzTeeS2mtBzz7SX4mRPHrtEuD7D9RHw+ilk=;
 b=33ex/1Hi4NIlwOHg/mfXpPKDrpM4Uh4ngPec4poBCRyrx6pOaKEtw4Y0X8AlnBv8zQG8bR2ANfBx7FBWGeM5yFuU7tdY2n/Jpkks/R0hjCuBps7NDEpRSXH8qkiALToIVxDet8W8VrWp79okeJBuP3mBQPPvK5OFK0j+A6ZCz2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBAPR01MB6984.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:192::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 19:24:21 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 19:24:21 +0000
Date: Thu, 10 Oct 2024 21:24:18 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jean-Michel Papy <jean-michel.papy@exail.com>
Subject: Re: [OE-core] [PATCH] openssh: Be more restrictive on private key
 file permissions
Message-ID: <kcjsl3kzd2sr5tykrt2mvercsul4mz3a55hxwul5cdvejmg5wj@om7ugtu3yshb>
References: <20241010185107.3312768-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241010185107.3312768-1-raj.khem@gmail.com>
X-ClientProxiedBy: BE1P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::7) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBAPR01MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9ab42c-2513-46e3-35dc-08dce961243b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?rw1S9Df/GdA3eEDzCj6Fio/kNLTGjD0c7C5sGmLHQ+VY90S2jCi+rCbGWP?=
 =?iso-8859-1?Q?Zs2FRI6oj6/hfNHJOCNGazLvY7gP9yWCAXZK3EJFDgAVSTTK2ROEetxfcA?=
 =?iso-8859-1?Q?UWo80noFLBdU4PrPNK44KTxtDXOKoObFCIq4U5mt24QNgNGGh52aE+HP0f?=
 =?iso-8859-1?Q?w1EL3ATTOQ+vLsUMi4ObX7MgEwAIEfayH4I4XdfmZT06+H/3Bhf0RmOG6Y?=
 =?iso-8859-1?Q?v4QAHUqEZLthMMxUSHeP1IJTeAP71VLAe8XnJ2NxbNAJjaBXqpsVAgrbh+?=
 =?iso-8859-1?Q?kvqsaCvlBJAY5SiU+PnrirhUQ6ZOnyuxaDgP+vWD1yimI/VdGXvHiY6vB0?=
 =?iso-8859-1?Q?V+xwSOT21XdqLASHK7mJ84TCwrshK1U6et3X4dCoJrEI/yIi0tLxari8gH?=
 =?iso-8859-1?Q?P7S8ab8brk7h3wI9TTins/tyyXSE5aQ255b1TKrBIuP5c30jktmdgRBcNk?=
 =?iso-8859-1?Q?/fZTClqU0W0gWpjDt833MDKRLb1Bj7E6akf6gQEDYW8KDiynS72vCCYj5B?=
 =?iso-8859-1?Q?y94rVZBRlxX2YTYHB4031p3rIVBG+FOPVYxdRfzpKo5TEdxEK9apM7C5hB?=
 =?iso-8859-1?Q?VizfS2X+xEWbeFe3QRoTpvz1agFR99nbw16HG4H8xRfpKi3fXLBR7zp8FI?=
 =?iso-8859-1?Q?SAkDLoLO92LvJsQK707F+hSKPhOQ2uoXxPCe+mHR0VhzAoi0WPD8imydy3?=
 =?iso-8859-1?Q?EDaEl4YozCT1KQjzEQLXCL0b9iujG3VkJoo9+NHa6CTVWo5iBaKH3KRaGb?=
 =?iso-8859-1?Q?4iysSAjwfMPivBP260VDoQza3bA6z/AeBUk3qYIeSIlJorAI/Gzimak9bb?=
 =?iso-8859-1?Q?RNh+FkzVTRlv4n0J5XJdh8yof5TgoZ+gBWvZRfy/bVlCQV62xuWg192NhX?=
 =?iso-8859-1?Q?vI0Jv2TrBs6C2w7dKclX0a6PaxRjGqptRhru1Mw4ummQDxPQ4ecIds29Iw?=
 =?iso-8859-1?Q?MCuKAP/emAzjUylMOZvmh9hBradruUt016t2iF+yK2qd17e6Ao+rNJbV8k?=
 =?iso-8859-1?Q?A4Mg8sfqDC1GJodcCWN7N1tsQPEvM1LhHGN9b6K8EnTKvMrFnZwReGokQx?=
 =?iso-8859-1?Q?QRdk23jQxVUdO8v9ZIRXszneJjRvI/llFtZhAJzEhS9JLpbhb8cW7huLAZ?=
 =?iso-8859-1?Q?koOUB4M280O0iBi+DpmeE1vnVM+EiEUxZ3pYg30zVcSQVGL5vuHVS+emIH?=
 =?iso-8859-1?Q?rF1PWqS1QoqETcC45LjO/QmjxZkzh4e2C74ibRHzNDWrmqAotH/CAHd732?=
 =?iso-8859-1?Q?FUDK5azVZGYySWPxQBsj4eGRNYObdH/sZScQUW8pXbojJnof08Jz2x8eRm?=
 =?iso-8859-1?Q?Me3bEy6DbYpDyXtURJ3D0AFhBQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?ZlrtkBeWpJlEs2gSE394Cr+HEZ84B+bLeYL8jQL6tQ8erM7Y5fRiS8wrbx?=
 =?iso-8859-1?Q?M6MgEedtAhf2cF6+Erng40OQ164uDGHL1OmZe4V1H1+uT37N1DRExryOJQ?=
 =?iso-8859-1?Q?TvZgf3Q/2GdWOBA/8EFft7QzC5l0I4AWWoW6hRsDHRDnGmydh0YEWMTKb/?=
 =?iso-8859-1?Q?x8cgEAAZmCevY0Kg6vKS2Vn1vOCGNmFG3fmlVtTnSFcCbhZbQ31DukkMFs?=
 =?iso-8859-1?Q?bNRQP2QRC+ZMTvJaBSTUUS3V4QX21JE4EMK6bU6Q5uXi8kRx5lweM7rnh4?=
 =?iso-8859-1?Q?0t4PnwwRricNwoIBLbuPb8iCvNtTJ2f5vUTuuahYp2gWYYxbZW7zdQhyn+?=
 =?iso-8859-1?Q?MD5vaOSmK9HzFKx2ey5Adcf2/0AV++Cv+Hrzft9QIk0Jc3T4NDechpZFTn?=
 =?iso-8859-1?Q?oIGpldQspjMuJqh/CDgecOkZsyxnBKTIRm/tW4TO00D84QJhgXT4SPLR6R?=
 =?iso-8859-1?Q?WL99CRgE0Ijomq/uH+VunIsdAUKlt5HZoZ7e1snNx/PCc4WS8mvzXXuuK2?=
 =?iso-8859-1?Q?c0RrS2wdueMGHIiAGJm5wz9TyF7TDDhcuOxUfZcZT5LzshhM4NRg27sgIv?=
 =?iso-8859-1?Q?ei9bA14sE+rllpGP1eVHy121zNuyM++C2Z4TxUNDRmxtxzf6HlDrvs+sff?=
 =?iso-8859-1?Q?S5F1/KnDQEJgoUXyoiyKMfCE7g+5GdqL003T7fPANnnHU26FZMY2nNvaFA?=
 =?iso-8859-1?Q?GytaG+LmrSZ+PuzrBBmyAUkkCgIKl4i0VCojWCim53ClkNfBKx9ETn3uSr?=
 =?iso-8859-1?Q?plPYJwfZhhLTLiAKXD8LeUG2DxBDzPrcs73I732RdZwL5VaJR8RzWQrh/2?=
 =?iso-8859-1?Q?9HN2udvAPy8icPpO+DGmn5UlvZyyDSg2WFv7GR5MMOCpRC5kopdMb1bcJV?=
 =?iso-8859-1?Q?V2oZk0q62/t2d1Vqgfi+hmbKkvAKSCC6CmLIZnd7lApiQC64rPWAhPEHEn?=
 =?iso-8859-1?Q?YF93KeW/X2FeX84wKUPQ53lyirYjUEB9hc9gjtBKA54L72HUye39VRItAT?=
 =?iso-8859-1?Q?AXIDxhblEHQUsDEW6D0JNxbGH15V0hSJv2nV0b6cnxY4bFfdA7xgsUl286?=
 =?iso-8859-1?Q?nj3QtGUaIH57gdSvAbwJAlo6LdJHMWECdymNXPkyCKs+Fva+heQHDsZ79r?=
 =?iso-8859-1?Q?HVMrJiQpSzcxAZ5HLy0c3KXQMIfzwoz/KSJXWeff5pAH+FWk34AncAW1TM?=
 =?iso-8859-1?Q?FuQp8M4PHXQESTp8ngIo274HtthyBerEUybBdayHIKQ0e0AKVVlGyDV4i0?=
 =?iso-8859-1?Q?IXHgsUiHIbodxiiPQtmWtZxMQTP9s1Jab/FPMKHZHbksnEZDGxOBPzrlXs?=
 =?iso-8859-1?Q?JKZuib0wB2dTof1n7vHIup8BzO67sWwAab2WHST1PxdIeDWqiwtLxh1fHW?=
 =?iso-8859-1?Q?DKF0z+xnRc7MBFME37PMLKaQiJiVLba1e8Of2fxiQkRVrhEbxHTQQkEsZD?=
 =?iso-8859-1?Q?PKIUkSaJwXrbfI0l74s5HMS1m533xwDUCPhRSep/jCQRgguBxp/ty3yEwL?=
 =?iso-8859-1?Q?Q5tI5GiTDZ7ofYqxAjFAUZVnY4auHed6Bq17tg2yTMevgdKUib9XL4QIUi?=
 =?iso-8859-1?Q?L/CKufRFOIXbHWNLJZrVXfJIFa/5deP9e3PA2hKYJIhFyyuNYBL7DkwHAu?=
 =?iso-8859-1?Q?fahbmm9EOCnhw7Clvunq7M/efQqNWTfPqakZwSOw/Mv/DuZcpSjSZ5ag?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9ab42c-2513-46e3-35dc-08dce961243b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 19:24:21.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThPyctSu9y6ZkiYMCf5njLkz2dLFkRFqFqJ6bwXYDKxp/1/Dsfly8QTi4P15Fvltp3LODMZhJTlcxFIdhyFTDtGfnhVcVeijQy94eQT5MDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205430

Khem Raj via lists.openembedded.org schrieb am Do 10. Okt, 11:51 (GMT):
>      mkdir -p "$DIR"
>      rm -f ${FILE}.tmp
>      ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
> -
> +    chmod 0600 "$FILE.tmp"

Or maybe `(umask 700 && ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE)` or
do at least `chmod go=3D "$FILE.tmp"` to not add a user write permission
ssh-keygen might not have set.


Kind regards, J=F6rg

