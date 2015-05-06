Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A1D3C73EF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 12:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46CZmf4026903; Wed, 6 May 2015 13:35:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w6fTUiW2_GxW; Wed,  6 May 2015 13:35:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46CZVnY026895
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 May 2015 13:35:43 +0100
Message-ID: <1430915731.8074.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 06 May 2015 13:35:31 +0100
In-Reply-To: <5549B621.4060008@topic.nl>
References: <5549B621.4060008@topic.nl>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Wed, 06 May 2015 12:35:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-05-06 at 08:35 +0200, Mike Looijmans wrote:
> ﻿Something in recent OE-core triggered a weird dependency "backfire".
> 
> If I change a recipe for a kernel module (a bb recipe that does "inherit 
> module") this will trigger a rebuild of the whole kernel.
> 
> This turns the 5-second job of just updating a single module into a several 
> minute workout for the build machine, and then causes boards to re-write the 
> kernel into flash needlessly when upgrading.
> 
> I now see this on all projects using OE-core master. I can't really pin what 
> caused it though. Anyone else seen this?

I have a suspicion this may be as a result of the changed kernel build
process in 1.8. 

The idea there is that the modules depend on the kernel source and
rather than taring up and then extracting a large (GB) sized sstate
object, we just extract the original kernel source.

So is the kernel really rebuilding, or, is it just extracting source for
the kernel to build against? I noticed rm_work in your other post and
this may also be some bad interaction between rm_work and the kernel
build process changes.

Cheers,

Richard



