Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Tdr4R-00080H-ES
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 00:29:35 +0100
Received: from mail-yh0-f69.google.com ([209.85.213.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 15:14:11 -0800
Received: by mail-yh0-f69.google.com with SMTP id 47so24461924yhr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 15:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=iSJbJMhizuj63CGama/kGuR1AhhuqODFwrvzg3XbvVA=;
	b=oyOdRaQI74/D4f8RY83k0i4SIdRQhwBkob8uwCnWTAiHrZ5FeESVkjTGmsAiwX0QKI
	svtaMI9ja7m2js4F4+3b+g6UQ2yGY2owEYVL3AKaObcW5JGIF6jR3KU9mdOc4/H16VW7
	DCr+kGnAOgnSqPSawDFxjaUn3L0TKjpKnKahNJMj1O0X/i7B1vPxOP26H0rN73XRpZlA
	oPK70YnWi0NfVwmWmBy+Vi3cqfWAFkpTTvuKyFhYiDtEJZ5HGHcKCLEc4oqXQT51QjZw
	ylLl2bnUgFaL6QY6+GOJhTPcZJeDGIMZPTsOqTwv+Wa/Kcl4qsZgmjiDbkOi7ITZayZu
	eJOg==
Received: by 10.49.29.101 with SMTP id j5mr25894062qeh.6.1354144450866;
	Wed, 28 Nov 2012 15:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.29.101 with SMTP id j5mr25894054qeh.6.1354144450757; Wed,
	28 Nov 2012 15:14:10 -0800 (PST)
Received: by 10.49.12.136 with HTTP; Wed, 28 Nov 2012 15:14:10 -0800 (PST)
In-Reply-To: <1353343072.3709.183.camel@ted>
References: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
	<50A68F5D.6050100@windriver.com> <1353343072.3709.183.camel@ted>
Date: Wed, 28 Nov 2012 15:14:10 -0800
Message-ID: <CAPhnLPBpv_LKEKjoqsv7TY2NhiJLB8kCtPU9im+r34hqKHtNVg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Andy Ross <andy.ross@windriver.com>
X-Gm-Message-State: ALoCoQmeBCcBuURKy5D3Ynb5aPuKqafl/C8kG033umMjjRzWsCEnVZ/YT9m8DKIPbrwVNWKhBFnX2uLpXWx5iBWhF2WD8zRjdP24e77OD0vmUssfSJdQLrsBPWG0RcPOGIPqk1favMvirajQGshC66NcvEuWaTEJim9P+a4qLrAIEfT5LRlDeE14rv8p1W0Zpd03RYam3OKF
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Wed, 28 Nov 2012 23:29:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 8:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-11-16 at 11:09 -0800, Andy Ross wrote:
>> On 11/01/2012 11:02 AM, Andy Ross wrote:
>> > We hit a problem trying to exclude L/GPLv3 recipes where
>> > INCOMPATIBLE_LICENSE could only match exactly one license.  The older
>> > wildcard syntax had been broken by a more recent SPDX change
>> > (specifying a string without a SPDXLICENSEMAP entry could crash), so
>> > "*GPLv3" wouldn't work.
>>
>> Ping
>
> I'd like Beth to comment on this patch and she was out last week. I'm
> not 100% if she is back this week :/.
Sorry about the absence (ELCE/Vacation/Thanksgiving had me out for a while).

This patch needs a rebase and a minor bit of whitespace work. I've
done some work to make it apply to the current master head and tested
it out and it does improve the utility of INCOMPATIBLE_LICENSE quite a
bit.

I was able to not-create an image with:

INCOMPATIBLE_LICENSE += "*BSD*"
INCOMPATIBLE_LICENSE += "*GPL*"

Obviously this would fail, however this does end up excluding all
*GPL* and *BSD* licenses.

If it's ok with you, Andy, I'll just submit my modifications to your patch.

-b

>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


