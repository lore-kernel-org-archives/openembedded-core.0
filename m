Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 04F00706D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 18:57:56 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so857711yks.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 10:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3bibpnsmAVmyBRSd4OlP9we1PHZqylSGeeWnSxfn7d8=;
	b=nSkfHIN8vV8pprEjyHnhjNuP6lK2XRmhyOgSApEspAFBGfbNbZRizwYX/Prj+EhjDt
	+q5EfUKGWDfUcKAyg0VxoydwK9a4x4XHFlrCQMJueAeYFRiXDrbh0WK4LMwyyBiaHf37
	O02N+MWzi2ZNAu/aHKHDu+yqQislm5Ei3Mu5ApiuUqWcrFrv7i4trgLahk9awQlUvg05
	DVDYI1JNdF4CpUpFUE9Sw0l7yZONdltfn9aqTcru36JIbBG/yNGzJpGUelBtYi7XC1Lk
	RA5DA0mnIMGH3wC1ngyb+fGUT3wzvXvjxlXSoON43yZPe47YvD73j+gzhwjjFes4uJoL
	XfPg==
MIME-Version: 1.0
X-Received: by 10.170.154.195 with SMTP id v186mr3870287ykc.22.1420657077063; 
	Wed, 07 Jan 2015 10:57:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 7 Jan 2015 10:57:57 -0800 (PST)
In-Reply-To: <CADkTA4MjiRZWfb4Ly9ydGKL+LpXnWAtGVXW0AVASZ273NDAGpA@mail.gmail.com>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
	<1420651519-25240-2-git-send-email-otavio@ossystems.com.br>
	<CADkTA4MjiRZWfb4Ly9ydGKL+LpXnWAtGVXW0AVASZ273NDAGpA@mail.gmail.com>
Date: Wed, 7 Jan 2015 16:57:57 -0200
X-Google-Sender-Auth: 2N0hpALV83PxR0Brb5TyQufMWyI
Message-ID: <CAP9ODKpfvKO0nNFdrLs-AgcEmRaTWe9_bf3bWFKNFfZPh7K_bg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 07 Jan 2015 18:57:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 7, 2015 at 4:45 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Wed, Jan 7, 2015 at 12:25 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> When the sstate hash changes for do_configure task, the do_configure
>> default implementation triggers the 'clean' to be run. For it to
>> succeed we need to have KERNEL_SRC defined in EXTRA_OEMAKE. Fixes
>> following error:
>
> I wanted to reproduce this locally, since I've never seen the problem
> myself.
>
> What's the best way to trigger the sstate hash change ?
>
> I also have a question below ...

This was triggered when I did a change in the kernel-module-mcc; so
when I changed the recipe it triggered the configure.

>> ,----
>> | DEBUG: Executing shell function do_configure
>> | NOTE: make -e MAKEFLAGS= clean
>> | make -C  M=.../tmp/work/... clean
>> | make[1]: *** M=.../tmp/work/...: No such file or directory.  Stop.
>> | Makefile:20: recipe for target 'clean' failed
>> | make: *** [clean] Error 2
>> | ERROR: oe_runmake failed
>> `----
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/module.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index ad6f7af..5cb8623 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -6,10 +6,11 @@ addtask make_scripts after do_patch before do_compile
>>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>  do_make_scripts[deptask] = "do_populate_sysroot"
>>
>> +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>> +
>
> I'm not seeing very well at the moment and my ability to browse the code
> is restricted, so bear with a potentially stupid question.

No worries.

> It's clear from the error message above why this is needed, but I'm not
> seeing the code that is respecting/using KERNEL_SRC to trigger the
> clean in the right directory. Where exactly is this being used (I know your
> related base.bbclass change will pull in the extra make args, but I'm just
> not seeing the Makefile that respects it).
>
> Basically, I'm trying to decide if it would be better to handle this all in
> the module class, and add a do_configure to the do_compile and
> do_install we already have.
>
> Since I'm not seeing it, others might not as well .. and we can enhance the
> comments to make it clear.

It was triggered from the module Makefile. So it basically runned:

make clean

and it tried to load it from kernel source, which obviously failed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

