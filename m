Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNaMH-0002Ey-Va
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 02:47:58 +0200
Received: by pwj9 with SMTP id 9so2000244pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VLKIJgRoSkeL3rNHl2VvxcB8YjkcpoeZqFCvfPUGFGM=;
	b=mZqByoXQiWU4YuJtUymp7N+Ar6TZWBtZNQuQq73vQ5/HqOXkHntipy1k9bIb87ogsT
	a3U1u3KvOBV4ByiG7VPd/7GVFPrV6xUrk3txA7PUZa/3ZFGXduyLQKl6Y/lq2ZDnTFrJ
	51L5KwrPAgiSEfnikwIMGYTZquYZeOz4DbhaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qwmYaqsEHsI71K6Ac9P4jVyqrXQxxsaW2P+l4AEl2lKths53QzlFrgl7myhlBL+Z8r
	Xg2vfi7OU1T0k9eGwVeVIzlA/982ldSH6VR2jVgSybmlIqvR9T/RKwNNPdcdB9NEke8e
	H6PkHx44JQ7ErhteY2QfHkJLOqKV8OWOQH5W4=
Received: by 10.68.20.71 with SMTP id l7mr79508pbe.293.1305938698610;
	Fri, 20 May 2011 17:44:58 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j8sm2764818pbr.89.2011.05.20.17.44.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 17:44:57 -0700 (PDT)
Date: Fri, 20 May 2011 17:43:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110521004349.GB7504@sakrah.homelinux.org>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305934302.3424.679.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305934302.3424.679.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 00:47:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/05/11 00:31), Richard Purdie wrote:
> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
> > We enable gtk/gnome in distcc that code uses loadavg()
> > a function unimplemented in uclibc. Therefore for uclibc
> > we disable gnome and gtk+ features in distcc
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
> >  1 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > index 1f5c2af..a15858c 100644
> > --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > @@ -6,7 +6,10 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >  PR = "r6"
> >  
> > -DEPENDS = "avahi gtk+"
> > +DEPENDS = "avahi ${GTKDEP}"
> > +GTKDEP-libc-uclibc = ""
> > +GTKDEP = "gtk+"
> 
> return -ENOTTESTED;

heh, I did infact rebuild on uclibc and eglibc but I should have removed dependencies just rebuilding
after bitbake -c cleanall is not enough
> 
> ;-)
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


