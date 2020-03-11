Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B4CEE60289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:31:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z15so2154245wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AkCX3YfXGlSfjxu0/nddL81uNzllPwuK4rMptctn1gU=;
	b=NiVkmtNZx83tU86igJXfeQivkPnDi59lZ+df+diivq7lWq3Qm8IKc9iF2sJX2sgUpV
	UOkm8TShYYaikspYO/VKJ1WP7jDfAbQw8YBKF+9J7jFN96E5krbSuTucQSK34Lw1FFlf
	v/RC+DIaY9nVQYSbObsTaJPivwKHECKMW0i2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AkCX3YfXGlSfjxu0/nddL81uNzllPwuK4rMptctn1gU=;
	b=FnZCpLUghbItX6UUxCqvH0F5tZUdLAAkz5+aSa/zRX4D6P9qEq7dOdCiR72gKHhhRV
	eoWle8Pewb/7CGmSUK8xe7QjvqPmxdc7tl5nAdMxdKCsAzWeAbWLdqLPL+6vexNk2GoX
	Gsz7eVbg46/BtUnKWHhPnWJJMF8oSesIup+10BFdVlXiBTXn6qLIul3rwytRzTdFJOwB
	ydtYrsZeSKccmPzDr6o6MJal6Io/D6zTQdH+To0/mHCp4jxtP3ixGiNKqAbv257ZOH2K
	SCqiK3Qzq4huWcjiR5HAkP0o2WE+MBC8ml4yJUMdUMhG/qg82vCMBPdxp9LOQqdJFbkp
	jlpw==
X-Gm-Message-State: ANhLgQ3/LGH43VfbMQko0Bu4f/2WMzOCeLroHjWhh9OujJOA4C/e0rw/
	yoakWE3Yx3Y2I7q3g5JTnPXEow==
X-Google-Smtp-Source: ADFU+vsLNGTmPuK15+mjx+knzzbrydSYOUfWGg+r6j3Mx1pjOm6lvCTZtmnKkt31m1r7u+69lOo5CA==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr3961926wrh.131.1583926286190; 
	Wed, 11 Mar 2020 04:31:26 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	f187sm4666546wme.31.2020.03.11.04.31.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:31:25 -0700 (PDT)
Date: Wed, 11 Mar 2020 11:31:22 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200311113122.48437206@ub1910>
In-Reply-To: <e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-2-pbarker@konsulko.com>
	<e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Wed, 11 Mar 2020 11:31:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2020 23:16:38 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
> > To fully archive a `gitsm://` entry in SRC_URI we need to also capture
> > the submodules recursively. If shallow mirror tarballs are found, they
> > must be temporarily extracted so that the submodules can be determined.
> > 
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  meta/classes/archiver.bbclass | 31 ++++++++++++++++++++++++++-----
> >  1 file changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> > index 013195df7d..fef7ad4f62 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -306,7 +306,7 @@ python do_ar_configured() {
> >  }
> >  
> >  python do_ar_mirror() {
> > -    import subprocess
> > +    import shutil, subprocess, tempfile
> >  
> >      src_uri = (d.getVar('SRC_URI') or '').split()
> >      if len(src_uri) == 0:
> > @@ -337,12 +337,10 @@ python do_ar_mirror() {
> >  
> >      bb.utils.mkdirhier(destdir)
> >  
> > -    fetcher = bb.fetch2.Fetch(src_uri, d)
> > -
> > -    for url in fetcher.urls:
> > +    def archive_url(fetcher, url):
> >          if is_excluded(url):
> >              bb.note('Skipping excluded url: %s' % (url))
> > -            continue
> > +            return
> >  
> >          bb.note('Archiving url: %s' % (url))
> >          ud = fetcher.ud[url]
> > @@ -376,6 +374,29 @@ python do_ar_mirror() {
> >          bb.note('Copying source mirror')
> >          cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
> >          subprocess.check_call(cmd, shell=True)
> > +
> > +        if url.startswith('gitsm://'):
> > +            def archive_submodule(ud, url, module, modpath, workdir, d):
> > +                url += ";bareclone=1;nobranch=1"
> > +                newfetch = bb.fetch2.Fetch([url], d, cache=False)
> > +
> > +                for url in newfetch.urls:
> > +                    archive_url(newfetch, url)
> > +
> > +            # If we're using a shallow mirror tarball it needs to be unpacked
> > +            # temporarily so that we can examine the .gitmodules file
> > +            if ud.shallow and os.path.exists(ud.fullshallow) and ud.method.need_update(ud, d):
> > +                tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
> > +                subprocess.check_call("tar -xzf %s" % ud.fullshallow, cwd=tmpdir, shell=True)
> > +                ud.method.process_submodules(ud, tmpdir, archive_submodule, d)
> > +                shutil.rmtree(tmpdir)
> > +            else:
> > +                ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
> > +
> > +    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
> > +
> > +    for url in fetcher.urls:
> > +        archive_url(fetcher, url)
> >  }  
> 
> I can't help feeling that this is basically a sign the fetcher is
> broken.
> 
> What should really happen here is that there should be a method in the
> fetcher we call into.
> 
> Instead we're teaching code how to hack around the fetcher. Would it be
> possible to add some API we could call into here and maintain integrity
> of the fetcher API?

This is gitsm-specific so the process_submodules method is probably the
correct fetcher API. We need to call back into an archiver-supplied function
for each submodule that is found.

I guess process_submodules could do the temporary unpacking of the shallow
archive and then this code would be simplified. Is that what you had in mind?

-- 
Paul Barker
Konsulko Group

