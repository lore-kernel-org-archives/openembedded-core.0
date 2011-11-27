Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RUd9i-0005EI-89 for openembedded-core@lists.openembedded.org;
	Sun, 27 Nov 2011 12:44:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pARBbhhC021506;
	Sun, 27 Nov 2011 11:37:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21291-02; Sun, 27 Nov 2011 11:37:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pARBbVoV021499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 27 Nov 2011 11:37:32 GMT
Message-ID: <1322393859.4798.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 27 Nov 2011 11:37:39 +0000
In-Reply-To: <CAMKF1spYAcXRg3of=P-bjoZmb11HhnaDztomSBMCjPFx=zsGRw@mail.gmail.com>
References: <cover.1322095568.git.sgw@linux.intel.com>
	<f8e475e6907d1ad9bfb93ec4c37a0876bc5ed90f.1322095568.git.sgw@linux.intel.com>
	<CAMKF1srOcDxn+y3JaLrN=PCyeHYdhp45ypSy-g4NUc5=uMGwzQ@mail.gmail.com>
	<4ED134CF.70706@linux.intel.com>
	<CAMKF1spYAcXRg3of=P-bjoZmb11HhnaDztomSBMCjPFx=zsGRw@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] intltool: remove XML::Parser check
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
X-List-Received-Date: Sun, 27 Nov 2011 11:44:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-26 at 13:36 -0800, Khem Raj wrote:
> Hi Saul
> 
> On Sat, Nov 26, 2011 at 10:49 AM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 11/24/2011 11:37 AM, Khem Raj wrote:
> >>
> >> On Thu, Nov 24, 2011 at 10:29 AM, Saul Wold<sgw@linux.intel.com>  wrote:
> >>>
> >>> Add Patch to disable the XML::Parser check in the target
> >>> intltool.m4, this check will find the host (not native)
> >>> XML::Parser if it's installed possibly causing Host
> >>> contamination, but will also fail configuration if XML::Parser
> >>> is not installed on the host.
> >>>
> >>> Since we know that XML::Parser is installed on the image, we don't
> >>> really need this check, so comment it out.
> >>
> >> if it is installed then why does it fail to detect it ?
> >>
> > Because the recipes that depend on intltool do not inherit perlnative, the
> > recipes in question are gconf and shared-mime-info.  They depend on
> > intltool, but do not need to directly inherit perlnative (at least according
> > to RP).
> 
> why dont they need to inherit perlnative ? If they depend on intltool which
> expects that its dependees inherit perlnative. I am just worried where this
> may cause issues. There might be other recipes which should need XML parser
> and may not get it since we remove the test here.

All of the intltool scripts have the correct paths to perl already
embedded into them and can find perl fine. If the recipe needs perl for
some other reason than intltool, it needs perlnative but it if only
needs perl for intltool, we shouldn't need the dependency. The .m4 macro
checks are well intended but don't fit the way we use perl. I really
don't want to end up in a position where intltool automatically means we
have to add perlnative as a dependency and we've previously seen many
problems related to that.

Cheers,

Richard




