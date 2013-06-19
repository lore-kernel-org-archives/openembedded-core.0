Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB2F601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:49:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J9tjt3012288; Wed, 19 Jun 2013 10:55:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MuLmZruOfNZ4; Wed, 19 Jun 2013 10:55:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J9tcR6012274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 10:55:39 +0100
Message-ID: <1371635360.20823.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Jun 2013 10:49:20 +0100
In-Reply-To: <20130619092952.GF14021@jama>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
	<20130619092952.GF14021@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
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
X-List-Received-Date: Wed, 19 Jun 2013 09:49:39 -0000
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

No, SUMMARY is meant to be the short oneline and DESCRIPTION is the
multiline one afaik...

Cheers,

Richard

> is opkg-utils (package-index) working with this? Newlines in SUMMARY
> were causing incorrect parsing and not using cache IIRC, not sure if the
> fix for that was generic enough to cover DESCRIPTION.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



