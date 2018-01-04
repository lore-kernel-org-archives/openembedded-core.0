Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 901B460191
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 17:24:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w04HOjKq030902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 4 Jan 2018 09:24:45 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 4 Jan 2018 09:24:44 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "BURTON, ROSS"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] allarch: do not set baselib
Thread-Index: AQHThARjR6grYLgFPUa4zUtmTfLc3aNhtOQAgACm6YCAAFH4YIAAjD0AgAC62nU=
Date: Thu, 4 Jan 2018 17:24:44 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84D87A84C4@ALA-MBC.corp.ad.wrs.com>
References: <20180102200049.44793-1-jslater@windriver.com>
	<1514933138.5525.101.camel@linuxfoundation.org>
	<e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
	<007BD92917A2324FA403BCF9A464CF84D87A7007@ALA-MBC.corp.ad.wrs.com>,
	<1515016700.5525.173.camel@linuxfoundation.org>
In-Reply-To: <1515016700.5525.173.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.226]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Thu, 04 Jan 2018 17:24:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We should change fontcache.bbclass to not pass libdir, etc, to the update_f=
ont_cache script, since the environment will be set when the script execute=
s.=0A=
=0A=
That would solve the original problem, but it leaves the general problem of=
 matching LD_LIBRARY_PATH for postinstall intercepts to the multilib for wh=
ich the target binaries they run were compiled.  Or, of generating a LD_LIB=
RARY_PATH containing all possible paths for the rootfs being constructed.=
=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Wednesday, January 03, 2018 1:58 PM=0A=
To: Slater, Joseph; Alexander Kanavin; openembedded-core@lists.openembedded=
.org; BURTON, ROSS=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] allarch: do not set baselib=0A=
=0A=
On Wed, 2018-01-03 at 21:46 +0000, Slater, Joseph wrote:=0A=
> Currently, we do have to provide qemuwrapper with=0A=
> LD_LIBRARY_PATH.  We could hard-code all possible paths into that and=0A=
> not use ${libdir} and ${base_libdir}.  (I tried it and it works.)  We=0A=
> could also create a couple of new variables, like=0A=
> original_base_libdir, that don't get clobbered by allarch.   Maybe=0A=
> qemuwrapper should be smart enough to compute LD_LIBRARY_PATH...=0A=
=0A=
I suspect somehow we therefore need to decouple qemuwrapper from the=0A=
target packages and just ensure that a separate script is available in=0A=
PATH when the rootfs is generated?=0A=
=0A=
The rootfs should know which multilibs are enabled and be able to=0A=
generate the wrapper correctly?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

