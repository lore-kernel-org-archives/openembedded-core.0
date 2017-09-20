Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D542C77C29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:29:27 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so1141351wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PE3JhOBgUISb20ntOGzWq+znIreK2DOVX22xcVttF64=;
	b=FZTCnj80lp6LiBfbRubfF8QLynr5h/lUJkCOVnkUF2jRho/7zvYFNQrWTfd9k9QzWS
	NRwYQArK2EgETOykZAxdct5xqqsspsADHLpRTT3cr3Gzj58680NthtYQRMYbVMLL1p8v
	xSDz9EogZjMYFAtqneo+AM+zlWlLARhwhOpP3YP+8gMpP0egg8wqUgIvGokRg/LbfTHu
	ZAhSxK2jgiungvaYp01lv9rFSpUcAIuV5WS3YV179cDIQ0r/EeH07+XzP2b9Qzhf6SNp
	UOcHF6AMv7jbVwlz33cW1Q+lzp3gQdO3tqkd/2rgc5CS6Wxui0zWkni6i1dfIdyRR9WX
	PKqw==
X-Gm-Message-State: AHPjjUi9+TsjnOw6hCB7gJ/xiwgVamKX/W7pPWyjrfxUrKrm4ZyLtPBr
	tfNRydDjD/n7qnEF+3jqO7Y=
X-Google-Smtp-Source: AOwi7QAGKHCJ5qkh0hjWFFpK2aI2VLLdjmv60koeMOlfa1O+rze9j/3QHEn2We7W+6p3T1aQ1kEmsw==
X-Received: by 10.223.143.110 with SMTP id p101mr3756379wrb.182.1505899768562; 
	Wed, 20 Sep 2017 02:29:28 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y5sm1238093wmg.6.2017.09.20.02.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Sep 2017 02:29:27 -0700 (PDT)
Message-ID: <1505899714.19222.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Sep 2017 10:28:34 +0100
In-Reply-To: <1504597240.29140.10.camel@andred.net>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
	<1504597240.29140.10.camel@andred.net>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] useradd-staticids: don't create username-group if	gid is specified
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
X-List-Received-Date: Wed, 20 Sep 2017 09:29:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Tue, 2017-09-05 at 08:40 +0100, André Draszik wrote:
> On Mon, 2017-09-04 at 10:22 +0000, Peter Kjellerstedt wrote:
> > > 
> 
> [...]
> > > diff --git a/meta/classes/useradd-staticids.bbclass
> > > b/meta/classes/useradd-staticids.bbclass
> > > index ce4ac62ab5..1b61a8bf9b 100644
> > > --- a/meta/classes/useradd-staticids.bbclass
> > > +++ b/meta/classes/useradd-staticids.bbclass
> > > @@ -102,7 +102,7 @@ def update_useradd_static_config(d):
> > >              # So if the implicit username-group creation is on, then
> > > the implicit groupname (LOGIN)
> > >              # is used, and we disable the user_group option.
> > >              #
> > > -            user_group = uaargs.user_group is None or
> > > uaargs.user_group
> > > is True
> > > +            user_group = uaargs.gid is None or uaargs.user_group is
> > > True
> > 
> > Hmm, I believe that should be:
> > 
> >             user_group = uaargs.gid is None and uaargs.user_group is
> > None
> > or uaargs.user_group is True
> > 
> > I.e., if neither --gid nor --user-group is specified, then it should 
> > treat it as if --user-group was specified.
> 
> Hm, isn't this still the same as 
> 
> user_group = uaargs.gid is None or uaargs.user_group is True
> 
> ? If neither --gid nor --user-group is specified, then gid is None, so it
> will do what you want already. IOW, unless the group name (gid) is
> specified, a username-group is being created.
> 
> 
> Cheers,
> Andre'
> 

