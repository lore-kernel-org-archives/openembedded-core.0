Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 989DE6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:18:32 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so13761429wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Ip0ZroKQGyFsxKCMZq2cJJ/sjVfAwm6EYBvAZ+U9UQg=;
	b=HZ58jzicKcObPKAxnBRR6qs5of03GtUcc4yvwu+ZiabcnW+ToEqqsCwIxrgn7okW3w
	22p0aYpK6QHYwdeMa+K4AkDpwfVOFePOfksZcsHBFszWjR/ihm5iXk/jkugJfjUHRg85
	922wCy3tgzrJJoveXLoJZ4fK15jwhpUCJVrUAbWMsnMDFjwCpd7yJzpZDJhooaNOPO9l
	vsi4VW7Oa51MvSFJEOiOmIAYm+/nKcJzm/rpecu+txDv3cMo+8oKj5y21RyvQ4zqkVHH
	JoiH+I9LQaWjjKWzC7iCDxZIcwvTsmgUs2V+uJNYSU/HbBMuo4GuWBHo9OG6Q5dF72qD
	RfzQ==
X-Received: by 10.194.83.39 with SMTP id n7mr7324387wjy.65.1431605912994;
	Thu, 14 May 2015 05:18:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ex2sm37913373wjd.28.2015.05.14.05.18.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 May 2015 05:18:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 May 2015 14:18:46 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150514121846.GB2402@jama>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
	<20150506153933.GC2067@jama>
	<6547454A-72E1-4FA6-A58D-51FFBFC96CF9@gmail.com>
	<20150513162926.GC2411@jama>
MIME-Version: 1.0
In-Reply-To: <20150513162926.GC2411@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Thu, 14 May 2015 12:18:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 06:29:26PM +0200, martin.jansa@gmail.com wrote:
> On Wed, May 06, 2015 at 11:37:44PM -0700, Khem Raj wrote:
> >=20
> > > On May 6, 2015, at 8:39 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > >=20
> > > On Fri, May 01, 2015 at 07:47:42PM +0200, Martin Jansa wrote:
> > >> From: Andre McCurdy <armccurdy@gmail.com>
> > >>=20
> > >> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
> > >> has been renamed to "--enable-llvm-shared-libs".
> > >>=20
> > >>  http://www.mesa3d.org/relnotes/10.2.html
> > >=20
> > > Be aware that this correctly enables gallium-llvm, but then
> > > gbm_gallium_drm can fail to find LLVM libs:
> > >=20
> > > ld: cannot find -lLLVMMCJIT
> > > | collect2: error: ld returned 1 exit status
> > > | make[3]: *** [gbm_gallium_drm.la] Error 1
> > >=20
> > > at least in some configurations, I'm looking what's the difference in
> > > builds I'm seeing failing.
> >=20
> > is LLVM_CONFIG set to point to valid llvm-config ?
>=20
> Yes, but the libraries weren't staged by llvm3.3
>=20
> sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs
> -lLLVMTableGen -lLLVMDebugInfo -lLLVMOption -lLLVMX86Disassembler
> -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter
> -lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils
> -lLLVMIRReader -lLLVMAsmParser -lLLVMMCDisassembler -lLLVMMCParser
> -lLLVMInstrumentation -lLLVMArchive -lLLVMBitReader -lLLVMInterpreter
> -lLLVMipo -lLLVMVectorize -lLLVMLinker -lLLVMBitWriter -lLLVMMCJIT
> -lLLVMJIT -lLLVMCodeGen -lLLVMObjCARCOpts -lLLVMScalarOpts
> -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa -lLLVMAnalysis
> -lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMTarget -lLLVMMC
> -lLLVMObject -lLLVMCore -lLLVMSupport
>=20
> Maybe the LLVM_COMPONENTS passed from mesa configure are a bit wider
> now:
>=20
> sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs engine
> bitwriter
> -lLLVMBitWriter -lLLVMX86Disassembler -lLLVMX86AsmParser
> -lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMMCParser
> -lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils -lLLVMJIT
> -lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMCodeGen -lLLVMObjCARCOpts
> -lLLVMScalarOpts -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa
> -lLLVMAnalysis -lLLVMTarget -lLLVMMC -lLLVMObject -lLLVMCore
> -lLLVMSupport
>=20
> sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs engine
> bitwriter
> -lLLVMBitWriter -lLLVMX86Disassembler -lLLVMX86AsmParser
> -lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMMCParser
> -lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils -lLLVMJIT
> -lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMCodeGen -lLLVMObjCARCOpts
> -lLLVMScalarOpts -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa
> -lLLVMAnalysis -lLLVMTarget -lLLVMMC -lLLVMObject -lLLVMCore
> -lLLVMSupport
>=20
> sysroots/qemux86/usr/bin/crossscripts/llvm-config --ldflags
> -L<myprefix>/sysroots/qemux86/usr/lib/llvm3.3
> -lz -lpthread -lrt -ldl -lm
>=20
> sysroot only has these:
> /sysroots/qemux86/usr/lib/libLLVM-3.3.so
> /sysroots/qemux86/usr/lib/llvm3.3/libLTO.so
> /sysroots/qemux86/usr/lib/llvm3.3/LLVMHello.so
> /sysroots/qemux86/usr/lib/llvm3.3/BugpointPasses.so
> /sysroots/qemux86/usr/lib/llvm3.3/libprofile_rt.so
> /sysroots/qemux86/usr/lib/llvm3.3/libLLVM-3.3.so
> /sysroots/qemux86/usr/lib/llvm3.3/
> /sysroots/qemux86/usr/lib/
>=20
> static libs were built:
> ../../../llvm3.3/3.3-r0/llvm-3.3.build/Release/lib/libLLVMJIT.a
> ../../../llvm3.3/3.3-r0/image/usr/lib/llvm3.3/libLLVMJIT.a
> ../../../llvm3.3/3.3-r0/package/usr/lib/llvm3.3/libLLVMJIT.a
> but not staged.

I'm sorry for false alarm, the last sentence is the key. In webOS builds
we have filter for staging static libraries (to prevent accidental usage
of static library with unwanted license in our components) and of course
I forgot to whitelist these llvm libraries used by mesa.

Once staged in sysroot mesa builds with gallium-llvm again OK, so this
change is good to go.

Thanks

> I don't see anything obvious in log.do_configure, most suspicious part
> is:
>=20
> llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1990: -O2: command not found
> llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1991: -O2: command not found
>=20
> caused by:
> ${CFLAGS=3D}
> ${CXXFLAGS=3D}
>=20
> in configure script
>=20
> I'll try to downgrade mesa to see what was different there.
>=20
> Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

