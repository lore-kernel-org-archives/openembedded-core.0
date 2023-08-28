Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C55DC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 08:44:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.9340.1693212261900783310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 01:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=tCY8StPu;
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTTxtc6xkXALm2yk/7a76w3EiS4qu18sVIPgieUVqWMj/dN9N59/FLtDRz3pTzABwx9lvlbAgMweuipxAf8yqM04TABNEKG3kinZ8S0MvZBnyEHrfqVzP197wMzqjTljrUpav+rTefTxA+mXJ/bFPOgpSW4j4/wMLBbqTZXNVN/M+/W2sNwKRNISegqgo3h2WQyiAOlq2rPE7Em92s0ibJ8PARGux4pau49ibA5AYA86gNdTFRv0j3i3Y0WBTd9k9dq629ShTagSmaGIidaPFO3zso0pEbjFBAbNTmW+s3gnnV06p4zq0Asn7R9SNeMtvrTyovT4Cyq70/G2zKI5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug40iaq86Oe3wQal/NI5+qz1AmkIKa+5D0SX5T3GT2Q=;
 b=LzFiQJRNyrhcAFnkpvvhCgrrXgTUj4fI6DAsDzgpn1PDlynYM5YrvNVh6nXNp8SUmGYvfqauvMkm8XgpcbIzRDBl/vU2ZSmimWDHNv79drdEyNoS0vZWz21dFWtvIxcSCGaft+fZYgJyqq++JVlPC8SZI6mYoeWgNfBWr+gaBjLe5ce+jSy7RMD/ZO5vW9PzyVZ5gp7XH/gueGbPkt1UBU8Pf2/oOhoAySQPKRHNHuUvteyckKReakbeQzoPzkf79gyTHSeCZ9EaI+ITinBDuNIKV5AgchAHXjPCX+exQ4dk5CBruLfoEPLstM8+EtM3LnBn1GTV5KFpWuP2UnAPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug40iaq86Oe3wQal/NI5+qz1AmkIKa+5D0SX5T3GT2Q=;
 b=tCY8StPuGxSEIEOtvXNMDVe29G6e1m0oAtQ/EmpVXRJfW1j+oYeXPfSvUGUzRf5P/ecjWfz05YjInlGoT0kk4jyREyJx2+xNxVtrBqnn31Mi02yKJiUshzWUeWNIpDnE3eBM/H2yqryMgM6+vEbXoalaQ4acCjKth2S6cUbPlA2rI7gb3DOPV2uZ/2HrhqucJxwk3YbrIr1+BMEiAI9iSn3no/F8qaNka+JOJrpMesSZTLGo93lR1P6SHxiF8rF0kf1RtlSW2tXVfhmScmrvsmTDBX+efSZrbj1KJteHM48bs3AwMu5pNpCW4/XKsCM4pAo4Pl9wdyFgE4vA+jKbbg==
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 08:44:15 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::8fc1:4de7:8494:591b]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::8fc1:4de7:8494:591b%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 08:44:14 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs
 and xattr
Thread-Topic: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs
 and xattr
Thread-Index: AQHZxq/5VJ6huZnMJ0aYyNqTpGjM0a/5JieAgAZjZ1M=
Date: Mon, 28 Aug 2023 08:44:14 +0000
Message-ID: 
 <VI1PR04MB537337326938DAE0CF93155891E0A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
	 <20230804084315.55768-4-p.lobacz@welotec.com>
 <38b47e0e41d508adc514058475474befbbf53445.camel@linuxfoundation.org>
In-Reply-To: 
 <38b47e0e41d508adc514058475474befbbf53445.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB9331:EE_
x-ms-office365-filtering-correlation-id: 476d1d0f-1e42-4f3f-ab9c-08dba7a2f58f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UI/2qglEvHTBwEda+f/MjCweccepyfqTmbVWpxQS40HkrfKM/DlvOFYak/ejbXS/yhgNMFb1+7IqdpSasKgf1Yca62ZhQFb7gk9CRe1qNwqbJOucKBmcWQXAjQN1VcAjcwh6gQdvfPugzAqWJlO0tNEEl7RdssqZSzDetxXpD+ExphSJxcLPns2v/xf/mTZu9k0VWQ6+Wxw08hdVATkmYPVi4QE+v4V5IteWHZ2efcxOLw9zXxRh7ILOgkRwrdx/PDOmWfB8teRSQfkCeU6Y5HxiPov74LBGamYUPwFRubXR2daV3r6tya83rTuIp0jcVzurglc6JejgnKqC9N/4syexrBSjSdNEs3SRWzg+RzPm4V38cylvfSWQ5K25vkMNyx8mfk0ys6ykzHlMtH8fZicAZYpAFU4G/YSqQYzukrfYK0O4c2BEmRyp+zSmbsfEcm9DwSAIbWCAt/0pZsM1KWWEQyLW3M+nRPoirjNi0ZE9NMz+aR/tGKPnVOPReGwe3B4adpwWfvhJEjXczQKhMU3oMXGwaAd5FbSWeZXc0i6uweduLbKabbjgEQgO5tjhnATDQwewkuCEiIBdicnftgNqK/s7LptpFWQyXvgSrsPJzmPIssz2ACJFZ1XAr+n2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39830400003)(451199024)(1800799009)(186009)(83380400001)(478600001)(966005)(122000001)(26005)(19627405001)(66574015)(9686003)(110136005)(166002)(6506007)(71200400001)(55016003)(7696005)(30864003)(5660300002)(86362001)(2906002)(316002)(33656002)(52536014)(76116006)(91956017)(45080400002)(38100700002)(66946007)(64756008)(66556008)(66476007)(8676002)(8936002)(41300700001)(66446008)(38070700005)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?Jmx2W1uH5oJmImfgzORDYT5XlZ4bo4/lygzbAYkk+8xfE/vFsGT4waDo9h?=
 =?iso-8859-2?Q?Mi1wRxu+H4IeXd6h08li8bPJnNWCN81krcSciLEPCl7sX2x5GAeT8ydKiG?=
 =?iso-8859-2?Q?uUs0QE20rbceDeMPl85KGXLnb9p26voZA9vWflO7STkyMQnCS/NdhFhAsR?=
 =?iso-8859-2?Q?visPPEduDzSmdzYylcy/pZppIkQeMbcRUCoJTdTZgkS8wPs+BF6Muglq2b?=
 =?iso-8859-2?Q?iqAoH9TLvaNjYW2uRvze4MCg8fQDchw4ur2OIUCpovAx6PWCd+hbMECgjU?=
 =?iso-8859-2?Q?gnO+P8y1VR8JPD5sfn1Dx1rtITi9kkEx+Qm8k/zuJUTxzqhngRoX9cQppx?=
 =?iso-8859-2?Q?8EE3np+ACA6MllE6KE5PHkQzXJn3/BVoUmZbwvYzTKMsRRwg8ghY2MRS4J?=
 =?iso-8859-2?Q?tRAlpijjFjNWH1P5Uo/RvD35/Fk0OhUGWQii0IM7UwN7fXXj+VJ6ntj/pz?=
 =?iso-8859-2?Q?VDsssaXyMPp6OjdZkf+5DS69WQJMbwXbL8No/zw0Z51whZfGv36wQ7YOuq?=
 =?iso-8859-2?Q?O8NKP6jw3o8G9LeMqD31zcGULI/x0QBsMepXFt1KmnhuKHg7NAW/CV+fDH?=
 =?iso-8859-2?Q?Q8iFKV1O2XtXGuQMEQcvgSIAGbgp8nxvQ69m8WxKKf0A4T5pu4ydwkJO+R?=
 =?iso-8859-2?Q?TtZHNVHX7nzxmOeTG+rqvqg0Y4ZsHhaQCbiIGZ0kLyTN0SY7F6HFi6qc2Z?=
 =?iso-8859-2?Q?E6LeqxmqUU/hTQE+9DnyPEb2GU6c9aLDoZZO6RzPILL2nj3UDh4FFk3f9j?=
 =?iso-8859-2?Q?h9wjoyp1CpcrTiqGAvT2+eUhw9BW4xZYuC96bZhKMqeOUXJnPtKmKBYjbo?=
 =?iso-8859-2?Q?tMl2TdiPARwb17jQB5pFtlF9j+U5Oo9v8DblK/79+oIBr59O+h9sd6hi6m?=
 =?iso-8859-2?Q?RpqyJcpM9auLKRH7f5iSK8Xb8UlAWxuLovkoQZlBq00a3E8Qkd2H4EQCsh?=
 =?iso-8859-2?Q?ZrrGK9EeNqylSvae1mlEWBXfm9xf1/AiXHV3O2AQ5t3K+OsHTJiOSL7k1Y?=
 =?iso-8859-2?Q?DQ9c+J+arsvsHaL8k5MNPAA/seQ47qudQgb5VpLq5ZO76Kimj8IX76q+aF?=
 =?iso-8859-2?Q?9F7S0SVP8yHqq44JLET5pyd38Qkut5y+3E0pkaDQydrEmLuRyyrPbG1aM5?=
 =?iso-8859-2?Q?GJzy/dL+gy9vib6WU16wpZOQOYvjZAQJfK/NrPn77dtgIxjDgOcCrDzqcT?=
 =?iso-8859-2?Q?imrIupIFN57t0WVoAxAOpI0YOakcG18mNVu9QvTm1jU0mhur0aJGjwJOJr?=
 =?iso-8859-2?Q?XK1ringALxXO8/xJbWlpbKNOQwex/fdyEI/MDHxrLJqShHlEVnnJnsmK3a?=
 =?iso-8859-2?Q?KCUg4AWaCq82oiwML17eWMTRRhBT2U+4iLf7zmLyeRYg2ph/2Zmia9iS0o?=
 =?iso-8859-2?Q?wOIvA2Rjr2UV9CupqzT5HBu6S+XdiYdCX3WBSDP8kFqDmHANzSB8mPbiWc?=
 =?iso-8859-2?Q?+hbuhJHxmykmKMlj689bxF+A8Kz3+06p6EUyXbbpWHxcxVxAy4vqhHTDYI?=
 =?iso-8859-2?Q?2s1ipAeSMcBbbZxksnm5nCQVsz7/NBhvVA9GMBieKlU7/Qai/C/j5nXYgK?=
 =?iso-8859-2?Q?bF0bCCgew2FVLkVsUNaG4HPLKmmbJde2wmLiZaw+m5PoW9NAT+0uMdcXwB?=
 =?iso-8859-2?Q?jmrmIDSuwN3oE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB537337326938DAE0CF93155891E0AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476d1d0f-1e42-4f3f-ab9c-08dba7a2f58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 08:44:14.9378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxRkTCeMgLTtoJapogcIoFDxnoG2cF+b6Wf4Tk6Yrx0hYOdvp/12yWLv7KuNEGjdN3iCGRQlOQz0NPUeF01hWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 08:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186819

