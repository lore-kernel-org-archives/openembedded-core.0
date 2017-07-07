Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CE01A7198D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 20:28:46 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id d78so36673154qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tjjTeLVGnnxdC8ZWzqvabD0TnoDFuK265fNMGibPkNo=;
	b=igH93AzJj6ZsZDKtB/gHlYo4+S+u8K/A7PKKSGdeUy/AhcGOtw4XK6aqHaWU6x/ARz
	125WmS7iqYcqs0gInQTqLrlXGJyTqVEC62vZMH+3587xSm+pBKlXlazNt8oowCo9zzx+
	jHjh1d3qzb6XN7ZEnEDBqS0auMssYArZJBzOELKGWIGCqk6gQUVZrr04NQzaCxNz6/EG
	AKGVFPBXOuMcgpHlsKz4ZrK/vtCAlhJDqnp6glMjjL4X7R4+Kdt7Xal/4DoNslArhqSm
	a+T6uKH7//g09T9ZlDFTGTZqQVDQypMnC3yiS/o1P/vzT5HYf+gV+emNG5mzy+ZMDOUQ
	hBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tjjTeLVGnnxdC8ZWzqvabD0TnoDFuK265fNMGibPkNo=;
	b=JqE0Z64etW9GZrfM6WK2Y3W4t7vRaSMFN8Zu57g/NBVNuRyG2x3Jn+/r2oCmVrNmkt
	suFPuOuWRDouMbsydCCrhnHMDc2SsuPCsbHbuFyvJ7oKUUbsNkJT0p5ZXPs7ftHgLpxV
	D9gi665pl8WJ6EJGTWMuzuKpH+Gj8ckAHS68THZAerkgs0HaCaBOHKUrAIcy8Bp0GAh3
	Pw90ivIN4lt1BHqIxGncezufD5dolK+kL67FNykR1GyxLoDeglgTlzkiF5SFIbpuECoq
	dwgPWD8rk8evc/q54XKbj/GqNvhKZlVzcPu/EoShhpZt+fXDbkOFOLj3aFzL4U+ujLrh
	qHaA==
X-Gm-Message-State: AKS2vOzKEQGgjzyDwq15dUkwxw5Royo7Hn7+xHPpK2GUXOG6TP6pWEH2
	L80jBkherOqdSkGRN7n5Xspxh79pPMdU
X-Received: by 10.55.97.148 with SMTP id v142mr70364265qkb.107.1499459327602; 
	Fri, 07 Jul 2017 13:28:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.21.230 with HTTP; Fri, 7 Jul 2017 13:28:27 -0700 (PDT)
In-Reply-To: <20170707193623.7679-1-haris.okanovic@ni.com>
References: <20170707193623.7679-1-haris.okanovic@ni.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 7 Jul 2017 13:28:27 -0700
Message-ID: <CABcZANkyksLoPhEzVe_sgUnW5Vmbj51_qmqsAVVTkBP6CuPojg@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: ken.sharp@ni.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] image.bbclass & image.py: Add check_image_file_ownership()
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
X-List-Received-Date: Fri, 07 Jul 2017 20:28:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c0572e693b4a60553c014ee"

--94eb2c0572e693b4a60553c014ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why not just check the permissions on disk, from a rootfs postprocess
command? That wouldn=E2=80=99t be specific to tar, but would be just as eff=
ective,
since those run under pseudo.

On Fri, Jul 7, 2017 at 12:36 PM, Haris Okanovic <haris.okanovic@ni.com>
wrote:

