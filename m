Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0wqM-0003EW-MR for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 16:13:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OF5aQI007617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:05:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06936-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:05:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OF5QIw007611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:05:28 GMT
Message-ID: <1330095927.32006.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 15:05:27 +0000
In-Reply-To: <4F479039.7090708@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329910007-8441-2-git-send-email-obi@opendreambox.org>
	<CFE738D1-7A44-4F57-BB18-818DD5474E01@dominion.thruhere.net>
	<20120224081006.GA2519@sakrah.homelinux.org>
	<4F479039.7090708@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/5] libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 15:13:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-24 at 14:27 +0100, Andreas Oberritter wrote:
> On 24.02.2012 09:10, Khem Raj wrote:
> > On (22/02/12 13:56), Koen Kooi wrote:
> >>
> >> Op 22 feb. 2012, om 12:26 heeft Andreas Oberritter het volgende geschreven:
> >>
> >>> * Drop dependency on GNOME if x11 is disabled.
> >>>
> >>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >>> ---
> >>> meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
> >>> 1 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> >>> index 8e6ef26..861a1aa 100644
> >>> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> >>> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> >>> @@ -6,9 +6,9 @@ LICENSE = "LGPLv2"
> >>> LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> >>>
> >>> SECTION = "x11/gnome/libs"
> >>> -PR = "r1"
> >>> +PR = "r2"
> >>>
> >>> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
> >>> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 ${@base_contains('DISTRO_FEATURES', 'x11', 'libgnome-keyring', '', d)}"
> >>
> >> that one likely needs a --disable-something to be deterministic.
> > 
> > may be --without-gnome or --disable-gnome-keyring ?
> 
> The flag --without-gnome is right. I've updated this patch [1],
> but I'm waiting before resubmitting it, because after Richard's
> comments I'm unsure which distro feature should be tested or
> whether PACKAGECONFIG should be used.

I think the answer is we should have PACKAGECONFIG and something which
gets the defaults for that from distro features. That should actually
simplify the code a little.

I'm also wondering if a good name for the distro feature flag would be
"gnomeapi" ?

Cheers,

Richard



