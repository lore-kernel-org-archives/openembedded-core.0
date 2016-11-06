Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id D6E3A6011B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 16:32:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161106163240097_0684;
	Sun, 06 Nov 2016 16:32:40 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=49468 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c3QMy-000491-Gx; Sun, 06 Nov 2016 11:32:32 -0500
Date: Sun, 6 Nov 2016 11:31:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANneDWqsPA8HEDCes7uKvvBVPTKhzk8w78g5a38SgxWxGw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1611061125090.6660@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
	<CABcZANneDWqsPA8HEDCes7uKvvBVPTKhzk8w78g5a38SgxWxGw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 16:32:49 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1265308305-1478449616=:6660"
Content-ID: <alpine.LFD.2.20.1611061129050.7065@localhost.localdomain>

--8323328-1265308305-1478449616=:6660
Content-Type: text/plain; CHARSET=ISO-8859-7
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.20.1611061129051.7065@localhost.localdomain>

On Sun, 6 Nov 2016, Christopher Larson wrote:

>
> On Sun, Nov 6, 2016 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         currently writing my first batch of perl recipes, fairly mindlessly
>       plagiarizing from existing recipes, first bunch worked fine, then i
>       whipped together a recipe for SOAP::Lite from here:
>
>         https://metacpan.org/pod/SOAP::Lite
>
>       built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm
>       to my core-image-minimal build, i got:
>
>         Computing transaction...error: Can't install \
>           perl-soap-lite-1.20-r0@all: no package provides /bin/env
>
>       sure enough, that rpm has that dependency:
>
>         $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm
>         /bin/env
>         /usr/bin/env
>         perl
>         $
>
>       and when i fire up my "qemuppc" session for that core-image-minimal
>       image, there is indeed no /bin/env file (hence the error), but there
>       is:
>
>         /usr/bin/env -> /bin/busybox.nosuid
>
>       so ... what is the proper solution for this? i suspect i'm going to
>       run into this issue again in upcoming recipes, so i'd love to resolve
>       it in a minimally hacky way.
>
>
> Sounds like there¢s a script in that package with a #!/bin/env,
> which is wrong.

  dang, i should have thought of that ... and, yes, after fetching and
unpacking source (no patches yet):

$ grep -r "/bin/env" *
bin/stubmaker.pl:#!/usr/bin/env perl
bin/SOAPsh.pl:#!/bin/env perl
examples/XMLRPC/xmlrpc.daemon:#!/usr/bin/env perl
examples/XMLRPC/xmlrpc.cgi:#!/usr/bin/env perl
t/15-daemon.t:#!/bin/env perl
t/17-mod_soap.t:#!/bin/env perl
t/05-customxml.t:#!/bin/env perl
t/03-server.t:#!/bin/env perl
t/04-attach.t:#!/bin/env perl
t/11-cgi.t:#!/bin/env perl
t/02-payload.t:#!/bin/env perl
t/12-cgi_https.t:#!/bin/env perl
t/24-wsdl.t:#!/bin/env perl
t/14-cgi_apache.t:#!/bin/env perl
t/23-ppm.t:#!/bin/env perl
t/01-core.t:#!/bin/env perl
t/13-mod_perl.t:#!/bin/env perl
t/22-interop_apache.t:#!/bin/env perl
t/19-apachesoap.t:#!/bin/env perl
t/08-schema.t:#!/bin/env perl
t/06-modules.t:#!/bin/env perl
t/21-public.t:#!/bin/env perl
$

  is the obvious solution to just patch all those "/bin/env" to
"/usr/bin/env"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1265308305-1478449616=:6660--
