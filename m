Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA4171493
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s859fgWF004555; Fri, 5 Sep 2014 10:42:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hYsDOGUFeqvh; Fri,  5 Sep 2014 10:42:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s859fx8r004582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 5 Sep 2014 10:42:01 +0100
Message-ID: <1409910121.12482.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 05 Sep 2014 10:42:01 +0100
In-Reply-To: <990d4ba779e4127ff546796d62e2921392dbc0f7.1408588282.git.hongxu.jia@windriver.com>
References: <cover.1408588282.git.hongxu.jia@windriver.com>
	<990d4ba779e4127ff546796d62e2921392dbc0f7.1408588282.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bbclass/sstate: only allowed sstate-cache objects are allowed in a build (read-only sstate-cache)
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
X-List-Received-Date: Fri, 05 Sep 2014 09:42:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Hongxu,

On Thu, 2014-08-21 at 10:36 +0800, Hongxu Jia wrote:
> The requirement is the developer who demand only the "new" software
> they write is allowed to be compiled from source, they only want to
> reuse binaries from an existed sstate-cache, if the developer makes
> a change that triggers a rebuild, it should be an instant error.
> 
> The purpose of this is for the sstate-cache to check if the item
> exists or not. If it doesn't the item needs to be in a whitelist
> or we need to fail.
> 
> In the sstate-cache code, add a checking in the return path of
> sstate_checkhashes. If read-only sstate-cache enable, and the
> recipe's ${PN} not in the ${SSTATECACHE_WHITELIST}, it trigered
> an instant error.
> 
> ...
> $ bitbake db
> ERROR: Read-only sstate-cache is enabled, the build of
> "db rpm-native gcc-runtime eglibc linux-libc-headers libgcc"
> did not come from sstate-cache. Only the recipe listed in
> SSTATECACHE_WHITELIST is allowed to build from source
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Sorry for the delay in getting to this, with the other patches for the
release, time has been difficult.

I have been able to take a look at this and the other locked sstate
patches I've had pending for some time.

Having thought quite a bit about this, I think we really want to make
this functionality part of the siggen class code. Where we need to add
hooks, we should do so with callbacks into the siggen code.

I've just sent out a patch which my locked code in it. Could you take a
look and see if we can make that approach work with your code too?

In particular, I don't really want to have multiple whitelist type
variables. Could we use the SIGGEN_LOCKEDSIGS variable as the definitive
way to control which recipes can float and which should not?

Cheers,

Richard


