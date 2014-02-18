Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4106E8E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:23:30 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so7235017igb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w5VEqLEcyyVr7ZBI9XxrzuupCx9MgmijlT+Tc8odBqM=;
	b=nXhnnRfXhDaix+mgfTvqZhp/9AJWCBEffodg44sMdJsJysmnICaAJ0nmVfkhgbypMM
	Eb0IktE+UDSboYn/Rj9C7cdLCiyZhh6GEN2hhNyk9d8paE7sOV9r2ozXa/039un/7v5X
	MQe4DahPaWneZWqDsTALZauNmjYCmc4o38gjNc0C6wGRoXtXIQdHjKvxpxCe2RjyW6b7
	oSyGF9Z+SV9IKchEJ7pDXKAFNlEQLSOaC4cAvrA1V0nPYIAc5uVLYOpDPRTifviM9+Sr
	QtIvqaOIVlJ2iwOwQGC1CBSeKlExxn3cSOUEsA1SMO0IlCUmr0HT3J/zyMUR+FtUvCFd
	9T6A==
X-Received: by 10.43.153.68 with SMTP id kz4mr21981835icc.29.1392733411031;
	Tue, 18 Feb 2014 06:23:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 06:23:00 -0800 (PST)
In-Reply-To: <1392713280.14081.198.camel@ted>
References: <cover.1392665521.git.raj.khem@gmail.com>
	<af841644dfc682e9774287331ef39c3cd1ede978.1392665521.git.raj.khem@gmail.com>
	<20140218083708.GQ10078@lpalcu-linux> <1392713280.14081.198.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 06:23:00 -0800
Message-ID: <CAMKF1sp-SLxrSWTN8EGAbDBUvNa9EW4RYXp7q+XSeo2Ce2D6Qw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Tue, 18 Feb 2014 14:23:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 12:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-02-18 at 10:37 +0200, Laurentiu Palcu wrote:
>> Hi Khem,
>>
>> On Mon, Feb 17, 2014 at 11:34:15AM -0800, Khem Raj wrote:
>> > We override LDCONFIGDEPEND to be empty string for uclibc
>> > however the current check is for it being None as a result
>> > the function is still executed but ldconfig-native is not
>> > built as dependency for rootfs when building with uclibc
>> >
>> > Fixes errors like below
>> >
>> > File:
>> > '/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
>> > lineno: 191, function: _run_ldconfig
>> >      0187:    def _run_ldconfig(self):
>> >      0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
>> >      0189:            bb.note("Executing: ldconfig -r" +
>> > self.image_rootfs + "-c new -v")
>> >      0190:            self._exec_shell_cmd(['ldconfig', '-r',
>> > self.image_rootfs, '-c',
>> >  *** 0191:                                  'new', '-v'])
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/lib/oe/rootfs.py |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> > index d149ca3..3bcb812 100644
>> > --- a/meta/lib/oe/rootfs.py
>> > +++ b/meta/lib/oe/rootfs.py
>> > @@ -185,7 +185,7 @@ class Rootfs(object):
>> >                          self._handle_intercept_failure(registered_pkgs)
>> >
>> >      def _run_ldconfig(self):
>> > -        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
>> > +        if self.d.getVar('LDCONFIGDEPEND', True) != "":
>> May I suggest:
>>            if (self.d.getVar('LDCONFIGDEPEND', True) or "") != "":
>> here? Otherwise, the condition will be true even if LDCONFIGDEPEND is
>> None.
>
> I think Bernhard's suggestion was the best one here so I've done that.
> To be honest I thought Khem had updated the patch.

I missed this one. needed to test the suggestion but thanks for taking
care of it

>
> Cheers,
>
> Richard
>

