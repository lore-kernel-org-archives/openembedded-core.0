Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48943C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 14:58:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20265.1712847525773229472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 07:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UIcek8Hl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48317d0765=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43BBYMPS018356
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 07:58:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=PcBO8LgXpSUoKHdPE5d+GL3tP5UUveiiJY/YKxugTUc=; b=
	UIcek8HlXWcsbIGonn8O6YClDWOJBnMAXgPojgn3Ck3UYSNGVc5/cZYwdoaLOroZ
	ts9otDbvi8oq+P1e+XRQ1IqglkJDg6s8Ph3xhWT56E/qTuTDIg/BRxtWQ5vY6a1S
	6dZIwZu7zx05LtWJ8HyVQ9CVwSlbsDtYf3Q/qbQmBGX5BsXvnaatkh4e9ubj0m0J
	2UpV+WvKWm7rHa7YOHxvipY+iMKFCSolgb+MWL4MK/1nAyNAm1BH5wQ8Pba14sNd
	bRYPGafnZlsqZAuGtoz/LfkXuyXsdoLQ3wWdgUeN6Nqc6/7K2nic9rvwlInHV0Vh
	x88xTIsofmuPZ/y9z5uJcA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgpcsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 07:58:45 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43BEwiep002542;
	Thu, 11 Apr 2024 07:58:44 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgpcsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 07:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpm6BRZCXiFbsL55rBPVRo9KQk/Y/w20L1dkclsZepN+S3zr12RcG1m1i5Wsk33HAX38awdfaKC4WUwzmTI9ZxO8jTrmQkIOdR4g8u7In5LvCiz2QYqgVCdGIiEj34Y3QSOm+2wWhZkqyRqE0CZvmRTLQ06boQWtUtCmYup9TVx8tlKL9c75H0u2coNnexec68e00YqD8lVFxLW+U3mhHi+LT/BL55iyyrX33Wcyt0ZEZJFFK2MmevzJeor0WBpG4fh3OYJNkNMALK4QuP48ipcCapHfq5QEcOjhKiDCsl+Z3/6A/Q7j7DHSuciBk6JvNrduE60VxoORd4hgigoHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcBO8LgXpSUoKHdPE5d+GL3tP5UUveiiJY/YKxugTUc=;
 b=Z9V6V1kT5WThefaRZU+gqeGX1VPfm5w17I1q15gc6FIHA9uWnk0QWeC84N1YIwrZFdZcL5vU3Hd7bJtsKb9WVpJmpzYujFL5uBl/H4be6JrsQm/eg4OiLf5oqRj8rXnEcKbjXsNkfPEKMfQlrSNg4giuGfIBE28WPvzx50D95QzOnAI3HIHU0YoBJrepNKWqzx2IO8PjgJdK62ITUiMskciZlJi1G31vUqP2HMso4/f2Y4BPwZ/r0esNiIkL3/dk4BSMJKGsnmKL5d2D5KVxWbZhTXMk32kzK3tYXUpv7R6UP3a7whgmMVqkMq02wj1vxi8PN+Dc3tUe75JQC2+5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 14:58:41 +0000
Received: from DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4]) by DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4%4]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 14:58:40 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Topic: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Index: AQHai64R2830e6F6tEehZUoBI5is2bFizyuAgABQT4CAAAl84A==
Date: Thu, 11 Apr 2024 14:58:40 +0000
Message-ID: 
 <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
References: <20240411011745.574202-1-joe.slater@windriver.com>
 <20240411011745.574202-2-joe.slater@windriver.com>
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
 <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
