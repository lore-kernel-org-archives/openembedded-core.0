Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5036C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 04:43:55 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so2989040lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 20:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=faQk5EM9914oujx4FvwY1AbQVB5qEH+ovg+fneAtxOg=;
	b=OnzdvMpVAQESzdzN8r6IBsmYYIATXnkO1NGnbFaRxhteWB+IMGStGukRXfCYoj5gRL
	gbtBXb7IQBCfPsSRv/v2H5Zq+qDNjLCcyZCXya9vmzKJZbPkssBi1unSDK059DN1+J4v
	QsB7p8E/0vcA9kOPBSd18Aht4O/gQ3H9Wu900bXkWQrzdi/gboSQ3JicfvPzsYirxNQi
	sSQA1/miK0N1d1JP73HMDdn+CWa8PXVh8os2NL4KIEYFsP2FNjMtdPiIRyUPs01mZKJk
	da3XcmSwe/HZ3XQdkR373DTJ82BU5yjW0TL4WoxAg1YVyMGlgYRbDnFeuajz0p0w5QI6
	S+vg==
MIME-Version: 1.0
X-Received: by 10.152.23.137 with SMTP id m9mr21711462laf.17.1384922636533;
	Tue, 19 Nov 2013 20:43:56 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 20:43:56 -0800 (PST)
In-Reply-To: <BD0D1B35-0B17-418A-8119-DF6C169C092F@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<1384900579.16887.28.camel@ted>
	<B5287BC8-6DCA-44B5-84FC-72E6E271A4F0@gmail.com>
	<1384901152.16887.34.camel@ted>
	<BD0D1B35-0B17-418A-8119-DF6C169C092F@gmail.com>
Date: Tue, 19 Nov 2013 23:43:56 -0500
Message-ID: <CADkTA4OSpH=QrXW2RTdB_rx-LgUW6mACxfirBMq+MVssauBsCw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Wed, 20 Nov 2013 04:43:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 9:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Nov 19, 2013, at 2:45 PM, Richard Purdie <richard.purdie@linuxfoundati=
on.org> wrote:
>
>> On Tue, 2013-11-19 at 14:39 -0800, Khem Raj wrote:
>>> On Nov 19, 2013, at 2:36 PM, Richard Purdie <richard.purdie@linuxfounda=
tion.org> wrote:
>>>
>>>> On Tue, 2013-11-19 at 14:29 -0800, Khem Raj wrote:
>>>>
>>>>> Well reproducer case is that build from sstate but such that an exter=
nal module needs to be rebuilt
>>>>> if external module also comes from sstate then it all is fine. Its on=
ly when everything is coming from
>>>>> sstate except this external module which needs to be rebuilt then you=
 see this problem.
>>>>>
>>>>> now, I see the code in module-base.class
>>>>>
>>>>> #
>>>>> # Ensure the hostprogs are available for module compilation. Modules =
that
>>>>> # inherit this recipe and override do_compile() should be sure to cal=
l
>>>>> # do_make_scripts() or ensure the scripts are built independently.
>>>>> #
>>>>> do_make_scripts() {
>>>>>       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>>>>       make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}=
" \
>>>>>                  -C ${STAGING_KERNEL_DIR} scripts
>>>>> }
>>>>>
>>>>> so it expects that, do_make_scripts is explicitly called by external =
module recipes
>>>>>
>>>>> and my recipes did override module_do_compile task but not do_compile=
 like below
>>>>>
>>>>> module_do_compile() {
>>>>>       oe_runmake
>>>>> }
>>>>>
>>>>> so, is comment wrong there should it say module_do_compile instead ?
>>>>>
>>>>> will it work with sstate always ?
>>>>>
>>>>> it will be OK to revert it if thats the case.
>>>>
>>>> Did you inherit module-base or module? I think the wording applies to
>>>> module and not module-base. I think the function used to be in module
>>>> and was moved along with the comment which is now incorrect.
>>>>
>>>
>>> inherit module
>>
>> So in that case there is:
>>
>> addtask make_scripts after do_patch before do_compile
>> do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
>> do_make_scripts[deptask] =3D =93do_populate_sysroot=94
>>
>
> yes I see.
>
>
>> which forces the make_scripts task to run before compile. I don't see
>> how that could therefore fail? :/
>>
>> Do you have a copy of the exact log?
>
> Not anymore, it was sometime ago, the logs are unfortunately recycled.
>
>> I'm wondering if this is another
>> variant of the bitbake dependency bug I just tracked down
>> (http://git.yoctoproject.org/cgit.cgi/poky-contrib/patch/?id=3D7b49d336c=
4672f3dfa78e1c3f1f5c7384264a118)
>>
>
> ah very likely, I think I will try this fix and revert the kernel.bbclass=
 fix locally and see if I still am
> able to reproduce this issue. In any case I think the kernel.bbclass may =
be abandoned since I now think it
> was a wrong fix although it did fix the problem
>

Agreed.

Since you have control over your recipes, you don't have to worry
about some of the more evil ones that build, and inside their own build hea=
d
reference the kernel-staging tree and attempt to build modules. Just gettin=
g
the right inheritance should fix it up.

The other case is a different concern, and even then, including module, and
overriding the do_compile() should work to get the scripts restored and not
just attempt to launch a build.

I'm going to be in Transit tomorrow, so won't be all that responsive, but
my vote is now to simply revert the sstate scripts changes once Khem confir=
ms
that he is ok for his builds.

Cheers,

Bruce

>> Cheers,
>>
>> Richard
>>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

