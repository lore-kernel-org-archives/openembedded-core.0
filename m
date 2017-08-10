Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A259F71AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:57:45 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 34F3D4C7E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 11:57:46 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <cb7a3cf4-4167-bc42-ab9b-72f67bc996cd@pseudoterminal.org>
Date: Thu, 10 Aug 2017 11:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
Subject: Stricter fuzz factor when patching?
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
X-List-Received-Date: Thu, 10 Aug 2017 09:57:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I noticed a problem here which was caused by the nonzero fuzz factor as 
it is used in Yocto Pyro.

Suppose there are two patches A and B, and they do touch the same parts 
of the code, so they do influence each other.

The intended patch application order is A, then B. But due to an error 
in a bbappend the actual order is B, then A. I'd expect an error when 
bitbake attempts to patch with B first (because A's changes are 
missing). However, what actually happened that an error came when 
bitbake tries to apply A.

Here's why? Patch A adds exactly one line. This extra line happens to 
affect the context area in B. And since the default fuzz factor is 2, 
this one line difference in B's context is suppressed. As a result, I 
get the confusing error output that A could not be applied. If I force 
the fuzz factor to be 0, then everything happens as expected - an error 
occurs when trying to apply B first.

I was surprised that Yocto does not use fuzz factor 0 by default. The 
case above demonstrates how this can lead to confusing errors. Or worse, 
recipes might even build but then cause subtle runtime errors...

Is there a reason why the default fuzz factor isn't 0? Is it just 
because of the large amount of work required to fix all these patches 
that won't apply without a fuzz factor?

