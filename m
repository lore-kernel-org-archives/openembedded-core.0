Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23512731C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 16:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FGw2xI019251; Mon, 15 Feb 2016 16:58:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 07aFine9TaVx; Mon, 15 Feb 2016 16:58:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FGw12m019248
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Feb 2016 16:58:02 GMT
Message-ID: <1455555481.16142.424.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Feb 2016 16:58:01 +0000
In-Reply-To: <CABcZANmkyA_RYbjtHRirU1iByBJ44srcdLR360Neke+vGAjukA@mail.gmail.com>
References: <1455551116.16142.420.camel@linuxfoundation.org>
	<CABcZANmkyA_RYbjtHRirU1iByBJ44srcdLR360Neke+vGAjukA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] ed_0.5: Handle --disable-static option
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
X-List-Received-Date: Mon, 15 Feb 2016 16:58:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-15 at 16:47 +0000, Christopher Larson wrote:
> 
> 
> On Mon, Feb 15, 2016 at 8:45 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Also clean up use of immediate expansion as there are cleaner
> > mechanisms now.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes
> > -extended/ed/ed_0.5.bb
> > index 143e636..e2df13f 100644
> > --- a/meta/recipes-extended/ed/ed_0.5.bb
> > +++ b/meta/recipes-extended/ed/ed_0.5.bb
> > @@ -15,7 +15,6 @@ inherit autotools texinfo
> > 
> >  EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}'
> > 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
> > 
> > -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('-
> > -disable-dependency-tracking', ' ')}"
> > -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('-
> > -disable-silent-rules', ' ')}"
> > -
> > -
> > +CONFIGUREOPTS_remove = "--disable-dependency-tracking"
> > +CONFIGUREOPTS_remove = "--disable-silent-rules"
> > +EXTRA_OECONF_remove = "--disable-static"
> This will be impossible to undo in a bbappend.. 

I appreciate that and we've talked about ways we likely need to extend
the API for that.

In this case, I would ask why would anyone want/need to add in a
configure option which configure doesn't support?

I guess someone could patch it, however if they do that, the could also
pick a different option name.

Cheers,

Richard



