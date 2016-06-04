Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B566771F8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u54DA3Hl009899; Sat, 4 Jun 2016 14:10:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 03S-99wjUmyY; Sat,  4 Jun 2016 14:10:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u54D9x5s009895
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 4 Jun 2016 14:10:01 +0100
Message-ID: <1465045799.13979.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	Alexander Kanevskiy <kad@kad.name>
Date: Sat, 04 Jun 2016 14:09:59 +0100
In-Reply-To: <32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Sat, 04 Jun 2016 13:10:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
> ping 2

It would be helpful if you'd cc'd the person who's patch you were
suggesting we revert. I added Sasha to cc.

I've seen multiple different conflicting patches regarding the image
types code and I've not had a chance to try and figure out what the
real set of problems are and which of the various proposed patches make
things worse or better.

Until someone can explain clearly to me what the problems are and how
we move forward, or I find time to dig into it myself, we're a bit
stuck :/. I just mention this since I expect you're getting frustrated
hearing nothing. This has been flagged in my inbox, I'm just lacking
the time to do everything I'd like :(

Cheers,

Richard

> > Op 30 mei 2016, om 13:28 heeft Koen Kooi <
> > koen@dominion.thruhere.net> het volgende geschreven:
> > 
> > ping
> > 
> > > Op 23 mei 2016, om 19:50 heeft Koen Kooi <koen.kooi@linaro.org>
> > > het volgende geschreven:
> > > 
> > > The commit breaks image_types_uboot.bbclass:
> > > 
> > > ERROR: Logfile of failure stored in:
> > > /build/linaro/build/build/tmp-glibc/work/genericarmv8-oe
> > > -linux/linaro-image-minimal-initramfs/1.0
> > > -r0/temp/log.do_image_cpio.16506
> > > Log data follows:
> > > > DEBUG: Executing python function set_image_size
> > > > DEBUG: Python function set_image_size finished
> > > > DEBUG: Executing shell function do_image_cpio
> > > > 31373 blocks
> > > > Image Name:   linaro-image-minimal-initramfs-g
> > > > Created:      Mon May 23 19:38:56 2016
> > > > Image Type:   ARM Linux RAMDisk Image (gzip compressed)
> > > > Data Size:    7326620 Bytes = 7154.90 kB = 6.99 MB
> > > > Load Address: 00000000
> > > > Entry Point:  00000000
> > > > mkimage: Can't open /build/linaro/build/build/tmp
> > > > -glibc/deploy/images/genericarmv8/linaro-image-minimal
> > > > -initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such
> > > > file or directory
> > > 
> > > This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.
> > > 
> > > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > ---
> > > meta/classes/image.bbclass | 8 ++------
> > > 1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/meta/classes/image.bbclass
> > > b/meta/classes/image.bbclass
> > > index 9f4c83f..df3bd3a 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -410,13 +410,9 @@ python () {
> > >                    # Create input image first.
> > >                    gen_conversion_cmds(type)
> > >                    localdata.setVar('type', type)
> > > -                    cmd = "\t" +
> > > localdata.getVar("COMPRESS_CMD_" + ctype, True)
> > > -                    if cmd not in cmds:
> > > -                        cmds.append(cmd)
> > > +                    cmds.append("\t" +
> > > localdata.getVar("COMPRESS_CMD_" + ctype, True))
> > >                    vardeps.add('COMPRESS_CMD_' + ctype)
> > > -                    subimage = type + "." + ctype
> > > -                    if subimage not in subimages:
> > > -                        subimages.append(subimage)
> > > +                    subimages.append(type + "." + ctype)
> > >                    if type not in alltypes:
> > >                       
> > >  rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SU
> > > FFIX}.${type}"))
> > > 
> > > -- 
> > > 2.4.3
> > > 
> > > -- 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > 
> > 
> 

