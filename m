Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D63C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:28:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14850.1702996122319775861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nX5ijLPs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717bc9c76=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJBK5on031564
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-type:mime-version;
	 s=PPS06212021; bh=PaQlaSAJEWmNu5vkffLdtIBpS/BpKzHo+3uvu7vGYMs=; b=
	nX5ijLPslzWCD0/hsehUL5kQctGz1q5B/c3vKc05FM9YczudArFGIN9DXDuCziZX
	xU7RyJWPAGlnJWMDp2gBcOCb5dngMB9kAlLTiqjuNp1orVGutwVw0LtZRLdTGSMR
	GxZooFvzXYiKt5xIbquMGA1nvFp2BawHnFCkC/2gt14vW2RdMijF4HxjLhMEW2NR
	iQhrf9uYuEJnUspx53IkCgkph7ZJMilZNplRcF0YjvqmG01e31oCLmxiF/Jx94ib
	zyP5kFh6W9+gfIGDsak+8bvzkuPSIhrywT5ktSSw7CJHA+dC/a+jtCwhGFAdzV8h
	3ZCjbt5FM6KucNX/1okyQg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xbc7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:28:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNDlNpK7fufyu/tMa4NfdJECUy56wVc5xZQ7kGBmZDIJ/70T8z8QsVw5eI0S7mhS/I4/hPOYD9ReQmYK25+1zCnFbp321W9zoG6s2qI9ePVwh8zunINecCieMroCO1NLvNpCahIXV1p33vX/opXy2B6u/nqepG18JeCbrB5bnfdN5cZH05i3TWWo6LdfxqY0NRCBN6SFatlfJehK8Bb/D480eBubH7wtuve1LZCjAtU0YVcjj71aIbcQsITUj4LpafJ6yGx2SpWJmXVGT+pwDRAk3w+l2Q7wLrM73k7YKflFZ/qleOCPg8GFGoKnLqHz9r/gf4nOIaPUJxEO2bQGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaQlaSAJEWmNu5vkffLdtIBpS/BpKzHo+3uvu7vGYMs=;
 b=OaX3RCGUy8a4Ucm+GnWgeRNrUXzkf+4hlU4Zfln6/gPMOLzqYQIz3SkOFoN03FdxW3VFhQWv3/8vK9NLFRYUgysyKKldZjS42U2XPDp7eJgBMSRIwWeF807ag6uuk5fAUdNEsMwjwlmNJYghiTBOFIOvbjqLftzqh5NlgItbDQliwwxy5TjKmrgn8iqPsunQJoT5/J1Sa2yMenkVc4vl1VnJe0vCFz3QFd576wZuY+VQTAF74e9aNMDSptLKkOq2wzIERt1+UcOYMsIXvIIDIyhVGHY/WrtmSwoTZHzDdTglFff7KNLv2+fA2eWCnupKptpXLV2sk9K6m/giwdiovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Tue, 19 Dec
 2023 14:28:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 14:28:36 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Sadineni, Harish"
	<Harish.Sadineni@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>
