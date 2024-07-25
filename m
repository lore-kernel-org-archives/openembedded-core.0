Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B7CC3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 14:22:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37362.1721917331074800152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 07:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7936bbca83=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8E7iQ002247
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 07:22:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca3gmyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 07:22:10 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46PEM99D031855
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 07:22:09 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca3gmyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 07:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS20BhR9B7ldjwMQNCml3Pejfb/JOCM+DwqL7jcMaXj/JgfKgk+HrYGA545TE5uT+GsMfCiP4xefvUv04UIrmhsFZ8+3sJ0RVdYhw9zll5tqUPYbb1ZNPkbHoxvjImNW1KliiuOu+VG+CkmZ7VA/r5OAXfy7kVqa1BAiJ1tYi471gCgNM4jOqdvhjcV6PSEMD61yo/Qd2HaZ7KNT7vtpm9TbFtfBb+8McN/UD75+gJmY004LYyhIPSk+x095Ybt2aMAAm+nbc6hVPo9sC8iFHYswtHBfyCA97ocouKye3jzY38OthWEUlO5YCj2oGK2TKChDSiSXOVUpHCrcW/f0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJxyW3m8LXw9r0PQ/U06TQEKTY0DhYQ+AwuoOVBq7g8=;
 b=rE595P2d9nLJhohrY33lBmWiE/WCdMst4CZyw5HTBpb8+R+7lTef7ivcjdxobDPBWfsDCEKK0rEU04iNDRQYxlRGsrpXoDj/UgOFoJ6EnA2vLoMs2Dp1bWid4jjIeYQ3chJ76tIctwudT2IUd+HNHbAvyU6BvfZ9PV/g9ADPEE6/IItEezk2AxfybFyNeI/543AZgfWFXcgmr4AN9MBazp17JCYnB+HqP6uQkt5S+S99us9s8Uh21ObVAg0vn7SezLQTCUd47u4ZnbVYPtn9v/lU44H4ww0zmfUzksrHDspBpJqd9BlXFFmlnt6T21oHzaQuvIKbZPM8B9Vn5G5lgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 25 Jul
 2024 14:22:05 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 14:22:05 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: [RFC] core-image-sato:do_testsdk breaks for cargo build with rust
 v1.78 upgrade
Thread-Topic: [RFC] core-image-sato:do_testsdk breaks for cargo build with
 rust v1.78 upgrade
Thread-Index: AQHa3p2WIzEk/HvqzEWOssACQm1aGA==
Date: Thu, 25 Jul 2024 14:22:05 +0000
Message-ID: 
 <PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2@PH7PR11MB7593.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7593:EE_|SA0PR11MB4574:EE_
x-ms-office365-filtering-correlation-id: eee1f431-2bb8-460b-8965-08dcacb528d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ZHVY/fDOdEAE2a6Nbe3pZVk86egSG1ux6ld9eDIoQY0j0muoOB+tC3DNlG?=
 =?iso-8859-1?Q?UbKutlcisKwmqU6FFZipEyTvhAkLAT3bfrc1SdzVNZ8g0FvbHid3GyBX/Y?=
 =?iso-8859-1?Q?1O9V1xBv7Ys6wdVVz53wx+kTDPGD9KqzhddiPo+5hJJLthipJMoZ85T2ZJ?=
 =?iso-8859-1?Q?Q0rcY2olkTPCu1SPzwy8sHqQdD1mwUOxPotXSW4nWGce9lDQVzBTwoMqEV?=
 =?iso-8859-1?Q?h5nL0/8d1eex7IAB5nIC6R5LgT1Rv7wxL3/TGBaAOwCwyUaMCXT5n3LjTk?=
 =?iso-8859-1?Q?hkoKU3xKfz2k+AkgEqM5Nq/WVAhAStvaKZMEI/jQWDg3nO+RfY9SH95VJR?=
 =?iso-8859-1?Q?3yxeB4opITm/Z3wTmiDE3ILdcjQmRiajMSHtOdqd8fYOUXK98LbayoNtIw?=
 =?iso-8859-1?Q?UADd13or0N0pmT+3GAzAqLRESEaBcPGgXxuye4lT/hTephrq98lWyYqScB?=
 =?iso-8859-1?Q?K1e+XFyeeXC1C74GZ0JnwgMbd2YNJBU+VG8s+T5CZveXbwngUDOh/eA3Sb?=
 =?iso-8859-1?Q?JoO8iSNfvOzE4aey2zk2nvmT6s1bh9KTrLRW01KFhIBnFiEF79ATqD/U0b?=
 =?iso-8859-1?Q?SzUjDxWUE/z6PZ/+K3ZtlM7ornj1dQTJenFJFnOfJAGv2iYOgovyd6ml2J?=
 =?iso-8859-1?Q?unRmXEBBxotEOnRHo15kWtLPaUKCg+U9KVG9iorvWjdrt7bnZymYb7jJeY?=
 =?iso-8859-1?Q?2SvvwgcNyamutsRZQQEF4WAQZlD+ecMcJjjTg12tJRXBXh/SV+5fHxGUgj?=
 =?iso-8859-1?Q?H/5rky173IruzJW0JLJufUp3r0hUDqDC6l8qr6LHV/Gs+aUegqpZt8wa1g?=
 =?iso-8859-1?Q?43RMVAqv6aVC41b/X0/5bzvnKiLsfsjnNxVMrPT8YWmGiWmVqCrsdbtEyv?=
 =?iso-8859-1?Q?yuuobRHw2cR658aa1vzYB0fx0hnu9TUMs1OVkLRY97rHLvg7o+j9b454gn?=
 =?iso-8859-1?Q?lOdOEIlcYLDGat6WtaCOQdijeV6VY2DooEu3aad4VvtqJ3xh4Yjhx3gUd0?=
 =?iso-8859-1?Q?eJz4XNlMptsDQFL2yRF+8sX8kimd95718MFLtYvfYuhPbrqqWenowLxswp?=
 =?iso-8859-1?Q?wAJoLDqXJ+TxOa0wROEUTf1djNCHFL9CGeXAP4aH6xrnaqCW4CJvUMboAT?=
 =?iso-8859-1?Q?Usx7wLHuTYL8j6ioBv/sQNuWV/LYKu+vrNJT2VmE538ArkbFlZEzDTqbi+?=
 =?iso-8859-1?Q?zJPc0JQmnS4E5Y/DlwYpC7legaFyOMgNfcAzsm/dObPsLCcRKsrhtlYHkM?=
 =?iso-8859-1?Q?W2Z6XBjPQ0j0mpjd6C6CHLJxyYUEs7MgWN6MDA+qVXH9UM/HiUTS1h+JH/?=
 =?iso-8859-1?Q?qwYYkp1XNt2n1cUM63PNmZJLgzirnZxfepp4Ey+yPeNEXiyNwqS5FusF29?=
 =?iso-8859-1?Q?BF65BKImhcJWbkSzJsXAoADZJs+VehK8CDMVB9IpuacO4YMx0ZrHE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?56V8faLXi5F+7hh8Lk80gzmLGO9YLUUrlXkX8U/JRKxptPQ3yG4vKMqWhT?=
 =?iso-8859-1?Q?eBteorYGNl8cOyi/BDzFjgcR8IhK4xFNsBbDPzsRBvUciRzSuwVeSvCIvF?=
 =?iso-8859-1?Q?IOERdCS56W+bRjNx1sm2tlhXyA4pSdVOqnCUnSMnp6XX+LCiU838CzKoKn?=
 =?iso-8859-1?Q?hjB6bKmU7r+yKZZq4py5qj1LiuQE5jR43bxZ8Ja/kPr59OO21ddmi8FvKG?=
 =?iso-8859-1?Q?WKGgEs3rNRHT52DCtPiMeqge5DWoZ1rqdeSxCZrJZqh8hYScrRZcJ0X/z/?=
 =?iso-8859-1?Q?CLRfqkxu1Os/p4E4HH4hU2QgtDWdDz4KmELAMhYygx4Skyclb9O8hRdugM?=
 =?iso-8859-1?Q?gdS6Jiu4RxBsrRKo554mnswqWuK0Hn6qrmePuNRC57BRmMQtFxjlXkdke5?=
 =?iso-8859-1?Q?eeE7/2H8tj5grcmRiHc+GrZu79FL38lSB7uAr6JbiGoF0xQskG89bcaech?=
 =?iso-8859-1?Q?AR1MI43jivO6SvRMqZRUQ8UAyFcMzWY4CgFWUasJ8olHnau6/Ks1D3Uxaf?=
 =?iso-8859-1?Q?twLyj6/ToGbvGm6J6Ffr7jjb8q8DPquXWU4yX9+UiV0+zNy5EuWPEDbjpB?=
 =?iso-8859-1?Q?bORHtfof030sp23oHvmsAqZqhywsRtYkQN/LwrYLrgVqyOcRXma+DXKP0X?=
 =?iso-8859-1?Q?1QR+rWcjoBskNpGB5MUNxgAiQwjI5D7e0CZxj/X9eib4G+68IzG/BG8v3z?=
 =?iso-8859-1?Q?I2yJyinCY0SU7hGM+3aA1uOq9kuJtPj5c5e7laOLckA+Lq9yskaF5QCYiU?=
 =?iso-8859-1?Q?gnexd6MV/zDhkjr96iND0zMVEjyLl1gbUSaz66OQKnQDhKdvO8QzU2sJIG?=
 =?iso-8859-1?Q?qNaPya2Pq6ElAqANaAHttiG5grqCqB9uLbwmfZc4U0UifYlOMJDA9W90w+?=
 =?iso-8859-1?Q?UfTxSe8sUt03DzPEopbQ+azntDljJS2JVE5PPCFwlri8hgsGjcwqeZekrE?=
 =?iso-8859-1?Q?cA+LMK/n7gmDicNv0Oh/De+3sTndO9Z1Cd1z6DreTmJ8dUTPij4/7sgHhU?=
 =?iso-8859-1?Q?RHT7ApsI8877UsuLLOD70nAR59jSlY0nPfFs2Pvwfdib/Aq/dT+9skaE/L?=
 =?iso-8859-1?Q?dp1HDqk2XTquho6nMKOPjFFe+ZhoYe8/0aa/OJI4E+aph68D2rKn/XJorW?=
 =?iso-8859-1?Q?wkdjrFX+wNUcCTSailhg/jMtsCGSWNn5BfvPpUiSC6AZAiPgF7Qk4Ja1sx?=
 =?iso-8859-1?Q?VEdHy8VP1HFtmo82EmQErJ3iggPPdg4Kqc8MFeHw1O364UnAYeWLXw38Bo?=
 =?iso-8859-1?Q?GFUp304fe4Yxt9YlnpB/LxmTbDC6RfgrzMbu/JDshHiVsOcZopyAemY7B0?=
 =?iso-8859-1?Q?UK6sUpFp2c11emjeVYzniboA7Mpd1t/zWx30wXQKOoMixeGGhh7PUrHV4v?=
 =?iso-8859-1?Q?rXED2oDzJIocPpvN8iBBYCLwXgM60HZZstJvRyhtX5nR7lVZ7HgttPyoii?=
 =?iso-8859-1?Q?1IcK7f+Ba46YqGlsrLqiUaQ2UGW0eEpgJal8oAo/05fwzT0hIbV0B/JFnW?=
 =?iso-8859-1?Q?t7IihKkir4kxG17ihS6tI36hudLQ2CanLQ8xgJ4dgtrwiKasjH828skehh?=
 =?iso-8859-1?Q?WBbJLCyOnYFveZUwfP0oCFD6XaCXRFSXa+inq3Nmm71KiJBcIqL0Yy9aAL?=
 =?iso-8859-1?Q?gt4qiybVXLFfsGuGoH5mk2c9qtzwA9enWn?=
