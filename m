Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D28EF73172
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5N8ux5l015705; Thu, 23 Jun 2016 09:57:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oLVrHxKmaK7r; Thu, 23 Jun 2016 09:57:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5N8uwM2015696
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2016 09:56:59 +0100
Message-ID: <1466672218.3319.216.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 09:56:58 +0100
In-Reply-To: <576BA114.9020804@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<1466669835.3319.205.camel@linuxfoundation.org>
	<576BA114.9020804@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Thu, 23 Jun 2016 08:57:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-06-23 at 16:43 +0800, Robert Yang wrote:
> On 06/23/2016 04:17 PM, Richard Purdie wrote:
> > On Tue, 2016-05-10 at 01:13 -0700, Robert Yang wrote:
> > Sorry about not responding to this before now. My concerns:
> > 
> > a) The commandline structure is changing and I'm not sure I like
> > the
> > new one or believe its an improvement. This is particularly
> > problematic
> > from a documentation perspective. Is there a way to preserve the
> > existing syntax?
> 
> I did like to preserve the existing command, but the main problem is
> that then we had to hardcode the MACHINE knowledge into the code,
> for example, when we run:
> runqemu qemux86-64 core-image-sato
> 
> The qemux86-64 should be hardcoded into the code, otherwise it
> doesn't know this is a machine arg or typo.

If we use python code, we can ask bitbake if "qemux86-64" is a valid
MACHINE or not?

We could assume that images are in DEPLOY_DIR/MACHINE and at least try
looking to see if such a qemu-boot file exists? We could then error and
simply inform them that there didn't appear to be any data for "qemu86
-64" available. DEPLOY_DIR could come from bitbake -e. 

We could add in functionality to make it take an argument of a path to
the qemu-boot directory so that if the first option looks like a
relative/absolute PATH, try to see if a qemu-boot file exists there. If
it doesn't, it can then fall back to slower ops?

> > c) I don't think qemu-boot should be added be hardcoded into
> > image.bbclass, we need to find a better way to do this.
> 
> Sorry, I don't quite understand this, the code inside image.bbclass
> is:
> 
> +QEMU_BOOT_CLASS = "${@base_conditional('QEMU_BOOT_SUPPORTED', '1',
> 'qemu-boot', 
> '', d)}"
> +inherit ${QEMU_BOOT_CLASS}
> 
> It doesn't look like a hardcode ?

Imagine that qemu.inc does:

IMAGE_CLASSES += "qemu-boot"

You then shouldn't need to change image.bbclass at all, its much
cleaner. I don't like much of the way image.bbclass deals with all its
subclasses at the moment and don't want to make it worse.

Cheers,

Richard

