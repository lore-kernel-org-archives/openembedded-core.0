Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRp6T-0003gx-08
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:21:09 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QRp3L-0002VA-5M from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 10:17:55 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 10:17:54 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 10:17:54 -0700
Message-ID: <4DE67440.1020405@mentor.com>
Date: Wed, 1 Jun 2011 10:17:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Jun 2011 17:17:54.0975 (UTC)
	FILETIME=[D85C12F0:01CC207F]
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
X-List-Received-Date: Wed, 01 Jun 2011 17:21:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/01/2011 06:18 AM, Dexuan Cui wrote:
> Currently both perl-native (a.k.a. ${STAGING_BINDIR_NATIVE}/perl )and
> perl-native-runtime(a.k.a. the system perl, or /usr/bin/perl) appear in
> the PATH when bitbake is running.
> This can cause some race conditions: many places detecting perl from PATH
> can't make sure which path will be used as this depends on when perl-native's
> populate_sysroot is finished, e.g., automake-native and autoconf-native could
> use perl-native-runtime while gnu-config-native could use perl-native and
> this inconsistent usages can cause trouble, e.g., bug 941.
> 
> And, as RP suggested, "the time to use perl-native instead of
> perl-native-runtime is where any perl module is being built, perl itself is
> being built or anything that has an explicit dependency on the perl version
> present".
> 
> So I made the following changes to try to address the aboves issues:
> 1) populate perl-native into its own directory so it won't appear in PATH
> by default, and add perlnative.bbclass for these recipes that really depend
> on perl-native;
> 2) check all perl-native references and correct the ones that should be
> perl-native-runtime;
> 3) fix any building issues due to the new location of perl-native,
> especially cpan and cpan-base .bbclass.
> 
> With the changes, bug 941 doesn't appear.
> 
> Tests I did are:
> I tried "bitbale core-image-sato-sdk and meta-toolchain-gmae" in x86_32 and
> x86_64 Ubuntu hosts and everything seems building fine.

How does this work (by which I mean, test some please :)) with meta-oe
where we have (or will have soon) a lot of perl module recipes?  My
concern is that we've just moved the race around a bit and we'll hit
this somewhere else where we both really need "perl-native" (since we
need some cpan stuff we've built) and also mangle in the perl we found
in PATH into some scripts...

-- 
Tom Rini
Mentor Graphics Corporation


