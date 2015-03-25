Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1EB26AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 19:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2PJS1vS011193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Mar 2015 12:28:01 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 25 Mar 2015 12:28:01 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 15:28:02 -0400
Message-ID: <2616204.si38TmSJD5@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.13.3 (Linux/3.13.0-46-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CABcZANnJymdXZq0m1NgAQndp+-ou7o7i+1sW5C+8ZCFtybeS4w@mail.gmail.com>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANnJymdXZq0m1NgAQndp+-ou7o7i+1sW5C+8ZCFtybeS4w@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.91]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: add a vardeps for configure on libdir
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
X-List-Received-Date: Wed, 25 Mar 2015 19:28:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On March 25, 2015 10:34:00 Christopher Larson wrote:
> On Wed, Mar 25, 2015 at 9:28 AM, Mark Asselstine <
> 
> mark.asselstine@windriver.com> wrote:
> > Configure makes use of 'libdir' to set 'openssldir'. Unfortunately
> > openssl treats this as a hardcoded absolute path. The value passed in
> > as openssl becomes part of header files and baked in to executables.
> > 
> > For target builds libdir is not something that changes and for -native
> > builds unless you move your builds around you will see no issue with
> > the current implementation. If you do update libdir or if you move
> > your build or reuse sstate by copying it to a new build you will start
> > to see errors. These will be seen when you use the 'openssl' tool and
> > look like the following:
> > 
> > WARNING: can't open config file: /home/build/bitbake_build/tmp/
> > 
> >                         sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf
> > 
> > Knowing that openssl treats 'openssldir' as a hard coded absolute path
> > and that we set this in configure we must add a 'vardeps' to ensure
> > that things get re-configured and built whenever 'libdir' is
> > modified. This will fix both target and -native builds per the
> > usecases described above. If 'libdir' is unchanged things continue to
> > function as they did before and a re-configure will not happen.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  meta/recipes-connectivity/openssl/openssl.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> > b/meta/recipes-connectivity/openssl/openssl.inc
> > index d337017..105b3fa 100644
> > --- a/meta/recipes-connectivity/openssl/openssl.inc
> > +++ b/meta/recipes-connectivity/openssl/openssl.inc
> > @@ -54,6 +54,8 @@ do_configure_prepend_darwin () {
> > 
> >         sed -i -e '/version-script=openssl\.ld/d' Configure
> >  
> >  }
> > 
> > +do_configure[vardeps] += "${libdir}"
> 
> This really doesn't make sense. First of all, vardeps is a list of
> variables, but the expanded libdir is not a variable name. Perhaps you
> meant += "libdir"? 

My first attempt I had tried "libdir" and it doesn't seem to have the needed 
effect. I was hesitant to use other variables (such as those that libdir is 
derived from) as that would fork how -native and target builds would be 
handled. I had found other instances (meta/classes/package.bbclass) that 
seemed to use vardeps on expanded variables. At any rate I will circle back, 
your comment was not entirely unexpected, just the push that is needed for me 
to look more closely. I will follow up in a bit.

> Second, if libdir is used in do_configure, then changing
> it will already cause do_configure to be re-run, as bitbake tracks variable
> references. Only references which can't be tracked by bitbake need to be
> listed explicitly.

The observed behavior definitely supports the view that this is a case where 
it can't be tracked. It is definitely a different usage than you would find 
normally.

do_configure () {
...
    perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix \
       --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
}

Mark


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


