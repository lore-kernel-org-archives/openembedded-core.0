Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361F3CCA479
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 03:04:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.80134.1656990283231124338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 20:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bOPTG4D/;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656990283; x=1688526283;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mBMpVSajar98KJ49Gm4qjShYQN4cpTR+w22qWw17/bI=;
  b=bOPTG4D/JgqJTnjkIkR4qa9Rxk7C5jta5PgMoiTlhSgl4GWmZZtQXf8P
   C9Z0lHLf/pZsK7xvr1zazcQ8EVlQHbJeY2wD4xKpOqoUysMUlEZ7uqT1Y
   txwceCSoqd8h0jdMlOURORuatGV2fcRS+xLsQDKWH3yQlg7jZ2ENwu5oT
   YlGhCQRIBxLKgel9MLtR7QZF897rX3f7Pr+3A4E+1VqCXQjonF8ChY85f
   XpzjTfw3qkLBVtmAjYi5xJgcG6MTXFkYm9tS9+/+tTuXwyosgU/9CjXXo
   C7VDlcqVStbQI5+fWKfeCS2Wsp9zVkDfyCG/QfvoipxVk8CI63QNttFvl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263659301"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="263659301"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 20:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="838967510"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2022 20:04:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 20:04:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 20:04:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Jul 2022 20:04:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Jul 2022 20:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asW/n/xZtznmB1d2CzEn0HcSoWzitzzylc/xab5y4KPL3g0+8aJOeQTZm2wd1hSDZCgWXPmIIDd/TEcWYq3FF4ir3Yuiiz/WzwRTW+uSELMqe5HcaE+mlLMTm7s4mLZwFsZuLmLReP4xoUM6x2C08S/Zq/uPpDck0ZJJM1F7bn7jQbU/Zn5RPtdp6XfC7QpFMdL6Xeczm3BvVMTPE+QyrgkeD9RZRn0JW6Qw1eKr/WVV4mPu4zOm3pJFnDyp6tK8azJOI7S1+JPW7iHHquUXetITWxN9VzczgUzmEXvN655BQs8WZojmDSy7FWT1k0vtkAQdM37DaXYd+N2VoPAnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLe+wbAcnkHT3Jvrd3/lFXbLuqavrUnp1xwTOkEbZYY=;
 b=BAydaIHi5RS8rLiJ+UzModumIIGqvBtSLYkL4CdZ7J3gz5YcGO2HEclYprPMVRwqJwZCbONbPjRRcSefMqC2d2TXFVm8OCH7F3wOuav+BfF494JD7yMUSYCwTenKb/fT+36HxBax8pB/vZQLNTDMvmCTm2F3hzTcjr++mdseFonkULO5OTCt7v1Tkk+YGVXRzRx+HOoWHpfL6WAp9qiAG4ukb/yyQigVrTRnRtHAY0S24y81vGXs6Zin3bjneXBSBOrkNIeCGSGUlknjrIliDAs2j+qo12lAZKGGaRHxjYLjlyVRZc0XIwSB7nEbj7yl7qieJVIhrvWXd963k3BEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 03:04:26 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::45ce:6112:4123:9c5f]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::45ce:6112:4123:9c5f%9]) with mapi id 15.20.5395.015; Tue, 5 Jul 2022
 03:04:26 +0000
From: "Tyagi, Yogesh" <yogesh.tyagi@intel.com>
To: "Tyagi, Yogesh" <yogesh.tyagi@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] curl : Add ptest
Thread-Topic: [OE-core] [PATCH v2] curl : Add ptest
Thread-Index: AQHYkBnOFBsXZht8jEyj0RmEi0EfjK1vF2lQ
Date: Tue, 5 Jul 2022 03:04:26 +0000
Message-ID: 
 <SJ0PR11MB58674C58F52046FE2D6A38F48C819@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <16FECF069D78A576.2437@lists.openembedded.org>
