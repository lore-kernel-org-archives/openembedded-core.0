Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A409C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:07:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.130])
 by mx.groups.io with SMTP id smtpd.web10.6311.1742386066409908071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=A/qFcIKT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioOI6/25dgmv9pdc+juI5jTO+W+3wmm5kKtzJafSHT3k8ZewMthXSukWpHuqMYbe2/YA2LsZSaWdOtFPAwTL9pbHYBFJliD/njXN9/XjC1eYoPah5aMEc3OfnF387PRJCUuSDr3IoQStzghtRoz1g45qh6mltYbZbtpLO962odbzrnEf4JyH/BYWGBpPb+FtPzeo8co5cXxvo0mbVNT/tMRZJwRaQGe4YzU4OXdpotXk3GKI7bdXmEGKiiqItBUnJXGmSFr2KUQyo5OHJ+AeAV9XLpj3C+U8NelkhQ0SwXIk1cZSs0SxrO/Zm9DuGRQrFMPXJUVK5q+iqj8ltZ3ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF6F1BWaKGrpXKQ/Oz/JI+dqoOXeTFMfe5tgglG+SNk=;
 b=Oa/vczQck5oz4ECcjcCfgO4BqMPoK+x601dMoiAAIY1zuYoiEPQEmN+FnDlRBY86qe56AEtytt101c5BdNAaq4FojCjRgGCbjVLnewEtUNe0oaFkjQunYrXhb6DufsKsLG+l8d6gIF4pq6EViIxzhi/K5AyTiyrjn6TZRRdGYOMEMpAUvWjp/gP1PEwIE05yMoNu4+ZN+AnvzT6R2Z6r9KqjXrmGH+5hm5SI5aIfdr3Cu4GB9/wIGQ55Io9YrbWYHB145jE25GLQhBo8CE42tQCL9ctgNhXEmxmQZPue3Rlys1x5dnn1ax8egZoZsYWvgh34eCPmFkhrq3YcgR+ZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF6F1BWaKGrpXKQ/Oz/JI+dqoOXeTFMfe5tgglG+SNk=;
 b=A/qFcIKTx2tkM+o0ei6131pvsnEpspDFDb0kne6qeqpE1doz781cOdHPmV/Vr4ZHWuEs4mJcIZcDupKXxzaNtG7WEYJqp4TSEX/2Zi5IkdvSmZ3CCfV8jeaspQVChWtJOwzzpYjAF9UYrIyuPbtzJinj2MIqhpNelsfXb/u3QkjhXAIqMcoGrHZFMUTRGEVhw6k1vNSHztHqxhk1hHQBzgv+iucTujZthTK17Ij62O/d2hEQ/dji+9fF+Bcs8zUrkFeTndMrLH/rEdfzdDXQLFxg+3z3i0b3fZR09dFMlDk0hMYTP5mCe7MFMdFvvD7Gp2/RlU2IYvhICuaLRwFBfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by AM9PR06MB8162.eurprd06.prod.outlook.com (2603:10a6:20b:3a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 12:07:41 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 12:07:41 +0000
Message-ID: <76247bc2-7707-41e7-ad3d-33d81987a294@vaisala.com>
Date: Wed, 19 Mar 2025 14:07:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] packagegroup-core-x11: depend on dbus, not
 dbus-x11
To: richard.purdie@linuxfoundation.org, ross.burton@arm.com,
 openembedded-core@lists.openembedded.org
