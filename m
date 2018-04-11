Return-Path: <juro.bystricky@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 09821607DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 15:27:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2018 08:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,436,1517904000"; d="scan'208";a="33502024"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga006.jf.intel.com with ESMTP; 11 Apr 2018 08:26:53 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.141]) by
	ORSMSX103.amr.corp.intel.com ([169.254.5.34]) with mapi id
	14.03.0319.002; Wed, 11 Apr 2018 08:26:53 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [PATCH 1/1] python-xcbgen_1.12: improve reproducibility
Thread-Index: AQHTzeFzXSYS+YGPpkiPU+kmJgqlkKP7KlGAgACL6Jg=
Date: Wed, 11 Apr 2018 15:26:52 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C69F640@ORSMSX112.amr.corp.intel.com>
References: <1523044641-56994-1-git-send-email-juro.bystricky@intel.com>
	<1523044641-56994-2-git-send-email-juro.bystricky@intel.com>,
	<CAJTo0LZFV2t1sjTaOrFfZWqTAcm49qUCj-fvpOxRdkD-+wQhDA@mail.gmail.com>
In-Reply-To: <CAJTo0LZFV2t1sjTaOrFfZWqTAcm49qUCj-fvpOxRdkD-+wQhDA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-xcbgen_1.12: improve reproducibility
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
X-List-Received-Date: Wed, 11 Apr 2018 15:27:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This would solve the .pyc timestamps problem. However, from reproducibility=
 point of view, it is a bit more desirable to use python-native, as - in pr=
inciple - different host Python versions can produce different compiled cod=
e as well. =0A=
So it is not the timestamps only. =0A=
=0A=
________________________________________=0A=
From: Burton, Ross [ross.burton@intel.com]=0A=
Sent: Tuesday, April 10, 2018 5:02 PM=0A=
To: Bystricky, Juro=0A=
Cc: OE-core; Purdie, Richard; Juro Bystricky; Martin Jansa=0A=
Subject: Re: [PATCH 1/1] python-xcbgen_1.12: improve reproducibility=0A=
=0A=
On 6 April 2018 at 20:57, Juro Bystricky <juro.bystricky@intel.com> wrote:=
=0A=
> In order to remove timestamps from all .pyc files we need to recompile=0A=
> them with python3-native, as we cannot rely on the host python being=0A=
> able to do that. Both python-native and python3-native derive the timesta=
mp=0A=
> from SOURCE_DATE_EPOCH if present.=0A=
> However, building python3-native can be computationally expensive, so=0A=
> we resort to python3-native only when building reproducible packages:=0A=
> (BUILD_REPRODUCIBLE_BINARIES =3D '1'), otherwise we use the host python3.=
=0A=
=0A=
The logical extension of this is that every recipe that ships .py=0A=
needs to depend on python3-native so that it can recompile.=0A=
=0A=
However, there's another solution...=0A=
=0A=
.pyc files are basically a four byte magic number, a four byte=0A=
timestamp, and then the byte code.  It won't be that many lines of=0A=
Python in a do_package[postfunc] to search for __pycache__/*.pyc files=0A=
in the packages and replace the timestamp with SOURCE_DATE_EPOCH if=0A=
reproducible builds are enabled.=0A=
=0A=
Ross=0A=

