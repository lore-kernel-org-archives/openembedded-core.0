Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2B8C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 11:23:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26877.1704194586856757983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 03:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QZ2JXPXO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1731791858=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402AwE6E018142
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 11:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=BEIyMUI4Z/eiblpDLj
	iuLoRKI+1UB4o+ZyJjtc13pb8=; b=QZ2JXPXO2XDN93ECeAUlAiX54EY5nMM/Bs
	sfmSPOEE/N10Nnwa0DKaQpt2DYDB8Xk+hMRIdxXYNqt/WscdOzxabjbRHR8U+T26
	bvuN0NKOSAuCPxoM03nCLFnhM33KdEBpZ03V5xiuvPXKn0sSAmwBHY+bv3Uh22dP
	rMkVrvJ1fc4CX1z8CEay41sssK7dveiYFUwOS1Twxl7qksppQAh08KTzc9LutExe
	ngMhFJn+4UCxTjiN7RPzVvU1YHv+jxsH27r5kIwM2V8shaUvZZpZ0ARNjb4lka5c
	ZtI6l9kEuxZMoKXffVuOCsxyvm/WBdRHVgnfc8VYC7i4skoXLpXg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa662pys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 11:23:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEF4D+h6ThsgYdpHRxSoLsiJyjwiseBR0GsYRgEFeC/f5d8b9FH8SKiGS7d/dvK2lmPpwzYBRAPJZQ/t//pSKkBTWKgHIyYmqr+LLYDgtyykPy+pbkpx2f6XRj+YlbnNGbdepamSmSMKoi6yUAXjpRRN1nyK4dnHzpVxuAd81yYKCOW/Q/isnG4LSM6r8uSpEmntwmQ+I4KaTgs3mqb3zQFlEzttP1BVKxdIXPrxv5Eog32Mkwtb8EnByH8C9HzmAP2RhOmL4UXkUp6mlIb6WmsUxBeQA/gEB+r8crRmR7tp1y08rBPmEaB+56vlsS4eq7mdJg+jkAmesXJTs1x/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEIyMUI4Z/eiblpDLjiuLoRKI+1UB4o+ZyJjtc13pb8=;
 b=QFobbhXEBjvHenlDGQCEexwN5gVfIB0pGyFNK0aCV8BAouOc5q7hO2lMCN8jNp68qIvGgWr6Fn3bfTg3/wPwu9OpK6abU5iiKFgwOmG4W6TPQm5uwZqiXcAehybbHFLj6svhVQ05IL8CXbesZ/VKogjihhkGLBdqXYlHp01cL3zqH4PIjY5QwvIyIuqBNJ4Eowy1WyzAwz2Gb0j7S9EOywuLdsn0CGb4gqDaUuqFxnepxq6u55dQ/VehDQIEkbpZz48xL+B51VHbXBoImKqqTH39t+8aI52NuVX5EqaF7YlzjRsER7UgWkoA39bV9ARaA4mYwPEClty7rj0q0clLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 11:23:01 +0000
Received: from CYXPR11MB8709.namprd11.prod.outlook.com
 ([fe80::2581:3cea:a607:d9f2]) by CYXPR11MB8709.namprd11.prod.outlook.com
 ([fe80::2581:3cea:a607:d9f2%5]) with mapi id 15.20.7135.019; Tue, 2 Jan 2024
 11:23:01 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>
Subject: RE: Rust Oe-selftest Updates
Thread-Topic: Rust Oe-selftest Updates
Thread-Index: AQHaMoR5yYTXNOv9Wk6xuFQFIX7sObDGdM0L
Date: Tue, 2 Jan 2024 11:23:00 +0000
Message-ID: 
 <CYXPR11MB87091986C150A9D067454778EF61A@CYXPR11MB8709.namprd11.prod.outlook.com>
References: 
 <SJ1PR11MB612945FEF0196ABDC4C53FFBEB97A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: 
 <SJ1PR11MB612945FEF0196ABDC4C53FFBEB97A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYXPR11MB8709:EE_|DM4PR11MB8226:EE_
