Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED74DEA8537
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 16:59:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42757.1772989140948527403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 09:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=OgDEhh+t;
 spf=pass (domain: est.tech, ip: 52.101.84.52, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvSsEOWLEXWOv9kiSZckwWPlIiaoMFumwrAMi8pxT32uz4C0/25XVC0vavtsAl6pPAL4l2CdjglBcvhWUS4hVP2GSMEne50ItmyDYngV4i/ZuVkejntrGpN2qEfLFPoNYHpN5T4x5fj6a2RrjMr6OyFQoJMvpqMLphp4b5yynmLC0R9gLb3xHuyMCius0WuCc1MelUi3RO3+2lpUvHvGRyZfYzKxEEClCVrF9k7nAJwXBcjmFY9VV9+b3ATHcpMrpTHPvioCIctp8mdsRZQu30AGksBd/MCHooRgr/VRpuE8rDJvNmO8ynm0XQtA3kiTB32Y6Q8Lnng5iUeMgjNtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv1rR60eqpyLkFQyZpGFu+50E6wgJDtAM9FHUxAg98E=;
 b=HQiM75jGVce7/dpRS8Uzy9AzBj42EqV6p3YAATOwgFiwBN75xpF3w4OQ8qGQIGbXIsS33m7NQBawXDXUWamE5EqQr6blBMK3zNGeyw6sRHIDoHgPwta0Yjv3EThl7G9ADj/pWluYOC9fog1VUoNdMuS7nqavo4r0NAnE8l8OpuIjZHFfPXCOOYRqRV6RM0Cz9MH7dRwWSXxLiIElYsdQ32WlhTQ+NLY4lQJdvTTsSyY+y7GJ9ybuPrZltQEqnHLnTgeyCLrtAFei5bSNmxDsGjD6LNT7S9/+Lasmwrdb6mvZnZJmCbIdee5jGLQa0bwARzpmRreq3chvbI31uGQ7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv1rR60eqpyLkFQyZpGFu+50E6wgJDtAM9FHUxAg98E=;
 b=OgDEhh+tcXnEgBXjYElvp0TkywdKHynax/dwyDgNWeCS5dEEDY3rtTPPGj815IU1+mv7cVMxH2xreJhxxH0i1VXnvBk87Qx3pcwEx2Y4JiGxa7H+oTIx+Yn0peBbx4FuEMMWw/qnu7gCj1p0pzYbUyJH3Hw4XC03LahS/11CZgDLLpZLQ3WKmAU9q78qjwkf4g9//fodWhXyIRAELfTrrMxysArL6RcTaDO5W7Rdj8j/oYgqLMszvT8xpGZzDwMoCxJq8/RNk1nWLHPhmynbLkFP3gurv5zncCF6k5rz1gHaOkw2sIVtIPBEhr6mPgT34X1giTXsxZQeZhaiqLe2iQ==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA6P189MB3742.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:519::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Sun, 8 Mar
 2026 16:58:57 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 16:58:56 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] go: add ptest support
Thread-Topic: [OE-core][PATCH v2] go: add ptest support
Thread-Index: AQHcrY4R2E5jyGDNZkCN7QVEDZnrK7Wk0L0AgAANZ2M=
Date: Sun, 8 Mar 2026 16:58:56 +0000
Message-ID: 
 <GV2P189MB3005CC084E6CC2C59CCBC5FCFE78A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260306172416.23307-1-pratik.farkase@est.tech>
 <DGXJ52WWUKEO.GZLFB46U22IX@bootlin.com>
