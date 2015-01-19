Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 20C0B72AED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 19:40:25 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id c41so16184973yho.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 11:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:from:date:message-id:subject:to:cc
	:content-type; bh=lLWCoAVPeQ3MVHhnY7H3xa5/EyYUD9RV/9tFowNZUxQ=;
	b=MrZLfll5f2lnK3N6E6A7S3Okel0ZZXO++FrVuE9TOKFuFwXA9OHJAL5m5ot7qdmVYd
	wh78j84Poiel7Ax/onCjtnWRi5PE7673Y3h2OqZz9C9Jm5NS7CZL5bvEFcyka7k8AGpj
	jIfdbOilZQGktkxT8dS2AqFoU4j1BjVCz8u0Zwz8bmpxAs/pqIs7K7mZ1KWUW4Raa679
	5zElnWOaaM3ivrVxxp5eJnnpfdDyPGMuyffoe0fz+pmEhTBFzXhAAm2cNbEmDKyn0QrB
	MK9P6gsdrDwbIvgULIOKM6fbkfG/RqQARbRiLto2Whfy9dN/YvyxtZslU397jrX+LmUT
	17gg==
X-Received: by 10.170.35.135 with SMTP id 129mr21265972ykd.87.1421696426005;
	Mon, 19 Jan 2015 11:40:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1420899992.git.petter@technux.se>
	<ecf58c259c3b0bf8589a630617a0e284d647ea97.1420899992.git.petter@technux.se>
	<2635313.PoP8bKsGIp@peggleto-mobl5.ger.corp.intel.com>
	<54B4E073.6050805@technux.se>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 19 Jan 2015 19:40:25 +0000
Message-ID: <CABcZAN=J5A+NT13bZZ=F2QKPFQT3GLzajp+ywLp10tKQ+ppGdQ@mail.gmail.com>
To: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] base.bbclass: detect when S has been set incorrectly
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
X-List-Received-Date: Mon, 19 Jan 2015 19:40:27 -0000
Content-Type: multipart/alternative; boundary=001a1137682e735f76050d067ef6

--001a1137682e735f76050d067ef6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Honestly I can't recall anymore. I remember looking into this, as this has
been a long-standing annoyance, but I don't recall what the issues were.
I'm absolutely in favor of your pursuing this.

On Tue Jan 13 2015 at 2:08:08 AM Petter Mab=C3=A4cker <petter@technux.se> w=
rote:

> On 01/12/2015 04:53 PM, Paul Eggleton wrote:
> > Hi Petter,
> >
> > On Saturday 10 January 2015 15:40:10 Petter Mab=C3=A4cker wrote:
> >> Currently base.bbclass is creating S if it's not created by unpacking
> >> an archive or fetching a repository. If we avoid creating S we can
> detect
> >> when S hasn't been set correctly, since it will not exist. Then we can
> tell
> >> the user that they should set S to a proper value, instead of just
> failing
> >> with odd errors in later tasks.
> >>
> >> Besides removing the auto-creation of S this change will introduce a
> warning
> >> if S is set incorrectly. The reason for not display an error and retur=
n
> is
> >> due to all external layers that might have recipes that will fail
> otherwise
> >> and that might be a bit to hard to start with. So use a warning until
> >> people have had a chance to cleanup affected recipes.
> >>
> >> [YOCTO #5627]
> >>
> >> Signed-off-by: Petter Mab=C3=A4cker <petter@technux.se>
> >> ---
> >>   meta/classes/base.bbclass | 17 +++++++++++++----
> >>   1 file changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> >> index de50be1..789af3b 100644
> >> --- a/meta/classes/base.bbclass
> >> +++ b/meta/classes/base.bbclass
> >> @@ -113,7 +113,6 @@ python base_do_fetch() {
> >>
> >>   addtask unpack after do_fetch
> >>   do_unpack[dirs] =3D "${WORKDIR}"
> >> -do_unpack[cleandirs] =3D "${S}/patches"
> >>   python base_do_unpack() {
> >>       src_uri =3D (d.getVar('SRC_URI', True) or "").split()
> >>       if len(src_uri) =3D=3D 0:
> >> @@ -121,11 +120,21 @@ python base_do_unpack() {
> >>
> >>       rootdir =3D d.getVar('WORKDIR', True)
> >>
> >> +    # Ensure that we cleanup ${S}/patches
> >> +    # TODO: Investigate if we can remove
> >> +    # the entire ${S} in this case.
> >> +    s_dir =3D d.getVar('S', True)
> >> +    p_dir =3D os.path.join(s_dir, 'patches')
> >> +    bb.utils.remove(p_dir, True)
> >> +
> >>       try:
> >>           fetcher =3D bb.fetch2.Fetch(src_uri, d)
> >>           fetcher.unpack(rootdir)
> >>       except bb.fetch2.BBFetchException as e:
> >>           raise bb.build.FuncFailed(e)
> >> +
> >> +    if not os.path.exists(s_dir):
> >> +        bb.warn("%s ('S') don't exist, you must set 'S' to a proper
> value"
> >> % s_dir) }
> >>
> >>   def pkgarch_mapping(d):
> >> @@ -220,7 +229,7 @@ CONFIGURESTAMPFILE =3D "${WORKDIR}/configure.sstat=
e"
> >>   CLEANBROKEN =3D "0"
> >>
> >>   addtask configure after do_patch
> >> -do_configure[dirs] =3D "${S} ${B}"
> >> +do_configure[dirs] =3D "${B}"
> >>   do_configure[deptask] =3D "do_populate_sysroot"
> >>   base_do_configure() {
> >>      if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ];
> then
> >> @@ -238,7 +247,7 @@ base_do_configure() {
> >>   }
> >>
> >>   addtask compile after do_configure
> >> -do_compile[dirs] =3D "${S} ${B}"
> >> +do_compile[dirs] =3D "${B}"
> >>   base_do_compile() {
> >>      if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
> >>              oe_runmake || die "make failed"
> >> @@ -248,7 +257,7 @@ base_do_compile() {
> >>   }
> >>
> >>   addtask install after do_compile
> >> -do_install[dirs] =3D "${D} ${S} ${B}"
> >> +do_install[dirs] =3D "${D} ${B}"
> >>   # Remove and re-create ${D} so that is it guaranteed to be empty
> >>   do_install[cleandirs] =3D "${D}"
> > This looks reasonable to me; however I'm sure I recall Chris talking
> about
> > some kind of complication with this issue a year or so ago - Chris do y=
ou
> > remember what that was about?
> >
> > Cheers,
> > Paul
> >
> Ok, I will wait and see if Chris remembers anything sneaky about this. I
> have run quite some tests without seeing any problems so far. Perhaps it
> was about removing ${S} instead of just ${S}/patches in do_unpack ?
> Because I think there have been some discussions about that in the past.
> I also did some test with that in the scope of 'bug 5627', but it is far
> more complex to do such a chance, a lot of recipes didn't liked that at
> all =3D/ It seems more correct to really wipe entire ${S} in that case,
> but I guess it have to wait..
>
> BR,
> Petter
>

--001a1137682e735f76050d067ef6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Honestly I can&#39;t recall anymore. I remember looking into this, as this =
has been a long-standing annoyance, but I don&#39;t recall what the issues =
were. I&#39;m absolutely in favor of your pursuing this.<br><br><div class=
=3D"gmail_quote">On Tue Jan 13 2015 at 2:08:08 AM Petter Mab=C3=A4cker &lt;=
<a href=3D"mailto:petter@technux.se">petter@technux.se</a>&gt; wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On 01/12/2015 04:53 PM, Paul Eggleton wrote:<b=
r>
&gt; Hi Petter,<br>
&gt;<br>
&gt; On Saturday 10 January 2015 15:40:10 Petter Mab=C3=A4cker wrote:<br>
&gt;&gt; Currently base.bbclass is creating S if it&#39;s not created by un=
packing<br>
&gt;&gt; an archive or fetching a repository. If we avoid creating S we can=
 detect<br>
&gt;&gt; when S hasn&#39;t been set correctly, since it will not exist. The=
n we can tell<br>
&gt;&gt; the user that they should set S to a proper value, instead of just=
 failing<br>
&gt;&gt; with odd errors in later tasks.<br>
&gt;&gt;<br>
&gt;&gt; Besides removing the auto-creation of S this change will introduce=
 a warning<br>
&gt;&gt; if S is set incorrectly. The reason for not display an error and r=
eturn is<br>
&gt;&gt; due to all external layers that might have recipes that will fail =
otherwise<br>
&gt;&gt; and that might be a bit to hard to start with. So use a warning un=
til<br>
&gt;&gt; people have had a chance to cleanup affected recipes.<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #5627]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Petter Mab=C3=A4cker &lt;<a href=3D"mailto:petter@t=
echnux.se" target=3D"_blank">petter@technux.se</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/classes/base.bbclass | 17 +++++++++++++----<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass=
<br>
&gt;&gt; index de50be1..789af3b 100644<br>
&gt;&gt; --- a/meta/classes/base.bbclass<br>
&gt;&gt; +++ b/meta/classes/base.bbclass<br>
&gt;&gt; @@ -113,7 +113,6 @@ python base_do_fetch() {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0addtask unpack after do_fetch<br>
&gt;&gt;=C2=A0 =C2=A0do_unpack[dirs] =3D &quot;${WORKDIR}&quot;<br>
&gt;&gt; -do_unpack[cleandirs] =3D &quot;${S}/patches&quot;<br>
&gt;&gt;=C2=A0 =C2=A0python base_do_unpack() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri =3D (d.getVar(&#39;SRC_URI&#39;,=
 True) or &quot;&quot;).split()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(src_uri) =3D=3D 0:<br>
&gt;&gt; @@ -121,11 +120,21 @@ python base_do_unpack() {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rootdir =3D d.getVar(&#39;WORKDIR&#39;, =
True)<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 # Ensure that we cleanup ${S}/patches<br>
&gt;&gt; +=C2=A0 =C2=A0 # TODO: Investigate if we can remove<br>
&gt;&gt; +=C2=A0 =C2=A0 # the entire ${S} in this case.<br>
&gt;&gt; +=C2=A0 =C2=A0 s_dir =3D d.getVar(&#39;S&#39;, True)<br>
&gt;&gt; +=C2=A0 =C2=A0 p_dir =3D os.path.join(s_dir, &#39;patches&#39;)<br=
>
&gt;&gt; +=C2=A0 =C2=A0 bb.utils.remove(p_dir, True)<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher =3D bb.fetch2.Fetc=
h(src_uri, d)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.unpack(rootdir)<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0except bb.fetch2.BBFetchException as e:<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.build.FuncFailed(=
e)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if not os.path.exists(s_dir):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s (&#39;S&#39;) don&#3=
9;t exist, you must set &#39;S&#39; to a proper value&quot;<br>
&gt;&gt; % s_dir) }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0def pkgarch_mapping(d):<br>
&gt;&gt; @@ -220,7 +229,7 @@ CONFIGURESTAMPFILE =3D &quot;${WORKDIR}/config=
ure.sstate&quot;<br>
&gt;&gt;=C2=A0 =C2=A0CLEANBROKEN =3D &quot;0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0addtask configure after do_patch<br>
&gt;&gt; -do_configure[dirs] =3D &quot;${S} ${B}&quot;<br>
&gt;&gt; +do_configure[dirs] =3D &quot;${B}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0do_configure[deptask] =3D &quot;do_populate_sysroot&qu=
ot;<br>
&gt;&gt;=C2=A0 =C2=A0base_do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${CONFIGURESTAMPFILE}&quot; -a -=
e &quot;${CONFIGURESTAMPFILE}&quot; ]; then<br>
&gt;&gt; @@ -238,7 +247,7 @@ base_do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0addtask compile after do_configure<br>
&gt;&gt; -do_compile[dirs] =3D &quot;${S} ${B}&quot;<br>
&gt;&gt; +do_compile[dirs] =3D &quot;${B}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0base_do_compile() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ -e Makefile -o -e makefile -o -e GNUmakef=
ile ]; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake || die =
&quot;make failed&quot;<br>
&gt;&gt; @@ -248,7 +257,7 @@ base_do_compile() {<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0addtask install after do_compile<br>
&gt;&gt; -do_install[dirs] =3D &quot;${D} ${S} ${B}&quot;<br>
&gt;&gt; +do_install[dirs] =3D &quot;${D} ${B}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0# Remove and re-create ${D} so that is it guaranteed t=
o be empty<br>
&gt;&gt;=C2=A0 =C2=A0do_install[cleandirs] =3D &quot;${D}&quot;<br>
&gt; This looks reasonable to me; however I&#39;m sure I recall Chris talki=
ng about<br>
&gt; some kind of complication with this issue a year or so ago - Chris do =
you<br>
&gt; remember what that was about?<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
Ok, I will wait and see if Chris remembers anything sneaky about this. I<br=
>
have run quite some tests without seeing any problems so far. Perhaps it<br=
>
was about removing ${S} instead of just ${S}/patches in do_unpack ?<br>
Because I think there have been some discussions about that in the past.<br=
>
I also did some test with that in the scope of &#39;bug 5627&#39;, but it i=
s far<br>
more complex to do such a chance, a lot of recipes didn&#39;t liked that at=
<br>
all =3D/ It seems more correct to really wipe entire ${S} in that case,<br>
but I guess it have to wait..<br>
<br>
BR,<br>
Petter<br>
</blockquote></div>

--001a1137682e735f76050d067ef6--