Subject: Rust Oe-selftest Updates
Thread-Topic: Rust Oe-selftest Updates
Thread-Index: AQHaMoR5yYTXNOv9Wk6xuFQFIX7sOQ==
Date: Tue, 19 Dec 2023 14:28:35 +0000
Message-ID: 
 <SJ1PR11MB612945FEF0196ABDC4C53FFBEB97A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: f200cede-4639-434a-2b01-08dc009ec92e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vYl9JCQt9zRdsxoUHPlIi5v0nyxUILoLDDg+02IQN2pfw66uv8bhox4b9rWdgXP4UueDQJT6zC+C21uyfa278Py92yTeJBh3+uNPKpUVAsrMUD/GkiSLb/mUbNQhhJLMwjbi8J4hGnDAZwnpTFzayd1wRq1augVtdVZXYeBecZzUu3AkD8d5MzEWaFSmPfIGpZB8/VHCrgNn/rgOfx9z2iEhisExII32/7huws0KtTTbn/jQ8LBgDdgTsLGWGGdmsS305zD9uH/xxoWRk28syEfeYpOqYwCqnOqx2XCOuWQriH3x/+kzJIZWp0ZHOIFP0yLQ1Tj+BGpj/kJdDfCcqa2Uyv1/9lrnzPB4Qq/x9qrcm5h9GKcwix66RS2nllB46yRhvktRTsXyZfiZwNdwIb94TEaZP1nVrMP4IERUiqyYy+XSZyPWPkjmVrAr8hOpAPgAme9NzGo7yeR8GjSHfgQdqYB0mBPzfvlQmVuzK/2oUsewJFl5bg3wBhfo3c0MbJJ4ndSMiju9bN4AT5t+S2pm3qYzAA3BXDYFVGnjAmwioYHDw0m4t+Y0gMp9TjYWusa2GPHDNHg7kTim1nUtgWBSzofsm0TmRpRuHO7g/xoKDFS1574jqnRYPqhhz/bTCQacxa8oD95Ma0bapKaz8Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(15650500001)(5660300002)(52536014)(8676002)(8936002)(4326008)(2906002)(478600001)(86362001)(33656002)(166002)(966005)(38070700009)(38100700002)(83380400001)(26005)(71200400001)(1015004)(41300700001)(107886003)(6506007)(3480700007)(122000001)(9686003)(7696005)(316002)(66556008)(66946007)(66476007)(66446008)(6916009)(64756008)(54906003)(76116006)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?j0H2vTEiTBUr1saAWKAM5pPFu04xWtbWM7Mp8vRIfSu17VanagxwyBtq+B?=
 =?iso-8859-1?Q?V0JX6AYpnnCxfsoWJu3HrJ99hRHvkaXy3jWLLEic1Plo8bQ0SjXj0t/bRh?=
 =?iso-8859-1?Q?YgjLVXeX42hSGb0iLtNHJb59ya0GlLHABGkpri1Fh5rCzUZM64AoaJfYg5?=
 =?iso-8859-1?Q?pHNzo3MMR1VZIDrFUUdYqiTozJ4zguXw2wfeSm9VWB+vp0kZADvmvrqDt0?=
 =?iso-8859-1?Q?ikwp8Vm85DZ7+Vrw7x0kNh6/IynM0cbp1gs/1j/m8vyUyP9cjh9REV9ZRY?=
 =?iso-8859-1?Q?gYRJJ9A7AfWotXggyTPegNSTJB8AjASLeVRCOyVRFrzn2bTbnEk08uBAuO?=
 =?iso-8859-1?Q?ZCke7TqUPVbeI+lnM7N6zrL9hxtz+uRDRAjylhNSfDJFYt1fqFPOiY69NU?=
 =?iso-8859-1?Q?6nAE/ICrslE+zliF2M/iE9J2tsjMKNJxbfnysqR8WscXUj+G8NWQKGrPQs?=
 =?iso-8859-1?Q?Ue91uaHi3tgzGItbIxonE3mPim+ZpAodvfIjXH/o7OLeFBMG21YgVQ1UDe?=
 =?iso-8859-1?Q?Etxc9hyD1ZDrHyPrDV9pUwXy4ffvdngwn/e8vp9BDU/SzV8pOPGb7+6SMn?=
 =?iso-8859-1?Q?nLYIj6ao5NQUt7NOAhaDJJ4J8jW4B0bWXm+so95n+BoHmxTLToXJxThKP7?=
 =?iso-8859-1?Q?NiIZ/x5OarD+kXlefuHhVVfVcWVgFEzYksvPWCuhoCWZQPyLmg+G5VzSDU?=
 =?iso-8859-1?Q?oVzulBG67Bv9ylbkcuarTWVoqk5zAT3Fkoju9D5deRf1/k471MOUqgEa9a?=
 =?iso-8859-1?Q?m2y0I27ihA9lcC3nqu7bgV3zSNn0GZY0qplqFsCKAu3Evhms2Zve6m+fDp?=
 =?iso-8859-1?Q?zSE1aOHXhkukKa5Pb9ApJ/B4siaZobfjM2JeMn3yJgPCybIyWvba1qv10M?=
 =?iso-8859-1?Q?889xhRjOVruT3LoacTI/FH+bE+tO0OL9U4nMTDMyoKsJ9oxVHAYoegtjp+?=
 =?iso-8859-1?Q?s2hcG3r6tGkv+vxDlAMSJQJCoF15ZcmHM97u6S2owGQlK4yAq+94RHdctQ?=
 =?iso-8859-1?Q?KfI5jOC8ycgrvp/YoeYtwAto1h5Bz3Q1hNS30TLqIJ9EBIisM/n7p9dzhQ?=
 =?iso-8859-1?Q?QAxBZhOJcQf+tdWDYkH6ZOD8CvCIulqnoqu8Zri7y1QrGTcYxbYjqQBb8u?=
 =?iso-8859-1?Q?4dO56PTYXGW6jgghuw53v8Li9WBkiOd6f0Gy/9+CD2MOhb/7/NzKGltJtx?=
 =?iso-8859-1?Q?gisgOLYvf8yx3GgDk8Q5/MQZWWBOaBMSfmVRydTPzc7KABLx4CY70H8l6X?=
 =?iso-8859-1?Q?6/GJo3Q7+hcocOUn4YNxV8ZRoZo6u5WDioGvUKJuSXJNAVYj8uz8+RIF+L?=
 =?iso-8859-1?Q?e0NftH1L1yAuaA4xKkurnqvnquHEJpyWWsZO2ruwCI1K4Ou2cdCmdtdLic?=
 =?iso-8859-1?Q?JNsynvBeTD163uZWWZzNZt+H4FFM30ztcYjpBEJ/ugnNmLrQV+zBfJ6DMf?=
 =?iso-8859-1?Q?dq8pIWD7nQJKHv1tzTD0G+7doQVoYZ5r/Lsi+pCgeK9QKgUMdj7zwfWRJj?=
 =?iso-8859-1?Q?Bw9eetKu4Oc3WASrZ7wNl7dFyse9OH4KDmVXXunsOjgR2f3P5M3HmmhVkm?=
 =?iso-8859-1?Q?9uQCKVVET1Zz9Sx4h9LLaCWzWAvtOYguGAgKdUn34nMCQK2P0IdJpAds5W?=
 =?iso-8859-1?Q?BMdKCXm4Osiuz77DhauEEjBGErtnNVHsgE?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB612945FEF0196ABDC4C53FFBEB97ASJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f200cede-4639-434a-2b01-08dc009ec92e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 14:28:35.7101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Bkd07+0jnwk9g2niBhfFdvhH44JvVWPaposf34w7Ud2DuBsM15dWH099aTagWJl+Lx+C8aoCGLQQuW65oTtePCaOP94tUYDt1eHyY+0kk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
