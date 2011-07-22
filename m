Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qk9Rs-0006Nv-NZ
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 08:43:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 23:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,245,1309762800"; d="scan'208";a="33324887"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 23:38:50 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 22 Jul 2011 14:37:32 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 22 Jul 2011 14:37:29 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 22 Jul 2011 14:37:10 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2011 14:37:09 +0800
Thread-Topic: [OE-core] [PATCH 1/2] tcf-agent: upgrade to the latest stable
	revision 0.0+svnr1855
Thread-Index: AcxIKOtcd7VfYnwXTk+a8vWK95eL6AAD4azA
Message-ID: <1865303E0DED764181A9D882DEF65FB6AD1E494E66@shsmsx502.ccr.corp.intel.com>
References: <cover.1311256622.git.dexuan.cui@intel.com>
	<e97fc4ed752510e6e03944bf5e8f9c5e6a42409e.1311256622.git.dexuan.cui@intel.com>
	<4E28FE28.8040402@linux.intel.com>
In-Reply-To: <4E28FE28.8040402@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
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
X-List-Received-Date: Fri, 22 Jul 2011 06:43:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2011-07-22:
> There seems to be a compile issue with this patch.
>=20
> For an X86 Build
> fatal error: uuid/uuid.h: No such file or directory | compilation
Hi Saul,
Sorry! We didn't do enough test...

Lianhao and I have got the causes of the failures.
This uuid.h issue is due to the lackness of util-linux in DEPENDS -- the ne=
w tcf-agent code introduces the dependency.
=20
> And then for an ARM build:
>=20
> services/dwarfframe.c | In file included from framework/cpudefs.c:33:0:
> | ././machine/cpudefs-ext.h:23:26: fatal error: cpudefs-mdep.h: No |
> such file or directory | compilation terminated. | make: ***
The new tcf-agent code by default enables some services we don't actually n=
eed, and the they cause the ARM build failure.
We added the following to fix the issue:
+CFLAGS +=3D "-DSERVICE_RunControl=3D0 -DSERVICE_Breakpoints=3D0 \
+    -DSERVICE_Memory=3D0 -DSERVICE_Registers=3D0 -DSERVICE_MemoryMap=3D0 \
+    -DSERVICE_StackTrace=3D0 -DSERVICE_Symbols=3D0 -DSERVICE_LineNumbers=
=3D0 \
+    -DSERVICE_Expressions=3D0"

Below is the new commit(in the same branch dcui/tcf-agent)
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/tcf-ag=
ent&id=3Dba36534bfc048d7bd2b15dc55ba253cc98c3e037

Currently Lianhao and I are doing more testing and will report back asap.

Thanks,
-- Dexuan




