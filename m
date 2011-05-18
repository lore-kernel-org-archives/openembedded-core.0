Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QMVgw-0007Bu-NX
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 03:36:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2011 18:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,228,1304319600"; 
   d="scan'208";a="93955"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2011 18:33:55 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 May 2011 09:32:37 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 May 2011 09:32:37 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 18 May 2011 09:32:34 +0800
From: "Yu, Ke" <ke.yu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 18 May 2011 09:32:32 +0800
Thread-Topic: Qt4 mips-relocate.patch
Thread-Index: AcwUrT7SCYPrU9mLQgGe/9wtuEYD5gASg5+Q
Message-ID: <33AB447FBD802F4E932063B962385B35546E7C23@shsmsx501.ccr.corp.intel.com>
References: <201105171712.31423.paul.eggleton@linux.intel.com>
In-Reply-To: <201105171712.31423.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt4 mips-relocate.patch
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
X-List-Received-Date: Wed, 18 May 2011 01:36:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

This patch is to fix the issue which is specifically found in Qt4.6.x with =
binutils 2.20.  and the upgrade of either Qt or binutils may fix this issue=
. Since you have go through the binutils change, and did not find relevant =
commit, probably the relevant change lies in Qt upgrade, or more specifical=
ly, the change with libQtWebKit.=20

Regardless of where the root cause may be, since the combination of QT4.7 a=
nd bintuils 2.21 can pass the build now, I think it is safe to remove this =
patch and reenable the "-Bsymbolic-functions" flag. It is will also benefit=
 the runtime performance.

Regards
Ke

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Wednesday, May 18, 2011 12:13 AM
To: Yu, Ke
Cc: openembedded-core@lists.openembedded.org
Subject: Qt4 mips-relocate.patch

Hi there,

I was going through patches for Qt4 and found that (among others) mips- rel=
ocate.patch was not being applied for Qt 4.7.x. From the comment it seems i=
t was intended to fix a link-time error when building qt4-x11-free for mips=
 - some kind of issue with binutils 2.20 [1]. However I just built qt4-x11-=
free
4.7.3 with MACHINE=3Dqemumips without the patch and it built just fine. We'=
re using binutils 2.21 now, I checked and there is nothing relevant that I =
can see in the binutils changelog to suggest that a mips/symbolic-functions=
 issue was fixed, and we are apparently still enabling the option that orig=
inally triggered the problem when building Qt 4.7.x.

Ke / anyone else, any ideas? If the problem can no longer reproduced can we=
 simply remove this patch?

Cheers,
Paul

[1] http://bugzilla.pokylinux.org/show_bug.cgi?id=3D271

--=20

Paul Eggleton
Intel Open Source Technology Centre


