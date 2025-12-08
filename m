Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D489D3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:50:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1549.1765212601908614261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mDTeEBTW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kjBbVu+GUbVw12s6jOudv/7imFmI7JFAxKCtmmI917M=; b=mDTeEBTWcd5AZ+5yX2FSnfk5Mx
	efr+wFtyvDWByW/RJu4+Gl6cW0jiYwpyh6Ah/gQyYApHuO02y5OnhS04X3SCnHwl9Rbksr+tm7Tdz
	nAir9fZwpw40VK492PIOs5cRppiroRBPpUwA/FQQKDOqPqn16+QiTQ4PdcSvzCUz6E2SbhwuZhjX6
	iJzuyXaRRvP7v4CTrSQB+b1MvMYCuHsZIsgyUrHcHxfbnqUCEABvMd2MeQu/nCUkShYi06rSoWiYc
	nL25C0eRn4OAo4bPXRKZrs1N3j58MU1IXE4AjKGqm/d0bhh+hlVDuxA/Eq3N1e+3Pt2bKfRQuXTBf
	9trJlnYg==;
Received: from [147.129.179.166] (port=50328 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vSeQy-0000000D0Ci-1IJX;
	Mon, 08 Dec 2025 11:50:00 -0500
Date: Mon, 8 Dec 2025 11:51:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alex Kiernan <alex.kiernan@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] is there any reason for a ptest-enabled recipe to
 conditionally SRC_URI run-ptest?
In-Reply-To: <CAO5Uq5TGQzSksy6V2LOGqDtvtiSR7_GG5puZc=_FtG3jZSvbtA@mail.gmail.com>
Message-ID: <65285038-9a63-f5da-7ae2-f1642114ba01@crashcourse.ca>
References: <a83fbc50-c122-a60e-176d-9c492664fb2d@crashcourse.ca> <CAO5Uq5TGQzSksy6V2LOGqDtvtiSR7_GG5puZc=_FtG3jZSvbtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1009606316-1765212696=:100481"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 16:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227399

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1009606316-1765212696=:100481
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 8 Dec 2025, Alex Kiernan wrote:

> On Mon, Dec 8, 2025 at 12:39 PM Robert P. J. Day via
> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
> wrote:
> >
> >
> >   working on a tutorial for ptest and i ran across an oddity under
> > meta-openembedded, not sure if it means something or is just leftover
> > cruft from days gone by. i found three recipes with the following
> > construct (reformatted slightly for visual aesthetics):
> >
> > $ grep -r "PTEST_ENABLED.*run-ptest" *
> >
> > meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb:SRC_URI +=
> > "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"
> >
> > meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb:
> > ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
> >
> > meta-oe/recipes-support/re2/re2_2024.03.01.bb:
> > ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
> >
> >   all three recipes check whether PTEST_ENABLED = 1 before adding
> > file://run-ptest to SRC_URI.
> >
> >   is there any reason for this?
>
> All three gained ptest support in 2023, two from the same author...
> my money's on copy and paste from another recipe.

  so you would agree that while the above PTEST_ENABLED conditional is
technically acceptable in any recipe that provides a *static*
file://run-ptest, it's really unnecessary and might as well use the
simpler non-conditional form for overall consistency.

> > all three recipes inherit ptest, so it
> > seems that they *must* provide a run-ptest file. and even if one does
> > not enable that setting with DISTRO_FEATURES += "ptest", if a recipe
> > inherits ptest, does that not *require* that recipe to make sure a
> > run-ptest file is available if called upon? or am i misreading
> > something?
> >
> > rday
> >
> > p.s. i might ask a similar question about this snippet from
> > ptest.bbclass:
> >
> >     do_install_ptest_base() {
> >         if [ -f ${UNPACKDIR}/run-ptest ]; then
> >             install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> >         fi
> >
> > if run-ptest does not come from UNPACKDIR, where would it come from?
> > might the recipe generate that file dynamically upon package creation?
> >
>
> The golang classes do exactly that.

  ah, perfect, that was the sort of example i was looking for. and in
cases like that, SRC_URI would obviously *not* include
'file://run-ptest' as that file would not exist.

  good, clarifying stuff a little at a time, thanks.

rday
--8323329-1009606316-1765212696=:100481--

