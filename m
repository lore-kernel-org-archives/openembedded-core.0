Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A3C41513
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 13:06:48 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.16417.1720184803198801398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 06:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pfAb9yun;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: jstephan@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-444fe697f61so10167961cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720184802; x=1720789602; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RnhW+XkDQPgrD/SwE5Y6pDxzSNJfEHe2exskLoTw70=;
        b=pfAb9yung8IZb0ZNrZxYDGpKluZRMf10VlsFOLWYmThWJ2HRWdHPPJg56ZYMyGIpFu
         HstsxcJy0TroPBIq+edD/tlCKNuuydli7cYYyy1J5kFi75BG7CVQ0KLG7m0iyr5VTmF9
         65TszY9QvBuzRsGaqGPpKfFPCDEWIJ01aR5egj3DKwS0CczP1d+8rbGcGICrt2D4vvRk
         qZtEbkaaz+v7swO9Jnu7YSPdAtFsJJ7QM9Z0ziahzXfJFqaaQlbi2f+9wqodfoG4dExL
         72tXAjjVy9tCj0sarNe7DJE59jw8fvXxlqkPXpqx6H7Mu1fCjiHNDw1LDygniZ0MUbiP
         MKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720184802; x=1720789602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RnhW+XkDQPgrD/SwE5Y6pDxzSNJfEHe2exskLoTw70=;
        b=nzwCOvoZ6TBvwNc82W8CdYj485sKgTDkcH+kLYhOEwpOsMjhtp/9vyeLyGGEgyrqlk
         WaQ8Xo7wzL4laufbC9ei70UyvkpgrQJE77HnefUCbirWRquima/SRI5IEwKkF0CfELjw
         kWnbg8IvzY7udgwikReg/x/bDpQmOKS5S5zCoPDzFeyrqsnp55cFAEHSiRei3m1umVam
         5uvzTraHBteF2mvwGM63NyDy/C7SJuiYFVr7OPngCbMSbMkq0mckBZ1/smnejnD2/4cJ
         /9IzmqEQnTQneoBIyDIpyovDXuYH1pr9ROyCAtJzKtTwKrtpkfwBzzL0kDmKah3ZVRBO
         xYYQ==
X-Gm-Message-State: AOJu0YwiTs7DhWs4T2Qa6AWDa9+cZKBWu65tXg2hBSYe8xcEhO/70Jfv
	3r8mUU5OKEGaTp3o/LuGQ5H5wxHKjlaoJwN8Kn3Qq2ogwEmtmUWfrXW2zpWFtvDw1InrgxLKCA3
	MBmN4V3xIks/GxHoamqUt0gsm75KbzgyGS7jJmQ==
X-Google-Smtp-Source: AGHT+IFK+ZbPyL67BvGrDPwCz5fBK0pFTTULwuDwdE9LGQY46He9bZRqchzI1ZbFW8A55Gk3Gvq6+c14+0i+dT0wAdY=
X-Received: by 2002:ac8:5a86:0:b0:446:56d7:78b with SMTP id
 d75a77b69052e-447cbf20585mr65017231cf.22.1720184801994; Fri, 05 Jul 2024
 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240705113129.1798725-1-jstephan@baylibre.com> <CAHUKmYbkkPdopJfNyhxtwBGmy9dh0b6myrwosmm5RyBzBqZaLw@mail.gmail.com>
In-Reply-To: <CAHUKmYbkkPdopJfNyhxtwBGmy9dh0b6myrwosmm5RyBzBqZaLw@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 5 Jul 2024 15:06:30 +0200
Message-ID: <CAEHHSvZSGUHXii4EC8DEDwLt+NMXHVNyiLh+1-iYT+nq=Twi1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: fix do_symlink_kernsrc function
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 13:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201606

Le ven. 5 juil. 2024 =C3=A0 13:58, Etienne Cordonnier
<ecordonnier@snap.com> a =C3=A9crit :
>
> Hi Julien,
> did you see my previous patch and the follow-up discussion?
> Ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
> Previous discussion: https://lists.openembedded.org/g/openembedded-core/t=
opic/103308574#msg195238
>
> I think Richard wanted a solution where this errors out:
> > I'm very tempted to say the "using a non default S value" just error
> > out.
> >
> > Whilst I understand how we got to this level of complexity, I think it
> > will just end up causing us pain in the long run and I'd rather just
> > not support it.
> >
> > Cheers,
> > Richard
>
> =C3=89tienne
>

I didn't see it. Let me check this thread :)

Cheers
Julien

> On Fri, Jul 5, 2024 at 1:34=E2=80=AFPM Julien Stephan via lists.openembed=
ded.org <jstephan=3Dbaylibre.com@lists.openembedded.org> wrote:
>>
>> According to the comment in do_symlink_kernsrc, this function exists
>> for compatibility with old style kernel recipes:
>>
>>     # Old style kernels may set ${S} =3D ${WORKDIR}/git for example
>>
>> For such recipes  S will always be different from STAGING_KERNEL_DIR.
>> This is fine for the first build or when unpack is rerun because new
>> sources are in S. However the following command breaks the build:
>>
>>     bitbake -C do_symlink_kernsrc virtual/kernel
>>
>> At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D
>> STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR
>> without removing the folder itself causing us to lose kernel sources.
>> Then we create a symlink from S to STAGING_KERNEL_DIR which results in t=
he
>> following broken symlinks:
>>
>>     ${WORKDIR}/git -> <...>/build/tmp/work-shared/<machine>/kernel-sourc=
e
>>     kernel-source -> <...>/build/tmp/work-shared/<machine>/kernel-source
>>
>> The build fails with the following error:
>>
>>     ERROR: <linux_recipe> do_kernel_checkout: FileExistsError(17, 'File =
exists')
>>     ERROR: Task (<linux_recipe>:do_kernel_checkout)
>>     failed with exit code '1'
>>
>> Attempting to access the kernel-source directory results in:
>>
>>     ls: cannot access 'kernel-source': Too many levels of symbolic links
>>
>> Fix this by checking if S is a symlink, and if so, verifying whether the=
 symlink
>> points to STAGING_KERNEL_DIR to avoid losing sources
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 89badd90f18..e328151cb59 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DI=
R} ${B} ${STAGING_KERNEL_BUILDD
>>  python do_symlink_kernsrc () {
>>      s =3D d.getVar("S")
>>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
>> -    if s !=3D kernsrc:
>> +    if os.path.islink(s):
>> +        _s =3D os.readlink(s)
>> +    else:
>> +        _s =3D s
>> +
>> +    if _s !=3D kernsrc:
>>          bb.utils.mkdirhier(kernsrc)
>>          bb.utils.remove(kernsrc, recurse=3DTrue)
>>          if s[-1] =3D=3D '/':
>> --
>> 2.45.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201601): https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_201601&d=
=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6=
WpFFcYvO-chBh9k0SVobjYMK&s=3DN3u4aN5Ob1LBtzYAPrUgW7w1Yk_vN3KvuImWnp5g6LA&e=
=3D
>> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
lists.openembedded.org_mt_107052142_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&s=3DV=
bM00DcAJR0ZUsuhhPWtLEKKZ5MiBkhgS_Q4Aq3X3KM&e=3D
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__list=
s.openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&s=
=3D7EbQmI1Lz7r_bu1RArY3qabfEim4bh48mxJPm1oN_N4&e=3D  [ecordonnier@snap.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

