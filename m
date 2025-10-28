Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883CFCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 21:05:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.web11.20610.1761685531579730559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 14:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=p12Lzh+O;
 spf=pass (domain: est.tech, ip: 52.101.65.22, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMbvg9eMGhSKVBgu7qU98KTEGAaX2LscfKI6alkEHn2J+D3L8GiFcnm0tMjfoorfvWzSOsOXOirkvn3nAIF15WOhXsWvLVE+ldQl79CduOYGJ+40l0whjMLZeJb7AWkVq/fKzDzmlbz47W72tzx/gOJlgKAT057luFE9Lw8yE32U0cfcowumW02O0L80iJvu9juBUZL1n7Xabu+K0DlOYAJtCK3WUDVP/nSPkooSEmGGDBuyg4X3y/ZPbIr0rOHV2HffF1tCZPqKwbvTCrajIOvT0U0S2Fuxo0CArkoTz59hggF2Ya27kvavxw5bHQbHBQpwtLOA/tDCPEPYIeExkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u11ae/ocLHkkfVydTHJnQ3lLUBwzsz/uv5m1biXtElA=;
 b=bZvEHLMg0+yQHseHZV3GNTRjVapwjamoMLvF4TE/moB2ztM5mbn9cvdFSlKMi3nXs6f3yQxwAEbH9BnumMPSoAhqiyxtXfE0DFme2BslSNaYm95Kc6vw7ilPyDWxXir6QdalMIPxgLsLH2YlMJu5mc/NB3N129DzBJPVkSzGS1Qrnj9ArITGJttn1FWpRloND/Q+pc4Wy1ZELOMXs88Y9ufXzqukISPx9YxlWggldd0XSiLymFH92sDVvcr6nkwMZ/AB/P3BkRr7p5CnveHCIDJxa2wnloev1ew5KFa9LCvyjrvxQYlWKKIyWaFrBWsy/SVx3fEXWr4oXNFxR9I/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u11ae/ocLHkkfVydTHJnQ3lLUBwzsz/uv5m1biXtElA=;
 b=p12Lzh+OYfoT7Zz0vBkRHYPjFupk9ZIuD3WAlSOFfE5aWeeCcfuhTlh3wkDI71pw4Ovcl6gruQ0Uvn+dqNaiFbD+1k6zCKbNbKGZIs2j/kZ6EJg7RRs13K9u5TULY2c4lmoAm2fwWtEHYXcLRysbve0TWBRJnYe9cCCImBw1YjPTJnOAEI2TQAPQUYsa8arLovfGpng0gSXjXfs211JRr7vwzFhGMcFxk5yq9uvpCvO6QgEHydcnz+jHX+IKk7E4kvXBFNxijDg+hz5t6cE3G7LiJTFjyNMqmS3ZtZ+bS7VGr/HgGqa6diMK2Cd61Dg47sMDSp/dOf8gSBgPO3AG2Q==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM7P189MB0696.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 28 Oct
 2025 21:05:28 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 21:05:27 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Index: AQHcRbJAiV7TRXSsyEygedKG5NMpXLTVgW2AgAJ/R3M=
Date: Tue, 28 Oct 2025 21:05:27 +0000
Message-ID: 
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
In-Reply-To: <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AM7P189MB0696:EE_
x-ms-office365-filtering-correlation-id: dff5fcd5-0ab9-4e02-2b13-08de1665b864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?OprpahBLxUD3nKGdivPRmWmFmnHPrBMnTuRbZpe8/u6ku/LYy4Ecah3i?=
 =?Windows-1252?Q?cJ+leLKE051/6iQks9vYs5P2XeIkXGmFHezLrpeisDjAnWPimnu34iy8?=
 =?Windows-1252?Q?sw01DsoKk97C7tnjsQ9rS1nWCOkd/KbA1kUcn9nFTz0NeigJjJu7ARjj?=
 =?Windows-1252?Q?6JASfF2s8r/2KUYv4iAlAFApk0XYvAhgWvAYTt+n4ZKi5+FmGSc+a7Tx?=
 =?Windows-1252?Q?ZhP5k+ejn85vdFJJOM9uxWE1Yp1oPWKwVSdL+lYTFDbnF8OcxBfnrP0u?=
 =?Windows-1252?Q?+ZwGNOJyAV41spzmYB6/kem/akQAP5pdMqvBe80fsKPTfPlKPye9Rjym?=
 =?Windows-1252?Q?EI/JlLtXc3pXXar/Xwb5ilNqmi5iJ+/76dKeI3p4MqNFJEq2U0UaeEW1?=
 =?Windows-1252?Q?9uTQI8GE78vOLaYY9cNHp6P4A7SDpdUBSMDWHw+iJpYs73yY6elERLOg?=
 =?Windows-1252?Q?GFCLeu6b3EBg+kbm+BpKQt/ofTw0tpl2s2Hh39vnG6c7hgN3NcJffPvQ?=
 =?Windows-1252?Q?0hdF1Knhc2olLQGaJONKP5p6ToBFRYvv+jM5qQ6/A3sCL08A2vNkgY1G?=
 =?Windows-1252?Q?enB6MuG1KaGU06Ax5GW+rXrPfhCFDvKVPUnwk/p+WZBwT3QHlJ8F0rpg?=
 =?Windows-1252?Q?TsYf1eSYZ9UkrBLUm/e4L0T3khrwvZUGQVsSnQZfGj0uTnDFKy52pIYl?=
 =?Windows-1252?Q?dudUg28IfLQ/1l0YiWg7rrgKl8e1UNE8Gf8zcXWQN++TSY3fZURR1OHe?=
 =?Windows-1252?Q?nUubDXSnltLHRo1TTZZcBXEj6vz+OG6HUGFn3C68t6U6ZxDVHoVHOJb9?=
 =?Windows-1252?Q?tVwcMg5PrAq9qZVsf8jX2jfEc2cifsOf+bpctTi0+eKFnzEEa7a6mr10?=
 =?Windows-1252?Q?P91QC4q0L0Ko9/ACn0pBipNl6Bo5jSIYA52C601XtvmPDR9KFllMVI4s?=
 =?Windows-1252?Q?FCt23SaM4zJXuV2H81bUw/gn2QM4r8Wk340xNzzC8okdspVs4CmEwWtw?=
 =?Windows-1252?Q?S/jCfH9G0AmAUxlfa8ISNAjFxUQSESa3TKQYRC9J0iO8WSIzkcllYBe7?=
 =?Windows-1252?Q?My/S5iun38MwV8gKJ6iMH33UDLXaZR+Igxifv5ggEnrbGKnIDwnM9r4q?=
 =?Windows-1252?Q?Dc2jJCyWrNkRAz+eNHWRHnd+DglHQjO2pn904A5oQ8dSkTvyGajgK+oi?=
 =?Windows-1252?Q?agYazclbu2sPxS9FixG8deYTB2POuxJum3fHkHeesUcpWFCKq69GBdDA?=
 =?Windows-1252?Q?QDINB1Ar1HzKBfEoMtRUpK9AXiX4J9WOgSbF1CIAGWzNg6OUZT41/aBD?=
 =?Windows-1252?Q?1QjObfALtOW/ncwJygqWL964FaXNb5OPTIwN0RENa9Zm+msHZuT+x9VM?=
 =?Windows-1252?Q?nmLYkjtPH17WgUSrZ9PLKqyn/yEqKDCw796JnPWVUXi+Xc+NSwBuHCov?=
 =?Windows-1252?Q?hrYeV482KglnL3UQFN5HPJFWY09OwIC30rwjzi81X7kKcMCydWG8a1NN?=
 =?Windows-1252?Q?cQr5WVHGBzmP6OvijtWNclGB87BejHlnjI9lmm7ksIBFXI3sLQurhkpT?=
 =?Windows-1252?Q?BYSQVmv6hExa7W8L?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?p/O2oMrRnLp5Ms1Vk/rTcvY3nuuLRfYL0p1dk/Bdrk3X0aSlPsvyUf4e?=
 =?Windows-1252?Q?/1x+I3PIff8ibR3Zhd4GobIpoC8/S+vZUgzwViJkUvNYiBqqg8CIZngv?=
 =?Windows-1252?Q?8cuNagtvuZKYRTnSVwJnM+r5hk4BJc9as5RyBaV8MieTnI9vIT0dCbYG?=
 =?Windows-1252?Q?/P7NgckzUGXSZecyXO266VOXhNVO9DVbGiJuJbzVPxGKPUgTjLJmoQ9y?=
 =?Windows-1252?Q?njRzLou1l3c+rFBAWkaVI2esoeqMTQFlt5obgV0QkxQlBIsgLgNc5Azp?=
 =?Windows-1252?Q?1p2G18W4J05GF0FJLgPPSFvXatE5o07FcfwLJBsBSrzZw03oxFV2rlH9?=
 =?Windows-1252?Q?3govEwHxnImmjyxECshuycoOXH44a1SHLHPwmLkW0AgTNzCY7outFNdj?=
 =?Windows-1252?Q?epexoG2KoITHej+ZKi1AnTAKCkLRqtNl+2SMNQTUcSDpTKi6bQPYY00d?=
 =?Windows-1252?Q?HrwxHT3kTpgL3Ch239BP+iG/CcGF4ZI0/9fYv9gWNQX21rPs7SUMWmvU?=
 =?Windows-1252?Q?C2bKksEmtsFmOsdBnHtomj4xOUPAg6HjuVYJAO84Ed6GIoD2Ynbhn6BB?=
 =?Windows-1252?Q?pF2DAUDCSS9AU+i9/BRhcAAJr0fyJ60S96OoKvR7DrJFfUcHzG7TD7Al?=
 =?Windows-1252?Q?bOEOk12qhLC+45NZereWsEut1ARQ98XdpFRDvdNjr54J5iCVMb3fHKM6?=
 =?Windows-1252?Q?67I7FKFMKYztq/vY/iaHKSIqRYMQX9awf+U9KIjXWZOZc9cfNfxg+s6i?=
 =?Windows-1252?Q?VlgqY/fpIj9LV6ywAq+4i3COjrweYWX+krEQaGZglxjevFo9CjKNdCXi?=
 =?Windows-1252?Q?E/FVL6wg31VGrAqEoJCG8tIfb7oDl47cON1eaUvCXZar2Zvd8Hrhx1Y4?=
 =?Windows-1252?Q?VV7DErde8k18zbdIUZWBX0Ij776SOcH3CpO8gpdSFpKrxaMjkYasRDBX?=
 =?Windows-1252?Q?QH9lZD/LK9GVJHg6iTgY4jPHyL3GRi/q947MaJ6XVJ2q2wl1G09dVlUF?=
 =?Windows-1252?Q?Kr432yWmBWPIx5NG/cd5iARo6OFL54LWvfSjIgtlpKi6R+z7qb1DFpzW?=
 =?Windows-1252?Q?+uqbylwLJpsvVIY4QhHR+ZocfKZbVjIlnitMFbRB5WH/OzIkTOypgutQ?=
 =?Windows-1252?Q?zCeuISlWDV0P8SgCyYeKugYEDFEEvvhNhMlSV3R9MCXAT1Ymj2XWv6kd?=
 =?Windows-1252?Q?I44+9T18bVXLY/9WZUiJnfmVoSgeEhDpA2BwUfpK8LlFAo6W9OyqVzXj?=
 =?Windows-1252?Q?bqdwh8Sd46MNtoTvzljqCp5sHF3dgBrLIyHKyt/LU9/VtcpcyCLcKCZr?=
 =?Windows-1252?Q?HpckADMaLB1d1TPzj/VSulFGC2Tqg3NjIf5xo29ZclqYlKWlhU5XbRhp?=
 =?Windows-1252?Q?Bw+SXgzTgMMPEaYG6eLa62V7TedQLgZ/P74UfSX2osHOW/Kkg425zVuK?=
 =?Windows-1252?Q?vP/EE69BgRsY56HP0aUk1ml3jzDl7X3Qvsu9rNz0KPzBPiTl2pwS9Tr5?=
 =?Windows-1252?Q?9+3w8STXUlJP2WvLBbFZlZ+iA5+Rh3yamtdU7nzDFfRDK3ekaJvRYDNl?=
 =?Windows-1252?Q?D5zJLZP3TnUkgTDOPwxjEANgYuN+vqFKAsxTXatjvIIwnC9BHjRNQqXx?=
 =?Windows-1252?Q?gcrB0aFoUN8y53SpgjbeYBThLYnZg+GnqWnWCYxzm5I1WtnHreR1akE9?=
 =?Windows-1252?Q?rVyzwkZecJWPiJdgtY8eLSDhHb+Yq2Ut?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB3005ADB18D1B5A8674AABA72FEFDAGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dff5fcd5-0ab9-4e02-2b13-08de1665b864
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 21:05:27.3656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/Zfz5N+QDTEUT1mUpdUsNRJz2zjEYz7+KAh3VnwCujFuaY1VbNyhMtDeQgzzPsEXdmijaIxsLlYFsnMRitqCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 21:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225415

--_000_GV2P189MB3005ADB18D1B5A8674AABA72FEFDAGV2P189MB3005EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I looked at both the Ptest logs you sent and seems like more tests are fail=
ing in the autobuilder than in my local QEMU test setup. The failures appea=
r to be byte-level differences (e.g., =93230 bytes vs 275 bytes=94 for bug-=
147) rather than functional errors.

https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-=
64-ptest/core-image-ptest-libxslt/

For both qemuarm64 and qemux86-64 machines my local ptest-runner has the fo=
llowing output :

For x86-64 :
root@qemux86-64:~# ptest-runner libxslt
START: ptest-runner
2025-10-28T20:44
BEGIN: /usr/lib/libxslt/ptest
=3D=3D=3D Running libxslt ptests =3D=3D=3D
FAIL: ./bug-146.xsl (result mismatch)
failed to stat ./bug-146.err
FAIL: ./bug-146.xsl (error mismatch)
## Running REC2 tests
## Running REC tests
## Running REC tests (standalone)
## Running REC tests without dictionaries
## Running REC tests without dictionaries (standalone)
## Running general tests
## Running general tests without dictionaries
## Running encoding tests
## Running documents tests
## Running numbers tests
## Running keys tests
## Running namespaces tests
## Running extensions tests
## Running reports tests
## Running exslt common tests
## Running exslt date tests
## Running exslt dynamic tests
## Running exslt functions tests
## Running exslt math tests
## Running exslt saxon tests
## Running exslt sets tests
## Running exslt strings tests
Total 746 tests, 1 errors
=3D=3D=3D Finished libxslt ptests =3D=3D=3D
DURATION: 10
END: /usr/lib/libxslt/ptest
2025-10-28T20:44
STOP: ptest-runner
TOTAL: 1 FAIL: 0

For arm64:
root@qemuarm64:~# ptest-runner libxslt
START: ptest-runner
2025-10-28T20:54
BEGIN: /usr/lib/libxslt/ptest
=3D=3D=3D Running libxslt ptests =3D=3D=3D
Running .libs/runtest
file ./bug-146.out is 217 bytes, result is 0 bytes
Result for ./bug-146.xsl failed
failed to stat ./bug-146.err
Error for ./bug-146.xsl failed
File ./bug-146.xsl generated an error
## Running REC2 tests
## Running REC tests
## Running REC tests (standalone)
## Running REC tests without dictionaries
## Running REC tests without dictionaries (standalone)
## Running general tests
## Running general tests without dictionaries
## Running encoding tests
## Running documents tests
## Running numbers tests
## Running keys tests
## Running namespaces tests
## Running extensions tests
## Running reports tests
## Running exslt common tests
## Running exslt date tests
## Running exslt dynamic tests
## Running exslt functions tests
## Running exslt math tests
## Running exslt saxon tests
## Running exslt sets tests
## Running exslt strings tests
Total 746 tests, 1 errors
FAIL: runtest returned 1
FAIL: some libxslt tests failed
Finished libxslt ptests

ERROR: Exit status is 1
DURATION: 9
END: /usr/lib/libxslt/ptest
2025-10-28T20:54
STOP: ptest-runner
TOTAL: 1 FAIL: 1
Any suggestions on how to proceed or debug further would be appreciated!
Best Regards,
Pratik
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: 27 October 2025 6:56 AM
To: Pratik Farkase <pratik.farkase@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support

On Sat Oct 25, 2025 at 3:21 PM CEST, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> v4:
> - adapt run-ptest to emit PASS: or FAIL: lines for each test
> - run-ptest installation with proper permissions
>
> v5:
> - Added FILESEXTRAPATHS using ${BPN} for multilib-safe lookup of run-ptes=
t
> - Guarded run-ptest install in do_install_ptest() to avoid autobuilder fa=
ilures.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version, but we still have some ptest related errors:

AssertionError:
Failed ptests:
{'libxslt': ['runtest_returned_1', 'some_libxslt_tests_failed']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2496
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2535

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemuarm6=
4-ptest/core-image-ptest-libxslt/
https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-=
64-ptest/core-image-ptest-libxslt/

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_GV2P189MB3005ADB18D1B5A8674AABA72FEFDAGV2P189MB3005EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Mathieu,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I looked at both the Ptest logs you sent and seems like more tests are fail=
ing in the autobuilder than in my local QEMU test setup. The failures appea=
r to be byte-level differences (e.g., =93230 bytes vs 275 bytes=94 for bug-=
147) rather than functional errors.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif; font-size: 14.6667px; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 255);"><a style=3D"margin: 0=
px; background-color: rgb(255, 255, 255); text-align: left;" data-auth=3D"N=
otApplicable" data-linkindex=3D"3" rel=3D"noopener noreferrer" title=3D"htt=
ps://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-=
ptest/core-image-ptest-libxslt/" class=3D"OWAAutoLink elementToProof" id=3D=
"OWA1fc9c9cb-30d6-916c-0e3e-499159aa5626" target=3D"_blank" href=3D"https:/=
/valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-ptes=
t/core-image-ptest-libxslt/">https://valkyrie.yocto.io/pub/non-release/2025=
1026-107/testresults/qemux86-64-ptest/core-image-ptest-libxslt/</a></span><=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
For both qemuarm64 and qemux86-64 machines my local ptest-runner has the fo=
llowing output :</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
For x86-64 :&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
root@qemux86-64:~# ptest-runner libxslt</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
START: ptest-runner</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
2025-10-28T20:44</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
BEGIN: /usr/lib/libxslt/ptest</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D Running libxslt ptests =3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
FAIL: ./bug-146.xsl (result mismatch)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
failed to stat ./bug-146.err</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
FAIL: ./bug-146.xsl (error mismatch)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC2 tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests (standalone)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests without dictionaries</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests without dictionaries (standalone)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running general tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running general tests without dictionaries</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running encoding tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running documents tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running numbers tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running keys tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running namespaces tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running extensions tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running reports tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt common tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt date tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt dynamic tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt functions tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt math tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt saxon tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt sets tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt strings tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Total 746 tests, 1 errors</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D Finished libxslt ptests =3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
DURATION: 10</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
END: /usr/lib/libxslt/ptest</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
2025-10-28T20:44</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
STOP: ptest-runner</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
TOTAL: 1 FAIL: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
For arm64:&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
root@qemuarm64:~# ptest-runner libxslt</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
START: ptest-runner</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
2025-10-28T20:54</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
BEGIN: /usr/lib/libxslt/ptest</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D Running libxslt ptests =3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Running .libs/runtest</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
file ./bug-146.out is 217 bytes, result is 0 bytes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Result for ./bug-146.xsl failed</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
failed to stat ./bug-146.err</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Error for ./bug-146.xsl failed</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
File ./bug-146.xsl generated an error</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC2 tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests (standalone)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests without dictionaries</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running REC tests without dictionaries (standalone)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running general tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running general tests without dictionaries</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running encoding tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running documents tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running numbers tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running keys tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running namespaces tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running extensions tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running reports tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt common tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt date tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt dynamic tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt functions tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt math tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt saxon tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt sets tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
## Running exslt strings tests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Total 746 tests, 1 errors</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
FAIL: runtest returned 1</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
FAIL: some libxslt tests failed</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Finished libxslt ptests</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
ERROR: Exit status is 1</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
DURATION: 9</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
END: /usr/lib/libxslt/ptest</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
2025-10-28T20:54</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
STOP: ptest-runner</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
TOTAL: 1 FAIL: 1</div>
<div id=3D"Signature">
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Any suggestions on how to proceed or debug further would be appreciated!</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Pratik</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> 27 October 2025 6:56 AM<br>
<b>To:</b> Pratik Farkase &lt;pratik.farkase@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v5] libxslt: add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat Oct 25, 2025 at 3:21 PM CEST, Pratik Farkas=
e wrote:<br>
&gt; Add ptest support for libxslt 1.1.43 including:<br>
&gt; - do_compile_ptest and do_install_ptest<br>
&gt; - test data installation<br>
&gt; - cleanup of buildpath references<br>
&gt; - added run-ptest installation<br>
&gt;<br>
&gt; Enable --with-plugins only when ptest is enabled, per review feedback.=
<br>
&gt;<br>
&gt; v3:<br>
&gt; - Remove unconditional --with-plugins (leftover from v2)<br>
&gt;<br>
&gt; v4:<br>
&gt; - adapt run-ptest to emit PASS: or FAIL: lines for each test<br>
&gt; - run-ptest installation with proper permissions<br>
&gt;<br>
&gt; v5:<br>
&gt; - Added FILESEXTRAPATHS using ${BPN} for multilib-safe lookup of run-p=
test<br>
&gt; - Guarded run-ptest install in do_install_ptest() to avoid autobuilder=
 failures.<br>
&gt;<br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; ---<br>
<br>
Hi Pratik,<br>
<br>
Thanks for the new version, but we still have some ptest related errors:<br=
>
<br>
AssertionError:<br>
Failed ptests:<br>
{'libxslt': ['runtest_returned_1', 'some_libxslt_tests_failed']}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/2496">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds=
/2496</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/2535">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds=
/2535</a><br>
<br>
Ptest logs can be found here:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20251026-107/testresul=
ts/qemuarm64-ptest/core-image-ptest-libxslt/">https://valkyrie.yocto.io/pub=
/non-release/20251026-107/testresults/qemuarm64-ptest/core-image-ptest-libx=
slt/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20251026-107/testresul=
ts/qemux86-64-ptest/core-image-ptest-libxslt/">https://valkyrie.yocto.io/pu=
b/non-release/20251026-107/testresults/qemux86-64-ptest/core-image-ptest-li=
bxslt/</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_GV2P189MB3005ADB18D1B5A8674AABA72FEFDAGV2P189MB3005EURP_--

