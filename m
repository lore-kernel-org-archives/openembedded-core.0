Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78E3261B8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:40:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a132so1716410wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=imF2MgCyPDSYnYQmfmNbqgNv89wFH6JrR0TD8B8ZnzM=;
	b=UOPs0jHOejN0S5ZCqu7FRbK83CCaHaGgXg7gpLiAHE3m3NUjMLnLPIJ6KK4ZyLipDB
	r54p3XOgKfQEfAZKtOOx054STwmmik1/QwuqfZ0zL5wIqXvTocQvnLvF5hsN+3EjMBzc
	QNMxlHH83dJ68mA14OaZwuUtmtpWYQXWqUl4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=imF2MgCyPDSYnYQmfmNbqgNv89wFH6JrR0TD8B8ZnzM=;
	b=omQjgSBvBDXUpz3RVqcifgwo/xWPoa5EseiHoEAjwSscswWD29zOKS31g6Kbhvs3Ox
	eVw90gfUPZ42AYVmikZhx/bUAtSoVoNr0aoeYWP6hrQRp4II10U+5i3JmFrVWPgnmxuP
	9KxxxhyDf6KgGLif9U/4C+hE1waXxzhL8CvOw7QbniGAMELniACUFfeA5sL43KTNsJZy
	VBfahCETLbq7ooDFJH5mSbDkE4w4kNCP9KtXEKjiua8XYYvEfG/55SVBgp+10bIH9FxW
	vhdHh/cYFO8BIrrh50H3kvVvpkmyjWfHFhRH/UNjBLnMLVl7XSKi3BBxERcCmMrU4ocr
	hWUw==
X-Gm-Message-State: ANhLgQ10uMKOnNcL3D31gu9U0XpNHloY6+FZQzpd9VMq/MBMVv4WdleN
	V5ZRtdHG1JmpGYcC4C+7EI7PCPcg0IQsCGA5
X-Google-Smtp-Source: ADFU+vvUGEZoRL15v2jQe194V/TxuSya1+0REB6MJBP3Nl+Qj4juzdifrHXwslQYmevP9iPknMZ68A==
X-Received: by 2002:a1c:9e10:: with SMTP id h16mr3384579wme.44.1583926832140; 
	Wed, 11 Mar 2020 04:40:32 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	v15sm3958616wrm.32.2020.03.11.04.40.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:40:31 -0700 (PDT)
Date: Wed, 11 Mar 2020 11:40:28 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200311114028.31344b22@ub1910>
In-Reply-To: <a6f3718866f85a6208023b253bec26bf6b5d4172.camel@linuxfoundation.org>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-3-pbarker@konsulko.com>
	<a6f3718866f85a6208023b253bec26bf6b5d4172.camel@linuxfoundation.org>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] archiver.bbclass: Make do_deploy_archives a recursive dependency
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
X-List-Received-Date: Wed, 11 Mar 2020 11:40:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2020 23:18:33 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
> > To ensure that archives are captured for all dependencies of a typical
> > bitbake build we add do_deploy_archives to the list of recursive
> > dependencies of do_build. Without this, archives may be missed for
> > recipes such as gcc-source which do not create packages or populate a
> > sysroot.
> > 
> > do_deploy_archives is also added to the recursive dependencies of
> > do_populate_sdk so that all sources required for an SDK can be captured.
> > 
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  meta/classes/archiver.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> > index fef7ad4f62..c11d36d708 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -604,7 +604,9 @@ addtask do_ar_configured after do_unpack_and_patch
> >  addtask do_ar_mirror after do_fetch
> >  addtask do_dumpdata
> >  addtask do_ar_recipe
> > -addtask do_deploy_archives before do_build
> > +addtask do_deploy_archives
> > +do_build[recrdeptask] += "do_deploy_archives"
> > +do_populate_sdk[recrdeptask] += "do_deploy_archives"  
> 
> We implemented the --runall option to bitbake to try and avoid having
> recrdeptask versions of most tasks. Does that not work here? It should
> also work for the SDK I think?

If the archiver is enabled, its tasks should be in the dependency tree of
whatever you're building so that you don't need to invoke bitbake twice to
produce the required artifacts. For images that's the way the archiver has
always worked, if it's enabled then you just need to do `bitbake image` to
build the image and deploy the source archives. This change just extends that
behaviour to cover other things we can build and ensures that we don't miss
sources for recipes like gcc-source.

-- 
Paul Barker
Konsulko Group

