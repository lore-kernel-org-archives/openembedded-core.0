Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2CB6B3F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:43:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6UFheuV008728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2013 08:43:40 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 08:43:40 -0700
Message-ID: <51F7DF2C.9030207@windriver.com>
Date: Tue, 30 Jul 2013 10:43:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
	<1375197551.8017.6.camel@phil-desktop.brightsign>
In-Reply-To: <1375197551.8017.6.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 15:43:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/13 10:19 AM, Phil Blundell wrote:
> On Tue, 2013-07-30 at 09:46 -0500, Mark Hatle wrote:
>> They want a method similar to the one posted by Otavio in order to tailor the
>> system.  End users never want to create a new distribution, they simply want to
>> start with one and tweak it.
>
> They can already do that by overriding the distro's own DISTRO_FEATURES
> in local.conf (modulo poky's alleged _append thing), and/or by copying
> and hacking the distro.conf file itself.  And, of course, any distro
> which intends itself to be explicitly end-user-tweakable like this is
> welcome to include a mechanism like Otavio's one in their own layer.

Unfortunately we may have to include functionality like this to address this 
problem.  But deviating from oe-core has potentially significant maintenance 
issues, especially long-term.

Reality is this is functionality that I've been asked for multiple time in the 
last year or so, and I've stated back "don't do that".  To which the end user 
(my customer) has said that isn't acceptable.

So I'd advocate this, or similar functionality is definitely desired by a class 
of users (many less knowledgeable about Linux distribution design), even though 
I do agree it's not the right way to do it.  (The whole concept of the 
distribution settings being 'variable' without a new distribution configuration 
file is incorrect to me.)

>> So with that said, my opinion is to enable this code, allowing end users to
>> tweak their distribution settings.  But make it a stated policy that
>> distribution layers should only "set" the value of DISTRO_FEATURES, and should
>> never modify/update this new EXTRA_DISTRO_FEATURES value.  (Of course, I doubt
>> there is a way to police that, other then state it's policy.)
>
> Both end-users and distro maintainers already have enough trouble
> understanding what the interactions are between the different variables
> and who's meant to be setting which ones (see DISTRO_FEATURES_BACKFILL
> for example which seems to be fairly frequently misunderstood).  Adding
> extra complexity to what is already a fraught area seems like a bad
> plan.
>
>> This is the same type of reason that end users was a "don't install this
>> package" feature as well.  While anyone can write a new image recipe, nobody
>> wants to, especially when they only want one or two less packages in their image.
>
> End users already have BAD_RECOMMENDATIONS for that, right?  And
> courtesy Paul's recent changes I think this now even works for the
> rpm-using fraternity.

That only filters out recommendations though.  A good example is some x86 
packagegroups have a requirement of 'vte'.  It turns out a class of end users 
don't want 'vte'.  And they have no easy way to remove it.  Telling them to 
generate a new image, with a custom IMAGE_INSTALL value that includes everything 
except 'vte' doesn't make sense to them.

(The bad_recommendations thing is sorely needed as well to help prevent the "why 
the hell did this get there" problem as well..)

--Mark

> p.
>
>