In-Reply-To: <DGXJ52WWUKEO.GZLFB46U22IX@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PA6P189MB3742:EE_
x-ms-office365-filtering-correlation-id: 56b18f90-d107-406a-f248-08de7d33fc97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 8KVwiAZfebv/sZSEBa0P5Pg0O90epNjYOAKdNbcWwfoDN8yLHXysmsg0VRwL0defHSyGDgWk1G7KNymIJ+9yjMv9Q85CHP8r6JQzY+s6HO6iPHnE3a7+U3h3QeYcglT+7hkyDUS2HzA57y1fyB72RpTomDqvVHpbL+m+Qtc64FvHy/x5AG1R+hYT+I54WJBCIUTFOWiYpJkL95RSlS0KqEC+FmGEKhbx3eBXjYYdhp2/b+u08pOyUOPuOidB3HN/OZmSdvpnopfCJU+cUgpb3Ixxe0RbaMCx0XT/j2H1uG9yU+ZHLfdlJ0ogzkkMZyFw7po7c+Vrl1N43rhlRwzhVaNVKavCdFW3mML2fNhLkXdD7YQzaZJWGZzViab2o0x3zDB0HIMg+Ol8yFD/zju7nWDl1bk54JFDha0J62yYgGoT6a7QfFuOd10aVkUeKjyxizmBfk272tcl5QqNJBrmkl1Ib7i/F3pkyBz/GH8NbB/AdstaSsxiRDdKZEliCYjIUZY5V1zyw3akzRtau7UBOYNV7sOUmU1U2AT93H8aOwmwTuOUvoSL5wJkjUcPL8w6iedG5wnG0eezmq0z/yByhRmqSPBDL6kq1jqUeLW+SHdq2RzNSoXv8OYu/27+NBXHHTqwSLPfvBehSe1A8umIMZoB1x2KSU/RSZ2ez9iWn+zYOGc+UA4/lGLXE8PsB4Tq0LEE502gZr/ety0p/Pq29IUkhtHMCrsExW7IEw65xu8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pMDBU15dRWwW6cg0stB1LcSeBgaRNtVCNkrqgPOdKAbEXJ/e46CBRPSo9h6N?=
 =?us-ascii?Q?j60xI/QGePEhQsIGz51ieBJVU8ws4sEjjXYmG8Owzbu+tvJuvoqRpa6E+ud9?=
 =?us-ascii?Q?eppIjmgvhPDUgsr5KUSnuwJfnYn0R1r4CpKrciwQOL9Afc/XGC622vURNJ/D?=
 =?us-ascii?Q?3vC/OkyKnnUlV2gEjAXOGQU2oQobfamABvI5L0hasbwEH2drChg+niOgGoZ/?=
 =?us-ascii?Q?iK3ljB6KWvDTSZUS+4lpNtZkM3cWX5E1qsbiFFnjgoG7MmTwR42jjE2LE8sV?=
 =?us-ascii?Q?mtXqHG9BD/IuUaXgH46xcBVgqDfjgUpXVTm7o6ZfVvJd6vyxLsuVNx/8CWBx?=
 =?us-ascii?Q?iQxLpLftNxkUXUL89bH4dvNFibRUlmDTORMsXEoNDTKSXP8VB+YVyikVeYyY?=
 =?us-ascii?Q?5zqQV8InXb7nG3PpXncAXQDheWe86C9cTHrp/+cEEpfxIDE/21PUDvObgkx1?=
 =?us-ascii?Q?hg+WhcbsLUJhnAlbn7ghDI+MAo6n33lgq0w6r4tctN2ty1dt/V9+TdzJmehR?=
 =?us-ascii?Q?lBGDX88mQBfrkt7MXIeuJsffmLnz+dE6LU8g020uEJ1PVBFC0sZxXXSMesKh?=
 =?us-ascii?Q?VmyqnCpvP3Zbalw/AROOnPLjwZgx/C8YYUl5jyT0U84k3Old4sxxzd057VK9?=
 =?us-ascii?Q?J9vqzdpq3OBOACCbpF+XX/tGhZsPBD8WJqmYbDLa4zdBZ7jdizyQBZsJFKGT?=
 =?us-ascii?Q?gYzjsYz12Pr8yy68LVaz+BF3Cm2rIrjtRPJ+8aremO7kOeF4PJvpGV85pB75?=
 =?us-ascii?Q?0E1n546GogNMo6QZNdGR8W8ItKCW8U5wmzCb//IoDLqS4u7PMLumxRL0ZOPz?=
 =?us-ascii?Q?v3QgfBb/wEFg9MzzQlhWdT4B9JhptQ36m8g3LZVVQMRvGKsfVrHewEGEFR8f?=
 =?us-ascii?Q?XQAQx6UlbXVq2A3n62s+RnzYRPtZHk2kB6boXysrXZVVyuhnyOwUjWJS237v?=
 =?us-ascii?Q?VVAXdBTlSTXvmnPh4BWpGrVH1xdZPn/B5dyfprlHMbjFWfiDtyMdqXl5Iok0?=
 =?us-ascii?Q?tBgSTOHhwkDACJSDcWsL5BjEs3B5UUXlMAFFiaJGH2gvXTxPNp9ZMawofnoe?=
 =?us-ascii?Q?AshDs2j3hYWDtOxY7HvqwoCCRASe2hIwJXtogFtphjbp9wY3fp9cX65eStlN?=
 =?us-ascii?Q?USrlbRfhZHOa0GEt9KglikJKHZTYzRDVUGzzIa5AKXF8X3mnNhu33KgZcn5U?=
 =?us-ascii?Q?9LIdBjSBfkcutMx6MUGCjm0sIjDXL6FjV7KfkfanA1vB06usKgWiooAAtjF6?=
 =?us-ascii?Q?E4/WaSJC7SZ9zr+AZtvPPQIu7nLKcbO2B7mcn5uACYbMVwRmsq07Axjh9VsG?=
 =?us-ascii?Q?3bXhnRAhzYHlndGJF7nr2H4MZGtyUvWuEgEr8ktsCsyp+5TXnmihIyC//s7K?=
 =?us-ascii?Q?S8T0J4N6uqmv6PZ/zdBravGYPG3lpRRULIkg5uuyIUmAWtLV4XC4zQYgg0Ad?=
 =?us-ascii?Q?/Tta94XJLmRveeavDPBW/habm1E/DTa08pwZV0dmAMlI4A4H6f3fsESvlU2y?=
 =?us-ascii?Q?leFU08Z07Xf/5p54cP46DtRmDh6iSLN8pFSkMV7iLa//qR0BvVzM7lE/Jida?=
 =?us-ascii?Q?2m/ev89YrjaaGTTxehHiQxDf31asskd39lyPlzQ9fBAkl4lDajpAZ4Cp4Oig?=
 =?us-ascii?Q?s0q0qXodai1Q4bLxfZGiavp0BWX8VazCyEMjt82fG9TTfn6/pE777bvG/Imy?=
 =?us-ascii?Q?zfLKh0EQZae30uwemXbWmxzIAXn7oO7BZYo204avRRF0FGfs/VdKtEeROBrv?=
 =?us-ascii?Q?NVKZ+fMRsQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b18f90-d107-406a-f248-08de7d33fc97
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2026 16:58:56.7422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KO+Tw3c/SZwzIWUFy3QiMGnwJqRG6j7BCF1MSZ53A71kdhfA8nCmtB9Ec2iw5eHEewp/NBb1pTeyb1Qu82L1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6P189MB3742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 16:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232667

