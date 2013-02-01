Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U1Hgi-0005jz-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:33:56 +0100
Received: by mail-la0-f53.google.com with SMTP id fr10so2865462lab.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=8LTz0phGilqiFUeH2PzcZ/PxnngZNavkuFlSgTubT5U=;
	b=Enpa7tVAarSoCEbUUKTrPYmnI14HY/v5TtMJq3kOgTeoAvxoqLeYZCkLP1iS5FkYXI
	M38ixH+FL5FxrZXdlYo0nsXscXRJWohjO756gS3f92DRJephuarnYAjWdwTPAUR4Bqj0
	E4ptKH3sokrjkz2laNI3npP3/ydfL5j11L1fqav/cNmqVwPsyfwtvjZsJ4V2PExNcJ/X
	V9+v3YfqL9gZqueun1hpJwIsDNBb/+F2fHwSPgWp7rHdkZrB1AeVsWST8aBkROE06qhJ
	E9lZ/ltpPMhdvwjacCtqC8tfMp4Tx7mf3GNwV32Msimn6PPVakwIwFVUo1gQtaxA1vYN
	uSEA==
MIME-Version: 1.0
X-Received: by 10.152.147.103 with SMTP id tj7mr11398736lab.54.1359728291829; 
	Fri, 01 Feb 2013 06:18:11 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 1 Feb 2013 06:18:11 -0800 (PST)
In-Reply-To: <b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
Date: Fri, 1 Feb 2013 09:18:11 -0500
Message-ID: <CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 14:33:57 -0000
Content-Type: multipart/alternative; boundary=e89a8f234d2bd3578704d4aa698a

--e89a8f234d2bd3578704d4aa698a
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 1, 2013 at 4:00 AM, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add config fragments to busybox.
>
> Both the implementation and the use case are similar to yocto kernel's
> configuration fragments.
>

I can fairly easily tweak the configuration parts of the kern-tools to
handle this
use case as well. That would allow us to re-use the kernel's merge_config.sh
script (with a minor dependency change) and save some duplicated code. It
also gets you the advantage that you can consolidate configuration fragments
outside of any build system, which isn't as critical here, but something
that
is used quite a bit during kernel testing.

To be clear, I'm not talking about the entire kern-tools here, just the
config parts.

Cheers,

Bruce


