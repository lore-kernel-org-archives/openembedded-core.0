Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QLRQR-0007Lv-Uf
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 04:51:24 +0200
Received: by yxn22 with SMTP id 22so1343532yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2011 19:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=SbQc9lFYonJIb4bsKvgZOY3jZCSBzykSbPJTfmRI/+c=;
	b=Hl31ieln+wvP4yVq/MuRvmn+u9B7fFSMcZ0BKCEqEk7yzDKXdpgqIWEDlQomjZMict
	3vd5HhzU2M39ltKc9mN4vG8aOSKXQO8DI/g1BNNXrIEsQKG/qfOj7nxxiD77dDLVnZZk
	6gjPwU4SzVy86Z7+aMzQtWT29Kp82ncSrg0ks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=N73Z44F/z5PyT/NIy/XnOHf8eLylF7HiVxFDFsWTZjZfvuPDPkuZ4RPYVX0OKyDQr2
	SdorHWwZls1I3S+sihzOGhSH35cmUEBR0L40DYbO2kfuegeQIckviWnPEOeEwWBeuFQ6
	YqamPrhMXV7AkXHV4Wek/On6PYdEbyEm9Yq1k=
MIME-Version: 1.0
Received: by 10.91.47.1 with SMTP id z1mr2497881agj.22.1305427710738; Sat, 14
	May 2011 19:48:30 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Sat, 14 May 2011 19:48:30 -0700 (PDT)
In-Reply-To: <4DCECDC0.7060708@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>
	<BANLkTinVmZDFvLVz9+pf3m9O=CeHRx4ddA@mail.gmail.com>
	<4DCECDC0.7060708@linux.intel.com>
Date: Sat, 14 May 2011 22:48:30 -0400
Message-ID: <BANLkTinQc5CtwEa9VO1-2AQriVA1u8fO=g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 10/10] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Sun, 15 May 2011 02:51:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2011 at 2:45 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 05/13/2011 10:43 PM, Bruce Ashfield wrote:
>> On Fri, May 13, 2011 at 7:38 PM, Darren Hart <dvhart@linux.intel.com> wr=
ote:
>>> Perform a quick sanity check to be able to direct users to configure
>>> git.sendemail if they haven't yet.
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> ---
>>> =A0scripts/send-pull-request | =A0 15 +++++++++++++++
>>> =A01 files changed, 15 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>>> index f94596f..2ccb8e8 100755
>>> --- a/scripts/send-pull-request
>>> +++ b/scripts/send-pull-request
>>> @@ -38,6 +38,18 @@ harvest_recipients()
>>> =A0 =A0 =A0 =A0unset IFS
>>> =A0}
>>>
>>> +check_git_sendemail_config()
>>> +{
>>> + =A0 =A0 =A0 GIT_SMTP=3D$(git config sendemail.smtpserver)
>>> + =A0 =A0 =A0 GIT_FROM=3D$(git config sendemail.from)
>>> + =A0 =A0 =A0 if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "ERROR: git sendemail is not configu=
red."
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Please read GIT-SEND-EMAIL(1) and c=
onfigure:"
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.smtpserver"
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.from"
>>
>> I was going to ask for this to be optional, since I always pass the smtp
>> settings on the command line .. but then I realized that I invoke git se=
nd-email
>> directly anyway, so I don't need it to be optional. :)
>>
>> Regardless, reading this from git config is good idea, so the above is
>> only a comment.
>
> This only impacts the send-pull-request script which requires
> git-send-email to be configured in order to work, so it really can't be
> an optional thing.

I meant making it optional from being in your .gitconfig. I use
git send-email with a smtp server almost every day .. and it's
not in my .gitconfig :)

Bruce

>
> --
> Darren
>
>>
>> Bruce
>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1
>>> + =A0 =A0 =A0 fi
>>> +}
>>>
>>> =A0# Parse and verify arguments
>>> =A0while getopts "ahp:t:" OPT; do
>>> @@ -67,6 +79,9 @@ while getopts "ahp:t:" OPT; do
>>> =A0 =A0 =A0 =A0esac
>>> =A0done
>>>
>>> +# Abort early if git-send-email is not properly configured
>>> +check_git_sendemail_config
>>> +
>>> =A0if [ -z "$PDIR" ]; then
>>> =A0 =A0 =A0 =A0echo "ERROR: you must specify a pull-dir."
>>> =A0 =A0 =A0 =A0usage
>>> --
>>> 1.7.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


