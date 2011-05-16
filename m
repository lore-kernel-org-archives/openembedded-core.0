Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QLzaK-00076X-Fy
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:19:52 +0200
Received: by gyf1 with SMTP id 1so1668657gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1Uc1+lpwzTmXBctsv7G/q5ypbFxOFyJSLWIlv4RSPhY=;
	b=XOe2mV5Gq0A3FsArJF/dYBvj8/EyBADUBbQ2yAbH+QIDw1mGNW6U9O12Wu9bltzatd
	AZ2EGGMb/McCeJmbRZedkbcyDdlhZw4s1ZESQscGUHrpEzyS00wwtsWk7XyHfAV59S9N
	/zx53CoLA6SWccO8y1BWF/qhHRIwyq43CBJzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=xT/P2nxGd30Wn950rsV6CNZO2VJBRl6NpLTOoqKQkLr375kWpGuoEn5AEvUzxJOe2p
	4/27ertLAI+zdFZP4ybHKl4DHY9XVNLsIparHGDjt8u7G61jqZVfxQU9VdrvfkyMwjDC
	PpnKpo5NK4qlLOBc+18vnwATKweiwpDCwhA0g=
MIME-Version: 1.0
Received: by 10.91.67.7 with SMTP id u7mr3383083agk.103.1305559019662; Mon, 16
	May 2011 08:16:59 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Mon, 16 May 2011 08:16:59 -0700 (PDT)
In-Reply-To: <4DD13F02.4030506@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>
	<BANLkTinVmZDFvLVz9+pf3m9O=CeHRx4ddA@mail.gmail.com>
	<4DCECDC0.7060708@linux.intel.com>
	<BANLkTinQc5CtwEa9VO1-2AQriVA1u8fO=g@mail.gmail.com>
	<4DD13F02.4030506@linux.intel.com>
Date: Mon, 16 May 2011 11:16:59 -0400
Message-ID: <BANLkTinY46oeAVnzWinEjDHL_=+3uRYb7Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 May 2011 15:19:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 11:13 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
> On 05/14/2011 07:48 PM, Bruce Ashfield wrote:
>> On Sat, May 14, 2011 at 2:45 PM, Darren Hart <dvhart@linux.intel.com> wr=
ote:
>>>
>>>
>>> On 05/13/2011 10:43 PM, Bruce Ashfield wrote:
>>>> On Fri, May 13, 2011 at 7:38 PM, Darren Hart <dvhart@linux.intel.com> =
wrote:
>>>>> Perform a quick sanity check to be able to direct users to configure
>>>>> git.sendemail if they haven't yet.
>>>>>
>>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>>> ---
>>>>> =A0scripts/send-pull-request | =A0 15 +++++++++++++++
>>>>> =A01 files changed, 15 insertions(+), 0 deletions(-)
>>>>>
>>>>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>>>>> index f94596f..2ccb8e8 100755
>>>>> --- a/scripts/send-pull-request
>>>>> +++ b/scripts/send-pull-request
>>>>> @@ -38,6 +38,18 @@ harvest_recipients()
>>>>> =A0 =A0 =A0 =A0unset IFS
>>>>> =A0}
>>>>>
>>>>> +check_git_sendemail_config()
>>>>> +{
>>>>> + =A0 =A0 =A0 GIT_SMTP=3D$(git config sendemail.smtpserver)
>>>>> + =A0 =A0 =A0 GIT_FROM=3D$(git config sendemail.from)
>>>>> + =A0 =A0 =A0 if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "ERROR: git sendemail is not confi=
gured."
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Please read GIT-SEND-EMAIL(1) and=
 configure:"
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.smtpserver"
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo " =A0sendemail.from"
>>>>
>>>> I was going to ask for this to be optional, since I always pass the sm=
tp
>>>> settings on the command line .. but then I realized that I invoke git =
send-email
>>>> directly anyway, so I don't need it to be optional. :)
>>>>
>>>> Regardless, reading this from git config is good idea, so the above is
>>>> only a comment.
>>>
>>> This only impacts the send-pull-request script which requires
>>> git-send-email to be configured in order to work, so it really can't be
>>> an optional thing.
>>
>> I meant making it optional from being in your .gitconfig. I use
>> git send-email with a smtp server almost every day .. and it's
>> not in my .gitconfig :)
>
> Right, duh. OK, so it order to make this optional, we would have to add
> all the necessary options to pass through from the script to
> git-send-email. I'd really rather avoid that.

Exactly. that's why I dropped my idea of asking for it to be optional, you'=
d
need to chain it down, and that's a bad idea.

>
> What is your objection to having a default smtp/from in your git config?
> You can always override it on the command line, and with confirm=3Dalways
> in your git config (you're sane right?) there is little risk of sending
> from the wrong account accidentally.

I just have a zillion boxes, some with different connectivity, so that is
typically left out of my config. The hard error would cause me minimal
pain, but I invoke git send-email by hand, so it's no problem for me in
the long run.

So there's nothing here for you to change, if I needed something, I
could do it locally.

Cheers,

Bruce


>
> --
> Darren
>
>>
>> Bruce
>>
>>>
>>> --
>>> Darren
>>>
>>>>
>>>> Bruce
>>>>
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1
>>>>> + =A0 =A0 =A0 fi
>>>>> +}
>>>>>
>>>>> =A0# Parse and verify arguments
>>>>> =A0while getopts "ahp:t:" OPT; do
>>>>> @@ -67,6 +79,9 @@ while getopts "ahp:t:" OPT; do
>>>>> =A0 =A0 =A0 =A0esac
>>>>> =A0done
>>>>>
>>>>> +# Abort early if git-send-email is not properly configured
>>>>> +check_git_sendemail_config
>>>>> +
>>>>> =A0if [ -z "$PDIR" ]; then
>>>>> =A0 =A0 =A0 =A0echo "ERROR: you must specify a pull-dir."
>>>>> =A0 =A0 =A0 =A0usage
>>>>> --
>>>>> 1.7.1
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> Darren Hart
>>> Intel Open Source Technology Center
>>> Yocto Project - Linux Kernel
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


