Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A30AD6B6BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 07:37:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r957b9V9030066; Sat, 5 Oct 2013 08:37:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rhk79HuQ9WFc; Sat,  5 Oct 2013 08:37:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r957b4Zr030063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 5 Oct 2013 08:37:06 +0100
Message-ID: <1380958620.30971.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 05 Oct 2013 08:37:00 +0100
In-Reply-To: <524F85EA.30805@linux.intel.com>
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Sat, 05 Oct 2013 07:37:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-04 at 20:22 -0700, Saul Wold wrote:
> On 10/04/2013 04:35 PM, Richard Tollerton wrote:
> > Suppose the following:
> > 1) foo.do_configure/do_build runs in parallel with
> >     sed-native.do_configure;
> > 2) foo.do_configure/do_build makes use of sed (i.e. inherits autotools);
> > 3) A previously built sed-native already exists in the native sysroot,
> >     and in the sstate cache.
> >
> > Then sed-native may be deleted from its sysroot via
> > sstate_clean_manifest while foo.do_configure/do_build is using it,
> > leading to an irreproducible build failure.
> >
> > This fix does for sed-native what's already done for libtool-native,
> > with some additional light refactoring.
> >
> This also starts to create more front end bottle next on autotools 
> related items before we can really start to parallelize the build.
> 
> More thought is required on this.

Please have a look at the sed-native changes that went into master
recently as I think this issue has been fixed differently...

Cheers,

Richard


