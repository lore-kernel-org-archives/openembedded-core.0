Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.19990.1585161717929016893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 11:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02PIfXpD009048;
	Wed, 25 Mar 2020 13:41:34 -0500
Received: (from apache@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 02PIfXLC009041;
	Wed, 25 Mar 2020 13:41:33 -0500
X-Authentication-Warning: gate.crashing.org: apache set sender to mark.hatle@kernel.crashing.org using -f
Received: from 149.199.62.130
        (SquirrelMail authenticated user mark.hatle)
        by gate.crashing.org with HTTP;
        Wed, 25 Mar 2020 13:41:16 -0500 (CDT)
Message-ID: <11151.149.199.62.130.1585161676.squirrel@gate.crashing.org>
In-Reply-To: <20200325182129.GD1578@denix.org>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
    <20200325182129.GD1578@denix.org>
Date: Wed, 25 Mar 2020 13:41:16 -0500 (CDT)
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: "Denys Dmytriyenko" <denis@denix.org>
Cc: "Mark Hatle" <mark.hatle@kernel.crashing.org>, ross.burton@intel.com,
        openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a-1.fc6
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On Wed, Mar 25, 2020 at 01:14:47PM -0500, Mark Hatle wrote:
>> Trying to build mesa-gl without X11 enabled, results in numerous errors
>> about being incorrectly configured, such as:
>>
>>   ERROR: Problem encountered: building dri drivers require at least one
>> windowing system or classic osmesa
>>
>> After consulting with the author of this recipe, it was clear that it
>> was only intended for the X11 use-case, so requring X11 should avoid the
>> error message above.
>
> Hmm. That's not good. There are embedded devices that provide EGL/GLES
> support
> through own stack, but fall back on MESA for full desktop GL support.
> That's
> been working to some extent even with Wayland and w/o X11. With your
> change
> that won't be possible any more...


Have you tried any of these?  This hasn't been working since Zeus with an
external libmali and non-X11 configuration.  It returns the error listed
in the commit message "ERROR: Problem encountered: building dri drivers
require at least one windowing system or classic osmesa" during
configuration.

Ross and I talked about it and he said this was specific to X11
implementation and wasn't meant to work for other implementations. 
(fbdev/QT/etc.)

If Wayland is supposed to work, then someone needs to go in and adjust the
configuration to also support Wayland.  I don't have any Wayland systems
to even know what the right configuration COULD be.

The specific configuration I'm running has "OpenGL" in the DISTRO_FEATURE,
but does NOT have X11 or Wayland".

DISTRO_FEATURES_append = " opengl"
DISTRO_FEATURES_remove = "x11 wayland"

--Mark

> --
> Denys
>
>
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
>
>> 
>

