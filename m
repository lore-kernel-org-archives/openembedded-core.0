Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QrWjR-0000ws-IH
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:59:37 +0200
Received: by gwb11 with SMTP id 11so1372603gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=+ZjQtbxs/tChmBvkieyfGyHIEc85VYEN3kA8RJ22fE0=;
	b=C9NfVYg+TxpaVe1jvGqXP2wv581piwQXgcGqXNhrH6DydAtGUFm7hQiYQr+bIQzJj8
	EtLdm90lpYxvowRn65jphl3OFNp7C2N6LH354SkO5LwJZZHxkKvg9wDT2GcJ99I9Jtlt
	AhqdUpJmUX9me6Lnxb+QFmOZE2Q9AvczZ/IHw=
Received: by 10.42.133.7 with SMTP id f7mr9891442ict.161.1313074503322;
	Thu, 11 Aug 2011 07:55:03 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q4sm1560140ibb.15.2011.08.11.07.55.00
	(version=SSLv3 cipher=OTHER); Thu, 11 Aug 2011 07:55:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 07:54:55 -0700
Message-ID: <1333889.inYd0YkeZP@perseus>
Organization: Sakrah Inc.
User-Agent: KMail/4.7.0  (Linux/3.0.0-8-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <4E43887D.6000908@intel.com>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
	<1D98D492-1D74-49DE-A884-C919AFF30BDD@kernel.crashing.org>
	<4E43887D.6000908@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Thu, 11 Aug 2011 14:59:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 11, 2011 03:45:01 PM Yu Ke wrote:
> Ok, CC Richard to see if it is OK to not use 64bithack.patch
> 
> Regards
> Ke
> 
> on 2011-8-11 14:47, Kumar Gala wrote:
> > revert this is not acceptable as that will break ppc64 builds.
> > 
> > I think you need to look at 64bithack.patch and if we really should be
> > using it for multilib builds.

I think it could be conditionally applied only for non multilib builds
but I would be in favour of removing it if not much will break in non
multilib case.

> > 
> > - k
> > 
> > On Aug 11, 2011, at 1:36 AM, Yu Ke wrote:
> >> Hi Kumar,
> >> 
> >> I just found this patch breaks the qemux86-64 lib64 multilib build.
> >> 
> >> the error log is as below:
> >> | mv: cannot stat
> >> | `/home/kyu3/sdb/multilib2/tmp/work/x86_64-pokymllib64-linux/lib64
> >> | -gcc-cross-intermediate-4.6.1+svnr175454-r4/image/home/kyu3/sdb/mu
> >> | ltilib2/tmp/sysroots/x86_64-linux/usr/x86_64-pokymllib64-linux/lib
> >> | 64/*': No such file or directory>> 
> >> NOTE: package lib64-gcc-cross-intermediate-4.6.1+svnr175454-r4: task
> >> do_install: Failed ERROR: Task 1557
> >> (virtual:multilib:lib64:/home/kyu3/src/poky/meta/recipes-devtools/gcc
> >> /gcc-cross-intermediate_4.6.bb, do_install) failed with exit code
> >> 
> >> the error is caused by command in gcc-cross-intermediate.inc:
> >> do_install(): "mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/*
> >> ${D}${target_base_libdir}/"
> >> 
> >> and the reason is that: ${baselib} is lib64 in multilib case, while
> >> the files to be moved is still in
> >> ${D}${exec_prefix}/${TARGET_SYS}/lib/*, so mv will fail.
> >> 
> >> The fix may be either reverting this commit, or putting the file to
> >> ${baselib} instead of lib. I'd like to get your input before going
> >> further.
> >> 
> >> Regards
> >> Ke
> >> 
> >> on 2011-8-5 2:54, Kumar Gala wrote:
> >>> Rather than tweaking MULTILIB_DIRNAMES&   MULTILIB_OSDIRNAMES like
> >>> is
> >>> done for x86-64 via 64bithack.patch.  We can just go with gcc
> >>> defaults
> >>> and utilize ${base_lib} for where to find gcc libs.
> >>> 
> >>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> >>> ---
> >>> 
> >>>   .../gcc/gcc-cross-intermediate.inc                 |    2 +-
> >>>   1 files changed, 1 insertions(+), 1 deletions(-)
> >>> 
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> >>> b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc index
> >>> df5958a..7b1bb38 100644
> >>> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> >>> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> >>> @@ -34,7 +34,7 @@ do_compile () {
> >>> 
> >>>   do_install () {
> >>>   
> >>>   	oe_runmake 'DESTDIR=${D}' install
> >>>   	install -d ${D}${target_base_libdir}/
> >>> 
> >>> -	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/*
> >>> ${D}${target_base_libdir}/
> >>> +	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/*
> >>> ${D}${target_base_libdir}/>>> 
> >>>   	# We don't really need this (here shares/ contains man/,
> >>>   	info/, locale/). rm -rf ${D}${datadir}/
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


