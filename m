Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F2FC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 13:04:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16856.1738069462257427502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 05:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mcn9f57b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so10842863a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738069460; x=1738674260; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxWtevpqJWBhn8C9BKxS/ck775nqJNyNRzVqQa+yAlU=;
        b=Mcn9f57bgD/V7YWrvIwOyvgAuCwxgKPMDFIQIWChCfHhrt2S7ExD5hGKLKQW/KFICr
         H6f56lfLPimJtZK/594Zro4IRVAxYVSuoYSX+Ieeiz3u43QfA7TCAUgf5pt9ctY/vDtP
         KYh7WNfXL7tkimVFx7y9r+iTgfhzjGT2RwqoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069460; x=1738674260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxWtevpqJWBhn8C9BKxS/ck775nqJNyNRzVqQa+yAlU=;
        b=tv0TdwtKOzUckQspGJQvarSc7AjQF/xYuYSpAisqBhdfl78Q2vAbQ4JNZue1rUrYq3
         Kzh9CwA5lu+ouP29aeisVLHIUGdz/P7PCTCZ462HZb6vRRn05QpsuIs15KlUYSBjkqu5
         83C5Xfbc5m7ZYaPtpAmodT6uJkKFJ8sU/hAMVynlWs68NFpZSsLCSy163YFe5LbQj41u
         erlHNbw9Q/DuJzwTjI2cjBLQRyQN3v9dRDj3AmZ6LpeLff9jp7MrVt/+VaGOe4fOc43S
         MmVeLmcdwSkc6u7ZTFCLX5LX8L92stTXMumg+JXsdf1KGg6XUhnGSzHdxmI1Kap7CdZF
         oQqw==
X-Gm-Message-State: AOJu0YyFyXE16C5LhdwdrrARYklG2YI5HbyA9bcXU2JI4ipC3AWPSW3O
	6R5P8k2+wbXkxRnxkf6/ciDPPqCKaKgb6ZWth7H494lGVcoVvafL2fiQgGFcUCU=
X-Gm-Gg: ASbGncvtLGg46cFui/d6vTulPoXrp8HFskpSJPoAVpZcKZ2i+K7Vako/aeztxkcRnFv
	evwTJKjCs8TvdxF1v2XDbGgehYkotHVPw+3uABY9ak3NV4iLvSIZv4pEu7JmbfMxEf4D5LSb8YP
	UWe8Ppdd1HWhKz3+JvuvRFQBzBIxw9vpzAG+u7/ifRF27jFOxLAz4ZKy524zKWr/byE4H/Bo+I6
	pvY7XtYG211PF8P1bMtpTReohvlLqknvq5QCA2IaN8IOYS6X+wYAbOFAbi/RafpuV75oYXhMGyM
	eWx8rECrwzG+MB/FxDsoNJmP/uI5GXNa2Mq3+XR9rbw=
X-Google-Smtp-Source: AGHT+IEslLqKWdmWmCRNi8lP/FWDDfFRM+1xuDtWGTqgW853wEKm1yBQhMO3Rd3GOCc1cQmQCg7/Ow==
X-Received: by 2002:a17:906:3a87:b0:ab3:a190:6cb2 with SMTP id a640c23a62f3a-ab3a1906e5cmr3391795266b.25.1738069460265;
        Tue, 28 Jan 2025 05:04:20 -0800 (PST)
Received: from [172.27.244.220] ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e653d1sm790160066b.68.2025.01.28.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:04:19 -0800 (PST)
Message-ID: <998d1cce32455c028fd2c4632bc97ccb80d19b9d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError
 too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2025 13:04:17 +0000
In-Reply-To: <Zzr0Df_92qav6fWq@nuoska>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
	 <20241111131604.364308-3-mikko.rapeli@linaro.org>
	 <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
	 <Zzr0Df_92qav6fWq@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 13:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210323

On Mon, 2024-11-18 at 10:00 +0200, Mikko Rapeli wrote:
> On Tue, Nov 12, 2024 at 11:25:51AM +0000, Richard Purdie wrote:
> > On Mon, 2024-11-11 at 13:16 +0000, Mikko Rapeli via lists.openembedded.=
org wrote:
> > > runqemu can fail with RuntimeError exception. Non-cought exception
> > > causes cooker process leaks which bind to successive bitbake command
> > > line calls and that can cause really odd errors to users, e.g. when
> > > build/tmp is wiped and cooker processes expect files to be there.
> > >=20
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > > =C2=A0meta/classes-recipe/testimage.bbclass | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-rec=
ipe/testimage.bbclass
> > > index 19075ce1f3..a9b031093a 100644
> > > --- a/meta/classes-recipe/testimage.bbclass
> > > +++ b/meta/classes-recipe/testimage.bbclass
> > > @@ -371,7 +371,7 @@ def testimage_main(d):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete =3D True
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if results.hasAnyFai=
lingTest():
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 run_failed_tests_post_actions(d, tc)
> > > -=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError) as er=
r:
> > > +=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError, Runti=
meError) as err:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if isinstance(err, K=
eyboardInterrupt):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bb.error('testimage interrupted, shutting down...')
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > >=20
> >=20
> > During review it is hard to understand what the real issue is from this
> > description. I don't like the sound of processes leaking and if that is
> > happening, adding another exception to this list doesn't feel correct.
> > I was going to ask for a better explanation but looking at the code,
> > perhaps this error handling path just needs rewriting/improving with
> > more of the code in the finally, conditionally?
> >=20
> > I just want to make sure we fix the real bug here.
>=20
> Sorry for being unclear. I thought the backtrace would be too verbose.
>=20
> The bug happens when runqemu startup fails:
>=20
> poky/meta/lib/oeqa/targetcontrol.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RuntimeError("%s - FAILED to start qem=
u - check the task log and the boot log" % self.pn)
>=20
> cooker processes do leak when the exceptions are not cought.
> Maybe these are not strictly related but it happens for me. It
> can be that cleanup happens but just slowly, and when I run
> other bitbake commands right after failure they connect to these
> leaked cooker processes which then behave badly, for example when
> build/tmp was already wiped.
>=20

Sorry for the delay in looking at this patch. I'm a bit worried about
there being a leaked processes and wanted to understand if there was
other cleanup we should be doing.

Instead of this path, would it make sense to move the results.stop()
inside the finally? I'm worried that other forms of exception would
also leak processes.

Cheers,

Richard

