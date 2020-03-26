Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.37762.1585232176307264398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 07:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02QEG0Dr032088;
	Thu, 26 Mar 2020 09:16:00 -0500
Received: (from apache@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 02QEFxqe032087;
	Thu, 26 Mar 2020 09:15:59 -0500
X-Authentication-Warning: gate.crashing.org: apache set sender to mark.hatle@kernel.crashing.org using -f
Received: from 149.199.62.130
        (SquirrelMail authenticated user mark.hatle)
        by gate.crashing.org with HTTP;
        Thu, 26 Mar 2020 09:15:58 -0500 (CDT)
Message-ID: <58432.149.199.62.130.1585232158.squirrel@gate.crashing.org>
In-Reply-To: <20200326131141.GB17705@localhost>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
    <20200325182129.GD1578@denix.org>
    <11151.149.199.62.130.1585161676.squirrel@gate.crashing.org>
    <CANNYZj_s6yG2qRnEMv_PrFc6ut2mOfJFNFpBd4EzdhUHe8Xxyw@mail.gmail.com>
    <10720.149.199.62.130.1585164457.squirrel@gate.crashing.org>
    <20200326131141.GB17705@localhost>
Date: Thu, 26 Mar 2020 09:15:58 -0500 (CDT)
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: "Adrian Bunk" <bunk@stusta.de>
Cc: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
        "Alexander Kanavin" <alex.kanavin@gmail.com>,
        "Denys Dmytriyenko" <denis@denix.org>,
        "Burton, Ross" <ross.burton@intel.com>,
        "OE-core" <openembedded-core@lists.openembedded.org>
User-Agent: SquirrelMail/1.4.10a-1.fc6
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On Wed, Mar 25, 2020 at 02:27:37PM -0500, Mark Hatle wrote:
>> > To be honest, I would just take the entire recipe out. It's causing
>> > trouble
>> > during updates, isn't being tested neither for builds nor at runtime,
>> and
>> > is supposed to provide some specific configuration which as this
>> > discussion
>> > makes clear, nobody seems to quite understand.
>>
>> With the abomination that is libmali (and similar), it is still needed.
>> It's the only way to support GL on a primarily GLES compatible system.
>>
>> The problem is the way they do this seems to be a custom version of
>> libdrm, which then conflicts with the mesa version.  Thus the issues.
>>
>> I'm happy to continue testing my particular needs now and the future
>> (thus
>> the patch against master.)
>>...
>
> Stupid question:
>
> Is
>   PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
>   PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> equivalent to
>   PACKAGECONFIG_pn-mesa = "opengl dri x11"
> ?

I don't know.  I didn't write this.

However, doing some investigation, the big difference here is the overall
capabilities.  There are common distributions where a user may want to use
mesa (no external libdrm) as well as distress where they want to use an
external drm and the mesa-gl version only.

So 'mesa' and 'external drm + mesa-gl' are equivalent in functionality for
a given distro.  Only difference being optimization.

You may ask why would I use one vs the other.  In my case, we have a
family of SoC parts.  Some of the family have a Mali graphics chip on
them, while others don't have any optimized graphics so everything has to
be software rendered.  The only difference (from a software point of view)
is if the Mali is on-board or not.  So using a common (binary)
distribution, and being able to just swap those parts is highly desirable.
 (Does that ACTUALLY work right now, I'm not sure.. but that is what I am
working on.)

>> --Mark
>
> cu
> Adrian
>

