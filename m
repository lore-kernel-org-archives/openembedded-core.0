Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/80CEgsoxwVjxsBJ2Ir8W5idRB0PuWNHo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoHU2-0006Hc-Ak
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 18:06:18 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72G1vCd012461
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 11:01:57 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E381902.6050408@mentor.com>
Date: Tue, 2 Aug 2011 11:01:56 -0500
Message-Id: <12877E24-5764-42AA-B48C-6F90914DC709@kernel.crashing.org>
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
	<1312298395.4325.53.camel@phil-desktop>
	<4E381902.6050408@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 16:06:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 2, 2011, at 10:34 AM, Tom Rini wrote:

> On 08/02/2011 08:19 AM, Phil Blundell wrote:
>> On Tue, 2011-08-02 at 03:14 -0500, Kumar Gala wrote:
>>> +-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
>>> ++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
>> 
>> Have you discussed that with upstream?  If not, are you confident that
>> preferring cpio will not simply mean that we are swapping one deficiency
>> for another?
> 
> A bug was filed with upstream automake.  At issue is that pax does not
> fail gracefully when it cannot create ustar archives while cpio does.
> 
>>> +Index: automake-1.11.1/Makefile.in
>>> +===================================================================
>>> +--- automake-1.11.1.orig/Makefile.in
>>> ++++ automake-1.11.1/Makefile.in
>>> +@@ -44,7 +44,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
>>> + 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
>>> + 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
>>> + 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
>>> +-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
>>> ++	$(top_srcdir)/m4/substnot.m4 \
>>> + 	$(top_srcdir)/configure.ac
>>> + am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
>>> + 	$(ACLOCAL_M4)
>> 
>> Can you explain why this hunk is necessary?
> 
> That I don't recall.  Possibly some sort of re-gen hell I was trying /
> needing to avoid.
> 
>> 
>>> +do_configure () {
>>> +	touch ${S}/Makefile.in
>>> +	autotools_do_configure
>>> +}
>> 
>> ... and this one?
> 
> Didn't do that one.  Kumar? :)

I think I pulled that from the SB3 change you made.

- k


