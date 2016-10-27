Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 838C371A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 09:53:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161027095322101_0484
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 09:53:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=33302 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzhN6-0003AT-Bw for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2016 05:53:16 -0400
Date: Thu, 27 Oct 2016 05:52:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610270533590.12908@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to add new perl modules to stock OE build?
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
X-List-Received-Date: Thu, 27 Oct 2016 09:53:23 -0000
Content-Type: text/plain; charset=US-ASCII


  (followup to earlier thread, but now that i have a better idea of
what i'm trying to do, i decided to start a new thread that should be
more focused. apologies for dragging this out just a bit longer.)

  as i posted earlier, i want to add some perl modules to a basic poky
build; in this case, building core-image-minimal for qemuppc, if that
makes any difference.

  initially, i went hunting for existing recipes for the modules i
wanted (meta-perl, meta-cpan, ...), until i noticed that the perl
recipe directory contains a "perl-rdepends_5.22.1.inc" file, which as
i read it defines all of the modules to be incorporated into the
"perl-modules" package, so that *appears* to be the solution -- just
extend the set of modules to be built by extending the contents of
that file.

  so, first, is that the recommended (or even correct) approach? as an
example, i want to add Text::Template; would that involve adding lines
similar to the following?

 RDEPENDS_${PN}-module-text-template += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-text-template += "${PN}-module-strict"
 RDEPENDS_${PN}-module-text-template += "${PN}-module-vars"

(not saying that would be the *complete* set of lines for that module,
only that that looks like a starting point.)

  next, if that's a valid approach, i can see the code near the bottom
of perl_5.22.1.bb that appears to be taking care of creating the
perl-modules package:

===== start =====

# Create a perl-modules package recommending all the other perl
# packages (actually the non modules packages and not created too)
ALLOW_EMPTY_perl-modules = "1"
PACKAGES_append = " perl-modules "

PACKAGESPLITFUNCS_prepend = "split_perl_packages "

python split_perl_packages () {
    libdir = d.expand('${libdir}/perl/${PV}')
    do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)

    # perl-modules should recommend every perl module, and only the
    # modules. Don't attempt to use the result of do_split_packages() as some
    # modules are manually split (eg. perl-module-unicore).
    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES', True).split())
    d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
}

PACKAGES_DYNAMIC += "^perl-module-.*"

===== end =====

  i sort of see what that's doing  -- don't understand it completely,
but i'm assuming it's processing the contents of that .inc file to
list all modules to be built and incorporated into the "perl-modules"
dynamic package.

  is this even remotely the right approach? is there an OE/YP manual
that explains this somewhere? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


