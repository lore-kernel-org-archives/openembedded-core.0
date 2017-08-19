Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8457859A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 08:25:27 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id n29so10584200uai.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lp2PhnAzoZoUwAxOn4JZELEv+vic3MsBsJivZBPiEfo=;
	b=Q24w7yp0nIfoFq2F4qJ7xB2TfzMR+rLY+nRpNutM7Lohla9Qy6znK/5/B/PPnTCrGO
	fbFx/GzjJsBjIxu9tAUtQPas7Slfg93cFwEP+HQIZ04vhUBP/L6Nb6QIsmD7pkWLjBDO
	D5HEshimoqFCOXJH92vtUs0nwY9sXKi+OZleX9vPw0KeKnw9806dW+qjBSV2ebpOP2jQ
	1BcdGuaCEIxN/lPZT++W8APgmKgpkJGZlohpQqUy9S4MLkG2SrWzYDOqQVvrc5SOWotY
	gmj2hRB/IkBoGYIwpiOSi9vXOj3l3n3gaRiLd5GTfi2n83rdrg9aRRGGxCo9VEu3R6H+
	iSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lp2PhnAzoZoUwAxOn4JZELEv+vic3MsBsJivZBPiEfo=;
	b=HZp0yi8BYzKnK8NM+UcTLAPNW3jLKx9kGbxzo4cSmetTrJrZjq098xbGF26pYrZPNy
	BFBlnPyqZ1Tf0YpEULKZuOrXWCYksKgbh6Qj/WSuvgj5ukkRjE5jJFeOPE0DUkPM/f3T
	FWPKIvTrTSLDI3kGBIX0HgkHFCCp1ZlOufaKhA05pNiOgCbjZSwzkKSOu2mf3PPNfwrJ
	5N097ajl7xff/BKa2G3HaNE6Fr2Ts1+za0KnLEhoUOivsBNDq7zRuWvTnTU45I6HuDF9
	Bq+6XJpnv6U+niueH0DmWtpXuxOetldfCDebbKxdhyrjIXNnPYfXkGgrC833KuRS+t41
	nWZQ==
X-Gm-Message-State: AHYfb5gLXEedhQWbsT4OEPaLsYKDn3mDMxybZfs8tczqsCNKnWZP6E2l
	95ff+zIAoC5RAynqDHcSn1pyL62B8g==
X-Received: by 10.159.32.97 with SMTP id 88mr7817475uam.102.1503131128472;
	Sat, 19 Aug 2017 01:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sat, 19 Aug 2017 01:25:28 -0700 (PDT)
In-Reply-To: <1502300913-40295-2-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-2-git-send-email-juro.bystricky@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 Aug 2017 10:25:28 +0200
Message-ID: <CA+chaQeOi5H91XcavV+=SoGzRr_+91nCypEpE5APm4UkDfEn3w@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 01/11] reproducible_build.bbclass: initial support for binary reproducibility
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
X-List-Received-Date: Sat, 19 Aug 2017 08:25:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c04ca98f6ac29055716fcda"

--94eb2c04ca98f6ac29055716fcda
Content-Type: text/plain; charset="UTF-8"

Would it make sense to create src_date_epoch.txt outside ${S} directory?

In some recipes (which weren't picky what they install from ${S} to ${D})
I've noticed that src_date_epoch.txt is now included in their package (I've
noticed, because 2 different packages were trying to install this file on
the same path in rootfs).

Can we use temp or ${WORKDIR} for this file? ${S} might be also be
completely archived with archiver.bbclass, not sure if you want
src_date_epoch.txt part of that or not.

Regards,

