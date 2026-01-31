Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86886D79769
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 10:01:47 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6220.1769853698883906983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 02:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=H1GEVgOA;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4f37gy3s6Nz9tfX;
	Sat, 31 Jan 2026 11:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769853694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxaiGvskUgyi6GPn7JslYGiacTgq6CaQ8UcgXTKRe+c=;
	b=H1GEVgOAcqcJjsMyX2RdmyruXaIo0DMXcwlM+fiWEyBoxPF72N8AT35UFTUSvuPX5utY8S
	tpnRLYFeB8ZzgE6PumDssDVF9H7h+/YRVffsti60L722QcWOuIqye7OMWpEJGX+mgVC5qC
	kntCBZzT0DXmM4dSeynOweOKlcvkmi6lB7uSPl8sNRDFzeguBpwNJogbciutGr7fLIo4jt
	1ScG4zm4dw7O1Vqf8ENRI4yhtzTdG4GXIpgiHSk5R03eSp17UPEdAYTJ2bnTyln3FxtSLn
	S9QB3Q/O3n32zu030uU6sMMtC8vQ7H9v2Y2WA+hGj2rYzjagJFRgCSAEtEhacA==
Date: Sat, 31 Jan 2026 11:01:32 +0100 (CET)
From: patrick.vogelaar.dev@mailbox.org
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, paul@pbarker.dev
Message-ID: <1439731459.127966.1769853692567@app.mailbox.org>
In-Reply-To: <DG1159ZW7WWD.1S10T841PJ8PX@bootlin.com>
References: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
 <20260125091540.8808-1-patrick.vogelaar.dev@mailbox.org>
 <DG1159ZW7WWD.1S10T841PJ8PX@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] openssh: add variable for key path
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: b5f606575d860724988
X-MBO-RS-META: qr8bmrgjes5njj1mbfewwmbh6tzzdg61
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230235

Hi Antonin,

> Antonin Godard <antonin.godard@bootlin.com> hat am 29.01.2026 12:17 CET geschrieben:
> 
>  
> Hi,
> 
> On Sun Jan 25, 2026 at 10:15 AM CET, Patrick Vogelaar via lists.openembedded.org wrote:
> > This patch adds a variable for the key directory path. This is especially
> > useful when working with a read-only file system where you want to
> > specify the location e.g. on a r/w partition. To be consistent, the
> > change was also done for the read write path.
> >
> > For changing the path simply create a bbappend and override the
> > variable.
> >
> > Signed-off-by: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
> > ---
> >  .../openssh/openssh_10.2p1.bb                    | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> > index 866129573f..d8ea487ae3 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> > @@ -99,6 +99,10 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
> >  # We don't want to depend on libblockfile
> >  CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
> >  
> > +# This allows overriding the key location
> > +OPENSSH_HOST_KEY_DIR_READONLY_CONFIG ?= "/var/run/ssh"
> > +OPENSSH_HOST_KEY_DIR ?= "/etc/ssh"
> 
> Thanks for the patch, it was merged in master. As a follow-up, could you
> send patches to document these variables in
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst?
> 
> And add a note here
> https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/release-notes-6.0.rst#n24?

I will send a patch that documents the variable. But I don't know where to put it in the release notes. Can you guide me to the section where this would fit in.

> 
> Thanks!
> Antonin
> 
> -- 
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks
Patrick

