Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 610FA76536
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 11:28:19 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i75so60604107ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NcKrepripXZHi0ACjCMx6ag2pPG62ok6iZYO++fSw4A=;
	b=2GUsxQW4i2fNyWnvHAWdfG4H4Ivk7H2NopWy1GhJo1Fa5Js/FwqmdxLBUV4gBFYGGu
	igGSrumlmNOp5EDE6PG/f0wdd0HoUm0sMpwZU6C0abhFBvy3umRyR9GlnNejNUf0oJND
	/vyB6KsGWGPsJvUjwGMas2hA0JeX8jTcwo65UtkItyXAfabhSQCOZNY3hO5VdBV0WkXk
	mgabCZqNcha8zJ0TGDgjtgQOhsHFI3Lv8t8vyV6ULS3sXgXJVr4wUj2BONdg/3osrpUS
	p30vUA4YUSgfI6WYZKPBke8qEjmf6cVgnHVoMpKuE6wezvJ9k3KkD27hjNp4cgUJJhPR
	FV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NcKrepripXZHi0ACjCMx6ag2pPG62ok6iZYO++fSw4A=;
	b=koJ0e8wlj1t1GVUhqQVQ/f/EnTt3c4FVBOp76A7z5xi0BzbtE7vwlDG9F4JM6AU6Pd
	LVFetRfs7j5Rvc1VBjZC8NnRmzjXHbt3SwrEG++lfaxTNzm8QoDn/WZa6PFP7pfzhMz8
	b8/S/0itMd+XwRqwBsQaYWiw6hLh2v6FqIp8qznofMMlwrf+7P4ziJLAMgGEPL8ZYQjB
	3t4P8PSBWwwVIgzJbW3ByyjabCZihCighSsEGGb9FZ4CUxI0UOqR2gCzONXyXMYKY2Lp
	+aVej8cvW0zACd+HfxtkqEEYY0OBtoB2ghvOV2Pv6HHidlngGbzg1ZMeBFY0h5yrrRfK
	CPGA==
X-Gm-Message-State: AOPr4FXh38WsK+a2MO9ITl5j4gDwawpfe9wrpAybS997dOKl6hYz8/qMsMpNpGswFPmhnMhiq/vV18vqeAXnGQ1p
X-Received: by 10.107.135.211 with SMTP id r80mr5003495ioi.133.1463570900422; 
	Wed, 18 May 2016 04:28:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 04:28:01 -0700 (PDT)
In-Reply-To: <1463564726-111166-2-git-send-email-herve.jourdain@neuf.fr>
References: <1463564726-111166-1-git-send-email-herve.jourdain@neuf.fr>
	<1463564726-111166-2-git-send-email-herve.jourdain@neuf.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 12:28:01 +0100
Message-ID: <CAJTo0LYo8sTu+K2oFVxjRy16YW8+DjbzS90TF28XWaSQ+FXDCQ@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 11:28:20 -0000
Content-Type: multipart/alternative; boundary=001a113ed20a9fce6d05331c278b

--001a113ed20a9fce6d05331c278b
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 10:45, Herve Jourdain <herve.jourdain@neuf.fr> wrote:

> +    if os.path.isdir(dri_drivers_root):
>

You're checking files on the host here as dri_driver_root is ${libdir}/dri
and you failed to append PKGD (see the os.listdir call).

Ross

--001a113ed20a9fce6d05331c278b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 10:45, Herve Jourdain <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:herve.jourdain@neuf.fr" target=3D"_blank">herve.jourdain@neuf.fr</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":a6k" class=
=3D"a3s aXjCH">+=C2=A0 =C2=A0 if os.path.isdir(dri_drivers_root):<br></div>=
</blockquote></div><br>You&#39;re checking files on the host here as dri_dr=
iver_root is ${libdir}/dri and you failed to append PKGD (see the os.listdi=
r call).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113ed20a9fce6d05331c278b--
