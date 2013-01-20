Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Twugd-0002BE-Q2 for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 14:11:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KCuI3f008629;
	Sun, 20 Jan 2013 12:56:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04722-04; Sun, 20 Jan 2013 12:56:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KCu8Xe008623
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 20 Jan 2013 12:56:09 GMT
Message-ID: <1358686568.14265.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Date: Sun, 20 Jan 2013 12:56:08 +0000
In-Reply-To: <20130119084426.GH15126@xiaoyu.lan>
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
	<50F993A7.30308@linux.intel.com> <20130119084426.GH15126@xiaoyu.lan>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Archive the native builds as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 13:11:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-01-19 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> On Fri, Jan 18, 2013 at 10:25:43AM -0800, Saul Wold wrote:
> > 
> > I understand what the issue is here, but I am not sure this is the
> > right solution. This will likely bring in way more than is wanted or
> > needed for source archiving.
> > 
> > What's needed from the opkg-utils-native?
> 
> IANAL so let me say it is company/personal policy to release more than
> would be the minimumm specially to avoid corner cases like we have with
> gcc/libgcc.
> 
> I think there are some issues..
> 
> a.) Missing option to tarball everything. I can prepare a patch for that.
> 
> b.) At least libgcc sources not being present.
> 
> c.) How can I get back to compliance? I would have to use something like
> the old DISTRO_PR after I patched the archiver class and rebuild everything.
> How can this be handled today? I have installations in the field that I
> want to upgrade, so the PR of each package should increase.
> 
> d.) Verify that for the meta-toolchain target the necessary GCC sources
> are archived.
> 
> cheers
> 	holger
> 
> PS: Re-sent from the right address

From a technical perspective, I think gcc could be breaking for two
reasons:

a) It uses the "shared sources" functionality so there is one ${S}
directory for all the different targets. I'm not sure if the archiver
class interacts well with that.

b) libgcc is a "stub" recipe which packages pieces built by a cross
recipe and stashed in the sysroot. The recipe is important as it is a
"target" recipe rather than the other cross recipes.

I'm not sure how removing "native" from the class helps either of these
two things though. Its not like we have a gcc-native or a libgcc-native.

So there could well be a problem here but I'm not feeling happy we've
solved it yet. More information would be appreciated.

Cheers,

Richard




