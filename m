Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 88C8A6BEC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:10:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BAOLYC027337; Wed, 11 Sep 2013 11:24:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c3pvl1f5S9f5; Wed, 11 Sep 2013 11:24:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BAOGjd027333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 11:24:18 +0100
Message-ID: <1378894228.3484.176.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 11 Sep 2013 11:10:28 +0100
In-Reply-To: <52303854.1020209@windriver.com>
References: <1378736079.3484.117.camel@ted> <522ECB4B.2070209@windriver.com>
	<1378822091.3484.163.camel@ted> <52303854.1020209@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Wed, 11 Sep 2013 10:10:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 17:31 +0800, Robert Yang wrote:
> 
> On 09/10/2013 10:08 PM, Richard Purdie wrote:
> > On Tue, 2013-09-10 at 15:33 +0800, Robert Yang wrote:
> >> Thanks, Can we provide a replacement for the "bitbake PN-PV" since it is
> >> useful, for example, can we support the PREFERRED_VERSION_${PN} in the env
> >> in the future ? There is a similar bug:
> >>
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4965
> >
> > If you set BB_PRESERVE_ENV=1 you can set PREFERRED_VERSION_xxx from the
> > environment so this should already be possible?
> >
> 
> It seems that the BB_PRESERVE_ENV=1 doesn't work, but we use the
> BB_ENV_EXTRAWHITE, for example:
> 
> $ export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE PREFERRED_VERSION_make"
> $ export PREFERRED_VERSION_make="3.81",
> 
> Then it works, maybe something is wrong with the BB_PRESERVE_ENV.

It is broken, yes, I've sent out a patch to fix it. There is one other
problem, you can't use "-" in a shell environment variable so you can't
do:

PREFERRED_VERSION_make-native = xxx

which is annoying. We might want to add some kind of mangling mechanism
like a double underscore translating to a dash or something...

Cheers,

Richard



