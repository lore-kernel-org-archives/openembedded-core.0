Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73515C369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 15:48:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.51807.1745855279893435061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 08:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CmiGgFsH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so5360276f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745855278; x=1746460078; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OudYMQEOTS2zbPWCVv1I7ZI4xVlWY4W6msKtpHU3pV4=;
        b=CmiGgFsHBd/FiCCdhnM85JLX9PK16qRgl9KLAkE5C+CuuNnDzpnEyQiNnc8UPt+Brf
         rW+xekYy8oO8R5wdw3GFsrwcJItiPN2FTd17C6c/nvMkTAlmCllEkCT8RX4vrfEvPsTo
         B+ZqP2HM+kxuvCoFaxoR/R6R4GeyvCDVNtFF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855278; x=1746460078;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OudYMQEOTS2zbPWCVv1I7ZI4xVlWY4W6msKtpHU3pV4=;
        b=KBfgR29pfQR9138FYVOU024eTV4/aFB3enT2phm2nkjFdYyPZgGI6+F1RNvgp9eE2B
         /iGjlN0a1WftjlxcdJjqourx0eXglJ7fDdt/6qEuEkgjUvFdnp7I/mxT13yh75OdKRRZ
         8Sl0GneXbCvR5HLgsu8SAtH26Kbohxc6P3M2vVr+sGGog1cxnVq1ip2EeDdSKKoHOH0Q
         ma2kwhikb/xebzrijNAxDN0R59kY9qrYwBN9y2hAro+IDU9ER1TSi2eUIacOeFtw+Mz8
         EmgvSxZzb8iFa+bfmcY1jxm1jp+sIBGiONFiiT+YZRLsJQmFwYCPT+kAeeeIIqUvx7sH
         BjXw==
X-Forwarded-Encrypted: i=1; AJvYcCXIFl47EKrtg+R4tWhEasnn5rL9ZcExdJII8Xp7AScG8kjteWF19aQEuCtaxvOqq43AhSLE+pg8+/KbTciQ69a1fQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwU6oOpADohr0r7qDLMNnCSehF/3OSh/a5nXLHk1yNakfSdjXp5
	mawhsg2cd3knCMcsMLfqf2bLMMo7NIlN65sJ8dQa8vuEwIYLR9Pk8akc/6lCG/I=
X-Gm-Gg: ASbGnctpj8K12hsHveyJYE0s8D3KAknmoy4w5yEzFDLNNYpmw1d9eFA6zixi/JzoSJJ
	3NGZnhQRKoZU2hKF8IgHrl3O8u5nxQf5tkk2qcTE0+ZAAP7rYtcpuU/j4lk7QoZbtx3Cd1JxB0D
	ds/Yg0Zd3+JTrwHfj+Jo6iVJT4xZE8lD/FaF4UzoDwBuKkMZvzsBSs6laSJfupyPiXFnDSKYM0n
	6THZWOx7jO3q5fyrJJv7UtdQljvhK9DjV0NauIvFPCQyW37At60m2jDoSApMTf9BSts74kvhWnO
	431jLszqDfAmIGcHA41UiS/hNw6A8Fnhrz9uiOVMX2InmFMUZX2DSz9qVAhM9a3NxE3xeeLpTYW
	A1rmkU6g0sMwB7A8LbvreIWOvCqFfwQ==
X-Google-Smtp-Source: AGHT+IGR3VlGC1Yaocvt28wABvEZPmYwswXiw1R3zCK4HDYzlP9KZF7GE2tiWGXLjCgte3uSl1mVDA==
X-Received: by 2002:adf:f602:0:b0:3a0:8712:f89b with SMTP id ffacd0b85a97d-3a0891b2d9fmr228623f8f.20.1745855278232;
        Mon, 28 Apr 2025 08:47:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:42e7:ad93:4b2c:a796? ([2001:8b0:aba:5f3c:42e7:ad93:4b2c:a796])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da0dsm11282983f8f.88.2025.04.28.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:47:57 -0700 (PDT)
Message-ID: <198c9abaf6099ac518ddaddde0837df47a027c0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] selftest-ed: Upgrade to version 1.21
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2025 16:47:56 +0100
In-Reply-To: <D9I8G5PXS7RT.1NTX4ORQDKEJP@bootlin.com>
References: <20250427141915.1868977-1-raj.khem@gmail.com>
	 <D9I8G5PXS7RT.1NTX4ORQDKEJP@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215617

On Mon, 2025-04-28 at 13:24 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Sun Apr 27, 2025 at 4:19 PM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > Older versions do not compile with GCC 15
> > 1.21 is licensed under GPL-2.0 which means we can remove 0.5 recipe as =
well
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>=20
> Hi Khem,
>=20
> Thanks for your patch.
>=20
> It looks like we still have some issues.
>=20
> oe-selftest:
>=20
> Exception: subprocess.CalledProcessError: Command 'tar --xattrs --xattrs-=
include=3D'*' -cf - -S -C /srv/pokybuild/yocto-worker/oe-selftest-fedora/bu=
ild/build-st-1181225/tmp/work/x86_64-linux/selftest-ed-native/1.21.1/archiv=
er-work//selftest-ed-1.21.1 -p . | tar --xattrs --xattrs-include=3D'*' -xf =
- -C /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1181225/=
tmp/work/x86_64-linux/selftest-ed-native/1.21.1/archiver-work//selftest-ed-=
1.21.1.orig' returned non-zero exit status 2.
>=20
> Subprocess output:
> tar: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-118122=
5/tmp/work/x86_64-linux/selftest-ed-native/1.21.1/archiver-work//selftest-e=
d-1.21.1: Cannot open: No such file or directory
> tar: Error is not recoverable: exiting now
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1387
>=20
> Also an issue on reproducible. This one is a bit strange:
>=20
> 2025-04-28 09:32:48,671 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: selftest-ed-1.21.1-r0 do_populate_lic: QA Issue: selftest-=
ed: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker=
/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/sel=
ftest-ed/1.21.1/selftest-ed-1.21.1/COPYING [license-checksum]
> 2025-04-28 09:32:48,671 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: selftest-ed-1.21.1-r0 do_populate_lic: QA Issue: selftest-=
ed: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker=
/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/sel=
ftest-ed/1.21.1/selftest-ed-1.21.1/ed.h [license-checksum]
> 2025-04-28 09:32:48,671 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: selftest-ed-1.21.1-r0 do_populate_lic: QA Issue: selftest-=
ed: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker=
/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/sel=
ftest-ed/1.21.1/selftest-ed-1.21.1/main.c [license-checksum]
> 2025-04-28 09:32:48,671 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: selftest-ed-1.21.1-r0 do_populate_lic: Fatal QA errors wer=
e found, failing task.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1517
>=20

I dug into this. I had to fix S in the recipe to work correctly due to the =
changed PN.

With that fixed, I needed to change the version strings in the archiver
tests. The change to licensing still broke the bbtests gplv3 test
though. I have fixes for both however I'm not sure my adjusted version
with work with gcc 15. I'm still working on that.

Cheers,

Richard

