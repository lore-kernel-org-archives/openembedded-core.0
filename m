Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5FB36A886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:05:04 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so13758055obb.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 10:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ZAcU7YVLJ8d50gdksu4eQSqO8VQbBgJ/oXRJBpgjEgY=;
	b=O2W/5LGX48ysT1vVb0GZ6GEOxdaArqK2ejg6gJ5J854dwfrRqJ1RjeyVHndrT8O+9K
	jzl5TXpuZWjyrXiCEX1jJ8h8QuXk1PAIJ5QrIjG44Q3y417bapI5//UG+CAQF/19eUy4
	g7+1vHPljB7vcpn9wjJrSIe0Y6xtGaKH7Z4hjbj6YnHVtRLVtAi0Vlychr8xXzq+m79w
	1YYYw8KphqvJJG6v+BUFM2k1qQL3TlWlCKIO8K1UAR0KlRrhJBMW2ZywZa3rKE17i/wR
	yp+j/+2dJKmtkEbSrMycM6rBd/VTyvuW7dIpBvUE7NFw9Pnd5rIxGE08GFaRsNkx3zkx
	aW9Q==
MIME-Version: 1.0
X-Received: by 10.182.28.98 with SMTP id a2mr2194604obh.36.1372266305440; Wed,
	26 Jun 2013 10:05:05 -0700 (PDT)
Received: by 10.76.81.66 with HTTP; Wed, 26 Jun 2013 10:05:05 -0700 (PDT)
In-Reply-To: <20130626133049.GJ16785@lpalcu-linux>
References: <CA+AhUGwXGcp3w=j6d=tb4hn1SfGm1OnF86UGaDvMD6q005CA3w@mail.gmail.com>
	<20130626133049.GJ16785@lpalcu-linux>
Date: Wed, 26 Jun 2013 19:05:05 +0200
Message-ID: <CA+AhUGyTo0i4Qq5gScLXs3c_CAs16xnozi0JkteRiq_qS6R1Qg@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQl7/XkrEEKNVhUlqerrG7OK3ZViHy8tpukaypNnLZk/MhmbwdQaZw8kISeQU3Szq+7HtYVI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with pseudo on 64-bit build host
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
X-List-Received-Date: Wed, 26 Jun 2013 17:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 3:30 PM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> On Wed, Jun 26, 2013 at 11:33:17AM +0200, Erik Bot=F6 wrote:
>> Hi,
>>
>> In bitbake.conf FAKEROOTBASEENV is set to contain
>> "PSEUDO_LIBDIR=3D${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib" but on my
>> buildhost libpseudo.so is in
>> ${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib64.
>>
>> For me this causes rpm:s that use qemu_run_binary() to do stuff during
>> do_rootfs() (using post-install scripts) to fail, since ld.so can't
>> find libpseudo.so it gives an error that contains "ERR" which
>> package_rpm.bbclass rpm_log_check() picks up.
>
> What's the exact error you're seeing? Is it the one listed below?
>
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.

Yes, that's the one.

>
> This error appears if we run qemu inside pseudo. That's why we use
> PSEUDO_UNLOAD=3D1 in front of the qemu command. However, qemu_run_binary(=
)
> already does that...

Yes PSEUDO_UNLOAD=3D1 should do that, but the hosts libpseudo is not
found when invoking qemu. Therefore the code in pseudo that would
clean the environment of any libpseudo.so in LD_PRELOAD before handing
of to qemu is not run and LD_PRELOAD still contains libpseudo.so in
the qemu environment.

A colleague of mine running 64-bit Arch Linux does not seem to hit
this, but I see it on 64-bit Ubuntu 13.04 and an earlier version
(don't recall that machine's exact version right now and don't have
access to it now). This puzzle me a bit.

>
> More info would be helpful.

I hope I clarified a bit.

Cheers,
Erik

>
> Laurentiu
>
>>
>> I git confused for a while since the command used in the post-install
>> script worked ok in a devshell but not during do_rootfs(), but this is
>> due to the fact that LD_LIBRARY_PATH in the devshell contains:
>> <mybuilddir>/tmp/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64 . I
>> couldn't find where this was added to LD_LIBRARY_PATH for devshells
>> though.
>>
>> Cheers,
>> Erik Bot=F6
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

