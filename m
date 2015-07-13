Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDC275D53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 16:18:00 +0000 (UTC)
Received: by lbbyj8 with SMTP id yj8so43124965lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=rTIb2/Lf+ZuPYfMv4v3Ovf3R29j1dSQSEXqG7pYx1Ho=;
	b=ugk4lYJCUZMjeCTygKRoqApfG9w0CH2Y3IgfddrLYwz+4zTc86tFsN9uNtuMB2ZXYC
	fowOsQwXSgTTz12zdl/+tDncnCff1uIXsUZxKo966wdb1wtNUll+0qpPeb5N3FYGqIat
	jrhzJHv/RRo2qtUwL8JdCQgKyVztoscATocEz0pSagMZSzJwopsFMX9iX6iU0Te+CBFu
	wDlvifJ0IVYq2uaI6MLn/7poDD3W/L/2UaO/LV9vTZfshlwPrVsVLXHzITWqK8o3BBod
	w7b/zVeRRwfxZBCvrxwZBAKxExngjkq2R+G3M9ttgfIMzx1qIRH1nVT6ojYG5pBRX5Ft
	5o5A==
MIME-Version: 1.0
X-Received: by 10.153.4.40 with SMTP id cb8mr32542371lad.39.1436804279430;
	Mon, 13 Jul 2015 09:17:59 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Mon, 13 Jul 2015 09:17:59 -0700 (PDT)
In-Reply-To: <CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
Date: Mon, 13 Jul 2015 18:17:59 +0200
Message-ID: <CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 13 Jul 2015 16:18:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2015-07-13 17:51 GMT+02:00 Christopher Larson <clarson@kergoth.com>:
>
> On Mon, Jul 13, 2015 at 3:23 AM, Pau Espin Pedrol <pespin.shar@gmail.com>
> wrote:
>>
>> I am not sure which is the behavior with those paths right now and how
>> it should be.
>>
>> I just checked this:
>>
>> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%2=
0Load%20Path
>>
>> So, it seems according to documentation that system services should be
>> installed under /usr/lib/systemd/system, but currently they are
>> installed in /lib/systemd/system in my generated image. Is that a
>> expected behaviour? Shouldn't we try to follow documentation? I see
>> that sometimes /lib/systemd/system path is appended to the dirs in
>> systemdsystemunitpath, but it's not stated in the documentation,
>> that's a bit strange.
>
>
> Depends on the distro. Ubuntu, for example, uses /lib/systemd.
>
>>
>> For user services, /usr/lib/systemd/user is already being used as
>> stated in docs.
>>
>> Now, when multilib comes in, I get lost. If I understand correctly,
>> with multilib enabled we have too /lib64 and /usr/lib64. Are then
>> systemd service files suppoused to be installed in /usr/lib/systemd/
>> or in /usr/lib64/systemd/ ? If I undersood correctly your comment you
>> meant they should still be going into /usr/lib/systemd right?
>
>
> Yes, we don=E2=80=99t want arch-independent files going into arch-specifi=
c dirs.
>
>> Now, talking about bitbake.conf. I see there's already a line with the
>> following:
>> export systemd_unitdir =3D "/lib/systemd"
>>
>> So, apart from your nonarch issue, I think it would also be a good
>> idea to split systemd_unitdir into system and user, as done by
>> provided pc in systemd (src/core/systemd.pc.in):
>> 1- If still want system services to be in /lib and user services to be
>> in /usr/lib:
>> export nonarch_libdir =3D "${prefix}/lib"
>>
>> export systemd_system_unitdir =3D "${nonarch_base_libdir}/systemd/system=
"
>> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"
>> or
>> export systemd_system_unitdir =3D "${nonarch_base_libdir}/systemd"
>> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd"
>>
>>
>> 2- If you want both in /usr/lib:
>> export nonarch_libdir =3D "${prefix}/lib"
>>
>> export systemd_system_unitdir =3D "${nonarch_libdir}/systemd/system"
>> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"
>> or
>> export systemd_system_unitdir =3D "${nonarch_libdir}/systemd"
>> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd"
>
>
> I don=E2=80=99t really see why one would want some of their service files=
 in one
> libdir and the rest in another. Is there a reason to not just obey
> systemd_unitdir in pulseaudio?

Because they are actually a different type of service files (system vs
user) and they are handled in a different way by systemd. For
instance, if you check the list of paths in which systemd looks for
services, you can see that for system services it actually checks
/lib/systemd/system, but it doesn't for user ones
(/usr/lib/systemd/user):


In systemd, src/shared/path-lookup.c:

                /* For the user units we include share/ in the search
                 * path in order to comply with the XDG basedir spec.
                 * For the system stuff we avoid such nonsense. OTOH
                 * we include /lib in the search path for the system
                 * stuff but avoid it for user stuff. */

                if (running_as =3D=3D MANAGER_USER) {
                        if (personal)
                                unit_path =3D user_dirs(generator,
generator_early, generator_late);
                        else
                                unit_path =3D strv_new(
                                        /* If you modify this you also
want to modify
                                         * systemduserunitpath=3D in
systemd.pc.in, and
                                         * the arrays in user_dirs() above!=
 */
                                        STRV_IFNOTNULL(generator_early),
                                        USER_CONFIG_UNIT_PATH,
                                        "/etc/systemd/user",
                                        "/run/systemd/user",
                                        STRV_IFNOTNULL(generator),
                                        "/usr/local/lib/systemd/user",
                                        "/usr/local/share/systemd/user",
                                        USER_DATA_UNIT_PATH,
                                        "/usr/lib/systemd/user",
                                        "/usr/share/systemd/user",
                                        STRV_IFNOTNULL(generator_late),
                                        NULL);
                } else
                        unit_path =3D strv_new(
                                /* If you modify this you also want to modi=
fy
                                 * systemdsystemunitpath=3D in systemd.pc.i=
n! */
                                STRV_IFNOTNULL(generator_early),
                                SYSTEM_CONFIG_UNIT_PATH,
                                "/etc/systemd/system",
                                "/run/systemd/system",
                                STRV_IFNOTNULL(generator),
                                "/usr/local/lib/systemd/system",
                                SYSTEM_DATA_UNIT_PATH,
                                "/usr/lib/systemd/system",
#ifdef HAVE_SPLIT_USR
                                "/lib/systemd/system",
#endif
                                STRV_IFNOTNULL(generator_late),
                                NULL);

And also in systemd, src/core/systemd.pc.in:
systemdsystemunitpath=3D${systemdsystemconfdir}:/etc/systemd/system:/run/sy=
stemd/system:/usr/local/lib/systemd/system:${systemdsystemunitdir}:/usr/lib=
/systemd/system:/lib/systemd/system
systemduserunitpath=3D${systemduserconfdir}:/etc/systemd/user:/run/systemd/=
user:/usr/local/lib/systemd/user:/usr/local/share/systemd/user:${systemduse=
runitdir}:/usr/lib/systemd/user:/usr/share/systemd/user


So, pulseaudio is intended to be used as a systemd user service, not
as a systemd system service, and that means it needs to end up in
/usr/lib/systemd/user and not in /lib/systemd/system/.

All these changes are part of my efforts to improve systemd user
service support in OE, which is kind of bad nowadays imho.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

