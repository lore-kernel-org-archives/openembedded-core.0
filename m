Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0AED56FF5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 18:15:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4BIFvr3013279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 May 2016 11:15:57 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 May 2016 11:15:56 -0700
To: Christopher Larson <kergoth@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
	<b5bb8c60-377b-8885-54e8-aecdde4b94db@windriver.com>
	<CABcZANmj9PDNgLamFtJLyJ9CSBPC8u5Onpk_=mqhkwbdGbuxaw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <52f70664-5981-b80c-a596-1cda00506554@windriver.com>
Date: Wed, 11 May 2016 13:15:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmj9PDNgLamFtJLyJ9CSBPC8u5Onpk_=mqhkwbdGbuxaw@mail.gmail.com>
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Wed, 11 May 2016 18:15:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 5/11/16 12:14 PM, Christopher Larson wrote:
> Hmm, interesting. It doesn't actually appear to be using LDFLAGS from the
> environment at all just now. I'll take another look. Thanks.

CFLAGS and LDFLAGS should have been loaded and sanitized by the 'configure'
front end.  If this is not happening any longer -- then behavior has changed (or
my understanding of the behavior is wrong.)

End result, everything specified in CFLAGS and LDFLAGS that is machine neutral
(i.e. not -m32, or -march=i586) should be preserved and used (unless
specifically removed for another reason.)

--Mark

> On Wed, May 11, 2016 at 9:33 AM Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 5/11/16 11:25 AM, Christopher Larson wrote:
>     > From: Christopher Larson <chris_larson@mentor.com
>     <mailto:chris_larson@mentor.com>>
>     >
>     > Signed-off-by: Christopher Larson <chris_larson@mentor.com
>     <mailto:chris_larson@mentor.com>>
>     > ---
>     >  .../pseudo/pseudo/obey-ldflags.patch               | 48
>     ++++++++++++++++++++++
>     >  meta/recipes-devtools/pseudo/pseudo_1.7.5.bb <http://pseudo_1.7.5.bb>   
>        | 16 ++++----
>     >  2 files changed, 56 insertions(+), 8 deletions(-)
>     >  create mode 100644 meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
>     >
>     > diff --git a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
>     b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
>     > new file mode 100644
>     > index 0000000..7e4c629
>     > --- /dev/null
>     > +++ b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
>     > @@ -0,0 +1,48 @@
>     > +From 0ace81a687355a3c55caa161b51972a82f5c413f Mon Sep 17 00:00:00 2001
>     > +From: Christopher Larson <chris_larson@mentor.com
>     <mailto:chris_larson@mentor.com>>
>     > +Date: Mon, 9 May 2016 17:00:57 -0700
>     > +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
>     > +
>     > +Signed-off-by: Christopher Larson <chris_larson@mentor.com
>     <mailto:chris_larson@mentor.com>>
>     > +---
>     > + Makefile.in | 8 ++++----
>     > + 1 file changed, 4 insertions(+), 4 deletions(-)
>     > +
>     > +diff --git a/Makefile.in b/Makefile.in
>     > +index 6511814..22ef625 100644
>     > +--- a/Makefile.in
>     > ++++ b/Makefile.in
>     > +@@ -109,26 +109,26 @@ pseudo: $(PSEUDO)
>     > + $(PSEUDO): $(BIN) pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o
>     pseudo_server.o pseudo_ipc.o
>     > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \
>     > +             pseudo.o pseudo_server.o pseudo_client.o pseudo_ipc.o \
>     > +-            $(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
>     > ++            $(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
> 
>     I may be wrong, but I thought the 'client_ldflags' was supposed to inherit the
>     LDFLAGS, allowing them to be sanitized.
> 
>     The issue was that pseudo was in a strange situation where it may have to build
>     both 32-bit and 64-bit clients in order to function properly.
> 
>     (Perhaps my memory is out of date and it's no longer a concern?)
> 
>     --Mark
> 
>     > +
>     > + pseudolog: $(PSEUDOLOG)
>     > +
>     > + $(PSEUDOLOG): $(BIN) pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o
>     pseudo_ipc.o
>     > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o
>     pseudo_client.o pseudo_ipc.o \
>     > +-            $(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
>     > ++            $(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
>     > +
>     > + pseudodb: $(PSEUDODB)
>     > +
>     > + $(PSEUDODB): $(BIN) pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o
>     > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDODB) pseudodb.o \
>     > +-            $(DBOBJS) $(SHOBJS) pseudo_ipc.o $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
>     > ++            $(DBOBJS) $(SHOBJS) pseudo_ipc.o $(LDFLAGS) $(DB_LDFLAGS)
>     $(CLIENT_LDFLAGS)
>     > +
>     > + libpseudo: $(LIBPSEUDO)
>     > +
>     > + $(LIBPSEUDO): $(LIB) $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS)
>     > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
>     > +             pseudo_client.o pseudo_ipc.o \
>     > +-            $(WRAPOBJS) $(SHOBJS) $(CLIENT_LDFLAGS)
>     > ++            $(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
>     > +
>     > + # *everything* now relies on stuff that's generated in the
>     > + # wrapper process.
>     > +--
>     > +2.8.0
>     > +
>     > diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
>     <http://pseudo_1.7.5.bb> b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
>     <http://pseudo_1.7.5.bb>
>     > index d90e644..dfb9b39 100644
>     > --- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb <http://pseudo_1.7.5.bb>
>     > +++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb <http://pseudo_1.7.5.bb>
>     > @@ -1,13 +1,13 @@
>     >  require pseudo.inc
>     >
>     > -SRC_URI = " \
>     > -   
>     http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2
>     <http://downloads.yoctoproject.org/releases/pseudo/$%7BBPN%7D-$%7BPV%7D.tar.bz2>
>     \
>     > -    file://0001-configure-Prune-PIE-flags.patch \
>     > -    file://fallback-passwd \
>     > -    file://fallback-group \
>     > -    file://moreretries.patch \
>     > -    file://handle-remove-xattr.patch \
>     > -"
>     > +SRC_URI =
>     "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2
>     <http://downloads.yoctoproject.org/releases/pseudo/$%7BBPN%7D-$%7BPV%7D.tar.bz2>
>     \
>     > +           file://0001-configure-Prune-PIE-flags.patch \
>     > +           file://fallback-passwd \
>     > +           file://fallback-group \
>     > +           file://moreretries.patch \
>     > +           file://handle-remove-xattr.patch \
>     > +           file://obey-ldflags.patch \
>     > +           "
>     >
>     >  SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
>     >  SRC_URI[sha256sum] =
>     "fd89cadec984d3b8202aca465898b1bb4350e0d63ba9aa9ac899f6f50270e688"
>     >
> 


