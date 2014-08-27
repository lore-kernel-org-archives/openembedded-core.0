Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6C36FE2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 23:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7RN3IoA025029; Thu, 28 Aug 2014 00:03:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5piZpLKsFOqB; Thu, 28 Aug 2014 00:03:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7RN3DGE025026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 28 Aug 2014 00:03:15 +0100
Message-ID: <1409180595.29296.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bob Cochran <openembedded@mindchasers.com>
Date: Thu, 28 Aug 2014 00:03:15 +0100
In-Reply-To: <53FE1343.4060601@mindchasers.com>
References: <1408451752.1669.52.camel@ted> <53FE1343.4060601@mindchasers.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] allarch: Add warning about packagegroup
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
X-List-Received-Date: Wed, 27 Aug 2014 23:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-27 at 13:20 -0400, Bob Cochran wrote:
> On 08/19/2014 08:35 AM, Richard Purdie wrote:
> > Since we want to start including this class conditionally, detect cases
> > where packagegroup files use the old ordering and inform the user they
> > need to update this.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > index c953e7c..4bc9927 100644
> > --- a/meta/classes/allarch.bbclass
> > +++ b/meta/classes/allarch.bbclass
> > @@ -37,5 +37,7 @@ python () {
> >           d.setVar("EXCLUDE_FROM_SHLIBS", "1")
> >           d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
> >           d.setVar("INHIBIT_PACKAGE_STRIP", "1")
> > +    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
> > +        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE", True))
> 
> 
> I'm reviewing my recipes today to make sure everything conforms with 
> this methodology.
> 
> This is minor, but I'm curious about something with this patch regarding 
> warnings & errors:
> 
> Should I care that this commit says 'add warning' but the implementation 
> calls bb.error()?

"warning" in this sense was intended to stop the build. In order to do
that, it would have needed to be a bb.fatal though. Hindsight is
great...

> It looks like neither warning nor error throws an exception, so are they 
> interchangeable, both really warnings?
> 
> Although my build this morning produced an image, I had a couple of 
> these errors, or were they just warnings?

They aren't interchangeable. The error will have set the exit code of
bitbake which a warning wouldn't have done. Bitbake will also have
reported an error exit code. So being an error did make some difference,
just not as much as a bb.fatal would have :/

Cheers,

Richard


