Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id A7D7860B65
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 11:50:55 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:33330 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j8N7Y-005FXk-4c
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Mar 2020 06:50:56 -0500
Date: Sun, 1 Mar 2020 06:50:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.21.2003010633290.73263@localhost.localdomain>
Message-ID: <alpine.LFD.2.21.2003010645240.73653@localhost.localdomain>
References: <alpine.LFD.2.21.2003010633290.73263@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: is there ever a compelling reason for "FILESEXTRAPATHS_append := ..."?
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
X-List-Received-Date: Sun, 01 Mar 2020 11:50:57 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2020, Robert P. J. Day wrote:

>
>   occasionally, i run across an existing bbappend file which contains
>
>   FILESEXTRAPATHS_append := ...
>
> and that makes me nervous as i don't see the rationale in *appending*
> to that variable in a bbappend file -- seems to defeat the purpose of
> potentially overriding what's in the original .bb recipe.
>
>   now, sometimes it's obvious that it's broken as i'm currently
> looking at an example:
>
>   FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
>
> which makes no sense at all with the colon at the end. but other than
> something so clearly broken, are there situations to append to
> FILESEXTRAPATHS? that just seems counter-productive, but maybe i'm
> missing something.

  figured i'd scan for examples of that in some of the many layers i
have checked out and found the following:

meta-boundary/recipes-qt/qt4/qt4-embedded_%.bbappend:FILESEXTRAPATHS_append
:= "${THISDIR}/files:"

meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:FILESEXTRAPATHS_append
= ":${COREBASE}/meta/recipes-core/zlib/zlib"

meta-qt5/recipes-qt/qt5/qt5-ptest.inc:FILESEXTRAPATHS_append :=
":${THISDIR}/ptest"

meta-virtualization/recipes-networking/openvswitch/openvswitch_git.bb:FILESEXTRAPATHS_append
:= "${THISDIR}/${PN}-git:"

  note that a couple seem clearly(?) wrong (like that last one), but
i'm open to clarification as to when this is useful. (i think i see
the application in that meta-intel layer example, although should that
use "OEROOT" rather than "COREBASE"?)

rday

