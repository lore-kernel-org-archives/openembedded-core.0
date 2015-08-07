Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 86D9076778
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 10:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77AuXOI019691; Fri, 7 Aug 2015 11:56:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dKObodeOl37w; Fri,  7 Aug 2015 11:56:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77AuHQc019660
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 11:56:30 +0100
Message-ID: <1438944976.30467.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 07 Aug 2015 05:56:16 -0500
In-Reply-To: <CAJ86T=VLSdzHw5aCo=eHM=OK+uia9hPxKdf2uRNi6NmVspocaA@mail.gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
	<1438890086-2710-4-git-send-email-armccurdy@gmail.com>
	<1438902142.30467.23.camel@linuxfoundation.org>
	<CAJ86T=VLSdzHw5aCo=eHM=OK+uia9hPxKdf2uRNi6NmVspocaA@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 10:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-06 at 18:14 -0700, Andre McCurdy wrote:
> On Thu, Aug 6, 2015 at 4:02 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2015-08-06 at 12:41 -0700, Andre McCurdy wrote:
> >> If immediate variable expansion is used, then UCLIBC_EXTRA_CFLAGS can
> >> sometimes be derived from a partially expanded value of CFLAGS.
> >>
> >> One specific problem case occurs when security_flags.inc is used: CFLAGS
> >> is evaluated before the SECURITY_CFLAGS_pn-uclibc over-ride has been
> >> applied and therefore UCLIBC_EXTRA_CFLAGS ends up being based on the
> >> default SECURITY_CFLAGS instead of the uclibc specific value.
> >>
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  meta/recipes-core/uclibc/uclibc.inc | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> >> index c483228..3ed8b60 100644
> >> --- a/meta/recipes-core/uclibc/uclibc.inc
> >> +++ b/meta/recipes-core/uclibc/uclibc.inc
> >> @@ -57,8 +57,8 @@ export V="2"
> >>  # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
> >>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
> >>  #
> >> -CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
> >> -UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
> >> +CFLAGS_arm = "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
> >
> > I'm rather surprised we don't get circular references without the :=
> > operator with this. I suspect we can see build failures if you change
> > the code like this. That said, I've been meaning to go through and
> > replace all the uses of oe_filter_out with the remove operator. Can we
> > do that here please instead?
> >
> > E.g:
> > CFLAGS_remove_arm = "-fno-omit-frame-pointer"
> 
> OK, new patch on the way.
> 
> >> +UCLIBC_EXTRA_CFLAGS = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
> 
> Is it OK to keep using oe_filter_out() here to support the regex?

Yes, the regex is obviously trickier with _remove so I think that one is
a fair use of oe_filter_out(). Thanks for the updated patches, just need
to answer Khem's question, it sounds like LDFLAGS may be used somehow
but I've not looked at the code as yet.

Cheers,

Richard


