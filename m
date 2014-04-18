Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7AC65D9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 23:38:45 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id b6so1883018yha.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=xK/K0d5vZopNaGAZf5fnniyGeSescmYOoHN2vbG/fQk=;
	b=lS+mk4I05muXvWV1Zoth0Dg7YgN3KjLfe4N18RvvLTpoDdrSvGjV7/q16f1+4f+6i7
	U/NSnfaVfZEmZ1caVhcddE4gDEVP4UnHe91tiATYlvckxOgUY1r6qNSCt5njJDqXDrUQ
	axD+Id88YXzoFY59Sc//KNc3aP5L9WhbLykeRqnak+urDst3vXQyKwsBOLHDn+Lk7ng7
	aIC2u/JRbscwkv6E1uEyjUsOykmn1ENDXUM544l6pM4duWuf2xydY4n2nlCj6QT5A1+5
	yl/hBJQ027qQ3p3CAl4d3MYwsm8UoDsLVBtgUJdgJoYHGKYHnHkCaJn3ynKr7G28802K
	3f5A==
MIME-Version: 1.0
X-Received: by 10.236.61.45 with SMTP id v33mr33952547yhc.20.1397864326627;
	Fri, 18 Apr 2014 16:38:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 18 Apr 2014 16:38:46 -0700 (PDT)
In-Reply-To: <534DF255.9010506@windriver.com>
References: <1397487085-8924-1-git-send-email-valentin.popa@intel.com>
	<534DF255.9010506@windriver.com>
Date: Fri, 18 Apr 2014 20:38:46 -0300
X-Google-Sender-Auth: 6tOvcOol4myVjBklMg8-kAGare4
Message-ID: <CAP9ODKrJaQTkDeDgcvTBu9=dRLwLJo=d9mVxvOgx+PAw5iSLyw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH_V3] mesa: double check for eglplatform.h
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
X-List-Received-Date: Fri, 18 Apr 2014 23:38:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 12:00 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 04/14/2014 10:51 PM, Valentin Popa wrote:
>>
>> Even if 'egl' is in PACKAGECONFIG, mesa egl support
>> can be disabled explicitly (changing configure flags
>> using a .bbappend, for example).
>> On dora, meta-fsl-arm is an example of this kind.
>> On master there are no known cases, and we should
>> encourge package configuration through PACKAGECONFIG.
>>
>> This patch adds another check for the existence
>> of eglplatform.h before 'sed' can alter it.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>
>
> Reviewed and Tested by: Robert Yang <liezhi.yang@windriver.com>
>
> // Robert
>
>
>> ---
>>   meta/recipes-graphics/mesa/mesa_9.1.6.bb | 4 +++-
>>   meta/recipes-graphics/mesa/mesa_git.bb   | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
>> b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
>> index 6e9cd82..388cfd7 100644
>> --- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
>> +++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
>> @@ -19,6 +19,8 @@ S = "${WORKDIR}/Mesa-${PV}"
>>   #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>>   do_install_append() {
>>       if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
>> then
>> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
>> ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
>> ${D}${includedir}/EGL/eglplatform.h
>> +        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
>> +            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
>> ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
>> ${D}${includedir}/EGL/eglplatform.h
>> +        fi
>>       fi
>>   }
>> \ No newline at end of file
>> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
>> b/meta/recipes-graphics/mesa/mesa_git.bb
>> index 1babcc0..714911f 100644
>> --- a/meta/recipes-graphics/mesa/mesa_git.bb
>> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
>> @@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
>>   #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>>   do_install_append() {
>>       if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
>> then
>> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
>> ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
>> ${D}${includedir}/EGL/eglplatform.h
>> +        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
>> +            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
>> ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
>> ${D}${includedir}/EGL/eglplatform.h
>> +        fi
>>       fi
>>   }
>>

So WHAT is holding a bugfix for a regression to be merged? I am very
disappointed with the maintenance in the Dora branch.

1. a change has been added without testing other layers hosted in YP.
2. it has been merged without being ran in YP AB.
3. I reported the issue in the same day it has been merged
4. it has been 10 days and this has not yet been reverted/fixed.

So CAN THIS BE MERGED PLEASE?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

