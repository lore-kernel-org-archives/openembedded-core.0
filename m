Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAAF60616
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 18:56:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r129so7876174wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KPz09eU82Th/8cjCn584Nv2060ajqpMNuTBW3eGpo2k=;
	b=GTpF2z3xPzEja+JblzUdeua4UWbKxpiFH7mbww/5m4svqFWJkoppYQonQtb/w0sTCi
	0eKdIqzof4WSxtQjMKQM++ZS00r9O/qiOj1TriU1sz4H8Y8gSYum2Nz8Nqk+C4Q246PV
	MoBAW0OOm/noeW9ENe01rAg55+NOLcow725ocQuiXSb5xMfS5toWC3OipsUnonGvB1gL
	QPoS83dOV14SGQS/EhtPZ5O5iDZTWCVpdCTPSBZdxvielG7RmJ3jFP42BZ64YX8qWI2j
	g0NrOKGw2jlsITQP8m8XxZWJlciBKX+EklFZGZKbyjuKVks6TL0xspNmsXo4r6ajBGa4
	hgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KPz09eU82Th/8cjCn584Nv2060ajqpMNuTBW3eGpo2k=;
	b=cjqfjcpPt4GgERIhUx6o6jz8FD+//ZIcUXiJEv/D17Qo39W4EMCEKMOQDXZ2bJaGEA
	dkvATFxC7KQ9dEq7WZPZhsqAAGJiNqUFH9BeZF926CGTXCGXV0cW/GzTf/vGeKdzIeNW
	OG52ryVyUop6mqhl01liSC0LKhdgOd8V3F++GeZ0F6aG9o97nKi/Q4gS8QHVSACzaN7G
	BIYgAhmSbT4XNlL3nAm3PA2gdCc9VsHQ26/KkfWVy1918Di4s/kDVmlLEU7pmfzjxuaO
	YbVjmWKZyruD0f0Cr+hEsRVm5+8DWNVx4tOJaJa8M7Zw1jG+c/YZcpzfzcjqdEmGuB07
	h7rA==
X-Gm-Message-State: AG10YORLMSpA2KlkuAvf4dwsPTn8CR2unZReLlaYy0MUQlJusp+AOe3aYEAiM7sbkvYN8HqwxDYKb5qf1jV9Iw==
MIME-Version: 1.0
X-Received: by 10.28.146.8 with SMTP id u8mr4673111wmd.72.1452970617297; Sat,
	16 Jan 2016 10:56:57 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Sat, 16 Jan 2016 10:56:57 -0800 (PST)
In-Reply-To: <1452934910.27999.7.camel@linuxfoundation.org>
References: <1452649638-16393-1-git-send-email-armccurdy@gmail.com>
	<1452934910.27999.7.camel@linuxfoundation.org>
Date: Sat, 16 Jan 2016 10:56:57 -0800
Message-ID: <CAJ86T=WjhqxN1nbMJrAZu6m38H4Y3jSx-n9Hh+M0z=UYZ-hm3w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: clear native sysroot references from CFLAGS_FOR_BUILD etc
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
X-List-Received-Date: Sat, 16 Jan 2016 18:56:57 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 16, 2016 at 1:01 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-01-12 at 17:47 -0800, Andre McCurdy wrote:
>> strace uses CC_FOR_BUILD to compile temporary utility apps to run as
>> part of the build process. There's no need to build those utils
>> against the native sysroot though (and things sometimes go wrong if
>> we
>> do), so clear CFLAGS_FOR_BUILD etc.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>
> I ran this along with the other strace patches under master-next on the
> autobuilder. We saw:

OK, I think I see real issue. Previous patch was OK, but it wasn't the
host gcc calls seen in the log which were failing. The failure is
actually coming from gcc commands being run from within the "mpers.sh"
script, which don't show up directly in the do_compile log. For
example, commands such as:

  x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse --sysroot=/.../build/tmp/sysroots/qemux86-64
-DHAVE_CONFIG_H -I./linux/x86_64 -I../strace-4.11/linux/x86_64
-I./linux -I../strace-4.11/linux -I. -I../strace-4.11 -gdwarf-2 -c
-m32 mpers-m32/kernel_dirent.c -o mpers-m32/kernel_dirent.o

ie the 64bit cross compiler is being used to try to generate 32bit
binaries, which it doesn't support.

Adding multiarch to DISTRO_FEATURES might be a workaround.

I'll dig around a little more to see if there are better solutions.


> https://autobuilder.yoctoproject.org/main/builders/ptest-x86-64/builds/
> 251/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/616/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/616/steps/BuildImages_1/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
> s/615/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
> s/615/steps/BuildImages_1/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/611/steps/BuildImages_4/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
> ds/589/steps/BuildImages_1/logs/stdio
>
> So there is still something not right here. I've not looked into the
> details of the issue.
>
> Cheers,
>
> Richard

