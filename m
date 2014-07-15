Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id E824D7057B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:24:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140715132424048
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:24:24 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=52949 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X72iQ-0000GD-KZ for openembedded-core@lists.openembedded.org;
	Tue, 15 Jul 2014 09:24:18 -0400
Date: Tue, 15 Jul 2014 09:24:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407150923000.13777@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: curious about why bitbake.conf setting of FILES_${PN}-bin
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
X-List-Received-Date: Tue, 15 Jul 2014 13:24:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently doing a writeup on file distribution among a recipe's
generated packages, and noticed the following. here's a snippet from
OE's bitbake.conf:


PACKAGE_BEFORE_PN ?= ""
PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
PACKAGES_DYNAMIC = "^${PN}-locale-.*"
FILES = ""

FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
            ${base_bindir}/* ${base_sbindir}/* \
            ${base_libdir}/*${SOLIBS} \
            ${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d \
            ${datadir}/${BPN} ${libdir}/${BPN}/* \
            ${datadir}/pixmaps ${datadir}/applications \
            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
            ${libdir}/bonobo/servers"


  first, to make sure i understand the above correctly, the setting of
FILES_${PN} defines the (default) entire possible set of generated
files that will be used to populate the packages created by a single
recipe, correct?

  also, since packages are populated in order, left to right, we'll
see file definitions like:

FILES_${PN}-dbg = ...
FILES_${PN}-staticdev = ...
FILES_${PN}-dev = ...

where, once a file is placed in a package, even if that name occurs
again in a later package, it will be skipped. (anyone remember which
manual this is mentioned in?)

  however, i also see this:

FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"

and i thought, that's weird, that particular package isn't mentioned
anywhere in bitbake.conf, why is it being defined if it isn't used?
ah, then i see this in lib_package.bbclass:

PACKAGE_BEFORE_PN = "${PN}-bin"

which clearly defines a library being packaged, but also allowing
binary executables to be broken out separately, which is fine, but
it's confusing why the setting of FILES_${PN}-bin is done in
bitbake.conf, when its only application is (currently) for library
packaging.

  wouldn't it make more sense to move that line so that
lib_package.bbclass contained:

FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
PACKAGE_BEFORE_PN = "${PN}-bin"

that would make lib_package.bbclass more self-contained, and stop
bitbake.conf from setting a variable that most recipes don't care
about. thoughts?

rday

p.s. this kind of goes back to the image vs core-image discussion,
where one wonders why base classes are doing things that require
inheriting classes to finish off for them. or something like that.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



