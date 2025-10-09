Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A5FCCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 12:18:57 +0000 (UTC)
Subject: Re: [RFC PATCH] cargo_common.bbclass: use source replacement instead of dependency patching
To: openembedded-core@lists.openembedded.org
From: "Yash Shinde" <Yash.Shinde@windriver.com>
X-Originating-Location: Boisar, Maharashtra, IN (103.51.139.125)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Oct 2025 05:18:48 -0700
References: <20251003213000.2256939-1-skandigraun@gmail.com>
In-Reply-To: <20251003213000.2256939-1-skandigraun@gmail.com>
Message-ID: <469.1760012328302936344@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OVyOCO9n5uMzri6fuo82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224612

--OVyOCO9n5uMzri6fuo82
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 4, 2025 at 03:00 AM, Gyorgy Sarvari wrote:

>=20
> Cargo.toml files usually contain a list of dependencies in one of two
> forms:
> either a crate name that can be fetched from some registry (like
> crates.io), or
> as a source crate, which is most often fetched from a git repository.
>=20
> Normally cargo handles fetching the crates from both the registry and fro=
m
> git,
> however with Yocto this task is taken over by Bitbake.
>=20
> After fetching these crates, they are made available to cargo by adding
> the location
> to $CARGO_HOME/config.toml. The source crates are of interest here: each
> git repository
> that can be found in the SRC_URI is added as one source crate.
>=20
> This works most of the time, as long as the repository really contains on=
e
> crate only.
>=20
> However in case the repository is a cargo workspace, it contains multiple
> crates in
> different subfolders, and in order to allow cargo to process them, they
> need to be
> listed separately. This is not happening with the current implementation
> of cargo_common.
>=20
> This change introduces the following:
> - instead of patching the dependencies, use source replacement (the
> primary motivation for
> this was that maturin seems to ignore source crate patches from
> config.toml)
> - the above also allows to keep the original Cargo.lock untouched (the
> original implementation
> deleted git repository lines from it)
> - it adds a new folder, currently
> ${UNPACKDIR}/yocto-vendored-source-crates. During processing
> the separate crate folders are copied into this folder, and it is used as
> the central
> vendoring folder. This is needed for source replacements: the folder that
> is used for
> vendoring needs to contain the crates separately, one crate in one folder=
.
> Each folder
> has the name of the crate that it contains. Workspaces are not included
> here (unless the
> given manifest is a workspace AND a package at once)
> - previuosly the SRC_URI had to contain a "name" and a "destsuffix"
> parameter to be considered
> to be a rust crate. The name is not derived from the Cargo.toml file, not
> from the SRC_URI.
> Having destsuffix is still mandatory though.
>=20
> The change does not handle nested workspaces, only the top level
> Cargo.toml is processed.

I would like to understand more about this transition.
Does this patch address any regression or bug? If so, please provide more d=
etails.
As mentioned it is meant of maturin crate to handle the patches.
Can this be done at the crate level?

The python errors can be fixed by replacing tomlib (deprecated from python =
3.14 ) with tomli.

The Cargo.lock seems to missing from sysroot and breaks the build after thi=
s patch.
ERROR: libstd-rs-1.90.0-r0 do_configure: /home/user/poky/build/tmp/work/x86=
-64-v3-poky-linux/libstd-rs/1.90.0/sources/rustc-1.90.0-src/library/sysroot=
/Cargo.lock file doesn't exist

