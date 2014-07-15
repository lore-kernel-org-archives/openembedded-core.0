Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2C889705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:15:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8R008SEEDMOGG0@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 15 Jul 2014 10:15:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BF6D52008D; Tue,
	15 Jul 2014 11:15:22 -0400 (EDT)
Date: Tue, 15 Jul 2014 11:15:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-id: <20140715151522.GT1580@denix.org>
References: <53C3C7E8.2000806@topic.nl> <53C3D5D7.5090309@topic.nl>
MIME-version: 1.0
In-reply-to: <53C3D5D7.5090309@topic.nl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: UBI filesystem creation fails silently with 4k erase size
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
X-List-Received-Date: Tue, 15 Jul 2014 15:15:51 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: 8bit

On Mon, Jul 14, 2014 at 03:06:31PM +0200, Mike Looijmans wrote:
> ﻿On 07/14/2014 02:07 PM, Mike Looijmans wrote:
> >I have a NOR chip that reports a 4k erase size, so in my machine.conf I entered:
> >
> >MKUBIFS_ARGS = "-m 1 -e 3968 -c 7040"
> >UBINIZE_ARGS = "-m 1 -p 4096"
> >UBI_VOLNAME = "qspi-rootfs"
> >
> >
> >When I create an image with "ubi" in the IMAGE_FSTYPES, the build runs and
> >does not report any error, however it did NOT create the ubi filesystem image.
> >
> >If I change the parameters for a 64k flash using:
> >
> >MKUBIFS_ARGS = "-m 1 -e 65408 -c 440"
> >
> >the ubi filesystem is created (both ubifs and ubi files).
> >
> >
> >Where can I find what went wrong? I'd expect big read error messages telling
> >me that it failed to create an image for my device, but I cannot find such
> >message anywhere.
> >
> >So my questions are:
> >
> >1) Why is there no error message when image creation fails?
> >2) Where is the log/output from the mkfs.ubi commands?
> >2) What could be wrong with my mkubifs parameters?
> >
> 
> The answer to that last question is that UBI itself refuses to work
> with a sector size below 15kB. Which results in UBI now failing to
> work on most NOR chips on the market because the kernel recently
> uses 4k erasing for all serial flash chips that support it.
> 
> So just the question remains why OE doesn't tell me about mkfs.ubifs failure?

Do you have the following fix?

http://cgit.openembedded.org/openembedded-core/commit/?id=f8125a1e9b6893a12355d55d4df584a8d97f0bff

-- 
Denys

