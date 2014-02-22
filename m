Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 822356E7E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 16:22:38 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oy12so16688veb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 08:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=1D1m2IJxN5fPO/kyXy94/gq4mJFuc+CkF4i9oCvyARw=;
	b=A+LcEamr/+gngUuiljvVjIXHFIJDylDfURaeXhSv2EqpWc1UNDlIB0uvlouJSE9Krn
	R7EGpyTlmLhdH3278By9fnJ+7fBh/xVaUKXIMoyXA06EOzemqXTJskMPrKzYz+HhhwYW
	TDli32kAGKZbl5aioiAKEs4FSZHa/LqL4fBjw4YOIlMTqhUHOaxnhVmpk40a5ZLxPkBL
	KxRzdagWxhflCOPVDDDWcNdNHrhTC9z9SXM7G+sv1YfyxDYi8YYP6vvVb5fA7pXSH3+f
	kPVCOx8lHaN6q3xzr3Kf/Irbe8Zn403P7/xXSogYRV53s2PnQ4UcBgyuB5LivJehIopR
	zCSQ==
X-Received: by 10.52.27.9 with SMTP id p9mr6874792vdg.28.1393086159810; Sat,
	22 Feb 2014 08:22:39 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sat, 22 Feb 2014 08:21:59 -0800 (PST)
In-Reply-To: <2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>
References: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
	<42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>
	<2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 22 Feb 2014 16:21:59 +0000
X-Google-Sender-Auth: aE6v-qyYdveA49MMXj4Yc18GGg0
Message-ID: <CANyK_8eVK35HkYfEkV12K03nMqL_wh=O2ZaqK-Uv+uuSaGgZQw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	scott.garman@intel.com
Subject: Re: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Sat, 22 Feb 2014 16:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 February 2014 12:55, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Friday 21 February 2014 21:57:37 Khem Raj wrote:
>> On Feb 20, 2014, at 12:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > There is a problem if a relative path is passed to the kernel for NFS
>> > usage
>> > that it will not correctly find it, so ensure that the ROOTFS path is
>> > absolute.
>> >
>> > [YOCTO #2807]
>> >
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> > ---
>> > scripts/runqemu | 4 +++-
>> > 1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/runqemu b/scripts/runqemu
>> > index 0db7ad6..57c5de4 100755
>> > --- a/scripts/runqemu
>> > +++ b/scripts/runqemu
>> > @@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
>> >
>> >         error "Unable to determine default rootfs for MACHINE [$MACHINE]"
>> >
>> >     fi
>> >
>> > fi
>> > -# ROOTFS is now set for all cases
>> > +# ROOTFS is now set for all cases, now expand it to be an absolute path,
>> > it should exist at this point +
>> > +ROOTFS=`realpath $ROOTFS`
>>
>> I think this change also means we need to add dependency on realpath package
>> as prerequisite for build host.
>
> realpath is part of coreutils. Another alternative would be readlink -f (but
> that also appears to be part of coreutils.)
>

Looks like busybox should provide realpath:
http://www.busybox.net/downloads/BusyBox.html#realpath

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

