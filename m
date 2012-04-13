Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIiv0-0000rP-Pp for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 18:00:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DForWm004682
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 16:50:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04234-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 16:50:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DFojpT004676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 16:50:46 +0100
Message-ID: <1334332247.7309.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 16:50:47 +0100
In-Reply-To: <4F88490A.1070707@windriver.com>
References: <cover.1334265557.git.mark.hatle@windriver.com>
	<3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
	<4F884293.6000101@linux.intel.com> <4F8844AD.8090406@windriver.com>
	<1334331230.7309.80.camel@ted> <4F88490A.1070707@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] pseudo: Tell pseudo to avoid specifying an RPATH
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
X-List-Received-Date: Fri, 13 Apr 2012 16:00:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-13 at 10:40 -0500, Mark Hatle wrote:
> On 4/13/12 10:33 AM, Richard Purdie wrote:
> > On Fri, 2012-04-13 at 10:22 -0500, Mark Hatle wrote:
> >>> We might still need this rpath or something similar since the nativesdk
> >>> now breaks not finding the correct version of the included libc.so.6
> >>
> >> In this case, I don't think embedding a static RPATH makes sense, but perhaps a
> >> $ORIGIN path might?
> >>
> >> Can chrpath be used to add an rpath after compilation and linking, if so that is
> >> what I would suggest to do.  Otherwise I'm not exactly sure how to resolve this...
> >>
> >> Note, typically pseudo is -not- linked the "sdk" version of the libc, but is
> >> linked to the host libc.  In the past when exporting and sdk with something like
> >> pseudo you needed to either build on a common machine (where everything was
> >> compatible) or have a way to rebuild pseudo on the final target system.  Perhaps
> >> that is what is needed?
> >
> > We need to embed a full static rpath and then our nativesdk relocation
> > code will then handle adding in the correct $ORIGIN for us.
> >
> > The way the sdk works, it will link against the sdk libc btw and this
> > avoids the need to rebuild on the target system. We just need the rpath
> > in there so it can figure things out correctly.
> 
> Ha, that is what we had (unintentionally) that triggered the QA failure.
> 
> If it's only for a nativesdk build, then we simply switch the --without-rpath

Maybe, maybe not. It depends exactly what rpath its encoding in there.
Previously it looked like it was encoding the sysroot path too (which is
a security hole). We need a target rpath in there and no sysroot path.

Cheers,

Richard



