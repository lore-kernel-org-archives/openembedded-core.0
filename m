Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Rd4Xb-00042C-08
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 19:35:56 +0100
Received: by pbcc11 with SMTP id c11so3142407pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 10:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+j0bsiHitypgDGjzRisb7Ot7T+bIP8PQZWw+AyQ2+hE=;
	b=MrNhIhRnC8hSaYnJdPnmhAwRMxRPhMeojxsv/V0c2YlzMRBNMjZqp8xkB9l9HQXlVJ
	y5k/i3VZRtvBOq5KmuqH1N92oGexnmkcmKGFgx+fIQh/ib9hMz4J1SxioEBMrLKKFNhm
	x6zTnsOlAjB0BPtVJioYKmGNnjmLfWObEB6VQ=
MIME-Version: 1.0
Received: by 10.68.189.199 with SMTP id gk7mr4952721pbc.63.1324405729714; Tue,
	20 Dec 2011 10:28:49 -0800 (PST)
Received: by 10.143.18.10 with HTTP; Tue, 20 Dec 2011 10:28:49 -0800 (PST)
In-Reply-To: <4EF0C808.8060609@gmail.com>
References: <4EF0C808.8060609@gmail.com>
Date: Tue, 20 Dec 2011 13:28:49 -0500
Message-ID: <CADkTA4PQC4K2CsEQQz4TbK2JOU26K3R=XUtjEg_OB-nTTgTyXw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Tue, 20 Dec 2011 18:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 12:38 PM, Christopher Larson <kergoth@gmail.com> wr=
ote:
> This is needed by the copyleft_compliance class, so it can emit series fi=
les
> for the patches, which greatly increases their usefulness to a user tryin=
g
> to
> reconstruct the sources outside of OE.

.. or inside! As it turns out, I was writing something very similar to
this to export
patches for processing with the linux-yocto build changes. I was about to s=
end
them out, but this looks drop in or even better.

I'm going to take this for a spin here and see if I can get it working
with my other
changes.

Cheers,

Bruce

