Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1373.1589926424417432580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 15:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A6DE40C14;
	Tue, 19 May 2020 22:13:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqag3yYqhFTI; Tue, 19 May 2020 22:13:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44D6040ADE;
	Tue, 19 May 2020 22:13:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A360C17316F; Tue, 19 May 2020 18:13:40 -0400 (EDT)
Date: Tue, 19 May 2020 18:13:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
Message-ID: <20200519221340.GA17660@denix.org>
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 11:02:46PM +0100, Richard Purdie wrote:
> On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
> > in case the opkg command fails in before no output of the tool
> > itself was printed to assist the user with debugging the issue.
> > Print all output of the tool by using CalledProcessError wrapper around
> > the call
> > 
> > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > ---
> >  meta/classes/package_ipk.bbclass | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> > index c008559e4a..5e7d552cc5 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
> >              conffiles.close()
> >  
> >          os.chdir(basedir)
> > -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> > -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> > -                                stderr=subprocess.STDOUT,
> > -                                shell=True)
> > +        try:
> > +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> > +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> > +                                    stderr=subprocess.STDOUT,
> > +                                    shell=True)
> > +        except subprocess.CalledProcessError as exp:
> > +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
> >  
> >          if d.getVar('IPK_SIGN_PACKAGES') == '1':
> >              ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> 
> I get the feeling we have a problem with our subprocess calls and
> debugging but its hard to know what to do about it. We can patch each
> call site like this but it starts to make we wonder whether we need a
> general wrapper, or we're missing something in bitbake or elsewhere to
> help with things.
> 
> There is this code:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
> 
> which is meant to help but it clearly isn't helping/catching all cases.
> 
> I think we are going to need to look at a wider/more general solution
> or at least have a plan for one.

I would just like to add my +1 here - debugging opkg errors was quite 
challenging at times due to inadequate logs. While other areas of the 
project have seen tremendous improvements in the meaningful logs 
department, poor old opkg was lacking. So, a more generic approach may 
be required - I'm all for it.

-- 
Denys


> Cheers,
> 
> Richard
> 

> 