In-Reply-To: <16FECF069D78A576.2437@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d287fc7d-4d23-4457-3786-08da5e331225
x-ms-traffictypediagnostic: SA0PR11MB4703:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nKPprMRBl4ylEgjMUqkfSSAgvqb3A9IVUh6UsI/koMpSR7o8r1d/joLZimMm7JAIJzxxzXzu+dw0DDih0xupbG+Av30bQOwLaMLN6ToNIjNV97V9TqvchqDnt+zoats+EWdwy9CFruNV1D9bhvqVn8OA8KsIy3r06VT4wLbKXtUem2sLhTePLlIxZqCMsqW1m5mu8Pnud5IcN4+7HgXt+FwFawuQTNtZYcfVnczHxSKPJlwTIBxZN4k36fGlzqMAgsJE+p/xhvzbtU+qB7I6MDAZD73JrcBu89gqgzGDfWVBEHm3QVHN5MnJgsOdZBBcZSy6zxBegbcMUDVSkKNANDmb+KSb7perIYhJHRHLY1uUAJnm3+ZdPb5VgeCXi93s4LVdI7fpqIRwCTbi8nrUvv9j63Dj6UCFj4r6hQ+zlp7FWhFo0vixFPcItuEe7E6xQAYkHqzsYUYxfJI17b/1latiSBXlxUpZxPSsBS/bvpPUyJiuJPcLfqrkiicszSx1k7eMafFPQwkY9P2IRv+0Ouc9fxbDuS89T4mId6rt3zvds1JqgWxE/lv6kMkbfPBfnVr4BLErwJJdsIMlbeyOUYx1klLtKyuk8luelb+yeD+szM9p1TaxiHiP6KLo6ian+tvMVZZ2JrYMbW/AOjcskOm5Wa+Vs0vQhBHF0OIziMsaffl3B5z4Wf1XHe//oWDiBaMKXdmHx1ZjQYDNbModnfKoaH3zIJ2DjSJT3oMsm3b+hBhXA2K7CJlUntX0L4m4PLYucaq3aObV+HyFGDSyi3CDBWKCcT38Ss94KuKRmw/jIuwc5Z41hYyEjF2yOud2swGWS01H7rqMifONCfKvBw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(376002)(396003)(346002)(316002)(110136005)(53546011)(41300700001)(26005)(55016003)(9686003)(6506007)(8936002)(8676002)(478600001)(7696005)(966005)(71200400001)(52536014)(2906002)(66946007)(66446008)(66476007)(64756008)(76116006)(66556008)(82960400001)(38100700002)(86362001)(33656002)(38070700005)(186003)(83380400001)(122000001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?po3tVDehCkiGdrft8N6niL9FaSyVcDcGilMP+MC8ql8frvBRMvZHBDv8WIm7?=
 =?us-ascii?Q?nXJJOY0GcRSsPoLJBfL1ZgAdGXgcS7ifdUeiCowGSrlxcEc+6Z4jiM9AtO1O?=
 =?us-ascii?Q?APa+Ted3rAnMA0wpy6pM5TorsqWYw46ovbRc8gvJ0VG8IuZ5ZyQUNWcq/KR+?=
 =?us-ascii?Q?eI6kgM/SGmelx/EWBmLTb6RpucvfKSnzyJan9k3A4TskK/+Ow4rjBzaU1KO7?=
 =?us-ascii?Q?bfsPVg6Oi4b4etyLYMe3Ts3gEu+SSYil+OZYlA77nu41tmKSCSphz5nKQSX/?=
 =?us-ascii?Q?/U+ctA/rUQQD50AkaXefb5m9qP+QQ/t8CNm70LGxz5wsuuP89NaEELqZycPM?=
 =?us-ascii?Q?EFGNKgNxd+RG6sZbsrd8BT104P50y6jLWm6raZDhfuYJ7Shwe6N6QKHUvlAi?=
 =?us-ascii?Q?ql/wLNcwuiqZFfh5Y+7Mh9aat4k/wMLK0/bgzm0L7ap0hmyYyti++QI1y6ej?=
 =?us-ascii?Q?Y9nHFB1E/KvaHjS5yKWar+HWXgOP686BF5IGefhF1VrS03HIHTiRQCPdA6jH?=
 =?us-ascii?Q?NYVHlpI0RZomFYQdVIMZp+odKk5m1hi+y1GHwGQ1+R+UjVZSXjjZwBkYiyGp?=
 =?us-ascii?Q?W83HSQVAjsAf6hJibWlQIxkQJUpGMZcx8xH3u9jzdHDh80nR3VhO37wiPUZz?=
 =?us-ascii?Q?uuVLK2gsGGPTbkbCw4VR/rdXf/3siQKemNrO+KexfPYrHJ6vTaPq6QaNnCU3?=
 =?us-ascii?Q?tjDg3U8JRG1eFi/fHnTsOejZhEPAoUr32FwGMUHwQtTLiO0oKXMl0x4bdjqH?=
 =?us-ascii?Q?ppe0av64BeJndcbMW0s8D0vEUFvMMNV8+FbfLIc7lyp3WLQG+gM37Ri4bUpw?=
 =?us-ascii?Q?KKbI7V9JOdezHQz3rbpmAcDewOAtuZjn0K7g3hJGY42MZsEhOh6JLdF02zxo?=
 =?us-ascii?Q?CFblmWAPKWMHHZYymfeLzfAsX/wbqPzfF3ZWg1QZRB6ve5y0//r1ekzzG7/S?=
 =?us-ascii?Q?o/jbfV2TlIABseSew9x9T4mCZA2hiz3DaY40uRjoj+7CO0wa0lazImZ5DCpD?=
 =?us-ascii?Q?L4PHdDMMhnluQk1AcYLmWWce6qzmOahVD7KOmJHxmzjFXEjpyHKpK+UvrkCj?=
 =?us-ascii?Q?Nfu7n+4p/+N/V2DYsF7Y49lILt/sj+ZK8B4BwXZil8aRihItElnpP4RHUy3T?=
 =?us-ascii?Q?zVJgUSfT9DEMR2PRpVCN1rA8EOoPXLCRVo39gUqZw5yrz7ATbZGG0Ws9vk20?=
 =?us-ascii?Q?Jfoak9Y0c2FNw2YkRuYUI13kJTv85GThw3H/JZSRSfxSw1AP18VIMC+EWe/s?=
 =?us-ascii?Q?2k3jZA6b2jVjpO9hRbpdOnA86d8Goya5QqPAqd+kIIhHsFIMwKCf6oapGmbK?=
 =?us-ascii?Q?K16M3/LV7YSaAehau6t2VwUxGI5V1GzkdLP7uFQ0CXnGXFwdOZyL6ZglMrMG?=
 =?us-ascii?Q?CWie7HUWUFirM8nUYC9pax/xdKakOQ6hUB/y14vPLHy+2eOWgELpua6wRTzH?=
 =?us-ascii?Q?N8Ys9yJM0+lzcFR+LnILLnGzXAuiZgBbIoueAic0lA+ksw5F30eCKwO12i9A?=
 =?us-ascii?Q?fgpocXVqNkgRXvw+xN0CiMMcR3X1O96h5IjpB6LqY9wp99cYjcDcBtqzEkuW?=
 =?us-ascii?Q?PBidz55cryN4kYQ/zSAFb42Ji+8sbvXfbGsO0AFf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d287fc7d-4d23-4457-3786-08da5e331225
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 03:04:26.6806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4pFm2+1Qju/3eFHU2nNNq94cZSIuodTGE4VWFc7SW2v2RrtgLL96DooWWtV8A790yyrYTCtXqRyXSHz/9phCdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 03:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167632



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yogesh Tyagi
> Sent: Tuesday, July 5, 2022 8:19 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] curl : Add ptest
>=20

