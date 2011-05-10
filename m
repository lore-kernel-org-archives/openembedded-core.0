Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJqcr-0006wR-ET
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:21:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="640750828"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 10:18:49 -0700
Message-ID: <4DC97379.9020702@linux.intel.com>
Date: Tue, 10 May 2011 10:18:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1304151675-8653-1-git-send-email-koen@dominion.thruhere.net>
	<A6996345-EB9D-4298-942F-9CCDBA49BC30@dominion.thruhere.net>
In-Reply-To: <A6996345-EB9D-4298-942F-9CCDBA49BC30@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] git: make it work on the target
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
X-List-Received-Date: Tue, 10 May 2011 17:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Koen,

Have you built this against oe-core without a TK library available?

We did pull this patch into oe-core, but it breaks the world build.

This was the problem I was trying to address the other day on the patch
that RP bounced.  The inclusion of gitk/git-gui needs to be flexible 
based on TK and X11's availability.

Thanks
	Sau!


On 04/30/2011 01:22 AM, Koen Kooi wrote:
> Saul, this depends on http://patches.openembedded.org/patch/3031/
>
> Op 30 apr 2011, om 10:21 heeft Koen Kooi het volgende geschreven:
>
>> Packaging is synced with OE .dev, but without the -large, thanks to pseudo we retain all (hard)links properly:
>>
>> * git-perltools holds all the utils requiring perl and adds appropriate RDEPENDS
>> * git-tk holds the tcl/tk utils once they get activate
>> * git now packages /usr/libexec/git-core
>>
>> The result:
>>
>> 8.5M	ipk/armv7a/git_1.7.4.3-r2_armv7a.ipk
>> 3.1M	ipk/armv7a/git-dbg_1.7.4.3-r2_armv7a.ipk
>> 4.0K	ipk/armv7a/git-dev_1.7.4.3-r2_armv7a.ipk
>> 12K	ipk/armv7a/git-doc_1.7.4.3-r2_armv7a.ipk
>> 136K	ipk/armv7a/git-perltools_1.7.4.3-r2_armv7a.ipk
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>> meta/recipes-devtools/git/git.inc        |   32 ++++++++++++++++++++++++++++-
>> meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
>> 2 files changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
>> index 843a1d3..7f12859 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -14,11 +14,39 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
>> inherit autotools
>>
>> do_install () {
>> -	oe_runmake install DESTDIR="${D}" bindir=${bindir} gitexecdir=${gitexecdir} \
>> +	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
>> 		template_dir=${datadir}/git-core/templates \
>> 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
>> }
>>
>> -FILES_${PN} += "${datadir}/git-core"
>> +FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
>> +FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
>> +
>> +# Git tools requiring perl
>> +PACKAGES =+ "${PN}-perltools"
>> +FILES_${PN}-perltools += " \
>> +    ${libexecdir}/git-core/git-add--interactive \
>> +    ${libexecdir}/git-core/git-archimport \
>> +    ${libexecdir}/git-core/git-cvsexportcommit \
>> +    ${libexecdir}/git-core/git-cvsimport \
>> +    ${libexecdir}/git-core/git-cvsserver \
>> +    ${bindir}/git-cvsserver \
>> +    ${libexecdir}/git-core/git-difftool \
>> +    ${libexecdir}/git-core/git-relink \
>> +    ${libexecdir}/git-core/git-send-email \
>> +    ${libexecdir}/git-core/git-svn \
>> +    ${datadir}/perl \
>> +"
>> +RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
>> +
>> +# git-tk package with gitk and git-gui
>> +PACKAGES =+ "${PN}-tk"
>> +RDEPENDS_${PN}-tk = "${PN} tk tcl"
>> +EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
>> +FILES_${PN}-tk = " \
>> +    ${bindir}/gitk \
>> +    ${datadir}/gitk \
>> +"
>> +
>>
>> BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
>> index 2ff1ed5..45ef61b 100644
>> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
>> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
>> @@ -1,6 +1,6 @@
>> require git.inc
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>> EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
>>                   ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> --
>> 1.6.6.1
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


