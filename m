Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 95D096A5C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 21:07:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5SLBdS6019825; Fri, 28 Jun 2013 22:11:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T4eCP5ax0EJF; Fri, 28 Jun 2013 22:11:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5SLBkpI019835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 28 Jun 2013 22:11:47 +0100
Message-ID: <1372453477.25291.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 22:04:37 +0100
In-Reply-To: <51CDEFEF.2090801@linux.intel.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
	<51CDEFEF.2090801@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 21:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-28 at 13:19 -0700, Saul Wold wrote:
> On 06/28/2013 12:51 PM, Phil Blundell wrote:
> > On Fri, 2013-06-28 at 12:23 -0700, Saul Wold wrote:
> >> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
> >> defined in the security_flags.inc and override the empty default.
> >
> > Why can't security_flags.inc just append to CFLAGS and LDFLAGS
> > respectively, or some other set of variables that already exists?
> >
> So, if I remember correctly there was issues with this because there are 
> a number of packages that have to modify specifically the security 
> related flags (see the list in security_flags.inc), the ordering/timing 
> of being able to due that correctly did not allow for setting it 
> directly in CFLAGS or TARGET_CFLAGS.
> 
> > Creating new variables in bitbake.conf does have a cost in terms of
> > parse time and memory footprint for every recipe.  If the variables are
> > referenced in ${CFLAGS} etc then it also adds an extra substitution
> > whenever CFLAGS is expanded.  The cost of those things isn't enormous,
> > but it isn't zero either and adding them isn't something that we should
> > do capriciously.
> >
> I understand, and RP and I talked about this, we needed a separate 
> variable to ensure the correct substitution occurred for those that 
> needed to disable or remove certain flags.

What RP said was that he'd prefer to see no bitbake.conf changes and to
do this all in the .inc. We should have a variable like the
SECURITY_FLAGS you have but this can also be appended in the .inc.

If we need to modify it on a per recipe basis we still then can so:

SECURITY_CFLAGS = "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"

SECURITY_LDFLAGS = "-Wl,-z,relro,-z,now"
TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"

all in the .inc. Or am I missing something?

Cheers,

Richard


