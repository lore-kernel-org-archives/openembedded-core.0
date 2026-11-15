Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.367.1794705433376416251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 17:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 6AF1HBef3188083;
	Sat, 14 Nov 2026 19:17:11 -0600
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 6AF1HACo029151;
	Sat, 14 Nov 2026 19:17:10 -0600
Message-ID: <9b8e9645-7cb5-4f0c-b154-a0e7379f663a@kernel.crashing.org>
Date: Sat, 14 Nov 2026 19:17:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v9 0/9] Implement SPDX for deploy tasks
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 01:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250216

This set appears have triggered a failure in my usage in master.

The easiest way to reproduce it is to run:

MACHINE=qemux86-64 bitbake ovmf-native -c deploy
MACHINE=qemuarm64 bitbake ovmf-native -c deploy

The first machine will work fine, the second will fail with a manifest error. 
It basically says that the manifest file that's part of the SPDX work conflicts 
between the two machines.  I've looked at the code, but I don't really 
understand what is supposed to happen here to suggested a fix.

Adding the following to the local.conf seems to at least avoid the error for me:

SPDX_DEPLOY_TASKS:remove = "do_deploy"

This is far from a fix, as it pretty much disables the who point of these 
changes, but it might be useful to get someone unstuck.

On 11/9/26 1:45 PM, Joshua Watt via openembedded-core wrote:
> The SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
> 
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
> 
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
> 
> V2: Fixed SPDX documents missing at SBoM creation time when the
> documents were not a direct dependency of the SBoM, and were present in
> a sstate object. Previously, these sstate objects were not restored
> because they were "covered" by the later sstate tasks, but now they are
> restored if they are depended on by a task that creates SPDX output.
> 
> V3: Fixed a bug where dependencies that are not in the taskhash could be
> missing when the final SBoM is created and added tests.
> 
> V4: Fixed some testing errors that revealed that EFI providers have to
> be MACHINE_ARCH (and consequently, wic-tools)
> 
> V6: Fixed a bug where eudev/systemd initramfs-framework was not being
> properly detected and the wrong link was in the SPDX due to the switch
> between the two not being detected.
> 
> Also, deploy.bbclass now always adds do_deploy to SPDX_DEPLOY_TASKS, so
> any recipe inheriting that class gets it automatically.
> 
> V7: Add SPDX_DEPLOY_ALLOW_EMPTY variable, and set it on ovmf to fix it
> erroring out for native builds.
> 
> V8: Fix deploy error for linux-dummy, and allarch signature error for
> initramfs-framework
> 
> V9: Fix initramfs-module-setup-live allarch signature error now that
> initramfs-framwork is no longer allarch.
> 
> Joshua Watt (9):
>    spdx: Skip dependencies that are not in the taskhash
>    spdx: Add ability for deploy tasks to create SPDX
>    oeqa: Add SPDX deploy SBoM test
>    classes-global/sstate: Keep SPDX generating setscene dependencies
>    classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
>    spdx: Replace do_create_image_spdx with deploy task
>    layer.conf: Fix initramfs-framework not knowing which udev it has
>    ovmf: Allow empty SPDX deploy artifacts
>    linux-dummy: Allow empty SPDX deploy artifacts
> 
>   meta/classes-global/sstate.bbclass            |  38 ++-
>   .../create-spdx-image-3.0.bbclass             |  32 +-
>   meta/classes-recipe/deploy.bbclass            |   2 +
>   meta/classes-recipe/nospdx.bbclass            |   2 +-
>   meta/classes/create-spdx-3.0.bbclass          | 185 ++++++++++
>   meta/classes/spdx-common.bbclass              |   2 +-
>   meta/conf/layer.conf                          |   3 +-
>   meta/lib/oe/sbom30.py                         |  46 ++-
>   meta/lib/oe/spdx30_tasks.py                   | 323 ++++++++++++++----
>   meta/lib/oe/spdx_common.py                    |   2 +-
>   meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
>   .../initrdscripts/initramfs-framework_1.0.bb  |   2 -
>   meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
>   meta/recipes-kernel/linux/linux-dummy.bb      |   2 +
>   14 files changed, 546 insertions(+), 105 deletions(-)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249865): https://lists.openembedded.org/g/openembedded-core/message/249865
> Mute This Topic: https://lists.openembedded.org/mt/122181587/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
