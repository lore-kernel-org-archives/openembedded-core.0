Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRrJl-0006iJ-E0
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 21:43:01 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QRrGf-0000XR-DI from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 12:39:49 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 12:36:14 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 12:39:47 -0700
Message-ID: <4DE69582.2090508@mentor.com>
Date: Wed, 1 Jun 2011 12:39:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>
In-Reply-To: <1306950977.27470.461.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Jun 2011 19:36:14.0594 (UTC)
	FILETIME=[2B516E20:01CC2093]
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
X-List-Received-Date: Wed, 01 Jun 2011 19:43:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/01/2011 10:56 AM, Richard Purdie wrote:
> On Wed, 2011-06-01 at 10:17 -0700, Tom Rini wrote:
>> On 06/01/2011 06:18 AM, Dexuan Cui wrote:
>>> Currently both perl-native (a.k.a. ${STAGING_BINDIR_NATIVE}/perl )and
>>> perl-native-runtime(a.k.a. the system perl, or /usr/bin/perl) appear in
>>> the PATH when bitbake is running.
>>> This can cause some race conditions: many places detecting perl from PATH
>>> can't make sure which path will be used as this depends on when perl-native's
>>> populate_sysroot is finished, e.g., automake-native and autoconf-native could
>>> use perl-native-runtime while gnu-config-native could use perl-native and
>>> this inconsistent usages can cause trouble, e.g., bug 941.
>>>
>>> And, as RP suggested, "the time to use perl-native instead of
>>> perl-native-runtime is where any perl module is being built, perl itself is
>>> being built or anything that has an explicit dependency on the perl version
>>> present".
>>>
>>> So I made the following changes to try to address the aboves issues:
>>> 1) populate perl-native into its own directory so it won't appear in PATH
>>> by default, and add perlnative.bbclass for these recipes that really depend
>>> on perl-native;
>>> 2) check all perl-native references and correct the ones that should be
>>> perl-native-runtime;
>>> 3) fix any building issues due to the new location of perl-native,
>>> especially cpan and cpan-base .bbclass.
>>>
>>> With the changes, bug 941 doesn't appear.
>>>
>>> Tests I did are:
>>> I tried "bitbale core-image-sato-sdk and meta-toolchain-gmae" in x86_32 and
>>> x86_64 Ubuntu hosts and everything seems building fine.
>>
>> How does this work (by which I mean, test some please :)) with meta-oe
>> where we have (or will have soon) a lot of perl module recipes?  My
>> concern is that we've just moved the race around a bit and we'll hit
>> this somewhere else where we both really need "perl-native" (since we
>> need some cpan stuff we've built) and also mangle in the perl we found
>> in PATH into some scripts...
> 
> Anything building or using perl modules should be inheriting the
> perlnative class. This adds the dependency on perl-native and the
> appropriate PATH entry. Where is the race?

Maybe race isn't quite the right word.  But recipe A depends on
lib$something-perl-native, and brings in perl-native.  It also checks
for perl in its auto-foo and finds our perl.  It now also uses our perl
when it wants a host perl and all of the potential bad things happen, yes?

-- 
Tom Rini
Mentor Graphics Corporation