x-ms-office365-filtering-correlation-id: e2ce72d7-9ca2-4ad4-4570-08dc0b852df9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K0iN8uRYANsVM0TRJTNbuLd7XNGGcYjcUaWQGD2h0+R2KE5Zppe1r7jhVG6I7PGz6RW9MrYhWrtfhmErnkcm5Bvtj0PXrBKeBdqnXoEwDpuXxm03WzDkgE9D17oGdudkKyS20xbkq6UbIAK6JpNY4d8OsbWb71CQrjXKnBiBUTc913GE4bw/g3Lww5gSrXys8YKQ9Ne/A3fTQ5nR08J9bhf6JQla1kvSl4tJtwWN4eTwMdr/iBBb2Sb63QilJbn6DhSu2TxuNOG7nhpHxsNm7PgDa1qZPTLhfMHkNUUS019E/ZftN8AMnNK0V36JEfUvOtZQEUBPpLNQTnz7K/mKQef/ajgBmyOdDS64uJQKaaZabhoo23UuLGV5QN6yqNLXH6qOdCBlP3VPhOY3ggNuse6LgiVSAP/wZLAl0hKvYHZ2wAxdGG/k5+h8RQI5UH9j89Wy0qHyqelWpJzMKyeWAV5QHm5odAIklZdFm0Zusun1a7pwK0N7zaTf0hyBk1+CFg5nKP8HxB/VRzXKp8/94mcsY8RRXpuvzWipaS3CPEnoHPMlel1/o4C5vheEGiYNMBiBEwtfWMvSaNXFFqptxsKNI7LFwKr8Y3ClalI9uolZeB8PAH2sSDNjH/5w52zP3rIygZV36j+Np90ZJ7WPgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR11MB8709.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(366004)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(122000001)(166002)(38070700009)(55016003)(86362001)(107886003)(26005)(7696005)(53546011)(71200400001)(6506007)(9686003)(64756008)(66446008)(52536014)(478600001)(316002)(54906003)(8676002)(966005)(8936002)(110136005)(76116006)(66946007)(66556008)(66476007)(4326008)(83380400001)(3480700007)(33656002)(41300700001)(15650500001)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?e8NdPicWmMOx7Ija5iwtoEzh6ZYYhfNPUi+VYigJzmYSDsj7IcyMgToT?=
 =?Windows-1252?Q?3opKFSfwDskteU5sCAOPi6rh5fnC7+4zGCPGGD89kXPHx2hHy+KISVXF?=
 =?Windows-1252?Q?eTKOkbjmSSsnWEhi3kYH7kbhnlzUijs6E7zJ3qNtEKAB8IpnqPfj4m9p?=
 =?Windows-1252?Q?bStxho2jS+89OJi2o0w3dWpHiL/VcqHwLj1MjviNBlmruw2IZ4Db3R4i?=
 =?Windows-1252?Q?HzMOzzljitcXjndtWS4tcN7Z8RTCgWaYYozprdkPz+CTEjGkRF53qvUF?=
 =?Windows-1252?Q?nJS4JOVm0dQnD6Wv2jeWf9F1eN/kEOzUmF8YpGmbHDxQLIWjHBmCkgYt?=
 =?Windows-1252?Q?cJ/l2+sTb+2Q59dqKggeZbmJ0IwfJqZw9DFFHDsdgWX50oCjr9M6nCr2?=
 =?Windows-1252?Q?L/oMl238pKOICWMZqtG3rnZ3Ibo8U5VrMaT8h8NaXAxPyqLGT2Ogg0I3?=
 =?Windows-1252?Q?GNSkq1HmdJ42KzpuAi5VWK/XZxzGSFLqYOd6wJR0queR4QCel55ZiYbW?=
 =?Windows-1252?Q?0CjvNFfCiW8wykZk5m2HPc0N2RAMqu2FTDSplW/z8Xq7dgXJMrR//J12?=
 =?Windows-1252?Q?Q3ygEQbJyoYX+bCaiXJz660xJekoxq8uXRpT9nYsUqD/V6zon0nK5Q/G?=
 =?Windows-1252?Q?VQ8LhQhoDloxH+khmlrAG+Wk8czK7M8PfSWxtinLp6KMgaIgq48qsY7r?=
 =?Windows-1252?Q?956iWRtUuKoQaVA7ObSt36cqnagyErbYJwbi7WHqHyWNq9vk+v69E8xX?=
 =?Windows-1252?Q?X+ao0D1vwTOXyrRMub47mxIQOa7xtEv5nx8qPNAPwV9TP+GjblnbZsIu?=
 =?Windows-1252?Q?j2Sj5mzGXWtReTVibUkZfO4HAtKNqTWDkR2P9LOpBSOUuLEwnI321/4m?=
 =?Windows-1252?Q?U1NCQJ2pswMSkRo0AFWpercdh0ioKP/IPW8vagQVKWWVLQtqen9/YIbd?=
 =?Windows-1252?Q?nlnn9uMVQwtNe0UFc7Yipub0Qlh6YGThpqH2T62hlk1IflTORJ57I+hb?=
 =?Windows-1252?Q?eHPZACa9EVTY56hIoy87WkIS92dRiyyRWXdRaW4UHaVHkyg+EgPYQQ5j?=
 =?Windows-1252?Q?Xf4rbOea5vH1sBvzw4TJXypwpkKoC29XFHt61nJ2jTr2F5U7tktAzJyl?=
 =?Windows-1252?Q?3te2DPLSZM3rWaFVBm82EYuOrUzWMSaAqIINMPwFSSvzMWglSLECwT3b?=
 =?Windows-1252?Q?4ywrwUWjupFnyMqhtvXgE7Ny0Xwzj8aT4AHycNGazS/ibjX9tLHEOoCf?=
 =?Windows-1252?Q?tZnE52lXeVdIi+GHIkdB2Euk5kuRG2FGfDaXOxaYX/sNGUG0AoQM8v4Y?=
 =?Windows-1252?Q?UYM+ceRlS0YuSMD68FI6oFux4ZTAcTObQUDmFs4xbhWnhJ9IjUEtExbL?=
 =?Windows-1252?Q?AYPbo3SRRo84PF7OzPQ9Bqz5orY3KOg5k1hHJCu++5X5TOfd2pyUuPF8?=
 =?Windows-1252?Q?plNPjhBo7f64BY/tf6kmJiFC/HbrPoCFPwDOc/aXGNPfyvO9KVMEjll3?=
 =?Windows-1252?Q?EB0sEUMQUTJiCNZS6PZMIUGBTxVRo5BClJy23ebHIUSgj6BN2YTj4Tgd?=
 =?Windows-1252?Q?lvjIR+6ooGa/faoM8e9mMbEHBT6dRsbBr2OM/Dym70N6yDCJRCkPREvC?=
 =?Windows-1252?Q?XDe5vCtXgzQL1FDr12+/dAw/ni4Khce7LvnxtDTzv7q9iXKsY1meAn66?=
 =?Windows-1252?Q?pXjCjcweHWCB6+9io0tUTt1YQLBbBYYOzHTq+yh8pDksOOOH6LixMnQa?=
 =?Windows-1252?Q?MnMLszUuqR/QrLeoHa8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CYXPR11MB87091986C150A9D067454778EF61ACYXPR11MB8709namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYXPR11MB8709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ce72d7-9ca2-4ad4-4570-08dc0b852df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 11:23:00.9285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2jSflaPBlmI/q6xWcYK2BylRUuEiP6YJugml9/s4rwRnAxAs+yTLA7N07HTcaqFR8QW+RslqF335uVgK9G7y4WQs0CDK0kXI/rKVzm2K7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-GUID: kkP6ft7GOO8weCr1Hsq_iQ7L2vik9u1E
