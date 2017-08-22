Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 86229782EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 21:07:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 14:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,413,1498546800"; d="scan'208";a="127124630"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2017 14:07:07 -0700
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 22 Aug 2017 14:07:05 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX157.amr.corp.intel.com ([169.254.9.80]) with mapi id
	14.03.0319.002; Tue, 22 Aug 2017 14:07:04 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Change to kernel.bbclass broke kernel build when gcc does not
	support -ffile-prefix-map
Thread-Index: AdMbP/IAS7YtOOP4SGipYQJELqD0ggASnOkg
Date: Tue, 22 Aug 2017 21:07:04 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119EBBEA@ORSMSX112.amr.corp.intel.com>
References: <LOXP123MB011794376CC584AF9CC750B485840@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LOXP123MB011794376CC584AF9CC750B485840@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: Change to kernel.bbclass broke kernel build when gcc does not support -ffile-prefix-map
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 21:07:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, the issue was reported by others as well, it should be fixed by this p=
atch:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dmaster-next&id=
=3D2b7646a113cca7698d8484fe14bdbb8683a5f8ab


> -----Original Message-----
> From: Andrew Goodbody [mailto:andrew.goodbody@cambrionix.com]
> Sent: Tuesday, August 22, 2017 5:19 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Bystricky, Juro <juro.bystricky@intel.com>
> Subject: Change to kernel.bbclass broke kernel build when gcc does not
> support -ffile-prefix-map
>=20
> My build uses a version of gcc that does not support -ffile-prefix-map an=
d
> this is now broken after I updated the tree to include the latest commit =
to
> kernel.bbclass "improve reproducibility" 012a70da7ae0617 by Juro Bystrick=
y.
>=20
> The patch introduces the line
> cc_option_supported=3D`${KERNEL_CC} -Q --help=3Djoined | grep ffile-prefi=
x-map`
> When gcc does not support -ffile-prefix-map, the grep will exit with a no=
n-
> zero return code which is caught and causes the do_compile step to fail.
>=20
> Thanks,
> Andrew