Please ignore this. I will rebase on top of latest upgrade and send v3.

>     - curl-ptest is taking around 200 seconds to execute so
>       added curl-ptest to PTESTS_SLOW
>     - This patch is rework on an existing patch provided
>       by Maxin B. John (maxin.john@intel.com)
>       https://www.openembedded.org/pipermail/openembedded-core/2017-
> July/139176.html
>     - Below is the run log of curl-ptest
>       START: ptest-runner
>       2022-07-03T15:52
>       BEGIN: /usr/lib/curl/ptest
>       ********* System characteristics ********
>       * curl 7.83.1 (x86_64-poky-linux-gnu)
>       * libcurl/7.83.1 OpenSSL/3.0.3 zlib/1.2.12 libidn2/2.3.2
>       * Features: alt-svc AsynchDNS Debug HSTS HTTPS-proxy IDN Largefile =
libz
> NTLM SSL TLS-SRP UnixSockets
>       * Disabled: headers-api
>       * Host: qemux86-64
>       * System: Linux qemux86-64 5.15.44-yocto-standard #1 SMP PREEMPT
> Tue May 31 20:28:59 UTC 2022 x86_64 GNU/Linux
>       * OS: linux
>       * Servers: HTTP-unix
>       * Env:
>       * Seed: 238593
>       *****************************************
>       PASS: test 0001 (1   out of 1466, remaining: 25:07, took 1.029s, du=
ration:
> 00:01)
>       PASS: test 0002 (2   out of 1466, remaining: 13:21, took 0.065s, du=
ration:
> 00:01)
>       ...
>       ...
>       PASS: test 3019 (1460 out of 1466, remaining: 00:00, took 0.012s,
> duration: 03:16)
>       PASS: test 3020 (1461 out of 1466, remaining: 00:00, took 0.011s,
> duration: 03:16)
>       test 3025...The tool set in the test case for this: 'lib3025' does =
not exist
>       TESTDONE: 1280 tests were considered during 197 seconds.
>       TESTDONE: 783 tests out of PASS: 783 report: 100%
>       DURATION: 202
>       END: /usr/lib/curl/ptest
>       2022-07-03T15:56
>       STOP: ptest-runner
>       TOTAL: 1 FAIL: 0
>     - disable the curl tests that are expected to fail
>       [YOCTO #6707]
>=20
> Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/curl/curl/disable-tests  | 28 +++++++++++++++++++
>  meta/recipes-support/curl/curl/run-ptest      |  6 ++++
>  meta/recipes-support/curl/curl_7.83.1.bb      | 24 ++++++++++++++--
>  4 files changed, 57 insertions(+), 2 deletions(-)  create mode 100644
> meta/recipes-support/curl/curl/disable-tests
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index a1ead90649..6c4339e3e1 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -81,6 +81,7 @@ PTESTS_SLOW =3D "\
>      babeltrace2-ptest \
>      busybox-ptest \
>      coreutils-ptest \
> +    curl-ptest \
>      dbus-ptest \
>      e2fsprogs-ptest \
>      findutils-ptest \
> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-
> support/curl/curl/disable-tests
> new file mode 100644
> index 0000000000..92056bd8ca
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -0,0 +1,28 @@
> +# These CRL test (alt-avc) are failing
> +356
> +412
> +413
> +# These CRL tests are scanning docs
> +971
> +1119
> +1132
> +1135
> +# These CRL tests are scnning headers
> +1167
> +# These CRL tests are scanning man pages
> +1139
> +1140
> +1173
> +1177
> +# This CRL test is looking for m4 files
> +1165
> +# This CRL test is looking for src files
> +1185
> +# These CRL tests need --libcurl option to be enabled
> +1400
> +1401
> +1402
> +1403
> +1404
> +1405
> +1465
> diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-
> support/curl/curl/run-ptest
> new file mode 100644
> index 0000000000..614e822922
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +cd tests
> +./runtests.pl -a -n -s | sed \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
> +     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc=
//'
> diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-
> support/curl/curl_7.83.1.bb
> index 1d9de29a65..39c2533513 100644
> --- a/meta/recipes-support/curl/curl_7.83.1.bb
> +++ b/meta/recipes-support/curl/curl_7.83.1.bb
> @@ -9,13 +9,17 @@ SECTION =3D "console/network"
>  LICENSE =3D "MIT-open-group"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D190c514872597083303371684954f238"
>=20
> -SRC_URI =3D "https://curl.se/download/${BP}.tar.xz"
> +SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> +           file://run-ptest \
> +           file://disable-tests \
> +           "
> +
>  SRC_URI[sha256sum] =3D
> "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
>=20
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl
> daniel_stenberg:curl"
>=20
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig multilib_header ptest
>=20
>  # Entropy source for random PACKAGECONFIG option  RANDOM ?=3D
> "/dev/urandom"
> @@ -80,6 +84,22 @@ do_install:append:class-target() {
>  	    ${D}${bindir}/curl-config
>  }
>=20
> +do_compile_ptest() {
> +	oe_runmake test
> +	oe_runmake -C ${B}/tests/server
> +}
> +
> +do_install_ptest() {
> +	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
> +	cp -rf ${B}/tests ${D}${PTEST_PATH}
> +	cp -rf ${S}/tests ${D}${PTEST_PATH}
> +	install -d ${D}${PTEST_PATH}/src
> +	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
> +	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH} }
> +
> +RDEPENDS:${PN}-ptest +=3D "bash perl-modules"
> +
>  PACKAGES =3D+ "lib${BPN}"
>=20
>  FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
> --
> 2.36.1


