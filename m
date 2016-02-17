Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 107E4731CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 23:49:22 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id y8so1633481igp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 15:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p7gsg1CsN7qtzGU0Wc2yTZhx1YVrDGa5yiH9hqcNY14=;
	b=M8JwXcpJnoIbKY09ojtdtKpYBSO31cvakgYcXarzmIUX7xvKh9wGFz+hBzsC/gFvJ2
	mooIrrmGMxEMaqnXb2jWOuBTznlkKtt5uuBAUDB0OmKIMLEUaGJ6UN+Ic4ksEZA/y13/
	G+kw8uriQb3ptfeqgbuNT9seolYCKybhAEJPPVvDenImdRv1PPrVFtKAhTfBFZ22Lu/P
	/W9Yjqge7KmGsIDHrZQI77SIGHdtAdreG05lBnSANgtir6veXnVe5hzgKmNVgIapbLfn
	LQfhzKap0nk7wlDFKm4PonDcOk0yFkycWV9vgj7arHng09aoXipk93RHb7YSxHsDyccm
	dPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p7gsg1CsN7qtzGU0Wc2yTZhx1YVrDGa5yiH9hqcNY14=;
	b=U8KPDKjD99JUjP9Fi84NomnLtEetCH6pZgcOhMwNjkkFfI6kkQnP2FU8IFrA2fGx5c
	IMxsaSr8/dIOlp0fNM3qQaiw8/i9oYFV4P+X/OZ8+1PPbTe2iyC8s/uHubQ3zChRG4/3
	qiqvZlS3+GA+bCHLBLbsnVAwhQEsf9mT9f2ql+TASix5l885BApUXyuiA2VY07NvVt07
	FAzlE7ETif82nBQi/tsBl6rFmQJwYqWH4SXq5a0iSofiptNEYiaFiCjHdrqeBhJvaKq6
	bniue7Viy6c71XI5FceUIuPFMECD/N70uElxjdRX+ILb098V1Rfbd6L4NkTJBx3UcKQr
	ROVA==
X-Gm-Message-State: AG10YOQ2RH83U2tOxyV+INo9e71qj0vORAEMsATjqgMLwqlYB665na9XpH8M/YWPEpeHfMmw7yQq4UboW6p1Ipkx
X-Received: by 10.50.43.226 with SMTP id z2mr287260igl.78.1455752963554; Wed,
	17 Feb 2016 15:49:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 17 Feb 2016 15:49:04 -0800 (PST)
In-Reply-To: <56C407CB.4060100@windriver.com>
References: <cover.1455606710.git.kai.kang@windriver.com>
	<edb161a868336c0688a6e03343ee7920b34222f5.1455606710.git.kai.kang@windriver.com>
	<CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com>
	<56C407CB.4060100@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Feb 2016 23:49:04 +0000
Message-ID: <CAJTo0LY2DFyOqFU5AtrmtDFHZroGWgoeCRvychC-c1Ed-qHmnQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Wed, 17 Feb 2016 23:49:25 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4461b3d052bffe64d

--047d7bfea0f4461b3d052bffe64d
Content-Type: text/plain; charset=UTF-8

On 17 February 2016 at 05:40, Kang Kai <Kai.Kang@windriver.com> wrote:

> I prefer to keep such check. There is more than one case that causes
> operation error such as pass wrong parameters. The messages are  helpful
> for developers.
>


In that case the groupadd will return an error code.  What situations with
proper locking will result in groupadd running successfully but the group
not being added?

Ross

--047d7bfea0f4461b3d052bffe64d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 February 2016 at 05:40, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" bgc=
olor=3D"#FFFFFF">I prefer to keep such check. There is more than one case t=
hat causes
    operation error such as pass wrong parameters. The messages are=C2=A0
    helpful for developers.<br></div></blockquote><div>=C2=A0</div></div><b=
r>In that case the groupadd will return an error code.=C2=A0 What situation=
s with proper locking will result in groupadd running successfully but the =
group not being added?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4461b3d052bffe64d--
