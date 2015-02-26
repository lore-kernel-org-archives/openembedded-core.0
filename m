Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 85B4A71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A535F3151240;
	Thu, 26 Feb 2015 23:27:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fTjnktdkCV1q; Thu, 26 Feb 2015 23:27:13 +0100 (CET)
Received: from [172.22.22.61] (55d4473d.access.ecotel.net [85.212.71.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8EAD9315123E;
	Thu, 26 Feb 2015 23:27:13 +0100 (CET)
Message-ID: <54EF9DC1.20403@opendreambox.org>
Date: Thu, 26 Feb 2015 23:27:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>	<1424987235.26813.42.camel@linuxfoundation.org>	<54EF969E.7080000@opendreambox.org>
	<CAP9ODKpyYwZ1bAzfo9U0gcagLHyYdfbDEYOcLcD52UKH2WKbZg@mail.gmail.com>
In-Reply-To: <CAP9ODKpyYwZ1bAzfo9U0gcagLHyYdfbDEYOcLcD52UKH2WKbZg@mail.gmail.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Thu, 26 Feb 2015 22:27:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 26.02.2015 23:11, Otavio Salvador wrote:
> On Thu, Feb 26, 2015 at 6:56 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> On 26.02.2015 22:47, Richard Purdie wrote:
>>> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>>>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>>>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>>>> when doing cross-compilation builds and out-of-tree builds.
>>>
>>> Ultimately I think we need to address this issue in gcc itself, probably
>>> setting some kind of base path in the environment which it removes from
>>> __FILE__ (set to ${S}). There were more complex discussions about using
>>> the same mapping code as can be used with the debug symbols code too.
>>
>> FWIW, here's a patch I'm using with gcc 4.8, which just cuts off the
>> whole directory part.
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/master&id=a1e8d6cfb71367d745f2478c13a7250e41ca4f1b
> 
> Ideally it could drop the S from the string. So the internal path
> would be respected.
> 
> What do you think?

I thought about that before, but preferred not to do it for the sake of
simplicity. Usually __FILE__ is used for debug output, so it's printed
together with a more or less unique debug message. I guess it should be
easy to find the right location inside the source tree in almost every
case, even if some filenames might appear more than once in a project.

Note that generated source files may live in ${B}, which is not below
${S}. You could cut off ${WORKDIR} instead, though.

Regards,
Andreas

