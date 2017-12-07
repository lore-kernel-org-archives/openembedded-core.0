Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Dec 2017 16:23:29 UTC
Received: from avasout06.plus.net.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 141B571C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 16:23:29 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id Myq4egMk5Fv8cMyq5el5uv; Thu, 07 Dec 2017 16:15:59 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Ful1xyjq c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=ocR9PWop10UA:10 a=QlkTOqEm1XDtG5P8bEMA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1eMyq3-0003SR-R7
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Dec 2017 16:15:55 +0000
Date: Thu, 7 Dec 2017 16:15:55 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfIXwo6VfE791aU3x0bj8KzDsZQrKxuSm4sXaOUYy8HfivIQqqpgWiWmz3m7PUtT36tcIkUYY8XOtFFlZt1qNhmmdYMvL1AQf6CfWWjd4z/m7Y6Tmz0r0
	w9Gc7EC5EGHMd13x1e11mF3LVf+e98e0GHfChRNuwVQtQndB1a47sYPu
Subject: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Thu, 07 Dec 2017 16:23:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I discovered today that our kernel size check has been ineffective since we
took 7384d2831c713ac5999aca83c312154dc15cec56 from 2014 which changed the
units for KERNEL_IMAGE_MAXSIZE from bytes to kilobytes.

However whilst fixing that, I also noticed that
849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the consequences
of exceeding the size from being fatal to merely a warning.

This second change in behaviour wasn't described in the commit message, so
I'm not sure whether it was intentional. I can believe that when generating
multiple kernel image types it may not be essential that they all fit, but
I don't really know what the use case for the feature is.

I could fix this by adding to kernel.bbclass something like:

 KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?= "warn"

and then using it when delivering the bad news so that recipes can override
it if they wish.

Alternatively, I could treat the error as being fatal if none of the kernel
images fit within the required size. This would degenerate to the old
behaviour automatically if KERNEL_IMAGETYPES contains only one entry.

Does one of these solutions appeal, or is there another even better
solution?

Thanks.

Mike.

