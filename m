Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 48FA278421
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 15:06:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2DF6Jpk031885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Mar 2018 15:06:23 GMT
Message-ID: <1520953579.25754.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cuero Bugot <cbugot@sierrawireless.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2018 08:06:19 -0700
In-Reply-To: <CY1PR02MB11526A4DDADFB7EF5D6019EAA3D30@CY1PR02MB1152.namprd02.prod.outlook.com>
References: <CY1PR02MB11526A4DDADFB7EF5D6019EAA3D30@CY1PR02MB1152.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: uninative and recipe parsing
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
X-List-Received-Date: Tue, 13 Mar 2018 15:06:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-03-12 at 11:04 +0000, Cuero Bugot wrote:
> Hi all,
> 
> When you add several layers, recipe parsing can take a (very) long
> time. In our case it takes more than a couple minutes [1].
> Fortunately it is supposed to happens once, except when you use
> uninative (poky's default) where it happens twice (the two first
> times you build).
> I think this is not an intentional behavior so I dug it a little bit
> and here is what I found:
> 
> When inheriting meta/classes/uninative.bbclass, it registers 2
> functions on build events: one to fetch the uninative tarball (at
> bb.event.BuildStarted) and the other one to set variables in the
> datastore (at bb.event.ConfigParsed).
> The function that set the variables [2] to the datastore first check
> that the uninative blob is in the build tree, so even though it is
> supposed to happen at recipe parsing, the variable are only really
> set when the build really start (bb.event.BuildStarted), after the
> recipes have been parsed!
> 
> So I think there is bug in the current behavior as:
> 	* Either the uninative variables are not important for the
> recipe parsing, and then they should be added in
> BB_HASHCONFIG_WHITELIST
> 	* Or the variables should matter for the recipe parsing so they
> should be set before the parsing and not in between parsing and
> build.
> 
> I assumed the later, so a simple fix is to register the two functions
> on the same event: bb.event.ConfigParsed.
> 
> Note: We are currently using pyro, but I checked that the master
> branch should exhibit the same behavior (same code).
> 
> [1]: it matters to us as we are doing Continuous Integration and do
> clean builds (with sstate cache) on every pull requests and master
> branch commits. The automatic test full cycle take about 20 minutes.
> We launch 2 bitbake commands during that process. Parsing recipe take
> about 2-4 minutes, which is significant enough when trying to reduce
> the waiting and parallel builds/tests.
> [2]: the uninative changed variables are: NATIVELSBSTRING,
> SSTATEPOSTUNPACKFUNCS
> 
> Proposed patch:
> 
> diff --git a/meta/classes/uninative.bbclass
> b/meta/classes/uninative.bbclass
> index a410647..5713bb8 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -9,7 +9,7 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-
> libc.tar.bz2"
>  UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
>  
>  addhandler uninative_event_fetchloader
> -uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
> +uninative_event_fetchloader[eventmask] = "bb.event.ConfigParsed"
>  
>  addhandler uninative_event_enable
>  uninative_event_enable[eventmask] = "bb.event.ConfigParsed"

I have kind of noticed this and agree its something we should fix.
Thanks for digging into it. I think a long time ago we tried the above
change and it does cause a problem, perhaps fetching during parsing
which is bad.

Have you been able to figure out what changes in the data store for the
cache to be invalidated? I think whitelisting something may be the best
solution, or perhaps only activating certain changes in the build code
paths after parsing in all cases.

Cheers,

Richard


