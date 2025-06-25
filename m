Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC3BC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:54:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15902.1750859679123780804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S55SOMoX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537deebb01so11503785e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750859677; x=1751464477; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rIprK9zJXHhAEYDwdo+kfVMuumMKIAnl5xcV96n93pQ=;
        b=S55SOMoXStFl+eZsLkg4aSkKF2w4JRrcGYo+SJ0Vxnm4/xHV08x+XuM7d540GPrx2T
         mu/lnA5PyMn8n8FKaRPG3QKTolHwnuv0JKqLBMu0smwlFsncoYsOLCyycAUpLzR1hQRq
         qokeTa60jaAMD2pultnfiol9ybJCASCaj2jA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859677; x=1751464477;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIprK9zJXHhAEYDwdo+kfVMuumMKIAnl5xcV96n93pQ=;
        b=IhxAEzuWjBZqYfvJUo1Fd/ygNwIIuCp8qWudqL3v3EjL2+TqZnRxhMOsHxz2zRyTlF
         M04ds2QS77+fvp+F1WDtCeWmflCae2rNglxBs/2kmLosD1cvF0Sm03Ww/W3y+VWVUeMa
         9zwcY0G09ArCmW1fsMEtJ0Mkw3J4PfL2TcgN1HB0xGvuahXX5YYBV1ImCabZJnRAQ3Iz
         B8WDsxh+kLgCc8p9WfkDY5iqIMLRttWbeuMi3Du4GRTL4CoU8EBHS0bXTvpRo3ko4q6J
         iUzPE58flf1NFxO1jd+g/GrheAWV5PHEFtfv7AUNIPW1oF49jZAgyXWoVQfPnkdQmKlE
         iX6g==
X-Gm-Message-State: AOJu0YyZ1Tfr5G465PC3gxxUN1oJ/YCp/S5Ov34s42RwAI9SJkWmxeMA
	7R24t/FwUbVrwx840g6payocKDgfYl//04wY195MHaH/1+xc4LjdGVtmo/jT16gJ4+U=
X-Gm-Gg: ASbGncv3kbGRMqxzkE5/eu5U4y24oop9HWfzucETIb4fJf86NoUqrdIC8r9fy52qDPk
	lOBrHtNWIEDT8zu6gptCWShzi3Oe/eSNh55YmaSllUTrPs5D1n4DmHcjhMXv27nE8LrfcyQIVpl
	iQy7RtM8UoQq6iUHxWbEBTeSLok3Q0Huoi3tacIWPmca9XEJEf58qEtFNwn1ddpk1lGJS4useVS
	ZYgxqZ/EEbmjkrNBbwwY4gzY5w//B7HMAo2lFGS/jI0atQPYjdlhMqOR0FfKvBxLNYesEUcUm/8
	ozrHo9aNoH5FhM2rPOrzJXNz70FeJyGzRd7VoSS9l2ABkRZK8MLYReT5yAIriFm6lFaNYDl2LPT
	44rIYgnNgTb7JxskhJw/PtjBiaRtSJiShtcHruu2Da+G7gomyBgo=
X-Google-Smtp-Source: AGHT+IHlG+QozV0G3Y5UxiJmgPosWAJ1/k3fNI8R2KVLJVjxXy2S9dClVyG5A6kMGxVWEe9rm3xHGw==
X-Received: by 2002:a05:6000:4406:b0:3a5:1c70:5677 with SMTP id ffacd0b85a97d-3a6ed61a962mr1806484f8f.7.1750859677343;
        Wed, 25 Jun 2025 06:54:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514? ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c0812sm20597455e9.34.2025.06.25.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:54:36 -0700 (PDT)
Message-ID: <5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>, "Richard Purdie via
 lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2025 14:54:36 +0100
In-Reply-To: <87ikkuzuf6.fsf@prevas.dk>
References: <20250606093905.2715221-1-ravi@prevas.dk>
		<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
	 <87ikkuzuf6.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219322

On Tue, 2025-06-17 at 09:41 +0200, Rasmus Villemoes wrote:
> On Sun, Jun 15 2025, "Richard Purdie via lists.openembedded.org" <richard=
.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> > On Fri, 2025-06-06 at 11:39 +0200, Rasmus Villemoes wrote:
> > > From: Rasmus Villemoes <ravi@prevas.dk>
> > >=20
> > > Currently, files and directories created under ${SSTATE_DIR} when
> > > fetching from an sstate mirror are not created with group write,
> > > unlike when the sstate artifacts are generated locally. That's
> > > inconsistent, and problematic when the local sstate dir is shared
> > > among multiple users.
> > >=20
> > > Wrap the fetching in a bb.utils.umask() context manager, and for simp=
licity
> > > move the mkdir of SSTATE_DIR inside that.
> > >=20
>=20
> > I appreciate this sounds crazy but this is causing some kind of
> > regression being reported in our automated testing. Specifically,
> > running:
> >=20
> > oe-selftest -r sstatetests.SStateCreation -j 1
> >=20
> > fails for me locally with this applied, as it does here in CI:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1767
> >=20
> > Worryingly, if I run:
> >=20
> > oeselftest -r sstatetests.SStateCreation.test_sstate_creation_distro_sp=
ecific_pass -j 1
> >=20
> > i.e. a specific failing test, that fails even without the patch
> > applied, and it shouldn't so there is something odd going on here even
> > before the patch.
> >=20
> > We're going to have to get to the bottom of this before I can merge the
> > patch.
>=20
> Fair enough.
>=20
> I'm not sure I can help much, but looking at that test code, something
> feels a little fishy:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Now we'll walk the tree to c=
heck the mode and see if things are incorrect.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 badperms =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for root, dirs, files in os.wa=
lk(self.sstate_path):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for di=
rectory in dirs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (os.stat(os.path.join(root, directory)).st_mode & 0o7=
77) !=3D 0o775:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 badperms.append(os.path.join(roo=
t, directory))
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Return to original umask
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.umask(orig_umask)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if should_pass:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.a=
ssertTrue(badperms , msg=3D"Found sstate directories with the wrong permiss=
ions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))
>=20
> So badperms is a list of stuff we've found that has ended up with wrong
> permissions. But AFAICT, we assert that badperms is 'truish',
> i.e. non-empty.
>=20
> Just guessing: Perhaps the reason that passes on CI is exactly because
> it always ends up getting the artifacts from an SSTATE_MIRROR (thus with
> "wrong" permissions in the current state of the sstate mirror fetching),
> while perhaps you don't when you run it locally, and thus you do see the
> failure because your local dirs end up being created with the right 0775
> perms, and badperms ends up empty?
>=20
> While in there, the current_umask() helper seems redundant; just doing
>=20
> =C2=A0 orig_umask =3D os.umask(0o022)
>=20
> would do exactly what one wants.

I finally got to the bottom of the issues. NATIVELSBSTRING handling was
causing weirdness when running the tests which was than masking other
problems. Once I fixed that, I could unravel the problem with badperms,
which was just broken as you mentioned. In the end I cleaned up the
umask handling there using bb.utils.umask and combined some of the test
cases for clarity too. I've sent a couple of patches.

This should mean your patch can now merge as it is correct IMO and the
tests were just broken/breaking.

Cheers,

Richard