--_000_VI1PR04MB537337326938DAE0CF93155891E0AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I have discovered in here https://savannah.gnu.org/bugs/?59184 that this is=
 a bug in tar, which is already reported. The solution, which is given out =
there is ugly, but on the other hand solution which will be added to tar wi=
ll cause also to update machines so we need probably to discuss the best op=
tion for us...

BR
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: czwartek, 24 sierpnia 2023 09:08
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs an=
d xattr

On Fri, 2023-08-04 at 10:43 +0200, Piotr =A3obacz wrote:
Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 95373fd60a..ac890fc98e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -848,7 +848,7 @@ sstate_create_package () {
         mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
         TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`

-       OPT=3D"-cS"
+       OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'ac=
l', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--x=
attrs', '', d)} --numeric-owner -cS"
         ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
         # Use pzstd if available
         if [ -x "$(command -v pzstd)" ]; then
@@ -914,7 +914,7 @@ sstate_unpack_package () {
                 ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
         fi

-       tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+       tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xatt=
r', '--xattrs', '', d)} -xvpf ${SSTATE_PKG}
         # update .siginfo atime on local/NFS mirror if it is a symbolic li=
nk
         [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] |=
| touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
         # update each symbolic link instead of any referenced file

I've been putting this through a bit more testing and sadly we're still not=
 quite there. In testing last night we saw a lot of failures like this:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F58%2Fbuilds%2F7488&data=
=3D05%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25=
111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&sdata=3DmylIx0P4MLeBaFZclc47CMwX7%2FhEliHECp6e1POGtIg%3D&r=
eserved=3D0<https://autobuilder.yoctoproject.org/typhoon/#/builders/58/buil=
ds/7488>

i.e.:

WARNING: cdrtools-native-3.01-r0 do_populate_sysroot_setscene: ExecutionErr=
or('/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrt=
ools-native/3.01/temp/run.sstate_unpack_package.1434763', 2, None, None)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/w=
ic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/log.do_popul=
ate_sysroot_setscene.1434763
WARNING: Setscene task (/home/pokybuild/yocto-worker/wic/build/meta/recipes=
-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot_setscene) fa=
iled with exit code '1' - real task will be run instead

The sstate in question is this file:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsstate.y=
octoproject.org%2Fall%2Funiversal%2Faa%2F63%2Fsstate%3Acdrtools-native%3Ax8=
6_64-linux%3A3.01%3Ar0%3Ax86_64%3A11%3Aaa6350f6565599ed04df25250bb5415c0e24=
27b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst&data=3D05%7C01%7Cp.lo=
bacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4c=
a7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
sdata=3DIDBC6nZHweWglSxrBrGi2S%2BcXtgAk0CIbs6BX72eolo%3D&reserved=3D0<http:=
//sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x86_64=
-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039=
f4e21820ee6aec_populate_sysroot.tar.zst>

and the failing task log:

pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linu=
x/cdrtools-native/3.01/temp$ cat log.do_populate_sysroot_setscene
DEBUG: Executing python function do_populate_sysroot_setscene
DEBUG: Executing shell function sstate_unpack_package
recipe-sysroot-native/
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/sysroot-providers/cdrtools-native
recipe-sysroot-native/usr/
recipe-sysroot-native/usr/bin/
recipe-sysroot-native/usr/bin/cdda2ogg
recipe-sysroot-native/usr/bin/cdda2wav
recipe-sysroot-native/usr/bin/mkhybrid
recipe-sysroot-native/usr/bin/devdump
recipe-sysroot-native/usr/bin/isodebug
recipe-sysroot-native/usr/bin/scgskeleton
recipe-sysroot-native/usr/bin/btcflash
recipe-sysroot-native/usr/bin/cdrecord
recipe-sysroot-native/usr/bin/readcd
recipe-sysroot-native/usr/bin/isoinfo
recipe-sysroot-native/usr/bin/isodump
recipe-sysroot-native/usr/bin/cdda2mp3
recipe-sysroot-native/usr/bin/scgcheck
recipe-sysroot-native/usr/bin/mkisofs
recipe-sysroot-native/usr/bin/isovfy
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/sbin/rscsi
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/lib/libfind.a
recipe-sysroot-native/usr/lib/libschily.a
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
recipe-sysroot-native/usr/lib/libhfs.a
recipe-sysroot-native/usr/lib/libcdrdeflt.a
recipe-sysroot-native/usr/lib/libscg.a
recipe-sysroot-native/usr/lib/libfile.a
recipe-sysroot-native/usr/lib/siconv/
recipe-sysroot-native/usr/lib/siconv/cp10006
recipe-sysroot-native/usr/lib/siconv/iso8859-16
recipe-sysroot-native/usr/lib/siconv/iso8859-9
recipe-sysroot-native/usr/lib/siconv/cp10007
recipe-sysroot-native/usr/lib/siconv/cp10029
recipe-sysroot-native/usr/lib/siconv/iso8859-6
recipe-sysroot-native/usr/lib/siconv/iso8859-4
recipe-sysroot-native/usr/lib/siconv/cp1257
recipe-sysroot-native/usr/lib/siconv/iso8859-13
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-2
recipe-sysroot-native/usr/lib/siconv/cp437
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp775
recipe-sysroot-native/usr/lib/siconv/iso8859-15
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp857
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1258
recipe-sysroot-native/usr/lib/siconv/cp855
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp864
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-5
recipe-sysroot-native/usr/lib/siconv/cp1254
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-1
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp861
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/koi8-u
recipe-sysroot-native/usr/lib/siconv/cp10081
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot openrecipe-sysroo=
t-native/usr/lib/siconv/iso8859-14
: Permission denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp852
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1250
recipe-sysroot-native/usr/lib/siconv/cp10000
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp737
recipe-sysroot-native/usr/lib/siconv/iso8859-11
recipe-sysroot-native/usr/lib/siconv/cp866
recipe-sysroot-native/usr/lib/siconv/cp860
recipe-sysroot-native/usr/lib/siconv/iso8859-7
recipe-sysroot-native/usr/lib/siconv/iso8859-8
recipe-sysroot-native/usr/lib/siconv/cp869
recipe-sysroot-native/usr/lib/siconv/iso8859-10
recipe-sysroot-native/usr/lib/siconv/cp1252
recipe-sysroot-native/usr/lib/siconv/cp850
recipe-sysroot-native/usr/lib/siconv/cp863
recipe-sysroot-native/usr/lib/siconv/cp865
recipe-sysroot-native/usr/lib/siconv/cp1255
recipe-sysroot-native/usr/lib/siconv/cp1256
recipe-sysroot-native/usr/lib/siconv/koi8-r
recipe-sysroot-native/usr/lib/siconv/cp1253
recipe-sysroot-native/usr/lib/siconv/cp862
recipe-sysroot-native/usr/lib/siconv/cp10079
recipe-sysroot-native/usr/lib/siconv/cp874
recipe-sysroot-native/usr/lib/siconv/cp1251
recipe-sysroot-native/usr/lib/siconv/iso8859-3
recipe-sysroot-native/usr/lib/libparanoia.a
recipe-sysroot-native/usr/lib/libdeflt.a
recipe-sysroot-native/usr/lib/profiled/
recipe-sysroot-native/usr/lib/profiled/libfind.a
recipe-sysroot-native/usr/lib/profiled/libschily.a
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
recipe-sysroot-native/usr/lib/profiled/libhfs.a
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
recipe-sysroot-native/usr/lib/profiled/libscg.a
recipe-sysroot-native/usr/lib/profiled/libfile.a
recipe-sysroot-native/usr/lib/profiled/libparanoia.a
recipe-sysroot-native/usr/lib/profiled/libdeflt.a
recipe-sysroot-native/usr/lib/profiled/libmdigest.a
recipe-sysroot-native/usr/lib/profiled/librscg.a
recipe-sysroot-native/usr/lib/profiled/libsiconv.a
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
recipe-sysroot-native/usr/lib/libmdigest.a
recipe-sysroot-native/usr/lib/librscg.a
recipe-sysroot-native/usr/lib/libsiconv.a
recipe-sysroot-native/usr/lib/libedc_ecc.a
recipe-sysroot-native/usr/lib/libscgcmd.a
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/include/scg/
recipe-sysroot-native/usr/include/scg/scgio.h
recipe-sysroot-native/usr/include/scg/scsidefs.h
recipe-sysroot-native/usr/include/scg/scsicdb.h
recipe-sysroot-native/usr/include/scg/scgcmd.h
recipe-sysroot-native/usr/include/scg/scsireg.h
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/scsitransp.h
recipe-sysroot-native/usr/include/scg/srb_os2.h
recipe-sysroot-native/usr/include/scg/scgops.h
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/aspi-win32.h
recipe-sysroot-native/usr/include/scg/spti-wnt.h
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/aspi-dos.h
recipe-sysroot-native/usr/include/scg/scsisense.h
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/
recipe-sysroot-native/usr/include/schily/checkerr.h
recipe-sysroot-native/usr/include/schily/locale.h
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/timeb.h
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/time.h
recipe-sysroot-native/usr/include/schily/stdint.h
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/inttypes.h
recipe-sysroot-native/usr/include/schily/io.h
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/stdio.h
recipe-sysroot-native/usr/include/schily/siconv.h
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/deflts.h
recipe-sysroot-native/usr/include/schily/math.h
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot openrecipe-sys=
root-native/usr/include/schily/schilyp.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/systeminfo.h
recipe-sysroot-native/usr/include/schily/device.h
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot openrecipe-s=
ysroot-native/usr/include/schily/limits.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/alloca.h
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ioctl.h
recipe-sysroot-native/usr/include/schily/maxpath.h
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/fnmatch.h
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/times.h
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sem.h
recipe-sysroot-native/usr/include/schily/err_arch.h
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/signal.h
recipe-sysroot-native/usr/include/schily/standard.h
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wchar.h
recipe-sysroot-native/usr/include/schily/in.h
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/libport.h
recipe-sysroot-native/usr/include/schily/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/termcap.h
recipe-sysroot-native/usr/include/schily/rmtio.h
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/assert.h
recipe-sysroot-native/usr/include/schily/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/sigblk.h
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stat.h
recipe-sysroot-native/usr/include/schily/intcvt.h
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stkframe.h
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/mman.h
recipe-sysroot-native/usr/include/schily/wctype.h
recipe-sysroot-native/usr/include/schily/dlfcn.h
recipe-sysroot-native/usr/include/schily/hostname.h
recipe-sysroot-native/usr/include/schily/wait.h
recipe-sysroot-native/usr/include/schily/rmd160.h
recipe-sysroot-native/usr/include/schily/walk.h
recipe-sysroot-native/usr/include/schily/varargs.h
recipe-sysroot-native/usr/include/schily/md5.h
recipe-sysroot-native/usr/include/schily/nlsdefs.h
recipe-sysroot-native/usr/include/schily/archdefs.h
recipe-sysroot-native/usr/include/schily/ctype.h
recipe-sysroot-native/usr/include/schily/pwd.h
recipe-sysroot-native/usr/include/schily/err_type.h
recipe-sysroot-native/usr/include/schily/inet.h
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/schily.h
recipe-sysroot-native/usr/include/schily/float.h
recipe-sysroot-native/usr/include/schily/patmatch.h
recipe-sysroot-native/usr/include/schily/netdb.h
recipe-sysroot-native/usr/include/schily/setjmp.h
recipe-sysroot-native/usr/include/schily/ipc.h
recipe-sysroot-native/usr/include/schily/libgen.h
recipe-sysroot-native/usr/include/schily/shadow.h
recipe-sysroot-native/usr/include/schily/types.h
recipe-sysroot-native/usr/include/schily/sysexits.h
recipe-sysroot-native/usr/include/schily/grp.h
recipe-sysroot-native/usr/include/schily/fstream.h
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/shm.h
recipe-sysroot-native/usr/include/schily/sunos4_proto.h
recipe-sysroot-native/usr/include/schily/err_char.h
recipe-sysroot-native/usr/include/schily/mtio.h
recipe-sysroot-native/usr/include/schily/librmt.h
recipe-sysroot-native/usr/include/schily/idcache.h
recipe-sysroot-native/usr/include/schily/_regex.h
recipe-sysroot-native/usr/include/schily/utime.h
recipe-sysroot-native/usr/include/schily/shedit.h
recipe-sysroot-native/usr/include/schily/string.h
recipe-sysroot-native/usr/include/schily/btorder.h
recipe-sysroot-native/usr/include/schily/md4.h
recipe-sysroot-native/usr/include/schily/prototyp.h
recipe-sysroot-native/usr/include/schily/mconfig.h
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/find.h
recipe-sysroot-native/usr/include/schily/fetchdir.h
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/err_bit.h
recipe-sysroot-native/usr/include/schily/regex.h
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/ccomdefs.h
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/resource.h
recipe-sysroot-native/usr/include/schily/sha2.h
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/param.h
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot openrecipe-sy=
sroot-native/usr/include/schily/fcntl.h
: Permission denied
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sha1.h
recipe-sysroot-native/usr/include/schily/stdarg.h
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/sigset.h
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/termios.h
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/align.h
recipe-sysroot-native/usr/include/schily/errno.h
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/socket.h
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied
recipe-sysroot-native/usr/include/schily/unistd.h
recipe-sysroot-native/usr/include/schily/dirent.h
recipe-sysroot-native/usr/include/schily/select.h
recipe-sysroot-native/usr/include/schily/poll.h
recipe-sysroot-native/usr/include/schily/procfs.h
recipe-sysroot-native/usr/include/schily/stdlib.h
recipe-sysroot-native/usr/include/schily/getargs.h
recipe-sysroot-native/usr/include/schily/jmpdefs.h
recipe-sysroot-native/usr/include/schily/vfork.h
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/windows.h
recipe-sysroot-native/usr/include/schily/shcall.h
recipe-sysroot-native/usr/include/schily/utypes.h
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xmconfig.h
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/utsname.h
recipe-sysroot-native/usr/include/schily/getcwd.h
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/syslog.h
recipe-sysroot-native/usr/include/schily/priv.h
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/iconv.h
recipe-sysroot-native/usr/include/schily/dbgmalloc.h
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied
tar: Exiting with failure status due to previous errors
WARNING: exit code 2 from a shell command.
DEBUG: Python function do_populate_sysroot_setscene finishe

Sure enough, if I manually try an extraction, I see the same issue:

tar -I zstd --format=3Dposix --acls --xattrs -xvpf ../sstate\:cdrtools-nati=
ve\:x86_64-linux\:3.01\:r0\:x86_64\:11\:aa6350f6565599ed04df25250bb5415c0e2=
427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst
recipe-sysroot-native/
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/sysroot-providers/cdrtools-native
recipe-sysroot-native/usr/
recipe-sysroot-native/usr/bin/
recipe-sysroot-native/usr/bin/cdda2ogg
recipe-sysroot-native/usr/bin/cdda2wav
recipe-sysroot-native/usr/bin/mkhybrid
recipe-sysroot-native/usr/bin/devdump
recipe-sysroot-native/usr/bin/isodebug
recipe-sysroot-native/usr/bin/scgskeleton
recipe-sysroot-native/usr/bin/btcflash
recipe-sysroot-native/usr/bin/cdrecord
recipe-sysroot-native/usr/bin/readcd
recipe-sysroot-native/usr/bin/isoinfo
recipe-sysroot-native/usr/bin/isodump
recipe-sysroot-native/usr/bin/cdda2mp3
recipe-sysroot-native/usr/bin/scgcheck
recipe-sysroot-native/usr/bin/mkisofs
recipe-sysroot-native/usr/bin/isovfy
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/sbin/rscsi
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/lib/libfind.a
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/libschily.a
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/libhfs.a
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied
recipe-sysroot-native/usr/lib/libcdrdeflt.a
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/libscg.a
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied
recipe-sysroot-native/usr/lib/libfile.a
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/siconv/
recipe-sysroot-native/usr/lib/siconv/cp10006
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-16
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-9
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp10007
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp10029
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-6
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/iso8859-4
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp1257
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-13
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/iso8859-2
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp437
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp775
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-15
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp857
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1258
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp855
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp864
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-5
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp1254
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-1
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp861
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/koi8-u
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp10081
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/iso8859-14
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp852
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1250
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp10000
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp737
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-11
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp866
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp860
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-7
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/iso8859-8
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/siconv/cp869
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/iso8859-10
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/siconv/cp1252
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp850
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp863
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp865
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1255
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp1256
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/koi8-r
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp1253
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/cp862
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp10079
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied
recipe-sysroot-native/usr/lib/siconv/cp874
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/siconv/cp1251
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/siconv/iso8859-3
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/lib/libparanoia.a
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied
recipe-sysroot-native/usr/lib/libdeflt.a
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed
recipe-sysroot-native/usr/lib/profiled/
recipe-sysroot-native/usr/lib/profiled/libfind.a
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libschily.a
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied
recipe-sysroot-native/usr/lib/profiled/libhfs.a
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied
recipe-sysroot-native/usr/lib/profiled/libscg.a
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/lib/profiled/libfile.a
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libparanoia.a
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied
recipe-sysroot-native/usr/lib/profiled/libdeflt.a
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/lib/profiled/libmdigest.a
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/lib/profiled/librscg.a
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/lib/profiled/libsiconv.a
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/lib/libmdigest.a
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/librscg.a
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d
recipe-sysroot-native/usr/lib/libsiconv.a
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/lib/libedc_ecc.a
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied
recipe-sysroot-native/usr/lib/libscgcmd.a
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/include/scg/
recipe-sysroot-native/usr/include/scg/scgio.h
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/scg/scsidefs.h
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/scsicdb.h
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scgcmd.h
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/scsireg.h
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scsitransp.h
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/srb_os2.h
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/scg/scgops.h
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/scg/aspi-win32.h
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/scg/spti-wnt.h
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/aspi-dos.h
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/scg/scsisense.h
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/
recipe-sysroot-native/usr/include/schily/checkerr.h
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/locale.h
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/timeb.h
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/time.h
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stdint.h
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/inttypes.h
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/io.h
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/stdio.h
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/siconv.h
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/deflts.h
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/math.h
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/schilyp.h
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/systeminfo.h
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied
recipe-sysroot-native/usr/include/schily/device.h
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/limits.h
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/alloca.h
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ioctl.h
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/maxpath.h
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/fnmatch.h
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/times.h
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sem.h
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/err_arch.h
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/signal.h
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/standard.h
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wchar.h
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/in.h
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied
recipe-sysroot-native/usr/include/schily/libport.h
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/termcap.h
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/rmtio.h
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/assert.h
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/sigblk.h
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stat.h
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/intcvt.h
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stkframe.h
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mman.h
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/wctype.h
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/dlfcn.h
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/hostname.h
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/wait.h
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/rmd160.h
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/walk.h
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/varargs.h
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/md5.h
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/nlsdefs.h
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/archdefs.h
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/ctype.h
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/pwd.h
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/err_type.h
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/inet.h
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/schily.h
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/float.h
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/patmatch.h
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/netdb.h
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/setjmp.h
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/ipc.h
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/libgen.h
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/shadow.h
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/types.h
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sysexits.h
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/grp.h
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/fstream.h
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/shm.h
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/sunos4_proto.h
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied
recipe-sysroot-native/usr/include/schily/err_char.h
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mtio.h
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/librmt.h
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/idcache.h
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/_regex.h
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/utime.h
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/shedit.h
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/string.h
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/btorder.h
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/md4.h
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied
recipe-sysroot-native/usr/include/schily/prototyp.h
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/mconfig.h
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/find.h
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/fetchdir.h
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/err_bit.h
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/regex.h
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/ccomdefs.h
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/resource.h
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/sha2.h
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/param.h
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/fcntl.h
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/sha1.h
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/stdarg.h
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/sigset.h
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/termios.h
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/align.h
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/errno.h
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/socket.h
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied
recipe-sysroot-native/usr/include/schily/unistd.h
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/dirent.h
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/select.h
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/poll.h
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/procfs.h
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/stdlib.h
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/getargs.h
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/jmpdefs.h
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/vfork.h
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/windows.h
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/shcall.h
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/utypes.h
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/xmconfig.h
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied
recipe-sysroot-native/usr/include/schily/utsname.h
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied
recipe-sysroot-native/usr/include/schily/getcwd.h
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/syslog.h
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied
recipe-sysroot-native/usr/include/schily/priv.h
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied
recipe-sysroot-native/usr/include/schily/iconv.h
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied
recipe-sysroot-native/usr/include/schily/dbgmalloc.h
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied
tar: Exiting with failure status due to previous errors

The files in question are readonly so it looks like it creates the file
readonly and then can't write the xattr data to it. If I drop the --
xattrs parameter to tar, it works.

The version of tar in question is:

pokybuild@debian11-ty-1:~/yocto-worker/wic/build/1$ tar --version
tar (GNU tar) 1.34
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://eur04.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgnu.org%2Flicenses%2Fgpl.html&data=3D0=
5%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a=
7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3DxtkH9eIwpUJYO9WnFoTkQG2PLRjjPts0JAEkVq81%2BRI%3D&reser=
ved=3D0<https://gnu.org/licenses/gpl.html>>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by John Gilmore and Jay Fenlason.


Cheers,

Richard




--_000_VI1PR04MB537337326938DAE0CF93155891E0AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Richard,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I have discovered in here <a href=3D"https://savannah.gnu.org/bugs/?59184" =
id=3D"LPlnk403647">
https://savannah.gnu.org/bugs/?59184</a> that this is a bug in tar, which i=
s already reported. The solution, which is given out there is ugly, but on =
the other hand solution which will be added to tar will cause also to updat=
e machines so we need probably to
 discuss the best option for us...</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> czwartek, 24 sierpnia 2023 09:08<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for =
ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, 2023-08-04 at 10:43 +0200, Piotr =A3obacz =
wrote:<br>
Extend `tar` command, with additional parameters, depending<br>
on choosen package class and target distro features, in order<br>
to support ACLs and xattr.<br>
<br>
Additionaly set archive posix format, in order to preserve<br>
milliseconds in timestamps for reproducibility tests.<br>
<br>
Currently only `package_ipk` supports fully ACLs and xattr.<br>
<br>
Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
---<br>
&nbsp;meta/classes-global/sstate.bbclass | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 95373fd60a..ac890fc98e 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -848,7 +848,7 @@ sstate_create_package () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir --mode=3D0775 -p `di=
rname ${SSTATE_PKG}`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=3D`mktemp ${SSTATE_P=
KG}.XXXXXXXX`<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;-cS&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;--format=3Dposix ${@bb.ut=
ils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)} ${@bb.utils.contai=
ns('DISTRO_FEATURES', 'xattr', '--xattrs', '', d)} --numeric-owner -cS&quot=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZSTD=3D&quot;zstd -${SSTAT=
E_ZSTD_CLEVEL} -T${ZSTD_THREADS}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Use pzstd if available<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -x &quot;$(command -v=
 pzstd)&quot; ]; then<br>
@@ -914,7 +914,7 @@ sstate_unpack_package () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ZSTD=3D&quot;pzstd -p ${ZSTD_THREADS}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar -I &quot;$ZSTD&quot; -xvpf ${SSTA=
TE_PKG}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar -I &quot;$ZSTD&quot; --format=3Dp=
osix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)} ${@bb=
.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', '', d)} -xvpf ${SST=
ATE_PKG}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # update .siginfo atime on=
 local/NFS mirror if it is a symbolic link<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ ! -h ${SSTATE_PKG}.sigin=
fo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2&=
gt;/dev/null || true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # update each symbolic lin=
k instead of any referenced file<br>
<br>
I've been putting this through a bit more testing and sadly we're still not=
 quite there. In testing last night we saw a lot of failures like this:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/58/build=
s/7488">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F58%2Fbuilds%2F74=
88&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba4=
70e7ce%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DmylIx0P4MLeBaFZclc47CMwX7%2FhEliHEC=
p6e1POGtIg%3D&amp;reserved=3D0</a><br>
<br>
i.e.:<br>
<br>
WARNING: cdrtools-native-3.01-r0 do_populate_sysroot_setscene: ExecutionErr=
or('/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrt=
ools-native/3.01/temp/run.sstate_unpack_package.1434763', 2, None, None)<br=
>
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/w=
ic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/log.do_popul=
ate_sysroot_setscene.1434763<br>
WARNING: Setscene task (/home/pokybuild/yocto-worker/wic/build/meta/recipes=
-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot_setscene) fa=
iled with exit code '1' - real task will be run instead<br>
<br>
The sstate in question is this file:<br>
<br>
<a href=3D"http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtoo=
ls-native:x86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e=
2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst">https://eur04.safe=
links.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsstate.yoctoproject.org%2F=
all%2Funiversal%2Faa%2F63%2Fsstate%3Acdrtools-native%3Ax86_64-linux%3A3.01%=
3Ar0%3Ax86_64%3A11%3Aaa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e2=
1820ee6aec_populate_sysroot.tar.zst&amp;data=3D05%7C01%7Cp.lobacz%40welotec=
.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4ca7f8e44011b39%=
7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DID=
BC6nZHweWglSxrBrGi2S%2BcXtgAk0CIbs6BX72eolo%3D&amp;reserved=3D0</a><br>
<br>
and the failing task log:<br>
<br>
pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linu=
x/cdrtools-native/3.01/temp$ cat log.do_populate_sysroot_setscene<br>
DEBUG: Executing python function do_populate_sysroot_setscene<br>
DEBUG: Executing shell function sstate_unpack_package<br>
recipe-sysroot-native/<br>
recipe-sysroot-native/sysroot-providers/<br>
recipe-sysroot-native/sysroot-providers/cdrtools-native<br>
recipe-sysroot-native/usr/<br>
recipe-sysroot-native/usr/bin/<br>
recipe-sysroot-native/usr/bin/cdda2ogg<br>
recipe-sysroot-native/usr/bin/cdda2wav<br>
recipe-sysroot-native/usr/bin/mkhybrid<br>
recipe-sysroot-native/usr/bin/devdump<br>
recipe-sysroot-native/usr/bin/isodebug<br>
recipe-sysroot-native/usr/bin/scgskeleton<br>
recipe-sysroot-native/usr/bin/btcflash<br>
recipe-sysroot-native/usr/bin/cdrecord<br>
recipe-sysroot-native/usr/bin/readcd<br>
recipe-sysroot-native/usr/bin/isoinfo<br>
recipe-sysroot-native/usr/bin/isodump<br>
recipe-sysroot-native/usr/bin/cdda2mp3<br>
recipe-sysroot-native/usr/bin/scgcheck<br>
recipe-sysroot-native/usr/bin/mkisofs<br>
recipe-sysroot-native/usr/bin/isovfy<br>
recipe-sysroot-native/usr/sbin/<br>
recipe-sysroot-native/usr/sbin/rscsi<br>
recipe-sysroot-native/usr/share/<br>
recipe-sysroot-native/usr/lib/<br>
recipe-sysroot-native/usr/lib/libfind.a<br>
recipe-sysroot-native/usr/lib/libschily.a<br>
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a<br>
recipe-sysroot-native/usr/lib/libhfs.a<br>
recipe-sysroot-native/usr/lib/libcdrdeflt.a<br>
recipe-sysroot-native/usr/lib/libscg.a<br>
recipe-sysroot-native/usr/lib/libfile.a<br>
recipe-sysroot-native/usr/lib/siconv/<br>
recipe-sysroot-native/usr/lib/siconv/cp10006<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-16<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-9<br>
recipe-sysroot-native/usr/lib/siconv/cp10007<br>
recipe-sysroot-native/usr/lib/siconv/cp10029<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-6<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-4<br>
recipe-sysroot-native/usr/lib/siconv/cp1257<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-13<br>
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d<br>
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied<br>
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied=
<br>
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied=
<br>
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-2<br>
recipe-sysroot-native/usr/lib/siconv/cp437<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp775<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-15<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp857<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1258<br>
recipe-sysroot-native/usr/lib/siconv/cp855<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp864<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-5<br>
recipe-sysroot-native/usr/lib/siconv/cp1254<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-1<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp861<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/koi8-u<br>
recipe-sysroot-native/usr/lib/siconv/cp10081<br>
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot openrecipe-sysroo=
t-native/usr/lib/siconv/iso8859-14<br>
: Permission denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp852<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1250<br>
recipe-sysroot-native/usr/lib/siconv/cp10000<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp737<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-11<br>
recipe-sysroot-native/usr/lib/siconv/cp866<br>
recipe-sysroot-native/usr/lib/siconv/cp860<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-7<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-8<br>
recipe-sysroot-native/usr/lib/siconv/cp869<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-10<br>
recipe-sysroot-native/usr/lib/siconv/cp1252<br>
recipe-sysroot-native/usr/lib/siconv/cp850<br>
recipe-sysroot-native/usr/lib/siconv/cp863<br>
recipe-sysroot-native/usr/lib/siconv/cp865<br>
recipe-sysroot-native/usr/lib/siconv/cp1255<br>
recipe-sysroot-native/usr/lib/siconv/cp1256<br>
recipe-sysroot-native/usr/lib/siconv/koi8-r<br>
recipe-sysroot-native/usr/lib/siconv/cp1253<br>
recipe-sysroot-native/usr/lib/siconv/cp862<br>
recipe-sysroot-native/usr/lib/siconv/cp10079<br>
recipe-sysroot-native/usr/lib/siconv/cp874<br>
recipe-sysroot-native/usr/lib/siconv/cp1251<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-3<br>
recipe-sysroot-native/usr/lib/libparanoia.a<br>
recipe-sysroot-native/usr/lib/libdeflt.a<br>
recipe-sysroot-native/usr/lib/profiled/<br>
recipe-sysroot-native/usr/lib/profiled/libfind.a<br>
recipe-sysroot-native/usr/lib/profiled/libschily.a<br>
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a<br>
recipe-sysroot-native/usr/lib/profiled/libhfs.a<br>
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a<br>
recipe-sysroot-native/usr/lib/profiled/libscg.a<br>
recipe-sysroot-native/usr/lib/profiled/libfile.a<br>
recipe-sysroot-native/usr/lib/profiled/libparanoia.a<br>
recipe-sysroot-native/usr/lib/profiled/libdeflt.a<br>
recipe-sysroot-native/usr/lib/profiled/libmdigest.a<br>
recipe-sysroot-native/usr/lib/profiled/librscg.a<br>
recipe-sysroot-native/usr/lib/profiled/libsiconv.a<br>
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a<br>
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a<br>
recipe-sysroot-native/usr/lib/libmdigest.a<br>
recipe-sysroot-native/usr/lib/librscg.a<br>
recipe-sysroot-native/usr/lib/libsiconv.a<br>
recipe-sysroot-native/usr/lib/libedc_ecc.a<br>
recipe-sysroot-native/usr/lib/libscgcmd.a<br>
recipe-sysroot-native/usr/include/<br>
recipe-sysroot-native/usr/include/scg/<br>
recipe-sysroot-native/usr/include/scg/scgio.h<br>
recipe-sysroot-native/usr/include/scg/scsidefs.h<br>
recipe-sysroot-native/usr/include/scg/scsicdb.h<br>
recipe-sysroot-native/usr/include/scg/scgcmd.h<br>
recipe-sysroot-native/usr/include/scg/scsireg.h<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied<br>
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed<br>
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d<br>
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied<br>
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied<br>
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied<br>
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied<br>
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/scg/scsitransp.h<br>
recipe-sysroot-native/usr/include/scg/srb_os2.h<br>
recipe-sysroot-native/usr/include/scg/scgops.h<br>
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/scg/aspi-win32.h<br>
recipe-sysroot-native/usr/include/scg/spti-wnt.h<br>
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/scg/aspi-dos.h<br>
recipe-sysroot-native/usr/include/scg/scsisense.h<br>
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/<br>
recipe-sysroot-native/usr/include/schily/checkerr.h<br>
recipe-sysroot-native/usr/include/schily/locale.h<br>
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/timeb.h<br>
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/time.h<br>
recipe-sysroot-native/usr/include/schily/stdint.h<br>
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/inttypes.h<br>
recipe-sysroot-native/usr/include/schily/io.h<br>
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied<br>
recipe-sysroot-native/usr/include/schily/stdio.h<br>
recipe-sysroot-native/usr/include/schily/siconv.h<br>
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/deflts.h<br>
recipe-sysroot-native/usr/include/schily/math.h<br>
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot openrecipe-sys=
root-native/usr/include/schily/schilyp.h<br>
: Permission denied<br>
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/systeminfo.h<br>
recipe-sysroot-native/usr/include/schily/device.h<br>
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied<br>
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot openrecipe-s=
ysroot-native/usr/include/schily/limits.h<br>
: Permission denied<br>
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/alloca.h<br>
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/ioctl.h<br>
recipe-sysroot-native/usr/include/schily/maxpath.h<br>
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/fnmatch.h<br>
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/times.h<br>
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/sem.h<br>
recipe-sysroot-native/usr/include/schily/err_arch.h<br>
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/signal.h<br>
recipe-sysroot-native/usr/include/schily/standard.h<br>
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/wchar.h<br>
recipe-sysroot-native/usr/include/schily/in.h<br>
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied<br>
recipe-sysroot-native/usr/include/schily/libport.h<br>
recipe-sysroot-native/usr/include/schily/avoffset.h<br>
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/termcap.h<br>
recipe-sysroot-native/usr/include/schily/rmtio.h<br>
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/assert.h<br>
recipe-sysroot-native/usr/include/schily/xconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/sigblk.h<br>
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/stat.h<br>
recipe-sysroot-native/usr/include/schily/intcvt.h<br>
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/stkframe.h<br>
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/mman.h<br>
recipe-sysroot-native/usr/include/schily/wctype.h<br>
recipe-sysroot-native/usr/include/schily/dlfcn.h<br>
recipe-sysroot-native/usr/include/schily/hostname.h<br>
recipe-sysroot-native/usr/include/schily/wait.h<br>
recipe-sysroot-native/usr/include/schily/rmd160.h<br>
recipe-sysroot-native/usr/include/schily/walk.h<br>
recipe-sysroot-native/usr/include/schily/varargs.h<br>
recipe-sysroot-native/usr/include/schily/md5.h<br>
recipe-sysroot-native/usr/include/schily/nlsdefs.h<br>
recipe-sysroot-native/usr/include/schily/archdefs.h<br>
recipe-sysroot-native/usr/include/schily/ctype.h<br>
recipe-sysroot-native/usr/include/schily/pwd.h<br>
recipe-sysroot-native/usr/include/schily/err_type.h<br>
recipe-sysroot-native/usr/include/schily/inet.h<br>
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/schily.h<br>
recipe-sysroot-native/usr/include/schily/float.h<br>
recipe-sysroot-native/usr/include/schily/patmatch.h<br>
recipe-sysroot-native/usr/include/schily/netdb.h<br>
recipe-sysroot-native/usr/include/schily/setjmp.h<br>
recipe-sysroot-native/usr/include/schily/ipc.h<br>
recipe-sysroot-native/usr/include/schily/libgen.h<br>
recipe-sysroot-native/usr/include/schily/shadow.h<br>
recipe-sysroot-native/usr/include/schily/types.h<br>
recipe-sysroot-native/usr/include/schily/sysexits.h<br>
recipe-sysroot-native/usr/include/schily/grp.h<br>
recipe-sysroot-native/usr/include/schily/fstream.h<br>
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/shm.h<br>
recipe-sysroot-native/usr/include/schily/sunos4_proto.h<br>
recipe-sysroot-native/usr/include/schily/err_char.h<br>
recipe-sysroot-native/usr/include/schily/mtio.h<br>
recipe-sysroot-native/usr/include/schily/librmt.h<br>
recipe-sysroot-native/usr/include/schily/idcache.h<br>
recipe-sysroot-native/usr/include/schily/_regex.h<br>
recipe-sysroot-native/usr/include/schily/utime.h<br>
recipe-sysroot-native/usr/include/schily/shedit.h<br>
recipe-sysroot-native/usr/include/schily/string.h<br>
recipe-sysroot-native/usr/include/schily/btorder.h<br>
recipe-sysroot-native/usr/include/schily/md4.h<br>
recipe-sysroot-native/usr/include/schily/prototyp.h<br>
recipe-sysroot-native/usr/include/schily/mconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied<br>
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied<br>
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied<br>
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/find.h<br>
recipe-sysroot-native/usr/include/schily/fetchdir.h<br>
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/err_bit.h<br>
recipe-sysroot-native/usr/include/schily/regex.h<br>
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/ccomdefs.h<br>
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/resource.h<br>
recipe-sysroot-native/usr/include/schily/sha2.h<br>
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/param.h<br>
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot openrecipe-sy=
sroot-native/usr/include/schily/fcntl.h<br>
: Permission denied<br>
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/sha1.h<br>
recipe-sysroot-native/usr/include/schily/stdarg.h<br>
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/sigset.h<br>
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/termios.h<br>
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/align.h<br>
recipe-sysroot-native/usr/include/schily/errno.h<br>
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/socket.h<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h<br>
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/unistd.h<br>
recipe-sysroot-native/usr/include/schily/dirent.h<br>
recipe-sysroot-native/usr/include/schily/select.h<br>
recipe-sysroot-native/usr/include/schily/poll.h<br>
recipe-sysroot-native/usr/include/schily/procfs.h<br>
recipe-sysroot-native/usr/include/schily/stdlib.h<br>
recipe-sysroot-native/usr/include/schily/getargs.h<br>
recipe-sysroot-native/usr/include/schily/jmpdefs.h<br>
recipe-sysroot-native/usr/include/schily/vfork.h<br>
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied<br>
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/windows.h<br>
recipe-sysroot-native/usr/include/schily/shcall.h<br>
recipe-sysroot-native/usr/include/schily/utypes.h<br>
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/xmconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/utsname.h<br>
recipe-sysroot-native/usr/include/schily/getcwd.h<br>
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied<br>
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/syslog.h<br>
recipe-sysroot-native/usr/include/schily/priv.h<br>
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied<br>
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/iconv.h<br>
recipe-sysroot-native/usr/include/schily/dbgmalloc.h<br>
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied<br>
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied<br>
tar: Exiting with failure status due to previous errors<br>
WARNING: exit code 2 from a shell command.<br>
DEBUG: Python function do_populate_sysroot_setscene finishe<br>
<br>
Sure enough, if I manually try an extraction, I see the same issue:<br>
<br>
tar -I zstd --format=3Dposix --acls --xattrs -xvpf ../sstate\:cdrtools-nati=
ve\:x86_64-linux\:3.01\:r0\:x86_64\:11\:aa6350f6565599ed04df25250bb5415c0e2=
427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst<br>
recipe-sysroot-native/<br>
recipe-sysroot-native/sysroot-providers/<br>
recipe-sysroot-native/sysroot-providers/cdrtools-native<br>
recipe-sysroot-native/usr/<br>
recipe-sysroot-native/usr/bin/<br>
recipe-sysroot-native/usr/bin/cdda2ogg<br>
recipe-sysroot-native/usr/bin/cdda2wav<br>
recipe-sysroot-native/usr/bin/mkhybrid<br>
recipe-sysroot-native/usr/bin/devdump<br>
recipe-sysroot-native/usr/bin/isodebug<br>
recipe-sysroot-native/usr/bin/scgskeleton<br>
recipe-sysroot-native/usr/bin/btcflash<br>
recipe-sysroot-native/usr/bin/cdrecord<br>
recipe-sysroot-native/usr/bin/readcd<br>
recipe-sysroot-native/usr/bin/isoinfo<br>
recipe-sysroot-native/usr/bin/isodump<br>
recipe-sysroot-native/usr/bin/cdda2mp3<br>
recipe-sysroot-native/usr/bin/scgcheck<br>
recipe-sysroot-native/usr/bin/mkisofs<br>
recipe-sysroot-native/usr/bin/isovfy<br>
recipe-sysroot-native/usr/sbin/<br>
recipe-sysroot-native/usr/sbin/rscsi<br>
recipe-sysroot-native/usr/share/<br>
recipe-sysroot-native/usr/lib/<br>
recipe-sysroot-native/usr/lib/libfind.a<br>
tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission denie=
d<br>
recipe-sysroot-native/usr/lib/libschily.a<br>
tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: Permission den=
ied<br>
recipe-sysroot-native/usr/lib/libedc_ecc_dec.a<br>
tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/libhfs.a<br>
tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission denied=
<br>
recipe-sysroot-native/usr/lib/libcdrdeflt.a<br>
tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/libscg.a<br>
tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission denied=
<br>
recipe-sysroot-native/usr/lib/libfile.a<br>
tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission denie=
d<br>
recipe-sysroot-native/usr/lib/siconv/<br>
recipe-sysroot-native/usr/lib/siconv/cp10006<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-16<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-9<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp10007<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/cp10029<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-6<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-4<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp1257<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-13<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-2<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp437<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp775<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-15<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp857<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1258<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp855<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp864<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-5<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp1254<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-1<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp861<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/koi8-u<br>
tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp10081<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-14<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp852<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1250<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp10000<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/cp737<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-11<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp866<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp860<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-7<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-8<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/siconv/cp869<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-10<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/siconv/cp1252<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp850<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp863<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp865<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1255<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp1256<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/koi8-r<br>
tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp1253<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/cp862<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp10079<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: Permission =
denied<br>
recipe-sysroot-native/usr/lib/siconv/cp874<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/siconv/cp1251<br>
tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/siconv/iso8859-3<br>
tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/lib/libparanoia.a<br>
tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: Permission d=
enied<br>
recipe-sysroot-native/usr/lib/libdeflt.a<br>
tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission deni=
ed<br>
recipe-sysroot-native/usr/lib/profiled/<br>
recipe-sysroot-native/usr/lib/profiled/libfind.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/lib/profiled/libschily.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot open: =
Permission denied<br>
recipe-sysroot-native/usr/lib/profiled/libhfs.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot open: Per=
mission denied<br>
recipe-sysroot-native/usr/lib/profiled/libscg.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/lib/profiled/libfile.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/lib/profiled/libparanoia.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot open: Per=
mission denied<br>
recipe-sysroot-native/usr/lib/profiled/libdeflt.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/lib/profiled/libmdigest.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/lib/profiled/librscg.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/lib/profiled/libsiconv.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/lib/profiled/libscgcmd.a<br>
tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/lib/libmdigest.a<br>
tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/librscg.a<br>
tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission denie=
d<br>
recipe-sysroot-native/usr/lib/libsiconv.a<br>
tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: Permission den=
ied<br>
recipe-sysroot-native/usr/lib/libedc_ecc.a<br>
tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: Permission de=
nied<br>
recipe-sysroot-native/usr/lib/libscgcmd.a<br>
tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: Permission den=
ied<br>
recipe-sysroot-native/usr/include/<br>
recipe-sysroot-native/usr/include/scg/<br>
recipe-sysroot-native/usr/include/scg/scgio.h<br>
tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: Permission=
 denied<br>
recipe-sysroot-native/usr/include/scg/scsidefs.h<br>
tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/scg/scsicdb.h<br>
tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/scg/scgcmd.h<br>
tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/scg/scsireg.h<br>
tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/scg/scsitransp.h<br>
tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/scg/srb_os2.h<br>
tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/scg/scgops.h<br>
tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/scg/aspi-win32.h<br>
tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/scg/spti-wnt.h<br>
tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/scg/aspi-dos.h<br>
tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/scg/scsisense.h<br>
tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/<br>
recipe-sysroot-native/usr/include/schily/checkerr.h<br>
tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/locale.h<br>
tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/timeb.h<br>
tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/time.h<br>
tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/stdint.h<br>
tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/inttypes.h<br>
tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/io.h<br>
tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: Permission=
 denied<br>
recipe-sysroot-native/usr/include/schily/stdio.h<br>
tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/siconv.h<br>
tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/deflts.h<br>
tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/math.h<br>
tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/schilyp.h<br>
tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/systeminfo.h<br>
tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot open: Pe=
rmission denied<br>
recipe-sysroot-native/usr/include/schily/device.h<br>
tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/limits.h<br>
tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/alloca.h<br>
tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/ioctl.h<br>
tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/maxpath.h<br>
tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/fnmatch.h<br>
tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/times.h<br>
tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/sem.h<br>
tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/err_arch.h<br>
tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/signal.h<br>
tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/standard.h<br>
tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/wchar.h<br>
tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/in.h<br>
tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: Permission=
 denied<br>
recipe-sysroot-native/usr/include/schily/libport.h<br>
tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/avoffset.h<br>
tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/termcap.h<br>
tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/rmtio.h<br>
tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/assert.h<br>
tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/xconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/sigblk.h<br>
tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/stat.h<br>
tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/intcvt.h<br>
tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/stkframe.h<br>
tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/mman.h<br>
tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/wctype.h<br>
tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/dlfcn.h<br>
tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/hostname.h<br>
tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/wait.h<br>
tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/rmd160.h<br>
tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/walk.h<br>
tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/varargs.h<br>
tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/md5.h<br>
tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/nlsdefs.h<br>
tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/archdefs.h<br>
tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/ctype.h<br>
tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/pwd.h<br>
tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/err_type.h<br>
tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/inet.h<br>
tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/schily.h<br>
tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/float.h<br>
tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/patmatch.h<br>
tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/netdb.h<br>
tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/setjmp.h<br>
tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/ipc.h<br>
tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/libgen.h<br>
tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/shadow.h<br>
tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/types.h<br>
tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/sysexits.h<br>
tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/grp.h<br>
tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/fstream.h<br>
tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/shm.h<br>
tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/sunos4_proto.h<br>
tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot open: =
Permission denied<br>
recipe-sysroot-native/usr/include/schily/err_char.h<br>
tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/mtio.h<br>
tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/librmt.h<br>
tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/idcache.h<br>
tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/_regex.h<br>
tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/utime.h<br>
tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/shedit.h<br>
tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/string.h<br>
tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/btorder.h<br>
tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/md4.h<br>
tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: Permissio=
n denied<br>
recipe-sysroot-native/usr/include/schily/prototyp.h<br>
tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/mconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/find.h<br>
tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/fetchdir.h<br>
tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/err_bit.h<br>
tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/regex.h<br>
tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/ccomdefs.h<br>
tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/resource.h<br>
tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/sha2.h<br>
tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/param.h<br>
tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/fcntl.h<br>
tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/sha1.h<br>
tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/stdarg.h<br>
tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/sigset.h<br>
tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/termios.h<br>
tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/align.h<br>
tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/errno.h<br>
tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/socket.h<br>
tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: =
Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: C=
annot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h<br>
tar: recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: Can=
not open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/unistd.h<br>
tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/dirent.h<br>
tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/select.h<br>
tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/poll.h<br>
tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/procfs.h<br>
tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/stdlib.h<br>
tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/getargs.h<br>
tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/jmpdefs.h<br>
tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/vfork.h<br>
tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/windows.h<br>
tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/shcall.h<br>
tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/utypes.h<br>
tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/xmconfig.h<br>
tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: Perm=
ission denied<br>
recipe-sysroot-native/usr/include/schily/utsname.h<br>
tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: Permi=
ssion denied<br>
recipe-sysroot-native/usr/include/schily/getcwd.h<br>
tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/syslog.h<br>
tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: Permis=
sion denied<br>
recipe-sysroot-native/usr/include/schily/priv.h<br>
tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: Permissi=
on denied<br>
recipe-sysroot-native/usr/include/schily/iconv.h<br>
tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: Permiss=
ion denied<br>
recipe-sysroot-native/usr/include/schily/dbgmalloc.h<br>
tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot open: Per=
mission denied<br>
tar: Exiting with failure status due to previous errors<br>
<br>
The files in question are readonly so it looks like it creates the file<br>
readonly and then can't write the xattr data to it. If I drop the --<br>
xattrs parameter to tar, it works.<br>
<br>
The version of tar in question is:<br>
<br>
pokybuild@debian11-ty-1:~/yocto-worker/wic/build/1$ tar --version<br>
tar (GNU tar) 1.34<br>
Copyright (C) 2021 Free Software Foundation, Inc.<br>
License GPLv3+: GNU GPL version 3 or later &lt;<a href=3D"https://gnu.org/l=
icenses/gpl.html">https://eur04.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgnu.org%2Flicenses%2Fgpl.html&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DxtkH9eIwpUJYO9WnFoTkQG2PLRjjPts0JAEkVq81%2BRI%3D&amp;reserved=3D0</a>&gt=
;.<br>
This is free software: you are free to change and redistribute it.<br>
There is NO WARRANTY, to the extent permitted by law.<br>
<br>
Written by John Gilmore and Jay Fenlason.<br>
<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB537337326938DAE0CF93155891E0AVI1PR04MB5373eurp_--

