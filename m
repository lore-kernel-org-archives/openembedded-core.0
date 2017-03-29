Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2.public.one.com (mailrelay2.public.one.com
	[91.198.169.125])
	by mail.openembedded.org (Postfix) with ESMTP id BA10F71D7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=67quoQWm/lwqsJh/ISmnudJVy56mZkm6MKcVPfl59tE=;
	b=ml/NvaBc2EzPX6xMxbF8SCg9CQCJbD3LZ0/hnIGdQ8sIMUNu+qzcxmd83eckDXqZxHqvQoY5qDxsA
	LEX9Sgzrc5cp5eTqWOTKrPnPaBzLfZ8YVmwc9FrMeabFbZWZMtUY4pCwClZJfmBnuQj2HibpJx3xfh
	J9IfLyR43XuQBkfs=
X-HalOne-Cookie: 3af8449e96f9641c2e3effd30985809a8359fcfc
X-HalOne-ID: eeeb9a30-14a3-11e7-bc04-b82a72d03b9b
Received: from [192.168.100.217] (unknown [37.123.162.211])
	by smtpfilter2.public.one.com (Halon) with ESMTPSA
	id eeeb9a30-14a3-11e7-bc04-b82a72d03b9b;
	Wed, 29 Mar 2017 17:19:58 +0000 (UTC)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
	<1490782943.13980.306.camel@linuxfoundation.org>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <794d2836-c1ae-cc8b-f1dd-d1fb27b05e28@berginkonsult.se>
Date: Wed, 29 Mar 2017 19:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490782943.13980.306.camel@linuxfoundation.org>
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 17:19:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-29 12:22, Richard Purdie wrote:
> On Wed, 2017-03-29 at 10:16 +0200, Peter Bergin wrote:
>> I agree that it is nice and encouraged to group configurations
>> together and make them selectable as a group. A good example from
>> busybox_1.24.1.bb is:
>>
>>              ${@["",
>> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
>> 'busybox')]} \
>>              ${@["",
>> "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') ==
>> 'busybox-mdev')]} \
>>
>> In the example above, configuration fragments are added based on some
>> configuration in your build. The configuration fragments that I
>> removed with my patch was always added and in that situation I think
>> it is better that they are added to the defconfig file. The situation
>> now force me to do workarounds to avoid having these default
>> configurations in my busybox .config.
>>
>> Ideas for better solutions are welcome and I hope we can find a
>> solution that make it possible to provide your own busybox defconfig
>> file that is only changed due to configurations in your build.
> I don't think its difficult to make something which would improve
> things and be configurable from other layers. How about something like:
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 6246c95..cb20207 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -15,6 +15,11 @@ SECTION = "base"
>   # Whether to split the suid apps into a seperate binary
>   BUSYBOX_SPLIT_SUID ?= "1"
>   
> +BUSYBOX_FRAGMENTS = "login-utilities"
> +
> +def busybox_fragment(name, d):
> +    return bb.utils.contains('BUSYBOX_FRAGMENTS', name, "file://" + name + ".cfg", "", d)
> +
>   export EXTRA_CFLAGS = "${CFLAGS}"
>   export EXTRA_LDFLAGS = "${LDFLAGS}"
>   
> diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
> index 41fc641..a0ef17b 100644
> --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
> @@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://run-ptest \
>              file://inetd.conf \
>              file://inetd \
> -           file://login-utilities.cfg \
> +           ${@busybox_fragment("login-utilities", d)} \
>              file://recognize_connmand.patch \
>              file://busybox-cross-menuconfig.patch \
>              file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
>
> Obviously I just used login-utilities as an example...
>
> Cheers,
>
> Richard
>
Thanks for your suggestion. I think this is one step better than what's 
in master today as it can more easily be overridden. But I don't think 
this is a better solution to the problem than moving the defaults to the 
defconfig. Probably I have a bit different view of grouping the config 
features. I think that the grouping in .cfg fragments is a good design 
if you have features that you enable for example via DISTRO_FEATURE or 
VIRTUAL-RUNTIME_init_manager or some other feature option that is 
present in the build system. As in the examples with mbox.cfg and init.cfg.

I think grouping of configurations because they belong together is a 
task for busybox's Kconfig. In the Kconfig system for busybox you can 
see the options you have and their relations. If you start a project and 
want to tune busybox the natural place to do it is in the defconfig 
file. And modifying the defconfig file with help of menuconfig.

What pros do you see of having standard feature .cfg files in SRC_URI 
that are (default) always added instead of having them in the defconfig? 
How does it help the developer/maintainer?

Best regards,
/Peter




