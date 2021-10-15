Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D03C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:17:17 +0000 (UTC)
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web11.9847.1634307425368975281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=BhxQnf7S;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id bO18mxJ8ArasdbO19mbDFa; Fri, 15 Oct 2021 15:17:04 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=bKWN3M2Z c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=Nie-H1Gvpm98Nxv4TcIA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=wt/Xifb4Q7GAmfZabjc0CuQL8sWjGEZiEqxetyoDcy8=; b=BhxQn
	f7SeIhUrtIR62TZ0t/BxUo2RfypvPz3CFGQywrH+KpXTuh7vh3ropWCUWRvLMCux1Vhyhd10nbriu
	ijpGJCOoGG706ql1y6TjN4p8Su6ddKmSrgq/PYcan6K/mdeMXyTNkOh7hkFfUev8OfHtuyxREw3Vf
	9BWhoonzf45wB71GehzQGj4iULLz63OsqYRXXvFTeyYkGa2RRB95cqYRi9Mev1ysl4lpVoHSxi3jH
	xVLgmjsBU2TgUrBOZgW9tILGV9UVIX8epkRyCfrmSG11fQUk6VozZTyC22D1YCnvXl57rhfg9srVQ
	rwg8tSASd35vdVzKhy/pkgM13m3Qw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mbO18-004ckz-3H; Fri, 15 Oct 2021 15:17:02 +0100
Date: Fri, 15 Oct 2021 15:17:02 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 1/2] lib/oe/qa,insane: Move extra error
 handling functions to library
Message-ID: <YWmNXm53Igtt3LuX@mcrowe.com>
References: 
 <be8780efcbcee32cc1ef6aff886e85d1b78fe627.1634306366.git.mac@mcrowe.com>
 <a58827c0ad0f2c39ca4df700efe31fc9d18b1383.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <a58827c0ad0f2c39ca4df700efe31fc9d18b1383.camel@linuxfoundation.org>
X-CMAE-Envelope: 
 MS4wfHo2wmvDMtQLIZA9XHChO1d9xtpKed1VAShEQgu9eb0HEYstPIOcSwWS8+CJv+uCUyvWj0dQSLsikNma/0Ihos44FQZ/bWwt0QNsUut1i75wj175KQud
 eXi3UCAG1V5a66AZc0XEM0Enlzo5Td+iUr8euR+veXQf6QDZflZtGjIxEEMYc+5QjlDfSWtnyi8ZWQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:17:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156998

On Friday 15 October 2021 at 15:09:08 +0100, Richard Purdie wrote:
> On Fri, 2021-10-15 at 14:59 +0100, Mike Crowe via lists.openembedded.org wrote:
> > Extract package_qa_write_error, package_qa_handle_error and
> > package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
> > drop the package_qa_ prefixes.
> > 
> > Update various bbclasses to use the new functions. No import is required
> > since base.bbclass puts oe.qa in OE_IMPORTS.
> > 
> > Stop requiring callers to manually track whether a fatal error has been
> > encountered via a "sane" flag. Instead replace the QA_SANE variable with
> > QA_ERRORS_FOUND and call oe.qa.exit_if_errors or
> > oe.qa.exit_with_message_if_errors at the end of each task.
> > 
> > Inspired by discussion resulting from
> > https://lists.openembedded.org/g/openembedded-core/message/156793 and
> > https://lists.openembedded.org/g/openembedded-core/message/156900
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/classes/buildhistory.bbclass |   3 +-
> >  meta/classes/insane.bbclass       | 180 ++++++++++++------------------
> >  meta/classes/multilib.bbclass     |   3 +-
> >  meta/classes/package.bbclass      |  26 ++---
> >  meta/classes/ptest.bbclass        |   2 +-
> >  meta/lib/oe/qa.py                 |  34 ++++++
> >  6 files changed, 121 insertions(+), 127 deletions(-)
> > 
> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> > index 7c44fec2d1..62d0d781a1 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -287,7 +287,7 @@ python buildhistory_emit_pkghistory() {
> >              r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
> >              if r < 0:
> >                  msg = "Package version for package %s went backwards which would break package feeds (from %s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
> > -                package_qa_handle_error("version-going-backwards", msg, d)
> > +                oe.qa.handle_error("version-going-backwards", msg, d)
> >  
> >          pkginfo = PackageInfo(pkg)
> >          # Apparently the version can be different on a per-package basis (see Python)
> > @@ -321,6 +321,7 @@ python buildhistory_emit_pkghistory() {
> >  
> >      # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
> >      bb.build.exec_func("buildhistory_list_pkg_files", d)
> > +    oe.qa.exit_if_errors(d)
> 
> This is a change in behaviour since currently buildhistory doesn't do that and
> I'm not sure it should.

How about moving version-going-backwards from ERROR_QA to WARN_QA and
keeping the call to oe.qa.exit_if_errors?

It's somewhat confusing having version-going-backwards in ERROR_QA now if
it's not going to be fatal when all the other checks in that variable are
fatal. It also means that any future callers of oe.qa.handle_error from
this task would behave the same.

> 
> >  }
> >  
> >  python buildhistory_emit_outputsigs() {
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 433e4dfa33..2df5edf138 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -18,7 +18,7 @@
> >  #   files under exec_prefix
> >  #  -Check if the package name is upper case
> >  
> > -QA_SANE = "True"
> > +QA_ERRORS_FOUND = "False"
> > 
> 
> Lets just delete this please, we don't need a default value and it is confusing
> being isolated from the other code.

OK. I'll await your response to the above question and then send v5.

Thanks.

Mike.

