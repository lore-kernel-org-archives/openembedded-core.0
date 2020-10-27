Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by mx.groups.io with SMTP id smtpd.web09.3498.1603831862007430268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 13:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: free.fr, ip: 212.27.42.2, mailfrom: yann.morin.1998@free.fr)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a01:cb19:8b51:cb00:7188:385:c7b6:319])
	(Authenticated sender: yann.morin.1998)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 375172003EF;
	Tue, 27 Oct 2020 21:50:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation); Tue, 27 Oct 2020 21:50:48 +0100
Date: Tue, 27 Oct 2020 21:50:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH] recipes-core/busybox: fixup licensing information
Message-ID: <20201027205048.GH2805@scaer>
References: <20201027164831.3297010-1-yann.morin.1998@free.fr>
 <ee39bffd-e43b-69a6-98e2-b3f4963e346f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ee39bffd-e43b-69a6-98e2-b3f4963e346f@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Khem, All,

Thanks for the feedback; see more questions below...

On 2020-10-27 13:25 -0700, Khem Raj spake thusly:
> On 10/27/20 9:48 AM, Yann E. MORIN wrote:
> >Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
> >changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
> >that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
> >[...] to match the official SPDX identifier.'
> >
> >Though the above is true for the bzip2 and pbzip2 packages, the bzip2
> >code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
> >1.0.6 version.
> >
> >As such, using bzip2-1.0.6 is wrong.
> >
> >Unfortunately, there is no official SPDX license identifier for this
> >bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
> >and bzip2-1.0.6) by using bzip2-1.0.4.
> >
> >Also, there is a license file attached to that, so we add it to the
> >list.
> >
> we also need a text file for this license in meta/files/common-licenses

Should this be the official LICENSE file from the upstream bzip2-1.0.4
version, or should that be the LICENSE file carried by busybox?

Note that the LICENSE file carried by busybox is slightly different than
the upstream one:

  - The bzip2 LICENSE file in busybox has a blurb added at the beginning:
        bzip2 applet in busybox is based on lightly-modified source
        of bzip2 version 1.0.4. bzip2 source is distributed
        under the following conditions (copied verbatim from LICENSE file)
    However this is wrong, because:

  - the bzip2 LICENSE file in busybox dropped the trailing spaces at the
    end of a few lines.

But techincally, this is tecnically the same license.

> perhaps a symlink to bzip2-1.0.6 might be ok.

The bzip2-1.0.4 license is not exactly the same as the 1.0.6. The deltas
are:

  - copyright year
  - author identification (physical address dropped)
  - release version
  - release date

So I don't think a symlink would be appropriate, and a specific file
will be needed.

So, which one should I add: the upstream one, of the busybox one?

Regards,
Yann E. MORIN.

> >Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> >Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>
> >
> >---
> >Respin, as I was not yet subscribed to the list...
> >Sorry for any duplicates...
> >---
> >  meta/recipes-core/busybox/busybox.inc | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> >index 45aaa2b41c..e0522be729 100644
> >--- a/meta/recipes-core/busybox/busybox.inc
> >+++ b/meta/recipes-core/busybox/busybox.inc
> >@@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
> >  DEPENDS += "kern-tools-native virtual/crypt"
> >-# bzip2 applet in busybox is based on lightly-modified bzip2 source
> >+# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
> >  # the GPL is version 2 only
> >-LICENSE = "GPLv2 & bzip2-1.0.6"
> >-LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
> >+LICENSE = "GPLv2 & bzip2-1.0.4"
> >+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
> >+                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
> >  SECTION = "base"
> >
> >
> >
> >
> >

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
