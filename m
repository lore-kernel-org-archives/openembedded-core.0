Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Mar 2018 09:45:17 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2E84778A4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 09:45:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id smYxe3ZSML0XrsmYye1jhI; Mon, 05 Mar 2018 09:37:46 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Qf1IQPTv c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=v2DPQv5-lfwA:10 a=h3U9RtFDRoyF_I-UpPgA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1esmYx-0006g2-4N; Mon, 05 Mar 2018 09:37:43 +0000
Date: Mon, 5 Mar 2018 09:37:43 +0000
From: Mike Crowe <mac@mcrowe.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20180305093743.364numwqdn6ponna@mcrowe.com>
References: <20180303212648.6fnwlntm6je3hw7c@mcrowe.com>
	<a17ddf01-8f48-8c49-47be-3a4752ac7e16@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a17ddf01-8f48-8c49-47be-3a4752ac7e16@windriver.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfL7L4KjBHFQ07KiZl8PXwDqHPPdJsVd4YnptcBcyAyxL9A409N/y1iDRgmxR3DEnXnbH7Z3rbJb+IzOO0U4GYrsKarnEQg/1fZgHUhDnyQl9AV/UXomx
	cSXpukyX/0IgkmR22D0U9tF7Y7D0EMkOcggdQoYxUUIAG/WvyD8oIBO1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: coreutils-native and util-linux-native conflicting with meta-micro
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
X-List-Received-Date: Mon, 05 Mar 2018 09:45:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 05 March 2018 at 16:06:35 +0800, ChenQi wrote:
> On 03/04/2018 05:26 AM, Mike Crowe wrote:
> > I have a recipe which uses both base64 from coreutils-native and hexdump
> > from util-linux-native so I've put both in my recipe DEPENDS.
> > 
> > Unfortunately do_prepare_sysroot is failing with:
> > 
> > Exception: FileExistsError: [Errno 17] File exists: '/home/mac/src/oe2/build-bcm7425/tmp-glibc/sysroots-components/x86_64/coreutils-native/bin/kill' -> '/home/mac/src/oe2/build-bcm7425/tmp-glibc/work/impala-oe-linux-gnueabi/verify-rootfs/1.0-r3/recipe-sysroot-native/bin/kill'
> > 
> > since both coreutils and util-linux provide /bin/kill.
> > 
> > This doesn't cause a problem in a standard oe-core build since coreutils
> > installs all its binaries in ${bindir} whereas util-linux puts kill in
> > ${base_bindir}.
> > 
> > Unfortunately, with meta-micro ${bindir} and ${base_bindir} are the same
> > directory. :(
> > 
> > Both coreutils and util-linux already appear to use the alternatives
> > mechanism for kill, but that doesn't seem to help for -native.
> > 
> > I can easily locally nobble kill in one of the recipes to solve this
> > problem, but that doesn't seem very elegant.
> > 
> > What's the correct way to solve this problem?
> > 
> > Thanks.
> > 
> > Mike.
> 
> I'd suggest you remove conflict items in do_install in case of native. An
> example is in coreutils recipe as below.
> 
> do_install_class-native() {
>     autotools_do_install
>     # remove groups to fix conflict with shadow-native
>     rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>     # The return is a must since native doesn't need the
>     # do_install_append() in the below.
>     return
> }
> 
> You can create a bbappend file in your layer and do similar things.

Yes, I realise that I can fix this in the recipes locally (although perhaps
"nobble" wasn't the best understood word for me to have used.) I was hoping
to find an acceptable way to fix it upstream, or discover that my recipe
could be changed in a way to avoid the problem entirely.

It seems that in the world of systemd, Linux is gradually moving towards a
single bin directory (albeit /usr/bin with symlink from /bin rather than
the /bin used by meta-micro) so this will probably become a problem in
upstream oe-core at that point anyway. Even without that, it could be
considered confusing to have two different implementations of kill
installed in different directories that appear in the path.

Your suggestion may the right one, if we can agree that for native at
least, kill will be provided by one of coreutils and util-linux only. I'm
just not sure which one. Confusingly, on my Debian box, kill appears to
come from procps.

Thanks.

Mike.

