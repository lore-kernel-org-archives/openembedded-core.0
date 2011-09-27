Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1R8LvM-0002uS-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 02:53:28 +0200
Received: by vcbfl17 with SMTP id fl17so3676347vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 17:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cGrJa+gjzQOaF6ELD4PI7i2Dg9iWH0Yf8dqv7NMvfHU=;
	b=ansVLwxapGOPBpNuTN/7pm59vU9XKVWIDTRwbcK7XpjFuFcIxasPU5diqtawy2pg9+
	PPxLs/GJRAUpfYBa2tv9Ormu+9qEJlfwrbws26KCXuWmXcml43xulOOnVfbkwihKIWAg
	6Axz1+C7UMlx7EHRI7x5zF/uKeZLjtNS8G7W4=
Received: by 10.52.22.74 with SMTP id b10mr6890077vdf.90.1317084483043; Mon,
	26 Sep 2011 17:48:03 -0700 (PDT)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.182.138 with HTTP; Mon, 26 Sep 2011 17:47:43 -0700 (PDT)
In-Reply-To: <CAKZ=5EV1JWxf4MaMmHNNkvZDa6OmoLTqThUuteuG7zOxJkFPxA@mail.gmail.com>
References: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
	<4E810D02.6080101@linux.intel.com>
	<CAKZ=5EV1JWxf4MaMmHNNkvZDa6OmoLTqThUuteuG7zOxJkFPxA@mail.gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Tue, 27 Sep 2011 01:47:43 +0100
X-Google-Sender-Auth: -eA9OC1WppPRYjpCKa5QiW7uNlo
Message-ID: <CAKZ=5EUPf9GrTjP=odYcxRYqkONZnqzoDd0kBWn-UdqOO5efFw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 00:53:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 27, 2011 at 12:59 AM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> On Tue, Sep 27, 2011 at 12:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Is there a reason you did not include the group and --disable-password here?
>>
>> I think it would be good to leave thelong name options in also.
>>
>> Sau!
>>
>
> The -U option creates a group with the same name. The
> --disable-password option only exists with adduser and is default with
> useradd -r.
> I'd just like to point out that adduser is originally a perl script
> from debian and reimplemented in busybox. The options it takes are not
> compatible with the more standard useradd from the shadow package.
>
> For some reason, some long options like --system (which is supposed to
> be supported in useradd) did not work during my first
> experimentations, but I will investigate and respin a patch with long
> options if possible.
>
> Also, I discovered that the following recipes still depends on adduser:
> ppp-dialin, avahi, distcc, xserver-nodm-init, pulseaudio, hal, dbus
>
> It would be good to use the useradd class with all of them.
>

In the shadow-sysroot package that we build to be able to use the
useradd class, we apply the add_root_cmd_options.patch to add the
--root option to useradd.

The --root option allows useradd to chroot somewhere so it can modify
/etc/passwd, but at the same time, it disables all the other long
options in the program.

It looks like it is impossible to use long options with the useradd
class. I don't know how straighforward it would be to modify this
patch to get the long options back. But is it worth the pain ?

-- 
Julian


