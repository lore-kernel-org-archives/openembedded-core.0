Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCIBW-0007qa-1W for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 00:14:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QM5aS3001446;
	Mon, 26 Mar 2012 23:05:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00541-05; Mon, 26 Mar 2012 23:05:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QM5SbX001440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Mar 2012 23:05:30 +0100
Message-ID: <1332799529.28414.139.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 23:05:29 +0100
In-Reply-To: <4F70B998.3070405@linux.intel.com>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
	<4e31dfddbb238cd5e3c2ce19a49996e113419212.1332507302.git.Martin.Jansa@gmail.com>
	<4F70B998.3070405@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/6] kernel.bbclass: use symlinks for modutils files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 22:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 11:46 -0700, Darren Hart wrote:
> What is the motivation?
> 
> On 03/23/2012 05:56 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass |    8 +++-----
> >  1 files changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 975ae13..54ed7f7 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -407,16 +407,14 @@ python populate_packages_prepend () {
> >  		# appropriate modprobe commands to the postinst
> >  		autoload = d.getVar('module_autoload_%s' % basename, True)
> >  		if autoload:
> > -			name = '%s/etc/modutils/%s' % (dvar, basename)
> > -			f = open(name, 'w')
> > -			for m in autoload.split():
> > -				f.write('%s\n' % m)
> > -			f.close()
> >  			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> >  			f = open(name, 'w')
> >  			for m in autoload.split():
> >  				f.write('%s\n' % m)
> >  			f.close()
> > +			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
> > +			modutils_target = '../modules-load.d/%s.conf' % (basename)
> > +			os.symlink(modutils_target, modutils_name)
> 
> This basically undoes what was added in 1/2 and replaces it with
> symblinks right?
> 
> If so, just do it as symlinks in the first place.

This is one patch set its best to read in totality as the symlinks get
removed later. I thought about squashing the series but decided to leave
it for history.

Cheers,

Richard




