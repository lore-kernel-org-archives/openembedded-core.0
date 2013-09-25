Return-Path: <raj.khem@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 83EA3610D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 22:05:50 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id nd7so233570qeb.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Zn208gi/U/FdacpOkXNxaN5dY+M1suh5A9+35liEu7c=;
	b=GFFnWfAUJfh43zPdI7gL1KbpBJHoc3NnGb065o3QLm8uqhtGx2rkFkKrjE5ptHPIgF
	+AVlAyF/j5HlOpQgggKeE6Y/ZbcSuURnWQWTIRCoeEOxnDLqlXjYyU00OnMHhmMfO3w7
	kGaDO8hc14fWGQcaWEGehACVESJ3B/EBg/Usdxypcr+YqqSQieEwG3Gi4jClp23IQM23
	iGk7IMXogG4fIkUS1ARxJFlcpXB3Yx3A7OwsdfFybCZxLBp0PMQSCGZorICfEKrq/YdL
	A5pDq+hYm03XwlcrINdIrPdtozdI703mF7Eew92q5gtYvDLzRazYSDGBSfgAfIO5tMGZ
	tzyg==
X-Received: by 10.49.30.227 with SMTP id v3mr5184697qeh.92.1380146752233; Wed,
	25 Sep 2013 15:05:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.10.201 with HTTP; Wed, 25 Sep 2013 15:05:22 -0700 (PDT)
In-Reply-To: <1380146430.18603.348.camel@ted>
References: <1380142751.18603.344.camel@ted>
	<CAMKF1srUDexU3NT-g1s9RMZDwhK9WyBMGaJPciAtS=ChROFOXw@mail.gmail.com>
	<1380146430.18603.348.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2013 15:05:22 -0700
Message-ID: <CAMKF1srpeXNeCFVy8uNBtAf6MvHg2EyODhpEdg8Wmr1kr4KCEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Use correct kvm CPU options for qemux86* with kvm
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
X-List-Received-Date: Wed, 25 Sep 2013 22:05:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 25, 2013 at 3:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-25 at 14:34 -0700, Khem Raj wrote:
>> On Wed, Sep 25, 2013 at 1:59 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > The existing -cpu host option caused kernel panics when people attempted to use
>> > the kvm option. After research and discussion, the best options appear to
>> > be the kvm32/kvm64 cpu types so lets use these instead. These resolve
>> > the kernel issues for me.
>> >
>> > [YOCTO #3908]
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > diff --git a/scripts/runqemu b/scripts/runqemu
>> > index efab1a2..12c58d9 100755
>> > --- a/scripts/runqemu
>> > +++ b/scripts/runqemu
>> > @@ -265,7 +265,11 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>> >          exit 1;
>> >      fi
>> >      if [ -w /dev/kvm -a -r /dev/kvm ]; then
>> > -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
>> > +        if [ "x$MACHINE" = "xqemux86" ]; then
>> > +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
>> > +        elif [ "x$MACHINE" = "xqemux86-64" ]; then
>> > +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
>> > +        fi
>>
>> may be leave the original in the else clause at the end so it covers
>> the non x86 cases too
>
> There is no non x86 case for kvm. Its already guarded against by code
> above here which errors if its not one of these two machines...
>

thats fine then
> Cheers,
>
> Richard
>

