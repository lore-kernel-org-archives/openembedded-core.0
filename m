Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRlg8-0007oc-JG for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:41:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51DcQii004719
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 14:38:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04617-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 14:38:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51DcK5H004713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 14:38:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Date: Wed, 01 Jun 2011 14:38:03 +0100
Message-ID: <1306935483.27470.426.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own directory
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
X-List-Received-Date: Wed, 01 Jun 2011 13:41:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Dexuan,

On Wed, 2011-06-01 at 21:18 +0800, Dexuan Cui wrote:
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
> 
> 
> Please review the changes and comment on them. Thanks!

I had a look through the series and it looks good to me. Hopefully this
addresses the perl issues people have been seeing once and for all (and
unclogs the dependencies a little) :)

I'm going to leave this on the mailing list for a while to give others a
chance to review it though.

Cheers,

Richard