Content-Type: multipart/related;
	boundary="_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee1f431-2bb8-460b-8965-08dcacb528d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 14:22:05.3355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGs8gSCnw/+dyZ6cQcUGC4e93bcyMvl2HlBRDXE3MZXZCHGc1Gwfzif6rLLPJ7+Jlt0F2vljjAFhCRFc50UruX9Om0r7Bbl74zVQWwO4RuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-Proofpoint-GUID: RgYqYMwhEpwzDLxQMOVb1v6oOxr9P18F
X-Proofpoint-ORIG-GUID: lT8MWhgEqhunHYqJWjk2ZVnWwYATEGEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_13,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=861 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407250098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 14:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202504

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_"

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am analyzing the following failure and adding my observations here for an=
y help/suggestions.


https://lists.openembedded.org/g/openembedded-core/message/201312.

Traceback (most recent call last):
File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/sdk/ca=
ses/rust.py", line 34, in test_cargo_build
self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/sdk/ca=
se.py", line 15, in _run
return subprocess.check_output(". %s > /dev/null; %s;" % \
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/lib/python3.11/subprocess.py", line 466, in check_output
return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/lib/python3.11/subprocess.py", line 571, in run
raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokyb=
uild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-lin=
ux/core-image-sato/1.0/testimage-sdk/environment-setup-cor
e2-64-poky-linux > /dev/null; cd /home/pokybuild/yocto-worker/genericx86-64=
/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimag=
e-sdk//hello; cargo build;' returned non-zero exit status
101
Standard Output: warning: `/home/pokybuild/yocto-worker/genericx86-64/build=
/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/=
sysroots/core2-64-poky-linux/home/cargo/config` is depreca
ted in favor of `config.toml`
note: if you need to support cargo 1.38 or earlier, you can symlink `config=
` to `config.toml`
Compiling hello v0.1.0 (/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/hel=
lo)
error: rustc interrupted by SIGSEGV, printing backtrace
All the failures are similar and fail for rust sdktest with cmd : 'bitbake =
core-image-sato -c do_testsdk'.
It's understood that the "cargo build" cmd fails with a segmentation fault =
when the cargo binary generated from sdk environment is used.
Manually reproducing the issue in verbose mode after invoking the sdk env s=
cript:
$ /home/pokybuild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/=
testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/cargo build -v
error: process didn't exit successfully: `rustc -vV` (exit status: 127)

--- stderr
rustc: symbol lookup error: /home/pokybuild/build/tmp/work/qemux86_64-poky-=
linux/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/b=
in/../../lib/libc.so.6: undefined symbol: __tunable_is_initialized, version=
 GLIBC_PRIVATE



It seems that the shared objects are unable to find the definition for "__t=
unable_is_initialized", but it can be found in,
build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdksysro=
ots/core2-64-poky-linux/usr/src/debug/glibc/2.39+git/elf/dl-tunables.c, as =
follows:
https://github.com/bminor/glibc/blame/431c1be28e443d0d691cec12d634ac60dd663=
0c8/elf/dl-tunables.c#L153 (Added in glibc 2.39)
bool
__tunable_is_initialized (tunable_id_t id)
{
return tunable_list[id].initialized;
}
I am not sure why the shared objects are unable to find the definition for =
the given symbol.
Also, when compared the readelf dump on rustc binaries for v1.77(where buil=
d works) and v1.78, found the following differences in glibc version symbol=
s order. I am not sure if this is causing the issue or not.


In rust v1.77, readelf glibc version section:

[cid:caf899b7-ba74-4e9d-9250-144a888f98bc]


In rust v1.78, readelf glibc version section:

[cid:2245b86b-c72a-46ce-8408-50feac5bccb6]


Regards,
Yash

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
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
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I am analyzing the following failure and adding my observations here for an=
y help/suggestions.
<br>
<br>
</div>
<pre><pre><div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFon=
tService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);"><a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/201312" id=3D"OWA5dcbbb58-27d6-b157-6a45-c1ace39d97c5" class=3D"moz-txt-li=
nk-freetext OWAAutoLink">https://lists.openembedded.org/g/openembedded-core=
/message/201312</a>.</div></pre></pre>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>Traceback (most recent call last):</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>File &quot;/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeq=
a/sdk/cases/rust.py&quot;, line 34, in test_cargo_build</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>File &quot;/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeq=
a/sdk/case.py&quot;, line 15, in _run</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>return subprocess.check_output(&quot;. %s &gt; /dev/null; %s;&quot; % \<=
/i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>File &quot;/usr/lib/python3.11/subprocess.py&quot;, line 466, in check_o=
utput</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,</=
i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>File &quot;/usr/lib/python3.11/subprocess.py&quot;, line 571, in run</i>=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>raise CalledProcessError(retcode, process.args,</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/po=
kybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-=
linux/core-image-sato/1.0/testimage-sdk/environment-setup-cor</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>e2-64-poky-linux &gt; /dev/null; cd /home/pokybuild/yocto-worker/generic=
x86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/te=
stimage-sdk//hello; cargo build;' returned non-zero exit status</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>101</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>Standard Output: warning: `/home/pokybuild/yocto-worker/genericx86-64/bu=
ild/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-s=
dk/sysroots/core2-64-poky-linux/home/cargo/config` is depreca</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>ted in favor of `config.toml`</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>note: if you need to support cargo 1.38 or earlier, you can symlink `con=
fig` to `config.toml`</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>Compiling hello v0.1.0 (/home/pokybuild/yocto-worker/genericx86-64/build=
/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/=
hello)</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>error: rustc interrupted by SIGSEGV, printing backtrace</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
All the failures are similar and fail for rust sdktest with cmd : 'bitbake =
core-image-sato -c do_testsdk'.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
It's understood that the &quot;cargo build&quot; cmd fails with a segmentat=
ion fault when the cargo binary generated from sdk environment is used.</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Manually reproducing the issue in verbose mode after invoking the sdk env s=
cript:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>$ /home/pokybuild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1=
.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/cargo build -v</i></=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>error: process didn't exit successfully: `rustc -vV` (exit status: 127)<=
/i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i><br>
--- stderr</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>rustc: symbol lookup error: /home/pokybuild/build/tmp/work/qemux86_64-po=
ky-linux/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/us=
r/bin/../../lib/libc.so.6: undefined symbol: __tunable_is_initialized, vers=
ion GLIBC_PRIVATE</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
<br>
<br>
It seems that the shared objects are unable to find the definition for <b>&=
quot;__tunable_is_initialized&quot;</b>, but it can be found in,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdksysro=
ots/core2-64-poky-linux/usr/src/debug/glibc/2.39+git/elf/dl-tunables.c, as =
follows:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://github.com/bminor/glibc/blame/431c1be28e443d0d691cec12d6=
34ac60dd6630c8/elf/dl-tunables.c#L153" id=3D"OWAb2b1f373-1706-8718-5a07-284=
ba0f46737" class=3D"moz-txt-link-freetext OWAAutoLink">https://github.com/b=
minor/glibc/blame/431c1be28e443d0d691cec12d634ac60dd6630c8/elf/dl-tunables.=
c#L153</a>
 (Added in glibc 2.39)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>bool</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>__tunable_is_initialized (tunable_id_t id)</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>{</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>return tunable_list[id].initialized;</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>}</i></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I am not sure why the shared objects are unable to find the definition for =
the given symbol.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Also, when compared the readelf dump on rustc binaries for v1.77(where buil=
d works) and v1.78, found the following differences in glibc version symbol=
s order. I am not sure if this is causing the issue or not.
<br>
<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
In rust v1.77, readelf glibc version section:&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
<img id=3D"image_0" size=3D"14787" contenttype=3D"image/png" style=3D"max-w=
idth: 1211px;" data-outlook-trace=3D"F:2|T:2" src=3D"cid:caf899b7-ba74-4e9d=
-9250-144a888f98bc"><br>
<br>
<br>
In rust v1.78, readelf glibc version section:&nbsp;<br>
<br>
<img id=3D"image_1" size=3D"23947" contenttype=3D"image/png" style=3D"max-w=
idth: 1211px;" data-outlook-trace=3D"F:2|T:2" src=3D"cid:2245b86b-c72a-46ce=
-8408-50feac5bccb6"><br>
<br>
<br>
Regards,<br>
Yash</div>
<div id=3D"Signature"></div>
</body>
</html>

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_--

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=14787;
	creation-date="Thu, 25 Jul 2024 14:18:58 GMT";
	modification-date="Thu, 25 Jul 2024 14:18:58 GMT"
Content-ID: <caf899b7-ba74-4e9d-9250-144a888f98bc>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAwoAAABfCAYAAABIkzD4AAAgAElEQVR4Xu19DbyVRbX32udwDnhA
kBLEggS6Zm9etAjFLhV9WCApRb5hJN7fi3mRe1XQlMwLCH7w+vpDE1QMDeV6BS3IMCSuhDcJwhQI
I+oCqSAeKj4k4usA58DZ7/o/58xm9px5nmeevZ/9vZ77u8nZe/bMmv+smWf9Z601kxg3blxyxYoV
JI8gIAgIAoKAICAICAKCgCAgCAgCCoGEEAVRBkFAEBAEBAFBQBAQBAQBQUAQMBEoSqIwbdo0uvzy
y2nevHk0e/bsNJkXL15MnTp1okmTJtHatWsLMqKQb8SIEfT666/T2LFjCyJDPht94oknqE+fPllh
fvHFF9P06dOpe/fuKdExlsCyXB7g1K1bN083gp5i0h/MM8ylXbt2hcpdLuNUqH7ka9xLcUxd547L
2OULZxdZiq2M4FxsIyLyCALFj0AaUVgwvSOd1zuRknr1G810ywMNab245IIauv+mWupY11Ju6ztJ
unrSkTY9fei2OvrMJ6po194kjX/wOG2rP+GMhjIqt2/fnmaI+33uXHFMBbHYDhw4kLZt21YRxlUc
REGHXhkyy5cvr0iiUEz6U4pGZUzTOO/V5GvcS3FM4zRg84VzmAIpwqLK7dmzJ6vNlrD2XL4vR5xd
+i1lBAFBIHMEPKLw9pZX6OFb29MBtveV0a8IwYatyRRZMD/r26tdm9+pz3p0ayESmRAF/M5mnN5w
ww00evRomj9/fhtPQ+YQyC/DEBCiEIZQy/fwkOAJ8yi41ZafUsqo3LRpU0V4x/KDamFbKcUxLcW5
EzTKeFeNGTOGli5dmtoMiXsdzUTLShFnheX+/fsLTrQywVx+IwiUOgKBoUfwCpzbM5HyCJh/o/Oj
hnagcVdW05znT9JzLx1Lw8NW3hUwLA4jR46kGTNmeIstHuzQDBo0KG2xUC/Furo6r0xTU1ObkCUs
jnv37qUlS5Z4v1VldY+Auftj1qN2qXT5baEzalGrqanxipq7SGpH58knn0yTJZMwpiCZbS8qJbsK
33rxxRfpiiuuoM2bN9PgwYOpoaGBnnnmGbrmmms8jFT/1Atuw4YNNHToUF+cw/qu2g/zKISNhasO
udTjoj9oD1j07ds31bTSHVtIlS6fGtdi1B/IGYeXzhx31X/oE8LNhg8f7oVk+em8nwy2NSCqcWbq
vApZdBn3Ul034hjTIJ1XmIbN97C1znXuqLVfJ+BKt9S7wWV+hcmj+uWyboStQahjyJAhnv4rGaPq
s7le+r3jwvoVBecwnXfBGXK7zC9XnFWbtnd72DjI94KAIJA9AqFEoXvXhOdlUJ6CN3ee8jCgefX5
y+uSNHNBephSNkTBZkyqRUzlBdiMYVt+A35XW1vr5TboxEN/MZg5EUGLup+hqxY+nUCYORVY9Pr1
60eNjY0pWYJyMvyG2PYbU2bbDhZknzhxIi1cuJB27NiRik+/7777vJcaMFLGncpLuO6669qEWqHu
/v37p0iZS99diIJLv1zU3qUeF/1RL1m0qefFmLqoDCv8N8yjUAz6o2OIvmzcuDGjMDATQ1vfwnR+
3bp1ns6ZoYaZGFa20Apd55Hz5DLuajxLdd3IZkxddN5lvoeNu55/FrTTbTO6g3LV/OaXizwu64bL
+oMyqj1FFjLJr3PRVZd+6YQ5aI0Ke1fqfffD2UXmKDiLR8FV46ScIJAbBHyJggozWryyhQDohGD3
vmYaP6qatu0kmjLnuBd+ZBIIiJsNUTANL/NlH2SYmUYc/u7Ro0fa7o4Op+1FFAS3bYFUL9fDhw+n
GYpmWT/jHUZolJh9F5ltmOntI7FYkQa8tHXc9PqxI2wmM+u7lnPnzvWwDeu7K1Ewd+IyUX0XfPyM
Ex0H82UfJIurW78Y9CcTTG2/sXn5TGM9TOeXLVsWG1GwhSea7buMu1pfym3dcBn3MJ3PxVrnOneU
/EFhqEFEwVzHzLIu64YLhoooIJdNPZnsiLvoatj8Qp+iEIUgnXchCi4yx4mz63hIOUFAEMgMAV+i
gMRmPCpnQScKr21q8hKaD3FOw71PNdLka2tzQhR0I+Siiy5KC0UKc6fqYUUuLyE9tCQs6cz2IgoK
p9Hbj7Kohw2pi8y60aYwW7Nmjbd7bBKJKERBJ2oqpMRGdGzYh4UeufQrDBslnwoXMsfUVX9cdMf1
JRxElAqhPy4YhpUxdwZtYS9hOh8nUTDbN3Xeddx1/Q7yEEXR1WJZN8LGNEznc6GrYW1CZtdQlWyI
Qti6EYad+t70uKrwGd3bHFaXq66Gza+oRAFyhXlFUSZow0M/3U7vp/le9lufw7CR7wUBQSB/CFiJ
AkhCF+YJ5mlF+HzP/vyEHqmFSO14X3jhhWlHT0aJw3V5CSnI9cXZjIMtVkMvSGadDEB+Pe8jG6Kg
7yrGTRSijIXLVLHhA+JgC3cx64uiO65lS8VgdMEWZcy4ZVteTtBObpxEQRmUyis1YMCAtFhxWTfC
RzVMj/NNFGyhJzZvadD6rPQ0zKOgo+PyLrChaZLTMLn8RsRVV4uRKJhhhEFalynO4ZosJQQBQSAO
BNoQBT+SgMbymcysOqdibUEUzDhq15jPsBefDcigl2Gxho4E7aShj0goRVK3yvHIhijobSlDL47Q
o6hjEWUSmPi46E9YGIbevqueFav++GEZFCOM74YNG0Z33XWX770mLoaMDTu/8ISwmGUdX6wbus6j
jy7jrsrhvy67qy7GYKmMe5jO5zv0yM8rqYdN6rqbrUfBnAdhHlCzvB9RcDX8zTUl7N4gl/mlv0+D
dNp1DUMdfri4zi9XnMPme5R3gJQVBASB6AikiIIKLUIVfvceuByPqouQbY4C6lKLIP49a9as1AkS
+FstIPX19Wkv86effpoWLVqUKhu2+Nm+V3XjpB/zUjW/BdI1wS/KrpbfkEaRWcmLk5j0S+yiEAXE
2uonM5kvA5e+q74EvTCj9CtI3V3qcdEfhR1IkJnMbBJX17jbYtCfKEtF0KkjthwFs24XQ8Y0TpU+
2bx6QfKotlWbSEZG4r6eOOsy7qinHNcNl3F30XmX+e4y7kqeoLljrjV+65mqKxui4LJuuGBoI1u2
BN6wulx0NS6cXXRel9cPZxeZo+DsMt/DcJTvBQFBIHME0u5RUHcfmNXNX9acOtEo7MI1ddGaTSTb
BW5hovstOqbRqcdE4rjPVatW0WOPPeYVC3rhw2jFb5Gwqyeeqd/p8Z1hLyKdvAQdj5otUchEZpdd
OZRRu69mMrPyRiiMbHkcYccl6mNtlkXsKk5eijoWNv2Jgo8tDtjUH6UL5vGotpOC9Jh1/M52KV/Q
DmUYhlGMgrC55fp90I5eUBy1fjRsmM6b9QA3hLRNmDDBd4Mg6Fz1sF1Il3Evt3XDdbxVOZsu6zof
t676zR1zrEAeQfxGjRpF8GbqJBCyZ0oUUFcc649OfnRvVCbJzKgrTFejrglBa1QYOXYhCmEyr1+/
PhLOYXM5ql5LeUFAEIiGQODxqNGqktLFikBU13mx9kPkKi4EgjxDrt6V4uqRSCMICAKCgCAgCAgC
OgJCFCpAHzKNGa0AaKSLWSDgRxTU56haD9fKoin5qSAgCAgCgoAgIAgUAAEhCgUAPR9NKi8CbvMM
O+41H/JIG+WJgF/oUSY3jZcnQtIrQUAQEAQEAUGgdBEQolC6YyeSCwKCgCAgCAgCgoAgIAgIAjlD
QIhCzqCVigUBQUAQEAQEAUFAEBAEBIHSRUCIQumOnUguCAgCgoAgIAgIAoKAICAI5AwBIQo5g1Yq
FgQEAUFAEBAEBAFBQBAQBEoXASEKpTt2IrkgIAgIAoKAICAICAKCgCCQMwSEKOQMWqlYEBAEBAFB
QBAQBPTLPCsdDZwUN3XqVOtlgZWOjfS/OBEoC6IQdnuzCT3Kjx49mubPn9/mVk9V1qVMcQ6pSCUI
FB8C+nG9kM52Y7U+98aMGUPqdnN8DkNDvyXdvBXYViYOFHDrLW4l12/YjaNeqaN0EQi6aNDWK+gt
9CeTI4PL4eJCdXP0Cy+84Pu+ddWGcngvQ3+GDRtGQ4YMCbRBXDGRcoJArhFIIwoLpnek83onUm2u
fqOZbnmgIU2GSy6ooftvqqWOdS3ltr6TpKsnHUkr41JPnB3DQtSvXz9qbGykGTNm0NKlSwOrd1ls
XMrE2QezriiGVZAcLvVImUmE+yb8DNh84gMZoM8DBw603n9hyqLG3rwrA4Z13759U6qRiZESl34r
o37Dhg00duxYUobW4cOH2xjgqn+bNm3yytoelzJxyZ4vouCiYy59cqknn2XKUZ+jEgU1n4PIsd/Y
5pMouK4tLnqoysQtf6Hfy1H6HlYW2AwaNEgupQwDSr4vOAIeUXh7yyv08K3t6QDb+8roV4Rgw9Zk
iiyYn/Xt1S7td+bf6J2tnjh7rRZtGCH9+/enNWvWpO082tpyWWxcyvj1QxlG+/fvz2gRMA2hIMPK
hSQoo8tWj0tbUmYS5QND8/Iy20V5GIuJEyfSwoULrbtzLmMc5/xzqQukBY++K6/mCEi96SkoJm+f
TXazzzLf7eSvXPU5KlFwmSNxEIU49DBobYnaD4WTyzvZte5s3suubeSrXD71KF99knbKE4HA0KOH
bqujc3smaPyDx2lb/Qky/wYko4Z2oHFXVtOc50/Scy8ds6Jk+11ccOqG06WXXtrGIMEHephCU1MT
vfrqq3TRRReluf1cyqg4yyVLlngEwG8XWu0goa158+ZFdrcqVy3aWLt2rdcnfYFct24dTZ8+nTp1
6uT9V3lQlItbhWmE1TN79mxv97pPnz5phMZcjKVMfvDR54QNc1MPMH6uj60+cwcxU311IavLly9P
IwQmoVG6a6tLeUNcyuD3Zjlbv4L67nfbtJLN9M7IfG+7Rpm6WS76DB1wMfCUTuj6bIbPKW/Vk08+
mfY+0fXLtiPvRwiy1cO4jXDUN3LkSCcvv98aEvRexm8QomhuNuBzYI33I96h1113nRc+GIRz2Lrh
t7Ght/Xiiy/SFVdcQZs3b6bBgwdTQ0MDPfPMM3TNNdd4toI5/qpN8Sq4vsWkXKEQCCUK3bsmPC+D
8ha8ufOUhwFCq89fXpekmQvSw5RUp0AUVD1xd1R336m4vyDjWS3yXbt2TRnxpoFtK6MWhNraWm8B
CgpxymZnx+8lZNud0RfD7t27e4uiMshc6lm2bJlHNLZv354W5qG3JWXyg4++qw5dCzKsMnn5miE0
thcfZIABnQm5DXrR+3kIdP21EWI/IhRk0Nj6YBosUfqea4+CyzxVulFK871c9dmVKOjzQZFSkyzb
QmZN/TWJQpDBms17R21CZLK2+M39bMP2XN7LfhsgumfEFWdz7TPXjbC2duzY4b2Dd+3aRffdd1/a
Zt7w4cPbbMjlAvO47SupTxAAAr5EQYUMLV7ZQgB0QrB7XzONH1VN23YSTZlz3As/MgmEgtesJ27Y
9Re5uSD7hezYdufNeGmbMYK2evTokbaLH3d/dCN979693o5JfX19auHRjXo9JAg7JnhUeIdLPXPn
zvX6AtewX1tSJj/4mPH4QUTBTPTFzpVOjk2dtBkqfgZw3KeTBBn1Lp4q2/wKIwpIEgzCI0rfXYhC
NmuAyzxVulFK871c9TluomB6c825qhOFc845x3sfqFyfbPTOb15FXVuCZMhmLXF5d2MjwRaKaa4r
Qd5URd5ccinC2sJmnU5Q9P771R8WShr3GEt9gkAmCPgSBSQk41E5CzpReG1Tk5fQfIhzGu59qpEm
X1vrSxTMejIR0u83YcTAbydHNzTULoC52+NHFHRjPM6+qLp0w2H9+vXeDgVIzKxZs2jChAltdv/V
rosZz+5Sj04C/NqSMi1EIdf4uBpW0GmMtdqBh96EEVjT2A0Lrckk6dJvLgQZ9bnwKCg8VCK337zA
S932mH3PJ1Eop/lervpcKKKgQliwW52rE7gyWVtyRRRc3t3K46h7LmyedxeiELZuqH4GtWUa/S5E
IRd5HLmwS6TOykbAShRg3HdhnqByExRE+HzPfvfQI7964oLcL2ZZ7bCiHT0cR7VbzERBLVjY4ddf
tn4LiopLte0q23Z0zHqkTDDO+cRHnxd+HgXb3PF7qSpdUrG6ily4xFjHNUf9ZHPdMbTJ4RpLrRMi
NT9AHGzhdn79zTVRKOf5Xo76XAiioIgBYt/hVQg6ESyueavqCVpbwtrKxqMQhSjoBjpkMsOnXImC
6o9t3VB5gEFtZUIUxKMQpkXyfTEg0IYoBBn3UZKZc00S1AsW//U7TcUvvt4WemTG6WfjUcg2VtQ1
JEOX0ZbI7VKPlMlPorILznEbVrYde9VG0HdxL0yFPvXINDqi9N2FKMh8zzyZOQrxLRZ9jkq0g3IU
XEKP9DsYcpmjEGUsXNYIlxwFv7njh7HfJgHawoMQXHOTLSpRCCNJfm1lQhTiSPh2GQspIwhkg0CK
KKjQIlRmehJUA2HHo6KcSz3ZCBw2ic2dSkxqHJuqEjTVoo3LnNRnLmX8iImtL9mePqHHIvudO28u
pOZvIJdLPVImP0efuuAcRhRsY6z0AL9Vp2TZPjP1VL2gkf+iE+2nn36aFi1aFHoXSZQ5rNpyuUfB
xVsQFs7kt3mg2o/Sd5fYZZnvwXdjYDyCjDV9h7wU9DnfRMHMuVHJuWYeTjZ66Lq2RJ33YcnRQTK7
vpf1d53+XleyuhCFoM0MMyfEZkMoGaLmKMhdClE0SsoWCoG0exR6dDt12Zou0PxlzakTjYIuXFMk
waWebDvst1iql5JODtRihO/UkWVXXXVV2ln0LmVcdhfRRrY7jPrCZzuCVS1UyF0wj1A1k91U2WK5
UEzkCT9W1zY3cGQijuXFg1wVPcZej6sPyz/Qj+izlUV4w6pVq+ixxx7Ldoqm/d5l3NXcyfQeBfQH
uOCEEVxYpz/m0YRR+o7f6pfXmXkMMt/tlxXqa6qpTKWsz0FzzJbfk61HwZacD53s1atX2gll2egh
ZAxbW6IuCC7x92Eyu7yXlVx+7+cwooDIA9d1I6itqB6FqIQzKv5SXhCIC4HA41HjakTqEQQEAUFA
EBAEBIHKQsDFIxcHItnkUkRtP662xJsQFXkpXygEhCgUCnlpVxAQBAQBQUAQKHMEohzMkCkUUfKO
Mm1D9yaYB0RErdMlxDJqnVJeEMgVAkIUcoWs1CsICAKCgCAgCAgC3hHOeOI82lUPZzSPQY4b8jjb
kpOO4h4dqS/XCBQlUfhS7ztz3W+pXxAQBAQBQaBCELh7++MV0lPppiAgCBQbAnf2ub7YRIokjxCF
SHBJYUFAEBAEBIFSQ0CIQqmNmMgrCJQPAkIUcjCW4lHIAahSpSAgCAgCFYqAEIUKHXjptiBQBAgI
UcjBIAhRyAGoUqUgIAgIAhWKgBCFCh146bYgUAQICFHIwSAIUcgBqFKlICAICAIVioAQhQodeOm2
IFAECAhRyMEgCFHIAagxVznx0S/Twb8do8fvXBVzzaVX3T/0604jb+xPv/1VPS1/9o+l14ESllj0
sHgHr5jmRS6Jwv5Ekv4z0UA9qYq+crI9dUhUxTIof06cpB8njtJ71OzV1y5JNDjRgQafrKF2Cfvl
qLaGjySb6WdVx2lPoplGNnegD1B1RvLFJQ8aR13zuW8XJdvRZ5vbR+pPRsJXwI9ypYcVAF3WXQzT
ZyEKWUPctgIhCjkANcYqr7/7s3RWz070+ss7nA1jGA3fumUAdX7/aSlJXl/xDi169LcxSuZeVZzy
oK5PDO5FH//0B2nVkredMXGXVkraEAjSQxCIs3qdnvrZmxv3pkitGvvdOw/7El3Ufe6F3do0e/xo
E/10zkb67codZCtzcN9Revah9fTWpj1pv/3GjZ+kgV/qnfrMr1w5jXQxzQudKDSw4byp6gQdoCQN
oBp6XzJzw/5gMklPVDfQEjpCY5On05Vs9J4WE1F4k5rozqpDtINOpNTi37iNq7iNmghtQMYHqg/T
W1zfPc2d6cPULiM1i0seNF5PJ2lm4jD9MdFE36PT6TPNtUxf3MlPRh0okh8x36O/8Ji+kThBbzFh
gv71Zz38aHN1xoQpSA+PMNFcwzivouP83+N0JiN9PdV5BK2WMX+XZVnIRLIXy/G1ZAdqb4zDUZ4v
L/D3GKsWynrqaZ9M0HD+xceSNfTzxDF6g3UM/cNTxcN5LhPBLybb09na6DZxfW/w/FuZaKTfsEx9
uMyXmQB/hglwR0e9PsE6/Q5jt5Fl2sH/7c6yX5xoTx9uroqkR1HHAu1urjpJ73A/0ee+PJegtWH6
XFZEYcH0jnRe71OTdfUbzXTLAw1pinHJBTV0/0211LGupdzWd5J09aQjaWXMenbtTdL4B4/TtvpT
C17QnI2bKHzyc+fQ18ddSO1Pq/Ga3V1/iGbc+Is0EeIqUyRrUUoMl35FkRkGDwxiZSxF+a0qq2T6
3a//XDCioMsdlzzA5n/1P8tqKGaCUzn9Jshwz6SffnqoSADqVAa7+mzzht2evrkQBSVTUFlFVHRi
gH6eVtcuTQfw2RlndkibM/gMj7kOBWERF4Zx1GOuK0puGwEqhnkBovAXNk6frTpGv6JjtI//fQ6/
5GE4/0OGhjOMhv+qPk7fp0N0fbITfZ2NLBhe+oMyu3gnv44/78oeh0xMYRgzq9nAuztxkP4Pt1Mo
oqD65SpPWN8xHg8wWTjAHpnJ3C8YjOX+gKQuZaP7h3SYjnC/9QckcKRFh8IwCdLDd5gEPFR1hNax
QQ4d7MO6/hZ/dpLN+Vu4vSvYw/QWG76TEgfok8lamtDcsY2xfpjpwUyuYxkdbSMKSMVk6kKXnKym
OdVH6XlKtxfxgwGJWvreydM9T9bfeC48yd63xVyuirt/bqKGdidP0t/581HUkb598jSqCyELIC4/
4Xn8Q9Yd3aLE/Jqc7EwD2YB3mWlRxwKj9XsmJvfyPNzNCH6POtMQJluK4Abpc1kQhbe3vEIP39qe
DrC9r4x+RQg2bGWFaiUL5md9e7Vr8zuQBDyqHlUGn7mShTiJgnqhvfunv3u7h+rFf7ThROolHVcZ
NYuGfOt8+sKVH6EjB44X1Gh06VfYIqR/bxpcfr+9+fuX0ub1f/XdWY/LMI8ie1BZV3nC+hXFAI1L
9mKvx2W+Re1DkB7CeP/QR84IJLJRxikqUcDc/+zwD6c8SzCSB3z+Q/TL5/+UsacpLgzjqgfjhTnz
1W/3ozX/tT20X1HwjqoLruUVUVjIBsaf2bz4PTXS+/gVnw1R2M47wtMSh3gntpq+w4bu+9g8MZ99
bGTdz2UGsrH01ZMdrDvGx9loQ7lOvCt6OocUmWTC1TA/xgbUPja4QFa6cl0qPEn3KNzVfDqdyfI2
sJXWhXeDOxomFdraz7KASMGw7MYYmeTHVZ6wvqOe9byrPI0Nr8u4tW8zPnF5Y1z1It/lGnmsf8I7
77t4F/wKNjJhPG/nf89io/cwf3c3j8+57F2I8vjpIQz82VUN9DM2yv+FOtFIxhc79vtZT1YwWbmE
DeoPMXHYwnocRBR0Wf6ntewA9iLc3Fzn6Q8eGO+PsWdtJROS6Wysf5RJ3y7WIXgqXkweocmJLl7I
HDwTM3k+DKPT6F+ZlLyff4/fvgyPBstyIcsURqYR5vMIo9Un0Y4uYwwhw6tVjfSD5GE6n4nHHYyh
bS6amEYdC6wb97Nnbn2y0dtaMIlCkD6XBVFYsWKFVS8fuq2Ozu2ZSBn45t/40aihHWjclcwmnz9J
z710zFrPzVfX0YjPJej2Rxrptd83hc6BOImCbdfPfJnHVUZ1TIUknDzRnJWBEApUSAGXfkVpA7gN
uqwP/ezJTV7ohd+DHct3tuzz9RaEGeaKaFW3a1mE/MI0zJ1R01NkhnvoYSO67GHyqLJh/UK5Ytg9
jTKmhSpr001XWfz00NUgdS0HebIlCpl4DlxxyAZDvY1M6jHX0DCZCz0v9NAjGM4P8gv/T62hOJl4
FLCLu5RJx6Ns4N3BO6qfbz61iwmDAbuV2G3dxwb5PWwI/xP/9Q3OXzjJ31UxGYDxrUI6/oPrOJQK
2GhBsiMb8dN4x/KfOGwDT5BHATkIP64+Rv/BxpPaYYW3BOTlk2x4HWaBEHq0mj0p+Bz9xgP5/o3L
DG8NN4Fh92zVUfppsoGaW621M5hw3MyhQV/g0CBFPIKIgmvflb6g3zOrDtNWlhxGMkI5yv2B7uBR
eCI0aCYb9GuTx+j/si6dz2Pm+gTp4VY26iezp+DsRDVNYs/ZWT4hdrkgChdwHyDbz1rnyJ08thcw
Wb6fNb2eDX0Q1o9EJEQ6JghwgkNGYXiA5wDm9A7WYegR9NzlcR0LFdr1MntVQGZ+wx4+kyigPT99
Lnui0L1rwvMOKM/AmztPeRgAjPr85XU84Re0dTuBSIwfVU2vbUr/XdAgxkUU/F7y+o7kG5yAith5
M145ahk91r4YPAoufY+aHwCDovP7OljDJXRjY8T1H/eIApKd9d1VNeZBhrky7vX8BTOcwxZegrr1
xFZbaIotLAS/C5InSr9QlyuZclnEyrlMkC6F9dvvt2rerX/l3cCQtlwRBXPHPko7YX22fZ8Nhnp9
mdQTVc+jls8Ej6DfxE0UYNzNShwh7LDew4YJQjrUA6NippcTcIJjz2vpl2yg92ZjrQfvsiImezzv
7oJYvFLVxIbhQfooG0zDeYd1IxvwS3j392P8m8vYjB/IxvkHWxOP/YgCDJ1f8G7s/VzPJzhG+584
fOQwW1AvsEFzFu+0TsLuKnsQQBRg5JzO5ICD49horOYY8eNerPXtTEg+y7u9SzmM6qHkIbqY276A
ZTrBZAEhIp24nmmtu8TgD0FEwaXvX+R+qdAQ3dCdzHIM5h3isB3luHWjUPWBKO5mD9BGjtd/nHfD
P86G9K3NnbxddtfHTw/1Mfo6vDW8+++HbJxEYQmTzK8nOnr5Dn9jPfw56xy8UlNYDxsQYsbE5aNs
aN/G/ezimI/gggXCfqazjtdwxyfDaxYBQxDS4ukAABl+SURBVNQfNBYgJc+zF+hxJvQ38Gxoz218
n/89kWeTHnqEevz0uWyJggozWryyhQDohGD3vmbP+N+2k2jKnONe+JFOIFTZHt0SFDU/AWDHTRQQ
mwyjFeFA7/31CC1+/HcpcvDfi7Z4/862TLGd/qMTHb++R5U56ISZzw7/CJ3WqcbDWPcE/Pw/W04B
0j0Qfoa5LTTCZsi7hJfYFhe/XdAgohClX0pW15AMlwWwHMu4enD8+u6nh+b4mgnrKqE5igEf5lEw
E571pGkz9C/OscwWQyVLpvWYXj/U5+exK4Z5ETdRwElE93KiMbGhjrho3TCBN2Elh0LM51hsxIjr
z6VspI9Knka92ZCay7v3L7EhdS///uNs4L8HY4d31/Hoxk6QYY6wk6kcyoFnKhtISFRWO7kP8f7m
VWy0XcUhJ49yWMgmDre6O9mF/rE1F2ADx1tP4ZTuT3Mi6Xg2JHmPlo6yMdeNZYOxjnp+6u0IH/K8
Jl9uTTgOksel7+cxSVFEAXW9yoRlGhOdsWyEjeCY+SgnOsU5p/JZFxKIp7D+IEEcz0Vsxn+HQ3Fc
d8KVrH56iByEX7AO3sfjO45zEb7BBGwvjy1C797jnACM73lMBkfw5/VVzbGFHtlyFL7KRGVssqOX
lP/vLM/nWd9uPFkXW5gZkqOfZ7L8KOv7ODbeo+bwBI1FM+P4Gw6Pm851D0mcRmNY7ldBzHlO2IiC
nz6XLVHwyzWA5+C1TU1eQvMhzmm496lGmnxtbRpR0Cec8iiAVJhJz34TMxdEYdsf3vMSmo9zbgKM
16/88/meF0EnCtmUiWp053pR0omCX7+iyuxyFKXyCIQZDRgLM5k5yGjRQziihHOY4Ue2cDAXY8ml
XxhT1zyOXI9/MdcfZfxs/QgiCiCqNo+C/ps4iQJO/9KTmVXYITxift7KOMYmWwyVDJnWgzlzgE94
0k93siVtq3YKPS/iJgrYCb6bDb2uHKOD3dEzLLujOK7yB+x1WMq78ggl+m6iM33+ZEsID3YpF/Dx
oAv4tKSpTBQGsaH4ZyYKd1Ud9E6l+S4bd135N3j8DHN8vpY9FHfyb74CY4wTQdXRrNs8Q/SgFwN/
48mO9CQnmpqnHoHE4FSlM5kY/DvaY/Pxj0w8nmV5V7Hxrj83ecZmixHvkqMQ1He9XtT1OzbEJjFR
uJqjzUdGPNEpjrlUiDr+zsbtqupG+gOPwSr2OB1k4vk56kC3MFnADrzr46eHMHD/m4nCvckDdF3i
dPomh729yzoLnVDk9VIOOYMH468xEoVfMPGFroDwwFu1kskpwnSuZhJ4cXM7b858inV9Ahvcricc
BWEBMruG+4mQJnjBEG7XPQJ+qNtvLG7msTjA4wLyjvk6jskOxuY17tNcDvMbwyT886yvPbU8Hj99
LkuiAJLQhXOSzeRjfL5nf7TQIwyESx6DrgxxEQXUaTMqzJdWXGVcJ3e+yrn0K4osYURBDy8Y8IVz
fMOU/AzzOImCLfzLLwEzjCi49gtYRknyjIJ9uZT1C/+K0j8/PQwiAPkiCmrNwX9xolGmhngQHnFg
qOQ0T2iKMg5m2aB5VOh5ETdR8HZyOfcAj+lRwGcw1H6NnUguo/IPENJzOxtmOCoSBgWMcnyPHd5+
HG5Uz3/DYLydDa3BnJugTlMJIgowwqbyrxDu8e3m01KJx2qX9P1MAm5ig2eehShgh1cRhe+yXL+v
PkEPQAJu8DLePf0QS7CVycvPmThEIQphfdf1plI9CjoGSKpdyKTxidZ8F+W5cZmLfnoIXH/L+ncn
j+dnWO/Gs5GrEo8RpjOVCcPZ7NmJmyioZGbkKOBB3ss93FYzk9Br2Wv1CJ+e1Jn/PYXJsV/OhEu/
1Rxby16x6ThQgInJd1nPezvmJvi1oY/Fd1lS5DyAzPs9CBO8i+frBxlLPBXjUfAjCQAh02Rm5VX4
8S/seQzmIMRJFFwSeuMqo/pRDDkKkMWlX66TUtXnl6Ng2zH0S/7NR+iRzUDLhChE6RcwKnQsdpTx
zHfZuAxc11wZc7dbXRCYS48CMNX7ifs1sj31SB8nFwxd1p+46tFlCyIKhZ4XcRMFLzacE1D/x0uI
Ts9RACZezDSMMTZcbuBdThjlSGr+Gu/8f5N35mFWrPJCQw56p9wgaRinDF3Gu8r9eOdVD7+B8bGG
PQd38e+v4Z3ZUdqu++bWhFUkAX+P5UB8O8q/3nqaEAjHmGQdPcay6h4FvcxQDoe6knecZ7Q7zLHa
Sc+70JvDk5L8f8hjuIcNsbHcB92j4CePS9/1c20qLUcB/d3LO/sIVVM42MKEXO/JCNJD6OC9vBu+
l3UPXiskScNHlU+iAO/FNPYiID/iNjbkF3HYzi/Z64C8GOVdg86ATOP0L+ivS44KMFvHJAEhQKfz
b25n/cS9BrYTw/7KOPyK58NZ/O2nOHxOnawVNhZjmTx/hE9WgqdPvz8CXqDlTOy+xPPm00wUBrKX
sHPrBYhln6Pgcoxp2PGotiNVXerNJVFwOSI0rjKqH8Vy6pFLv6IYi3G97IMMNZdkZtUvhJGZZ9ir
05ZMQ0j9pl1NdZuTqKIYjmF4Ffp0lzD5CvG9X/J5prIE6aGtLb95EHThmpItLEfBDD3y098zz+6Y
pndRPQ1RMAxaf+Kox5Z7EVZvoefFlG0/IMTk/5mNtGNsTbzE4R67+YX/Nd5nPYtDfJA03J8NjfDD
GVs0AwbBixzvPdty6pH6fgufT38G143QBMRRb+K/ezAhQDgQQhme4RyFn3Dy578m2CBhwzzBdXZm
owehQGac/h9Y9kkcCNGzqob+mUOMqrkPkLU3k4of8i7tTzkfAqEkVzDRgCE6j70Ah9i8mcJG//mc
OP396iP0q+RRz/PwKe4nEk3n8U5pA8uBROUP8Y4ovBs4kQZHafbkv0GCFrFBhGMhdY8C+ucnz/ks
D56gvuvzvpJOPQI5e4PHEYTxIs5J+SKbz2fweL/LmD/FYwHP0p08Fp/2TTtuu2IG6SG+W8YJ6g8m
D1JfPjb0W0xFz2R93IJbsbk93JugexSge1/27nFoeWB0n8H/+wk2rv/ECdcwmDF/fspag9CiIaxr
nfh7EFtcePYDXDyoJTMjeA2EFeFx3+KS13KuDC4rA+GFoT+avRz9uB4cx4sjY/HZHdruvN/7AXPn
ZSbZs1jD+Xwu1vk6+jDrK+TF/8Or8I+tZBtJyrjfYRH3F4n80zhH5xLuN55MxgLeshVMnv+fT45C
WZ96pO5RQPKx7Zm/jI/vaj3RKOjCNXyHBzkLel1RE5rj9ChAHvViy9eFay47en6TIO7PXfru2mac
ccZmMqR+tGk2x6MqomAmsiJnYvmCzfTpyz9Mv+WTrpY/25JkrZ4geaLi42KAutZZ6uXMcTD7k8nt
3C56CEM87GZm/ZZwJZfSw0xvZvY7EtmsD0f+rnzhLfrL9r+3ucXZxCgqhn7rT1z1YE3BgzwvHUPb
RZYoFycRz3Q+3M5E4RHvBuW2J/OhTpzrjphknPDj+rjco+BXF4xGXN50Jxv/MOz1B/kMV7JB/002
rFTuA87ER/LzQi0MAjua3+H8A5xONI+JAsiCet7PZGQCk6DBvNt5lA0knHq0Ev/ihptaX/PwYMDb
8RU2DnH51a+qm/jyuIOe4YYHJv8H+X/hDTGJQpA8rqfZAINKu0cBhuSLbBTPMy5cw2k9yCX43+zZ
iXqXRJAewlBezLv4TzGhBSlUDzxYE1jbcezt2605Cth5N59PMB29jY135NNkcuEayMc3WE9HcFgc
7jZQOQWPcu4OCKh6oIvXIpndof843heJ4PXGQQGqrtG4uK31lCeEEj3D3rQned4gSf9uTspHWBSm
QCZjEUQUgvS5LHMUXBfKXJWLmyjkSs5KrDeOm5nLFbdC75qWK662fokels5oF8O8mLp9DnsQmukw
84Bk6zn2CsEEhw105Lf8Wc1td/KDUNZvxL0R9xFESMTFZWQz2XjDbjJ2ZnHkIh6YTjgKFUer3sO7
ywN491Nt38ErAaMOBhaIAHZ1VcIzdlmR84D68It+7KH4QOsuK+Tczb9Dt2H8b+LdYVzOdh6XwSlJ
ei7E31iuLUxgmDrQubwrW8P1/pWJDHZjkWStbyUGyeOinUjEncE7s/u5jUq5mVnhAiN1B48VPDjt
eWD6sfFq4uuCoacz2g3hfnoIwvA27+a/y2SghvUdnh/kymA8cVIVxhiEU38wL2o5YeUsTtj/G8fK
HeHvzblTxW3jAr8uXHaXNr/w2xr+LTxoNuID3annNt9lmfD7Pjz3kNyM+xD2MCbNraE8pjztuc4z
mMfu43msCK9ZBhcJwsOhuoO+b2317iHvxgxuijoWSNR/L3mCzuSwJDX/IEOQPgtRcNXmCOWEKEQA
qwBFM7mgqQBi5rXJqBdQ5VW4Mm2sHPTQ9PiZQ+W3S18qQ1os80LPUYgTO+8iJg79WcE7rrcZcddB
7eBYTCQSX8I5BP/Cu611racmwWiZw/W9xuEa93CYxMdajzKNU+ZiqMs7FYl31XG60veYhnym9ejV
YpCtFGXIVA+Lqa/gyr9mfUBoku790GUcwHdNTD55euSTjXLdzzB9FqKQgxEQopADUGOuMmqMdczN
F1V1hT7RpajAyLMwood5BjxCc8U0L3JFFAAHjASENlTzLui1nD/gEnqD3zzIwQ+/5DAUeAZwYRuC
nup5x3c7k4jrOdzjSvZQqONOI8Be9EVhEOKSr8eZKCCnApesVcLdCbkemEz0MNcyRakfeoFwoo3s
0Wq0/BAeAuzgX8xetjiOVo0iW1BZF30WohAX2lKPICAICAKCgCAgCAgCgoAgIAgUDQKJcePGJVes
WFE0AokggoAgIAgIAoKAICAICAKCgCBQeASEKBR+DEQCQUAQEAQEAUFAEBAEBAFBoOgQEKJQdEMi
AgkCgoAgIAgIAoKAICAICAKFR0CIQuHHQCQQBAQBQUAQEAQEAUFAEBAEig4BIQpFNySlIdDixYtp
7969NHbs2NIQuMBSXnzxxTR16lRatmwZzZ49u8DSlE/zoofRxlL0MBperqVFD12RaiknehgNL9fS
ooeuSIkeRkFKiEIUtKSsh8ATTzxBffr0oRdeeCFWoxcvj+nTp1P37t1TSGPhmzZtWmTklYyTJk2i
tWvXRv69epnFJQ/6NmzYMBoyZAjNnz8/Vtwy6lwZ/Ej0MPq8ED2MX/FFD0UP49eq6DWKHooeRtca
t1+kEYUF0zvSeb1PXc+3+o1muuWB9CvvL7mghu6/ic+xrWspt/WdJF096Yhva6izb0+ih587Sc+9
dMxNqphLXX755QSDsa6uzqt527ZtNGLEiLRWXMroP4AB26tXL5o3b17RG31YQAYOHEh79uzxcMjU
cEb/YbTD2IUBvXTp0phH6lR1ajyWL19eMKKgdy5beVRdwG/QoEFZj0POgM9hxaKHmRFW0cN4lVL0
UPQwXo3KrDbRQ9HDzDQn/7/yiMLbW16hh29tTwfY3ldGvyIEG7YmU2TB/Kxvr3Ztfqd34aHb6qhL
xwT1PIto3pLCEAVl4G3atMkLk1G71ocPH06RBZcyer8wwTt37kxnn302LVy4sA1RuOGGG2jMmDG0
f//+ghqE5g59tkRB1bdmzZpA4/1HP/oRrV69OisCla1hHodHIRMDLazvCsPt27dXTNiW6GGf2NYB
13khetj2ZSp6KHqYfxNL9NC0nRCNkO2GpapT1sP8aHRg6BEM/XN7Jmj8g8dpW/0JMv+GiKOGdqBx
V1bTnOfTicDNV9fRpRclaMnqZrp6aFWb7/PTvVNhMrpiwpAfPXp0KgTEZlSaZcwdYdw9Aa+ELYxE
7RQ0NTUVjcchDsMZmIwcOZJmzJgR6E2At2Xjxo1WMqFIVE1NTZoKNDQ0pHkpwhYAsx6TBKn+btiw
gYYOHeq1ZRsP7PDr3iVTjqgLUlDfxatgn49R1wLRw0kU5mkTPQzWKlkPZT2Muu7korzooehhLvQq
7jpDiUL3rgnPy6C8B2/uPOVhgDDq85fXJWnmgpYwJZCHMcOr6c45jdTnA9VWIhF3R2z1+e3e6jvj
SC5FGI25w2vbPdcNlHPOOSeNbOjtF4tHIW4mj0WtW7dubcK20I6+4N1xxx0eUUCys07IFC4IWYKB
HkQGgr5Txr2ev4B/d+rUKbVTociaHmaGz/r3758ib7YwKrMeF6Lg0ndTP1wIVz7mSL7biOPFKHpo
Jwqih+7aLHrYsmbLeuiuM7koKXooepgLvYq7Tl+ioMKMFq9sIQA6Idi9r5nGj6qmbTuJpsw57oUf
KQJh/s7P4xB3R4KIAkJlYLQiHKi+vp7uu+++FDmYO3eu9++gMghZMg1XP49DPvqVSRtxLEhBJypc
c801XjgWMFbeAuzyz5o1yxNXkQMzPt/P6PMjCrbQMdRvlrf11yXsx29cg4iLS9/1MUNdEydOtIat
ZTK2pfQb0cOWE19smxMmmdRJtgthFT10nwmih6KH7tqSu5Kih6KHudOu+Gr2JQpIQsajchZ0ovDa
piYvofkQ5zTc+1QjTb621iMKj/y4MY004PfFQhTWr1/v7TYjNwHG64QJEzwvgk4UwsroXgchCnYl
VLv9thAe5UVQCeBBBpOfYR5ksIPI4EEokd8CrJdRPTDDj2whSmGhUKgrqO86Wq65HvFN8+KpKdcv
RnNMRQ/9Dx0QPcwuVtrlKEpZD0eQXzinmquih6KH8l4unne0TRIrUQBJ6MI8QeUmqB/i8z37/UOP
UG70sCrfHoedkJQLqGyLubkwhZVRxqeffLZTlHLRl2zqzIeBpodmDR8+3BqmpEKCVF/8EqxzQRRM
b4QtRMxvtz+MKLj0XfVZPAq5fTG6jIXoYYsXTjxbmZ8CF0YURA9b8tn83gWyHsaTsyV66J+z5TIH
RQ/DLcs2RMGPJKCqKMnMqulCehQgg0uisksZE8ogj0Il5ijYdoXMhErggrsE7rrrrtAjWnMRemTW
advFyIQouPRd1x/XZNzw6Vt6JeIgrEE5Ci5jIXrYojeih9kRVtFDu4HmMgdlPWxBQNbDtmHD8l4u
vvd6iiio0CKIaHoSlNhRj0fF7wpNFFyOPnUpE4UoqN3KSj31yE/No9whEBSWFCWZ+fXXX08dQ2om
Kpt/Kz1AjoV5P4ZLXLnr9I6Cg2udpVIujhdjtgZuFPxFD0tFs6LJKXpIJOthNJ3JRWnRQ9HDXOhV
3HWm3aPQo9upy9b0huYva06daBT1wrVCEwX0w+UyNZcy5i6ILdlQ7dQVwz0KZniFLr9uQLsqVbax
pLabl1XbNnnMI1D1EC+X41FxQhOS2HHZHB4zzMmUB7G0s2fPplGjRhFOw8K/zTHXk7UzCTmLk3C4
jluhy4keih4WWgfRvuih6KHoYVsE5L3sllBdDLpTKBkCj0ctlFDSbvEikOnNzGE7s/m47bkYUI2y
m10M8harDKKH2Y2M6GF2+Klfix5mh6PoYXb4iR7Gh595ImM8NZdHLUIUymMc89qLTNylYXdaoANx
3daYVzAiNFZqJ2VF6FpBiooeZga76GFmuPn9SvQwMzxFDzPDTfQwXtxED8PxFKIQjpGUsCBgSzgK
A8rPxZlJGFRYW8X2fSWfMJPLsRA9jIau6GE0vFxLix66ItVSTvQwGl6upUUPXZESPYyClBCFKGhJ
WUFAEBAEBAFBQBAQBAQBQaBCEBCiUCEDLd0UBAQBQUAQEAQEAUFAEBAEoiAgRCEKWlJWEBAEBAFB
QBAQBAQBQUAQqBAEhChUyEBLNwUBQUAQEAQEAUFAEBAEBIEoCAhRiIKWlBUEBAFBQBAQBAQBQUAQ
EAQqBAEhChUy0NJNQUAQEAQEAUFAEBAEBAFBIAoCQhSioCVlBQFBQBAQBAQBQUAQEAQEgQpBII0o
LJjekc7rnUh1ffUbzXTLAw1pUFxyQQ3df1MtdaxrKbf1nSRdPelIqoz5vfpi194kjX/wOG2rP1Eh
0Eo3BQFBQBAQBAQBQUAQEAQEgdJFwCMKb295hR6+tT0dYHtfGf3K4N+wNZkiC+ZnfXu1s/7u7nG1
NG/JSXrupWOli4xILggIAoKAICAICAKCgCAgCFQwAoGhRw/dVkfn9kykPAHm38Bt1NAONO7Kaprz
fAsxMP+uYGyl64KAICAICAKCgCAgCAgCgkDJIhBKFLp3TXheBuU9eHPnKQ8Deq0+f3ldkmYuaPCI
wpjh1XTnnEZ67fdNJQuMCC4ICAKCgCAgCAgCgoAgIAhUMgK+REGFGS1e2UIAdEKwe18zjR9VTdt2
Ek2Zc9wLP1IEAkQB39W0O5XrcKQhSbc/IsShkhVN+i4ICAKCgCAgCAgCgoAgUFoI+BIFJDbjUTkL
OlF4bVOTl9B8iHMa7n2qkSZfW5siCiAYe/Yn05KWUVfP7iRkobR0Q6QVBAQBQUAQEAQEAUFAEKhg
BKxEAYZ9F+YJ5ilF+BwkQD8JyQw9smFpeicqGG/puiAgCAgCgoAgIAgIAoKAIFASCLQhCn4kAb1x
SWYWolAS4y5CCgKCgCAgCAgCgoAgIAgIAoEIpIiC8gygtN99B2HHo9qOVHWpV8ZIEBAEBAFBQBAQ
BAQBQUAQEASKC4G0exR6dDuVgKyLOX9Zs5fQjCfowjV8hwc5C3pd5qVsxQWBSCMICAKCgCAgCAgC
goAgIAgIAiYCgcejClyCgCAgCAgCgoAgIAgIAoKAIFCZCAhRqMxxl14LAoKAICAICAKCgCAgCAgC
gQj8f698PvvKlvPfAAAAAElFTkSuQmCC

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=23947;
	creation-date="Thu, 25 Jul 2024 14:18:59 GMT";
	modification-date="Thu, 25 Jul 2024 14:18:59 GMT"
Content-ID: <2245b86b-c72a-46ce-8408-50feac5bccb6>
Content-Transfer-Encoding: base64

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
RU5ErkJggg==

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_--

