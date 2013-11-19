Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 44F936D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:54:03 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id eo20so303470lab.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jL8GSL341z9S+YDzB7D393OaBXsseG+Aa6dPXYIpEaU=;
	b=aHbx+5CWw19Cf1O9C0g2cKeDX027RJ2czeAjvp3YDNGqJEoYawsqSU4o4eJ8BOpQIA
	qFfmeGCnEpW8QTORdP3SKd6zeJo5mDQDr9apglrwU538L0d4yGpM6WBwfTEPGpMKYTZL
	PB6s21DcDlUFMEglM0A4EQyI+50Es+uMrMNW7AdlKowztoZNn/KnsDrDCpJVyAqrHElI
	TAFFupDuKBNwcu51VxtY0U49Y5xQcr5Dwl4xdDbBoKN7g9+vEX7Tu9ljhRjvRSyBTT8b
	2BhjjlMh/8eeDKKAWBOKPya0mrcnKjBGEIDAhXPCYahlvlFk57JObPhK/VrWrZmZ2ybY
	40Xw==
MIME-Version: 1.0
X-Received: by 10.112.13.72 with SMTP id f8mr1729060lbc.40.1384883644462; Tue,
	19 Nov 2013 09:54:04 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 09:54:04 -0800 (PST)
In-Reply-To: <1384883174.23724.116.camel@phil-desktop.brightsign>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
Date: Tue, 19 Nov 2013 12:54:04 -0500
Message-ID: <CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Phil Blundell <pb@pbcl.net>
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
X-List-Received-Date: Tue, 19 Nov 2013 17:54:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 12:46 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-11-19 at 17:37 +0000, Mike Crowe wrote:
>> On Tuesday 08 October 2013 at 17:12:54 -0400, Bruce Ashfield wrote:
>> > When building against the sysroot, out of tree modules can require modpost
>> > and other utilities normally found in the kernel's scripts directory. For
>> > the kernel source in the staging dir, these scripts have been removed to
>> > avoid mixing archiectures when packaging kernel-dev (among other things).
>> >
>> > Rather than further complicate the kernel's install rule, or its packaging,
>> > we can restore the scripts by building them in the kernel staging directory
>> > after the sstate is installed, making them available to packages that need them.
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> > ---
>> >  meta/classes/kernel.bbclass | 11 +++++++++++
>> >  1 file changed, 11 insertions(+)
>> >
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index 4acfb7e..d5fa801 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -292,6 +292,17 @@ kernel_do_install() {
>> >  }
>> >  do_install[prefuncs] += "package_get_auto_pr"
>> >
>> > +
>> > +SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
>> > +kernelscripts_sstate_postinst () {
>> > +   if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
>> > +           (
>> > +             cd ${STAGING_KERNEL_DIR}
>> > +             oe_runmake scripts
>> > +           )
>> > +   fi
>> > +}
>> > +
>> >  sysroot_stage_all_append() {
>> >     sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>> >  }
>>
>> This sstate_postinst fails for me when the compiler isn't already present
>> in the sysroot.
>>
>> Also, I notice that the environment and parameters passed to oe_runmake are
>> not the same as those used by kernel_do_compile etc.
>
> Also note that module.bbclass already does "make scripts" before
> do_compile() so out-of-tree modules should already have access to all
> the files that they need.

Ah, but they didn't. Otherwise we wouldn't have mucked about in the routines.
Khem was building out of the sysroot and the support scripts weren't present,
something which we were able to consistently reproduce.

Perhaps the whole problem was just a misordering of the tasks. I'll take another
look.

But yes, we need one way or the other .. not both. I'd prefer to not fiddle with
sstate, so I'll go back and see why the module.bbclass code wasn't working
for the reported error.

Bruce


>
> If we're going to make a policy decision that the kernel is responsible
> for making scripts then I guess that's fine (modulo the implementation
> problems that Mike describes) but in that case the code in
> module{-base}.bbclass is redundant and ought to be removed.
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

