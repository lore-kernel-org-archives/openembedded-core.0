Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE6171B1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB1AOfX1026882; Thu, 1 Dec 2016 10:24:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QN7LiIi8A-K9; Thu,  1 Dec 2016 10:24:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB1AOmKZ026924
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Dec 2016 10:24:51 GMT
Message-ID: <1480587888.28508.265.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2016 10:24:48 +0000
In-Reply-To: <alpine.LFD.2.20.1611300625420.7224@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611300625420.7224@ca624034.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: purpose of variables like "base_bindir_native"?
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
X-List-Received-Date: Thu, 01 Dec 2016 10:25:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-30 at 06:34 -0500, Robert P. J. Day wrote:
>   i'm putting together a tutorial on the structure of the native
> sysroot and how it's built and variables involved, and was poking
> around in both bitbake.conf and native.bbclass, and i'm curious about
> one or two things.
> 
>   i could be totally wrong but it *seems* like there's native-related
> content in bitbake.conf that could be moved over to native.bbclass to
> reduce a little of the clutter. i'm perusing bitbake.conf and it's
> hard to keep track of some of the variables just because there's both
> native- and target- related settings in there. but i'll admit i
> haven't finished my inspection.
> 
>   on a more specific note, in the entire oe-core layer, there are two
> references to the variable "base_bindir_native" (formatted for
> aesthetics):
> 
> $ grep -rw base_bindir_native *
> meta/conf/bitbake.conf:base_bindir_native = "/bin"
> meta/conf/bitbake.conf:PATH_prepend =
>  "${COREBASE}/scripts:i
>  ${STAGING_BINDIR_TOOLCHAIN}:
>  ${STAGING_BINDIR_CROSS}:
>  ${STAGING_DIR_NATIVE}${sbindir_native}:
>  ${STAGING_BINDIR_NATIVE}:
>  ${STAGING_DIR_NATIVE}${base_sbindir_native}:
>  ${STAGING_DIR_NATIVE}${base_bindir_native}:"      <----- there
> 
>   so, given that that variable is set in bitbake.conf, and is only
> referenced in that same file, what's the point of making it a
> variable? doesn't hurt, of course, but when i see a variable, i
> normally assume it's because it might be modified later somewhere,
> but
> i don't see that happening here. is there a reason for it? same thing
> could be said for "base_sbindir_native" as well.
> 
>   thoughts?

Its really for consistency. We don't hardcode the other path
relationships and whilst that one is a minority, we've clearly decided
not to hardcode it either. The fact its not widely used compared to
some of its relatives is not really the point.

If we did hardcode it, I can imagine the question about why it wasn't
parametrised ;-).

Cheers,

Richard

