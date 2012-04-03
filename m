Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SF4ig-00008X-Ky for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 16:28:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33EJE3c022709;
	Tue, 3 Apr 2012 15:19:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22446-02; Tue,  3 Apr 2012 15:19:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33EJ3pt022703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 Apr 2012 15:19:06 +0100
Message-ID: <1333462741.11559.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 03 Apr 2012 15:19:01 +0100
In-Reply-To: <4F7AC946.5060704@dresearch-fe.de>
References: <1333056489.18082.31.camel@ted>
	<1333100747-19358-1-git-send-email-sledz@dresearch-fe.de>
	<4F7AC946.5060704@dresearch-fe.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] docbook-utils-native: fix syntax problem in jw.in
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
X-List-Received-Date: Tue, 03 Apr 2012 14:28:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-03 at 11:56 +0200, Steffen Sledz wrote:
> On 30.03.2012 11:45, Steffen Sledz wrote:
> > Fix runtime error occurred e.g. with docbook-to-man calls:
> > 
> >   grep: character class syntax is [[:space:]], not [:space:]
> >   grep: character class syntax is [[:space:]], not [:space:]
> >   jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
> > 
> > See also:
> > 
> >    <https://qa.mandriva.com/show_bug.cgi?id=61127>
> > 
> > Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> > ---
> >  .../docbook-utils/docbook-utils-0.6.14/re.patch    |   29 ++++++++++++++++++++
> >  .../docbook-utils/docbook-utils-native_0.6.14.bb   |    7 +++-
> >  2 files changed, 34 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> > 
> > diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> > new file mode 100644
> > index 0000000..db079d6
> > --- /dev/null
> > +++ b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> > @@ -0,0 +1,29 @@
> > +Upstream-Status: Pending
> > +
> > +Fix runtime error occurred e.g. with docbook-to-man calls:
> > +
> > +  grep: character class syntax is [[:space:]], not [:space:]
> > +  grep: character class syntax is [[:space:]], not [:space:]
> > +  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
> > +
> > +See also:
> > +
> > +   <https://qa.mandriva.com/show_bug.cgi?id=61127>
> > +
> > +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> > +
> > +diff -Nurd docbook-utils-0.6.14-orig/bin/jw.in docbook-utils-0.6.14/bin/jw.in
> > +--- docbook-utils-0.6.14-orig/bin/jw.in	2012-03-29 07:50:00.789564826 +0200
> > ++++ docbook-utils-0.6.14/bin/jw.in	2012-03-29 07:52:10.371302967 +0200
> > +@@ -80,9 +80,9 @@
> > + SGML_CATALOGS_DIR="/etc/sgml"
> > + if [ -f "$SGML_CONF" ]
> > + then
> > +-  RE='^[:space:]*SGML_BASE_DIR[:space:]*=[:space:]*'
> > ++  RE='^[[:space:]]*SGML_BASE_DIR[[:space:]]*=[[:space:]]*'
> > +   SGML_BASE_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
> > +-  RE='^[:space:]*SGML_CATALOGS_DIR[:space:]*=[:space:]*'
> > ++  RE='^[[:space:]]*SGML_CATALOGS_DIR[[:space:]]*=[[:space:]]*'
> > +   SGML_CATALOGS_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
> > + fi
> > + 
> > diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> > index 96459dc..2a89479 100644
> > --- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> > +++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> > @@ -7,9 +7,12 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >  DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
> >  
> > -PR = "r2"
> > +PR = "r3"
> >  
> > -SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
> > +SRC_URI = "\
> > +	ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz \
> > +	file://re.patch \
> > +"
> >  
> >  SRC_URI[md5sum] = "6b41b18c365c01f225bc417cf632d81c"
> >  SRC_URI[sha256sum] = "48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9"
> 
> Ping!

I didn't get replies sent out, sorry but this patch was merged to
master.

Cheers,

Richard




