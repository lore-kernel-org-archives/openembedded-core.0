Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QoH3g-0005Gx-SD
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:39:05 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QoGzT-00068i-Af from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 08:34:43 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 2 Aug 2011 08:34:43 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 2 Aug 2011 08:34:42 -0700
Message-ID: <4E381902.6050408@mentor.com>
Date: Tue, 2 Aug 2011 08:34:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
	<1312298395.4325.53.camel@phil-desktop>
In-Reply-To: <1312298395.4325.53.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Aug 2011 15:34:43.0049 (UTC)
	FILETIME=[B34BA590:01CC5129]
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
X-List-Received-Date: Tue, 02 Aug 2011 15:39:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/02/2011 08:19 AM, Phil Blundell wrote:
> On Tue, 2011-08-02 at 03:14 -0500, Kumar Gala wrote:
>> +-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
>> ++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
> 
> Have you discussed that with upstream?  If not, are you confident that
> preferring cpio will not simply mean that we are swapping one deficiency
> for another?

A bug was filed with upstream automake.  At issue is that pax does not
fail gracefully when it cannot create ustar archives while cpio does.

>> +Index: automake-1.11.1/Makefile.in
>> +===================================================================
>> +--- automake-1.11.1.orig/Makefile.in
>> ++++ automake-1.11.1/Makefile.in
>> +@@ -44,7 +44,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
>> + 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
>> + 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
>> + 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
>> +-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
>> ++	$(top_srcdir)/m4/substnot.m4 \
>> + 	$(top_srcdir)/configure.ac
>> + am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
>> + 	$(ACLOCAL_M4)
> 
> Can you explain why this hunk is necessary?

That I don't recall.  Possibly some sort of re-gen hell I was trying /
needing to avoid.

> 
>> +do_configure () {
>> +	touch ${S}/Makefile.in
>> +	autotools_do_configure
>> +}
> 
> ... and this one?

Didn't do that one.  Kumar? :)

-- 
Tom Rini
Mentor Graphics Corporation


