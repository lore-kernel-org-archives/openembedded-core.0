Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 19EB260620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:45:21 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A450068A01C; Mon, 26 Sep 2016 08:45:22 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 5240968A019;
	Mon, 26 Sep 2016 08:45:22 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A86ED67402C1;
	Mon, 26 Sep 2016 09:45:21 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <76f82786-3577-8551-7ae3-1f7a31dc1388@mlbassoc.com>
Date: Mon, 26 Sep 2016 09:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: watchdog vs. wd-keepalive
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
X-List-Received-Date: Mon, 26 Sep 2016 07:45:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

With recent changes to the watchdog recipe, there are now
separate packages, one which starts "watchdog" and the other
which starts "wd_keepalive".  At least on my hardware (an i.MX6
plus an external watchdog), these are self conflicting.  If the
"watchdog" process starts first, the "wd_keepalive" process fails
because it gets EBUSY when it tries to open the watchdog device
(since both processes use the same config file) and vice-versa.
I've proven that either of these by itself is sufficient (again,
only tested on my hardware) and before these changes I was only
running the 'wd_keepalive' program via a target-specific, ad hoc,
startup.

So, which should it be?  I don't think it can be both as is
current.  Am I missing something?

A couple of other comments:
* The recent changes moved these startup actions into run level 01
(I use sysvinit) which is way too late for my hardware.  I've always
needed to run it at the earliest point in the boot, normally in
run level 'S' at a very high priority (low index like 05)

* The actual watchdog 'ping' interval in the config file doesn't
seem to match the documentation.  I set it to 2 and I get a ping
frequency of 10Hz (20 changes per second), as opposed to 4Hz which
would be 2 seconds per change.  I'll be investigating this further
and may propose some patches.

Thanks for your time

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

