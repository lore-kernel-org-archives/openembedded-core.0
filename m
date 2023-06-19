Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2488EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:50:14 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.9401.1687186213769412620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Q5bGYDRw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f8775126d3so273573e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687186212; x=1689778212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HcBZCWTwKSdT/xULLW3iahUxJ1BKb/dcqJiv/W8Xs8=;
        b=Q5bGYDRwHwW1mVk5Rysx052b0IqumiC2LXLFRkCTrcvx1VHLYXFruj3kwSOAOMyabN
         4V2AOayDIBv+1zRzRbIyH7vXYPdeSXWWtaoCDl+OsXndWoStJuUrLcFORm7Aq3oqGdwK
         w0deR8FwFy231i51iRTs82y3xP0DG9I6d76I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186212; x=1689778212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HcBZCWTwKSdT/xULLW3iahUxJ1BKb/dcqJiv/W8Xs8=;
        b=N3q7Jm++lOVdYv4972UmNd5+u7TS6Af/UHZLYnW05GBE5OCZxUQQDvgO2Eg64h9sdS
         TTNVLOvNn4SZ+n3jJFd6N8BDToiJQYNPlJAm8/bzPV43kRAshOnQHYIh7GUPRvQdcQ7O
         R4RLIlchhkpmmdspZtJGmfsYdQk14b3TL/x1HYd6Wv7zwfFex0YOLV1C7VwP+9udGtUK
         zVdge0mzW/OSUQA/PxMoiFLglMgT9g38zEea/5EWIPBtV2r6Hnds6IOqJ8qYcUHuPB7C
         l/Q0C7WliraOAtwAbVMLF3e4YFulUpMHeDc5PSlxkjuZ+DNAHwz8HXjygDGLMS/hfjZK
         VwTQ==
X-Gm-Message-State: AC+VfDzmoviBdvWLJM5/DfZNLMuLNVAlGB6UN03sjDaxn5T6FMA/K4LP
	b3tgeW/jDHigt4hvzp89u+Z/sBC1XGuwu2e4z8M=
X-Google-Smtp-Source: ACHHUZ6acr9SgtSpaiH9Fbg3O2yomzmn5ngxHFcFL0t2aznmq+B4YuVehzc4c7rIJgpkC3pqqh/bcA==
X-Received: by 2002:a05:6512:1c5:b0:4f1:3eea:eaf9 with SMTP id f5-20020a05651201c500b004f13eeaeaf9mr5946038lfp.24.1687186211993;
        Mon, 19 Jun 2023 07:50:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f105:ba55:87cc:dc34? ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id q1-20020a7bce81000000b003f819faff24sm10914813wmj.40.2023.06.19.07.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:50:11 -0700 (PDT)
Message-ID: <e1b3ced391e8d316d808b5c35c2c655d89191089.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] runqemu-gen-tapdevs: pass
 STAGING_BINDIR_NATIVE to ifup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2023 15:50:10 +0100
In-Reply-To: <ef3d8471-22f1-7b0b-48f6-25a096a28d42@baylibre.com>
References: <20230619135416.1640748-1-tgamblin@baylibre.com>
	 <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
	 <ef3d8471-22f1-7b0b-48f6-25a096a28d42@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183119

On Mon, 2023-06-19 at 10:19 -0400, Trevor Gamblin wrote:
> On 2023-06-19 10:03, Richard Purdie wrote:
> > On Mon, 2023-06-19 at 09:54 -0400, Trevor Gamblin wrote:
> > > Without this, runqemu-gen-tapdevs fails with the following error:
> > >=20
> > > [tgamblin@megalith build]$ sudo /workspace/yocto/manual/poky/scripts/=
runqemu-gen-tapdevs 1000 1002 4 tmp/sysroots-components/x86_64/qemu-helper-=
native/usr/bin
> > > Creating 4 tap devices for UID: 1000 GID: 1002...
> > > Creating tap0
> > > Error bringing up interface: sudo runqemu-ifup <uid> <gid> <native-sy=
sroot-basedir>
> > >=20
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ---
> > >   scripts/runqemu-gen-tapdevs | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdev=
s
> > > index ec3ecb03b9..dc730e413d 100755
> > > --- a/scripts/runqemu-gen-tapdevs
> > > +++ b/scripts/runqemu-gen-tapdevs
> > > @@ -79,7 +79,7 @@ fi
> > >   echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
> > >   for ((index=3D0; index < $COUNT; index++)); do
> > >   	echo "Creating tap$index"
> > > -	if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
> > > +	if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`;=
 then
> > >   		echo "Error bringing up interface: $ifup"
> > >   		exit 1
> > >   	fi
> > I'm a bit puzzled as I removed the use of STAGING_BINDIR_NATIVE in that
> > script?
> STAGING_BINDIR_NATIVE is still present near the top of the script as a=
=20
> variable but isn't used anywhere. When I encountered the error and saw=
=20
> that the script wasn't passing a path, I thought including it again=20
> would fix it. It appears to do so on my Fedora build system.
> >=20
> > Are you mixing different releases?
> I'm using the latest poky master.
>=20

My testing environment was corrupt, testing "build1" when the code was
in "build".

I've sent a couple of patches, one to fix the script parameters (the
bindir isn't used anymore) and one to fix the issue with more than 10
tap devices.

Cheers,

Richard



