Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5F576E70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 04:52:37 +0000 (UTC)
Received: by ioll68 with SMTP id l68so8292562iol.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 20:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ibk9c68jYu/oFTM2A7Uj0SBQW+AWWJ5D7yCrh1oI2XE=;
	b=oDdgi5zykO7yZAnecaGET/3JAYno0tUK8jyvTaJV1EAHtdX1OQgiV2EFuRldF98MDt
	4vJVhZh9uBb4l0IsVciofPUiVg0A7OPuWet4cyIy0LxqUWJJd/Bdi1mI8Ao8HSgEtAB3
	x06vR7dr90m0YAJsSrQgAyFkv6swlMZLCxKzV+zbJ4m1zu45cGOJLws56RRdSkU62j1O
	k/vrxei8e/NV1uGE5Sgkl1y6D4PmZpWIY9Sd8ldAp4LVgQFn9sQgjze/z6q/RmM0hIdO
	HbrUeVmnux5W3DW1VLC6S9OaW1T8vmtiMeuZbqfeqqmuWKjS0PQauAl15vd6T3ypuBhB
	kjRQ==
X-Received: by 10.107.4.3 with SMTP id 3mr7749544ioe.195.1446526357337; Mon,
	02 Nov 2015 20:52:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Mon, 2 Nov 2015 20:52:07 -0800 (PST)
In-Reply-To: <5638162C.304@windriver.com>
References: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
	<1446509230-116578-5-git-send-email-mark.hatle@windriver.com>
	<CAMKF1srqHEUBJTxNvsoXyCf5HWPGb4cCxQ1a0cJntLN7_+X2RQ@mail.gmail.com>
	<5638162C.304@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2015 20:52:07 -0800
Message-ID: <CAMKF1sqPhFgAYjp5DYB_ANnEG=TMgW-7Y22HY+yTkQ0eboHz6g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] Revert "local.conf.sample: Disable image-prelink by default"
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
X-List-Received-Date: Tue, 03 Nov 2015 04:52:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 6:04 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 11/2/15 6:10 PM, Khem Raj wrote:
>> On Mon, Nov 2, 2015 at 4:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> This reverts commit 6dd28030f323d7106a02ec54ce4e249561ab0836.
>>>
>>> Prelink now works properly again.  Re-enable the functionality.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>  meta/conf/local.conf.sample | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>>> index 9d1480e..3ae24ab 100644
>>> --- a/meta/conf/local.conf.sample
>>> +++ b/meta/conf/local.conf.sample
>>> @@ -128,9 +128,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>>  #   - 'image-swab' to perform host system intrusion detection
>>>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>>>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>>> -# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
>>> -# that you do NOT run the prelinker at this time.
>>> -USER_CLASSES ?= "buildstats image-mklibs"
>>> +USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>>
>> With all the discussions around benefits of it recently, I think its
>> better disabled IMO,
>>
>
> I disagree.  I've got rough estimate figures for prelink improvement to the system.
>

core-image-sato is one image, we do not know if all apps in world
build are prelink friendly, I have seen atleast some packages
misbehave, (net-snmp on mips32) when using applications from meta-oe
and big C++ applications internally, Debugging failures due to prelink
issues is very hard, thats why I think
making it default may not give best experience for users.

> core-image-sato w/ systemd enabled:
>
> MIPS64 - n64 - 1.5MB of ram saved
> MIPS64 - n32 - 500KB of ram saved
> MIPS32 - n32 - 300KB of ram saved
>
> ARM - 560k of ram saved
>
> PPC - 380k of ram saved
>
> IA32 - forgot to write it down, was around 500k.
>
>
> Testing also showed sysvinit saves even more memory due to COW pages then
> systemd.  (I was a bit surprised by that.)  My testing consisted of building a
> filesystem and booting it.  Waiting for everything to 'finish' and then
> comparing the output of the 'free' command in KB.
>
>
> As for startup time savings, I don't have specific figures BUT, for a few key
> cases the load time of the executable is up to 50% faster.  For instance busybox
> on the qemux86-64.  Keep in mind that busybox is pretty simple and uses only a
> few libraries.  The more libraries in use, the more prelink will affect load times.
>
> The busybox binary loading and then exiting (LD_BIND_NOW=1 LD_DEBUG=statistics):
>
> (not prelinked with LD_BIND_NOW defined to simulate worst case, all relocations
> needed)
>
>        566:
>        566:     runtime linker statistics:
>        566:       total startup time in dynamic loader: 182539970 cycles
>        566:                 time needed for relocation: 40894259 cycles (22.4%)
>
>        566:                      number of relocations: 443
>        566:           number of relocations from cache: 3
>        566:             number of relative relocations: 1200
>        566:                time needed to load objects: 63004343 cycles (34.5%)
>
>        566:
>        566:     runtime linker statistics:
>        566:                final number of relocations: 445
>        566:     final number of relocations from cache: 3
>
> (prelinked, same LD_BIND_NOW defined)
>
>        524:
>        524:     runtime linker statistics:
>        524:       total startup time in dynamic loader: 32420607 cycles
>        524:                 time needed for relocation: 2812608 cycles (8.6%)
>        524:                      number of relocations: 4
>        524:           number of relocations from cache: 76
>        524:             number of relative relocations: 0
>        524:                time needed to load objects: 15549810 cycles (47.9%)
>
>        524:
>        524:     runtime linker statistics:
>        524:                final number of relocations: 6
>        524:     final number of relocations from cache: 76
>
> (both of the above were run with a hot cache, multiple times until the system
> stabilized and returned results that were fairly consistent)
>
> So the executable load time dropped to 17% (32420607/182539970) of the original
> value due to being prelinked.

