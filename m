Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPzJ4-0000ps-7e for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:50:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFjV4N003793;
	Fri, 27 May 2011 16:45:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03609-03; Fri, 27 May 2011 16:45:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFjOcQ003787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 16:45:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDF17A7.4010807@linux.intel.com>
References: <cover.1306364294.git.dvhart@linux.intel.com>
	<f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
	<1306453593.27470.226.camel@rex>  <4DDF17A7.4010807@linux.intel.com>
Date: Fri, 27 May 2011 16:45:18 +0100
Message-ID: <1306511118.27470.276.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Fri, 27 May 2011 15:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 20:16 -0700, Darren Hart wrote:
> 
> On 05/26/2011 04:46 PM, Richard Purdie wrote:
> > On Wed, 2011-05-25 at 16:05 -0700, Darren Hart wrote:
> >> Fixes [YOCTO 1102]
> >>
> >> Path variables are typically : delimited. White space is allowed in paths, so
> >> is not a good choice for separating paths. Currently utils.bbclass performs the
> >> following:
> >>
> >>     extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> >>
> >> This splits FILESEXTRAPATHS on whitespace. It later splits overrides on : and
> >> reassembles them all together as : delimited.
> >>
> >> There is only one user of FILESEXTRAPATHS in oe-core (qt4-tools-native, which
> >> uses : anyway) and none in oe.
> >>
> >> Change the split() in utils.bbclass to split on : instead of whitespace. When
> >> splitting on a defined string (":") we must be careful to handle the empty
> >> string case which returns [''] instead of [].
> >>
> >> Tested building qt4-tools-native and core-image-minimal for surgarbay from
> >> meta-intel with a couple extra layers with FILESEXTRAPATHS modifications added.
> >>
> >> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> >> Cc: Phil Blundell <pb@pbcl.net>
> >> ---
> >>  meta/classes/utils.bbclass |    6 ++++--
> >>  1 files changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> >> index e103351..9930a24 100644
> >> --- a/meta/classes/utils.bbclass
> >> +++ b/meta/classes/utils.bbclass
> >> @@ -331,8 +331,10 @@ def explode_deps(s):
> >>  
> >>  def base_set_filespath(path, d):
> >>  	filespath = []
> >> -	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> >> -	path = extrapaths + path
> >> +	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "")
> >> +	# Don't prepend empty strings to the path list
> >> +	if extrapaths != "":
> >> +		path = extrapaths.split(":") + path
> >>  	# The ":" ensures we have an 'empty' override
> >>  	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
> >>  	for p in path:
> > 
> > This is being a little picky but I find the above hard to read and can't
> > we just do:
> > 
> > -	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> > +	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split(":")
> 
> Unfortunately not (this is what I tried initially), python split() has a
> rather annoying "feature", see:
> http://docs.python.org/library/string.html
> 
> Where it states:
> "
> The behavior of split on an empty string depends on the value of sep. If
> sep is not specified, or specified as None, the result will be an empty
> list. If sep is specified as any string, the result will be a list
> containing one element which is an empty string.
> "
> 
> ie:
> "".split() -> []
> "".split(":") -> [""]
> 
> So by changing from split() to split(":") we change the behavior of
> split when operating on empty strings, requiring us to special case the
> output. Rather obnoxious wouldn't you say?

Horrible but merged to master ;-).

Cheers,

Richard




