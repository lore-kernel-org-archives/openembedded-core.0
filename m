Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C94BC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 14:23:17 +0000 (UTC)
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
From: "Yash Shinde" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: [RFC] core-image-sato:do_testsdk breaks for cargo build with rust v1.78 upgrade
Thread-Topic: [RFC] core-image-sato:do_testsdk breaks for cargo build with
 rust v1.78 upgrade
Thread-Index: AQHa3p2WIzEk/HvqzEWOssACQm1aGA==
Date: Thu, 25 Jul 2024 07:23:16 -0700
Message-ID: <PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2@PH7PR11MB7593.namprd11.prod.outlook.com>
Accept-Language: en-US
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
X-Old-Date: Thu, 25 Jul 2024 14:22:05 +0000
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_";
	type="multipart/alternative"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 14:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202504
Message-ID: <20240725142316.CSVEuuYghbk3UX83F5QmF8Cc2hXIdEdvLfpWIkzAYbY@z>

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_"

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: text/plain; charset=UTF-8
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

It seems that the shared objects are unable to find the definition for *"__=
tunable_is_initialized"* , but it can be found in,
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

In rust v1.78, readelf glibc version section:

Regards,
Yash

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"elementToProof" style=3D"text-align: left; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: #000000;">I am analyzing the following failure and =
adding my observations here for any help/suggestions. <br /><br /></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><a id=3D"=
OWA5dcbbb58-27d6-b157-6a45-c1ace39d97c5" class=3D"moz-txt-link-freetext OWA=
AutoLink" href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/201312" target=3D"_blank" rel=3D"nofollow noopener">https://lists.openemb=
edded.org/g/openembedded-core/message/201312</a>.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>Trace=
back (most recent call last):</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>File =
"/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/sdk/cases/r=
ust.py", line 34, in test_cargo_build</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>self.=
_run('cd %s/hello; cargo build' % self.tc.sdk_dir)</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>File =
"/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/sdk/case.py=
", line 15, in _run</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>retur=
n subprocess.check_output(". %s &gt; /dev/null; %s;" % \</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>File =
"/usr/lib/python3.11/subprocess.py", line 466, in check_output</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>retur=
n run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,</em></div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>File =
"/usr/lib/python3.11/subprocess.py", line 571, in run</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>raise=
 CalledProcessError(retcode, process.args,</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>oeqa.=
utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/=
yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/co=
re-image-sato/1.0/testimage-sdk/environment-setup-cor</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>e2-64=
-poky-linux &gt; /dev/null; cd /home/pokybuild/yocto-worker/genericx86-64/b=
uild/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-=
sdk//hello; cargo build;' returned non-zero exit status</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>101</=
em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>Stand=
ard Output: warning: `/home/pokybuild/yocto-worker/genericx86-64/build/buil=
d/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysro=
ots/core2-64-poky-linux/home/cargo/config` is depreca</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>ted i=
n favor of `config.toml`</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>note:=
 if you need to support cargo 1.38 or earlier, you can symlink `config` to =
`config.toml`</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>Compi=
ling hello v0.1.0 (/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/hello)</=
em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>error=
: rustc interrupted by SIGSEGV, printing backtrace<br /><br /><br /></em></=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">All the f=
ailures are similar and fail for rust sdktest with cmd : 'bitbake core-imag=
e-sato -c do_testsdk'.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">It's unde=
rstood that the "cargo build" cmd fails with a segmentation fault when the =
cargo binary generated from sdk environment is used.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">Manually =
reproducing the issue in verbose mode after invoking the sdk env script:</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>$ /ho=
me/pokybuild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testi=
mage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/cargo build -v</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>error=
: process didn't exit successfully: `rustc -vV` (exit status: 127)</em></di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em><br /=
>--- stderr</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>rustc=
: symbol lookup error: /home/pokybuild/build/tmp/work/qemux86_64-poky-linux=
/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/..=
/../lib/libc.so.6: undefined symbol: __tunable_is_initialized, version GLIB=
C_PRIVATE</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><br /><br=
 /><br />It seems that the shared objects are unable to find the definition=
 for <strong>"__tunable_is_initialized"</strong>, but it can be found in,</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">build/tmp=
/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdksysroots/core2=
-64-poky-linux/usr/src/debug/glibc/2.39+git/elf/dl-tunables.c, as follows:<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><a id=3D"=
OWAb2b1f373-1706-8718-5a07-284ba0f46737" class=3D"moz-txt-link-freetext OWA=
AutoLink" href=3D"https://github.com/bminor/glibc/blame/431c1be28e443d0d691=
cec12d634ac60dd6630c8/elf/dl-tunables.c#L153" target=3D"_blank" rel=3D"nofo=
llow noopener">https://github.com/bminor/glibc/blame/431c1be28e443d0d691cec=
12d634ac60dd6630c8/elf/dl-tunables.c#L153</a> (Added in glibc 2.39)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>bool<=
/em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>__tun=
able_is_initialized (tunable_id_t id)</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>{</em=
></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>retur=
n tunable_list[id].initialized;</em></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;"><em>}</em=
></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">I am not =
sure why the shared objects are unable to find the definition for the given=
 symbol.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">Also, whe=
n compared the readelf dump on rustc binaries for v1.77(where build works) =
and v1.78, found the following differences in glibc version symbols order. =
I am not sure if this is causing the issue or not. <br /><br /><br /></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: #000000;">In rust v=
1.77, readelf glibc version section:&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: #000000;"><br /><img id=3D"image_0" style=3D"max-width: 1211px;" src=
=3D"cid:caf899b7-ba74-4e9d-9250-144a888f98bc" /><br /><br /><br />In rust v=
1.78, readelf glibc version section:&nbsp;<br /><br /><img id=3D"image_1" s=
tyle=3D"max-width: 1211px;" src=3D"cid:2245b86b-c72a-46ce-8408-50feac5bccb6=
" /><br /><br /><br />Regards,<br />Yash</div>
<div id=3D"Signature"></div>

--_000_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_--

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=14787;
	creation-date="Thu, 25 Jul 2024 14:18:58 GMT";
	modification-date="Thu, 25 Jul 2024 14:18:58 GMT"
Content-ID: <caf899b7-ba74-4e9d-9250-144a888f98bc>
Content-Transfer-Encoding: base64

groupsio/67612/107543359/202504/0
{"ID":0,"Created":1721917331140425822,"Updated":1721917331140425822,"Version":0,"UserID":0,"GroupID":67612,"Name":"image.png","NameLower":"image.png","Desc":"","MediaType":"image/png","Width":778,"Height":95,"Size":14787,"Format":"png","AlbumID":0,"FocalLength":0,"ISO":0,"Aperture":0,"ShutterSpeed":0,"Taken":0,"Make":"","Model":""}

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=23947;
	creation-date="Thu, 25 Jul 2024 14:18:59 GMT";
	modification-date="Thu, 25 Jul 2024 14:18:59 GMT"
Content-ID: <2245b86b-c72a-46ce-8408-50feac5bccb6>
Content-Transfer-Encoding: base64

groupsio/67612/107543359/202504/1
{"ID":0,"Created":1721917331148735462,"Updated":1721917331148735462,"Version":0,"UserID":0,"GroupID":67612,"Name":"image.png","NameLower":"image.png","Desc":"","MediaType":"image/png","Width":846,"Height":105,"Size":23947,"Format":"png","AlbumID":0,"FocalLength":0,"ISO":0,"Aperture":0,"ShutterSpeed":0,"Taken":0,"Make":"","Model":""}

--_005_PH7PR11MB7593871C9D198D9BF9B01A0DEBAB2PH7PR11MB7593namp_--

