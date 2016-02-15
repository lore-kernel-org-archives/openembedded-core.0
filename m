Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A90476FF86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:57:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 15 Feb 2016 06:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,450,1449561600"; 
	d="scan'208,217";a="915353210"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2016 06:57:46 -0800
Message-ID: <1455548264.3889.8.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 16:57:44 +0200
In-Reply-To: <CABcZAN=cNeb1pkE5tzc-0UB0Dgc9z1BH6Xb0qJiPPm6P+O33QA@mail.gmail.com>
References: <1455303960-7173-1-git-send-email-markus.lehtonen@linux.intel.com>
	<CABcZAN=cNeb1pkE5tzc-0UB0Dgc9z1BH6Xb0qJiPPm6P+O33QA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH] nss: define RPATH variable
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
X-List-Received-Date: Mon, 15 Feb 2016 14:57:46 -0000
Content-Type: multipart/alternative; boundary="=-WbAdAM+KCpOy9wk6CP5M"

--=-WbAdAM+KCpOy9wk6CP5M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-02-13 at 05:12 +0000, Christopher Larson wrote:
> On Fri, Feb 12, 2016 at 12:06 PM Markus Lehtonen <
> markus.lehtonen@linux.intel.com> wrote:
> > Otherwise the nss libs do not get any RPATH/RUNPATH. Consequently,
> > the
> > .so dependencies of nss libs are always searched from the base lib
> > directories of the host (i.e. /lib/ and /usr/lib). This causes
> > problems
> > with nss-native where the .so's should be searched from the base
> > lib
> > directories of the sysroot instead of the host file system.
> > 
> > This particular problem has probably been unnoticed as nss-native
> > is
> > seldom used and/or most users are likely to have nss libraries
> > installed
> > on their host system. In this case everything most likely work as
> > expected.
> > 
> > [YOCTO #9041]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  meta/recipes-support/nss/nss_3.21.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes
> > -support/nss/nss_3.21.bb
> > index 552fd6c..8b9fb71 100644
> > --- a/meta/recipes-support/nss/nss_3.21.bb
> > +++ b/meta/recipes-support/nss/nss_3.21.bb
> > @@ -91,12 +91,16 @@ do_compile() {
> > 
> >      export NSS_DISABLE_GTESTS=1
> > 
> > +    # Need to set RPATH so that chrpath will do its job correctly
> > +    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath
> > -link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,
> > -rpath,${STAGING_LIBDIR_NATIVE} -Wl,
> > -rpath,${STAGING_BASE_LIBDIR_NATIVE}"
> Why are you adding native paths to rpath in a target recipe? If this
> change is native-only, this should use the class-native override.,
> no?
Very good point. There's no point setting RPATH for target environment
(even if it shouldn't break anything). I was too tired when writing the
final version of the patch, I guess ;) I'll send a new version, soon.
Thanks,
  Markus

--=-WbAdAM+KCpOy9wk6CP5M
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Sat, 2016-02-13 at 05:12 +0000, Christopher Larson wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_quote"><div dir="ltr">On Fri, Feb 12, 2016 at 12:06 PM Markus Lehtonen &lt;<a href="mailto:markus.lehtonen@linux.intel.com">markus.lehtonen@linux.intel.com</a>&gt; wrote:<br></div><blockquote type="cite">Otherwise the nss libs do not get any RPATH/RUNPATH. Consequently, the<br>
.so dependencies of nss libs are always searched from the base lib<br>
directories of the host (i.e. /lib/ and /usr/lib). This causes problems<br>
with nss-native where the .so's should be searched from the base lib<br>
directories of the sysroot instead of the host file system.<br>
<br>
This particular problem has probably been unnoticed as nss-native is<br>
seldom used and/or most users are likely to have nss libraries installed<br>
on their host system. In this case everything most likely work as<br>
expected.<br>
<br>
[YOCTO #9041]<br>
<br>
Signed-off-by: Markus Lehtonen &lt;<a href="mailto:markus.lehtonen@linux.intel.com" target="_blank">markus.lehtonen@linux.intel.com</a>&gt;<br>
---<br>
&nbsp;meta/recipes-support/nss/<a href="http://nss_3.21.bb" rel="noreferrer" target="_blank">nss_3.21.bb</a> | 6 +++++-<br>
&nbsp;1 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/nss/<a href="http://nss_3.21.bb" rel="noreferrer" target="_blank">nss_3.21.bb</a> b/meta/recipes-support/nss/<a href="http://nss_3.21.bb" rel="noreferrer" target="_blank">nss_3.21.bb</a><br>
index 552fd6c..8b9fb71 100644<br>
--- a/meta/recipes-support/nss/<a href="http://nss_3.21.bb" rel="noreferrer" target="_blank">nss_3.21.bb</a><br>
+++ b/meta/recipes-support/nss/<a href="http://nss_3.21.bb" rel="noreferrer" target="_blank">nss_3.21.bb</a><br>
@@ -91,12 +91,16 @@ do_compile() {<br>
<br>
&nbsp; &nbsp; &nbsp;export NSS_DISABLE_GTESTS=1<br>
<br>
+&nbsp; &nbsp; # Need to set RPATH so that chrpath will do its job correctly<br>
+&nbsp; &nbsp; RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"<br></blockquote><div><br></div><div>Why are you adding native paths to rpath in a target recipe? If this change is native-only, this should use the class-native override., no?</div></div></div>
</blockquote><div><br></div><div>Very good point. There's no point setting RPATH for target environment (even if it shouldn't break anything). I was too tired when writing the final version of the patch, I guess ;) I'll send a new version, soon.</div><div><br></div><div>Thanks,</div><div>&nbsp; Markus</div></body></html>

--=-WbAdAM+KCpOy9wk6CP5M--
