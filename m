Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <765de6dc354a9b84f50baf5ad2a5db6d56c0ee08.camel@gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] boost-native: fix build on recent host distros
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Date: Mon, 04 Apr 2022 09:16:09 +0200
In-Reply-To: <CA+chaQdHK-KBh3PZO8tJPMmJrpJbPbAVvy72QTDeMM0ab=L9vg@mail.gmail.com>
References: <20220403151409.2664838-1-adrian.freihofer@siemens.com>
	 <CA+chaQdHK-KBh3PZO8tJPMmJrpJbPbAVvy72QTDeMM0ab=L9vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Martin Jansa <martin.jansa@gmail.com>, steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org

@Steve Please ignore this patch in favor of the patch from Martin which
is more complete than mine.

On Sun, 2022-04-03 at 18:25 +0200, Martin Jansa wrote:
> I've already sent fix for this earlier this week,
> see https://lists.openembedded.org/g/openembedded-core/message/163944
> 
> On Sun, Apr 3, 2022 at 5:14 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > The same build error as reported with Solaris occurred on a Fedora
> > 35
> > machine. The problem is already fixed upstream.
> > Related PR:
> >  https://github.com/boostorg/thread/pull/297
> > Related commit:
> >  
> > https://github.com/boostorg/thread/commit/e54f7e39606b807b8f9fc84fbd
> > 58cafeabea6562
> > 
> > Since the patch only deals with a build warning, it seems safe to
> > apply
> > it always not just for native builds.
> > 
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
> >  ...-elide-a-warning-that-caused-Solaris.patch | 26
> > +++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 meta/recipes-support/boost/files/0001-Revert-
> > change-to-elide-a-warning-that-caused-Solaris.patch
> > 
> > diff --git a/meta/recipes-support/boost/boost_1.72.0.bb
> > b/meta/recipes-support/boost/boost_1.72.0.bb
> > index df1cc16937..23595da930 100644
> > --- a/meta/recipes-support/boost/boost_1.72.0.bb
> > +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> > @@ -9,4 +9,5 @@ SRC_URI += " \
> >             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> >             file://0001-revert-cease-dependence-on-range.patch \
> >             file://0001-added-typedef-executor_type.patch \
> > +         
> >  file://0001-Revert-change-to-elide-a-warning-that-caused-Solaris.p
> > atch \
> >             "
> > diff --git a/meta/recipes-support/boost/files/0001-Revert-change-
> > to-elide-a-warning-that-caused-Solaris.patch b/meta/recipes-
> > support/boost/files/0001-Revert-change-to-elide-a-warning-that-
> > caused-Solaris.patch
> > new file mode 100644
> > index 0000000000..97111ce2f8
> > --- /dev/null
> > +++ b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-
> > a-warning-that-caused-Solaris.patch
> > @@ -0,0 +1,26 @@
> > +From 019dd7cea49659e45e12d2b44480c133372ab401 Mon Sep 17 00:00:00
> > 2001
> > +From: Rob Boehne <robb@datalogics.com>
> > +Date: Wed, 20 Nov 2019 11:25:20 -0600
> > +Subject: [PATCH] Revert change to elide a warning that caused
> > Solaris builds
> > + to fail.
> > +
> > +---
> > + boost/thread/pthread/thread_data.hpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/boost/thread/pthread/thread_data.hpp
> > b/boost/thread/pthread/thread_data.hpp
> > +index aefbeb43c..bc9b1367a 100644
> > +--- a/boost/thread/pthread/thread_data.hpp
> > ++++ b/boost/thread/pthread/thread_data.hpp
> > +@@ -57,7 +57,7 @@ namespace boost
> > + #else
> > +           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
> > + #endif
> > +-#if PTHREAD_STACK_MIN > 0
> > ++#ifdef PTHREAD_STACK_MIN
> > +           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
> > + #endif
> > +           size = ((size+page_size-1)/page_size)*page_size;
> > +-- 
> > +2.35.1
> > +