X-Proofpoint-ORIG-GUID: og6ppKfJY3mN58-IQowxNvSqsiu1Rk8l
X-Proofpoint-GUID: og6ppKfJY3mN58-IQowxNvSqsiu1Rk8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=255 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192739

--_000_SJ1PR11MB612945FEF0196ABDC4C53FFBEB97ASJ1PR11MB6129namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I tested rust oe-selftest with Alex's rust: Upgrade 1.71.1 -> 1.74.1 patch(=
https://lists.openembedded.org/g/openembedded-core/message/192277) and stil=
l the same failures are observed as seen in the earlier versions.

Currently, we are checking the root cause of this issue and trying to check=
 the required target specifications for poky target(x86_64-poky-linux-gnu).

error: the option `Z` is only accepted on the nightly compiler
help: consider switching to a nightly toolchain: `rustup default nightly`
note: selecting a toolchain with `+toolchain` arguments require a rustup pr=
oxy; see <https://rust-lang.github.io/rustup/concepts/index.html>
note: for more information about Rust's stability policy, see <https://doc.=
rust-lang.org/book/appendix-07-nightly-rust.html#unstable-features>

error: 1 nightly option were parsed
thread 'main' panicked at synthetic_targets.rs:66:9:
failed to gather the target spec for x86_64-poky-linux-gnu
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race

https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5a4=
d95c79?diff=3Dsplit&w=3D0#:~:text=3D//%20To%20get%20the,with%20%60%2DC%60%2=
0flags.

From rust 1.72, as mentioned in the comments(in above commit), the 'get_cur=
rent_target_config()' function fetches the target specs using '--print=3Dal=
l-target-specs-json' and '--print=3Dcfg --target=3D$target' but that's not =
working in this case and gives the following error as the rust built is sta=
ble one.

Note: These changes are in the same file(src/tools/compiletest/src/common.r=
s in rust) which was added in 'bootstrap_fail.patch' during rust 1.70 oe-se=
lftest.
(https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtool=
s/rust/files?id=3Da48e3612b5dc0e58a89f88a914365e926101c90b)

We are checking on reverting those changes and make the target specs fetch =
again as it was in 1.70 but that gives further dependency failures-

