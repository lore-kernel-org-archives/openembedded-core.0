Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D75C36C72D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:47:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0HAlpgG012379; Fri, 17 Jan 2014 10:47:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IN9fw6WGDx43; Fri, 17 Jan 2014 10:47:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0HAl9wB012369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 17 Jan 2014 10:47:10 GMT
Message-ID: <1389955623.14987.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 17 Jan 2014 10:47:03 +0000
In-Reply-To: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
References: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] Change update-alternatives provider
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
X-List-Received-Date: Fri, 17 Jan 2014 10:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-16 at 17:59 +0000, Paul Barker wrote:
> The update-alternatives script has been copied from opkg to opkg-utils so the
> openembedded recipe for opkg-utils is updated accordingly. Changing the default
> provider of update-alternatives to opkg-utils allows dependencies to be added to
> the opkg recipe without causing circular dependency loops. This series partially
> solves Yocto Project issue 4836.
> 
> Changes in v2:
> 
>     - Reordered variables in opkg-utils recipe
>     - Added nativesdk class to opkg-utils
> 
> Paul Barker (3):
>   opkg-utils: Upgrade to latest git HEAD
>   default-providers: Change update-alternatives provider to opkg-utils
>   opkg: No longer PROVIDES update-alternatives
> 
>  meta/conf/distro/include/default-providers.inc     |  6 +++---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  9 +++++++--
>  meta/recipes-devtools/opkg/opkg.inc                | 12 +++---------
>  3 files changed, 13 insertions(+), 14 deletions(-)

The errors still occurred on the autobuilder with the revised patchset.
I tracked down a couple of issues and have sent out patches for those.

We do however have one more problematic regression:

http://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/1/steps/BuildImages/logs/stdio

Basically, the tiny configuration is quite cut down and we can't build
python with it. Before this change we were able to build opkg and all
was well. Now we need to build opkg-utils which depends on python.

We're therefore building python when we never used to (due to the python
scripts in opkg-utils).

I suspect to resolve this and allow tiny to work again we'll have to put
a PACKAGECONFIG on opkg-utils and disable python for tiny...

Cheers,

Richard