Hi Mathieu,

Thanks for testing!

Yes, Go ptest requires significant RAM due to on-the-fly compilation during=
 testing.
On my setup (qemux86-64 with 4GB RAM), tests complete successfully in ~45 m=
inutes.

The minimum RAM requirement appears to be ~2GB. With less RAM, the OOM kill=
er
terminates compile processes as you've seen.

Options:
1. Increase QB_MEM for go-ptest in the recipe

This is similar to other resource-intensive ptests like gcc or llvm.

What would be the preferred approach for OpenEmbedded-Core?

Thanks,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Sunday, March 8, 2026 5:09 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] go: add ptest support

On Fri Mar 6, 2026 at 6:24 PM CET, Pratik Farkase wrote:
> Add ptest infrastructure to test the Go standard library.
>
> - Run 'go test -short std' via run-ptest script
> - Install source tree and pkg/include headers
> - Create VERSION file for architecture detection
> - Exclude multi-arch binary testdata to avoid QA errors
>
> Test results: 237/253 pass (93.7%) on qemux86-64.
>
> Known issues:
> - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary tes=
tdata
> - time: requires embedded timezone data
> - net/http: requires unstripped go binary
> - testing, go/types: minor edge cases
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version.

On the autobuilder, the OOM killer is triggered on most tests:

[  314.773868] Tasks state (memory values in pages):
[  314.774517] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rs=
s_shmem pgtables_bytes swapents oom_score_adj name
[  314.780755] [    138]     0   138     2490      268      235       33   =
      0    49152        0         -1000 udevd
[  314.782773] [    322]     0   322     2379      335      250       85   =
      0    53248        0         -1000 sshd
[  314.801338] [    328]     0   328     1015       53        0       53   =
      0    40960        0             0 syslogd
[  314.811001] [    331]     0   331     1015       53        0       53   =
      0    40960        0             0 klogd
[  314.819041] [    337]     0   337     1029      126       64       62   =
      0    36864        0             0 start_getty
[  314.820980] [    338]     0   338     1029      126       64       62   =
      0    45056        0             0 start_getty
[  314.823947] [    339]     0   339     1015       32        0       32   =
      0    45056        0             0 getty
[  314.826345] [    342]     0   342     1072      153       96       57   =
      0    45056        0             0 sh
[  314.835899] [    343]     0   343     1015       83       32       51   =
      0    40960        0             0 getty
[  314.837471] [    388]     0   388     2619      335      288       47   =
      0    57344        0             0 sshd-session
[  314.849074] [    390]     0   390     2684      454      353      101   =
      0    61440        0             0 sshd-session
[  314.850742] [    391]     0   391      639       73        0       73   =
      0    40960        0             0 ptest-runner
[  314.863046] [    392]     0   392     1028      105       64       41   =
      0    45056        0             0 run-ptest
[  314.868775] [    397]     0   397   335448    14669    14640       29   =
      0   245760        0             0 go
[  314.881173] [    398]     0   398     1028       97       39       58   =
      0    45056        0             0 run-ptest
[  314.882869] [    798]     0   798   371933    60075    60023       20   =
     32   630784        0             0 compile
[  314.893578] [   1230]     0  1230   371846    55334    55248       54   =
     32   589824        0             0 compile
[  314.895156] [   1381]     0  1381   371669    48968    48879       57   =
     32   540672        0             0 compile
[  314.904257] [   1445]     0  1445   371821    50116    50067       17   =
     32   552960        0             0 compile
[  314.907744] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),cpus=
et=3D/,mems_allowed=3D0,global_oom,task_memcg=3D/,task=3Dcompile,pid=3D798,=
uid=3D0
[  314.910323] Out of memory: Killed process 798 (compile) total-vm:1487732=
kB, anon-rss:240092kB, file-rss:408kB, shmem-rss:128kB, UID:0 pgtables:616k=
B oom_score_adj:0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3229
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3201
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1196

We might need to increase QEMU memory size. Did you had similar issues
on your side?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


