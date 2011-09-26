Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R8CPr-0007Cs-Ly
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:44:20 +0200
Received: by gxk4 with SMTP id 4so5450418gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=lIV98NfHGnOkyjvUxvcDiEWs2XoNsd5qBMPZ6l07Hpk=;
	b=xotsqFd2e10sO4SvomRJ95Hx7iYOTnSHVfFQTqdUk7456YYE9MUQTKBu4Rc/HBG+Ig
	N/bRgV5ogWzJV8VaPqn3iHozN5vVGJLcqZghEhzzQ6wpLdOkv+p5k+zg7SKrZwWdLxQ7
	p1doGffOhJ5SRjOrHZ0YZZmQWEkojVm2hQ8Go=
Received: by 10.216.72.72 with SMTP id s50mr1155582wed.39.1317047931132; Mon,
	26 Sep 2011 07:38:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.184.7 with HTTP; Mon, 26 Sep 2011 07:38:31 -0700 (PDT)
In-Reply-To: <1317041232.26109.38.camel@ted>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
	<1317029042.26109.29.camel@ted>
	<CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
	<1317041232.26109.38.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Sep 2011 07:38:31 -0700
X-Google-Sender-Auth: TNEvLnMM93Dk9Tf6aN-rmy-Agjc
Message-ID: <CABcZANkz0jCrZoNteOkeux76m_VTbnnfpxymTs8wctFs_rLfvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 14:44:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 26, 2011 at 5:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-09-26 at 09:27 -0300, Otavio Salvador wrote:
>> On Mon, Sep 26, 2011 at 06:23, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> ...
>> > FWIW, something like git cherry can identify your local changes so you
>> > could apply them on top of master so there are other ways to make your
>> > usecase work...
>>
>> This breaks the value of using a SCM since you won't have a common parent.
>>
>> As Chris, I'd prefer to have it merged.
>>
>> The only way it can complicate issue is if fixes are cherry-picked
>> into the stable branch. If they're are done into the stable and merged
>> into master this works wonderfully.
>
> No, this just just plain wrong. Changes go into master which is where
> development happens. They can then filter into other branches (there may
> be more than one) as needed.

Agreed. No unique changes should generally go into a release or stable
branch first. Master is where future development happens by
definition. The only time a bugfix should go into the stable/release
branch directly is if master has deviated sufficiently such that
fixing it there + cherry picking no longer makes sense.

I do still think there's a certain amount of value in a periodic merge
back, however. Primarily because this encodes knowledge into the
repository about the fact that yes, every single fix in the
release/stable branch is in fact also in master. Someone looking at
the repository, lacking knowledge about our particular branching
policies, will be able to see this by use of rev-list/log.

Just the other day I was doing a conversion from svn to git for a
project and ran into a related issue. There was no merge metadata in
svn from the release branches back to master, so now I have to
painstakingly step through and make absolutely certain all the fixes
went into both. For old releases, this is particularly difficult (and
I think is part of otavio's concern), as you can no longer just merge
from release/stable to master sanely, due to refactoring, renames, etc
on the master branch.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


