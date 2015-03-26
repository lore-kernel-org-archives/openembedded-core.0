Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7376013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 00:33:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q0X5xB013568
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Mar 2015 17:33:05 -0700 (PDT)
Received: from tal.localnet (128.224.21.80) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Mar 2015 17:33:05 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 20:33:03 -0400
Message-ID: <3055766.2ygai1BGpI@tal>
Organization: Wind River 
User-Agent: KMail/4.13.3 (Linux/3.13.0-45-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CABcZANnWKxuF6jGU1Zn3XwDery4+4RJRi28x5gCpH0M+LMQD8A@mail.gmail.com>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
	<2616204.si38TmSJD5@yow-masselst-d1>
	<CABcZANnWKxuF6jGU1Zn3XwDery4+4RJRi28x5gCpH0M+LMQD8A@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 26 Mar 2015 00:33:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On March 25, 2015 13:35:46 Christopher Larson wrote:
> On Wed, Mar 25, 2015 at 12:28 PM, Mark Asselstine <
> 
> mark.asselstine@windriver.com> wrote:
> > My first attempt I had tried "libdir" and it doesn't seem to have the
> > needed
> > effect. I was hesitant to use other variables (such as those that libdir
> > is
> > derived from) as that would fork how -native and target builds would be
> > handled. I had found other instances (meta/classes/package.bbclass) that
> > seemed to use vardeps on expanded variables. At any rate I will circle
> > back,
> > your comment was not entirely unexpected, just the push that is needed for
> > me
> > to look more closely. I will follow up in a bit.
> 
> package.bbclass has variables containing / functions returning lists of
> variable names. libdir isn't a list of variable names, it's a path.

Agreed. And this is why I was going back to look at it.

> 
> > Second, if libdir is used in do_configure, then changing
> > 
> > > it will already cause do_configure to be re-run, as bitbake tracks
> > 
> > variable
> > 
> > > references. Only references which can't be tracked by bitbake need to be
> > > listed explicitly.
> > 
> > The observed behavior definitely supports the view that this is a case
> > where
> > it can't be tracked. It is definitely a different usage than you would
> > find
> > normally.
> > 
> > do_configure () {
> > ...
> > 
> >     perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix \
> >     
> >        --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
> > 
> > }
> 
> Nope, this is exactly what bitbake knows how to track, a standard variable
> reference; ${libdir}. It knows that do_configure uses libdir already. It's
> only when the variable name is determined programmatically at runtime in
> python that bitbake isn't able to track the reference (e.g. d.getVar(foo +
> "bar", True)).

Using 'bitbake-dumpsig' I can confirm that 'libdir' is listed in the 
do_configure 'Task dependencies' in the sstate. This explains why with or 
without

do_configure[vardeps] += "libdir"


the outcome didn't change, the change was essentially a nop. The variable is 
definitely at play during configure, as mentioned in my commit log it is used as 
a hard coded abs path. For instance it is substituted in the package's 
crypto/opensslconf.h file.

When the sstate is reused in a different location configure needs to be rerun. 
Similarly if libdir for the target is modified it needs to rerun configure.

Any ideas why/how libdir is listed as a task dependency yet even with it 
changing the task is being rerun?

I will keep investigating.

Mark