References: <20250317134738.1826161-1-ross.burton@arm.com>
 <20250317134738.1826161-2-ross.burton@arm.com>
 <bd402e1219d81b9a5b4d801a1c4e19d4713c511d.camel@linuxfoundation.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <bd402e1219d81b9a5b4d801a1c4e19d4713c511d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::6) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|AM9PR06MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: f8252231-4278-413c-4a9f-08dd66dea621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9/rTJNYvgcINhvbWyr+/58rEmYnr3/NTjed3m2mi0tyP5b45TI7ZfgCuCh3G?=
 =?us-ascii?Q?+97KS+O0I8aCqLcC9VrGuoqia9VjjJV9FUDKDGvCK6BWX9uZ3siRAhhIDO3Z?=
 =?us-ascii?Q?JMBuYnWErxx9ChJam7LETT5G9oh+gceAhGw9I+MQETJSAkJSgw6DnrZJmfJH?=
 =?us-ascii?Q?1vFAz/1PhC9XGI3DUGeQEFxJX24do2add0MBgTcqmrEhrooAc78a7JbJa9uR?=
 =?us-ascii?Q?qlzCsQnPvaKVUBUSLOGwPu/aJ8Kdw/hoKNEHG1QhYBrgPy9lRypl+mYRKC0e?=
 =?us-ascii?Q?ezZx79J9MaL17DQuLacbHJv3tuNCsG+XhCn1xrLrWLrnFSLkQHdHKPD5W4EB?=
 =?us-ascii?Q?hce0JNRV0MEzWP6icRW33YgRzNF5G5U17Pft7K73/w9PFMbTK0fB3wFGmhtY?=
 =?us-ascii?Q?Om0IEfxLsnn/sPzWlZ8+fJjIzcmhAKlng3YHxe41lGkw3UrkZuyQFsfSFw34?=
 =?us-ascii?Q?CBnU+6DoFHB8b+0dTMJu7540hZrrIsjfjiUx4DQaOugddwUcjNdxy3YhrlEp?=
 =?us-ascii?Q?S8r9vSzfYLQkysPy5kj9Z2W0c0/V7Gj1xox/oEbCzmZ2J1jeM+ycv2T7+sZI?=
 =?us-ascii?Q?W0fp3Lw/iy1HlFRAfyOk40hkqJCN29nqA1QUNMbOVQBbkFZ+0jctX+vjswup?=
 =?us-ascii?Q?g4eSbJhTbnk57LzD/8YsxB0l5joP2mJLmvcsp/dfdGKuKUDbSnCd0Pvmks0p?=
 =?us-ascii?Q?9Mj8jjnM7FDAvX848p43/Rqrlq5I0Z88JVTWzi7gZcGE2gRrKxwdoppTTxDq?=
 =?us-ascii?Q?sAccWyFPNFDZLov9ey86c6gtgMZM5nIeFs0101uZgMIBvZb+1sYyq2sJ47EI?=
 =?us-ascii?Q?F1KHDUB5B+8jhT4M2DhJjlqHobiwFfdIQ/CfIQi7nGZJyvYTn5zxcXfKti8V?=
 =?us-ascii?Q?bkwtuBx+z5/8ioRPPHXZBvdLeZZzoOl8pfbT0Ze5iiEokNXxpy4Xg1RjWxR2?=
 =?us-ascii?Q?v8wYkc3M3KNdtgtA2ST9Bv9eaQO5c9MUdbdazHedyTr6q9fZqQC1gnNoVoNn?=
 =?us-ascii?Q?bMbSTnbyTGjIv+5oMQ8jIKOzUvt7kfz09AR9av+WshUUHVn2IYSCcpE0RKm4?=
 =?us-ascii?Q?2q5eA8R0fRG6Vr0RYlAhHtr89tjE3R/brQev4ooVnj6+w+3n+c3stm4UOYJS?=
 =?us-ascii?Q?iZa6XJ7y8wGvklL/xz5ZijiRW8yRVkxvi7IpEEX3lJblJHcukN6SCOpm2iYd?=
 =?us-ascii?Q?m4KxANFHAzVEXGlwA0FgzZwQFwDa1jO/9RKPap2DIXH7mBKdzV7ytzNyZNoq?=
 =?us-ascii?Q?ZWSS862Y/VyJG2z3by6SxOz7JUWGHuY3hFO/EI4ufIObl7/Hz6vfG9hNLf/O?=
 =?us-ascii?Q?14gt9vtvAKIXSGPOzxlL2ZzBQGmynZ7FhNnACeJCdq922g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MxX2plDLuSuGfSTI/V6nSEM1RNUuaw5yWzejXANT8ymtt0mOAniY3nDfLWpB?=
 =?us-ascii?Q?b4WIplEQCCtYDePpRiPeixs/I0Wn8MEydqLG4aTScvE8maP0t5+F5A22f+4M?=
 =?us-ascii?Q?Fk55n3Oux3QfANDCZDekpkgxLUzUJ+q6dfOjZ0gvzo81x/9oLgQpusHQVVXP?=
 =?us-ascii?Q?wVy6vP3bebYbh2Lg2egUS5eC5NnTYdOPsDjrxhdj1SMB6tdJiVDQWwMk+uOm?=
 =?us-ascii?Q?GPUujcIzWXpBep9RAITGNhNSTBGa3jlYtYS51Yk7RkZKoXyAPbfSwt6U41Vf?=
 =?us-ascii?Q?uDfCBPOJhiE9dSg8brKcZzN1CcziN7RhIacSSFGy1Rht3IQpypvHVX+4HP5D?=
 =?us-ascii?Q?ApvuwfpqqcSGlzEaZsHlO9eTEqhrVRlx28KfDhvd9c0ogDb+oF7TThec/rwx?=
 =?us-ascii?Q?mu9YH8XxrZj/JbuZeM8IeMPwJOH9Pv3yH9LcC9tdq6Q/hblsHVxYi72sDvJH?=
 =?us-ascii?Q?wNsODfbGo7Aii658XPa7dakUxvZnSaz0sE+q+rBKUUcC9UXDuzsNZZg5G396?=
 =?us-ascii?Q?yv2iDXZOB4p95Vu/3NDhE760ntDZeUDdJsm0FCJTD2Qx4uVtvVX1jMqam9bK?=
 =?us-ascii?Q?UCxpkOOcFqy2G3uEsJsmHImSPnZk2UNsdUEy7ONDeSMKQGZdVGLdP4TT+hQp?=
 =?us-ascii?Q?nCSgMD6CGSCWHV3Stir+vr0NtdrXyVNcL0+CvwgB9bdjHyuRfhu5eD53kdfA?=
 =?us-ascii?Q?83Ccd9j24ha7wpIcoo5IRYOxM8uA7k+vEnimchPNkurpzsLSXPTYGWwIuy2S?=
 =?us-ascii?Q?PlU3Hr5Jc0lDF0cxt85lkvtCAS2s9NAcZwHMKmE+oQYBhFSanR/AkWdVtlDW?=
 =?us-ascii?Q?v4eVjioz7EyE1FhMWx7u8+r8cSRCXUAa2TpSbsfWuihxB8ZzURxNkFvnNz1e?=
 =?us-ascii?Q?g7qFVHkDghGLFK9WzChaA/NwMkOTASOxhDRyGN1WZivaGA+1mEFsckLsPGQR?=
 =?us-ascii?Q?2abcIVd4g1vk1cBE7b1OurcR2S0p5rVZ44ZyOkfYYfo97fOQBwTsBpb8Ov7H?=
 =?us-ascii?Q?v5eOn4GqxAL5RgcsgyvDwQ7nqjMrdqVk3QEf03xPdkHjs8A4kv0YfE977XPS?=
 =?us-ascii?Q?uSqzpysamolXKkHKMxV+ONs+4LraAwoklKjhIn9Qw2RKZwgCeuTMxmp1g+1N?=
 =?us-ascii?Q?+yzey9XEv8UOzbqRx+JE1r547dOsgpU6TjLUaRJxFTzfu/j4aZ1KSCQitJpw?=
 =?us-ascii?Q?obzb2nkI9cWTpAUq0s5uDiyd8jo/jU1AQWJeOjIFAF87Kk5VkmmjoOqoi6zu?=
 =?us-ascii?Q?EpB4zTp1ycq8xGKe32FL56Qs0blfm7Hax6T8sblu6EIRgKEgHIQiRYX5kiOP?=
 =?us-ascii?Q?3Emik/BxeP+YnBdSOi7E3fxtGD9koRV2ZIQp45fc6wxE2dNWPHv3TkTbMCXd?=
 =?us-ascii?Q?FkAUK7x0eXfwqtapYXq9+3uHrUpFmQgPXYwsI19wPzMb2ISZWmUYKvv3SwCT?=
 =?us-ascii?Q?kVdC6gE7v4Guk7gGE+392hP53VIYK9lNT4fcATeItIDR18qdcQQEnhaieikj?=
 =?us-ascii?Q?V7ICDwIl21fLA3j7WypWXz+2qtnXHylSqDLCV1iNoI+26E7/RtlLv5NjHYUZ?=
 =?us-ascii?Q?/bQysFmzDgxORzpBGU806loKP448frOiNQ6ZZ5+zJHmG4+lU0zTPSPWKHsQj?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8252231-4278-413c-4a9f-08dd66dea621
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 12:07:41.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpHK7xEW9OF4IG2ySV29h+WhnsQipWBq/ZgAv5jzxqdWpk4BytO/zVsFWjecy5NJrWfSXt+HcZ1GtaGllhPlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213325