>=20
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>=20
> ---
> meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
> 1 file changed, 108 insertions(+), 50 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo_common.bbclass
> b/meta/classes-recipe/cargo_common.bbclass
> index c9eb2d09a5..79c1351298 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
> python cargo_common_do_patch_paths() {
> import shutil
>=20
> + def is_rust_crate_folder(path):
> + cargo_toml_path =3D os.path.join(path, 'Cargo.toml')
> + return os.path.exists(cargo_toml_path)
> +
> + def load_toml_file(toml_path):
> + import tomllib
> + with open(toml_path, 'rb') as f:
> + toml =3D tomllib.load(f)

Use tomli here.

>=20
> + return toml
> +
> + def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
> + for lf_repo in lockfile_repos.keys():
> + if repo in lf_repo and lf_repo.endswith(revision):
> + lockfile_repos[lf_repo] =3D True
> + return lf_repo.split("#")[0]
> + bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock
> file' % (repo, revision))
> +
> + def create_cargo_checksum(folder_path):
> + checksum_path =3D os.path.join(folder_path, '.cargo-checksum.json')
> + if os.path.exists(checksum_path):
> + return
> +
> + import hashlib, json
> +
> + checksum =3D {'files': {}}
> + for root, _, files in os.walk(folder_path):
> + for f in files:
> + full_path =3D os.path.join(root, f)
> + relative_path =3D os.path.relpath(full_path, folder_path)
> + if relative_path.startswith(".git/"):
> + continue
> + with open(full_path, 'rb') as f2:
> + file_sha =3D hashlib.sha256(f2.read()).hexdigest()
> + checksum["files"][relative_path] =3D file_sha
> +
> + with open(checksum_path, 'w') as f:
> + json.dump(checksum, f)
> +
> cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config.toml")
> if not os.path.exists(cargo_config):
> return
> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
> if len(src_uri) =3D=3D 0:
> return
>=20
> - patches =3D dict()
> + lockfile =3D d.getVar("CARGO_LOCK_PATH")
> + if not os.path.exists(lockfile):
> + bb.fatal(f"{lockfile} file doesn't exist")
> +
> + lockfile =3D load_toml_file(lockfile)
> +
> + # key is the repo url, value is a boolean, which is used later
> + # to indicate if there is a matching repository in SRC_URI also
> + lockfile_git_repos =3D {}
> + for p in lockfile['package']:
> + if 'source' in p and p['source'].startswith('git+'):
> + lockfile_git_repos[p['source']] =3D False
> +
> + sources =3D dict()
> workdir =3D d.getVar('UNPACKDIR')
> fetcher =3D bb.fetch2.Fetch(src_uri, d)
> +
> + vendor_folder =3D os.path.join(workdir, 'yocto-vendored-source-crates')
> +
> + os.makedirs(vendor_folder)
> +
> for url in fetcher.urls:
> ud =3D fetcher.ud[url]
> - if ud.type =3D=3D 'git' or ud.type =3D=3D 'gitsm':
> - name =3D ud.parm.get('name')
> - destsuffix =3D ud.parm.get('destsuffix')
> - if name is not None and destsuffix is not None:
> - if ud.user:
> - repo =3D '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
> - else:
> - repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
> - path =3D '%s =3D { path =3D "%s" }' % (name, os.path.join(workdir,
> destsuffix))
> - patches.setdefault(repo, []).append(path)
> + if ud.type !=3D 'git' and ud.type !=3D 'gitsm':
> + continue
>=20
> - with open(cargo_config, "a+") as config:
> - for k, v in patches.items():
> - print('\n[patch."%s"]' % k, file=3Dconfig)
> - for name in v:
> - print(name, file=3Dconfig)
> + destsuffix =3D ud.parm.get('destsuffix')
> + crate_folder =3D os.path.join(workdir, destsuffix)
>=20
> - if not patches:
> - return
> + if destsuffix is None or not is_rust_crate_folder(crate_folder):
> + continue
>=20
> - # Cargo.lock file is needed for to be sure that artifacts
> - # downloaded by the fetch steps are those expected by the
> - # project and that the possible patches are correctly applied.
> - # Moreover since we do not want any modification
> - # of this file (for reproducibility purpose), we prevent it by
> - # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
> - # here is better than letting cargo tell (in case the file is missing)
> - # "Cargo.lock should be modified but --frozen was given"
> + if ud.user:
> + repo =3D '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
> + else:
> + repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
>=20
> - lockfile =3D d.getVar("CARGO_LOCK_PATH")
> - if not os.path.exists(lockfile):
> - bb.fatal(f"{lockfile} file doesn't exist")
> + sources[destsuffix] =3D (repo, ud.revision, crate_folder)
> +
> + cargo_toml_path =3D os.path.join(workdir, destsuffix, 'Cargo.toml')
> + cargo_toml =3D load_toml_file(cargo_toml_path)
> +
> + if 'workspace' in cargo_toml:
> + members =3D cargo_toml['workspace']['members']
> + for member in members:
> + member_crate_folder =3D os.path.join(workdir, destsuffix, member)
> + member_crate_cargo_toml =3D os.path.join(member_crate_folder,
> 'Cargo.toml')
> + member_cargo_toml =3D load_toml_file(member_crate_cargo_toml)
> + member_crate_name =3D member_cargo_toml['package']['name']
> + shutil.copytree(member_crate_folder, os.path.join(vendor_folder,
> member_crate_name))
> +
> + if 'package' in cargo_toml:
> + crate_folder =3D os.path.join(workdir, destsuffix)
> + crate_name =3D cargo_toml['package']['name']
> + shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
> +
> + for d in os.scandir(vendor_folder):
> + if d.is_dir():
> + create_cargo_checksum(d.path)
> +
> +
> + with open(cargo_config, "a+") as config:
> + print('\n[source."yocto-vendored-sources"]', file=3Dconfig)
> + print('directory =3D "%s"' % vendor_folder, file=3Dconfig)
> +
> + for destsuffix, (repo, revision, repo_path) in sources.items():
> + lockfile_repo =3D get_matching_repo_from_lockfile(lockfile_git_repos,
> repo, revision)
> + print('\n[source."%s"]' % lockfile_repo, file=3Dconfig)
> + print('git =3D "%s"' % repo, file=3Dconfig)
> + print('rev =3D "%s"' % revision, file=3Dconfig)
> + print('replace-with =3D "yocto-vendored-sources"', file=3Dconfig)
> +
> + # check if there are any git repos in the lock file that were not
> visited
> + # in the previous loop, when the source replacement was created, and
> warn about it
> + for lf_repo, found_in_src_uri in lockfile_git_repos.items():
> + if not found_in_src_uri:
> + bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>=20
> - # There are patched files and so Cargo.lock should be modified but we
> use
> - # --frozen so let's handle that modifications here.
> - #
> - # Note that a "better" (more elegant ?) would have been to use cargo
> update for
> - # patched packages:
> - # cargo update --offline -p package_1 -p package_2
> - # But this is not possible since it requires that cargo local git db
> - # to be populated and this is not the case as we fetch git repo ourself=
.
>=20
> -
> - lockfile_orig =3D lockfile + ".orig"
> - if not os.path.exists(lockfile_orig):
> - shutil.copy(lockfile, lockfile_orig)
> -
> - newlines =3D []
> - with open(lockfile_orig, "r") as f:
> - for line in f.readlines():
> - if not line.startswith("source =3D \"git"):
> - newlines.append(line)
> -
> - with open(lockfile, "w") as f:
> - f.writelines(newlines)
> }
> +
> do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
>=20
> do_compile:prepend () {

--OVyOCO9n5uMzri6fuo82
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat, Oct 4, 2025 at 03:00 AM, Gyorgy Sarvari wrote:</div>
<div>
<blockquote>Cargo.toml files usually contain a list of dependencies in one =
of two forms:<br />either a crate name that can be fetched from some regist=
ry (like crates.io), or<br />as a source crate, which is most often fetched=
 from a git repository.<br /><br />Normally cargo handles fetching the crat=
es from both the registry and from git,<br />however with Yocto this task i=
s taken over by Bitbake.<br /><br />After fetching these crates, they are m=
ade available to cargo by adding the location<br />to $CARGO_HOME/config.to=
ml. The source crates are of interest here: each git repository<br />that c=
an be found in the SRC_URI is added as one source crate.<br /><br />This wo=
rks most of the time, as long as the repository really contains one crate o=
nly.<br /><br />However in case the repository is a cargo workspace, it con=
tains multiple crates in<br />different subfolders, and in order to allow c=
argo to process them, they need to be<br />listed separately. This is not h=
appening with the current implementation of cargo_common.<br /><br />This c=
hange introduces the following:<br />- instead of patching the dependencies=
, use source replacement (the primary motivation for<br />this was that mat=
urin seems to ignore source crate patches from config.toml)<br />- the abov=
e also allows to keep the original Cargo.lock untouched (the original imple=
mentation<br />deleted git repository lines from it)<br />- it adds a new f=
older, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processi=
ng<br />the separate crate folders are copied into this folder, and it is u=
sed as the central<br />vendoring folder. This is needed for source replace=
ments: the folder that is used for<br />vendoring needs to contain the crat=
es separately, one crate in one folder. Each folder<br />has the name of th=
e crate that it contains. Workspaces are not included here (unless the<br /=
>given manifest is a workspace AND a package at once)<br />- previuosly the=
 SRC_URI had to contain a "name" and a "destsuffix" parameter to be conside=
red<br />to be a rust crate. The name is not derived from the Cargo.toml fi=
le, not from the SRC_URI.<br />Having destsuffix is still mandatory though.=
<br /><br />The change does not handle nested workspaces, only the top leve=
l Cargo.toml is processed.</blockquote>
I would like to understand more about this transition.<br />Does this patch=
 address any regression or bug? If so, please provide more details.<br />As=
 mentioned it is meant of maturin crate to handle the patches. <br />Can th=
is be done at the crate level?<br /><br />The python errors can be fixed by=
 replacing tomlib (deprecated from python 3.14 ) with tomli.<br /><br />The=
 Cargo.lock seems to missing from sysroot and breaks the build after this p=
atch.<br />ERROR: libstd-rs-1.90.0-r0 do_configure: /home/user/poky/build/t=
mp/work/x86-64-v3-poky-linux/libstd-rs/1.90.0/sources/rustc-1.90.0-src/libr=
ary/sysroot/Cargo.lock file doesn't exist<br /><br /><br />
<blockquote>Signed-off-by: Gyorgy Sarvari &lt;skandigraun@gmail.com&gt;<br =
/>Cc: Tom Geelen &lt;t.f.g.geelen@gmail.com&gt;<br /><br />---<br />meta/cl=
asses-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------<br />1 file=
 changed, 108 insertions(+), 50 deletions(-)<br /><br />diff --git a/meta/c=
lasses-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbcla=
ss<br />index c9eb2d09a5..79c1351298 100644<br />--- a/meta/classes-recipe/=
cargo_common.bbclass<br />+++ b/meta/classes-recipe/cargo_common.bbclass<br=
 />@@ -129,6 +129,44 @@ cargo_common_do_configure () {<br />python cargo_co=
mmon_do_patch_paths() {<br />import shutil<br /><br />+ def is_rust_crate_f=
older(path):<br />+ cargo_toml_path =3D os.path.join(path, 'Cargo.toml')<br=
 />+ return os.path.exists(cargo_toml_path)<br />+<br />+ def load_toml_fil=
e(toml_path):<br />+ import tomllib<br />+ with open(toml_path, 'rb') as f:=
<br />+ toml =3D tomllib.load(f)</blockquote>
Use tomli here.<br />
<blockquote>+ return toml<br />+<br />+ def get_matching_repo_from_lockfile=
(lockfile_repos, repo, revision):<br />+ for lf_repo in lockfile_repos.keys=
():<br />+ if repo in lf_repo and lf_repo.endswith(revision):<br />+ lockfi=
le_repos[lf_repo] =3D True<br />+ return lf_repo.split("#")[0]<br />+ bb.fa=
tal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (rep=
o, revision))<br />+<br />+ def create_cargo_checksum(folder_path):<br />+ =
checksum_path =3D os.path.join(folder_path, '.cargo-checksum.json')<br />+ =
if os.path.exists(checksum_path):<br />+ return<br />+<br />+ import hashli=
b, json<br />+<br />+ checksum =3D {'files': {}}<br />+ for root, _, files =
in os.walk(folder_path):<br />+ for f in files:<br />+ full_path =3D os.pat=
h.join(root, f)<br />+ relative_path =3D os.path.relpath(full_path, folder_=
path)<br />+ if relative_path.startswith(".git/"):<br />+ continue<br />+ w=
ith open(full_path, 'rb') as f2:<br />+ file_sha =3D hashlib.sha256(f2.read=
()).hexdigest()<br />+ checksum["files"][relative_path] =3D file_sha<br />+=
<br />+ with open(checksum_path, 'w') as f:<br />+ json.dump(checksum, f)<b=
r />+<br />cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config.to=
ml")<br />if not os.path.exists(cargo_config):<br />return<br />@@ -137,66 =
+175,86 @@ python cargo_common_do_patch_paths() {<br />if len(src_uri) =3D=
=3D 0:<br />return<br /><br />- patches =3D dict()<br />+ lockfile =3D d.ge=
tVar("CARGO_LOCK_PATH")<br />+ if not os.path.exists(lockfile):<br />+ bb.f=
atal(f"{lockfile} file doesn't exist")<br />+<br />+ lockfile =3D load_toml=
_file(lockfile)<br />+<br />+ # key is the repo url, value is a boolean, wh=
ich is used later<br />+ # to indicate if there is a matching repository in=
 SRC_URI also<br />+ lockfile_git_repos =3D {}<br />+ for p in lockfile['pa=
ckage']:<br />+ if 'source' in p and p['source'].startswith('git+'):<br />+=
 lockfile_git_repos[p['source']] =3D False<br />+<br />+ sources =3D dict()=
<br />workdir =3D d.getVar('UNPACKDIR')<br />fetcher =3D bb.fetch2.Fetch(sr=
c_uri, d)<br />+<br />+ vendor_folder =3D os.path.join(workdir, 'yocto-vend=
ored-source-crates')<br />+<br />+ os.makedirs(vendor_folder)<br />+<br />f=
or url in fetcher.urls:<br />ud =3D fetcher.ud[url]<br />- if ud.type =3D=
=3D 'git' or ud.type =3D=3D 'gitsm':<br />- name =3D ud.parm.get('name')<br=
 />- destsuffix =3D ud.parm.get('destsuffix')<br />- if name is not None an=
d destsuffix is not None:<br />- if ud.user:<br />- repo =3D '%s://%s@%s%s'=
 % (ud.proto, ud.user, ud.host, ud.path)<br />- else:<br />- repo =3D '%s:/=
/%s%s' % (ud.proto, ud.host, ud.path)<br />- path =3D '%s =3D { path =3D "%=
s" }' % (name, os.path.join(workdir, destsuffix))<br />- patches.setdefault=
(repo, []).append(path)<br />+ if ud.type !=3D 'git' and ud.type !=3D 'gits=
m':<br />+ continue<br /><br />- with open(cargo_config, "a+") as config:<b=
r />- for k, v in patches.items():<br />- print('\n[patch."%s"]' % k, file=
=3Dconfig)<br />- for name in v:<br />- print(name, file=3Dconfig)<br />+ d=
estsuffix =3D ud.parm.get('destsuffix')<br />+ crate_folder =3D os.path.joi=
n(workdir, destsuffix)<br /><br />- if not patches:<br />- return<br />+ if=
 destsuffix is None or not is_rust_crate_folder(crate_folder):<br />+ conti=
nue<br /><br />- # Cargo.lock file is needed for to be sure that artifacts<=
br />- # downloaded by the fetch steps are those expected by the<br />- # p=
roject and that the possible patches are correctly applied.<br />- # Moreov=
er since we do not want any modification<br />- # of this file (for reprodu=
cibility purpose), we prevent it by<br />- # using --frozen flag (in CARGO_=
BUILD_FLAGS) and raise a clear error<br />- # here is better than letting c=
argo tell (in case the file is missing)<br />- # "Cargo.lock should be modi=
fied but --frozen was given"<br />+ if ud.user:<br />+ repo =3D '%s://%s@%s=
%s' % (ud.proto, ud.user, ud.host, ud.path)<br />+ else:<br />+ repo =3D '%=
s://%s%s' % (ud.proto, ud.host, ud.path)<br /><br />- lockfile =3D d.getVar=
("CARGO_LOCK_PATH")<br />- if not os.path.exists(lockfile):<br />- bb.fatal=
(f"{lockfile} file doesn't exist")<br />+ sources[destsuffix] =3D (repo, ud=
.revision, crate_folder)<br />+<br />+ cargo_toml_path =3D os.path.join(wor=
kdir, destsuffix, 'Cargo.toml')<br />+ cargo_toml =3D load_toml_file(cargo_=
toml_path)<br />+<br />+ if 'workspace' in cargo_toml:<br />+ members =3D c=
argo_toml['workspace']['members']<br />+ for member in members:<br />+ memb=
er_crate_folder =3D os.path.join(workdir, destsuffix, member)<br />+ member=
_crate_cargo_toml =3D os.path.join(member_crate_folder, 'Cargo.toml')<br />=
+ member_cargo_toml =3D load_toml_file(member_crate_cargo_toml)<br />+ memb=
er_crate_name =3D member_cargo_toml['package']['name']<br />+ shutil.copytr=
ee(member_crate_folder, os.path.join(vendor_folder, member_crate_name))<br =
/>+<br />+ if 'package' in cargo_toml:<br />+ crate_folder =3D os.path.join=
(workdir, destsuffix)<br />+ crate_name =3D cargo_toml['package']['name']<b=
r />+ shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name)=
)<br />+<br />+ for d in os.scandir(vendor_folder):<br />+ if d.is_dir():<b=
r />+ create_cargo_checksum(d.path)<br />+<br />+<br />+ with open(cargo_co=
nfig, "a+") as config:<br />+ print('\n[source."yocto-vendored-sources"]', =
file=3Dconfig)<br />+ print('directory =3D "%s"' % vendor_folder, file=3Dco=
nfig)<br />+<br />+ for destsuffix, (repo, revision, repo_path) in sources.=
items():<br />+ lockfile_repo =3D get_matching_repo_from_lockfile(lockfile_=
git_repos, repo, revision)<br />+ print('\n[source."%s"]' % lockfile_repo, =
file=3Dconfig)<br />+ print('git =3D "%s"' % repo, file=3Dconfig)<br />+ pr=
int('rev =3D "%s"' % revision, file=3Dconfig)<br />+ print('replace-with =
=3D "yocto-vendored-sources"', file=3Dconfig)<br />+<br />+ # check if ther=
e are any git repos in the lock file that were not visited<br />+ # in the =
previous loop, when the source replacement was created, and warn about it<b=
r />+ for lf_repo, found_in_src_uri in lockfile_git_repos.items():<br />+ i=
f not found_in_src_uri:<br />+ bb.warn(f"{lf_repo} is present in lockfile, =
but not found in SRC_URI")<br /><br />- # There are patched files and so Ca=
rgo.lock should be modified but we use<br />- # --frozen so let's handle th=
at modifications here.<br />- #<br />- # Note that a "better" (more elegant=
 ?) would have been to use cargo update for<br />- # patched packages:<br /=
>- # cargo update --offline -p package_1 -p package_2<br />- # But this is =
not possible since it requires that cargo local git db<br />- # to be popul=
ated and this is not the case as we fetch git repo ourself.<br />-<br />- l=
ockfile_orig =3D lockfile + ".orig"<br />- if not os.path.exists(lockfile_o=
rig):<br />- shutil.copy(lockfile, lockfile_orig)<br />-<br />- newlines =
=3D []<br />- with open(lockfile_orig, "r") as f:<br />- for line in f.read=
lines():<br />- if not line.startswith("source =3D \"git"):<br />- newlines=
.append(line)<br />-<br />- with open(lockfile, "w") as f:<br />- f.writeli=
nes(newlines)<br />}<br />+<br />do_configure[postfuncs] +=3D "cargo_common=
_do_patch_paths"<br /><br />do_compile:prepend () {</blockquote>
</div>

--OVyOCO9n5uMzri6fuo82--

