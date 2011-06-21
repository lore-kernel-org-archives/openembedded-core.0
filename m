Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ98Z-000062-5q for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 00:09:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LM62KY026545
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:06:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26202-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:05:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LM5pGC026539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:05:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E00ED2C.1040708@windriver.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
Date: Tue, 21 Jun 2011 23:05:35 +0100
Message-ID: <1308693935.20015.37.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 22:09:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 14:12 -0500, Mark Hatle wrote:
> On 6/21/11 1:57 PM, Phil Blundell wrote:
> > On Tue, 2011-06-21 at 11:43 -0500, Mark Hatle wrote:
> >> Adjust the umask to 022.  This resolves the problem of dynamically generated
> >> directories (mkdir -p) and specific files (touch foo) having odd permissions.
> >>
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=d8470b6a8efdbba04cef5d4dc1ce12720fe83621
> > 
> > Are you confident that this isn't going to break anything like
> > group-shared DL_DIRs?  I'm not entirely thrilled about forcing the umask
> > to 022 for everything that bitbake does, although I can see that making
> > it be so for particular tasks like do_install() might have some merit.
> > Even in the latter case, though, I wonder whether we should just be
> > paying more attention to recipe hygiene and using "install -m ..." with
> > the permissions that we actually want.
> 
> This is why I bring this up.. I'm a bit concerned that doing it generally will
> have unintended consequences.  So far I am not aware of any.  Moving it to a
> different place in the process may be better.  The only issue I've found so far
> is that just coding int into "do_install" really isn't an option.  Between the
> custom do_install components, various classes, etc.. it's difficult in the
> current infrastructure to find a centralized location to set the value.
> 
> (I'd love to be corrected if someone things of another way of doing it.)  The
> setting of the umask is a very low cost operation, so doing it for certain steps
> shouldn't cause a performance penalty... but until we figure that out this is
> the best and easiest solution I've come up with.

How about a umask flag for tasks?

If bitbake sees it for a given task it would set the umask as indicated
for the task. Cheap and easy and would only impact do_install tasks...

Cheers,

Richard





