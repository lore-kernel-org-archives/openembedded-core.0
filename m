Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QMd6R-00027w-19
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:31:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 02:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="254849"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 02:28:30 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 May 2011 17:27:40 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 May 2011 17:27:40 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 18 May 2011 17:27:39 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>, 'Patches and
	discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2011 17:27:38 +0800
Thread-Topic: dpkg's admindir: /var/dpkg or /var/lib/dpkg?
Thread-Index: AcwVPc6C8hwJFco9T1GXuGFkpenjEg==
Message-ID: <1865303E0DED764181A9D882DEF65FB694322A3FD4@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: dpkg's admindir: /var/dpkg or /var/lib/dpkg?
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
X-List-Received-Date: Wed, 18 May 2011 09:31:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, I happened to find a bug: in target,  "dpkg --list" shows "dpkg-query: =
failed to open package info file `/var/lib/dpkg/status' for reading: No suc=
h file or directory"

Actually the files(status and available) does exist, but not in /var/lib/dp=
kg/ -- they're in /var/dpkg/. "ln -s /var/dpkg/{status, available} /var/lib=
/dpkg" can resolve the issue.

grepping '/var/dpkg' shows there are many files(package_deb.bbclass, rootfs=
_deb.bbclass, populate_sdk_deb.bbclas, apt.conf ) in which '/var/dpkg' is u=
sed and /var/lib/dpkg is not used at all.

However, looks dpkg's default admindir is /var/lib/dpkg -- e.g., Ubuntu use=
s this.

What should we do? Looks fixing the package dpkg's admindir in the do_confi=
gure needs the least coding.

Thanks,
-- Dexuan
=20


