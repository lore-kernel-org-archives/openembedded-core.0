Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id BB29D71AAB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 08:09:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161029080917300_0685
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 01:09:17 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=57484 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c0OhT-0004g5-AP for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2016 04:09:11 -0400
Date: Sat, 29 Oct 2016 04:08:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: couple questions about proper PACKAGECONFIG usage
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
X-List-Received-Date: Sat, 29 Oct 2016 08:09:25 -0000
Content-Type: text/plain; charset=US-ASCII


  one or two curiosities(?) i've run across re: PACKAGECONFIG usage,
and as i'm writing a short tutorial page on that feature, i better
make sure i understand the nuance.

  first, AIUI, for any recipe, *any* possible flag value that can be
assigned to PACKAGECONFIG should be accompanied by the actual set of
values assigned to that ... flag(?). random example: gnutls.inc:

  PACKAGECONFIG ??= "libidn zlib"

  PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
  PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"

so while the default PACKAGECONFIG flag settings are "libidn" and
"zlib", that recipe clearly(?) defines five possible flags. i'm
assuming it would be an error for any possible flag value to not be
accompanied by a corresponding flag setting (not sure of the correct
terminology here, i better check that).

  next, i've noticed a very small number of recipes that define
"empty" flag strings, like this from opkg-utils_git.bb:

  PACKAGECONFIG = "python update-alternatives"
  PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
  PACKAGECONFIG[update-alternatives] = ",,,"      <----- there

that last line clearly represents a no-op in the context of
PACKAGECONFIG, and i was puzzled for a minute until it occurred that
the only way it would have value is if it were tested somewhere else
in the recipe, and sure enough, further down:

  do_install() {
        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
        if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
                rm -f "${D}${bindir}/update-alternatives"
        fi
  }

so "no-op" PACKAGECONFIG flag settings like that:

meta/recipes-devtools/opkg-utils/opkg-utils_git.bb:PACKAGECONFIG[update-alternatives] = ",,,"
meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAGECONFIG[autospawn-for-root] = ",,,"
meta/recipes-connectivity/openssl/openssl.inc:PACKAGECONFIG[perl] = ",,,"

appear to be just a kludgy way to pass a config value to a recipe that
really just uses the PACKAGECONFIG mechanism to hand it over, without
using actual PACKAGECONFIG processing, is that a fair way to describe
that? (put another way, if any recipe defines a "no-op" like that, it
better test that setting somewhere else manually; otherwise, there's
no real point to it, yes?)

  actually, that might be it for this post ... am i missing any other
subtleties involving PACKAGECONFIG worth mentioning? another
PACAKGECONFIG-related post coming shortly, but it's more focused so
i'll post it separately.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


