Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1625C73FDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 16:29:16 +0000 (UTC)
Received: by widdi4 with SMTP id di4so62782273wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=xAwJnpTHUXpCLPspSSwRH6Pklve4LWH0dvZ97YWXlyc=;
	b=XMjfHx3somVneKg8lLMaH8c31sA9aaqaX1VpPB/osyMZJC5W5w+Cmu2H+052qqgsZ8
	ucm4St3wTLnAdY8sEfiBqLg/dNU3cC/tQDXHUHwxDw6TSD25Ga1BAYLiZp0nfhlhc9MS
	y6LsoFqKXihNme/vHyljxYRMOgmSZKCEUPs3EGM9TQyRgAB0Vvjv6GXFCVORWH2QcDLh
	srU8Dx3I6iwITobV0BOli5WhTquadnx0sDTJ7pDjXAZ6SavMHuh8SOeU9cxF+Wtetd99
	ZsxqBHwlqWzJZkJE8NKksIWkDmVvcVFqWekCoPXg8kKRWkBrnSX9qdZtuvqHWf5072uV
	aojA==
X-Received: by 10.194.184.202 with SMTP id ew10mr42184645wjc.23.1431534557670; 
	Wed, 13 May 2015 09:29:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	a18sm33749915wja.46.2015.05.13.09.29.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 09:29:16 -0700 (PDT)
From: martin.jansa@gmail.com
X-Google-Original-From: Martin.Jansa@gmail.com
Date: Wed, 13 May 2015 18:29:26 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150513162926.GC2411@jama>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
	<20150506153933.GC2067@jama>
	<6547454A-72E1-4FA6-A58D-51FFBFC96CF9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6547454A-72E1-4FA6-A58D-51FFBFC96CF9@gmail.com>
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
X-List-Received-Date: Wed, 13 May 2015 16:29:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 11:37:44PM -0700, Khem Raj wrote:
>=20
> > On May 6, 2015, at 8:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> > On Fri, May 01, 2015 at 07:47:42PM +0200, Martin Jansa wrote:
> >> From: Andre McCurdy <armccurdy@gmail.com>
> >>=20
> >> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
> >> has been renamed to "--enable-llvm-shared-libs".
> >>=20
> >>  http://www.mesa3d.org/relnotes/10.2.html
> >=20
> > Be aware that this correctly enables gallium-llvm, but then
> > gbm_gallium_drm can fail to find LLVM libs:
> >=20
> > ld: cannot find -lLLVMMCJIT
> > | collect2: error: ld returned 1 exit status
> > | make[3]: *** [gbm_gallium_drm.la] Error 1
> >=20
> > at least in some configurations, I'm looking what's the difference in
> > builds I'm seeing failing.
>=20
> is LLVM_CONFIG set to point to valid llvm-config ?

Yes, but the libraries weren't staged by llvm3.3

sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs
-lLLVMTableGen -lLLVMDebugInfo -lLLVMOption -lLLVMX86Disassembler
-lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter
-lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils
-lLLVMIRReader -lLLVMAsmParser -lLLVMMCDisassembler -lLLVMMCParser
-lLLVMInstrumentation -lLLVMArchive -lLLVMBitReader -lLLVMInterpreter
-lLLVMipo -lLLVMVectorize -lLLVMLinker -lLLVMBitWriter -lLLVMMCJIT
-lLLVMJIT -lLLVMCodeGen -lLLVMObjCARCOpts -lLLVMScalarOpts
-lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa -lLLVMAnalysis
-lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMTarget -lLLVMMC
-lLLVMObject -lLLVMCore -lLLVMSupport

Maybe the LLVM_COMPONENTS passed from mesa configure are a bit wider
now:

sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs engine
bitwriter
-lLLVMBitWriter -lLLVMX86Disassembler -lLLVMX86AsmParser
-lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMMCParser
-lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils -lLLVMJIT
-lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMCodeGen -lLLVMObjCARCOpts
-lLLVMScalarOpts -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa
-lLLVMAnalysis -lLLVMTarget -lLLVMMC -lLLVMObject -lLLVMCore
-lLLVMSupport

sysroots/qemux86/usr/bin/crossscripts/llvm-config --libs engine
bitwriter
-lLLVMBitWriter -lLLVMX86Disassembler -lLLVMX86AsmParser
-lLLVMX86CodeGen -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMMCParser
-lLLVMX86Desc -lLLVMX86Info -lLLVMX86AsmPrinter -lLLVMX86Utils -lLLVMJIT
-lLLVMRuntimeDyld -lLLVMExecutionEngine -lLLVMCodeGen -lLLVMObjCARCOpts
-lLLVMScalarOpts -lLLVMInstCombine -lLLVMTransformUtils -lLLVMipa
-lLLVMAnalysis -lLLVMTarget -lLLVMMC -lLLVMObject -lLLVMCore
-lLLVMSupport

sysroots/qemux86/usr/bin/crossscripts/llvm-config --ldflags
-L<myprefix>/sysroots/qemux86/usr/lib/llvm3.3
-lz -lpthread -lrt -ldl -lm

sysroot only has these:
/sysroots/qemux86/usr/lib/libLLVM-3.3.so
/sysroots/qemux86/usr/lib/llvm3.3/libLTO.so
/sysroots/qemux86/usr/lib/llvm3.3/LLVMHello.so
/sysroots/qemux86/usr/lib/llvm3.3/BugpointPasses.so
/sysroots/qemux86/usr/lib/llvm3.3/libprofile_rt.so
/sysroots/qemux86/usr/lib/llvm3.3/libLLVM-3.3.so
/sysroots/qemux86/usr/lib/llvm3.3/
/sysroots/qemux86/usr/lib/

static libs were built:
=2E./../../llvm3.3/3.3-r0/llvm-3.3.build/Release/lib/libLLVMJIT.a
=2E./../../llvm3.3/3.3-r0/image/usr/lib/llvm3.3/libLLVMJIT.a
=2E./../../llvm3.3/3.3-r0/package/usr/lib/llvm3.3/libLLVMJIT.a
but not staged.

I don't see anything obvious in log.do_configure, most suspicious part
is:

llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1990: -O2: command not found
llvm3.3/3.3-r0/llvm-3.3.src/configure: line 1991: -O2: command not found

caused by:
${CFLAGS=3D}
${CXXFLAGS=3D}

in configure script

I'll try to downgrade mesa to see what was different there.

Regards,

