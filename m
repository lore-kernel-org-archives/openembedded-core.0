Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 957827722C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:41:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u14Kfrig027181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Feb 2016 12:41:53 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 4 Feb 2016 12:41:52 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 6E10B280261; Thu,
	4 Feb 2016 15:41:52 -0500 (EST)
Date: Thu, 4 Feb 2016 15:41:52 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160204204152.GK18489@windriver.com>
References: <1454269335-30127-1-git-send-email-paul.gortmaker@windriver.com>
	<20160204181439.GB4778@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160204181439.GB4778@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] inetutils: fix up recent build fails due to phantom empty directory
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
X-List-Received-Date: Thu, 04 Feb 2016 20:41:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [PATCH] inetutils: fix up recent build fails due to phantom empty directory] On 04/02/2016 (Thu 13:14) Joe MacDonald wrote:

> [[PATCH] inetutils: fix up recent build fails due to phantom empty directory] On 16.01.31 (Sun 14:42) Paul Gortmaker wrote:
> 
> > Recently I started getting this error:
> > 
> > | rmdir: failed to remove 'build/tmp/work/core2-64-overc-linux/inetutils/1.9.4-r0/image/usr/lib64': No such file or directory
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_install (log file is located at build/tmp/work/core2-64-overc-linux/inetutils/1.9.4-r0/temp/log.do_install.23373)
> > ERROR: Task 2 (meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb, do_install) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 818 tasks of which 723 didn't need to be rerun and 1 failed.
> > 
> > Looking at the surrounding code, it seems the empty status of this dir was
> > always considered optional.  It is unclear to me why it would have just
> > started to vanish however.
> > 
> > Since it was optional, make the return code from its removal also of
> > no relevance using a crime I've seen committed in other recipes.
> 
> I meant to respond to this as soon as I saw it, sorry about that.  Do
> you know if this change is functionally any different than adding
> --ignore-fail-on-non-empty to the rmdir command instead of the "|| true"
> thing?  If --ignore-fail corrects the problem for you, I'd rather use
> that.

Turns out that won't work, since it isn't that it is present and
non-empty, but it simply has ceased to exist. (Again, NFI why...)

So, we'd need a "--ignore-fail-on-non-exist" GNUism for this.

P.
--

> 
> -J.
> 
> > Others are free to dig deeper into the true root cause if their time
> > permits them to do so.
> > 
> > Cc: Joe MacDonald <joe_macdonald@mentor.com>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > ---
> >  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > index 50aedd30d461..68487eab7d58 100644
> > --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > @@ -79,7 +79,7 @@ do_install_append () {
> >  
> >      rm -rf ${D}${libexecdir}/
> >      # remove usr/lib if empty
> > -    rmdir ${D}${libdir}
> > +    rmdir ${D}${libdir} || true
> >  }
> >  
> >  PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
> -- 
> -Joe MacDonald.
> :wq



