Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08AEC61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:38:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37501.1787841199725342437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 07:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OavmTRQ9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RE8HSM420235;
	Thu, 27 Aug 2026 14:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w/LwGFWtPvCTNDlhS6M5ZAMP
	Z2d3eZXDv1NzW5kILBY=; b=OavmTRQ9eBLKUyy4dg5HWoLmwENLlC4IuMnPa/5Q
	XZTnKZufK9K9prMcr87ftWEId5Bpy/C5U0PwAFKxWBLT3kooAQfEIJyYimB78981
	95qz6fDKTAtvySq7CdBhzdb5vQ+uOaXEpR25JUZEsBhLKZCPsdHH8ceZUm9SdEvH
	lntaRBiUl64+ZSHIxKG3YhFJsC5AH8pkP49dMaKi4zWvCCkt5RLwFYKiIw8QHFbL
	VmmZe3rsR53Hbwi160SipeAs5wOYkQKrmbe8VRJV1KCh/3sQf+sWJYGYmtJBMMru
	5fV2ppQmJvaChUHAAaU0w9LNUNVn0jE5MPjTsYxStLOe8Q==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egm5s5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 14:25:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnEW0G4e9AW1BUJv/7KI/qDPWUPSBy1Um8wOPIbeXc/I1KszYx2NCylIJ3kw2K+k4K+JQHZrf7j/DTHz8OXcOXd+3PKumIDw8EOt9GhvKj3M07SvnCjU+on87uYPANbN/vFpg0WYnXd3CU9/s8rppYIDMz+u/1g8pwYCzFm/HTgMU59OgjnlTEpDz3sBvjoGSF1KZr4rNWCXY/OD9QKYvXlpVbrDlzAWTzTwZfv9qp1waIbF/ZxVQ1yEFkaEkmgMvczj9qdr+/9d8fE8z+jRBeD9yAkPbi7/txnCl5dB9Gffgif4GnRLIk/BpdvbY6vgOf/HtThT3Z/nNbQq/ST1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/LwGFWtPvCTNDlhS6M5ZAMPZ2d3eZXDv1NzW5kILBY=;
 b=OXwGF4Lmh0aG8ayO9cdtZ3H4Ls6XpYzFiARBpYPXqs+PXWVtDstzKtaLMVmXkQ4jNFRJrUNLFAs0dFTzCnZl7SoGG1Rl09GaUWhiGFCmeVDFpJXSFEhi8QQ8AtXxsR+6cdBWIvpAxF5bDl+X/39tqH0cCgjWZx80aHa00BcORk2jzbjmcz9MqEcwu2m9j9I7n8zQPbA4SggE1X6uMdBbGlOCFnsCSHhv4HDDZ+4pLabcNRgFKI+yqJ0fcvG83Jpj2Uxe1Sq3t7RNw1cB2Z+1119GkpabWbRXOfmak8bX04bomUCPbguwZs2oei0W2YITxZyB5kcx/rEyvYcoM90HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 PH0PR02MB11128.namprd02.prod.outlook.com (2603:10b6:510:37a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 14:25:16 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:25:16 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Zhuo Fu <zfu@qti.qualcomm.com>
Subject: Re: [PATCH] initramfs-framework: support LABEL with root-only udev trigger
Thread-Topic: [PATCH] initramfs-framework: support LABEL with root-only udev
 trigger
Thread-Index: AQHdNTza/qZHEReGJ0qu1XIJA4oOkLax3pmAgAAV394=
Date: Thu, 27 Aug 2026 14:25:16 +0000
Message-ID: 
 <DS0PR02MB91979DD081715D614A771F72EAAD2@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
 <be4ca49544e914642e9e4824f2cbd001d42535b0.camel@pbarker.dev>
In-Reply-To: <be4ca49544e914642e9e4824f2cbd001d42535b0.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|PH0PR02MB11128:EE_
x-ms-office365-filtering-correlation-id: 216b6e53-8313-437f-7d1e-08df0447040e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|6133799003|8096899003|18002099003|22082099003|4143699003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 Gxl5/U6x0V8kTojRqILxwUJocfUVhEIs5CAXeaqSVQbFKyD3iwJT5qsH1+gDVSwI5E7Ou6aYxxkrMqE9PvUTYZGyZTK1VMTV2Lu1mTCQjCDTrELZWS7GrgDUPPxxr09s3buJDq97Ja3q9HUMiwrNU55ygL8zDa1dBuqdpqf+77NgCrFaOKLsTsorgI2a7d1mWs3OiavWA9wIndP83KmWRJSqH7yrrqAvL61Ne/i51VWnzU94wOGxJwQpRC0R7FKKuU4gPe/7iUrLVAXtI1sDpE06SS1Ac1AvF4OTWiyrDOqOFnxr4dUtcEZP8rKitzC6ATNeHEvyZAoi+Pl1zcSMJGBGNl9GdIeRVndXp7Z5pDzrdV4dLzmCwvff893fBaMLbweYLEXo8tU4Ftf/dWB4bJ6BAn7fWmCm0y51bHr35ShqrA7FJeXwu/ENtM6MKy55YaxaSzt2M2Il7kGAtaJ5HXrTy2wUPSUO0airqMFzIaNb3IXTAWZ2PvWcH6rtXFfpbL3u1SH5rjEMtFxJNR42jhbI0MKEtKitZnVY33Le4NzicdoK/R6OmPwRrc9/XPeVvgKELtUQtTSyofRqiKSaIyn9vebQI3Kh5AsTHDuv39eN32TbyRfqP1kmQgMzfn32RztayB65PPDZ3Pm9uCqtNKIfTF/AQ8qSR00AxMmC4ubg5ucCfZKzAAVOZZfONkou3JV6+V5Kp+Mn/kRsDAnvyhjHiiWq01o+NsERLvZo1YI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(8096899003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Tc01yKs4+y6oKyUXo3dEhCsDpdTJsJUEc5OpyhWuX6uqVY87h8kIVcC3LZko?=
 =?us-ascii?Q?QuNptosaz+5f/stdcSbzkbPI00mKyWv6iXb9xnvdyHsb8ALnTaAj8spdbXHg?=
 =?us-ascii?Q?FdopHVsKmu/hDM2ZeJyzWiyWUF2RNg0GLn2yVo0HaIqoUCtqGo/AtRaUucEz?=
 =?us-ascii?Q?2CoIzlu99NZNmhjNkR0Wgzu43H3cwxJUTkjUBt+jcGYXIatDp0IbP0FazECI?=
 =?us-ascii?Q?jizBmULfJjJbbS2Mh8ay8VMKEytrExKhK1Se1zJoL0LMfU7zoZktD/51nJ7x?=
 =?us-ascii?Q?J9d7FqrK3Cqm1/Jx2Ebdfyl85/VP+YvS2UwAyipJSLZQTEQVBWTE8XeTHNqD?=
 =?us-ascii?Q?r2S1n0vNy9Ir8mdxWeBVpGSiP/QKe+8oqIUbgK5z3AcvcxHTQmxNBAH0q8va?=
 =?us-ascii?Q?busAfw01JPuoGqJwm5+QJAH/q5lW2WNCAEhNDN87/WdHggR4JArpFCIy3ljk?=
 =?us-ascii?Q?oGmRJ4f8UMWtLN22/UY9BBMI37xrZtdjXR7jmBYA37QHbsmwLIc9qToRFBeq?=
 =?us-ascii?Q?Q/YIVptKMT2B+Mxqa9u2OmQCb+SpLoRALxCbMhfGZRhnrgOq0JiUv2BhpqyS?=
 =?us-ascii?Q?fNA+oJjhAKOAfK/SLzL1nRTgBB6y5Hmz9hz8dtNPmDmWd1oGG90m2i+Bxhcm?=
 =?us-ascii?Q?9d9RqO93aZMTxQrYIpLZYveXKwREnssjMnUiuITagSufDGLM4wDYHmJLZAUm?=
 =?us-ascii?Q?LPzeth5PY0+3LI4Zek/MD5tctXlydzpMesazDbRIB8qdfUfVpQtllNic6Gww?=
 =?us-ascii?Q?INKJoHEYGv8cmgQ4mEti7iyGz/WGD6Tccsh4QrFSx9jfgyHoBx8l/wXuKK50?=
 =?us-ascii?Q?cUddJcbwIvbHcjPRhvuHyNwSNHcuhFT3KDZu1C3UA7wZ6JFcn+w7o/crMaFj?=
 =?us-ascii?Q?04ITBjAR3iP3C2qAgDNU7e56oBNZwiUjo512XXtjd9NbAhyIDxjq/H9aHpF6?=
 =?us-ascii?Q?zAtAHcfLh/i8AvMKD4ROXvgmsS2DbkTdDrc289aRicG4lvx/rQc8FFShsfkv?=
 =?us-ascii?Q?EKSr5cEuS5mPcT1FPO9YI/Lk1KFfS220FI/DYUOZL9FuuXEyFUmCvWmCibWF?=
 =?us-ascii?Q?ORMco+kpjMfyF1HajLuPrX86cSk4uSbaTABiLYwMu4d8K+TDYiQaqCBGC0kN?=
 =?us-ascii?Q?xqZOIPO9skAvpsNv6RqRSdM+oGxasb5OD34ZQCYRNFzogFzOngWoos8xtvWT?=
 =?us-ascii?Q?ybocvzT7UhbNS3lgon9q4OETBO5HsnqYRXMK+iw/nbaFWUsOCU5P84rcms0e?=
 =?us-ascii?Q?isNX9OWRbD/K4lw/0tWGpNaL6MroKhjy8+/+GPnftPZQaZdx/d/0QySyrXzv?=
 =?us-ascii?Q?InuQ2Ph2s4/qsrx/q7tEyj7G0fJG3nvCNe3xVpnMV5HnyxH7rzOf1CBc4FOg?=
 =?us-ascii?Q?THGObKHO3PlouL7oWl3NBrJeU9vqSi970akk3XbT9YBNU5OJ4cRFYcsuS4u9?=
 =?us-ascii?Q?UaXsBzzy/PiFWp4i0Q6uai1x/VY5o8rPM9mmQOvPyQMarTmjgI5p5paRfy2c?=
 =?us-ascii?Q?C2TZAyM67H1qblIG9amunY3xCsQF7viO/CsbOBxzVBriDzJpD6whhd+hAk4A?=
 =?us-ascii?Q?cwrOq5+9Y6qocuM3D2UayKnrW33mtODQAax+4JG03MUzHO9cBcYZCJFhkM9R?=
 =?us-ascii?Q?paXdt3ZOwO3sZM5dB9BhUdPMirw4VRrW6vUG2fpFGyBIevdl9k1sbQYnrUjq?=
 =?us-ascii?Q?1TFtbOqDg984Xk64FfQAWPiBEGyimhUiffA9n3q4LGLo1fp4eujIrFsV28Cm?=
 =?us-ascii?Q?JSTp2QjBSw=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	gCOQYPcbqY4PCUaW5bqA3LuxLxgtyvOAFaJiy7t5SCwcv6c90JdrNhl+MF3yQW4Vx3xdad3vfWK8KtS1KYrUWlQkSe3vREygKmBxWFmULbVE4j1feHEZmOhlnDGOjWQM13CqzN4iuNXJgBPb7koUx3XFrumXKwmZldP/Kt2n2AkDmz3ySwnEGfeEG2bLPar7bxzwVjDDA0MDFMKWG3aaFnGu/XE0YRzhtUxT+suzkRxiciDJBnp5pZFc91g1woOiG5afImpcGwpV+KIuQzLUJkYYE4y/vZNC6Qyfju/rFJaNUzLKfaes1zTSW4IGL8fTayBIbT/z5+O7WOp+FYf0nQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GC2yH+BMVoUBQLMs5F2G0hc8vu93m4hCjIUNoeCUR9naMCmlircb/SFIgqkTAT0BMOKMzuM5Y5yGn72kEmVXp8sa60I6JUVBflvpzWiO7jVJl/QOgx5CmLQe7nmlE27X3RstHRbixywHetKd2R56cd8SMHPsu2OYp9VrdZFkk+Ewpg2WhIzq+5z9/d1a1EBCXCwE+oleWn92CXiK4bDCbGt20NBscG+PMFr528yISc69iXpa99LeY60M2vBpx0hfxQjC4uomujzo2gCLagR0moogmRxsK6mnitYqbVZTH98vzpueR6bljzJiUMl262WDH72UTAZW2earrk/tp36EiVFTiHMGBHniE2RoA9oOddgPPn4kBExK1pQbo1Qte286THY3MXlqOjTtzLKZTxQ8EcloUeMaFiccaAUsfdtbg252lUixSWDWAIo6wvY/BEA8rOTd62didcLS4kU2LSwXCa7WG9G14HXHO1DVEnrpkt/rkc3bfLhZ0jQZ7pAA1ToQgMgb7UF5aos1Oc8K1dxiP2TNIsZGiE1x9+q/JyhuF6afYvS9tb9ovTkdzUgMKEH59+3XLNmbXQxcweZW5qbkeR9YU8BTG12UmU5pB6tVXyYPfHG2N2KRpcRSWvn25Atj
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216b6e53-8313-437f-7d1e-08df0447040e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 14:25:16.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfZ8d9XAAxfggX12xS99pSOzGV8whlv/EydYbFA6lV5Xddpyt1lRylpupyxOw09DExe8NOq4maRQ1OoOaMc3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB11128
X-Proofpoint-GUID: -7iWL_VrBTVmTRaj7wQa28tLacnaQmzJ
X-Proofpoint-ORIG-GUID: -7iWL_VrBTVmTRaj7wQa28tLacnaQmzJ
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a9048d2 cx=c_pps
 a=Gc3eVlh9LBNMAeWdk3HO5w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=JkBhXA4uUwgcnXtRVLMA:9 a=CjuIK1q_8ugA:10
 a=YPmfi8e7XX8E3MAt:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyMCBTYWx0ZWRfX8MbuWtcoEJ5W
 UDGz46RRI1tLY/68kXRSNI/oToNcjQ5Y826V3u/6Cr0yxBiKKDVYRRVravI16Hy/4nCGLCrP+8E
 zarztHHYWhD/RLPpFlomsVcH2KNUS4lE3d0t/dDAyun631XubAQ5tJr+nHpskDt4zlcevGQ1+B1
 lerSg/sOk8wYZFcBYiQylVRGmAFm5WJPxjtT2Bx/BnLzyoCMrvbBi+X3GhVbDmh0GyFd7yNTDuI
 09H4L5os+SW2jJ+E6oZLRt78hgkj2sD/ZukLs7GsYfIa5ljT6NF7P8mxx8zs8dPDTDWNAYsqpzW
 fwwCFVMy0eaRMyZTJTXpfa6MpgCtrTw9N0EyvzgQFttwXTubQgSWi1AOraWTBIunubEb5ovhiII
 2bNWYG33kYoyMlvzDRoxRSYuWBszLbObX9IFZ+IpCW9cQyxc/C6sigM3D1lrBVOWEvmmRUNuCuC
 7sBTyiQMKUx6y3Qfu/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyMCBTYWx0ZWRfX/vIsjWmZuMkp
 kQzQocIK/gl3bKNLue5tRcH2HA5pKSdVjlMayAFWdHsL3/UnaDIRmcft99chwdpgXBVOiVNbfE0
 PIx4U1p3f+0pZfzIcnvBrorJJQfSQ+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270120
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB91979DD081715D614A771F72EAAD2DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 14:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244496

--_000_DS0PR02MB91979DD081715D614A771F72EAAD2DS0PR02MB9197namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Pual,

Thank you for your review,

Good point. It does not need to be enabled globally.
I'll send a v2 using the separately packaged util-linux-findfs as a runtime=
 dependency of initramfs-module-udev, leaving the default BusyBox configura=
tion unchanged.

Thanks
Wenwen
________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Thursday, August 27, 2026 21:04
To: Wenwen Fu <wenwfu@qti.qualcomm.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: support LABEL with root-only udev=
 trigger

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Wed, 2026-08-26 at 17:25 +0800, Wenwen Fu wrote:
> Filesystem labels are not available in kernel uevents. Enable the
> BusyBox findfs applet and use it to resolve root=3DLABEL=3D to a device.
> Read the kernel-provided PARTUUID from sysfs and trigger only that
> partition. Fall back to the full trigger when the label cannot be
> resolved safely.
>
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  meta/recipes-core/busybox/busybox/defconfig          |  2 +-
>  .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-c=
ore/busybox/busybox/defconfig
> index 1f4b5e3d1e..a282370a8f 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -634,7 +634,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=3Dy
>  # CONFIG_FEATURE_OSF_LABEL is not set
>  # CONFIG_FEATURE_GPT_LABEL is not set
>  # CONFIG_FEATURE_FDISK_ADVANCED is not set
> -# CONFIG_FINDFS is not set
> +CONFIG_FINDFS=3Dy

Does this really need enabling in the defconfig, i.e. for all users? We
try to keep the default busybox configuration small.

Best regards,

--
Paul Barker


--_000_DS0PR02MB91979DD081715D614A771F72EAAD2DS0PR02MB9197namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Pual,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thank you for your review,&nbsp;</div>
<pre class=3D"elementToProof"><div class=3D"elementToProof" style=3D"font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Good point. It does not =
need to be enabled globally.&nbsp;</div><div class=3D"elementToProof" style=
=3D"white-space: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFo=
ntService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">I'll send a v2 using the separately packaged util-linux-findfs as a =
runtime dependency of initramfs-module-udev, leaving the default BusyBox co=
nfiguration unchanged.</div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Wenwen</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paul Barker &lt;paul@=
pbarker.dev&gt;<br>
<b>Sent:</b> Thursday, August 27, 2026 21:04<br>
<b>To:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [PATCH] initramfs-framework: support LABEL with root-on=
ly udev trigger</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">WARNING: This email originated from outside of Qua=
lcomm. Please be wary of any links or attachments, and do not enable macros=
.<br>
<br>
On Wed, 2026-08-26 at 17:25 +0800, Wenwen Fu wrote:<br>
&gt; Filesystem labels are not available in kernel uevents. Enable the<br>
&gt; BusyBox findfs applet and use it to resolve root=3DLABEL=3D to a devic=
e.<br>
&gt; Read the kernel-provided PARTUUID from sysfs and trigger only that<br>
&gt; partition. Fall back to the full trigger when the label cannot be<br>
&gt; resolved safely.<br>
&gt;<br>
&gt; Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/busybox/busybox/defconfig&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt;&nbsp; .../initrdscripts/initramfs-framework/udev&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ++++++++++++<br>
&gt;&nbsp; 2 files changed, 13 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipe=
s-core/busybox/busybox/defconfig<br>
&gt; index 1f4b5e3d1e..a282370a8f 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox/defconfig<br>
&gt; +++ b/meta/recipes-core/busybox/busybox/defconfig<br>
&gt; @@ -634,7 +634,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=3Dy<br>
&gt;&nbsp; # CONFIG_FEATURE_OSF_LABEL is not set<br>
&gt;&nbsp; # CONFIG_FEATURE_GPT_LABEL is not set<br>
&gt;&nbsp; # CONFIG_FEATURE_FDISK_ADVANCED is not set<br>
&gt; -# CONFIG_FINDFS is not set<br>
&gt; +CONFIG_FINDFS=3Dy<br>
<br>
Does this really need enabling in the defconfig, i.e. for all users? We<br>
try to keep the default busybox configuration small.<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB91979DD081715D614A771F72EAAD2DS0PR02MB9197namp_--