X-Proofpoint-ORIG-GUID: kkP6ft7GOO8weCr1Hsq_iQ7L2vik9u1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=795
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 11:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193228

--_000_CYXPR11MB87091986C150A9D067454778EF61ACYXPR11MB8709namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


For the rust oe-selftest we are able to solve,
1. 'Z' unstable error &
2. Testing stage1 compiletest suite=3Ddebuginfo mode=3Ddebuginfo (x86_64-un=
known-linux-gnu -> x86_64-poky-linux-gnu)
thread 'main' panicked at src/tools/compiletest/src/common.rs:499:23: no en=
try found for key
with below patches.

1. 'Z' unstable error fix: For the =93error: the option `Z` is only accepte=
d on the nightly compiler =93 will be resolved by setting RUSTC_BOOTSTRAP=
=3D1 in rust.py
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -285,6 +285,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hos=
ttools.
             cmd =3D " export PATH=3D%s/recipe-sysroot-native/usr/bin:$PATH=
;" % rustlibpath
             cmd =3D cmd + " export TARGET_VENDOR=3D\"-poky\";"
+            cmd =3D cmd + " export RUSTC_BOOTSTRAP=3D1;"
             cmd =3D cmd + " export PATH=3D%s/recipe-sysroot-native/usr/bin=
