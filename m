Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 283C16067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 03:42:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3Q3g2GY007088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:42:03 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 20:42:01 -0700
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571EE388.7040107@windriver.com>
Date: Tue, 26 Apr 2016 11:42:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: Make runqemu knows nothing about machine
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
X-List-Received-Date: Tue, 26 Apr 2016 03:42:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The qemu-native can boot a lot of machines, but oe-core's runqemu can only
boot a few of them which are hardcoded into runqemu. I'd like to change
it little to make it drop the hardcode and can boot more machines. Here
are some basic thoughts, please feel free to give your comments.

runqemu is a helpful script which can help us boot images easily, but it
has a lot of hard code for machine + args. I'd like to remove these from
runqemu, and make it as a frame. The logical is that, who knows clearly
about whether qemu can boot the machine and how to boot it (args), the
answer is the machine/bsp developer, so we can:

* Add a var like QEMU_SUPPORTED = "yes/no" in the bsp conf file (default to no)
* Add a var like QEMU_BOOT_ARGS = "foo" if there are special args.
* Let do_rootfs or do_image_foo write data such as QEMU_BOOT_ARGS to
   DEPLOY_DIR_IMAGE/runqemu/ or tmp/deploy/images/runqemu/, we can treat
   the "runqemu/" dir as a database, and anything we need there, for example,
   efi/pcbios, root args, and so on. We won't miss anything since all the
   images which can be boot by runqemu are built by oe-core.
* Then we can easily add supported machine to runqemu from the bsp itself
   without change runqemu.

I will start working on it if there is no objections, and make sure it won't
break any current supported machines.

-- 
Thanks

Robert

