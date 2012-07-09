Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoFUm-0005Nf-2d for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:03:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69EqJhJ008377
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 15:52:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08270-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 15:52:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69EqCqM008371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 15:52:13 +0100
Message-ID: <1341845534.8066.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 15:52:14 +0100
In-Reply-To: <4FFAD7C2.5040309@windriver.com>
References: <cover.1341601764.git.mark.hatle@windriver.com>
	<ba80d76cae689a4023327da4e38a83e1c5c88306.1341601764.git.mark.hatle@windriver.com>
	<1341830385.8066.8.camel@ted> <4FFAD7C2.5040309@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] multilib: Enable multilib remapping for SDK generation
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
X-List-Received-Date: Mon, 09 Jul 2012 15:03:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 08:08 -0500, Mark Hatle wrote:
> On 7/9/12 5:39 AM, Richard Purdie wrote:
> > On Fri, 2012-07-06 at 14:14 -0500, Mark Hatle wrote:
> >> Enable the remapping for SDK generation, this is required to be able to
> >> create an SDK that targets an alternative multilib.  Note, this work does
> >> not finish SDK/multilib support, but it is one more step toward making
> >> it work properly.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>   meta/classes/multilib.bbclass |    6 ++++++
> >>   1 files changed, 6 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> >> index f3e7618..b92a3ff 100644
> >> --- a/meta/classes/multilib.bbclass
> >> +++ b/meta/classes/multilib.bbclass
> >> @@ -54,6 +54,12 @@ python __anonymous () {
> >>           d.setVar("LINGUAS_INSTALL", "")
> >>           # FIXME, we need to map this to something, not delete it!
> >>           d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
> >> +
> >> +    if bb.data.inherits_class('populate_sdk_base', d):
> >> +        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
> >> +        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY")
> >> +
> >> +    if bb.data.inherits_class('image', d) or bb.data.inherits_class('populate_sdk_base', d):
> >>           return
> >>
> >
> > There is something odd going on with this patch. You've removed the
> > earlier return but this patch doesn't show that...
> 
> I didn't remove it, I 'moved' it later.  Otherwise the populate_sdk_base case is 
> never run, when the image case has already been loaded.
> 
> So the flow goes from:

I understand this. Let me put this in a simpler way. Could you send a
patch that cleanly applies against master please? There is something
wrong with it and it doesn't apply.

Cheers,

Richard





