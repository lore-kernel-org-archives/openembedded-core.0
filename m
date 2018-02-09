Return-Path: <jsbronder@cold-front.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id CAB3D6FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 20:38:18 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B687214AC;
	Fri,  9 Feb 2018 15:38:19 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Fri, 09 Feb 2018 15:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=UdKgFQgf6XWwC9D4GJCsI3i6cGuxDMYCpeEyem1pRWY=; b=kpfrH
	BIKeMJw/9t8j/peujvVQQFHvyHXdqofz+eaAnS39yxi/G2OChfW3WHZKf5E34gfm
	lrUZJa02M71BdsX56dEPQlEc/Vap4oxtOrh27fMiXSi/yUoJAONAzIPCRD91sBEP
	4CaBLdqNsNM5b2JhuriAD5zMZV9kQkeaZ3jvds=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=UdKgFQgf6XWwC9D4GJCsI3i6cGuxD
	MYCpeEyem1pRWY=; b=WycqI/OzFWropIvpE37yb00VGsNccHgi1LMGDuK7a9+GE
	QiCUPM4FSSf9G5nNICMRzjgyW6K8JKwstrP62NtizPZpNSvaUnlzYxTwxuiMDnHV
	Ag8OaMpwNly+dsjjUAIcNiFYTxb3JRbaynkJbxip2gSBJsKuCnRgNnsp+flaia6p
	r//gKIx0ZgRwH9ThqXoVInSSZg4yl71Esuaikml/04XW+jmIgTLoixJCQeXRbhbK
	dcvj6NpSK6VUUn0NcIQgrNSUUfR3jGTJAMKZHo9CsfgVwWM7W4QB2GS0ckU8Bnst
	Nf4tyMC5OvxlQ2fAdGYMqcGc/+9szgx0NuaKF9tCQ==
X-ME-Sender: <xms:uwZ-WgwhhXGwxno0QQ-98W5udszhZ-imynG_OjWame4e1xbOXt_69Q>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5B7767E321;
	Fri,  9 Feb 2018 15:38:19 -0500 (EST)
Date: Fri, 9 Feb 2018 15:38:19 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20180209203819.GA11421@lasswell>
References: <20180209195337.27617-1-jsbronder@cold-front.org>
	<CADkTA4OVbFXs=oEwkZF3FiGTwXC1X-1BjRNixK3zSo1xGq1=gA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OVbFXs=oEwkZF3FiGTwXC1X-1BjRNixK3zSo1xGq1=gA@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto: create dummy git user if necessary
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
X-List-Received-Date: Fri, 09 Feb 2018 20:38:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09/02/18 15:27 -0500, Bruce Ashfield wrote:
> On Fri, Feb 9, 2018 at 2:53 PM, Justin Bronder <jsbronder@cold-front.org> wrote:
> > The user's global git configuration may not have the name and email set
> > and git autodetection can fail.  The initialization commit for a non-git
> > kernel directory doesn't really need to be tied back to them anyways.
> > Instead, create a user and email that's clearly tied back to
> > kernel-yocto.bbclass.
> >
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 60979a218f..dbf01f86b6 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -247,6 +247,8 @@ do_kernel_checkout() {
> >                 fi
> >                 rm -f .gitignore
> >                 git init
> > +               git config user.name 'Yocto Kernel Git Initializer'
> > +               git config user.email 'kernel-yocto.bbclass@invalid'
> 
> 
> This is already handled in the utility classes via the
> check_git_config routine and it is called in
> kernel-yocto's do_patch routine.
> 
> If it is needed earlier (as it appears it is), move that call to
> do_kernel_checkout.

Ah, didn't see that.  Thanks.  I'll send a new patch shortly.

-- 
Justin Bronder

