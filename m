Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 04286601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:10:05 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UpFL2-0007Ho-Ff; Wed, 19 Jun 2013 12:10:04 +0200
Message-ID: <1371636603.6580.79.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Jun 2013 11:10:03 +0100
In-Reply-To: <20130619092952.GF14021@jama>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
	<20130619092952.GF14021@jama>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package_ipk.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 19 Jun 2013 10:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 11:29 +0200, Martin Jansa wrote:
> On Wed, Jun 19, 2013 at 05:00:40AM -0400, Robert Yang wrote:
> > The recipe's DESCRIPTION is wrapped automatically by textwrap, make it
> > support newline ("\n") to let the user can wrap it manually, e.g.:
> > 
> > DESCRIPTION = "Foo1\nFoo2"
> > 
> > In the past, it would be:
> > Foo1\nFoo2
> > 
> > Now:
> > Foo1
> > Foo2
> > 
> > [YOCTO #4348]
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/classes/package_ipk.bbclass |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> > index 55628e4..e67f641 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -304,10 +304,11 @@ python do_package_ipk () {
> >                  # Special behavior for description...
> >                  if 'DESCRIPTION' in fs:
> >                      summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
> > +                    ctrlfile.write('Description: %s\n' % summary)
> >                      description = localdata.getVar('DESCRIPTION', True) or "."
> >                      description = textwrap.dedent(description).strip()
> > -                    ctrlfile.write('Description: %s\n' % summary)
> > -                    ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
> > +                    for t in description.split('\\n'):
> > +                        ctrlfile.write('%s\n' % textwrap.fill(t, width=74, initial_indent=' ', subsequent_indent=' '))
> >                  else:
> 
> Isn't DESCRIPTION supposed to be short oneline and longer multiline only
> in SUMMARY?

No, the reverse.  SUMMARY is (as the name suggests, and as the existing
code implements) meant to be the short synopsis and DESCRIPTION is the
longer text. 

> is opkg-utils (package-index) working with this? Newlines in SUMMARY
> were causing incorrect parsing and not using cache IIRC, not sure if the
> fix for that was generic enough to cover DESCRIPTION.

Newlines in SUMMARY would indeed break opkg-utils because the text after
the line break wouldn't be correctly indented.  It wouldn't be a bad
thing for package_ipk to check for that, but this shouldn't be an issue
with the patch above since it seems to be explicitly indenting all lines
of the long description.

I'm not entirely thrilled with Robert's patch because it seems rather
ugly to have embedded "\n" sequences in the recipe DESCRIPTION fields,
and also because package_ipk isn't the only consumer of that variable
and it isn't entirely obvious that all the other users will know what to
do.  But, absent a way to express string literals with embedded newlines
in bitbake, perhaps this is indeed the best compromise.

p.


