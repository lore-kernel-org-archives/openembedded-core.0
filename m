Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RpyNy-0007Sf-0c
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 09:39:18 +0100
Received: by werc1 with SMTP id c1so2573398wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 00:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gqtzpNeGuYpOCJVTvl4/CCENDjzLnz2fbGKr5FJQayQ=;
	b=MEgJKXAIrTEyU57DiVw1aJ7txe5ZJn93zdSQLXfDEyo8dYp90C+eIWlOf85fRRFg0a
	4TDtgdwFVgd6q0NmfvMLvHbY+iZU56vjXrWnyrrOu2aAWJSEJ6a9m3vlUMuWxLnOycxy
	pVG7SyMVLM+fQ5FyA6reJjKtMw24y8kxZQGvQ=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr2995050wej.24.1327480291837;
	Wed, 25 Jan 2012 00:31:31 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Wed, 25 Jan 2012 00:31:31 -0800 (PST)
In-Reply-To: <CAGiJk9f+AwaG0F0P7sZJq=c6WKvioaQF0i9G0U8FMPfv__yc8A@mail.gmail.com>
References: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
	<1327427295.19643.118.camel@ted>
	<CAGiJk9f+AwaG0F0P7sZJq=c6WKvioaQF0i9G0U8FMPfv__yc8A@mail.gmail.com>
Date: Wed, 25 Jan 2012 09:31:31 +0100
Message-ID: <CAGiJk9eaBCxG=cGvw9PaOhLSwYtLKT+7r5y-=ehe5k2BUHd3+Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Wed, 25 Jan 2012 08:39:18 -0000
Content-Type: text/plain; charset=UTF-8

2012/1/25 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/1/24 Richard Purdie <richard.purdie@linuxfoundation.org>:
>> On Tue, 2012-01-24 at 14:30 +0100, Samuel Stirtzel wrote:
>>> Hi,
>>> currently I try to build a native software that needs CMake, it is a
>>> required tool to cross compile another software.
>>> An it seems that CMAKE_AR is set to an invalid value (CMAKE_AR-NOTFOUND).
>>> The cmake.bbclass has no entry about this.
>>>
>>> By searching the web, the only information found was that it can be
>>> set to ${GCC_PATH}/dld.
>>> As I am usually not working with CMake where can I find the native
>>> "ar" or "dld" executable in OpenEmbedded?
>>>
>>> Using the archiver from my hosts /usr/bin/ar seems to be wrong since
>>> in cmake.bbclass "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )"
>>> prohibits it.
>>
>> In the same way the class figures out OECMAKE_C_COMPILER from ${CC}, you
>> probably need to figure out ar from ${AR} and pass it to the cmake
>> configuration.
>>
>> Note I know very little about cmake so I'm of less help with that
>> piece ;-).
>
> After looking around in all ends of OE-core it shows up that this
> error is caused by binutils.inc.
> Finding ar would be no problem itself, but if the binary is not
> installed or gets deleted after building binutils-native it is
> impossible to locate it.
>
> In binutils.inc do_install:
> rm ${D}${bindir}/ar ${D}${bindir}/strings
Sorry I pasted the wrong line, this was for cross compiling.
From the do_install_virtclass-native:
# We only want libiberty, libbfd and libopcodes
rm -rf ${D}${bindir}

but the effect is still the same..
>
> Well I still wonder why my target sysroot has ar if it gets deleted here...
>
> Anyone knows why ar is being removed in do_install?
>
>
> --
> Regards
> Samuel



-- 
Regards
Samuel


