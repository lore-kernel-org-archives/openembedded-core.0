Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70B5D77043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:12:12 +0000 (UTC)
Received: by obbzf10 with SMTP id zf10so142739577obb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=hun8QNHY9AP76Lg8a6NVCdqzVjQ8dL97TpIMA10s7vU=;
	b=ZpifZanMlEg3FXr8UqQnDE3OgzvvQQsqiTsiEC3t6aPhn0xrviEmDSNVYM8VTutZ6y
	nhN1HCaOo/az6TRFdUnFDAht5+tO+pnCBF+W+cG7+24kEVTX0kL3bVUkQuUL2zro9fLe
	G7tsf3k+70SLh5Hu2U94xbBsG+62wAXeckw8aJLD2KD1UH1JDsW9yaYo1UhHEt0pFtR/
	xvkGk90K3EKbxcM5gK9npYZa2b6lcGWOfJr1+qzs6k6ceY51Ot+ZZNTqMIEOrfKo4v9Y
	qOsMCA5MU5VHPJgygkkMJpb6SfyteA5dLp5GFQapTvGWYW5rU350PEP9LLvvIhe5OLyx
	g6bA==
X-Gm-Message-State: ALoCoQmlfitL879nZDqmcPrNoSXMgRgwry62qni2aXmHkVzSKZxfm2dQFwx51ugj8yg7L2KS5AxR
X-Received: by 10.182.108.197 with SMTP id hm5mr18536895obb.57.1445271132773; 
	Mon, 19 Oct 2015 09:12:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.195.66 with HTTP; Mon, 19 Oct 2015 09:11:53 -0700 (PDT)
In-Reply-To: <CAJTo0LaoQ4yp0AQtdKLQq22Nh=bgKgb4T8ApxyqxUc=U09FLkA@mail.gmail.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LaoQ4yp0AQtdKLQq22Nh=bgKgb4T8ApxyqxUc=U09FLkA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 17:11:53 +0100
Message-ID: <CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 16:12:15 -0000
Content-Type: multipart/alternative; boundary=089e0149d2aa7939470522776856

--089e0149d2aa7939470522776856
Content-Type: text/plain; charset=UTF-8

On 19 October 2015 at 16:37, Burton, Ross <ross.burton@intel.com> wrote:

> Not sure what to do here.  If we install file-native directly into the
> sysroot we get occasional races on the file binary  causing build
> failures.  If we make file-native ASSUME_PROVIDED then rpm (and subversion)
> change their behaviour depending on the presence of libmagic-dev on the
> host (well, rpm4 requires libmagic, rpm5 and subversion change their
> configuration).
>

Two proposals:

1) Tell RPM and Subversion to explicitly enable libmagic support so they
fail if libmagic-dev isn't installed on the host, and document that
libmagic-dev is a build requirement
2) Change file-replacement-native to install libmagic, and add
file-replacement-native as a dependency to subversion-native and rpm-native.

Does anyone have a strong opinion either way?

Ross

--089e0149d2aa7939470522776856
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2015 at 16:37, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Not sure what to do=
 here.=C2=A0 If we install file-native directly into the sysroot we get occ=
asional races on the file binary =C2=A0causing build failures.=C2=A0 If we =
make file-native ASSUME_PROVIDED then rpm (and subversion) change their beh=
aviour depending on the presence of libmagic-dev on the host (well, rpm4 re=
quires libmagic, rpm5 and subversion change their configuration).</div><div=
></div></blockquote></div><br>Two proposals:</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">1) Tell RPM and Subversion to explic=
itly enable libmagic support so they fail if libmagic-dev isn&#39;t install=
ed on the host, and document that libmagic-dev is a build requirement</div>=
<div class=3D"gmail_extra">2) Change file-replacement-native to install lib=
magic, and add file-replacement-native as a dependency to subversion-native=
 and rpm-native.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Does anyone have a strong opinion either way?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149d2aa7939470522776856--
