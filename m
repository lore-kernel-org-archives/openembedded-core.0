Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A4B9F65FDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 10:39:36 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 May 2014 03:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,996,1389772800"; d="scan'208";a="428168743"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.115])
	by azsmga001.ch.intel.com with ESMTP; 06 May 2014 03:39:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 06 May 2014 11:39:33 +0100
Message-ID: <49981877.yZG1zsLocX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <20140506103329.GD12987@gmail.com>
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
	<3296908.lWzdU1Kadh@peggleto-mobl5.ger.corp.intel.com>
	<20140506103329.GD12987@gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Tue, 06 May 2014 10:39:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 May 2014 10:33:29 Paul Barker wrote:
> On Tue, May 06, 2014 at 10:18:41AM +0100, Paul Eggleton wrote:
> > On Tuesday 06 May 2014 10:17:03 Paul Eggleton wrote:
> > > On Tuesday 06 May 2014 07:52:23 Koen Kooi wrote:
> > > > Op 5 mei 2014, om 23:54 heeft Saul Wold <sgw@linux.intel.com> het
> > > > volgende
> > > 
> > > geschreven:
> > > > > On 05/05/2014 04:26 AM, Koen Kooi wrote:
> > > > >> This fixes the following build error:
> > > > >> 	| libarchive/archive_entry.c:59:55: fatal error: 
ext2fs/ext2_fs.h:
> > > > >> 	| No
> > > > >> 	| such file or directory>>
> > > > >> 
> > > > >> There is no configure options to avoid this dependency.
> > > > >> 
> > > > >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > > >> ---
> > > > >> 
> > > > >>  meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
> > > > >>  1 file changed, 2 insertions(+)
> > > > >> 
> > > > >> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > > >> b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb index
> > > > >> eedbaa7..277d8c8 100644
> > > > >> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > > >> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > > >> @@ -5,6 +5,8 @@ SECTION = "devel"
> > > > >> 
> > > > >>  LICENSE = "BSD"
> > > > >>  LIC_FILES_CHKSUM =
> > > > >>  "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
> > > > >> 
> > > > >> +DEPENDS = "e2fsprogs"
> > > > >> +
> > > > > 
> > > > > By doing this we also have to extend e2fprogs to be a nativesdk
> > > > > target.
> > > > > 
> > > > > Is there not a way to make this optional by editing the configure.ac
> > > > > and
> > > > > adding a switch?  What functionality to we gain or loose with /
> > > > > without
> > > > > the ext2fs extensions?
> > > > 
> > > > I really have no idea, I just had the above buildfailure yesterday.
> > > 
> > > FYI this is a bug I was meant to be fixing in the 1.6 cycle (I noticed
> > > the
> > > error in one of my builds a few months ago). Simply adding e2fsprogs to
> > > DEPENDS adds time to the build, plus when I submitted a patch to do this
> > > I
> > > found that nativesdk-e2fsprogs doesn't actually build at the moment and
> > > since it's actually only the header it wants, I had in mind to just use
> > > the
> > > header from e2fsprogs-native. I haven't got around to testing the latter
> > > solution though.
> > 
> > > Anyway, I've now done what I should have done earlier and filed a bug:
> > Oops, sent too early - bug link:
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=6268
> > 
> > Cheers,
> > Paul
> 
> I just had a quick look at this as I've done a bit of work with libarchive.
> It looks like as long as the header isn't found at configure time there's
> no problem at compile time. Could we work around this by modifying config.h
> in a do_configure_append() function to undefine the relevant symbol
> (HAVE_EXT2FS_EXT2_FS_H)?

That's another solution, but then you lose the functionality it needs the 
header to support. While this was an appropriate fix for cmake's internal 
libarchive copy in the native case, I wasn't sure it was appropriate for 
libarchive on the target since we can't be as sure about what people want to 
use it for.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

