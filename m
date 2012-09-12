Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1TBsuL-0006m7-H9
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 21:47:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8CJYrES010505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2012 12:34:53 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 12 Sep 2012 12:34:53 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Saul Wold <sgw@linux.intel.com>, <scott.a.garman@intel.com>
Date: Wed, 12 Sep 2012 15:35:19 -0400
Message-ID: <32086337.ec4RMj2Chr@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic; KDE/4.8.4; x86_64; ; )
In-Reply-To: <5050D255.9030401@linux.intel.com>
References: <1347457260-25574-1-git-send-email-mark.asselstine@windriver.com>
	<5050D255.9030401@linux.intel.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: remove unused 'etc' directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 19:47:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On September 12, 2012 11:20:05 Saul Wold wrote:
> I assume this patch is for Denzil?  It seems that the current OE-Core
> master has etc in that list.
> 
> Please confirm
> 
> Sau!

Saul,

Sorry I got mixed up on my branches there and didn't notice your change, 
thanks for straightening me out. Scott any chance we can get Saul's commit 
963742f5a9bc [kernel: Fix packaging issue] cherry-picked to Denzil?

Mark

> 
> On 09/12/2012 06:41 AM, Mark Asselstine wrote:
> > Along with checks to remove empty modprobe.d and modules-load.d
> > directories we can add a similar check and removal of the etc
> > directory. This will avoid warnings by the sanity checker.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> > 
> > There is some concern that removing this directory could cause issues
> > if folks are adding to etc in a bbappend and not checking for and
> > creating this directory. I don't believe this is an issue as if you
> > want to add something to etc it should be done as part of a
> > populate_packages_prepend or earlier since there are sanity checks run
> > as part of populate_packages, so the removal here is being done at the
> > latest possible point in the process (populate_packages_prepend in a
> > bbappend will run before the populate_packages_prepend in
> > kernel.bbclass).
> > 
> >   meta/classes/kernel.bbclass |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 5e04fda..decf6f5 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -468,7 +468,7 @@ python populate_packages_prepend () {
> > 
> >       # avoid warnings. removedirs only raises an OSError if an empty
> >       # directory cannot be removed.
> >       dvar = d.getVar('PKGD', True)
> > 
> > -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" %
> > (dvar)]:> 
> > +    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % 
(dvar), "%s/etc/" % (dvar)]:
> >           if len(os.listdir(dir)) == 0:
> >               os.rmdir(dir)


