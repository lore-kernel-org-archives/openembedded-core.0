Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB38C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:21:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.10088.1634307687348296306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cy7o2jPA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id e3so26589184wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=H7K0m/WRGEtdBbhvj6xnZCBKlShVjp06ZXZMIbFxiMo=;
        b=cy7o2jPAjOiZ3n47RM713BsLLsExv72s6tP4/XQ/2x/xrFs9BFs5Lw7ep5pYioruo9
         wITxZhY6HpiP/DS4UyUG7ayZ5b3gtPHKVukuV9OiU/cgHemkd12uR7tiLYW2sAUE1AM/
         dq1vBHaKxKaX7znviQtJQyQfiZjchkQbFaH30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=H7K0m/WRGEtdBbhvj6xnZCBKlShVjp06ZXZMIbFxiMo=;
        b=Q7LTQPfW8+gTelq6TZ1wqjVwbadJX3LamM3fwWF/KRiX0EK3s5pN5ZdDv/qkTRQa3f
         I+8MOyzU7g8JING891E75CYS8YutmoGiZq9CLfwQhpkqbO8lKecqSsSmOaZkqBlMPgjx
         nqrMPOklhVDUUtny4MKjBHE+EVoIie4gafVmTU2GoAB8WBR1aKbFIcrJH4TcLa/wSYfq
         BWjpGyoh1wEH+K1Fy3l5jryUUXYzUmeDGnfconH9B4ayiyIvry9MuMD9yX1n71g5xbm8
         fePYXtIsFPP51BbGCHnvKnY3Q1lc57v4Qm58hHT2MGMS+VifIjvZOaMlktRfefCtQmLh
         7OYA==
X-Gm-Message-State: AOAM531P2VG4e/Yfnz06WbmTGuM5mw6KwDERqFdbMKbixgDHh1rYz4qH
	CF4kLHj1zycOAlvPTJQMW951sA==
X-Google-Smtp-Source: 
 ABdhPJwl8eQ1hj/6l7Qw9qeipSY/EVODHOLi5uowVfPf4w8gDZAfbkdoXp3Td3iEqwgW/+YLpnS1AA==
X-Received: by 2002:adf:ab43:: with SMTP id r3mr15065280wrc.225.1634307685906;
        Fri, 15 Oct 2021 07:21:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 c17sm10312578wmr.15.2021.10.15.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 07:21:25 -0700 (PDT)
Message-ID: 
 <35cea7f30bd468c6e410de54b2b28693b0eed34a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/2] lib/oe/qa,insane: Move extra error
 handling functions to library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 15 Oct 2021 15:21:24 +0100
In-Reply-To: <YWmNXm53Igtt3LuX@mcrowe.com>
References: 
	<be8780efcbcee32cc1ef6aff886e85d1b78fe627.1634306366.git.mac@mcrowe.com>
	 <a58827c0ad0f2c39ca4df700efe31fc9d18b1383.camel@linuxfoundation.org>
	 <YWmNXm53Igtt3LuX@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156999

On Fri, 2021-10-15 at 15:17 +0100, Mike Crowe wrote:
> On Friday 15 October 2021 at 15:09:08 +0100, Richard Purdie wrote:
> > On Fri, 2021-10-15 at 14:59 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > Extract package_qa_write_error, package_qa_handle_error and
> > > package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
> > > drop the package_qa_ prefixes.
> > > 
> > > Update various bbclasses to use the new functions. No import is required
> > > since base.bbclass puts oe.qa in OE_IMPORTS.
> > > 
> > > Stop requiring callers to manually track whether a fatal error has been
> > > encountered via a "sane" flag. Instead replace the QA_SANE variable with
> > > QA_ERRORS_FOUND and call oe.qa.exit_if_errors or
> > > oe.qa.exit_with_message_if_errors at the end of each task.
> > > 
> > > Inspired by discussion resulting from
> > > https://lists.openembedded.org/g/openembedded-core/message/156793 and
> > > https://lists.openembedded.org/g/openembedded-core/message/156900
> > > 
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  meta/classes/buildhistory.bbclass |   3 +-
> > >  meta/classes/insane.bbclass       | 180 ++++++++++++------------------
> > >  meta/classes/multilib.bbclass     |   3 +-
> > >  meta/classes/package.bbclass      |  26 ++---
> > >  meta/classes/ptest.bbclass        |   2 +-
> > >  meta/lib/oe/qa.py                 |  34 ++++++
> > >  6 files changed, 121 insertions(+), 127 deletions(-)
> > > 
> > > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> > > index 7c44fec2d1..62d0d781a1 100644
> > > --- a/meta/classes/buildhistory.bbclass
> > > +++ b/meta/classes/buildhistory.bbclass
> > > @@ -287,7 +287,7 @@ python buildhistory_emit_pkghistory() {
> > >              r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
> > >              if r < 0:
> > >                  msg = "Package version for package %s went backwards which would break package feeds (from %s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
> > > -                package_qa_handle_error("version-going-backwards", msg, d)
> > > +                oe.qa.handle_error("version-going-backwards", msg, d)
> > >  
> > >          pkginfo = PackageInfo(pkg)
> > >          # Apparently the version can be different on a per-package basis (see Python)
> > > @@ -321,6 +321,7 @@ python buildhistory_emit_pkghistory() {
> > >  
> > >      # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
> > >      bb.build.exec_func("buildhistory_list_pkg_files", d)
> > > +    oe.qa.exit_if_errors(d)
> > 
> > This is a change in behaviour since currently buildhistory doesn't do that and
> > I'm not sure it should.
> 
> How about moving version-going-backwards from ERROR_QA to WARN_QA and
> keeping the call to oe.qa.exit_if_errors?
> 
> It's somewhat confusing having version-going-backwards in ERROR_QA now if
> it's not going to be fatal when all the other checks in that variable are
> fatal. It also means that any future callers of oe.qa.handle_error from
> this task would behave the same.

I'd prefer it to stay in ERROR_QA. I guess it standardises things to add the
exit_if_errors call.

Cheers,

Richard



