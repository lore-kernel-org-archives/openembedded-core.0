Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 60846719A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:52:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161025115228504_0484;
	Tue, 25 Oct 2016 11:52:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=11319 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bz0HG-0004Lz-1n; Tue, 25 Oct 2016 07:52:22 -0400
Date: Tue, 25 Oct 2016 07:51:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610250738570.8652@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Tue, 25 Oct 2016 11:52:35 -0000
Content-Type: text/plain; charset=US-ASCII


  following up on my original query, i'm now in the process of
"mapping" a couple hundred CentOS perl rpms to their OE equivalents,
and here's the process so far; just want to check that i'm going about
this in a sane way.

  first, as chris larson suggested, use "oe-pkgdata-util" to see which
generated perl modules appear to match up to equivalent rpms, and
quite a number of them seem to be direct equivalents, such as:

 * perl-HTTP-Tiny-0.033-3.el7.noarch
 * perl-module-http-tiny

so examples like that appear pretty straightforward.

  next, i noticed that there are a few perl recipes under OE,
recipes-devtools and recipes-extended, a couple *apparent*
equivalents:

 * perl-XML-LibXML-2.0018-5.el7.x86_64
 * libxml-perl_0.08.bb

 * perl-XML-NamespaceSupport-1.11-10.el7.noarch
 * libxml-namespacesupport-perl_1.11.bb

and so on. not so many of those but still, that took care of a few
more matches.

  finally, i figure i'm going to have to dive into meta-cpan for the
rest, and here's something puzzling.

  one of the RH rpms to be matched was
perl-IO-Compress-2.061-2.el7.noarch, but the generated modules were:

  perl-module-io-compress-deflate
  perl-module-io-compress-adapter-bzip2
  perl-module-io-compress-zlib-extra
  perl-module-io-compress-zip-constants
  perl-module-io-compress-bzip2
  perl-module-io-compress-adapter-identity
  perl-module-io-compress-zlib-constants
  perl-module-io-compress-base-common
  perl-module-io-compress-adapter-deflate
  perl-module-io-compress-gzip
  perl-module-io-compress-zip
  perl-module-io-compress-gzip-constants
  perl-module-io-compress-base
  perl-module-io-compress-rawdeflate

but no "perl-module-io-compress", which is what i would have expected.

  however, if i pop over to meta-cpan, there *is* a recipe file
"io-compress-perl_2.069.bb". can anyone explain how i should interpret
this?

  it seems (and i am not a perl expert) that the foundation
IO::Compress recipe is at meta-cpan, but the more specific sub-modules
are built from the base OE perl recipe. or is it that these modules:

  perl-module-io-compress-base-common
  perl-module-io-compress-base

represent the base class? i'm just trying to figure out the standard
OE packaging for perl modules.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


