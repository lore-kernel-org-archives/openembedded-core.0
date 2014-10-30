Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F15536AC49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9UHkl44026271; Thu, 30 Oct 2014 17:46:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PGoVjwKqrziU; Thu, 30 Oct 2014 17:46:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9UHkhPM026267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 30 Oct 2014 17:46:44 GMT
Message-ID: <1414691238.7649.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 30 Oct 2014 17:47:18 +0000
In-Reply-To: <5452486B.6070303@topic.nl>
References: <5452486B.6070303@topic.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Weird ALTERNATIVES and staging conflict.
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
X-List-Received-Date: Thu, 30 Oct 2014 17:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-10-30 at 15:17 +0100, Mike Looijmans wrote:
> ﻿I have this base script that builds FPGA bitstreams:
> 
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image.inc
> 
> Now you can have multiple recipes using it, and as such, it seemed a good idea 
> to add these lines to that recipe:
> 
> +ALTERNATIVE_${PN} = "fpga.bin bitstreams"
> +ALTERNATIVE_LINK_NAME[fpga.bin] = "${datadir}/fpga.bin"
> +ALTERNATIVE_TARGET[fpga.bin] = "${datadir}/fpga.bin"
> +ALTERNATIVE_LINK_NAME[bitstreams] = "${datadir}/bitstreams"
> +ALTERNATIVE_TARGET[bitstreams] = "${datadir}/bitstreams"
> 
> 
> This still resulted in staging conflicts.

This isn't surprising since update-alternatives only works for target
systems. It is not designed for operating on the sysroot.

> But looking at the contents of the fake packages, the fpga.bin has been 
> renamed by alternatives (as expected), and the symlink will be created after 
> installing, so how come I still get this?

The "staging" code uses the output of do_install directly and does
different things to the packaging code path. We've never had someone
with this problem before. Binaries in *bindir only get installed into
the sysroot in the -native case.

I appreciate that tells you why it doesn't work and not how to fix it
but hopefully that helps a bit.

Cheers,

Richard


