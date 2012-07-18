Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SrIpa-0007HI-Si
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:13:35 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id C406320232;
	Tue, 17 Jul 2012 21:02:16 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Tue, 17 Jul 2012 21:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=lROpX+mI7b3FRm51ab8Uo8
	UfamU=; b=UNX3pRE8MNVCwOgPimvGtCfW/TrPjKr5heMFFzk0uOQa84JMfVzPE9
	h5+uXFYwSKaxxRc9TVtzko8H3J4P1pE/6A5PazJE55wov1K/QECBs/rUVqyt8T5K
	iOxiG6BAhkg6m0M97AkbYbstG+bFaNjUaY9KrzC3dL4TesZF2vU7g=
X-Sasl-enc: iK1X7nlKxko2WLfSDGKQK2K9fq/GKoMyeYCMdXYUVSm5 1342573336
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 284528E01DD;
	Tue, 17 Jul 2012 21:02:16 -0400 (EDT)
Message-ID: <1342573300.2860.16.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Jul 2012 21:01:40 -0400
In-Reply-To: <20120718005221.GG22569@jama.jama.net>
References: <5005DFF1.3050304@linux.intel.com>
	<500602C8.6090805@linux.intel.com>
	<20120718003850.GF22569@jama.jama.net>
	<20120718005221.GG22569@jama.jama.net>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>,
	Eggleton <paul.eggleton@linux.intel.com>,
	oe-core layer' <openembedded-core@lists.openembedded.org>, Paul, 'Patches
Subject: Re: Glib-2.0 cross-compile issue Was: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 01:13:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 02:52 +0200, Martin Jansa wrote:

> It's probably caused by this
> http://permalink.gmane.org/gmane.comp.gnome.svn/604029
> 
> which isn't very cross-compile friendly.. maybe we can just add patch
> reverting this change in 2.32.4?

I don't think it's a good idea to look at this module by module.  A
*lot* of code out there uses AM_PATH_PYTHON, and then does something
with the resulting value of @PYTHON@.  We should figure out the correct
thing to do that fixes all of:

0) "Normal" self-hosting build where /usr/bin/python = python2, and
   we can use both /usr/bin/env python or /usr/bin/python
1) OE-core cross compilation
2) Ubuntu's situation of /usr/bin/python = python 3, and we want
   to use /usr/bin/python2

Reverting the patch is going to break 2).



