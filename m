Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QS8HQ-0007m6-FN
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:49:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 06:46:31 -0700
X-ExtLoop1: 1
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 02 Jun 2011 06:46:30 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 2 Jun 2011 21:46:29 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 2 Jun 2011 21:46:29 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Thu, 2 Jun 2011
	21:46:28 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jun 2011 21:46:26 +0800
Thread-Topic: [OE-core] [RFC v1 PATCH 00/16] populate perl-native into its
	own	directory
Thread-Index: AcwgnHyLDGASV7CPSP6KHBwZbTT5eQAjlQeg
Message-ID: <1865303E0DED764181A9D882DEF65FB697F1A027A3@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com>	<1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
In-Reply-To: <4DE6A43A.3050401@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 02 Jun 2011 13:49:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tom Rini wrote:
> On 06/01/2011 01:05 PM, Phil Blundell wrote:
>> On Wed, 2011-06-01 at 12:39 -0700, Tom Rini wrote:
>>> Maybe race isn't quite the right word.  But recipe A depends on
>>> lib$something-perl-native, and brings in perl-native.  It also
>>> checks=20
>>> for perl in its auto-foo and finds our perl.  It now also uses our
>>> perl when it wants a host perl and all of the potential bad things
>>> happen, yes?=20
>>=20
>> What are the circumstances in which it would want a host perl?  I
>> don't quite understand the issue here.  Surely anything that the
>> host perl can do, perl-native plus some combination of
>> libfoo-perl-native can also do, right?
>=20
> So, here's the two things going on:
> - In some cases (libfoo-perl-native) we need to install various perl
> modules in order to build other target apps.  This is the cpan case,
> iirc.  We don't currently (and can't?) just play whatever games perl
> would like to do to use system-wide perl and a local to TMPDIR cpan
> directory.  We instead go down the path of having perl-native.
> - In order to build perl for the target we need to have the same perl
> version available for use.
>=20
> What we do in oe-core (and oe.dev, historically) is provide
> perl-native=20
> for both of these cases.  What falls down in this case is that  once
> perl-native is built (and in our PATH), if it's a different version
> than system-wide perl, stuff starts failing on version mis-match.=20
> The patch series here fixes that by saying stuff must opt-in to
> having perl-native=20
> be in PATH rather than just system-wide perl.  What I'm saying is that
> while in oe-core nothing falls down here (since nothing that gets
> perl-native also tries to just run 'perl') meta-oe is or will have
> failures.=20
>=20
> Unfortunately I don't have the test cases that drove me to make oe.dev
> like it is handy but I have a feeling that if we go down this path it
> won't be the last we see of the problem, but it might well pop up
> again.=20
>=20
> There is another option here, which is to make perl-native be
> perl-cross, live in its own special directory and figure out how to
> make=20
> a TMPDIR-specific cpan repository available for use by system-wide
> perl.=20

Hi Tom,
Thank you very much for the detailed explanation!
However I'm actually new to cpan and know few about the history of that in =
oe.dev, so I'm not sure I know enough about the background to make a proper=
 decision now.
I suppose Richard would comment here. :-)

Thanks,
-- Dexuan





