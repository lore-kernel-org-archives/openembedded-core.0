Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QMsQH-0007Wv-7t
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 03:53:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 18:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,234,1304319600"; 
   d="scan'208";a="700779"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 18:50:12 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 19 May 2011 09:49:49 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 19 May 2011 09:48:05 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 09:48:04 +0800
Thread-Topic: [OE-core] dpkg's admindir: /var/dpkg or /var/lib/dpkg?
Thread-Index: AcwVYfcaGDSbHQTKQmW3eDVSnCdNdgAYq5SA
Message-ID: <1865303E0DED764181A9D882DEF65FB694322A3FD7@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB694322A3FD4@shsmsx502.ccr.corp.intel.com>
	<4DD3CC0F.7070702@windriver.com>
In-Reply-To: <4DD3CC0F.7070702@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: dpkg's admindir: /var/dpkg or /var/lib/dpkg?
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
X-List-Received-Date: Thu, 19 May 2011 01:53:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote:
> On 5/18/11 4:27 AM, Cui, Dexuan wrote:
>> Hi, I happened to find a bug: in target,  "dpkg --list" shows
>> "dpkg-query: failed to open package info file `/var/lib/dpkg/status'
>> for reading: No such file or directory" =20
>>=20
>> Actually the files(status and available) does exist, but not in
>> /var/lib/dpkg/ -- they're in /var/dpkg/. "ln -s /var/dpkg/{status,
>> available} /var/lib/dpkg" can resolve the issue. =20
>>=20
>> grepping '/var/dpkg' shows there are many files(package_deb.bbclass,
>> rootfs_deb.bbclass, populate_sdk_deb.bbclas, apt.conf ) in which
>> '/var/dpkg' is used and /var/lib/dpkg is not used at all. =20
>>=20
>> However, looks dpkg's default admindir is /var/lib/dpkg -- e.g.,
>> Ubuntu uses this.=20
>>=20
>> What should we do? Looks fixing the package dpkg's admindir in the
>> do_configure needs the least coding.=20
>=20
> I would say that /var/lib/dpkg is the "correct" directory to use.=20
> This matches the behavior on other deb bases systems.  (It also
> mimics other pkg managers who place their data into /var/lib/...)
>=20
Mark, thank you for the comment!
So looks we should fix any recipe that uses /var/dpkg?

The fact in poky /var/dpkg is widely used and /var/lib/dpkg is not used at =
all may imply we chose /var/dpkg for some reason?  Even meta/recipes-devtoo=
ls/dpkg/run-postinsts/run-postinsts and meta/recipes-devtools/dpkg/run-post=
insts/run-postinsts.awk use /var/dpkg.

Is it possible there is some story behind this?  Please let me Cc more peop=
le who touched this.

Thanks,
-- Dexuan


