Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNope-00042r-Qq for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 19:19:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RHA8Ox018910;
	Fri, 27 Apr 2012 18:10:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17785-08; Fri, 27 Apr 2012 18:10:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RH9vmi018888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Apr 2012 18:09:58 +0100
Message-ID: <1335546598.20130.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 27 Apr 2012 18:09:58 +0100
In-Reply-To: <4F99B139.5040103@windriver.com>
References: <1335470063.20130.32.camel@ted> <4F99B139.5040103@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package_rpm.bbclass: Replace shell provides/requires script with python version
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
X-List-Received-Date: Fri, 27 Apr 2012 17:19:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-04-26 at 15:34 -0500, Mark Hatle wrote:
> On 4/26/12 2:54 PM, Richard Purdie wrote:
> > The existing shell script is a fork bomb and forks off hundreds of
> > grep/cur/wc calls as it reads from its input stream and iterates over
> > the file data table for each line of input. This patch replaces the
> > shell code with python code which doesn't exec anything and hence runs
> > much faster without the exec() overhead. This speeds up rpm packaging
> > considerably, as can be measured simply by timing it, or watching the
> > processor utilisation.
> 
> Just an FYI, the intent was to replace this code completely with a patch to RPM 
> when it got upgraded.  Then RPM could read in the dependencies directly and not 
> have to worry about hacky script solutions.
> 
> Needless to say we're not yet at that point, so this is fine..  but hopefully 
> we're getting closer.

I agree with the objective. I've had the patch lying around for a while
and in use in my builds so it was already written and doesn't seem to
regress anything. It seems to make sense to include it for now until the
rpm upgrade happens and we fix things properly.

The patch also has a partner in crime:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=c0cbf016f59b06f461961df4d6cdfcd0928c96ee

but I suspect you'd dislike that one even if functionally it doesn't
change much at the moment.

Cheers,

Richard