>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> =A0meta/classes/patch.bbclass | =A0196
> +++++++++++++++++++++++--------------------
> =A01 files changed, 105 insertions(+), 91 deletions(-)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index ac6c1ce..454d9ce 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -7,13 +7,106 @@ PATCHDEPENDENCY =3D
> "${PATCHTOOL}-native:do_populate_sysroot"
> =A0inherit terminal
> =A0-python patch_do_patch() {
> - =A0 =A0 =A0 import oe.patch
> +def src_patches(d):
> + =A0 =A0 =A0 workdir =3D d.getVar('WORKDIR', True)
> + =A0 =A0 =A0 fetch =3D bb.fetch2.Fetch([], d)
> + =A0 =A0 =A0 patches =3D []
> + =A0 =A0 =A0 for url in fetch.urls:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D patch_path(url, fetch, workdir)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not local:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 urldata =3D fetch.ud[url]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 parm =3D urldata.parm
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchname =3D parm.get('pname') or os.path.=
basename(local)
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 apply, reason =3D should_apply(parm)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not apply:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if reason:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch %s %s" % (patchname, reason))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> =A0- =A0 =A0 =A0src_uri =3D (d.getVar('SRC_URI', 1) or '').split()
> - =A0 =A0 =A0 if not src_uri:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchparm =3D {'patchname': patchname}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "striplevel" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D parm["stripl=
evel"]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif "pnum" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D parm["pnum"]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D '1'
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchparm['striplevel'] =3D striplevel
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchdir =3D parm.get('patchdir')
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if patchdir:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchparm['patchdir'] =3D p=
atchdir
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 localurl =3D bb.encodeurl(('file', '', loca=
l, '', '',
> patchparm))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 patches.append(localurl)
> +
> + =A0 =A0 =A0 return patches
> +
> +def patch_path(url, fetch, workdir):
> + =A0 =A0 =A0 """Return the local path of a patch, or None if this isn't =
a
> patch"""
> +
> + =A0 =A0 =A0 local =3D fetch.localpath(url)
> + =A0 =A0 =A0 base, ext =3D os.path.splitext(os.path.basename(local))
> + =A0 =A0 =A0 if ext in ('.gz', '.bz2', '.Z'):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D os.path.join(workdir, base)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ext =3D os.path.splitext(base)[1]
> +
> + =A0 =A0 =A0 urldata =3D fetch.ud[url]
> + =A0 =A0 =A0 if "apply" in urldata.parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 apply =3D oe.types.boolean(urldata.parm["ap=
ply"])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not apply:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return
> + =A0 =A0 =A0 elif ext not in (".diff", ".patch"):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
> =A0+ =A0 =A0 =A0return local
> +
> +def should_apply(parm):
> + =A0 =A0 =A0 """Determine if we should apply the given patch"""
> +
> + =A0 =A0 =A0 if "mindate" in parm or "maxdate" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pn =3D d.getVar('PN', 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D d.getVar('SRCDATE_%s' % pn, 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not srcdate:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D d.getVar('SRCDA=
TE', 1)
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcdate =3D=3D "now":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D d.getVar('DATE'=
, 1)
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "maxdate" in parm and parm["maxdate"] < =
srcdate:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, 'is outdated'
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "mindate" in parm and parm["mindate"] > =
srcdate:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, 'is predated'
> +
> +
> + =A0 =A0 =A0 if "minrev" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV', 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and srcrev < parm["minrev"]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, 'applies to l=
ater revisions'
> +
> + =A0 =A0 =A0 if "maxrev" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV', 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and srcrev > parm["maxrev"]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, 'applies to e=
arlier revisions'
> +
> + =A0 =A0 =A0 if "rev" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV', 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and parm["rev"] not in srcrev:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, "doesn't appl=
y to revision"
> +
> + =A0 =A0 =A0 if "notrev" in parm:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV', 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and parm["notrev"] in srcrev:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return False, "doesn't appl=
y to revision"
> +
> + =A0 =A0 =A0 return True, None
> +
> +python patch_do_patch() {
> + =A0 =A0 =A0 import oe.patch
> +
> =A0 =A0 =A0 =A0patchsetmap =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"patch": oe.patch.PatchTree,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"quilt": oe.patch.QuiltTree,
> @@ -29,93 +122,15 @@ python patch_do_patch() {
> =A0 =A0 =A0 =A0rcls =3D resolvermap[d.getVar('PATCHRESOLVE', 1) or 'user'=
]
> =A0+ =A0 =A0 =A0classes =3D {}
> +
> =A0 =A0 =A0 =A0s =3D d.getVar('S', 1)
> =A0 =A0 =A0 =A0path =3D os.getenv('PATH')
> =A0 =A0 =A0 =A0os.putenv('PATH', d.getVar('PATH', 1))
> =A0- =A0 =A0 =A0classes =3D {}
> -
> - =A0 =A0 =A0 workdir =3D d.getVar('WORKDIR', 1)
> - =A0 =A0 =A0 for url in src_uri:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 (type, host, path, user, pswd, parm) =3D bb=
.decodeurl(url)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D None
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 base, ext =3D os.path.splitext(os.path.base=
name(path))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ext in ('.gz', '.bz2', '.Z'):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D os.path.join(work=
dir, base)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ext =3D os.path.splitext(ba=
se)[1]
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "apply" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 apply =3D parm["apply"]
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if apply !=3D "yes":
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if apply !=
=3D "no":
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 bb.msg.warn(None, "Unsupported value
> '%s' for 'apply' url param in '%s', please use 'yes' or 'no'" % (apply,
> url))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 #elif "patch" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #bb.msg.warn(None, "Depreca=
ted usage of 'patch' url
> param in '%s', please use 'apply=3D{yes,no}'" % url)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif ext not in (".diff", ".patch"):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not local:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 url =3D bb.encodeurl((type,=
 host, path, user, pswd,
> []))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D os.path.join('/',=
 bb.fetch2.localpath(url,
> d))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 local =3D bb.data.expand(local, d)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "striplevel" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D parm["stripl=
evel"]
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif "pnum" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #bb.msg.warn(None, "Depreca=
ted usage of 'pnum' url
> parameter in '%s', please use 'striplevel'" % url)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D parm["pnum"]
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 striplevel =3D '1'
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "pname" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pname =3D parm["pname"]
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pname =3D os.path.basename(=
local)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "mindate" in parm or "maxdate" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pn =3D d.getVar('PN', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D d.getVar('SRCDA=
TE_%s' % pn, 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not srcdate:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D=
 d.getVar('SRCDATE', 1)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcdate =3D=3D "now":
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcdate =3D=
 d.getVar('DATE', 1)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "maxdate" in parm and pa=
rm["maxdate"] < srcdate:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' is outdated" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "mindate" in parm and pa=
rm["mindate"] > srcdate:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' is predated" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "minrev" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV=
', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and srcrev < parm=
["minrev"]:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' applies to later
> revisions" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "maxrev" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV=
', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and srcrev > parm=
["maxrev"]:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' applies to earlier
> revisions" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "rev" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV=
', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and parm["rev"] n=
ot in srcrev:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' doesn't apply to
> revision" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if "notrev" in parm:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 srcrev =3D d.getVar('SRCREV=
', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if srcrev and parm["notrev"=
] in srcrev:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Pa=
tch '%s' doesn't apply to
> revision" % pname)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> + =A0 =A0 =A0 for patch in src_patches(d):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _, _, local, _, _, parm =3D bb.decodeurl(pa=
tch)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if "patchdir" in parm:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0patchdir =3D parm["patchdi=
r"]
> @@ -132,12 +147,11 @@ python patch_do_patch() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0patchset, resolver =3D cla=
sses[patchdir]
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.note("Applying patch '%s' (%s)" % (pna=
me,
> oe.path.format_display(local, d)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Applying patch '%s' (%s)" % (parm[=
'patchname'],
> oe.path.format_display(local, d)))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0try:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchset.Import({"file":loc=
al, "remote":url,
> "strippath": striplevel}, True)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 except Exception:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 import sys
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.build.FuncFailed(s=
tr(sys.exc_value))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 patchset.Import({"file":loc=
al, "strippath":
> parm['striplevel']}, True)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 except Exception as exc:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.fatal(str(exc))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0resolver.Resolve()
> =A0}
> =A0patch_do_patch[vardepsexclude] =3D "DATE SRCDATE PATCHRESOLVE"
> --
> 1.7.8
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


