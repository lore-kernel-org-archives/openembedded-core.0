Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLEc4-0006mT-8O
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 14:42:48 +0100
Received: by ywf9 with SMTP id 9so6778582ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4D/tQahIlK12W98SQ0brNcWDXpEy0DI3/BFeB8SH5wY=;
	b=aE4OjXryjzE6F6C+I34f8bBC66mOqOKrrxSFWquJvJpQMUf8AvXA4H0QYVBTwcZHmU
	Zw3RXiJR4581eMaGRO6Euncoc5jEvWvqzORpMKjNraBHkoXMMWb7PEOn0Reps9GWsNUp
	s+LyHPbSwgWT253frmq79HPzHLlkZUgXUF3No=
MIME-Version: 1.0
Received: by 10.150.13.8 with SMTP id 8mr619864ybm.33.1320154598271; Tue, 01
	Nov 2011 06:36:38 -0700 (PDT)
Received: by 10.150.196.18 with HTTP; Tue, 1 Nov 2011 06:36:38 -0700 (PDT)
In-Reply-To: <1320100838.8579.0.camel@ted>
References: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
	<1320083026-31637-1-git-send-email-Martin.Jansa@gmail.com>
	<1320100838.8579.0.camel@ted>
Date: Tue, 1 Nov 2011 14:36:38 +0100
Message-ID: <CA+chaQc0zDHUENEkxOqNER5n+E6hvxNM-KgedE31thQBMY+uFA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] dbus: fix for right owner in postinst
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
X-List-Received-Date: Tue, 01 Nov 2011 13:42:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2011 at 11:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-10-31 at 18:43 +0100, Martin Jansa wrote:
>> * even when I see right chown/chmod in log.do_install, files are still
>> =C2=A0 owned by bitbake:bitbake (user running bitbake) and we need to fi=
x it on target
>> $ tail -n 4 temp/log.do_install.27768
>> + chown messagebus:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-l=
inux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus /OE/shr-core/tmp/work/armv7a=
-vfp-neon-o
>> e-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus
>> + chown root:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-g=
nueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
>> + chmod 4754 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus=
-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
>> + ln -sf /dev/null /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueab=
i/dbus-1.4.12-r2/image//lib/systemd/system/dbus-1.service
>>
>> $ ll -d /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.=
12-r2/image/var/run/dbus \
>> =C2=A0 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.1=
2-r2/image/var/lib/dbus \
>> =C2=A0 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.1=
2-r2/image/usr/libexec/dbus-daemon-launch-helper \
>> =C2=A0/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12=
-r2/image/usr/libexec/dbus-daemon-launch-helper
>> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/a=
rmv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemo=
n-launch-he
>> lper*
>> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/a=
rmv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemo=
n-launch-he
>> lper*
>> drwxr-xr-x 2 bitbake bitbake =C2=A0 4096 Oct 29 12:35 /OE/shr-core/tmp/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus/
>> drwxr-xr-x 2 bitbake bitbake =C2=A0 4096 Oct 29 12:35 /OE/shr-core/tmp/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus/
>>
>> * and we _cannot_ use ${D} in postinst script because it get's expanded
>> =C2=A0 before including postinst file to ipk's control.tar.gz
>> =C2=A0 and on target I see something like this:
>> =C2=A0 if [ -z "/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/d=
bus-1.4.12-r2/image" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>> =C2=A0 which is wrong $D without {} works
>>
>> * V2: updated with Otavio version to fix it also for do_rootfs
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> =C2=A0meta/recipes-core/dbus/dbus.inc | =C2=A0 12 +++++-------
>> =C2=A01 files changed, 5 insertions(+), 7 deletions(-)
>
> This is just wallpapering over the cracks I'm afraid. There is something
> more fundamental going wrong here and we need to track it down...

Is pseudo really supposed to allow chown in do_install()? And then ie
keep changed owners in sysroot or even sstate to recreate packages
later with right file owners?

Because normally all produced files are owned by UID who is building
them (in my example bitbake) and only when creating packages/rootfs
it's packaged with expected UID for target (ie root).

So this wallpapering makes current dbus at least usable on target.

Cheers,


