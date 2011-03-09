Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.tian@intel.com>) id 1PxEjY-00082G-PP
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 09:27:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2011 00:24:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,289,1297065600"; d="scan'208";a="718075742"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 09 Mar 2011 00:24:23 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Wed, 9 Mar 2011 16:23:33 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 9 Mar 2011
	16:23:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2011 16:23:30 +0800
Thread-Topic: PERL and FULLPERL from MakeMaker.pm
Thread-Index: AcveM0YGcH81/0D5RISKxkoSUI7zaw==
Message-ID: <625BA99ED14B2D499DC4E29D8138F150575567B0A1@shsmsx502.ccr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: PERL and FULLPERL from MakeMaker.pm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2011 08:27:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, all,

I just found that several perl-based projects (e.g. sgmlspl and git) failed=
 to find
ExtUtils modules, when sstate cache is used for perl-native while original =
build=20
directory generating sstate packages have been deleted.

We have a perl wrapper to make sure @INC correctly including current build
sysroot, which however doesn't solve the problem seen here.

Those projects make use of MakeMaker.pm to generate their Makefiles on the
fly, while MakeMaker.pm generates below lines:

PERL =3D /media/builds-0/demo-0309/tmp/sysroots/x86_64-linux/usr/bin/perl.r=
eal
FULLPERL =3D
/media/builds-0/demo-0309/tmp/sysroots/x86_64-linux/usr/bin/perl.real

I can work around the issues by manually changing Makefile when the error
occurs.=20

I know little about perl internals, and thus would like to know whether it'=
s a
easy issue to tackle. I didn't find any explicit files containing a perl.re=
al from
perl-native sstate package, except the perl wrapper script. So it's interes=
ting
how MakeMaker.pm finds the perl.real binary.

I reported a bug at:
http://bugzilla.yoctoproject.org/post_bug.cgi

Thanks,
Kevin


