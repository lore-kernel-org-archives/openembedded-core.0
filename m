Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 660C9736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 15:48:47 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id z123so93220577itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2016 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CabRdNj4mwIosV9YF1BG1SP10IRqA8/H8XZTo9kgJU8=;
	b=j6+gIu8Mwmhc19YzNT2fLgVpN1ARxooMWR8DQrWlQn4/NWxGFwSdCt9wVL6nXjyXS3
	tltMwHaNSFZLQy9y+X7/ZR3BH7gA5d7ashd5DOlpZJOhkyNOG+oVvu4xtWLEr1OkkcE3
	MtpWCbRsctaPrzSL3/QSJkTv5PqWoY+knyuUfdUdOSJ+a47pZpAjWbwLAytTpHNz/hS2
	zRd1AMAKlt2U1pwNMK9ouafKtApFgBaQUz9BeB039N3HztcLNrLStJsI2BwKOCDwudWl
	DZXZsqeJC0qN3AJhaLsIfHsNqwW4e0UZcIJLpR75vyVJdz6o2BE4O9jF5DhLZS3ZApDf
	XzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CabRdNj4mwIosV9YF1BG1SP10IRqA8/H8XZTo9kgJU8=;
	b=B0ziZCpa/Dmt39B3Bm5g+osc1qv7cg+hwJMaWS3fDrmue8n4PkYS8d4Mon3eXKlzlK
	/eYPr+DTEvuVmgMldfexKKujCV54ijy4BuqPw38IOgVUFs4fPEKjhsBTSFMgLv1aOmmQ
	8G/2pLbdLHb8mlqGMDIshHHBWLGOI/PbV3AXt4LXCpKeIgeukNqD6FuJzY+BkDzI9J8v
	HlfTyr/NEEoG9PTwTJrSPYhmmlDtsUzq6SroEgXEP7VmUgu9aZjy9Y10ALP/aEd2Pgmj
	U6guW550ZNvq4Z5sFOZfvHgrAn9cySFqB3dD7C4aiTAamaUUOswEtfcjHSt1inzSSTkF
	SscA==
X-Gm-Message-State: ALyK8tI0ImHVEFSGsT9ahr0xFSPSJH46YgXXistWNYIXWxLy6JZWw245Nh5glcUt5brG2VazMuqIKqEgGjG5xA==
X-Received: by 10.36.53.145 with SMTP id k139mr3727111ita.66.1465314528499;
	Tue, 07 Jun 2016 08:48:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Tue, 7 Jun 2016 08:48:29 -0700 (PDT)
In-Reply-To: <1465311037-17658-1-git-send-email-joshua.g.lock@intel.com>
References: <1465311037-17658-1-git-send-email-joshua.g.lock@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 7 Jun 2016 08:48:29 -0700
X-Google-Sender-Auth: RXqpQhVuzB9_p6vFf_5tBcR_RdE
Message-ID: <CABcZANks5WFAtXnvwpgGPp+Uyy2d7Z1VUNoxx6J=wfHFO0Brag@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: add mechanism to run QA checks on the image once it's built
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
X-List-Received-Date: Tue, 07 Jun 2016 15:48:50 -0000
Content-Type: multipart/alternative; boundary=001a114a93d8f4a0b30534b21faf

--001a114a93d8f4a0b30534b21faf
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 7, 2016 at 7:50 AM, Joshua Lock <joshua.g.lock@intel.com> wrote:

> Add a mechanism to run QA checks on a constructed image once it's
> complete. All checks will be run with any one failure resulting in
> a failed build.
>
> QA checks should be bitbake functions which throw a
> NotImplementedError when the check QA fails, with any error
> messages passed to the exception.
>
> Specify which checks to run by adding them to IMAGE_QA_COMMANDS.
>
> i.e.
>
> IMAGE_QA_COMMANDS += " \
>     image_check_everything_ok \
> "
>
> python image_check_everything_ok () {
>     raise NotImplementedError('This check always fails')
> }
>
> This code is based heavily on the configuration upgrade code in
> sanity.bbclass.
>
> [YOCTO #9448]
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>


What's the behavior if your qa function fails with a different exception?
What if a user writes a shell qa check function, what's the behavior? Also,
this seems like overloading the purpose of NotImplementedError. IMO It'd be
cleaner to either use a custom exception or re-use python unit testing bits
/ use assert rather than subverting this one to a different purpose.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114a93d8f4a0b30534b21faf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 7, 2016 at 7:50 AM, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:joshua.g.lock@intel.com" target=3D"_blank">joshua.g.lock@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":16q" class=
=3D"a3s aXjCH m1552b5843d6d0f92">Add a mechanism to run QA checks on a cons=
tructed image once it&#39;s<br>
complete. All checks will be run with any one failure resulting in<br>
a failed build.<br>
<br>
QA checks should be <span class=3D"il">bitbake</span> functions which throw=
 a<br>
NotImplementedError when the check QA fails, with any error<br>
messages passed to the exception.<br>
<br>
Specify which checks to run by adding them to IMAGE_QA_COMMANDS.<br>
<br>
i.e.<br>
<br>
IMAGE_QA_COMMANDS +=3D &quot; \<br>
=C2=A0 =C2=A0 image_check_everything_ok \<br>
&quot;<br>
<br>
python image_check_everything_ok () {<br>
=C2=A0 =C2=A0 raise NotImplementedError(&#39;This check always fails&#39;)<=
br>
}<br>
<br>
This code is based heavily on the configuration upgrade code in<br>
sanity.<span class=3D"il">bbclass</span>.<br>
<br>
[YOCTO #9448]<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel.com">j=
oshua.g.lock@intel.com</a>&gt;</div></blockquote></div><br><br><div>What&#3=
9;s the behavior if your qa function fails with a different exception? What=
 if a user writes a shell qa check function, what&#39;s the behavior? Also,=
 this seems like overloading the purpose of NotImplementedError. IMO It&#39=
;d be cleaner to either use a custom exception or re-use python unit testin=
g bits / use assert rather than subverting this one to a different purpose.=
</div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--001a114a93d8f4a0b30534b21faf--
