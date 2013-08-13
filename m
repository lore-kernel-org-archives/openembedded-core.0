Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 59B2B6AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:14:38 +0000 (UTC)
Message-ID: <520A070C.3090302@communistcode.co.uk>
Date: Tue, 13 Aug 2013 11:14:36 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
In-Reply-To: <CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2013 10:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 13/08/13 10:52, Laszlo Papp wrote:
> As we have already discussed that, it is not any clear at all without
> example. Yes, the end user does not really care about the internal
> implementation of the feature ....
> 
> Please provide useful examples and tutorials how to use a feature
> especially when a user (and apparently others posting here) is such
> clueless.
> 
> Oh, by the way, and I have mentioned this in the bug report as well. We
> need proper documentation, examples, and tutorials; i.e. I am not ahead
> of the day when I first read this post. ;-)
> 
> 
> On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
> 
>     On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org
>     <mailto:lpapp@kde.org>> wrote:
>     > So, everyone suggested PACKAGECONFIG in here on the mailing list
>     except Khem
>     > whose reply I did not get.
>     >
>     > Yet, 4964 got closed by the "team". Could anyone please give a sane
>     > description why and what would block the end users other than fork?
> 
>     Quoting from comment 1 on 4964:
> 
>     """
>     Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
>     not sufficient to manage it's config system. It is very similar to the
>     Linux kernel config and we recently added configuration fragment
>     support to busybox from the kernel recipes:
> 
>     commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
>     Author: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     Date:   Tue Feb 5 14:36:40 2013 +0800
> 
>         busybox: add config fragments
> 
>     This allows you to use the default config and include only the delta
>     in your layer's bbappend in the form of a config fragment added to the
>     SRC_URI.
>     """
> 
>     If this isn't sufficient or is buggy, then fixing this is preferred
>     (it works for the kernel, so should work for busybox).
> 
>     Ross
> 
> 
> 
> 

1) The top posting in this thread is nigh unbearable, please bottom post
in order to keep the flow of conversation.

2) The busybox config fragments was added in this cycle, which is
probably the reason for no official documentation yet.

3) There is an example in the bug report where it was added
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3379) which you can
look at if you wish to be an early adopter and test this _new_ feature.

4) For simplicity I have copied the explanation in below:

> Steps:
> 1. Add a new cal.cfg file to meta/recipes-core/busybox/busybox-1.20.2/
> $ cat cal.cfg 
> CONFIG_CAL=y
> 
> 2. Run "bitbake busybox"
> Check the build/tmp/work/armv5te-poky-linux-gnueabi/busybox/1.20.2-r5/busybox-1.20.2/.config file.
> The CONFIG_CAL should be set to y.
> 
> 3. Run "bitbake core-image-minimal"
> Boot up the image, the cal command should be exist.
> root@qemuarm:~# which cal
> /usr/bin/cal
> root@qemuarm:~# ls -l /usr/bin/cal 
> lrwxrwxrwx    1 root     root            12 Mar  1 06:17 /usr/bin/cal -> /bin/busybox
> root@qemuarm:~#

So, all you need to do is add CONFIG_RFKILL=n or whatever the config
name is and that should remove rfkill from the busybox command set.

Regards,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambrideshire, UK
  http://www.embed.me.uk
--

