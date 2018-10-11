Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0BC160116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 14:37:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9BEblZm024235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 07:37:47 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.21.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 07:37:46 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Thu, 11 Oct 2018 10:37:46 -0400
Message-ID: <18329083.QvFe2krHl5@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CADqQcK4Mn1zSSh_du4=_aOcaiL2oy37m3mcWZTwZVK45UcTjWw@mail.gmail.com>
References: <1539200144-19028-1-git-send-email-mark.asselstine@windriver.com>
	<4478883.5euKKaLx1P@yow-masselst-lx1>
	<CADqQcK4Mn1zSSh_du4=_aOcaiL2oy37m3mcWZTwZVK45UcTjWw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: Fix build issues with /tmp mounted with noexec
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
X-List-Received-Date: Thu, 11 Oct 2018 14:37:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, October 10, 2018 4:32:56 PM EDT Nirbheek Chauhan wrote:
> On Thu, Oct 11, 2018 at 1:50 AM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > Definitely a bug in that it doesn't propogate as an error.
> 
> Note that compiler checks currently never raise an exception, and -1
> is the all-inclusive "error condition" for when the size of a variable
> could not be determined. Perhaps we should add a kwarg to sizeof()
> that forces it to error out if the size could not be determined, or if
> an unexpected error occurs.

I can only speak from my perspective as a user here, and that is a "silent" 
fail such as this is evil.

Firstly because this took some time to dig up. Understandably in this instance 
the build failure was only taking place in automated build infra which made it 
difficult to inspect logs and such to narrow in on the issue. Even if I had 
easier access to a failed build this would have taken time to uncover, btw.

Secondly and more importantly had it not been for a coding issue causing a 
build failure this would have gone unnoticed and the code built on systems 
with noexec-tmp vs not would have be completely different.

Regardless of the "-1" potentially aligning with some known default the fact 
that meson had an obvious failure attempting to run code and didn't return a 
failure return code is wrong. This is host contamination.

> 
> > On the need to
> > always use meson-private, I am 50/50 on that. Since meson respects
> > TMPDIR/TMP/ TEMP does it really need to handle this directly?
> 
> The main advantage of using tmpfs for temporary files is obvious,

Sorry, are you concerned about dirs/files being improperly cleaned up? Disk 
IO? Whenever I see "obvious" in an email I get a bit worried as I don't trust 
that what I am thinking is the same as what others might be.

> which is why we try to avoid writing that to meson-private inside the
> builddir. As I just commented on the issue, `XDG_RUNTIME_DIR` might be
> a good candidate for an exec tmpfs location.

I am not familiar with XDG_RUNTIME_DIR. On paper it does read like it could be 
used but it does seem to have a varying levels of support especially on 
systems which use sysvinit where pam is not always present.

Mark





