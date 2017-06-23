Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF10780EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 15:07:52 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f28so6848544lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h675B3/usncCpIYYc2kGdf2vryuGTsfyYu5hc0Dd/Ag=;
	b=Iy/7Yi0TydB2gMgBQ2ugWqg6k/DzYP4XL0m3BGIbG/xtFyqEfBoxrMVbaQAf00ey65
	hHFpBY7dTGwUfCReowFK/bfbt6uIHwfBY0EJEh5NySHAa27CAJJ2Vq6u038eZz8Fi0UM
	u3Ni0hQ3UrVse6cRv+wWYhzkYpZ7KrcCC+LV66cixJg+v84PnYc67xMSVHsBXTaPsbzw
	EUZt/ky1Gx9T06fpFN1cK+p9Y11593G42Qp7ZHJ5wequp3QEW0UXo89ydoEsyubqoJbL
	bdWTssiO26Dj1Aq0Sy7sOJVK74WzWDAG9JkaiuU3GDp256DOFj15tPlcOiLVM26E/1H4
	QHxg==
X-Gm-Message-State: AKS2vOwpMzCNRvsktYgrJ3Laq/jlMuMq29tn6JxKj9LkdvJrRwvWWfge
	mq/n3RD4ccALHFxL/0E=
X-Received: by 10.80.216.10 with SMTP id o10mr6414693edj.81.1498230472978;
	Fri, 23 Jun 2017 08:07:52 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f48sm2478953ede.45.2017.06.23.08.07.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Jun 2017 08:07:52 -0700 (PDT)
Message-ID: <1498230471.25895.24.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 16:07:51 +0100
In-Reply-To: <1498230923.31575.84.camel@linux.intel.com>
References: <20170623145924.21097-1-git@andred.net>
	<1498230923.31575.84.camel@linux.intel.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] selftest/archiver: add tests for recipe type filtering
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
X-List-Received-Date: Fri, 23 Jun 2017 15:07:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-23 at 10:15 -0500, Leonardo Sandoval wrote:
> On Fri, 2017-06-23 at 15:59 +0100, André Draszik wrote:
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > The archiver used to be able to filter based on COPYLEFT_RECIPE_TYPES.
> > 
> > Unfortunately, this got broken with the fix for
> >   https://bugzilla.yoctoproject.org/show_bug.cgi?id=6929
> > in commit ae9102bda398 ("copyleft_filter.bbclass: Allow to filter on
> > name")
> > 
> > Add two tests to prevent that from happening again.
> > 
> > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/archiver.py | 78
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/archiver.py
> > b/meta/lib/oeqa/selftest/cases/archiver.py
> > index 70c7282f22..9f686debe6 100644
> > --- a/meta/lib/oeqa/selftest/cases/archiver.py
> > +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> > @@ -39,3 +39,81 @@ class Archiver(OESelftestTestCase):
> >          # Check that exclude_recipe was excluded
> >          excluded_present = len(glob.glob(src_path + '/%s-*' %
> > exclude_recipe))
> >          self.assertFalse(excluded_present, 'Recipe %s was not
> > excluded.' % exclude_recipe)
> > +
> > +
> > +    @testcase(2012)
> 
> I believe the testcase ID is related to testopia, not sure if you
> consider this. Usually, the QA team is the one assigning these numbers.

No, I just picked the next available number :-)

A.