error: process didn't exit successfully: `/build-st/tmp/work/core2-64-poky-=
linux/rust/1.73.0/rustc-1.73.0-src/build/bootstrap/debug/rustc -vV` (exit s=
tatus: 101)
--- stderr
thread 'main' panicked at '
Failed to run:
LD_LIBRARY_PATH=3D"/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc=
-1.73.0-src/build/x86_64-poky-linux-gnu/stage0-sysroot/lib:/home/testuser/l=
ib" "/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/bu=
ild/x86_64-poky-linux-gnu/stage0-sysroot/bin/rustc" "-vV" "-Wrust_2018_idio=
ms" "-Wunused_lifetimes" "-Wsemicolon_in_expressions_from_macros" "-Dwarnin=
gs" "-Clinker=3D/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/wrapper/=
target-rust-ccld" "--cfg=3Dbootstrap" "-Zunstable-options" "--check-cfg=3Dv=
alues(bootstrap)" "--remap-path-prefix" "/build-st/tmp/work/core2-64-poky-l=
inux/rust/1.73.0/rustc-1.73.0-src=3D/rustc/cc66ad468955717ab92600c770da8c16=
01a4ff33" "-Z" "force-unstable-if-unmarked"
-------------: Os { code: 2, kind: NotFound, message: "No such file or dire=
ctory" }', bin/rustc.rs:230:37
stack backtrace:
   0: rust_begin_unwind
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/std=
/src/panicking.rs:593:5
   1: core::panicking::panic_fmt
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/cor=
e/src/panicking.rs:67:14
   2: core::result::unwrap_failed
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/cor=
e/src/result.rs:1651:5
   3: core::result::Result<T,E>::expect
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/cor=
e/src/result.rs:1033:23
   4: rustc::main
             at ./src/bootstrap/bin/rustc.rs:230:25
   5: core::ops::function::FnOnce::call_once
             at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/cor=
e/src/ops/function.rs:250:5
note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a verb=
ose backtrace.

On analysing it, there was no 'rustc' binary created at  /build-st/tmp/work=
/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/build/x86_64-poky-linux-g=
nu/stage0-sysroot/bin/rustc  (no bin directory is created). Finding the rea=
son for this.


Regards,
Yash

--_000_SJ1PR11MB612945FEF0196ABDC4C53FFBEB97ASJ1PR11MB6129namp_
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
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; font-weight: 400; color: rgb(0, 0, 0);">I test=
ed rust oe-selftest with Alex's rust:
 Upgrade 1.71.1 -&gt; 1.74.1 patch(<a href=3D"https://lists.openembedded.or=
g/g/openembedded-core/message/192277" id=3D"OWA975223dd-cf2a-4b4a-377b-c41e=
80cf45c8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" style=3D"margin=
: 0px;">https://lists.openembedded.org/g/openembedded-core/message/192277</=
a>)
 and still the same failures are observed as seen in the earlier versions.&=
nbsp;<br>
<br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);">Currently,
 we are checking the root cause of this issue and trying to check the requi=
red target specifications for poky target(x86_64-poky-linux-gnu).<br>
<br>
</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
16px; font-weight: 400; color: rgb(0, 0, 0);"><i>error: the option `Z` is o=
nly accepted on the nightly compiler<br>
help: consider switching to a nightly toolchain: `rustup default nightly`<b=
r>
note: selecting a toolchain with `+toolchain` arguments require a rustup pr=
oxy; see &lt;https://rust-lang.github.io/rustup/concepts/index.html&gt;<br>
note: for more information about Rust's stability policy, see &lt;https://d=
oc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-features&gt;<b=
r>
<br>
error: 1 nightly option were parsed<br>
thread 'main' panicked at synthetic_targets.rs:66:9:<br>
failed to gather the target spec for x86_64-poky-linux-gnu<br>
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race</i></span></div>
<div style=3D"text-align: left; margin: 0px;"><span style=3D"letter-spacing=
: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; font-weight: 400; color: rgb(0=
, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);"><a href=3D"https://github.com/rust-lang/=
rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5a4d95c79?diff=3Dsplit&amp;w=3D0=
#:~:text=3D//%20To%20get%20the,with%20%60%2DC%60%20flags." id=3D"OWA1c8f3ed=
1-3512-d008-0a96-d0bea64a923f" class=3D"OWAAutoLink" style=3D"margin: 0px;"=
>https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5a=
4d95c79?diff=3Dsplit&amp;w=3D0#:~:text=3D//%20To%20get%20the,with%20%60%2DC=
%60%20flags.</a><br>
<br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);">From
 rust 1.72, as mentioned in the comments(in above commit), the '<i>get_curr=
ent_target_config()</i>' function fetches the target specs using '<i>--prin=
t=3Dall-target-specs-json</i>' and '<i>--print=3Dcfg --target=3D$target</i>=
' but that's not working in this case
 and gives the following error as the rust built is stable one.<br>
<br>
Note: These changes are in the same file(<i>src/tools/compiletest/src/commo=
n.rs</i>&nbsp;in rust) which was added in '<i>bootstrap_fail.patch</i>' dur=
ing rust 1.70 oe-selftest.</span></div>
<div style=3D"text-align: left; margin: 0px;"><span style=3D"letter-spacing=
: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; font-weight: 400; color: rgb(0=
, 0, 0);" class=3D"elementToProof">(<a href=3D"https://git.openembedded.org=
/openembedded-core/commit/meta/recipes-devtools/rust/files?id=3Da48e3612b5d=
c0e58a89f88a914365e926101c90b" id=3D"OWA90fd71c7-ced6-fe7a-e4f0-bd5b774dfb1=
c" class=3D"OWAAutoLink" style=3D"margin: 0px;">https://git.openembedded.or=
g/openembedded-core/commit/meta/recipes-devtools/rust/files?id=3Da48e3612b5=
dc0e58a89f88a914365e926101c90b</a>)<br>
<br>
We are checking on reverting those changes and make the target specs fetch =
again as it was in 1.70 but that gives further dependency failures-<br>
<br>
</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);"><i>error: process didn't exit successfully: `/b=
uild-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/build/boo=
tstrap/debug/rustc
 -vV` (exit status: 101)</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>--- stderr</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>thread 'main' panicked at '</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>Failed to run:</i></span></div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><i>LD_LIBRARY_PATH=3D&qu=
ot;/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/buil=
d/x86_64-poky-linux-gnu/stage0-sysroot/lib:/home/testuser/lib&quot;
 &quot;/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/=
build/x86_64-poky-linux-gnu/stage0-sysroot/bin/rustc&quot; &quot;-vV&quot; =
&quot;-Wrust_2018_idioms&quot; &quot;-Wunused_lifetimes&quot; &quot;-Wsemic=
olon_in_expressions_from_macros&quot; &quot;-Dwarnings&quot; &quot;-Clinker=
=3D/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/wrapper/target-rust-c=
cld&quot;
 &quot;--cfg=3Dbootstrap&quot; &quot;-Zunstable-options&quot; &quot;--check=
-cfg=3Dvalues(bootstrap)&quot; &quot;--remap-path-prefix&quot; &quot;/build=
-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src=3D/rustc/cc66=
ad468955717ab92600c770da8c1601a4ff33&quot; &quot;-Z&quot; &quot;force-unsta=
ble-if-unmarked&quot;</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>-------------: Os { code: 2, kind: NotFound, m=
essage: &quot;No such file or directory&quot;
 }', bin/rustc.rs:230:37</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>stack backtrace:</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;0: rust_begin_unwind</i></span></=
div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/std/src/panick=
ing.rs:593:5</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;1: core::panicking::panic_fmt</i>=
</span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/panic=
king.rs:67:14</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;2: core::result::unwrap_failed</i=
></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/resul=
t.rs:1651:5</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;3: core::result::Result&lt;T,E&gt=
;::expect</i></span></div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4=
be/library/core/src/result.rs:1033:23</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;4: rustc::main</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;at ./src/bootstrap/bin/rustc.rs:230:25</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp;5: core::ops::function::FnOnce::c=
all_once</i></span></div>
<div><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embed=
dedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0);"><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/ops/f=
unction.rs:250:5</i></span></div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><i>note: Some details ar=
e omitted, run with `RUST_BACKTRACE=3Dfull`
 for a verbose backtrace.</i></span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);">On
 analysing it, there was no '<i>rustc</i>' binary created at&nbsp;&nbsp;</s=
pan><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16p=
x; font-weight: 400; color: rgb(0, 0, 0); background-color: rgb(255, 255, 2=
55);"><i>/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-sr=
c/build/x86_64-poky-linux-gnu/stage0-sysroot/bin/rustc&nbsp;
 (no bin directory is created). </i>Finding the reason for this<i>.</i></sp=
an></div>
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px;"><spa=
n style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; font-=
weight: 400; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Yash</div>
</div>
</body>
</html>

--_000_SJ1PR11MB612945FEF0196ABDC4C53FFBEB97ASJ1PR11MB6129namp_--