In-Reply-To: <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7287:EE_|PH8PR11MB7093:EE_
x-ms-office365-filtering-correlation-id: edda742c-94c2-4982-e5d8-08dc5a37dfef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2cTkFbKNUwFeE7PbHS5FcY52VLPdc7HFn4VGn2vllfVaQmJjobzLMoOPKNZf7fa/MS+myQUc9Ljeuol3zsWXoTGbi/w30UCrfe3u4UKa0KA6cvZ8Me5ACJxUgMpL1foxKyi3cK+Fa72imqMoVshQ2LFa482GTGXuvS7tH/6OS09i7Jl4JbBw4TZQ6JQ58tHWeZ0J/vHoKdoEFIPOhFsqnT7jDEK6QkJ8UzWKJrz2EyUvpjw+cbN508pdy3JrhRRNn+CfE9EcJ7eg3JbDBe2RnNqP60vZEyAQnoW4ZeYtiByYicABDp8wlqYzWkj7KvzhwEeVCLukV46t2iY6m20vHlXOP2xqk2IPkbxwoGWgswQ0fuRbNy0g1bLp1821tfolcOgEqn7tMUnH4vCZqR4IrOrjAOCIBGvyE7tZcJg8fjVbRrNxLrKTp41Z2RC3uJnh7YTfD8dwm9jBUVQf4a/x7CaulyJmgAZukFgWTGnqy6opZ76ZTE4zuO1qSnUNdWAyKlpvHhnb2SDVB751IS/dO0jHblGmZ96D2u0fI5pteJUjo2nq37yxG9nFm5wqrIkeut4BNKuaoIif79gNIU9cPB/WvEpiLIgSEsDMhpt8RRoomZ1jTseXZXOnenCgGfJR5q5qkk6MtnjCNbPFQ9Sv63g7mjKxzcsEVuI9dB01W0HHycpNk+PjCMpf62W6Dn4f7fCp2i0KWZaBZEK0v6mYqw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2KKNgCB0umTSqm+7ce2ioNJumwasuyqkkn25JBS42Tw2suQ/xURIR1KPndYF?=
 =?us-ascii?Q?VlPNkD7tvNP9UwHRyuxXWp+SMAzajbYtBKI7ENjYoJC5jWI6tNHcATCR1t8I?=
 =?us-ascii?Q?FpR3kizNqCZZVgcJOYQnpRqcruWiW9xLjx4kkuCiMrRe+IcuEUQxLpoauJMi?=
 =?us-ascii?Q?8RzkCoo4TwinlAkfobvqik3yC5sl+98g/58OsTyfpxs7tDXJCUdnYKLCiOAo?=
 =?us-ascii?Q?CQlzFLHqaE8eKO2LhgStrICDG8phrDCs8C8xh/1BH7q+SRsunTzV9aK2/Ldu?=
 =?us-ascii?Q?DPQVoKahKAsFoD6M319DnoCq9KYOkD23qSR14KlYyrFgSx4jU6IbAuCBrd8D?=
 =?us-ascii?Q?rWgV0y7Phvtc43pUWZtDuAgL5lU/YGCnXEptsjwC/8bW5x6k9MKwCrJt9XF7?=
 =?us-ascii?Q?qq0oitEA1HWMJyR1H455wmckrPyePS2JQaFndNqbRoTca2W7Ldvx7n3NPhvl?=
 =?us-ascii?Q?idSuXXVuLxwYCBarEJI8jyCLmZmekbuDCtsgf99nSP87ezaTS4ugPT2aU92E?=
 =?us-ascii?Q?B1BRK7KqFBOfp0NK/raXSxpDnGkOnq1hhhBbHHZ3+cBfeEdjxzIuBxXZ9S6W?=
 =?us-ascii?Q?gDaPUGN0kC9ls7VIe/IOq5ER/SrTZrD1pfsfWVanoUdsZUhj+Gf7uj699YLY?=
 =?us-ascii?Q?StXWxi9owR6I7bus5zD6SHQ05r5U05syGGumE21E+qyuXvoL5I1F0R5AK61w?=
 =?us-ascii?Q?OF9OaQq+RCt/LqxRrcF6a38/fr18pf6+Y1oVSyeVui9ATKqknkfJ151vZ2ZP?=
 =?us-ascii?Q?w2SOHr17E1v9yxwoNcVi5Z7XzjLlGSNSCEu14j5Hh9LsW9fUym7dopzgFqws?=
 =?us-ascii?Q?fO6pHsCXqE0fO+hyOvsdKy2LM1ctCYEI3IQ7uuyMu9jdTgId7fWVhBhokm0Q?=
 =?us-ascii?Q?pzpDk5SJlAR8SU2wcj5Gau/WHZkvIcycrXdJjXvwc+Tfq7XgZMRdKM3BX6NM?=
 =?us-ascii?Q?ekIqdJowjDNH1+o1PqjcU8v/HIOEG1Q9pX9MC5XjposwR9ncCTMrm+u1tglA?=
 =?us-ascii?Q?JB+cnuaBPNDUV8icurZK2zF5LDGCJckYPivB4PKOurcQsokfB7ZkkW9szWNO?=
 =?us-ascii?Q?GAhvSm5YtIKvvqDzwDuLUG9aLkg3njuDHus313+RZH2F394AUhieGbld/mMs?=
 =?us-ascii?Q?9AUru1NE8BXg6UjTJFgEw7173Sgp4mkcz7o9YUrVYTGlrNFN1j2qIitJcom4?=
 =?us-ascii?Q?86CX7GaVC8rx1X8zzVWRfVpqF1Bi11V5blnKm2OG1eBeJ9UeZeqLDGuOqQEK?=
 =?us-ascii?Q?BMjclDOpQwvvinlphg1doJt3nUiKelbyKHJrO2bBBGnk4IqLJSEOMhwIE/Nr?=
 =?us-ascii?Q?SaNIv01mUNgjkfMXqUSeBXEQElq2sVzP6fKX2YyhpgRFhGX/0JZDOMg7xWRc?=
 =?us-ascii?Q?RvXBUkOg8kkm1OZqpvHGh3ws7WCWSnpL2Y5c+lNIvwkqYILhL9mTCntJc+dE?=
 =?us-ascii?Q?Kvf2kAp1wfdZTGrCvrA2tqp7/b8dxIRiBpw+fOtStWHFqZSyTQYVHIMrP7B9?=
 =?us-ascii?Q?79yWlmxeLtvkpYhGCI0VYMjT0Nh7sl85sQgU/qgV2VxV0cmPGgpIf2VFiS/F?=
 =?us-ascii?Q?f90U0G0Ph2LqKT/rmgqnwiR/JiSeJvzg39+lvGpn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edda742c-94c2-4982-e5d8-08dc5a37dfef
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 14:58:40.5956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qdq7LPBe7rxWZ8UjYvBTA31aYON94UjKsu9ATHN2WKkOj/Y7z0T8iJ8baMd96Y0WviET/sLyHhG93gJEUEpiUxybfYZP7Kqx4aLuoaAnBls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-Proofpoint-GUID: r-tPBtVuSdobjApt7FiE6dEGSdOGIVgm
X-Proofpoint-ORIG-GUID: eeEa54-NyhkZWUlr_rpeZqAeUkw5ughH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=984
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198136



> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Thursday, April 11, 2024 7:21 AM
> To: Richard Purdie <richard.purdie@linuxfoundation.org>; Slater, Joseph
> <joe.slater@windriver.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend
> ifupdown
>=20
> On 11 Apr 2024, at 10:33, Richard Purdie via lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >> --- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interf=
aces
> >> +++ /dev/null
> >> @@ -1,5 +0,0 @@
> >> -# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8=
)
> >> -
> >> -# The loopback interface
> >> -auto lo
> >> -iface lo inet loopback
> >
> > Is this patch meant to touch ifupdown as well as the packagegroup?
>=20
> I suspect not, given that runqemu manually brings up network devices and =
the
> last thing we want is DHCP running again.
>=20
> Joe, please remove this chunk.

This was accidental since I removed the qemuall/interfaces in order to use =
the main one with qemu.  I'm sending new patches.  Maybe, though, we don't =
really need the qemuall stuff.

Joe
>=20
> Ross

