Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJnfS-0006CR-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:12:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2011 07:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="433611772"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 07:09:18 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 22:09:17 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 22:09:17 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 10 May 2011 22:09:16 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 22:09:15 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: AcwL+b7YOUaIZk9ZSe2FhNjukBjrfgDIVF8w
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD8B@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex> <4DC40535.6060102@mentor.com>
In-Reply-To: <4DC40535.6060102@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Tue, 10 May 2011 14:12:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tom Rini wrote:
> On 05/05/2011 03:34 PM, Richard Purdie wrote:
>> On Thu, 2011-05-05 at 22:18 +0800, Cui, Dexuan wrote:
>>> Recently I have been looking into it and I've made some commits (the
>>> top 5 small commits) in
>>> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=3Ddcui/maste=
r_perl-native
>>> BTW: the work is not done completely as some recipes don't build
>>> with the changes. Please have a look anyway to see if I'm in the
>>> correct direction.=20
>>>=20
>>> However, I've got some difficulties and hope to get your help:
>>> 1)  As you said, after we install perl-native into its own
>>> directory,=20
>>> any recipe not depending on perl-native doesn't see
>>> ${STAGING_BINDIR_NATIVE}/perl-native/perl unnecessarily.
>>> However, if we keep the current code, what's the bad consequence if
>>> the recipe not depending on perl-native does see perl of
>>> perl-native?=20
>>> looks no?
>>=20
>> We have an assumption that perl is already on the system we're
>> building on. Perl is a relatively stable language with defined
>> compatibility and interoperability. Most recipes are therefore fine
>> using perl from the build system directly and don't need
>> perl-native. I think we defined a special name for the build system
>> perl (perl-native-runtime?). Better names are welcome but we should
>> ensure we use the right dependency in the right places.=20
>>=20
>> The time to use perl-native instead of perl-native-runtime is where
>> any perl module is being built, perl itself is being built or
>> anything that has an explicit dependency on the perl version present.
>=20
> The problem that follows up is that once we have built any sort of
> perl-native we then have to go and be really really really careful
> that nothing that's not (a) target perl (b) some perl module we built
> and need to run uses it.  Otherwise we run into the problems I think
> that've been hit here.  Problems like this are why for OE I just made
> perl-native be the perl we rely on for everything.
>=20
> I know we talked about this before and you had a strong desire to try
> and do something else but I think this shows maybe we need to try
> going down the perl-native everywhere path first and then see if we
> can't do something different.
Hi Tom, do you mean we should try to use perl-native first and try the
best to avoid using /usr/bin/perl?

Thanks,
-- Dexuan=


