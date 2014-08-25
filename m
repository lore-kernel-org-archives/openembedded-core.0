Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8227E6ACBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 17:48:00 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so21665821pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WDIObNG49FYNmiCqUhn6pqzraZMRXUwtMO9qTxNSMfA=;
	b=Y80DDMBqgVBNr63VajUgYWKZTm3HoIaksCPud33m6JVfc0RQ8kvzDMrUt6MbI8PmJn
	zPj1MlwLXT7b5YEjOME8PZ9D0SKFEEVAI5DZt0A5CrDLm5DTQpZagF7rVlOp99ST9uXY
	820JE09lxtywABBaYInVIMUYJhVF3kecye8FMjTJV688/4lJbomX2QSLstt2bD7mKEUQ
	Py37q4byxKhYR0FCTn1+rgvcmAjx3EhwCqp4wxmLlvLoJ/HMQ5SJT4Rx9cux7iZiSO8u
	KLnD9afzBPRiUz0MLar6HFAf4J4CZCVUx0c+rA23/8gvrZCUmW8Jzoc2Ua0CXuBF0vc8
	Fdyw==
X-Received: by 10.70.19.166 with SMTP id g6mr30117559pde.99.1408988881626;
	Mon, 25 Aug 2014 10:48:01 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id pd7sm1527163pac.33.2014.08.25.10.48.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 10:48:00 -0700 (PDT)
Date: Mon, 25 Aug 2014 10:51:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20140825175147.GB25050@haswell>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
	<20140825171945.GA25050@haswell>
	<CABcZAN=x7u=gF=-NfbBNLUcqvXgzte_CK_52rQGYikaNSXqU_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=x7u=gF=-NfbBNLUcqvXgzte_CK_52rQGYikaNSXqU_A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Mon, 25 Aug 2014 17:48:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-25 10:21:31, Christopher Larson wrote:
> On Mon, Aug 25, 2014 at 10:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On 14-08-25 21:22:04, Fahad Usman wrote:
> > > Needed to quiet GNU_HASH warnings, amd some minor fixes.
> > >
> > > Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
> > > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > > ---
> > >  meta/recipes-extended/logrotate/logrotate_3.8.7.bb |   18
> > ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > > index 3a6a228..42cd764 100644
> > > --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > > +++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> > > @@ -16,7 +16,21 @@ SRC_URI = "
> > https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
> > >  SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
> > >  SRC_URI[sha256sum] =
> > "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
> > >
> > > -EXTRA_OEMAKE = ""
> > > +# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
> > > +# optimization variables, so use it rather than EXTRA_CFLAGS.
> > > +EXTRA_OEMAKE = "\
> > > +    LFS= \
> > > +    OS_NAME='${OS_NAME}' \
> > > +    \
> > > +    'CC=${CC}' \
> >
> > hmmm CC may have spaces in it so you might need 'CC="${CC}"' or somesuch
> 
> 
> Nope, the whole CC=${CC} argument is already quoted, note the single quotes
> around it. Those quotes mean the entire CC=${CC} bit ends up in the
> appropriate argument for make, so there's no need to quote the value alone.

What happens inside makefile is what I am concerned
in case of python, IIRC it passed it but when CC was used it would
freak out since CC now was a multiword str but then those were not inside makefiles
if you have verified thats fine here then I am OK.

