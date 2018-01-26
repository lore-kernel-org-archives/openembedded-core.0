Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7A10B787C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 16:59:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jan 2018 08:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,417,1511856000"; d="scan'208";a="14536953"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2018 08:59:04 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.11]) by
	ORSMSX109.amr.corp.intel.com ([169.254.11.199]) with mapi id
	14.03.0319.002; Fri, 26 Jan 2018 08:59:03 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] compiler-options.bbclass: provide and
	validate options
Thread-Index: AQHTdFnF8/Axn0uwe0e6bO3QAAdhfKOCyPiAgAPU2xA=
Date: Fri, 26 Jan 2018 16:59:03 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64052EBB5@ORSMSX112.amr.corp.intel.com>
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
	<1513200676-59900-2-git-send-email-juro.bystricky@intel.com>
	<cd2f3d6c-a67e-1cbd-ae34-0d171597d80c@gmail.com>
In-Reply-To: <cd2f3d6c-a67e-1cbd-ae34-0d171597d80c@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWY3YjM2YWUtNmNmZC00MDQ5LWE5ZmEtNDBmOTJmMzlhYmQ1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiIzNzhENVRaMkRQUGhCbGpOUWVKTFhhcTVvTllqdDVsZGZMeVhDOW90cVwvRk9XVjFaRUJ6bCtJb1FwV2NsN05KRyJ9
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] compiler-options.bbclass: provide and validate options
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
X-List-Received-Date: Fri, 26 Jan 2018 16:59:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On 12/13/17 3:31 PM, Juro Bystricky wrote:
> > As we may be using external toolchains, we cannot assume
> > various compiler options to be valid.
> >
>=20
> While looking through my backlog :),  I think the idea is fine but
> implementation can be a bit more generic. e.g. a common function to
> probe the compiler for a given option then adding/removing it from
> compiler commandline.
>=20

Yes, the code currently hardcodes test for --file-prefix-map and if it is s=
upported, it uses/initializes it.
Not sure a generic API to query gcc command line options can be done easily=
 though. Command line options are queried via various methods, i.e.:
${CC} -Q --help=3Dtarget
${CC} -Q --help=3Doptimizers
${CC} -Q --help=3Dcommon
${CC} -Q --help=3Djoined
...
Generally:

help=3D{common|optimizers|params|target|warnings|[^]{joined|separate|undocu=
mented}}[,...]

We could enumerate all help options, something like
${CC} -Q --help=3Dtarget,common,optimizers,...

But that seems rather costly to do for each command line argument.
Of course, we could also pass the --help argument as an additional argument=
 to the compiler options API to keep it a bit more efficient, but this coul=
d become ugly real quick.

