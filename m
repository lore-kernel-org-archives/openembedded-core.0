Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 19BD36E76D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:30:04 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id u14so639956lbd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=F91V2FsLTk5mOxdglJ/qGk6Vv6e6l9AnN30g6XCj5Sg=;
	b=IrrgW2YSwCa0SXcmdYbFdee0SY/3U3HM8rDQ7qI7f6l5A5zUmHhcMODVO/gnYWQys9
	kzfn/nP5oYOuIQi19gT+MeFFRBDstI+Iu60hMv9s8aL2Agy8w95is/d1hWBnt0jDD8gt
	M8LkZnnS2I4NRgLYfPBX4JA/TlRjyzaUsUozu28z/M+KOrA0JdDc9ub5uP4aYeEcsbKZ
	q2V2Wcx0Hk0oikPy1h/6svFCA9uMmmr2azOvvVnMrXkevsd5w1LrOjmJu/ukYh0VZx+A
	4ZAub4JOlWTXBP4XCmwDoN94WW3vPNL3pjte/jxnj+MLU54fveSR6O9Sbiy3fXFpqknC
	dkeQ==
X-Received: by 10.112.89.42 with SMTP id bl10mr1995728lbb.18.1390415405432;
	Wed, 22 Jan 2014 10:30:05 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	bo10sm8413044lbb.16.2014.01.22.10.30.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 10:30:04 -0800 (PST)
Message-ID: <52E00E23.8090605@gmail.com>
Date: Wed, 22 Jan 2014 19:29:55 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
	<52E00ACA.10502@enea.com>
	<CAP9ODKp2yX_rw0GJEmntuhjwr-zzOYVW3Hk3ZS1Yf7Zy3zr1xQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp2yX_rw0GJEmntuhjwr-zzOYVW3Hk3ZS1Yf7Zy3zr1xQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
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
X-List-Received-Date: Wed, 22 Jan 2014 18:30:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 22 jan 2014 19:24:47, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 4:15 PM, David Nyström <david.nystrom@enea.com> wrote:
>> On 2014-01-22 19:08, Otavio Salvador wrote:
>>>
>>> On Wed, Jan 22, 2014 at 1:48 PM, David Nyström
>>> <david.c.nystrom@gmail.com> wrote:
>>>>
>>>> Some postinstall scripts use the qemuwrapper script, so to be able to
>>>> offline install these packages outside of the bitbake environment, this
>>>> script
>>>> needs to be exposed also in the SDK.
>>>>
>>>> This to enable rootfs generation from a package repository using only a
>>>> package repository and the toolchain tarball.
>>>>
>>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>>
>>>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>>>
>>>
>>> Shouldn't this be a RDEPENDS of the postinst package?
>>>
>>
>> Do you mean a RDEPENDS on the run-postinsts package ?
>> In that case no.
>>
>> When $D is set, postinstalls interpret this as a offline install,
>> some postinstalls call postinstall-intercepts, which in turn use the
>> qemuwrapper script _only_ if $D is set.
>>
>> run-postinsts should be installed if there are postinstalls which failed to
>> run during the offline install.
>>
>> Just to clarify this, the qemuwrapper-cross will only be installed to the
>> target SDK sysroot, never on the target rootfs.
>
> No; in postinstall-intercepts RDEPENDS.
>

Ah, now I get it.
If I do that, will it not end up on the target rootfs ?

Br,
David


