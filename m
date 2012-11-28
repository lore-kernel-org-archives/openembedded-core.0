Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tddog-0003GY-ET for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 10:20:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS96BNu011633;
	Wed, 28 Nov 2012 09:06:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11107-03; Wed, 28 Nov 2012 09:06:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS960JH011627
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 09:06:02 GMT
Message-ID: <1354093560.21863.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Nov 2012 09:06:00 +0000
In-Reply-To: <20121128085726.GA3477@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com> <20121128085726.GA3477@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Wed, 28 Nov 2012 09:20:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-28 at 09:57 +0100, Martin Jansa wrote:
> On Tue, Nov 27, 2012 at 12:44:21PM -0600, Mark Hatle wrote:
> > On 11/27/12 12:23 PM, Martin Jansa wrote:
> > > In last rebuild from scratch I've noticed couple of weird locale data:
> > 
> > Paul E and I just observed this as well...  My build machine is an -old- FC13 
> > machine..  system we found it on was x86.
> 
> OK, the issue is triggered by:
> 
> commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Oct 11 08:43:01 2012 +0000
> 
>     autotools.bbclass: Fix gettext macro versions issues
> 
> Especially this part:
> -if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
> -     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> +if [ -d ${S}/po/ ]; then
> +     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> 
> And it influences gst* because they are hacking their po/Makefile.in.in in autogen.sh by this patch
> http://cgit.freedesktop.org/gstreamer/common/commit/gettext.patch?id=c81ad072c76522175cbddead96d6f3c448068d67
> 
> RP: do you remember why you removed "-e ${S}/po/Makefile.in.in" check?
> I guess it was because it can be from older gettext version (in gstreamer 
> case 0.17 instead of our 0.18)

Right, we have to ensure the file is the 0.18 version, whether it exists
already or not otherwise we get version mismatch issues.

> Is there some way to inject Makefile.in.in modification between this 
> gettext modifications and running autoreconf/configure? I don't see any 
> in run.do_configure, but I guess there is cleaner solution for upstream 
> to use.
> 
> As work around we can replace DOMAIN setting in po/Makevars in all gst* packages.

I don't quite understand what you mean here? 

We probably will have to hack/patch this somehow though, maybe adding a
hook so we can do what you describe above...

Cheers,

Richard



