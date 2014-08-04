Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F038F65CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:53:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s74Dr7md006809; Mon, 4 Aug 2014 14:53:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eEboPBJN9EMM; Mon,  4 Aug 2014 14:53:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s74Dr4hQ006629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Aug 2014 14:53:05 +0100
Message-ID: <1407160384.6981.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 04 Aug 2014 14:53:04 +0100
In-Reply-To: <alpine.LFD.2.11.1408040933500.8919@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<20140802200959.GA22882@haswell>
	<alpine.LFD.2.11.1408030254520.10897@localhost>
	<14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1408040933500.8919@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Mon, 04 Aug 2014 13:53:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-04 at 09:42 -0400, Robert P. J. Day wrote:
>   oooooh ... that's still kind of weaselly terminology. :-) i'm not
> *trying* to be annoyingly pedantic, but this is just the kind of thing
> that students tend to ask about, which is why i want to nail the
> details.
> 
>   the current docs state that pkg_*rm routines are *not* run during
> image creation, and i'm going to accept that. that means that if a
> pkg_*rm routine *is* written with reference to ${D}, as long as that's
> run on the target, it won't make a difference. so the references to
> ${D} in that context don't *hurt*, they're just unnecessary. and
> potentially confusing, which is why i'm trying to clarify this. (every
> pkg_*rm routine i've seen, *if* it tests the value of ${D}, bailed if
> it was set, which makes sense if they should never, ever be invoked at
> image creation time.)

In the interests of being pedantic since I know you value correctness,
they test $D. If they used ${D}, it would get expanded by bitbake at
build time which is not what you want.

>   WRT stuff run at rootfs postprocessing time, sure, you could always
> run a package removal command, but clarify this for me -- once you're
> into rootfs postprocessing, you're running in a "pseudo" environment
> such that you are *effectively* running inside that rootfs, no? so in
> that case, all filename references would be full names WRT to the root
> filesystem -- no references to ${D}. is that correct? or am i just
> confused?

Pseudo environment means you can perform operations as root, its not a
chroot. You could be in a pseudo chroot of course but our image
generation isn't.

Cheers,

Richard


