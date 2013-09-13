Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCB5615D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:16:37 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo20so1487670obc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Z/NpD8GAi/I2hr9xiO//yN+QHwmBAXPP3NiI7R6rDw0=;
	b=hf2EX8iZrie5U9rLRC6VFa7G6EsZ40GtLFQmLgpLBwWwQRLYaJmGSGoBsewj6Cg4wi
	r9bLjs/1jQum2k6jTetyya/kDtuMW0bsZe5UsQNZuz1kkCHpmh7QH+oDnB0oJPfCR1JL
	sj8/vizqZ8rxx+03ORBh9TbWyMLP0LuDcSuvILdBdx3T7y4TJXF39Jzxj7xBBVbI4Wng
	vpkI6taIcdAm6/I4r/wNdZvveN7t65P4CHhPi8SRbrZJsoAfwRHru8C9QMXwdLJl17xy
	k97w3M1F/JKLoaYBZXPny8iDaPx72sMBPz+JC3vOB3Fj9tg3MBgpivX8aj981CmXM789
	4z8Q==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr8919230oeb.57.1379099798685;
	Fri, 13 Sep 2013 12:16:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 13 Sep 2013 12:16:38 -0700 (PDT)
In-Reply-To: <923730d4-0ca2-411a-97e8-17cbe043ea43@email.android.com>
References: <20130913075635.GA3573@ad.chargestorm.se>
	<CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
	<923730d4-0ca2-411a-97e8-17cbe043ea43@email.android.com>
Date: Fri, 13 Sep 2013 16:16:38 -0300
X-Google-Sender-Auth: 92piIKN55uOrWHL3_674OVPKYiE
Message-ID: <CAP9ODKpaEDmOXK6b1KLvwOv6FYXGJ1nfZ3D4MGUa3qo-cagfyw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 19:16:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 3:55 PM, Anders Darander <anders@chargestorm.se> wrote:
> Otavio Salvador <otavio@ossystems.com.br> wrote:
>>On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander
>><anders@chargestorm.se> wrote:
>>> As I've started to bring our internal distro and machines up to the
>>> lates oe-core, I've got some issues with the u-boot-fw-utils to
>>> u-boot-fw-utils-cross transition.
>>
>>Right.
>>
>>> In my old branch, I used u-boot-fw-utils_2011.06. This used to
>>compile
>>> and package fw_printenv(setenv) just fine.
>>>
>>> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now
>>built
>>> using HOSTCC instead of the cross-compiler. The old recipe used to
>>> include:
>>> EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>>> as u-boot defaults to build everything under tools/ using HOSTC.
>>
>>Yes; this is intended to be used in the host. I can add support for
>>use in target as well (or help you to do it).
>
> Sorry that I didn't see this during the review of your patch that made this change. If u-boot-fw-utils-cross of intended to be used on the host, why did you then replace the old u-boot-fw-utils with this recipe?
>
> The old u-boot-fw-utils were to create fw_printenv to be used on the _target_ not on the host. Unfortunately, I don't think this was ever mentioned during the patch review...

Yes but this was a /bug/ in the build system. As it got HOSTCC so it
was indeed to be used as /host/ not target.

>>> What's the reason for this change? Currently fw_printenv is being
>>built
>>> for my host system, and not the target...
>>
>>Yes; the way to proper package it for target is from u-boot itself,
>>not on this recipe.
>
> Yep, so the commit log that makes the transition from u-boot-fw-utils to u-boot-fw-utils-cross should have mentioned that the purpose of those two packages are completely different.

Right; I might not been clear on this.

>>> Further more, fw_printenv does not get packaged. I can see that
>>> fw_printenv is installed in ${WORKDIR}/image, but never moved to
>>> ${WORKDIR}/package. I guess that this is caused by inheriting
>>> cross.bbclass?
>>>
>>> Am I missing something in my distro config, or have I overlooked
>>> something else? fw_printenv doesn't really make sense for me to run
>>on
>>> the host, and is (in my case) rather essential on the target.
>>>
>>> I guess that I'm doing something wrong; can anyone give me some hint
>>on
>>> where to look? Or do we have an issue with the u-boot-fw-utils-cross
>>> recipe?
>>
>>No, you are right. I can help you to solve it (or solve it and send
>>you the solution) if you want.
>
> I've got a working u-boot-fw-utils recipe that I can submit. I'll look into this on Monday morning, to ensure that it's of enough quality to publish.

Ahh neat! So please e-mail me and I help to clean it.

> Just curious, what use case do you have for fw_* the build host?

So we can mangle environment per image ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

