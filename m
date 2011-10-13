Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RETfA-0004jf-OT
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 00:22:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Oct 2011 15:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="62762947"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 13 Oct 2011 15:16:19 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 13 Oct 2011 15:16:18 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 13 Oct 2011 15:16:18 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Oct 2011 15:16:18 -0700
Thread-Topic: [OE-core] [PATCH 4/4] python, python-native: upgrade from
	2.6.6 to 2.7.2
Thread-Index: AcyJ8MspOoEkYhXPS1OXtsKFEDEdQAAA4CoQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E0BCED05@orsmsx504.amr.corp.intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
	<20110930184603.GI7364@jama.jama.net>
	<CA+chaQcSHh=j9rGCYehU4ce4iQw_ZCoL_oaqxH7kWFZB16NqyQ@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E0BCEAC0@orsmsx504.amr.corp.intel.com>
	<20111013214048.GA3542@jama.jama.net>
In-Reply-To: <20111013214048.GA3542@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Thu, 13 Oct 2011 22:22:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Thursday, October 13, 2011 2:41 PM
> To: Kamble, Nitin A
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/4] python, python-native: upgrade from
> 2.6.6 to 2.7.2
>=20
> On Thu, Oct 13, 2011 at 01:09:15PM -0700, Kamble, Nitin A wrote:
> > Martin,
> >   I am fixing the python 2.7.2 recipe, and I need to update the
> generate-manifest-2.7.py script slightly, to get more files included in
> the python-core package.
>=20
> great, I was debuging it a bit more today and found out that the
> problem seems to be in python-native, because with python-native-2.7.2
> when I try to build old python-2.6.6 it's also tring to link extra
> modules to -native libpython2.7 and fails:
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so: file
> not recognized: File format not recognized
>=20
> but even after comparing sysroots/builddirs/logs from 2.6.6 and 2.7.2 I
> still don't see why it picked right libpython2.6 before and now it
> fails.
> I've tried it without multilib support and partially reverted changes
> in patches from 2.6.6 and still it fails :/
>=20
> btw: there seems to be also issue in runtime SHR root@gjama ~ $ python
> -v Could not find platform independent libraries <prefix> Consider
> setting $PYTHONHOME to <prefix>[:<exec_prefix>] # installing zipimport
> hook import zipimport # builtin # installed zipimport hook
> ImportError: No module named site
> # clear __builtin__._
> # clear sys.path
> # clear sys.argv
> # clear sys.ps1
> # clear sys.ps2
> # clear sys.exitfunc
> # clear sys.exc_type
> # clear sys.exc_value
> # clear sys.exc_traceback
> # clear sys.last_type
> # clear sys.last_value
> # clear sys.last_traceback
> # clear sys.path_hooks
> # clear sys.path_importer_cache
> # clear sys.meta_path
> # clear sys.flags
> # clear sys.float_info
> # restore sys.stdin
> # restore sys.stdout
> # restore sys.stderr
> # cleanup __main__
> # cleanup[1] zipimport
> # cleanup[1] signal
> # cleanup[1] exceptions
> # cleanup[1] _warnings
> # cleanup sys
> # cleanup __builtin__
> # cleanup ints: 5 unfreed ints
> # cleanup floats
>=20
> > BTW how to run this script ? some documentation of it in the script
> would be useful.

I got python 2.7.2 to work inside the qemux86 machine now. I will send a pu=
ll request for review/test today.

Thanks,
Nitin


>=20
> just execute it and it prints manifest, so something like this:
> openembedded-core $ scripts/contrib/python/generate-manifest-2.7.py >
> meta/recipes-devtools/python/python-2.7-manifest.inc
>=20
> Regards,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


