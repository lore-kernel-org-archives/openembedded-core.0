Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 4439A6093E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 11:21:27 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161128112127115_0485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 11:21:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=59352 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cBJzt-0007nX-Co for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2016 06:21:21 -0500
Date: Mon, 28 Nov 2016 06:20:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Mon, 28 Nov 2016 11:21:30 -0000
Content-Type: text/plain; charset=US-ASCII


  a bit confused by what i'm seeing in a recent
qemuppc/core-image-minimal build on my fedora system regarding which
native packages are built, despite what's in bitbake.conf (using
current poky layer checkout).

  first, here's a snippet from bitbake.conf:

  ASSUME_PROVIDED = "\
    bzip2-native \          <---
    chrpath-native \
    file-native \           <---
    findutils-native \
    git-native \
    grep-native \
    diffstat-native \
    ... snip ...

suggesting that (among other things) bzip2-native and file-native
shouldn't be built -- it's the developer's responsibility to install
them, yes? but if i peek under tmp/work/x86_64-linux, i can see:

  ...
  byacc-native/
  bzip2-native/             <---
  createrepo-native/
  cross-localedef-native/
  cryptodev-linux-native/
  db-native/
  dtc-native/
  e2fsprogs-native/
  elfutils-native/
  expat-native/
  file-native/              <---
  flex-native/
  ...

so that's ... confusing.

  add to that this bit in the YP Quick Start Guide at
http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.html:

  "Build Host Packages
  ...
  Fedora

     $ sudo dnf install gawk make wget tar bzip2 gzip python unzip perl patch \
     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
     findutils which SDL-devel xterm

my understanding was that that list represented what the developer was
required to install on his build host *manually* before going any
further, so you can see "bzip2" in that list, but you don't see
"file". given that the "file" command comes in its own package, should
that list of allegedly mandatory Build Host Packages not include
*everything* listed in ASSUME_PROVIDED?

  finally, in sanity.bbclass, one reads:

  SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
      gzip gawk chrpath wget cpio perl file"

which oddly *does* list the "file" command, but says nothing about
"sed", which *is* mentioned in ASSUME_PROVIDED, but is also not
mentioned in the "Build Host Packages" in the YP Quick Start Guide.

  is it just me, or does some of this seem out of sync?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