/%s:%s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
             cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets;" % =
rustlibpath
             # Trigger testing.

2. no entry found for key fix: (Revered the patch  https://github.com/rust-=
lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5a4d95c79?diff=3Dsplit&w=3D=
0 and added dynamic_linking)
--- a/src/tools/compiletest/src/common.rs
+++ b/src/tools/compiletest/src/common.rs
@@ -465,7 +465,7 @@
            );
        }
-        for (target, cfg) in targets.iter() {
+        for (target, cfg) in targets.into_iter() {
           all_archs.insert(cfg.arch.clone());
           all_oses.insert(cfg.os.clone());
           all_oses_and_envs.insert(cfg.os_and_env());
@@ -476,11 +476,11 @@
            }
           all_pointer_widths.insert(format!("{}bit", cfg.pointer_width));
-           all_targets.insert(target.clone());
+           all_targets.insert(target.into());
        }
        Self {
-            current: Self::get_current_target_config(config, &targets),
+            current: Self::get_current_target_config(config),
           all_targets,
           all_archs,
            all_oses,
@@ -492,20 +492,15 @@
        }
    }
-    fn get_current_target_config(
-        config: &Config,
-        targets: &HashMap<String, TargetCfg>,
-    ) -> TargetCfg {
-        let mut cfg =3D targets[&config.target].clone();
-
-        // To get the target information for the current target, we take t=
he target spec obtained
-        // from `--print=3Dall-target-specs-json`, and then we enrich it w=
ith the information
-        // gathered from `--print=3Dcfg --target=3D$target`.
-        //
-        // This is done because some parts of the target spec can be overr=
idden with `-C` flags,
-        // which are respected for `--print=3Dcfg` but not for `--print=3D=
all-target-specs-json`. The
-        // code below extracts them from `--print=3Dcfg`: make sure to onl=
y override fields that can
-        // actually be changed with `-C` flags.
+    fn get_current_target_config(config: &Config) -> TargetCfg {
+        let mut arch =3D None;
+        let mut os =3D None;
+        let mut env =3D None;
+        let mut abi =3D None;
+        let mut families =3D Vec::new();
+        let mut pointer_width =3D None;
+        let mut endian =3D None;
+        let mut panic =3D None;
        for config in
           rustc_output(config, &["--print=3Dcfg", "--target", &config.targ=
et]).trim().lines()
        {
@@ -523,16 +518,61 @@
                })
               .unwrap_or_else(|| (config, None));
-            match (name, value) {
-                // Can be overridden with `-C panic=3D$strategy`.
-               ("panic", Some("abort")) =3D> cfg.panic =3D PanicStrategy::=
Abort,
-               ("panic", Some("unwind")) =3D> cfg.panic =3D PanicStrategy:=
:Unwind,
-               ("panic", other) =3D> panic!("unexpected value for panic cf=
g: {other:?}"),
-                _ =3D> {}
+               match name {
+                "target_arch" =3D> {
+                   arch =3D Some(value.expect("target_arch should be a key=
-value pair").to_string());
+                }
+               "target_os" =3D> {
+                   os =3D Some(value.expect("target_os sould be a key-valu=
e pair").to_string());
+                }
+               "target_env" =3D> {
+                   env =3D Some(value.expect("target_env should be a key-v=
alue pair").to_string());
+                }
+               "target_abi" =3D> {
+                    abi =3D Some(value.expect("target_abi should be a key-=
value pair").to_string());
+                }
+               "target_family" =3D> {
+                   families
+                       .push(value.expect("target_family should be a key-v=
alue pair").to_string());
+                }
+               "target_pointer_width" =3D> {
+                   pointer_width =3D Some(
+                       value
+                           .expect("target_pointer_width should be a key-v=
alue pair")
+                            .parse::<u32>()
+                           .expect("target_pointer_width should be a valid=
 u32"),
+                   );
+                }
+               "target_endian" =3D> {
+                   endian =3D Some(match value.expect("target_endian shoul=
d be a key-value pair") {
+                       "big" =3D> Endian::Big,
+                       "little" =3D> Endian::Little,
+                       _ =3D> panic!("target_endian should be either 'big'=
 or 'little'"),
+                   });
+                }
+               "panic" =3D> {
+                   panic =3D Some(match value.expect("panic should be a ke=
y-value pair") {
+                       "abort" =3D> PanicStrategy::Abort,
+                       "unwind" =3D> PanicStrategy::Unwind,
+                        _ =3D> panic!("panic should be either 'abort' or '=
unwind'"),
+                   });
+                }
+                _ =3D> (),
            }
        }
-        cfg
+        TargetCfg {
+            dynamic_linking: true,
+            arch: arch.expect("target configuration should specify target_=
arch"),
+            os: os.expect("target configuration should specify target_os")=
,
+            env: env.expect("target configuration should specify target_en=
v"),
+            abi: abi.expect("target configuration should specify target_ab=
i"),
+            families,
+           pointer_width: pointer_width
+               .expect("target configuration should specify target_pointer=
_width"),
+            endian: endian.expect("target configuration should specify tar=
get_endian"),
+            panic: panic.expect("target configuration should specify panic=
"),
+        }
    }
}

And, still there is an another error 'io::copy(&mut file, dst) failed with =
Connection reset by peer (os error 104)', this is also observed from rust 1=
.71 upgrade onwards and currently working on fixing that.

Thanks & Regards
Harish Sadineni
From: Shinde, Yash<mailto:Yash.Shinde@windriver.com>
Sent: Tuesday, December 19, 2023 7:58 PM
To: Patches and discussions about the oe-core layer<mailto:openembedded-cor=
e@lists.openembedded.org>
Cc: MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>; Kokkonda, Sundeep<m=
ailto:Sundeep.Kokkonda@windriver.com>; Gowda, Naveen<mailto:Naveen.Gowda@wi=
ndriver.com>; Sadineni, Harish<mailto:Harish.Sadineni@windriver.com>; Mooda=
lappa, Shivaprasad<mailto:Shivaprasad.Moodalappa@windriver.com>; Kallapa, U=
mesh<mailto:Umesh.Kallapa@windriver.com>
Subject: Rust Oe-selftest Updates

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


--_000_CYXPR11MB87091986C150A9D067454778EF61ACYXPR11MB8709namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.elementtoproof
	{mso-style-name:elementtoproof;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For the rust oe-selftest we are able to solve,</p>
<p class=3D"MsoNormal">1. 'Z' unstable error &amp; </p>
<p class=3D"MsoNormal">2. Testing stage1 compiletest suite=3Ddebuginfo mode=
=3Ddebuginfo (x86_64-unknown-linux-gnu -&gt; x86_64-poky-linux-gnu)</p>
<p class=3D"MsoNormal">thread 'main' panicked at src/tools/compiletest/src/=
common.rs:499:23: no entry found for key</p>
<p class=3D"MsoNormal">with below patches.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. 'Z' unstable error fix: For the =93error: the opt=
ion `Z` is only accepted on the nightly compiler =93 will be resolved by se=
tting RUSTC_BOOTSTRAP=3D1 in rust.py</p>
<p class=3D"MsoNormal">--- a/meta/lib/oeqa/selftest/cases/rust.py</p>
<p class=3D"MsoNormal">+++ b/meta/lib/oeqa/selftest/cases/rust.py</p>
<p class=3D"MsoNormal">@@ -285,6 +285,7 @@ class RustSelfTestSystemEmulated=
(OESelftestTestCase, OEPTestResultTestCase):</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; # Set path for target-poky-linux-gcc, RUST_TARGET_PATH=
 and hosttools.</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; cmd =3D &quot; export PATH=3D%s/recipe-sysroot-native/=
usr/bin:$PATH;&quot; % rustlibpath</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; cmd =3D cmd + &quot; export TARGET_VENDOR=3D\&quot;-po=
ky\&quot;;&quot;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cmd =3D cmd + &quot; export RUSTC_BOOTSTRAP=3D1;&quot;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; cmd =3D cmd + &quot; export PATH=3D%s/recipe-sysroot-n=
ative/usr/bin/%s:%s/hosttools:$PATH;&quot; % (rustlibpath, tcpath, tmpdir)<=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; cmd =3D cmd + &quot; export RUST_TARGET_PATH=3D%s/rust=
-targets;&quot; % rustlibpath</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; # Trigger testing.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. no entry found for key fix: (Revered the patch&nb=
sp; https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3=
a5a4d95c79?diff=3Dsplit&amp;w=3D0 and added dynamic_linking)</p>
<p class=3D"MsoNormal">--- a/src/tools/compiletest/src/common.rs</p>
<p class=3D"MsoNormal">+++ b/src/tools/compiletest/src/common.rs</p>
<p class=3D"MsoNormal">@@ -465,7 +465,7 @@</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; );</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (tar=
get, cfg) in targets.iter() {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (tar=
get, cfg) in targets.into_iter() {</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_archs.insert(cfg.arch.clone());</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_oses.insert(cfg.os.clone());</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_oses_and_envs.insert(cfg.os_and_env());</p>
<p class=3D"MsoNormal">@@ -476,11 +476,11 @@</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_pointer_widths.insert(format!(&quot;{}bit&quot;, cfg.pointer_w=
idth));</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; all_targets.insert(target.clone());</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; all_targets.insert(target.into());</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Self=
 {</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; current: Self::get_current_target_config(config, &amp;targe=
ts),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; current: Self::get_current_target_config(config),</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_targets,</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; all_archs,</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; all_oses,</p>
<p class=3D"MsoNormal">@@ -492,20 +492,15 @@</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; fn get_current_target_config(</p=
>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config: =
&amp;Config,</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;targets:=
 &amp;HashMap&lt;String, TargetCfg&gt;,</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; ) -&gt; TargetCfg {</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
cfg =3D targets[&amp;config.target].clone();</p>
<p class=3D"MsoNormal">-</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // To ge=
t the target information for the current target, we take the target spec ob=
tained</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // from =
`--print=3Dall-target-specs-json`, and then we enrich it with the informati=
on</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // gathe=
red from `--print=3Dcfg --target=3D$target`.</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This =
is done because some parts of the target spec can be overridden with `-C` f=
lags,</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // which=
 are respected for `--print=3Dcfg` but not for `--print=3Dall-target-specs-=
json`. The</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // code =
below extracts them from `--print=3Dcfg`: make sure to only override fields=
 that can</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // actua=
lly be changed with `-C` flags.</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp; fn get_current_target_config(con=
fig: &amp;Config) -&gt; TargetCfg {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
arch =3D None;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
os =3D None;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
env =3D None;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
abi =3D None;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
families =3D Vec::new();</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
pointer_width =3D None;</p>
<p class=3D"MsoNormal">+&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;let mut =
endian =3D None;</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let mut =
panic =3D None;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for confi=
g in</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; rustc_output(config, &amp;[&quot;--print=3Dcfg&quot;, &quot;--targ=
et&quot;, &amp;config.target]).trim().lines()</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</p>
<p class=3D"MsoNormal">@@ -523,16 +518,61 @@</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unwrap_or_else(|| (config, None));</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; match (name, value) {</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Can be overridden with `-C panic=
=3D$strategy`.</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&quot;panic&quot;, Some(&quot;abort&quot=
;)) =3D&gt; cfg.panic =3D PanicStrategy::Abort,</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&quot;panic&quot;, Some(&quot;unwind&quo=
t;)) =3D&gt; cfg.panic =3D PanicStrategy::Unwind,</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&quot;panic&quot;, other) =3D&gt; panic!=
(&quot;unexpected value for panic cfg: {other:?}&quot;),</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _ =3D&gt; {}</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; match name {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_arch&quot; =3D&gt; {</=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch =3D Some(val=
ue.expect(&quot;target_arch should be a key-value pair&quot;).to_string());=
</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_os&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os =3D Some(value=
.expect(&quot;target_os sould be a key-value pair&quot;).to_string());</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_env&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; env =3D Some(valu=
e.expect(&quot;target_env should be a key-value pair&quot;).to_string());</=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_abi&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi =3D Som=
e(value.expect(&quot;target_abi should be a key-value pair&quot;).to_string=
());</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_family&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; families</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; .push(value.expect(&quot;target_family should be a key-value pair&qu=
ot;).to_string());</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_pointer_width&quot; =3D&gt; =
{</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pointer_width =3D=
 Some(</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; value</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .expect(&quot;target_pointer_width should be=
 a key-value pair&quot;)</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .parse::&lt;u32&gt;()</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .expect(&quot;target_pointer_width should be=
 a valid u32&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;target_endian&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;endian =3D Some(m=
atch value.expect(&quot;target_endian should be a key-value pair&quot;) {</=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;big&quot; =3D&gt; Endian::Big,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;little&quot; =3D&gt; Endian::Little,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; _ =3D&gt; panic!(&quot;target_endian should be either 'big' or 'litt=
le'&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;panic&quot; =3D&gt; {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; panic =3D Some(ma=
tch value.expect(&quot;panic should be a key-value pair&quot;) {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;abort&quot; =3D&gt; PanicStrategy::Abort,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;unwind&quot; =3D&gt; PanicStrategy::Unwind,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; _ =3D&gt; panic!(&quot;panic should be either 'abort' or 'unwi=
nd'&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _ =3D&gt; (),</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cfg</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TargetCf=
g {</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dynamic_linking: true,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; arch: arch.expect(&quot;target configuration should specify=
 target_arch&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; os: os.expect(&quot;target configuration should specify tar=
get_os&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; env: env.expect(&quot;target configuration should specify t=
arget_env&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; abi: abi.expect(&quot;target configuration should specify t=
arget_abi&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; families,</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pointer_width: pointer_width</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .expect(&quot;target configuration should=
 specify target_pointer_width&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; endian: endian.expect(&quot;target configuration should spe=
cify target_endian&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;panic: panic.expect(&quot;target configuration should speci=
fy panic&quot;),</p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">}</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And, still there is an another error 'io::copy(&amp;=
mut file, dst) failed with Connection reset by peer (os error 104)', this i=
s also observed from rust 1.71 upgrade onwards and currently working on fix=
ing that.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks &amp; Regards <o:p></o:p></p>
<p class=3D"MsoNormal">Harish Sadineni<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br>
<b>Sent: </b>Tuesday, December 19, 2023 7:58 PM<br>
<b>To: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">Patc=
hes and discussions about the oe-core layer</a><br>
<b>Cc: </b><a href=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a=
>; <a href=3D"mailto:Sundeep.Kokkonda@windriver.com">
Kokkonda, Sundeep</a>; <a href=3D"mailto:Naveen.Gowda@windriver.com">Gowda,=
 Naveen</a>;
<a href=3D"mailto:Harish.Sadineni@windriver.com">Sadineni, Harish</a>; <a h=
ref=3D"mailto:Shivaprasad.Moodalappa@windriver.com">
Moodalappa, Shivaprasad</a>; <a href=3D"mailto:Umesh.Kallapa@windriver.com"=
>Kallapa, Umesh</a><br>
<b>Subject: </b>Rust Oe-selftest Updates</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;color:black">I tested r=
ust oe-selftest with Alex's rust: Upgrade 1.71.1 -&gt; 1.74.1 patch(<a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/192277">http=
s://lists.openembedded.org/g/openembedded-core/message/192277</a>)
 and still the same failures are observed as seen in the earlier versions.&=
nbsp;</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black">Currently, we are checking the root cause=
 of this issue and trying to check the required target specifications for p=
oky target(x86_64-poky-linux-gnu).<br>
<br>
<i>error: the option `Z` is only accepted on the nightly compiler<br>
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
race</i></span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;color:black"><a href=3D=
"https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5a=
4d95c79?diff=3Dsplit&amp;w=3D0#:~:text=3D//%20To%20get%20the,with%20%60%2DC=
%60%20flags.">https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1=
d8d20472f3a5a4d95c79?diff=3Dsplit&amp;w=3D0#:~:text=3D//%20To%20get%20the,w=
ith%20%60%2DC%60%20flags.</a></span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black">From rust 1.72, as mentioned in the comme=
nts(in above commit), the '<i>get_current_target_config()</i>' function fet=
ches the target specs using '<i>--print=3Dall-target-specs-json</i>'
 and '<i>--print=3Dcfg --target=3D$target</i>' but that's not working in th=
is case and gives the following error as the rust built is stable one.<br>
<br>
Note: These changes are in the same file(<i>src/tools/compiletest/src/commo=
n.rs</i>&nbsp;in rust) which was added in '<i>bootstrap_fail.patch</i>' dur=
ing rust 1.70 oe-selftest.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span class=3D"elementtoproof"><span style=3D"font-s=
ize:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;color:black">(<a href=
=3D"https://git.openembedded.org/openembedded-core/commit/meta/recipes-devt=
ools/rust/files?id=3Da48e3612b5dc0e58a89f88a914365e926101c90b">https://git.=
openembedded.org/openembedded-core/commit/meta/recipes-devtools/rust/files?=
id=3Da48e3612b5dc0e58a89f88a914365e926101c90b</a>)</span></span><span style=
=3D"font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;color:black">=
<br>
<br>
<span class=3D"elementtoproof">We are checking on reverting those changes a=
nd make the target specs fetch again as it was in 1.70 but that gives furth=
er dependency failures-</span><br>
<br>
<i>error: process didn't exit successfully: `/build-st/tmp/work/core2-64-po=
ky-linux/rust/1.73.0/rustc-1.73.0-src/build/bootstrap/debug/rustc -vV` (exi=
t status: 101)</i></span><o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">--- stderr</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">thread 'main' panicked at '</span></i>=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">Failed to run:</span></i><o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">LD_LIBRARY_PATH=3D&quot;/build-st/tmp/=
work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/build/x86_64-poky-lin=
ux-gnu/stage0-sysroot/lib:/home/testuser/lib&quot; &quot;/build-st/tmp/work=
/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/build/x86_64-poky-linux-g=
nu/stage0-sysroot/bin/rustc&quot;
 &quot;-vV&quot; &quot;-Wrust_2018_idioms&quot; &quot;-Wunused_lifetimes&qu=
ot; &quot;-Wsemicolon_in_expressions_from_macros&quot; &quot;-Dwarnings&quo=
t; &quot;-Clinker=3D/build-st/tmp/work/core2-64-poky-linux/rust/1.73.0/wrap=
per/target-rust-ccld&quot; &quot;--cfg=3Dbootstrap&quot; &quot;-Zunstable-o=
ptions&quot; &quot;--check-cfg=3Dvalues(bootstrap)&quot;
 &quot;--remap-path-prefix&quot; &quot;/build-st/tmp/work/core2-64-poky-lin=
ux/rust/1.73.0/rustc-1.73.0-src=3D/rustc/cc66ad468955717ab92600c770da8c1601=
a4ff33&quot; &quot;-Z&quot; &quot;force-unstable-if-unmarked&quot;</span></=
i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">-------------: Os { code: 2, kind: Not=
Found, message: &quot;No such file or directory&quot; }', bin/rustc.rs:230:=
37</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">stack backtrace:</span></i><o:p></o:p>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;0: rust_begin_unwind</spa=
n></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/std/sr=
c/panicking.rs:593:5</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;1: core::panicking::panic=
_fmt</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/s=
rc/panicking.rs:67:14</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;2: core::result::unwrap_f=
ailed</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/s=
rc/result.rs:1651:5</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;3: core::result::Result&l=
t;T,E&gt;::expect</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/s=
rc/result.rs:1033:23</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;4: rustc::main</span></i>=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at ./src/bootstrap/bin/rustc.rs:230:25</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp;5: core::ops::function::F=
nOnce::call_once</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;at /rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/s=
rc/ops/function.rs:250:5</span></i><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12.0pt;font-family:&quot=
;Aptos&quot;,sans-serif;color:black">note: Some details are omitted, run wi=
th `RUST_BACKTRACE=3Dfull` for a verbose backtrace.</span></i><o:p></o:p></=
p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black">On analysing it, there was no '<i>rustc</=
i>' binary created at&nbsp;&nbsp;<i><span style=3D"background:white">/build=
-st/tmp/work/core2-64-poky-linux/rust/1.73.0/rustc-1.73.0-src/build/x86_64-=
poky-linux-gnu/stage0-sysroot/bin/rustc&nbsp;
 (no bin directory is created). </span></i><span style=3D"background:white"=
>Finding the reason for this<i>.</i></span></span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div id=3D"Signature">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black">Regards,<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ap=
tos&quot;,sans-serif;color:black">Yash<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CYXPR11MB87091986C150A9D067454778EF61ACYXPR11MB8709namp_--

