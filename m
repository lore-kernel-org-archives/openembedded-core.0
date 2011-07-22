Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkHXc-0006Am-9W
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:21:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2011 08:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,248,1309762800"; d="scan'208";a="28998912"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga002.jf.intel.com with ESMTP; 22 Jul 2011 08:17:18 -0700
Message-ID: <4E29947D.1040302@linux.intel.com>
Date: Fri, 22 Jul 2011 08:17:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/5] Fix building in very long paths
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
X-List-Received-Date: Fri, 22 Jul 2011 15:21:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 01:08 PM, Tom Rini wrote:
> Hey all,
>
> The following series fixes building in deep paths.  To be clear, the
> biggest problem is that shebang (#!) is not portable over 80 chars in
> length and we already eat up 51 chars with sysroot paths on x86_64.
> The fix, in concept is easy, use /usr/bin/env instead.  In practice,
> perl makes this difficult.  In this series we fix python to use
> /usr/bin/env, add a 'nativeperl' wrapper (RP's name) so that we can
> do /usr/bin/env nativeperl and not require sub-recipes to have inherit
> perlnative (eg sato-icon-theme would need perlnative if we didn't do this).
> Next we have cpan make sure it mangles everything to use nativeperl and
> then go fix a few hard cases by hand.  All of these changes are either
> direct ports (python) or port + more work (perl/cpan) of changes I did
> in oe.dev.  With this series I'm able to build world for qemux86 in a
> very long path (which means I could then turn on doing this in our jenkins
> cluster on the weekend like I did for oe.dev on testing-next).
>
> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
>    Mei Lei (1):
>          lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib trini/work-in-deep-paths-v1
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/work-in-deep-paths-v1
>
> Tom Rini (5):
>    python-native: Mangle scripts to use /usr/bin/env python, bump PR
>    gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
>    perl-native: Add a perl-native wrapper in the normal bindir
>    cpan.bbclass: Perform more mangling for perl path
>    icon-naming-utils-native: Fix long path to perl in icon-name-mapping
>
>   meta/classes/cpan.bbclass                          |    3 ++
>   .../icon-naming-utils-native_0.8.7.bb              |    7 +++-
>   meta/recipes-devtools/perl/liburi-perl_1.58.bb     |    2 +-
>   .../perl/libxml-parser-perl_2.40.bb                |    2 +-
>   meta/recipes-devtools/perl/libxml-perl_0.08.bb     |    2 +-
>   .../perl/libxml-simple-perl_2.18.bb                |    2 +-
>   meta/recipes-devtools/perl/perl-native_5.12.3.bb   |   17 +++++++++-
>   .../recipes-devtools/python/python-native_2.6.6.bb |    5 +++
>   .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
>   .../perl/libconvert-asn1-perl_0.22.bb              |    2 +-
>   .../recipes-extended/perl/libtimedate-perl_1.20.bb |    2 +-
>   .../perl/libxml-namespacesupport-perl_1.11.bb      |    2 +-
>   meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |    2 +-
>   .../use-usr-bin-env-for-python-in-xml2po.patch     |   33 ++++++++++++++++++++
>   meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    5 ++-
>   15 files changed, 75 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into oe-core

Thanks
	Sau!


