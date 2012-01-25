Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rq7cp-0005FI-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 19:31:15 +0100
Received: by lags15 with SMTP id s15so3191430lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 10:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=MjnQPu8pLj1KFWpO//2IvylqXQ7aK3VaCK3KzLsynG4=;
	b=WHM+c92N/lCZkjEPjwq+jeWiTXMglvx8gUyWHt9Mc+BxVGJYG90Rr0aG18GOPBdfAr
	soe8bE4sjP8bnW+Qe4ypLIAiXwU2e3PzuG9t++Smqfr7Ve5qX4OV4Pc1uPWvxr6eQZLv
	LGxllMSfB+SDooiYUCG5E/88xRBOYXQay+Mww=
Received: by 10.152.122.38 with SMTP id lp6mr9178769lab.13.1327515807980; Wed,
	25 Jan 2012 10:23:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 10:22:56 -0800 (PST)
In-Reply-To: <CAGiJk9eaBCxG=cGvw9PaOhLSwYtLKT+7r5y-=ehe5k2BUHd3+Q@mail.gmail.com>
References: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
	<1327427295.19643.118.camel@ted>
	<CAGiJk9f+AwaG0F0P7sZJq=c6WKvioaQF0i9G0U8FMPfv__yc8A@mail.gmail.com>
	<CAGiJk9eaBCxG=cGvw9PaOhLSwYtLKT+7r5y-=ehe5k2BUHd3+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 10:22:56 -0800
Message-ID: <CAMKF1sp41YHpyt+ihhq=9nzKNPqLEBtQWdr6BjupWBObkLeOeQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: CMake error? CMAKE_AR-NOTFOUND
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
X-List-Received-Date: Wed, 25 Jan 2012 18:31:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 25, 2012 at 12:31 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/1/25 Samuel Stirtzel <s.stirtzel@googlemail.com>:
>> 2012/1/24 Richard Purdie <richard.purdie@linuxfoundation.org>:
>>> On Tue, 2012-01-24 at 14:30 +0100, Samuel Stirtzel wrote:
>>>> Hi,
>>>> currently I try to build a native software that needs CMake, it is a
>>>> required tool to cross compile another software.
>>>> An it seems that CMAKE_AR is set to an invalid value (CMAKE_AR-NOTFOUND).
>>>> The cmake.bbclass has no entry about this.
>>>>
>>>> By searching the web, the only information found was that it can be
>>>> set to ${GCC_PATH}/dld.
>>>> As I am usually not working with CMake where can I find the native
>>>> "ar" or "dld" executable in OpenEmbedded?
>>>>
>>>> Using the archiver from my hosts /usr/bin/ar seems to be wrong since
>>>> in cmake.bbclass "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )"
>>>> prohibits it.
>>>
>>> In the same way the class figures out OECMAKE_C_COMPILER from ${CC}, you
>>> probably need to figure out ar from ${AR} and pass it to the cmake
>>> configuration.
>>>
>>> Note I know very little about cmake so I'm of less help with that
>>> piece ;-).
>>
>> After looking around in all ends of OE-core it shows up that this
>> error is caused by binutils.inc.
>> Finding ar would be no problem itself, but if the binary is not
>> installed or gets deleted after building binutils-native it is
>> impossible to locate it.
>>
>> In binutils.inc do_install:
>> rm ${D}${bindir}/ar ${D}${bindir}/strings
> Sorry I pasted the wrong line, this was for cross compiling.
> From the do_install_virtclass-native:
> # We only want libiberty, libbfd and libopcodes
> rm -rf ${D}${bindir}
>
> but the effect is still the same..
>>
>> Well I still wonder why my target sysroot has ar if it gets deleted here...
>>

because its installed using post_install script.

>> Anyone knows why ar is being removed in do_install?

since post_install will install it as a symlink

>>
>>
>> --
>> Regards
>> Samuel
>
>
>
> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


