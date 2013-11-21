Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3D661612D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:36:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALEZxUC009853; Thu, 21 Nov 2013 14:35:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R_M5gfF-rd3Q; Thu, 21 Nov 2013 14:35:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALEZudI009838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Nov 2013 14:35:58 GMT
Message-ID: <1385044552.16887.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 21 Nov 2013 14:35:52 +0000
In-Reply-To: <1385043945.23724.158.camel@phil-desktop.brightsign>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
	<1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
	<1385043945.23724.158.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 14:36:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 14:25 +0000, Phil Blundell wrote:
> On Thu, 2013-11-21 at 01:33 -0600, Mark Hatle wrote:
> > +def get_optimization(d):
> > +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> > +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> > +        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
> 
> Although the text of that warning is correct, users might find the
> reference to eglibc slightly confusing if it's perf that they're trying
> to build.
> 
> Also, as I mentioned in a different thread not all that long ago when
> someone submitted a similar patch for gcc-runtime, the proliferation of
> parse-time python functions to bash SELECTED_OPTIMIZATION around doesn't
> seem like all that good a thing: this will cause extra overhead for
> everyone, even those who are not using -O0 and have no interest in perf.
> 
> And, finally, it remains slightly unclear to me that this is really a
> problem that the metadata needs to be solving.  I haven't seen any
> particularly convincing explanation of why this can't or shouldn't just
> be fixed in the distro configuration.

I have to admit at this point, this may look better as an include file
along the lines of:

SELECTED_OPTIMIZATION = "-O0"
SELECTED_OPTIMIZATION_pn-eglibc = "-O2"
SELECTED_OPTIMIZATION_pn-perf = "-O2"

since clutter the recipes with anonymous python fragments isn't
particular desirable.

Cheers,

Richard


