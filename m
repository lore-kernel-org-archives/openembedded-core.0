Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00E5660424
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 14:10:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s53EARBh026087; Tue, 3 Jun 2014 15:10:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MvrZzNWpBT5M; Tue,  3 Jun 2014 15:10:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s53EANf6026082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 3 Jun 2014 15:10:24 +0100
Message-ID: <1401804615.12440.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Tue, 03 Jun 2014 15:10:15 +0100
In-Reply-To: <538DD39F.1080701@topic.nl>
References: <53843793.3030309@topic.nl>
	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
	<1401318733.2607.71.camel@ted> <538D5C34.4060905@topic.nl>
	<538D5E8C.1090008@topic.nl> <1401785145.12440.51.camel@ted>
	<538DD39F.1080701@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 03 Jun 2014 14:10:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-06-03 at 15:54 +0200, Mike Looijmans wrote:
> ﻿On 06/03/2014 10:45 AM, Richard Purdie wrote:
> > the next steps depend upon how clear the differences are. Basically
> > there should be some degree of commonality between the two builds and at
> > some point there will be divergence. We need to pinpoint the point of
> > divergence. The divergence will be in fpga-image-miami itself or in one
> > of its dependencies.
> 
> ALL stamps for ALL tasks for fpga-image-miami are different. There's a few 
> thousand lines in these files, with very few similarities.

Ok, this gives a very strong pointer then, see below.

> I'll just go for the "do_fetch" task then, since that's about the first to 
> execute.

This is a good move.

> So far, on one project (that is, NOT the fpga-image-miami) the SRC_URI is 
> slightly different. The machines are on various sides of a router/firewall, so 
> SRC_URI="git://${MY_SERVER}/blabla" evaluates differently.
> 
> How can I tell the system that the value of "MY_SERVER" is irrelevant to each 
> and every build step in each and every recipe?

The SRC_URI changing would indeed cause the tasks build separately since
bitbake thinks they're different things.

You have two ways of addressing this. Firstly, you could setup PREMIRROR
entries for these git urls which remaps them to the correct thing in
each case. There would then be one "canonical" url in the recipe and
you'd not need to change the hash generation.

The other way would be to either exclude the variable from the checksum
generation or give it a specific value. This would be something like:

do_fetch[vardepsexclude] += "SRC_URI"

you may also have to do this with other tasks that use SRC_URI such as
do_unpack and do_patch. The other option is:

SRC_URI[vardepvalue] = "git://canonical/url/for/recipe"

which gives it a specific value to use for checksum purposes.

Cheers,

Richard


