Return-Path: <pascal.bach@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4E860053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:36:34 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id u5LEaWTA030428
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 16:36:32 +0200
Received: from [139.16.77.141] (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u5LEaWMG026446
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 16:36:32 +0200
To: openembedded-core@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <fdf902fc-2f74-e750-7215-bd939cac4518@siemens.com>
Date: Tue, 21 Jun 2016 16:36:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: rebuilding external kernel modules when kernel changed
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
X-List-Received-Date: Tue, 21 Jun 2016 14:36:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello

I ran into an issue when working with kernel modules that are not part of the kernel source tree.

The issue manifests itself as follows:

1. Build an image containing virtual/kernel and kernel-module-a

2. Do a `bitbake virtual/kernel -c clean`

3. Rebuild the above image again. This causes the kernel do rebuild and it seems that the do_compile task of kernel-module-a is also re-exectued.
But this causes an error as there is some configuration missing in the kernel source directory that is created by module.bbclass:do_make_scripts.
I think that the issue is that the do_make_scripts task is not re-executed prior to the modules do_compile task.


I tried to teach bitbake to execute do_make_scripts too once the kernel was rebuilt, but I didn't find a way.

Any hints how this can be done?

Regards
Pascal


