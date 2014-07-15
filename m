Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD0B70636
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:25:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2014 08:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573486418"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:23:42 -0700
Message-ID: <53C5477D.3030501@linux.intel.com>
Date: Tue, 15 Jul 2014 08:23:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1407150923000.13777@localhost>
In-Reply-To: <alpine.LFD.2.11.1407150923000.13777@localhost>
Subject: Re: curious about why bitbake.conf setting of FILES_${PN}-bin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 15:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 06:24 AM, Robert P. J. Day wrote:
>
>    currently doing a writeup on file distribution among a recipe's
> generated packages, and noticed the following. here's a snippet from
> OE's bitbake.conf:
>
>
> PACKAGE_BEFORE_PN ?= ""
> PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> PACKAGES_DYNAMIC = "^${PN}-locale-.*"
> FILES = ""
>
> FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* \
>              ${base_libdir}/*${SOLIBS} \
>              ${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d \
>              ${datadir}/${BPN} ${libdir}/${BPN}/* \
>              ${datadir}/pixmaps ${datadir}/applications \
>              ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
>              ${libdir}/bonobo/servers"
>
>
>    first, to make sure i understand the above correctly, the setting of
> FILES_${PN} defines the (default) entire possible set of generated
> files that will be used to populate the packages created by a single
> recipe, correct?
>
This is correct

>    also, since packages are populated in order, left to right, we'll
> see file definitions like:
>
> FILES_${PN}-dbg = ...
> FILES_${PN}-staticdev = ...
> FILES_${PN}-dev = ...
>
> where, once a file is placed in a package, even if that name occurs
> again in a later package, it will be skipped. (anyone remember which
> manual this is mentioned in?)
>
I just did a basic search and could not find any reference and I know 
that PACKAGES/FILES is "greedy" meaning once a file is consumed by a 
FILES entry it's not available again.  Should probably be added to the 
PACKAGES and / or FILES.

>    however, i also see this:
>
> FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
>
> and i thought, that's weird, that particular package isn't mentioned
> anywhere in bitbake.conf, why is it being defined if it isn't used?
> ah, then i see this in lib_package.bbclass:
>
> PACKAGE_BEFORE_PN = "${PN}-bin"
>
> which clearly defines a library being packaged, but also allowing
> binary executables to be broken out separately, which is fine, but
> it's confusing why the setting of FILES_${PN}-bin is done in
> bitbake.conf, when its only application is (currently) for library
> packaging.
>
>    wouldn't it make more sense to move that line so that
> lib_package.bbclass contained:
>
> FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
> PACKAGE_BEFORE_PN = "${PN}-bin"
>
> that would make lib_package.bbclass more self-contained, and stop
> bitbake.conf from setting a variable that most recipes don't care
> about. thoughts?
>
Blame me for that patch!  Looking back at the commit message from about 
2 years ago I think this got mid-way through a change, with the plan to 
actually remove lib_package completely since all it contained was the 
setting of PACKAGE_BEFORE_PN, therefore having FILES${PN}-bin. Not sure 
why we did not end up completing that.

So another option is to remove the inherits and replace it with 
PACKAGE_BEFORE_PNs, Which would finish off the orignal plan!

> rday
>
> p.s. this kind of goes back to the image vs core-image discussion,
> where one wonders why base classes are doing things that require
> inheriting classes to finish off for them. or something like that.
>

