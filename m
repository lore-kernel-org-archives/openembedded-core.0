Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLj0c-0006yB-1i
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 23:37:54 +0200
Received: by pxi6 with SMTP id 6so3050537pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hMyekFzXKvgVhjz8rBxwj2bgjU0VJid7ipiwC9mHI4M=;
	b=BIK4j4MueJzwmxJVl+y2oy7PBkTxXsuS7W+z9QB5InoUQx2zGh0QKRAH0XLf/vvWq8
	4vHDddGXqOxKHIsmnNBHznXW3mrqP5ZKGHTiMiosG4V/vpu0u0nZZuU9Yeu5DKwPV6T5
	OSDTT4MlP9qSXhKimyaeIbzRCCBQ2fhed5FUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=SUzuFFexhGQPDLmUcCiaGOY2zm0radhJEHE81hJJAaxc+ngKkbC/bal6wLcVfMEQEH
	Fu88TJqc7Moxd3+S0ova2IxiFBnT8vp2rCoZoQRsYDR5J1oOvgNt+STTGKHd2eff0I/g
	PAor/egWpE9CMVsYHfxQeU9/uYCm+HdmfvlQM=
Received: by 10.68.9.196 with SMTP id c4mr6034245pbb.461.1305495301300;
	Sun, 15 May 2011 14:35:01 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 10sm2843567pbo.48.2011.05.15.14.34.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 14:35:00 -0700 (PDT)
Date: Sun, 15 May 2011 14:34:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110515213403.GB24670@sakrah.homelinux.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
	<BANLkTimX6d0r_Jz2VwJO4m7C9-4qL8RvWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTimX6d0r_Jz2VwJO4m7C9-4qL8RvWQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Sun, 15 May 2011 21:37:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/05/11 13:22), Khem Raj wrote:
> On Wed, May 11, 2011 at 2:45 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2011-05-10 at 17:58 +0200, Koen Kooi wrote:
> > +DEPLOY_DIR_append = "-uclibc"
> > +STAGING_DIR_TARGET_append = "-uclibc"
> > +STAGING_DIR_HOST_append = "-uclibc"
> > +SSTATE_MANIFESTS_append = "-uclibc"
> >
> 
> this wont work. Since virtclasses empty out some of these vars e.g. native
> resets STAGING_DIR_HOST but this will still append -uclibc to it since append
> happens at the end

Something like below can serve us better

--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -21,10 +21,10 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 IMAGE_LINGUAS = ""

 DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
-DEPLOY_DIR_append = "-uclibc"
-STAGING_DIR_TARGET_append = "-uclibc"
-STAGING_DIR_HOST_append = "-uclibc"
-SSTATE_MANIFESTS_append = "-uclibc"
+DEPLOY_DIR_append = "${@["-uclibc", ""][oe.utils.inherits(d, 'native', 'nativesdk')]}"
+STAGING_DIR_TARGET_append = "${@["-uclibc", ""][oe.utils.inherits(d, 'native', 'nativesdk')]}"
+STAGING_DIR_HOST_append = "${@["-uclibc", ""][oe.utils.inherits(d, 'native', 'nativesdk')]}"
+SSTATE_MANIFESTS_append = "${@["-uclibc", ""][oe.utils.inherits(d, 'native', 'nativesdk')]}"

 LIBC_DEPENDENCIES = "\
     uclibc \


