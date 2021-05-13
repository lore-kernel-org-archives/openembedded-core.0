Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.11390.1620902199644653433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 03:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:38862 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lh8hq-00069w-4b
	for openembedded-core@lists.openembedded.org; Thu, 13 May 2021 06:36:38 -0400
Date: Thu, 13 May 2021 06:36:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: couple questions about creating companion debug filesystem
Message-ID: <a46364f-5fa1-f318-5ada-5aee55134312@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  couple colleagues asked me about the details of how the debug
filesystem is created, and since i wasn't entirely clear on the
mechanics of it myself, i thought i'd dig into it, so a couple
preliminary questions to make sure i'm on the right track.

  trivially, if you want that companion debugfs, you need only:

  IMAGE_GEN_DEBUGFS = '1'

at which point what kicks in is the current value of
IMAGE_FSTYPES_DEBUGFS to determine what forms of the debugfs you want.
by default, that's conditionally set to "tar.gz" in bitbake.conf so,
unless you mess with it, the end result is a debugfs tarball under
deploy/images. so far, so good.

  now, if you (for no good reason) also set:

  IMAGE_FSTYPES_DEBUGFS = ''

in your local.conf, then even though you *claim* you want the debugfs,
you're not going to get one since the build process has no idea what
archive type you want. i believe this is the result of this snippet in
image.bbclass in the anonymous python routine (line 369):

    if d.getVar('IMAGE_GEN_DEBUGFS') == "1":
        debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
        for t in debugfs_fstypes:
            alltypes.append("debugfs_" + t)

which makes sense. however, even if you don't get the final debugfs
tarball under deploy, i see that the *contents* of the debugfs are
still generated under WORKDIR for the image (in my case,
core-image-minimal), since i see both:

  rootfs/
  rootfs-dbg/

and following the trail of bread crumbs to see where that came from, i
ended up in meta/lib/oe/rootfs.py:

    def _setup_dbg_rootfs(self, dirs):
        gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
        if gen_debugfs != '1':
           return

        bb.note("  Renaming the original rootfs...")
        try:
            shutil.rmtree(self.image_rootfs + '-orig')
        except:
            pass
        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')

        ... and so on and so on ...

which clearly(?) does all that work, even if, in the end, the result
is not packaged as a tarball, which is part of what muh colleagues
were asking about -- where can they see *exactly* how that debugfs
content is collected?

  is all this reasonably accurate so far?

rday

