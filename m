Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF8236AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2PAXELu030205; Fri, 25 Mar 2016 10:34:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2Fq9iKGS1qdR; Fri, 25 Mar 2016 10:34:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2PAY7Me030257
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Mar 2016 10:34:08 GMT
Message-ID: <1458902047.3073.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>
Date: Fri, 25 Mar 2016 10:34:07 +0000
In-Reply-To: <CANwerB0VbgB=vP0mWjTNfMrOHSDF46btrO1L9b5zBS+eKssEVA@mail.gmail.com>
References: <1458887112-27434-1-git-send-email-net147@gmail.com>
	<1458896056.3073.45.camel@linuxfoundation.org>
	<CANwerB1wqVPz4CgP24AuUOkKkxnwakaQPYtQmgWG_Lb10z1H_w@mail.gmail.com>
	<1458898011.3073.48.camel@linuxfoundation.org>
	<CANwerB0VbgB=vP0mWjTNfMrOHSDF46btrO1L9b5zBS+eKssEVA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 10:34:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 21:29 +1100, Jonathan Liu wrote:
> Hi Richard,
> 
> On 25 March 2016 at 20:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2016-03-25 at 19:58 +1100, Jonathan Liu wrote:
> > > Hi Richard,
> > > 
> > > On 25 March 2016 at 19:54, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Fri, 2016-03-25 at 17:25 +1100, Jonathan Liu wrote:
> > > > > Python support was not being enabled because of a conflicting
> > > > > --without-python configure argument in OE_EXTRACONF.
> > > > > 
> > > > > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > > > > ---
> > > > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > > b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > > index ae97759..6fd3e3e 100644
> > > > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > > @@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core
> > > > > nativesdk
> > > > > -python-lang nativesdk-python-
> > > > > 
> > > > >  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
> > > > > 
> > > > > +EXTRA_OECONF_remove = "--without-python"
> > > > >  EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
> > > > 
> > > > Would a PACKAGECONFIG += "python" have the same effect?
> > > > 
> > > > Cheers,
> > > > 
> > > > Richard
> > > > 
> > > > 
> > > > 
> > > 
> > > No, it wouldn't. It would depend on python and python-codecs then
> > > fail
> > > when building SDK.
> > 
> > Ok, I still don't think the above is the right fix though as it
> > still
> > leaves things fragile, if for example I try and enable python for
> > gdb
> > by default on target.
> > 
> > I think we may need to do something like:
> > 
> > -PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without
> > -python,python,python python-codecs"
> > + PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,-
> > -without
> > -python,python,${GDBPYTHON_RDEPENDS}"
> > 
> > +GDBPYTHON_RDEPENDS = "python python-codecs"
> > 
> > and then set:
> > 
> > GDBPYTHON_RDEPENDS = ""
> > PACKAGECONFIG += "python"
> > 
> > in the cross recipes.
> > 
> > Would that work?
> > 
> > Cheers,
> > 
> > Richard
> 
> The path to python is different too.
> gdb-cross.inc: EXTRA_OECONF +=
> "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
> gdb-cross-canadian.inc: EXTRA_OECONF_append = " --with
> -python=${WORKDIR}/python"
> 
> Does it really make sense to have these PACKAGECONFIG options in a
> common include?
> babeltrace for example doesn't have have BBCLASSEXTEND for native and
> nativesdk.
> 
> I wonder if the commit should just be reverted.

The original code had other bugs and was very confused about other
options which should have been enabled or not enabled in various
combinations. So whilst we could revert it, it just swaps this issue
for others.

Given your comments above, I think the best option might be to set:

PACKAGECONFIG += "python"
PACKAGECONFIG[python] = "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python,--without-python,python"

in gcc-cross-canadian since that should correctly override the problem
cases yet make it clearer what is going on. A comment about it would
also likely be good.

Cheers,

Richard