>
> [YOCTO #3379]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/busybox/busybox.inc |   45
> +++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> index 972e7d0..66044f8 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -112,8 +112,53 @@ do_prepare_config () {
>         fi
>  }
>
> +# returns all the elements from the src uri that are .cfg files
> +def find_cfgs(d):
> +    sources=src_patches(d, True)
> +    sources_list=[]
> +    for s in sources:
> +        if s.endswith('.cfg'):
> +            sources_list.append(s)
> +
> +    return sources_list
> +
> +# Merge config fragments
> +# All config fragments for busybox should end with .cfg
> +do_merge_config() {
> +        SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[=
> ].*/\2/p"
> +        MERGE_LIST="${@" ".join(find_cfgs(d))}"
> +        if [ -n "$MERGE_LIST" ]; then
> +                # Make a temp file, merge .config and .cfg files into it
> +                TMP_FILE=`mktemp .tmp.config.XXXXXXXX`
> +                cp .config $TMP_FILE
> +                for MERGE_FILE in $MERGE_LIST; do
> +                        CFG_LIST=`sed -n "${SED_CONFIG_EXP}" $MERGE_FILE`
> +                        for CFG in $CFG_LIST ; do
> +                                grep -q -w $CFG $TMP_FILE
> +                                if [ $? -eq 0 ] ; then
> +                                        PREV_VAL=`grep -w $CFG $TMP_FILE`
> +                                        NEW_VAL=`grep -w $CFG $MERGE_FILE`
> +                                        if [ "x$PREV_VAL" != "x$NEW_VAL"
> ] ; then
> +                                                echo Value of $CFG is
> redefined by fragment $MERGE_FILE:
> +                                                echo Previous  value:
> $PREV_VAL
> +                                                echo New value:
> $NEW_VAL
> +                                                echo
> +                                        fi
> +                                        sed -i "/$CFG[ =]/d" $TMP_FILE
> +                                fi
> +                        done
> +                        echo >> $TMP_FILE
> +                        cat $MERGE_FILE >> $TMP_FILE
> +                done
> +                # Copy the temp file to .config, do some cleanup
> +               cp $TMP_FILE .config
> +               rm $TMP_FILE
> +        fi
> +}
> +
>  do_configure () {
>         do_prepare_config
> +       do_merge_config
>         cml1_do_configure
>  }
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f234d2bd3578704d4aa698a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Feb 1, 2013 at 4:00 AM,  <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Add config fragments to busybox.<br>
<br>
Both the implementation and the use case are similar to yocto kernel&#39;s<=
br>
configuration fragments.<br></blockquote><div><br></div><div>I can fairly e=
asily tweak the configuration parts of the kern-tools to handle this</div><=
div>use case as well. That would allow us to re-use the kernel&#39;s merge_=
config.sh</div>
<div>script (with a minor dependency change) and save some duplicated code.=
 It</div><div>also gets you the advantage that you can consolidate configur=
ation fragments</div><div>outside of any build system, which isn&#39;t as c=
ritical here, but something that=A0</div>
<div style>is used quite a bit during kernel testing.</div><div style><br><=
/div><div style>To be clear, I&#39;m not talking about the entire kern-tool=
s here, just the config parts.</div><div style><br></div><div style>Cheers,=
</div>
<div style><br></div><div style>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
[YOCTO #3379]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
<div>=A0meta/recipes-core/busybox/busybox.inc | =A0 45 ++++++++++++++++++++=
+++++++++++++<br>
=A01 file changed, 45 insertions(+)<br>
<br>
</div>diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-cor=
e/busybox/busybox.inc<br>
index 972e7d0..66044f8 100644<br>
--- a/meta/recipes-core/busybox/busybox.inc<br>
+++ b/meta/recipes-core/busybox/busybox.inc<br>
@@ -112,8 +112,53 @@ do_prepare_config () {<br>
=A0 =A0 =A0 =A0 fi<br>
=A0}<br>
<br>
+# returns all the elements from the src uri that are .cfg files<br>
+def find_cfgs(d):<br>
+ =A0 =A0sources=3Dsrc_patches(d, True)<br>
+ =A0 =A0sources_list=3D[]<br>
+ =A0 =A0for s in sources:<br>
+ =A0 =A0 =A0 =A0if s.endswith(&#39;.cfg&#39;):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0sources_list.append(s)<br>
+<br>
+ =A0 =A0return sources_list<br>
+<br>
+# Merge config fragments<br>
+# All config fragments for busybox should end with .cfg<br>
+do_merge_config() {<br>
+ =A0 =A0 =A0 =A0SED_CONFIG_EXP=3D&quot;s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9=
_]*\)[=3D ].*/\2/p&quot;<br>
+ =A0 =A0 =A0 =A0MERGE_LIST=3D&quot;${@&quot; &quot;.join(find_cfgs(d))}&qu=
ot;<br>
+ =A0 =A0 =A0 =A0if [ -n &quot;$MERGE_LIST&quot; ]; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Make a temp file, merge .config and .cfg=
 files into it<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TMP_FILE=3D`mktemp .tmp.config.XXXXXXXX`<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cp .config $TMP_FILE<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for MERGE_FILE in $MERGE_LIST; do<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CFG_LIST=3D`sed -n &quot;$=
{SED_CONFIG_EXP}&quot; $MERGE_FILE`<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for CFG in $CFG_LIST ; do<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0grep -q -w=
 $CFG $TMP_FILE<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ $? -e=
q 0 ] ; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0PREV_VAL=3D`grep -w $CFG $TMP_FILE`<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0NEW_VAL=3D`grep -w $CFG $MERGE_FILE`<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if [ &quot;x$PREV_VAL&quot; !=3D &quot;x$NEW_VAL&quot; ] ; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0echo Value of $CFG is redefined by fragment $MERGE_F=
ILE:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0echo Previous =A0value: $PREV_VAL<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0echo New value: =A0 =A0 =A0 $NEW_VAL<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0echo<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0fi<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0sed -i &quot;/$CFG[ =3D]/d&quot; $TMP_FILE<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo &gt;&gt; $TMP_FILE<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cat $MERGE_FILE &gt;&gt; $=
TMP_FILE<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Copy the temp file to .config, do some c=
leanup<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp $TMP_FILE .config<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm $TMP_FILE<br>
+ =A0 =A0 =A0 =A0fi<br>
+}<br>
+<br>
=A0do_configure () {<br>
=A0 =A0 =A0 =A0 do_prepare_config<br>
+ =A0 =A0 =A0 do_merge_config<br>
=A0 =A0 =A0 =A0 cml1_do_configure<br>
<div><div>=A0}<br>
<br>
--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--e89a8f234d2bd3578704d4aa698a--