On 18.3.2025 0.26, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2025-03-17 at 13:47 +0000, Ross Burton via lists.openembedded.org=
 wrote:
>> dbus-x11 hasn't existed as a package since 2012[1] and is just a
>> RPROVIDES in dbus, so depend on dbus directly instead.
>>
>> Also remove some non-ASCII that had sneaked into the file.
>>
>> [1] oe-core c02364f36e228835ea5d7fd4e1d347fd451f8544
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  =C2=A0meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 4 =
++--
>>  =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.b=
b b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
>> index 91db7ed33bd..4a3590e3e79 100644
>> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
>> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
>> @@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 xrandr \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 xmodmap \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 xdpyinfo \
>> -=C2=A0=C2=A0=C2=A0 xinput-calibrator=C2=A0\
>> -=C2=A0=C2=A0=C2=A0 dbus-x11 \
>> +=C2=A0=C2=A0=C2=A0 xinput-calibrator \
>> +=C2=A0=C2=A0=C2=A0 dbus \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 "
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1209

For your consideration I submitted https://patchwork.yoctoproject.org/proje=
ct/oe-core/patch/20250319091329.3057329-2-niko.mauno@vaisala.com/ which rem=
oves the dbus-x11 line altogether
-Niko

>=20
> :/
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213127): https://lists.openembedded.org/g/openembedde=
d-core/message/213127
> Mute This Topic: https://lists.openembedded.org/mt/111749484/3618471
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ni=
ko.mauno@vaisala.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


