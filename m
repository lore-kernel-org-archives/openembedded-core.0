Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 542DA6E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 93DE63520B7F;
	Thu, 10 Mar 2016 01:26:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id yDE1npRjS052; Thu, 10 Mar 2016 01:26:04 +0100 (CET)
Received: from [172.22.22.61] (55d41e29.access.ecotel.net [85.212.30.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D33FD315FF59;
	Thu, 10 Mar 2016 01:26:03 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
	<56E0B734.4000607@opendreambox.org> <20160310000955.GP2542@jama>
	<1457568909.2804.209.camel@linuxfoundation.org>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <56E0BF1B.5030006@opendreambox.org>
Date: Thu, 10 Mar 2016 01:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457568909.2804.209.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 10 Mar 2016 00:26:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10.03.2016 01:15, Richard Purdie wrote:
> On Thu, 2016-03-10 at 01:09 +0100, Martin Jansa wrote:
>> On Thu, Mar 10, 2016 at 12:52:20AM +0100, Andreas Oberritter wrote:
>>> Hello Alexander,
>>>
>>> On 09.03.2016 16:01, Alexander Kanavin wrote:
>>>> Signed-off-by: Alexander Kanavin <
>>>> alexander.kanavin@linux.intel.com>
>>>> ---
>>>>  meta/classes/gobject-introspection.bbclass | 39
>>>> ++++++++++++++++++++++++++++++
>>>>  1 file changed, 39 insertions(+)
>>>>  create mode 100644 meta/classes/gobject-introspection.bbclass
>>>>
>>>> diff --git a/meta/classes/gobject-introspection.bbclass
>>>> b/meta/classes/gobject-introspection.bbclass
>>>> new file mode 100644
>>>> index 0000000..ef51629
>>>> --- /dev/null
>>>> +++ b/meta/classes/gobject-introspection.bbclass
>>>> @@ -0,0 +1,39 @@
>>>> +# Inherit this class in recipes to enable building their
>>>> introspection files
>>>> +
>>>> +# This allows disabling introspection support in recipes
>>>> +# (and therefore avoiding the use of qemu)
>>>> +# if gobject-introspection-data is omitted from DISTRO_FEATURES
>>>> and MACHINE_FEATURES.
>>>> +EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES'
>>>> , 'gobject-introspection-data', '--enable-introspection', '-
>>>> -disable-introspection', d)} "
>>>
>>> testing only DISTRO_FEATURES would be better. If MACHINE_FEATURES
>>> gets
>>> tested, even though indirectly, I'd expect every recipe inheriting
>>> this
>>> class to switch to MACHINE_ARCH implicitly.
>>
>> I think the idea was to prevent using qemu for MACHINEs without
>> support
>> in qemu. But I fully agree that causing all recipes which inherit
>> this
>> bbclass effectively MACHINE_ARCH is even worse.
>>
>> DISTRO needs to make sure that all supported MACHINEs have support in
>> qemu or disable introspection for all of them.
> 
> Remember that bitbake has special knowledge of bb.utils.contains() and
> is clever enough to make the checksums depend on "gobject-introspection
> -data" being present or not and not the actual complete value.
> 
> So we can get the best of both worlds here, you can disable g-i on a
> per machine basis yet still enable at the distro level. Recipes don't
> become machine specific.

How does this work out on a shared package feed, of which some machines
have the required qemu support and others don't?

Regards,
Andreas