> An IMAGE_POSTPROCESS_COMMAND verifying image tarballs have symbolic and
> numeric ownership attributes which match the enclosed shadow database:
>  * uid and uname of each file is present in /etc/passwd
>  * gid and gname of each file is present in /etc/group
>  * ids and names are consistent between tar metadata and shadow database
>
> In other words, this test ensure there aren't any ownership surprises
> when a filesystem created from tarball is booted. It's particularly
> useful in cases where artifacts built outside of OE are included in
> images -- E.g. packages from an external feed.
>
> Testing: Verified core-image-base still builds
>
> Patch: https://github.com/harisokanovic/openembedded-
> core/commits/dev/hokanovi/image-ownership-sanity-check
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  meta/classes/image.bbclass |  25 +++++++++-
>  meta/lib/oe/image.py       | 114 ++++++++++++++++++++++++++++++
> +++++++++++++++
>  2 files changed, 138 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oe/image.py
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 6e30b96745..7b11291a82 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -192,7 +192,30 @@ python () {
>  IMAGE_CLASSES +=3D "image_types"
>  inherit ${IMAGE_CLASSES}
>
> -IMAGE_POSTPROCESS_COMMAND ?=3D ""
> +python check_image_file_ownership () {
> +    import sys, os, oe.image
> +
> +    imgTypes =3D d.getVar("IMAGE_FSTYPES", True).split()
> +    tarImgTypes =3D [ x for x in imgTypes if "tar" in x ]
> +
> +    # bail if there isn't a tar image in this build
> +    # TODO: Maybe add other image types
> +    if len(tarImgTypes) =3D=3D 0:
> +        bb.debug(1, "Skipping check, no 'tar' image specified")
> +        return
> +
> +    imgDeployDir =3D d.getVar("IMGDEPLOYDIR", True)
> +    imgName =3D d.getVar("IMAGE_NAME", True)
> +    imgNameSuffix =3D d.getVar("IMAGE_NAME_SUFFIX", True)
> +
> +    for tarFileExt in tarImgTypes:
> +        archiveFilename =3D (imgName + imgNameSuffix + "." + tarFileExt)
> +        archiveFilePath =3D os.path.join(imgDeployDir, archiveFilename)
> +
> +        oe.image.check_file_ownership_tar(d, archiveFilePath)
> +}
> +
> +IMAGE_POSTPROCESS_COMMAND ?=3D " check_image_file_ownership "
>
>  # some default locales
>  IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> new file mode 100644
> index 0000000000..f1ba6f2613
> --- /dev/null
> +++ b/meta/lib/oe/image.py
> @@ -0,0 +1,114 @@
> +# Helper function for image building
> +
> +def check_file_ownership_tar(d, archiveFilePath):
> +    """
> +    Verifies file ownership meta-data in image tarball matches users
> +    and groups in shadow database (/etc/passwd and /etc/group files).
> +    """
> +    import sys, os, tarfile
> +    bb.debug(1, "Running check_file_ownership() on image '{0!s}'".format=
(
> archiveFilePath))
> +
> +    try:
> +        archiveName =3D os.path.basename(archiveFilePath)
> +        if not archiveName:
> +            archiveName =3D archiveFilePath
> +
> +        # maps
> +        unameMap =3D {}  # username -> passwd file entry array
> +        gnameMap =3D {}  # groupname -> group file entry array
> +        uidMap =3D {}  # uid -> passwd file entry array
> +        gidMap   =3D {}  # gid -> group file entry array
> +        fileMap =3D {}  # filepath -> TarInfo object
> +
> +        def read_shadow_file(fdName, fd, colCount, mapsList):
> +            """ Reads a colon (:) delimited shadow database file into
> mapsList """
> +            for mapObj,_ in mapsList:
> +                if len(mapObj) !=3D 0:
> +                    raise Exception("Already read '{0!s}'
> file.".format(fdName))
> +
> +            for line in fd:
> +                line =3D line.decode("utf-8").strip()
> +                words =3D line.split(":")
> +
> +                if len(words) !=3D colCount:
> +                    raise Exception("Malformed '{0!s}' file. Expected
> {1!s} cols.".format(fdName, colCount))
> +
> +                for mapObj,mapKeyCol in mapsList:
> +                    mapKey =3D words[mapKeyCol]
> +                    if len(mapKey) < 1:
> +                        raise Exception("Map key in '{0!s}' must be at
> least one char long.".format(fdName))
> +
> +                    if mapKey in mapObj:
> +                        raise Exception("Malformed '{0!s}' file. Did not
> expect to find '{0!s}' in map.".format(fdName, mapKey))
> +
> +                    mapObj[mapKey] =3D words
> +
> +            for mapObj,_ in mapsList:
> +                if len(mapObj) =3D=3D 0:
> +                    raise Exception("'{0!s}' is empty.".format(fdName))
> +
> +        bb.debug(1, "Read the archive and populate maps")
> +        with tarfile.open(name=3DarchiveFilePath, mode=3D'r:*') as tar:
> +            for info in tar:
> +                if info.name in fileMap:
> +                    raise Exception("Duplicate entry for '{0!s}'
> found.".format(info.name))
> +
> +                fileMap[info.name] =3D info
> +
> +                # populate shadow db maps
> +                if    info.name =3D=3D './etc/passwd':
> read_shadow_file(fdName=3Dinfo.name, fd=3Dtar.extractfile(info), colCount=
=3D7,
> mapsList=3D[(unameMap, 0), (uidMap, 2), ])
> +                elif  info.name =3D=3D './etc/group':
>  read_shadow_file(fdName=3Dinfo.name, fd=3Dtar.extractfile(info), colCoun=
t=3D4,
> mapsList=3D[(gnameMap, 0), (gidMap, 2), ])
> +
> +        bb.debug(1, "Check for no shadow db")
> +        shadowItemCount =3D 0
> +        for mapObj in [unameMap, gnameMap, uidMap, gidMap]:
> +            shadowItemCount =3D shadowItemCount + len(mapObj)
> +        if shadowItemCount =3D=3D 0:
> +            bb.warn(1, "check_file_ownership(): Skip; no shadow database
> in image '{0!s}'".format(archiveName))
> +            return
> +
> +        bb.debug(1, "Map sanity check")
> +        for mapObj in [unameMap, gnameMap, uidMap, gidMap, fileMap]:
> +            if len(mapObj) < 1:
> +                raise Exception("Uh oh. Empty map found.")
> +
> +        def badFileError(errorMessage, info, shadowEntry=3DNone):
> +            linkname =3D ""
> +            if info.linkname:
> +                linkname =3D " -> {0!s}".format(info.linkname)
> +
> +            bb.error("BAD FILE '{0!s}': {1!s}".format(info.name,
> errorMessage))
> +            bb.error("## {info.uid!s}:{info.gid!s}
> ({info.uname!s}:{info.gname!s}) 0{info.mode:o} {info.name!s}{linkname!s}"=
.format(info=3Dinfo,
> linkname=3Dlinkname))
> +            if shadowEntry:
> +                bb.error("## {0!s}".format(shadowEntry))
> +
> +        bb.debug(1, "Check for bad files")
> +        for filepath,info in fileMap.items():
> +            if not info.uname in unameMap:
> +                badFileError("uname not in unameMap", info)
> +                continue
> +
> +            if not info.gname in gnameMap:
> +                badFileError("gname not in gnameMap", info)
> +                continue
> +
> +            if not str(info.uid) in uidMap:
> +                badFileError("Uid '{0!s}' not found".format(info.uid),
> info)
> +
> +            if not str(info.gid) in gidMap:
> +                badFileError("Gid '{0!s}' not found".format(info.gid),
> info)
> +
> +            unameEntry =3D unameMap[info.uname]
> +            gnameEntry =3D gnameMap[info.gname]
> +
> +            if str(info.uid) !=3D unameEntry[2]:
> +                badFileError("uid mismatch, expecting '{0!s}' for uname
> '{1!s}'".format(unameEntry[2], info.uname), info, unameEntry)
> +
> +            if str(info.gid) !=3D gnameEntry[2]:
> +                badFileError("gid mismatch, expecting '{0!s}' for gname
> '{1!s}'".format(gnameEntry[2], info.gname), info, gnameEntry)
> +
> +        bb.debug(1, "Successfully verified image
> '{0!s}'".format(archiveName))
> +
> +    # Error on any exceptions
> +    except Exception as e:
> +        bb.error("check_file_ownership() exception: {0!s}".format(e))
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c0572e693b4a60553c014ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why not just check the permissions on disk, from a rootfs =
postprocess command? That wouldn=E2=80=99t be specific to tar, but would be=
 just as effective, since those run under pseudo.<div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Fri, Jul 7, 2017 at 12:36 PM, Haris Okan=
ovic <span dir=3D"ltr">&lt;<a href=3D"mailto:haris.okanovic@ni.com" target=
=3D"_blank">haris.okanovic@ni.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">An IMAGE_POSTPROCESS_COMMAND verifying image tarballs have s=
ymbolic and<br>
numeric ownership attributes which match the enclosed shadow database:<br>
=C2=A0* uid and uname of each file is present in /etc/passwd<br>
=C2=A0* gid and gname of each file is present in /etc/group<br>
=C2=A0* ids and names are consistent between tar metadata and shadow databa=
se<br>
<br>
In other words, this test ensure there aren&#39;t any ownership surprises<b=
r>
when a filesystem created from tarball is booted. It&#39;s particularly<br>
useful in cases where artifacts built outside of OE are included in<br>
images -- E.g. packages from an external feed.<br>
<br>
Testing: Verified core-image-base still builds<br>
<br>
Patch: <a href=3D"https://github.com/harisokanovic/openembedded-core/commit=
s/dev/hokanovi/image-ownership-sanity-check" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/<wbr>harisokanovic/openembedded-<wbr>core/commits=
/dev/hokanovi/<wbr>image-ownership-sanity-check</a><br>
<br>
Signed-off-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com">=
haris.okanovic@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image.bbclass |=C2=A0 25 +++++++++-<br>
=C2=A0meta/lib/oe/image.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 114 ++++++++++++++++=
++++++++++++++<wbr>+++++++++++++++<br>
=C2=A02 files changed, 138 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/lib/oe/image.py<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 6e30b96745..7b11291a82 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -192,7 +192,30 @@ python () {<br>
=C2=A0IMAGE_CLASSES +=3D &quot;image_types&quot;<br>
=C2=A0inherit ${IMAGE_CLASSES}<br>
<br>
-IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
+python check_image_file_ownership () {<br>
+=C2=A0 =C2=A0 import sys, os, oe.image<br>
+<br>
+=C2=A0 =C2=A0 imgTypes =3D d.getVar(&quot;IMAGE_FSTYPES&quot;, True).split=
()<br>
+=C2=A0 =C2=A0 tarImgTypes =3D [ x for x in imgTypes if &quot;tar&quot; in =
x ]<br>
+<br>
+=C2=A0 =C2=A0 # bail if there isn&#39;t a tar image in this build<br>
+=C2=A0 =C2=A0 # TODO: Maybe add other image types<br>
+=C2=A0 =C2=A0 if len(tarImgTypes) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Skipping check, no &#39;tar&=
#39; image specified&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 imgDeployDir =3D d.getVar(&quot;IMGDEPLOYDIR&quot;, True)<br=
>
+=C2=A0 =C2=A0 imgName =3D d.getVar(&quot;IMAGE_NAME&quot;, True)<br>
+=C2=A0 =C2=A0 imgNameSuffix =3D d.getVar(&quot;IMAGE_NAME_SUFFIX&quot;, Tr=
ue)<br>
+<br>
+=C2=A0 =C2=A0 for tarFileExt in tarImgTypes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archiveFilename =3D (imgName + imgNameSuffix +=
 &quot;.&quot; + tarFileExt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archiveFilePath =3D os.path.join(imgDeployDir,=
 archiveFilename)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.image.check_file_ownership_<wbr>tar(d, arch=
iveFilePath)<br>
+}<br>
+<br>
+IMAGE_POSTPROCESS_COMMAND ?=3D &quot; check_image_file_ownership &quot;<br=
>
<br>
=C2=A0# some default locales<br>
=C2=A0IMAGE_LINGUAS ?=3D &quot;de-de fr-fr en-gb&quot;<br>
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py<br>
new file mode 100644<br>
index 0000000000..f1ba6f2613<br>
--- /dev/null<br>
+++ b/meta/lib/oe/image.py<br>
@@ -0,0 +1,114 @@<br>
+# Helper function for image building<br>
+<br>
+def check_file_ownership_tar(d, archiveFilePath):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Verifies file ownership meta-data in image tarball matches u=
sers<br>
+=C2=A0 =C2=A0 and groups in shadow database (/etc/passwd and /etc/group fi=
les).<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 import sys, os, tarfile<br>
+=C2=A0 =C2=A0 bb.debug(1, &quot;Running check_file_ownership() on image &#=
39;{0!s}&#39;&quot;.format(<wbr>archiveFilePath))<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archiveName =3D os.path.basename(<wbr>archiveF=
ilePath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not archiveName:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archiveName =3D archiveFilePath<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # maps<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unameMap =3D {}=C2=A0 # username -&gt; passwd =
file entry array<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnameMap =3D {}=C2=A0 # groupname -&gt; group =
file entry array<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uidMap =3D {}=C2=A0 # uid -&gt; passwd file en=
try array<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gidMap=C2=A0 =C2=A0=3D {}=C2=A0 # gid -&gt; gr=
oup file entry array<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fileMap =3D {}=C2=A0 # filepath -&gt; TarInfo =
object<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def read_shadow_file(fdName, fd, colCount, map=
sList):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; Reads a colon=
 (:) delimited shadow database file into mapsList &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for mapObj,_ in mapsList:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(mapObj) !=
=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e Exception(&quot;Already read &#39;{0!s}&#39; file.&quot;.format(fdName))<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in fd:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.deco=
de(&quot;utf-8&quot;).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 words =3D line.spl=
it(&quot;:&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(words) !=3D=
 colCount:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e Exception(&quot;Malformed &#39;{0!s}&#39; file. Expected {1!s} cols.&quot=
;.format(fdName, colCount))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for mapObj,mapKeyC=
ol in mapsList:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mapK=
ey =3D words[mapKeyCol]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l=
en(mapKey) &lt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise Exception(&quot;Map key in &#39;{0!s}&#39; must be at leas=
t one char long.&quot;.format(fdName))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
apKey in mapObj:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise Exception(&quot;Malformed &#39;{0!s}&#39; file. Did not ex=
pect to find &#39;{0!s}&#39; in map.&quot;.format(fdName, mapKey))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mapO=
bj[mapKey] =3D words<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for mapObj,_ in mapsList:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(mapObj) =3D=
=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e Exception(&quot;&#39;{0!s}&#39; is empty.&quot;.format(fdName))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Read the archive and populat=
e maps&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tarfile.open(name=3D<wbr>archiveFilePath,=
 mode=3D&#39;r:*&#39;) as tar:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for info in tar:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http=
://info.name" rel=3D"noreferrer" target=3D"_blank">info.name</a> in fileMap=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e Exception(&quot;Duplicate entry for &#39;{0!s}&#39; found.&quot;.format(<=
a href=3D"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.name<=
/a>))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fileMap[<a href=3D=
"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.name</a>] =3D =
info<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # populate shadow =
db maps<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=C2=A0 =C2=A0 <a=
 href=3D"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.name</=
a> =3D=3D &#39;./etc/passwd&#39;:=C2=A0 read_shadow_file(fdName=3D<a href=
=3D"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.<wbr>name</=
a>, fd=3Dtar.extractfile(info), colCount=3D7, mapsList=3D[(unameMap, 0), (u=
idMap, 2), ])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif=C2=A0 <a href=
=3D"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.name</a> =
=3D=3D &#39;./etc/group&#39;:=C2=A0 =C2=A0read_shadow_file(fdName=3D<a href=
=3D"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.<wbr>name</=
a>, fd=3Dtar.extractfile(info), colCount=3D4, mapsList=3D[(gnameMap, 0), (g=
idMap, 2), ])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Check for no shadow db&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shadowItemCount =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for mapObj in [unameMap, gnameMap, uidMap, gid=
Map]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shadowItemCount =3D shadowItemCo=
unt + len(mapObj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if shadowItemCount =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(1, &quot;check_file_owne=
rship(): Skip; no shadow database in image &#39;{0!s}&#39;&quot;.format(arc=
hiveName))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Map sanity check&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for mapObj in [unameMap, gnameMap, uidMap, gid=
Map, fileMap]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(mapObj) &lt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&q=
uot;Uh oh. Empty map found.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def badFileError(errorMessage, info, shadowEnt=
ry=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linkname =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if info.linkname:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linkname =3D &quot=
; -&gt; {0!s}&quot;.format(info.linkname)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;BAD FILE &#39;{0!=
s}&#39;: {1!s}&quot;.format(<a href=3D"http://info.name" rel=3D"noreferrer"=
 target=3D"_blank">info.name</a>, errorMessage))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;## {info.uid!s}:{=
info.gid!s} ({info.uname!s}:{info.gname!s}<wbr>) 0{info.mode:o} {<a href=3D=
"http://info.name" rel=3D"noreferrer" target=3D"_blank">info.name</a>!s}{li=
nkname!s}&quot;.<wbr>format(info=3Dinfo, linkname=3Dlinkname))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if shadowEntry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;## =
{0!s}&quot;.format(shadowEntry))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Check for bad files&quot;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for filepath,info in fileMap.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not info.uname in unameMap:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;uname not in unameMap&quot;, info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not info.gname in gnameMap:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;gname not in gnameMap&quot;, info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not str(info.uid) in uidMap:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;Uid &#39;{0!s}&#39; not found&quot;.format(info.uid), info)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not str(info.gid) in gidMap:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;Gid &#39;{0!s}&#39; not found&quot;.format(info.gid), info)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unameEntry =3D unameMap[info.una=
me]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnameEntry =3D gnameMap[info.gna=
me]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if str(info.uid) !=3D unameEntry=
[2]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;uid mismatch, expecting &#39;{0!s}&#39; for uname &#39;{1!s}&#39;&quot;.fo=
rmat(unameEntry[2], info.uname), info, unameEntry)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if str(info.gid) !=3D gnameEntry=
[2]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badFileError(&quot=
;gid mismatch, expecting &#39;{0!s}&#39; for gname &#39;{1!s}&#39;&quot;.fo=
rmat(gnameEntry[2], info.gname), info, gnameEntry)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;Successfully verified image =
&#39;{0!s}&#39;&quot;.format(archiveName))<br>
+<br>
+=C2=A0 =C2=A0 # Error on any exceptions<br>
+=C2=A0 =C2=A0 except Exception as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;check_file_<wbr>ownership() exc=
eption: {0!s}&quot;.format(e))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div></div>

--94eb2c0572e693b4a60553c014ee--