On Wed, Aug 9, 2017 at 7:48 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Conditionally set some environment variables in order to achieve
> improved binary reproducibility. Providing BUILD_REPRODUCIBLE_BINARIES is
> set to "1", we set the following environment variables:
>
> export PYTHONHASHSEED=0
> export PERL_HASH_SEED=0
> export TZ="UTC"
>
> Additionally, we export and set SOURCE_DATE_EPOCH. This is the most
> crucial step to
> achieve binary reproducibility. The value for this variable (timestamp) is
> obtained after source code for a recipe has been unpacked, but before it
> is patched.
> If the code sources come from a GIT repo, we get the timestamp from the top
> commit. (GIT repo does not preserve file mktime timestamps). It is not
> safe to assume
> folders named "git" contain git repositories, so we check for presence of
> .git folder in ${S}.
> Otherwise, if GIT repo is not present, we get mtime from known files suche
> as NEWS,
> ChangeLog, etc. If this fails, we go through all files and get the
> timestamp
> from the youngest one. We create an individual timestamp for each recipe.
> The timestamp is stored in the file 'src_date_epoch.txt'. Later on, each
> task
> reads this file and sets SOURCE_DATE_EPOCH based on the value found in the
> file.
>
> The file src_date_epoch.txt file is re-used if found. This can be the file
> we previously created ourselves, or it can be a file provided by a user via
> a recipe.
>
> [YOCTO#11178]
> [YOCTO#11179]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/base.bbclass               |   4 ++
>  meta/classes/reproducible_build.bbclass | 108
> ++++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 meta/classes/reproducible_build.bbclass
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 8c86977..bf79eb9 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -9,6 +9,7 @@ inherit utils
>  inherit utility-tasks
>  inherit metadata_scm
>  inherit logging
> +inherit reproducible_build
>
>  OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license"
>  OE_IMPORTS[type] = "list"
> @@ -166,6 +167,7 @@ python base_do_unpack() {
>      try:
>          fetcher = bb.fetch2.Fetch(src_uri, d)
>          fetcher.unpack(d.getVar('WORKDIR'))
> +        create_src_date_epoch_stamp(d)
>      except bb.fetch2.BBFetchException as e:
>          bb.fatal(str(e))
>  }
> @@ -386,6 +388,7 @@ def set_packagetriplet(d):
>
>      settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
>
> +
>  python () {
>      import string, re
>
> @@ -685,6 +688,7 @@ python () {
>              bb.warn("Recipe %s is marked as only being architecture
> specific but seems to have machine specific packages?! The recipe may as
> well mark itself as machine specific directly." % d.getVar("PN"))
>  }
>
> +
>  addtask cleansstate after do_clean
>  python do_cleansstate() {
>          sstate_clean_cachefiles(d)
> diff --git a/meta/classes/reproducible_build.bbclass
> b/meta/classes/reproducible_build.bbclass
> new file mode 100644
> index 0000000..af8db95
> --- /dev/null
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -0,0 +1,108 @@
> +
> +BUILD_REPRODUCIBLE_BINARIES ??= "0"
> +BUILD_REPRODUCIBLE_BINARIES[export] = "1"
> +
> +# Unix timestamp
> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= ""
> +
> +def get_src_date_epoch_quick(d, path):
> +    import subprocess
> +    src_date_epoch = 0
> +    saved_cwd = os.getcwd()
> +    os.chdir(path)
> +    if os.path.isdir(".git"):
> +        try:
> +            src_date_epoch = int(subprocess.check_output(['
> git','log','-1','--pretty=%ct']))
> +        except subprocess.CalledProcessError as grepexc:
> +            bb.warn("Not a git repository in .git folder? error:%d" %
> (grepexc.returncode))
> +    else:
> +        known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
> +
> +        for file in known_files:
> +            if os.path.isfile(file):
> +                mtime = int(os.path.getmtime(file))
> +
> +                # There may be more than one "known_file" present.
> +                # If so, use the youngest one
> +                if mtime > src_date_epoch:
> +                    src_date_epoch = mtime
> +
> +    os.chdir(saved_cwd)
> +    return src_date_epoch
> +
> +
> +def create_src_date_epoch_stamp(d):
> +    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
> +        path = d.getVar('S')
> +
> +        epochfile = os.path.join(path,'src_date_epoch.txt')
> +        if os.path.isfile(epochfile):
> +            bb.debug(1, " path: %s reusing src_date_epoch.txt" %
> epochfile)
> +            return
> +
> +        filename_dbg = None
> +        src_date_epoch = get_src_date_epoch_quick(d, path)
> +
> +        if src_date_epoch == 0:
> +            exclude = set(["temp", "licenses", "patches",
> "recipe-sysroot-native", "recipe-sysroot", "pseudo"])
> +            for root, dirs, files in os.walk(path, topdown=True):
> +                files = [f for f in files if not f[0] == '.']
> +                dirs[:] = [d for d in dirs if d not in exclude]
> +
> +                for fname in files:
> +                    filename = os.path.join(root, fname)
> +                    try:
> +                        mtime = int(os.path.getmtime(filename))
> +                    except:
> +                        mtime = 0
> +                    if mtime > src_date_epoch:
> +                        src_date_epoch = mtime
> +                        filename_dbg = filename
> +
> +        # Most likely an empty folder
> +        if src_date_epoch == 0:
> +            bb.warn("Unable to determine src_date_epoch! path:%s" % path)
> +
> +        f = open(os.path.join(path,'src_date_epoch.txt'), 'w')
> +        f.write(str(src_date_epoch))
> +        f.close()
> +
> +        if filename_dbg != None:
> +            bb.debug(1," src_date_epoch %d derived from: %s" %
> (src_date_epoch, filename_dbg))
> +            #bb.warn(" src_date_epoch %d derived from: %s" %
> (src_date_epoch, filename_dbg))
> +
> +export PYTHONHASHSEED
> +export PERL_HASH_SEED
> +export SOURCE_DATE_EPOCH
> +
> +BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH PYTHONHASHSEED PERL_HASH_SEED
> "
> +
> +python () {
> +    import string, re
> +
> +    # Create reproducible_environment
> +
> +    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
> +        import subprocess
> +        d.setVar('PYTHONHASHSEED', '0')
> +        d.setVar('PERL_HASH_SEED', '0')
> +        d.setVar('TZ', 'UTC')
> +        path = d.getVar('S')
> +        epochfile = os.path.join(path,'src_date_epoch.txt')
> +        if os.path.isfile(epochfile):
> +            f = open(epochfile, 'r')
> +            src_date_epoch = f.read()
> +            f.close()
> +            bb.debug(1, "src_date_epoch stamp found ---> stamp %s" %
> src_date_epoch)
> +            d.setVar('SOURCE_DATE_EPOCH', src_date_epoch)
> +        else:
> +            bb.debug(1, "src_date_epoch stamp not found.")
> +            d.setVar('SOURCE_DATE_EPOCH', '0')
> +    else:
> +        if 'PYTHONHASHSEED' in os.environ:
> +            del os.environ['PYTHONHASHSEED']
> +        if 'PERL_HASH_SEED' in os.environ:
> +            del os.environ['PERL_HASH_SEED']
> +        if 'SOURCE_DATE_EPOCH' in os.environ:
> +            del os.environ['SOURCE_DATE_EPOCH']
> +}
> --
> 2.7.4
>
>

--94eb2c04ca98f6ac29055716fcda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it make sense to create=C2=A0<span style=3D"font-siz=
e:12.8px">src_date_</span><wbr style=3D"font-size:12.8px"><span class=3D"gm=
ail-il" style=3D"font-size:12.8px;background-color:rgb(255,255,255)">epoch<=
/span><span style=3D"font-size:12.8px">.txt outside ${S} directory?<br></sp=
an><div><span style=3D"font-size:12.8px"><br></span></div><div><span style=
=3D"font-size:12.8px">In some recipes (which weren&#39;t picky what they in=
stall from ${S} to ${D}) I&#39;ve noticed that=C2=A0</span><span style=3D"f=
ont-size:12.8px">src_date_</span><wbr style=3D"font-size:12.8px"><span clas=
s=3D"gmail-il" style=3D"background-color:rgb(255,255,255);font-size:12.8px"=
>epoch</span><span style=3D"font-size:12.8px">.txt is now included in their=
 package (I&#39;ve noticed, because 2 different packages were trying to ins=
tall this file on the same path in rootfs).</span></div><div><span style=3D=
"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">C=
an we use temp or ${WORKDIR} for this file?=C2=A0</span><span style=3D"font=
-size:12.8px">${S} might be also be completely archived with archiver.bbcla=
ss, not sure if you want src_date_epoch.txt part of that or not.</span></di=
v><div><span style=3D"font-size:12.8px"><br></span></div><div><span style=
=3D"font-size:12.8px">Regards,</span></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Wed, Aug 9, 2017 at 7:48 PM, Juro Bystri=
cky <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" targe=
t=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Conditionally set some environment variables in order to=
 achieve<br>
improved binary reproducibility. Providing BUILD_REPRODUCIBLE_BINARIES is<b=
r>
set to &quot;1&quot;, we set the following environment variables:<br>
<br>
export PYTHONHASHSEED=3D0<br>
export PERL_HASH_SEED=3D0<br>
export TZ=3D&quot;UTC&quot;<br>
<br>
Additionally, we export and set SOURCE_DATE_EPOCH. This is the most crucial=
 step to<br>
achieve binary reproducibility. The value for this variable (timestamp) is<=
br>
obtained after source code for a recipe has been unpacked, but before it is=
 patched.<br>
If the code sources come from a GIT repo, we get the timestamp from the top=
<br>
commit. (GIT repo does not preserve file mktime timestamps). It is not safe=
 to assume<br>
folders named &quot;git&quot; contain git repositories, so we check for pre=
sence of .git folder in ${S}.<br>
Otherwise, if GIT repo is not present, we get mtime from known files suche =
as NEWS,<br>
ChangeLog, etc. If this fails, we go through all files and get the timestam=
p<br>
from the youngest one. We create an individual timestamp for each recipe.<b=
r>
The timestamp is stored in the file &#39;src_date_epoch.txt&#39;. Later on,=
 each task<br>
reads this file and sets SOURCE_DATE_EPOCH based on the value found in the =
file.<br>
<br>
The file src_date_epoch.txt file is re-used if found. This can be the file<=
br>
we previously created ourselves, or it can be a file provided by a user via=
<br>
a recipe.<br>
<br>
[YOCTO#11178]<br>
[YOCTO#11179]<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 ++<br>
=C2=A0meta/classes/reproducible_<wbr>build.bbclass | 108 ++++++++++++++++++=
++++++++++++<wbr>++<br>
=C2=A02 files changed, 112 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/reproducible_<wbr>build.bbclass<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index 8c86977..bf79eb9 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -9,6 +9,7 @@ inherit utils<br>
=C2=A0inherit utility-tasks<br>
=C2=A0inherit metadata_scm<br>
=C2=A0inherit logging<br>
+inherit reproducible_build<br>
<br>
=C2=A0OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.packag=
e oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license&quot;<br>
=C2=A0OE_IMPORTS[type] =3D &quot;list&quot;<br>
@@ -166,6 +167,7 @@ python base_do_unpack() {<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher =3D bb.fetch2.Fetch(src_uri, d)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.unpack(d.getVar(&#39;<wbr>WORKDIR=
&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_src_date_epoch_stamp(d)<br>
=C2=A0 =C2=A0 =C2=A0except bb.fetch2.BBFetchException as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(str(e))<br>
=C2=A0}<br>
@@ -386,6 +388,7 @@ def set_packagetriplet(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0settriplet(d, &quot;PKGMLTRIPLETS&quot;, archs, tos, tv=
s)<br>
<br>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0import string, re<br>
<br>
@@ -685,6 +688,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Recipe %s is =
marked as only being architecture specific but seems to have machine specif=
ic packages?! The recipe may as well mark itself as machine specific direct=
ly.&quot; % d.getVar(&quot;PN&quot;))<br>
=C2=A0}<br>
<br>
+<br>
=C2=A0addtask cleansstate after do_clean<br>
=C2=A0python do_cleansstate() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstate_clean_cachefiles(d)<br>
diff --git a/meta/classes/reproducible_<wbr>build.bbclass b/meta/classes/re=
producible_<wbr>build.bbclass<br>
new file mode 100644<br>
index 0000000..af8db95<br>
--- /dev/null<br>
+++ b/meta/classes/reproducible_<wbr>build.bbclass<br>
@@ -0,0 +1,108 @@<br>
+<br>
+BUILD_REPRODUCIBLE_BINARIES ??=3D &quot;0&quot;<br>
+BUILD_REPRODUCIBLE_BINARIES[<wbr>export] =3D &quot;1&quot;<br>
+<br>
+# Unix timestamp<br>
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D &quot;&quot;<br>
+<br>
+def get_src_date_epoch_quick(d, path):<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 src_date_epoch =3D 0<br>
+=C2=A0 =C2=A0 saved_cwd =3D os.getcwd()<br>
+=C2=A0 =C2=A0 os.chdir(path)<br>
+=C2=A0 =C2=A0 if os.path.isdir(&quot;.git&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_date_epoch =3D int(subproces=
s.check_output([&#39;<wbr>git&#39;,&#39;log&#39;,&#39;-1&#39;,&#39;--pretty=
=3D%ct&#39;<wbr>]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessError as grepex=
c:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Not a git reposito=
ry in .git folder? error:%d&quot; % (grepexc.returncode))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 known_files =3D set([&quot;NEWS&quot;, &quot;C=
hangeLog&quot;, &quot;Changelog&quot;, &quot;CHANGES&quot;])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in known_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime =3D int(os.p=
ath.getmtime(file))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # There may be mor=
e than one &quot;known_file&quot; present.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If so, use the y=
oungest one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mtime &gt; src_=
date_epoch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_=
date_epoch =3D mtime<br>
+<br>
+=C2=A0 =C2=A0 os.chdir(saved_cwd)<br>
+=C2=A0 =C2=A0 return src_date_epoch<br>
+<br>
+<br>
+def create_src_date_epoch_stamp(d)<wbr>:<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;BUILD_REPRODUCIBLE_<wbr>BINARIES&#39;) =3D=
=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D d.getVar(&#39;S&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 epochfile =3D os.path.join(path,&#39;src_date_=
<wbr>epoch.txt&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(epochfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot; path: %s reus=
ing src_date_epoch.txt&quot; % epochfile)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename_dbg =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_date_epoch =3D get_src_date_epoch_quick(d,=
 path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if src_date_epoch =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exclude =3D set([&quot;temp&quot=
;, &quot;licenses&quot;, &quot;patches&quot;, &quot;recipe-sysroot-native&q=
uot;, &quot;recipe-sysroot&quot;, &quot;pseudo&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for root, dirs, files in os.walk=
(path, topdown=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D [f for f=
 in files if not f[0] =3D=3D &#39;.&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs[:] =3D [d for=
 d in dirs if d not in exclude]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for fname in files=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
name =3D os.path.join(root, fname)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mtime =3D int(os.path.getmtime(filename)<wbr>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mtime =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
time &gt; src_date_epoch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 src_date_epoch =3D mtime<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 filename_dbg =3D filename<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Most likely an empty folder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if src_date_epoch =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to determin=
e src_date_epoch! path:%s&quot; % path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(os.path.join(path,&#39;src_<wbr>dat=
e_epoch.txt&#39;), &#39;w&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(str(src_date_epoch))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if filename_dbg !=3D None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1,&quot; src_date_epoch=
 %d derived from: %s&quot; % (src_date_epoch, filename_dbg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #bb.warn(&quot; src_date_epoch %=
d derived from: %s&quot; % (src_date_epoch, filename_dbg))<br>
+<br>
+export PYTHONHASHSEED<br>
+export PERL_HASH_SEED<br>
+export SOURCE_DATE_EPOCH<br>
+<br>
+BB_HASHBASE_WHITELIST +=3D &quot;SOURCE_DATE_EPOCH PYTHONHASHSEED PERL_HAS=
H_SEED &quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 import string, re<br>
+<br>
+=C2=A0 =C2=A0 # Create reproducible_environment<br>
+<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;BUILD_REPRODUCIBLE_<wbr>BINARIES&#39;) =3D=
=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PYTHONHASHSEED&#39;, &#39;0&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PERL_HASH_SEED&#39;, &#39;0&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;TZ&#39;, &#39;UTC&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D d.getVar(&#39;S&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 epochfile =3D os.path.join(path,&#39;src_date_=
<wbr>epoch.txt&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(epochfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(epochfile, &#39;r&#39=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_date_epoch =3D f.read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;src_date_epoch=
 stamp found ---&gt; stamp %s&quot; % src_date_epoch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SOURCE_DATE_EPOCH&=
#39;, src_date_epoch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;src_date_epoch=
 stamp not found.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SOURCE_DATE_EPOCH&=
#39;, &#39;0&#39;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;PYTHONHASHSEED&#39; in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del os.environ[&#39;PYTHONHASHSE=
ED&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;PERL_HASH_SEED&#39; in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del os.environ[&#39;PERL_HASH_SE=
ED&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;SOURCE_DATE_EPOCH&#39; in os.environ:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del os.environ[&#39;SOURCE_DATE_=
EPOCH&#39;<wbr>]<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c04ca98f6ac29055716fcda--
