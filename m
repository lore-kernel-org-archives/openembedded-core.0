Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id A499C71997
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:22:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170207122202870_0484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 12:22:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=47721 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cb4mS-0000WB-Ef for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2017 07:21:56 -0500
Date: Tue, 7 Feb 2017 07:21:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702070704440.10245@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how many ways can a recipe place content in its own ${STAGING_BINDIR_CROSS}?
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
X-List-Received-Date: Tue, 07 Feb 2017 12:22:36 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-768011996-1486469961=:10245"
Content-ID: <alpine.LFD.2.20.1702070719330.10469@uk63952.mitel.com>

--587868445-768011996-1486469961=:10245
Content-Type: text/plain; CHARSET=KOI8-R
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.20.1702070719331.10469@uk63952.mitel.com>


  looking at how a recipe builds its own recipe-sysroot and
recipe-sysroot-native based on build dependencies, so i need to back
up and look at how a recipe installs content under its own sysroot, so
i'll use apache2 as an example.

  if i look at what is installed under
sysroots-components/ppc7400/apache2, i can see that this is the entire
contents further under usr/bin:

$ tree usr/bin
usr/bin
„€€ crossscripts
    „€€ apxs

  fair enough, so how did that "apxs" script come to be there? ah, in
the apache2_2.4.25.bb recipe file, it's simply done manually:

  SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"

  apache_sysroot_preprocess () {
      install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
      install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
      ... snip ...

ok, that's easy enough, but let's look at "apr" now. if i look at what
apr installs under its sysroot and specifically under the same usr/bin
directory, i see:

$ tree usr/bin
usr/bin
„€€ crossscripts
    „€€ apr-1-config

  so how did *that* script come to be under there? if i look at the
apr_1.5.2.bb recipe, there's no manual installation of that script as
there was with apache2. rather, there's all this:

do_install_append_class-target() {
        sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_rules.mk
        sed -i -e 's,${STAGING_DIR_HOST},,g' \
               -e 's,APR_SOURCE_DIR=.*,APR_SOURCE_DIR=,g' \
               -e 's,APR_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apr-1-config
}

SSTATE_SCAN_FILES += "apr_rules.mk libtool"

SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"

apr_sysroot_preprocess () {
        d=${SYSROOT_DESTDIR}${datadir}/apr
        install -d $d/
        cp ${S}/build/apr_rules.mk $d/
        sed -i s,apr_builddir=.*,apr_builddir=,g $d/apr_rules.mk
        sed -i s,apr_builders=.*,apr_builders=,g $d/apr_rules.mk
        sed -i s,LIBTOOL=.*,LIBTOOL=${HOST_SYS}-libtool,g $d/apr_rules.mk
        sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g $d/apr_rules.mk
        cp ${S}/build/mkdir.sh $d/
        cp ${S}/build/make_exports.awk $d/
        cp ${S}/build/make_var_export.awk $d/
        cp ${S}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${datadir}/build-1/libtool

  so i can only assume that, somewhere in the middle of all that,
there is an implied installation of the "apr-1-config" script in the
crossscripts directory.  is that what's happening?

  i can see a number of recipes that install content under their
sysroot/usr/bin/crossscripts, i'm just trying to clarify the different
ways that that happens.

  one more crossscripts question coming shortly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-768011996-1486469961=:10245--
