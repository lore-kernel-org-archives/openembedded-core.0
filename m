Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id D0E1572A78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 20:30:31 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so48628446igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hw4c47bbDBLYjBYYD9rFKFrtqLPYPuMTQXBLpg5lOSA=;
	b=iMKJGdmVO8jSg9D8sVpirBeDzlF3I0SX4UtrhpFWq4go5JuYiWknBfQxJJVZH0KdvF
	7kp0ljf9nhRH/Wt3u1HUGuYGg4sbq8VygGTPWMQLY01syttUYRHlWtcNbtrEyU7q+7J6
	yF4rBrMjEitZswhWuR/iCWHXCJ9LN/AQTcAm5drX/+AghAjZCDm6wklNfk1gFSGNvDSO
	6xREnjfRbsCWd2Uu2v9W/BHWTWmYyU596GbUueffdopNaYtEGGlK5Y+WtrjWnKZ3xedn
	A2o3fgcfhGyP9l2M5PfHCCvoKncrxLSBvetPRflIGyLmNjy2esKJpU98CAdozdZRrpIO
	dlVg==
MIME-Version: 1.0
X-Received: by 10.50.66.172 with SMTP id g12mr2458818igt.78.1442781031514;
	Sun, 20 Sep 2015 13:30:31 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Sun, 20 Sep 2015 13:30:31 -0700 (PDT)
In-Reply-To: <CALbNGRQXjVqur0JbQ_4Kdrmwq+1HkZ3g-pghXdKKKpd6b-P=Vg@mail.gmail.com>
References: <CALbNGRTZJYeAwLJteymkcTt7qjhG+3gq1RGk3HkG7DdXfSmzoA@mail.gmail.com>
	<CALbNGRQXjVqur0JbQ_4Kdrmwq+1HkZ3g-pghXdKKKpd6b-P=Vg@mail.gmail.com>
Date: Sun, 20 Sep 2015 22:30:31 +0200
Message-ID: <CALbNGRSYX_OkkNEXSZy9noKcgS8zEjiJxdABXOYMqbOk_zzKVw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: First run postinst broken
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
X-List-Received-Date: Sun, 20 Sep 2015 20:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2015 at 8:56 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Sep 20, 2015 at 12:30 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi,
>>
>> on images build with current master the postinsts for first run on
>> target are broken. Looking into
>>
>> 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service=
'
>>
>> I would expect
>>
>> '/etc/*-postinsts'
>>
>> in the image created for packets creating
>>
>>  '<package>.postinst returned 1, marking as unpacked only,
>> configuration required on target.'
>>
>> in log.do_rootfs. I grepped around but could not find the place
>> creating the files '/etc/*-postinsts'. Where are these files supposed
>> to be created?
>>
>> Meanwhile I'll start a build with working configuration to find out
>> where they are created...
>>
Sorry for spamming on this but it's important for me and kind of
documentation. So:

For test I commented out

| ConditionPathExistsGlob=3D#SYSCONFDIR#/*-postinsts

from 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.servi=
ce'

And I see a postinstall.log again but the content does not make me happy:

| /usr/sbin/run-postinsts: line 76: opkg: command not found

Yes I forgot to say: I am using opkg - and it seems it did not make
it's way in my image!

This seems to explain that directory /etc/ipk-postinsts is missing
(and forget suspecting systemd -> previous mail).

Just a problem of opkg or are other package-managers missing on image eithe=
r?

Andreas

