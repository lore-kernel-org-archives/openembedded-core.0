Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9876E7479D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:20:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9AKK6BS005796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 13:20:16 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 13:19:55 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Oct 2018 16:19:54 -0400
Message-ID: <4478883.5euKKaLx1P@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1soH-xPSv2mrkALN94z=6xow28YZ5JqYELmS+N9k6Et9Rg@mail.gmail.com>
References: <1539200144-19028-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1soH-xPSv2mrkALN94z=6xow28YZ5JqYELmS+N9k6Et9Rg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: Fix build issues with /tmp mounted with noexec
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
X-List-Received-Date: Wed, 10 Oct 2018 20:20:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, October 10, 2018 3:54:10 PM EDT Khem Raj wrote:
> On Wed, Oct 10, 2018 at 12:36 PM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > Since commit d297f7ebf3f6 [fribidi: use Meson instead of autotools]
> > build failures have been observed with this package. The immediate
> > issue was related to improperly named #defines per
> > https://github.com/fribidi/fribidi/commit/46f52d588ab5, however, the
> > root cause was FRIBIDI_SIZEOF_INT getting a value of "-1".
> > 
> > After searching the meson logs the following was found:
> >   Could not run: /tmp/tmp2fxe6ha1/output.exe (error: [Errno 13] Permission
> >   denied) Checking for size of "int": -1
> > 
> > Which pointed to the real root cause being /tmp mounted with noexec, a
> > common configuration on Redhat and other distros. This issues has been
> > raised in the meson community:
> > https://github.com/mesonbuild/meson/issues/2972 but is yet to be
> > addressed.
> > 
> > Using the discussion from issue#2972 and the fact that the underlying
> > code makes use of python 'tempfile' we can simply create a 'tmp'
> > directory and make use of TMPDIR to avoid this issue.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  meta/classes/meson.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index ed08a40..7e63e12 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -109,6 +109,9 @@ EOF
> > 
> >  CONFIGURE_FILES = "meson.build"
> >  
> >  meson_do_configure() {
> > 
> > +    # Work around "Meson fails if /tmp is mounted with noexec #2972"
> 
> I would call it a bug in meson not a workaround.

Definitely a bug in that it doesn't propogate as an error. On the need to 
always use meson-private, I am 50/50 on that. Since meson respects TMPDIR/TMP/
TEMP does it really need to handle this directly?

Anyway, not sure if Mark Hatle and the other build system experts will like my 
fix, I will adjust as needed if/when they weigh in.

MarkA

> 
> > +    mkdir -p "${B}/meson-private/tmp"
> > +    export TMPDIR="${B}/meson-private/tmp"
> > 
> >      bbnote Executing meson ${EXTRA_OEMESON}...
> >      if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}"
> >      ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then>      
> >          bbfatal_log meson failed
> > 
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core





