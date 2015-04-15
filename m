Return-Path: <armccurdy@gmail.com>
Received: from mail-vn0-f53.google.com (mail-vn0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id EED48605D2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 21:37:45 +0000 (UTC)
Received: by vnbf129 with SMTP id f129so20443781vnb.9
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4iC9jZ8BC/xQ0aZ7HFjSmERaVBh8dORtxpxJl5aL2RY=;
	b=UdxkmZ5uC4DGQlayVK/20PsQG+/kI8ySEuYdaA08/fbPpLtQhIkja3QPzu9N6k+IwM
	xvTDeCWyt59ezZSMloseU6HRfr/FxbWfuGOuaCvUZEYXbV8aOWGEcFliD8QwTEZwjGao
	TxFaNxUA3bkHxZuZCU2aYdh/kbMfbWGAmO84YJrjmILCh+C3VO7CilZUfoRlLyX6ckeg
	oETnxTs+KLE0FE6uLHfZ0kPX3GpqHo7HwHHyZy4SCHdiOdZFQ4xQGyq6rdPBgOpLaDzg
	x9ocuc0xGGieEEc1igpLRS+U4LaOm9YOTki7RSHE4akbMgDE4AGmCrsrUoUcVZFoMm/B
	Olyg==
MIME-Version: 1.0
X-Received: by 10.182.240.138 with SMTP id wa10mr23042638obc.36.1429133866688; 
	Wed, 15 Apr 2015 14:37:46 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Wed, 15 Apr 2015 14:37:46 -0700 (PDT)
In-Reply-To: <20150415100850.GA2338@jama>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
	<CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
	<20150415100850.GA2338@jama>
Date: Wed, 15 Apr 2015 14:37:46 -0700
Message-ID: <CAJ86T=UwLFJ5LOAg48Z2jM973JyWc68EiEER9tADc+7qQdnDWQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Wed, 15 Apr 2015 21:37:49 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 3:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 14, 2015 at 07:05:35PM -0700, Andre McCurdy wrote:
>> On Tue, Apr 14, 2015 at 4:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Yes, I see it very often since this patch almost 3 years ago:
>> > http://lists.openembedded.org/pipermail/openembedded-core/2012-August/066282.html
>>
>> The problem seems to be that autom4te is getting executed by the host
>> system's perl but loads Dumper.so from OE sysroot. If the host and OE
>> versions of perl are sufficiently different then host perl crashes
>> when it tries to execute OE sysroot Dumper.so
>>
>> Manually hacking the first line of autom4te to replace "/usr/bin/perl"
>> with the full path to the perl-native binary in OE sysroot makes the
>> crashes stop.
>
> Based on RP's reply in the old thread I assume you should rather try to
> hack it to load Dumper.so from system, so that there is no dependency
> between automake-native and perl-native.

Hiding OE sysroot perl when configuring intltool and using only host
perl does also prevent the segfault.

I'm not sure what the correct fix is though. Perhaps have the
autoconf-native scripts run host perl via a wrapper which removes any
reference to OE sysroot perl from the PATH?

>> > On Tue, Apr 14, 2015 at 11:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> >>
>> >> I'm seeing messages such as the following appear in syslog when
>> >> building intltool or intltool-native from fido:
>> >>
>> >>   [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe
>> >> sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]
>> >>   [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe
>> >> sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]
>> >>
>> >> The segfault happens reproducibly when configuring intltool or
>> >> intltool-native (one segfault every time I run or re-run the
>> >> run.do_configure script).
>> >>
>> >> There are no obvious errors in config.log and the intltool build
>> >> succeeds over-all.
>> >>
>> >> If I hack the intltool run.do_configure script so that the host
>> >> machine's perl (v5.18.2) is found instead of perl-native from sysroot
>> >> then the segfaults stop.
>> >>
>> >> Is anyone else seeing the same issue?
>> >>
>> >> Andre
>> >> --

