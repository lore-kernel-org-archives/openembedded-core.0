Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2DD74966
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 15:28:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5SFSrVx007917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 28 Jun 2018 16:28:54 +0100
Message-ID: <257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alex Kiernan
	<alex.kiernan@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 16:28:53 +0100
In-Reply-To: <4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git	directory for timestamp
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
X-List-Received-Date: Thu, 28 Jun 2018 15:28:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-06-28 at 15:18 +0000, Peter Kjellerstedt wrote:
> There is no guarantee that ${COREBASE} refers to a path that is
> under Git control. E.g., in our case it refers to a directory that is
> under repo control. "${COREBASE}/meta" is probably a better option.

You could make that argument about /meta too.

I'd suggest the code checks for ${COREBASE}/.git and if that doesn't
exist, fall back to the timestamp of the
${COREBASE}/meta/conf/bitbake.conf file.

Cheers,

Richard

> //Peter
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Alex Kiernan
> > Sent: den 26 juni 2018 14:09
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [OE-Core][PATCH 1/2] image: Set COREBASE as the
> > git
> > directory for timestamp
> > 
> > When REPRODUCIBLE_TIMESTAMP_ROOTFS is unset and we want to parse
> > one
> > from git, use COREBASE as the base for the git command so we have a
> > known repository which we're using. Without this the build may fail
> > if the current directory is not part of a git repository.
> > 
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > 
> >  meta/classes/image.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/image.bbclass
> > b/meta/classes/image.bbclass
> > index 8ef06c0..2e88024 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -651,7 +651,7 @@ POPULATE_SDK_PRE_TARGET_COMMAND +=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'usr
> >  reproducible_final_image_task () {
> >      if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> >          if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --
> > pretty=%ct`
> > +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}"
> > log -1
> > --pretty=%ct`
> >          fi
> >          # Set mtime of all files to a reproducible value
> >          bbnote "reproducible_final_image_task: mtime set to
> > $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

