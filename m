Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5419C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:26:05 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.27623.1709655960968569958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 425GQ0lD020351
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Mar 2024 10:26:00 -0600
Message-ID: <fb73f365-415a-42b3-9d30-2140f6fa6836@kernel.crashing.org>
Date: Tue, 5 Mar 2024 10:25:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] testimage: allow to set runqemu bootparams
 option
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20240301141726.244561-1-michal.seben@siemens.com>
 <20240301150527.254951-1-michal.seben@siemens.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240301150527.254951-1-michal.seben@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196641

Will this work in the case of a system boot?  I know if we load the kernel 
directly to memory and boot, we can pass kernel command line through QEMU. 
However many boards I have worked with in the past (and still do) do a system 
level boot that starts with BIOS/Firmware, goes into a second stage loader 
(grub/u-boot) and then starts the kernel.  How would these parameters end up 
going to the kernel in that case, or are they silently ignored?  Is silently 
ignored on a system boot the behavior we want?

--Mark

On 3/1/24 9:05 AM, M. Seben via lists.openembedded.org wrote:
> From: michal seben <michal.seben@siemens.com>
> 
> Allow to set runqemu bootparams option using TEST_EXTRABOOTPARAMS
> variable. This option can be used .e.g. to mask service only for
> testimage task.
> 
> Signed-off-by: michal seben <michal.seben@siemens.com>
> ---
>   meta/classes-recipe/testimage.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> index ad040ee8f0..6e2800e3c3 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -47,6 +47,8 @@ TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest
>   # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
>   # TEST_OVERALL_TIMEOUT can be used to set the maximum time in seconds the tests will be allowed to run (defaults to no limit).
>   # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
> +# TEST_EXTRABOOTPARAMS can be used to set the 'bootparams' option for the runqemu script
> +# e.g. "systemd.mask=NetworkManager-wait-online.service" to mask particular service
>   # TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
>   # QEMU_USE_KVM can be set to "" to disable the use of kvm (by default it is enabled if target_arch == build_arch or both of them are x86 archs)
>   
> @@ -358,7 +360,7 @@ def testimage_main(d):
>       try:
>           # We need to check if runqemu ends unexpectedly
>           # or if the worker send us a SIGTERM
> -        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
> +        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), extra_bootparams=d.getVar("TEST_EXTRABOOTPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
>           import threading
>           try:
>               threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196462): https://lists.openembedded.org/g/openembedded-core/message/196462
> Mute This Topic: https://lists.openembedded.org/mt/104665175/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

