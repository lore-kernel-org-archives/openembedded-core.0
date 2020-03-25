Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.22806.1585168564117227776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 13:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02PKZxp7014447;
	Wed, 25 Mar 2020 15:35:59 -0500
Received: (from apache@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 02PKZwW6014442;
	Wed, 25 Mar 2020 15:35:58 -0500
X-Authentication-Warning: gate.crashing.org: apache set sender to mark.hatle@kernel.crashing.org using -f
Received: from 149.199.62.130
        (SquirrelMail authenticated user mark.hatle)
        by gate.crashing.org with HTTP;
        Wed, 25 Mar 2020 15:35:58 -0500 (CDT)
Message-ID: <6502.149.199.62.130.1585168558.squirrel@gate.crashing.org>
In-Reply-To: 
     <CAHtQpK7OJdEQCSY1wsKGKLoz1nQZ7SHCsj9ke_BjC=VWrYfX5Q@mail.gmail.com>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
    <CAHtQpK7OJdEQCSY1wsKGKLoz1nQZ7SHCsj9ke_BjC=VWrYfX5Q@mail.gmail.com>
Date: Wed, 25 Mar 2020 15:35:58 -0500 (CDT)
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: "Andrey Zhizhikin" <andrey.z@gmail.com>
Cc: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
        "Ross Burton" <ross.burton@intel.com>,
        "OE Core mailing list" <openembedded-core@lists.openembedded.org>
User-Agent: SquirrelMail/1.4.10a-1.fc6
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On Wed, Mar 25, 2020 at 7:15 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> Trying to build mesa-gl without X11 enabled, results in numerous errors
>> about being incorrectly configured, such as:
>>
>>   ERROR: Problem encountered: building dri drivers require at least one
>> windowing system or classic osmesa
>
> I believe I was fighting similar issue in meta-freescale layer for
> imx8mm derivative [1], where the status of GPU support was not know at
> the time. What I did back then is set the default configuration to
> osmesa and used swrast in order to be able to use mesa on that
> derivative. After that, when GPU support has been added into Mesa -
> those modifications were reverted.

Do you have a pointer to that anywhere?  I'm curious if any of it might
still apply.. but I know nothing about mesa and what configurations are
even possible.

> I guess turning to swrast in case if someone would decide _not_ to use
> X11 - is not a bad option here, rather than enforcing the X11 for
> distros which are using this recipe. Any thoughts?

I don't know any any reasons we couldn't do this.. but like I said.. I'm a
newbie when it comes to mesa.

--Mark

>>
>> After consulting with the author of this recipe, it was clear that it
>> was only intended for the X11 use-case, so requring X11 should avoid the
>> error message above.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
>> b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
>> index d4b1c1c454..5674c6b1fe 100644
>> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
>> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
>>
>>  S = "${WORKDIR}/mesa-${PV}"
>>
>> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
>> 'x11', d)}"
>> -PACKAGECONFIG_class-target = "opengl dri
>> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> +REQUIRED_DISTRO_FEATURE = "x11"
>> +
>> +PACKAGECONFIG ??= "opengl dri x11"
>> +PACKAGECONFIG_class-target = "opengl dri x11"
>> --
>> 2.17.1
>>
>>
>
> --
> Regards,
> Andrey.
>
> [1]:
> https://github.com/Freescale/meta-freescale/commit/9a2210d9ec707531436dc4b56ce655c0bf50a8a8
> 
>

