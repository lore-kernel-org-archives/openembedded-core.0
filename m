Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 318DD74116
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:03:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5426C600EEE
Message-ID: <555618B4.9050003@collabora.co.uk>
Date: Fri, 15 May 2015 17:03:00 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1431696945.git.joshua.lock@collabora.co.uk>	<a77975067764b47f3e9cf28b3de7ecfbfe5b2342.1431696945.git.joshua.lock@collabora.co.uk>
	<555615C9.3030503@opendreambox.org>
In-Reply-To: <555615C9.3030503@opendreambox.org>
Subject: Re: [PATCH 1/1] cairo: make xlib and libxcb dependencies explicit
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
X-List-Received-Date: Fri, 15 May 2015 16:03:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 15/05/15 16:50, Andreas Oberritter wrote:
> Hi Joshua,
>
> On 15.05.2015 15:37, Joshua Lock wrote:
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>>   meta/recipes-graphics/cairo/cairo.inc | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
>> index 98add5a..1e45318 100644
>> --- a/meta/recipes-graphics/cairo/cairo.inc
>> +++ b/meta/recipes-graphics/cairo/cairo.inc
>> @@ -17,9 +17,11 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
>>   X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>>   DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>>
>> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>>              ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
>> -PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
>> +
>> +PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>> +PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>
> your patch adds a dependency on xcb by default, which you didn't
> mention.

That's true, however I believe xcb is picked up in a default build of 
the current recipe (by virtue of it being a dependency of libx11) and 
thus I included it in the default PACKAGECONFIG so as to make current 
behaviour explicit.

> Cairo has more floating dependencies. I have a similar but more
> complete patch which I haven't tested on master yet. See below.

That is indeed a more complete fix, I'd be happy to see it land instead 
of my proposed change.

Regards,

Joshua

