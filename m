Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 98CC57570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:59:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2016 01:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,493,1449561600"; 
	d="scan'208,217";a="658439369"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2016 01:59:40 -0800
Message-ID: <1456307978.2298.47.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Christopher Larson
	<clarson@kergoth.com>
Date: Wed, 24 Feb 2016 11:59:38 +0200
In-Reply-To: <CAJTo0LbfEM77HQnq023yLnLA240F8yRywL8b2Wb-dfhnggQ2-w@mail.gmail.com>
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LZdtxNJa3FPAthW02iS2n+-xvntVrGU1MwA5vWvh1FnXg@mail.gmail.com>
	<CABcZANmW9zV90WeJdGhW85FP4C_hSjTJ89V+6cFP66cRnrGJ+g@mail.gmail.com>
	<CAJTo0LbfEM77HQnq023yLnLA240F8yRywL8b2Wb-dfhnggQ2-w@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Wed, 24 Feb 2016 09:59:43 -0000
Content-Type: multipart/alternative; boundary="=-N3LNvk4SL4WD8DMDQQsW"

--=-N3LNvk4SL4WD8DMDQQsW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-23 at 18:23 +0000, Burton, Ross wrote:
> 
> On 23 February 2016 at 18:01, Christopher Larson <clarson@kergoth.com
> > wrote:
> > db isn't the only recipe doing that. The fetcher unpack method
> > knows where it's unpacking to, I think if anyone should be clearing
> > out the destination first, it should. 
> If that's true for tarballs, I agree.  I was also wondering if this
> should just be unpack[cleandirs] = ${S}
The problem is that the fetcher does not now the target directory, i.e.
it does not examine the content of tar/zip. Implementing that logic for
different archive formats would require a lot more work.
Using cleandirs sounds good to me. I.e. something like:
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1372f38..aa107d4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,23 +133,15 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
+do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S', True)
!= d.getVar('WORKDIR', True) else ''}"
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI', True) or "").split()
     if len(src_uri) == 0:
         return
 
-    rootdir = d.getVar('WORKDIR', True)
-
-    # Ensure that we cleanup ${S}/patches
-    # TODO: Investigate if we can remove
-    # the entire ${S} in this case.
-    s_dir = d.getVar('S', True)
-    p_dir = os.path.join(s_dir, 'patches')
-    bb.utils.remove(p_dir, True)
-
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(rootdir)
+        fetcher.unpack(d.getVar('WORKDIR', True))
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }

--=-N3LNvk4SL4WD8DMDQQsW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Tue, 2016-02-23 at 18:23 +0000, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div><br><div cla=
ss=3D"gmail_quote">On 23 February 2016 at 18:01, Christopher Larson <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">cla=
rson@kergoth.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite">db isn'=
t the only recipe doing that. The fetcher unpack method knows where it's un=
packing to, I think if anyone should be clearing out the destination first,=
 it should.&nbsp;<br></blockquote></div><div class=3D"gmail_extra"><br></di=
v>If that's true for tarballs, I agree.&nbsp; I was also wondering if this =
should just be unpack[cleandirs] =3D ${S}</div></div></blockquote><div><br>=
</div><div>The problem is that the fetcher does not now the target director=
y, i.e. it does not examine the content of tar/zip. Implementing that logic=
 for different archive formats would require a lot more work.</div><div><br=
></div><div>Using cleandirs sounds good to me. I.e. something like:</div><d=
iv>diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass</div>=
<div>index 1372f38..aa107d4 100644</div><div>--- a/meta/classes/base.bbclas=
s</div><div>+++ b/meta/classes/base.bbclass</div><div>@@ -133,23 +133,15 @@=
 python base_do_fetch() {</div><div>&nbsp;</div><div>&nbsp;addtask unpack a=
fter do_fetch</div><div>&nbsp;do_unpack[dirs] =3D "${WORKDIR}"</div><div>+d=
o_unpack[cleandirs] =3D "<a href=3D"mailto:${@d.getVar">${@d.getVar</a>('S'=
, True) if d.getVar('S', True) !=3D d.getVar('WORKDIR', True) else ''}"</di=
v><div>&nbsp;python base_do_unpack() {</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;src_uri =3D (d.getVar('SRC_URI', True) or "").split()</div><div>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;if len(src_uri) =3D=3D 0:</div><div>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return</div><div>&nbsp;</div><div>-&n=
bsp;&nbsp;&nbsp;&nbsp;rootdir =3D d.getVar('WORKDIR', True)</div><div>-</di=
v><div>-&nbsp;&nbsp;&nbsp;&nbsp;# Ensure that we cleanup ${S}/patches</div>=
<div>-&nbsp;&nbsp;&nbsp;&nbsp;# TODO: Investigate if we can remove</div><di=
v>-&nbsp;&nbsp;&nbsp;&nbsp;# the entire ${S} in this case.</div><div>-&nbsp=
;&nbsp;&nbsp;&nbsp;s_dir =3D d.getVar('S', True)</div><div>-&nbsp;&nbsp;&nb=
sp;&nbsp;p_dir =3D os.path.join(s_dir, 'patches')</div><div>-&nbsp;&nbsp;&n=
bsp;&nbsp;bb.utils.remove(p_dir, True)</div><div>-</div><div>&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;try:</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;fetcher =3D bb.fetch2.Fetch(src_uri, d)</div><div>-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fetcher.unpack(rootdir)</div><div>+&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fetcher.unpack(d.getVar('WORKDIR'=
, True))</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except bb.fetch2.BBFetchEx=
ception as e:</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;raise bb.build.FuncFailed(e)</div><div>&nbsp;}</div></body></html>

--=-N3LNvk4SL4WD8DMDQQsW--
