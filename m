Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id E712B71B1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 04:49:41 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id 80so69893798uas.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 21:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nMAePWx8GOfMxiquEtV05vt5b932r4hzc5rpnMYrkZg=;
	b=LM0bnp6AtQ8iKQ87+RmOvzBXNFUSemXwYail6JSLZRZQnIcVLDjj10wfp6Zq8WGZ4D
	agy+r3L6As36CLsLXYtQiAYwMAk1zG4d4cvOIMaPbL2PK4r3ZQSLfjDTIj8d5cpDznP5
	FKq8suaDcmrwGJYsyILN4om84vOAzhAWSescBECtrJaAdZuKBEeDsCAXzeVnBXWRjyAc
	SSqunHqRjcYWPD5dITrcn2EEbjASTBqeHUz1dzgykAPBNHIvFuB0P2LF88xWxQ/N+VIS
	Hp2hzOLRbMdN6cXocxIRrtguVlQJ2IP+v4tEplRXRM0SQon1UyZazcOdXGTKt39v68ml
	nniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nMAePWx8GOfMxiquEtV05vt5b932r4hzc5rpnMYrkZg=;
	b=DfG3spWmeuThaKqOAttV18DmFQbZVordw9BQgoBJUPFVQhVnVTFgive55GjnNMTHfH
	8PK4QXwHRhgoBYDO0+fteEt69KHNVVFhWTo8oxHqVVspKXaLYp5jPA8ZM3lRP0x5DITl
	ominI/FpCALdvcyv0s0/hJ5hq+yoCAxtEpFeP2Q3zrUD2ZhROgqbiTfu8JBpCsLbUClK
	x3BMemcxC8ftWHr6vQfTYpZrdoiTZdUJGBv1BUaL0amF8lhnDlRlF2bcRo0PkohXRSYS
	1ZD0vP+2sgZmKEkkDs/RmMNRxLS95a6sryajL0PQKsYYhNwIuVjmt4yBWNCIrYoz/qYI
	+vcQ==
X-Gm-Message-State: AIVw113NaVP/odwGaHJNXByLh7YLA4sKBJCkS0eLtCEa2nF+JPtHMbwK
	oHVlDSeY/BWdrKZzpd5deAlGyvtyVmhh
X-Received: by 10.176.6.97 with SMTP id f88mr9386193uaf.22.1500871782744; Sun,
	23 Jul 2017 21:49:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Sun, 23 Jul 2017 21:49:42 -0700 (PDT)
In-Reply-To: <1500871679-31914-1-git-send-email-liu.ming50@gmail.com>
References: <1500871679-31914-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 24 Jul 2017 06:49:42 +0200
Message-ID: <CALatG=5u6366RES3y70weE6k5tpeWPc6xbQkd2zhkLvAo84HBg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH V2] meta: revise cve_check
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
X-List-Received-Date: Mon, 24 Jul 2017 04:49:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c12292e76c63b055508f1cd"

--94eb2c12292e76c63b055508f1cd
Content-Type: text/plain; charset="UTF-8"

Changes in V2:

Added a missing "do_cve_check_write_manifest[dirs] = "${DEPLOY_DIR_IMAGE}"".

//Ming Liu

2017-07-24 6:47 GMT+02:00 <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> The current cve_check has some drawbacks:
> - cve_check_write_rootfs_manifest is being added to
>   ROOTFS_POSTPROCESS_COMMAND, but it actually has nothing to do related
>   to generating a rootfs, but just deploying cve reports to DEPLOY_DIR,
>   this leads do_rootfs/do_image unnecessarily rerun when the task hash
>   changed of cve_check_write_rootfs_manifest.
> - The generated cve manifest should be image specific, but it does not
>   work in that way so far, for instance, if the users bitbake two
>   images at the same time, both of them will have all CVE reports even
>   though the recipes are not being depended neither at run time nor at
>   build time by a image, for instance, if a user run:
>   "bitbake core-image-minimal-initramfs core-image-minimal", he/she
>   will find the cve manifest of core-image-minimal-initramfs cantians
>   some recipe names depended by core-image-minimal but not by itself.
> - do_cve_check should be excluded for image recipes, it does not make
>   sense to be run for image.
> - There is a code snippet checking and cleaning cve-check recipe result
>   before re-building, introduced by following commit 85b4941c:
>   [ cve-check: clean cve-check recipe result before re-building ]
>   this checking is necessary which I agree with the author, but the
>   code snippet was put into cve_check_write_rootfs_manifest which
>   supposes to run in ROOTFS_POSTPROCESS_COMMAND, and it's trying to
>   locate the cve reports by PN, then how could it work since the PN is
>   always the image recipe name?
>
> So this patch mainly aims to fix the above drawbacks, by:
> - Add a inter-task do_cve_check_write_manifest to image recipes,
>   detecting do_cve_check dependencies from BB_TASKDEPDATA, this ensures
>   all the cve-check reports in the generated manifest are really
>   related to a specific image build.
> - Add do_cve_check task only for non-image recipes.
> - Move the "cleaning cve-check recipe result before re-building" logic
>   to do_cve_check.
> - Drop the CVE_CHECK_TMP_FILE and related processes, I think it's sort
>   of tricky to have to delete it in a bb.cooker.CookerExit handler, we
>   can use CVE_CHECK_DB_FILE to determine if the database had been
>   updated correctly or not.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/cve-check.bbclass                     | 123
> ++++++++++++++-------
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |   9 +-
>  2 files changed, 86 insertions(+), 46 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.
> bbclass
> index 6f5b0f5..2860afe 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -29,7 +29,6 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
>
>  CVE_CHECK_LOCAL_DIR ?= "${WORKDIR}/cve"
>  CVE_CHECK_LOCAL_FILE ?= "${CVE_CHECK_LOCAL_DIR}/cve.log"
> -CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
>
>  CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
>  CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_
> NAME}${IMAGE_NAME_SUFFIX}.cve"
> @@ -46,12 +45,27 @@ CVE_CHECK_CVE_WHITELIST = "{\
>      'CVE-2014-2524': ('6.3','5.2',), \
>  }"
>
> +python () {
> +    if bb.data.inherits_class('image', d):
> +        bb.build.addtask('do_cve_check_write_manifest', 'do_build',
> None, d)
> +    else:
> +        bb.build.addtask('do_cve_check', None, 'do_unpack', d)
> +        bb.build.addtask('do_cve_checkall', 'do_build', 'do_cve_check',
> d)
> +}
> +
>  python do_cve_check () {
>      """
>      Check recipe for patched and unpatched CVEs
>      """
>
> -    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
> +    # Remove the cve report in previous build to prevent old cves kept in
> +    # CVE_CHECK_DIR in case there is no result for current one, which can
> +    # happen on version upgrading or when cve/recipe is whitelisted.
> +    old_cve_file = os.path.join(d.getVar("CVE_CHECK_DIR"),
> d.getVar("PN"))
> +    if os.path.exists(old_cve_file):
> +        bb.utils.remove(old_cve_file)
> +
> +    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
>          patched_cves = get_patches_cves(d)
>          patched, unpatched = check_cves(d, patched_cves)
>          if patched or unpatched:
> @@ -61,53 +75,86 @@ python do_cve_check () {
>          bb.note("Failed to update CVE database, skipping CVE check")
>  }
>
> -addtask cve_check after do_unpack before do_build
>  do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot
> cve-check-tool-native:do_populate_cve_db"
>  do_cve_check[nostamp] = "1"
>
> -python cve_check_cleanup () {
> -    """
> -    Delete the file used to gather all the CVE information.
> -    """
> -
> -    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
> +# Dependency placeholder
> +do_cve_checkall () {
> +       :
>  }
>
> -addhandler cve_check_cleanup
> -cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
> +do_cve_checkall[recrdeptask] = "do_cve_checkall do_cve_check"
> +do_cve_checkall[noexec] = "1"
>
> -python cve_check_write_rootfs_manifest () {
> +python do_cve_check_write_manifest () {
>      """
>      Create CVE manifest when building an image
>      """
>
> -    import shutil
> -
> -    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
> -        deploy_file = os.path.join(d.getVar("CVE_CHECK_DIR"),
> d.getVar("PN"))
> -        if os.path.exists(deploy_file):
> -            bb.utils.remove(deploy_file)
> -
> -    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
> -        bb.note("Writing rootfs CVE manifest")
> +    if d.getVar("CVE_CHECK_CREATE_MANIFEST") != "1":
> +        return
> +
> +    from datetime import datetime
> +
> +    depends = set()
> +    rdepends = set()
> +    cve_dir = d.getVar("CVE_CHECK_DIR")
> +    manifest_name = d.getVar("CVE_CHECK_MANIFEST")
> +    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
> +    for taskdep in taskdepdata:
> +        if taskdepdata[taskdep][1] == "do_cve_check_write_manifest":
> +            for dep in taskdepdata[taskdep][3]:
> +                if taskdepdata[dep][1] == "do_cve_check":
> +                    pn = taskdepdata[dep][0]
> +                    # Skip the recipes do not have cve report
> +                    if not os.path.exists(os.path.join(cve_dir, pn)):
> +                        continue
> +                    if pn.find('-native') != -1 or pn.find('-cross') !=
> -1:
> +                        depends.add(pn)
> +                    else:
> +                        rdepends.add(pn)
> +
> +    # Sort the results
> +    depends = sorted(depends)
> +    rdepends = sorted(rdepends)
> +
> +    bb.note("Writing CVE manifest")
> +    if rdepends or depends:
> +        utctime = datetime.utcfromtimestamp(os.
> path.getmtime(d.getVar("CVE_CHECK_DB_FILE")))
> +        summary = "CVE database was updated on %s UTC\n" % utctime
> +        summary += "Patched/Unpatched CVEs found in target recipes: %s\n"
> % " ".join(rdepends) if rdepends else ""
> +        summary += "Patched/Unpatched CVEs found in native/cross recipes:
> %s\n" % " ".join(depends) if depends else ""
> +        summary += "Check out the details below\n\n"
> +        with open(manifest_name, 'a') as f:
> +            f.write(summary)
> +
> +    # First, write CVEs impacting target system, then write CVEs
> impacting build system
> +    for pn in rdepends + depends:
> +        cve_file = os.path.join(cve_dir, pn)
> +        if os.path.exists(cve_file):
> +            with open(cve_file, 'r') as input:
> +                cve_text = input.read()
> +                with open(manifest_name, 'a') as output:
> +                    output.write(cve_text)
> +
> +    if manifest_name and os.path.exists(manifest_name):
>          deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
>          link_name = d.getVar("IMAGE_LINK_NAME")
> -        manifest_name = d.getVar("CVE_CHECK_MANIFEST")
> -        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
> -
> -        shutil.copyfile(cve_tmp_file, manifest_name)
> -
> -        if manifest_name and os.path.exists(manifest_name):
> -            manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
> -            # If we already have another manifest, update symlinks
> -            if os.path.exists(os.path.realpath(manifest_link)):
> -                os.remove(manifest_link)
> -            os.symlink(os.path.basename(manifest_name), manifest_link)
> -            bb.plain("Image CVE report stored in: %s" % manifest_name)
> +        manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
> +        # If we already have another manifest, update symlinks
> +        if os.path.exists(os.path.realpath(manifest_link)):
> +            os.remove(manifest_link)
> +        os.symlink(os.path.basename(manifest_name), manifest_link)
> +        bb.plain("Image CVE report stored in: %s" % manifest_name)
> +
> +    if d.getVar("CVE_CHECK_COPY_FILES") != "1":
> +        bb.utils.remove(d.getVar('CVE_CHECK_DIR'), True)
>  }
>
> -ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest;
> ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
> -do_rootfs[recrdeptask] += "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
> +do_cve_check_write_manifest[vardepsexclude] = "BB_TASKDEPDATA"
> +do_cve_check_write_manifest[recrdeptask] = "do_cve_checkall do_cve_check"
> +do_cve_check_write_manifest[dirs] = "${DEPLOY_DIR_IMAGE}"
> +do_cve_check_write_manifest[nostamp] = "1"
>
>  def get_patches_cves(d):
>      """
> @@ -264,13 +311,9 @@ def cve_write_data(d, patched, unpatched, cve_data):
>          bb.note("Writing file %s with CVE information" % cve_file)
>          f.write(write_string)
>
> -    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
> +    if d.getVar("CVE_CHECK_COPY_FILES") == "1" or
> d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
>          cve_dir = d.getVar("CVE_CHECK_DIR")
>          bb.utils.mkdirhier(cve_dir)
>          deploy_file = os.path.join(cve_dir, d.getVar("PN"))
>          with open(deploy_file, "w") as f:
>              f.write(write_string)
> -
> -    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
> -        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
> -            f.write("%s" % write_string)
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> index 4829b11..55fe690 100644
> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> +++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> @@ -36,20 +36,17 @@ do_populate_cve_db() {
>
>      # In case we don't inherit cve-check class, use default values
> defined in the class.
>      cve_dir="${CVE_CHECK_DB_DIR}"
> -    cve_file="${CVE_CHECK_TMP_FILE}"
> -
>      [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
> -    [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
>
>      bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
>      # --cacert works around curl-native not finding the CA bundle
> -    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt
> -d "$cve_dir" ; then
> -        printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date
> --utc +'%F %T')" > "$cve_file"
> -    else
> +    if ! cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt
> -d "$cve_dir" ; then
>          bbwarn "Error in executing cve-check-update"
>          if [ "${@'1' if bb.data.inherits_class('cve-check', d) else
> '0'}" -ne 0 ] ; then
>              bbwarn "Failed to update cve-check-tool database, CVEs won't
> be checked"
>          fi
> +        # Clean up leftovers of a unsuccessful updating
> +        rm -rf $cve_dir/*
>      fi
>  }
>
> --
> 2.7.4
>
>

--94eb2c12292e76c63b055508f1cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Changes in V2:<div><br></div><div>Added a missing &quot;<s=
pan style=3D"font-size:14px">do_cve_check_write_manifest[</span><wbr style=
=3D"font-size:14px"><span style=3D"font-size:14px">dirs] =3D &quot;${DEPLOY=
_DIR_IMAGE}&quot;</span>&quot;.</div><div><br></div><div>//Ming Liu</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-07-24 6:=
47 GMT+02:00  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com"=
 target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span>:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.at=
lascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
<br>
The current cve_check has some drawbacks:<br>
- cve_check_write_rootfs_<wbr>manifest is being added to<br>
=C2=A0 ROOTFS_POSTPROCESS_COMMAND, but it actually has nothing to do relate=
d<br>
=C2=A0 to generating a rootfs, but just deploying cve reports to DEPLOY_DIR=
,<br>
=C2=A0 this leads do_rootfs/do_image unnecessarily rerun when the task hash=
<br>
=C2=A0 changed of cve_check_write_rootfs_<wbr>manifest.<br>
- The generated cve manifest should be image specific, but it does not<br>
=C2=A0 work in that way so far, for instance, if the users bitbake two<br>
=C2=A0 images at the same time, both of them will have all CVE reports even=
<br>
=C2=A0 though the recipes are not being depended neither at run time nor at=
<br>
=C2=A0 build time by a image, for instance, if a user run:<br>
=C2=A0 &quot;bitbake core-image-minimal-initramfs core-image-minimal&quot;,=
 he/she<br>
=C2=A0 will find the cve manifest of core-image-minimal-initramfs cantians<=
br>
=C2=A0 some recipe names depended by core-image-minimal but not by itself.<=
br>
- do_cve_check should be excluded for image recipes, it does not make<br>
=C2=A0 sense to be run for image.<br>
- There is a code snippet checking and cleaning cve-check recipe result<br>
=C2=A0 before re-building, introduced by following commit 85b4941c:<br>
=C2=A0 [ cve-check: clean cve-check recipe result before re-building ]<br>
=C2=A0 this checking is necessary which I agree with the author, but the<br=
>
=C2=A0 code snippet was put into cve_check_write_rootfs_<wbr>manifest which=
<br>
=C2=A0 supposes to run in ROOTFS_POSTPROCESS_COMMAND, and it&#39;s trying t=
o<br>
=C2=A0 locate the cve reports by PN, then how could it work since the PN is=
<br>
=C2=A0 always the image recipe name?<br>
<br>
So this patch mainly aims to fix the above drawbacks, by:<br>
- Add a inter-task do_cve_check_write_manifest to image recipes,<br>
=C2=A0 detecting do_cve_check dependencies from BB_TASKDEPDATA, this ensure=
s<br>
=C2=A0 all the cve-check reports in the generated manifest are really<br>
=C2=A0 related to a specific image build.<br>
- Add do_cve_check task only for non-image recipes.<br>
- Move the &quot;cleaning cve-check recipe result before re-building&quot; =
logic<br>
=C2=A0 to do_cve_check.<br>
- Drop the CVE_CHECK_TMP_FILE and related processes, I think it&#39;s sort<=
br>
=C2=A0 of tricky to have to delete it in a bb.cooker.CookerExit handler, we=
<br>
=C2=A0 can use CVE_CHECK_DB_FILE to determine if the database had been<br>
=C2=A0 updated correctly or not.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 123 ++++++++++++++-------<br>
=C2=A0.../cve-check-tool/<a href=3D"http://cve-check-tool_5.6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-check-<wbr>tool_5.6.4.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A02 files changed, 86 insertions(+), 46 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.<wbr>bbclass b/meta/classes/cve-check.<=
wbr>bbclass<br>
index 6f5b0f5..2860afe 100644<br>
--- a/meta/classes/cve-check.<wbr>bbclass<br>
+++ b/meta/classes/cve-check.<wbr>bbclass<br>
@@ -29,7 +29,6 @@ CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/nvd.db&q=
uot;<br>
<br>
=C2=A0CVE_CHECK_LOCAL_DIR ?=3D &quot;${WORKDIR}/cve&quot;<br>
=C2=A0CVE_CHECK_LOCAL_FILE ?=3D &quot;${CVE_CHECK_LOCAL_DIR}/cve.<wbr>log&q=
uot;<br>
-CVE_CHECK_TMP_FILE ?=3D &quot;${TMPDIR}/cve_check&quot;<br>
<br>
=C2=A0CVE_CHECK_DIR ??=3D &quot;${DEPLOY_DIR}/cve&quot;<br>
=C2=A0CVE_CHECK_MANIFEST ?=3D &quot;${DEPLOY_DIR_IMAGE}/${IMAGE_<wbr>NAME}$=
{IMAGE_NAME_SUFFIX}.cve&quot;<br>
@@ -46,12 +45,27 @@ CVE_CHECK_CVE_WHITELIST =3D &quot;{\<br>
=C2=A0 =C2=A0 =C2=A0&#39;CVE-2014-2524&#39;: (&#39;6.3&#39;,&#39;5.2&#39;,)=
, \<br>
=C2=A0}&quot;<br>
<br>
+python () {<br>
+=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;image&#39;<wbr>, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_cve_<wbr>check_write_=
manifest&#39;, &#39;do_build&#39;, None, d)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_cve_<wbr>check&#39;, =
None, &#39;do_unpack&#39;, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_cve_<wbr>checkall&#39=
;, &#39;do_build&#39;, &#39;do_cve_check&#39;, d)<br>
+}<br>
+<br>
=C2=A0python do_cve_check () {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Check recipe for patched and unpatched CVEs<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_<wbr>CHECK_TMP_FILE&quo=
t;)):<br>
+=C2=A0 =C2=A0 # Remove the cve report in previous build to prevent old cve=
s kept in<br>
+=C2=A0 =C2=A0 # CVE_CHECK_DIR in case there is no result for current one, =
which can<br>
+=C2=A0 =C2=A0 # happen on version upgrading or when cve/recipe is whitelis=
ted.<br>
+=C2=A0 =C2=A0 old_cve_file =3D os.path.join(d.getVar(&quot;CVE_<wbr>CHECK_=
DIR&quot;), d.getVar(&quot;PN&quot;))<br>
+=C2=A0 =C2=A0 if os.path.exists(old_cve_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(old_cve_file)<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_<wbr>CHECK_DB_FILE&quot=
;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patched_cves =3D get_patches_cves(d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patched, unpatched =3D check_cves(d, patc=
hed_cves)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if patched or unpatched:<br>
@@ -61,53 +75,86 @@ python do_cve_check () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Failed to update CVE databa=
se, skipping CVE check&quot;)<br>
=C2=A0}<br>
<br>
-addtask cve_check after do_unpack before do_build<br>
=C2=A0do_cve_check[depends] =3D &quot;cve-check-tool-native:do_<wbr>populat=
e_sysroot cve-check-tool-native:do_<wbr>populate_cve_db&quot;<br>
=C2=A0do_cve_check[nostamp] =3D &quot;1&quot;<br>
<br>
-python cve_check_cleanup () {<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Delete the file used to gather all the CVE information.<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-<br>
-=C2=A0 =C2=A0 bb.utils.remove(e.data.getVar(<wbr>&quot;CVE_CHECK_TMP_FILE&=
quot;))<br>
+# Dependency placeholder<br>
+do_cve_checkall () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
=C2=A0}<br>
<br>
-addhandler cve_check_cleanup<br>
-cve_check_cleanup[eventmask] =3D &quot;bb.cooker.CookerExit&quot;<br>
+do_cve_checkall[recrdeptask] =3D &quot;do_cve_checkall do_cve_check&quot;<=
br>
+do_cve_checkall[noexec] =3D &quot;1&quot;<br>
<br>
-python cve_check_write_rootfs_<wbr>manifest () {<br>
+python do_cve_check_write_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Create CVE manifest when building an image<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 import shutil<br>
-<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_<wbr>FILES&quot;) =3D=3D &q=
uot;1&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_file =3D os.path.join(d.getVar(&quot;CV=
E_<wbr>CHECK_DIR&quot;), d.getVar(&quot;PN&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(deploy_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(deploy_file)<br>
-<br>
-=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_<wbr>CHECK_TMP_FILE&quo=
t;)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Writing rootfs CVE manifest&quot=
;)<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_CREATE_<wbr>MANIFEST&quot;) !=3D=
 &quot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 from datetime import datetime<br>
+<br>
+=C2=A0 =C2=A0 depends =3D set()<br>
+=C2=A0 =C2=A0 rdepends =3D set()<br>
+=C2=A0 =C2=A0 cve_dir =3D d.getVar(&quot;CVE_CHECK_DIR&quot;)<br>
+=C2=A0 =C2=A0 manifest_name =3D d.getVar(&quot;CVE_CHECK_MANIFEST&quot;)<b=
r>
+=C2=A0 =C2=A0 taskdepdata =3D d.getVar(&quot;BB_TASKDEPDATA&quot;, False)<=
br>
+=C2=A0 =C2=A0 for taskdep in taskdepdata:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if taskdepdata[taskdep][1] =3D=3D &quot;do_cve=
_check_write_manifest&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in taskdepdata[taskdep][=
3]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if taskdepdata[dep=
][1] =3D=3D &quot;do_cve_check&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =
=3D taskdepdata[dep][0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sk=
ip the recipes do not have cve report<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n=
ot os.path.exists(os.path.join(<wbr>cve_dir, pn)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p=
n.find(&#39;-native&#39;) !=3D -1 or pn.find(&#39;-cross&#39;) !=3D -1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 depends.add(pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rdepends.add(pn)<br>
+<br>
+=C2=A0 =C2=A0 # Sort the results<br>
+=C2=A0 =C2=A0 depends =3D sorted(depends)<br>
+=C2=A0 =C2=A0 rdepends =3D sorted(rdepends)<br>
+<br>
+=C2=A0 =C2=A0 bb.note(&quot;Writing CVE manifest&quot;)<br>
+=C2=A0 =C2=A0 if rdepends or depends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 utctime =3D datetime.utcfromtimestamp(os.<wbr>=
path.getmtime(d.getVar(&quot;CVE_<wbr>CHECK_DB_FILE&quot;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 summary =3D &quot;CVE database was updated on =
%s UTC\n&quot; % utctime<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 summary +=3D &quot;Patched/Unpatched CVEs foun=
d in target recipes: %s\n&quot; % &quot; &quot;.join(rdepends) if rdepends =
else &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 summary +=3D &quot;Patched/Unpatched CVEs foun=
d in native/cross recipes: %s\n&quot; % &quot; &quot;.join(depends) if depe=
nds else &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 summary +=3D &quot;Check out the details below=
\n\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(manifest_name, &#39;a&#39;) as f:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(summary)<br>
+<br>
+=C2=A0 =C2=A0 # First, write CVEs impacting target system, then write CVEs=
 impacting build system<br>
+=C2=A0 =C2=A0 for pn in rdepends + depends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_file =3D os.path.join(cve_dir, pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(cve_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(cve_file, &#39;r&#39;)=
 as input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_text =3D input=
.read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(manifest=
_name, &#39;a&#39;) as output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outp=
ut.write(cve_text)<br>
+<br>
+=C2=A0 =C2=A0 if manifest_name and os.path.exists(manifest_name):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deploy_dir =3D d.getVar(&quot;DEPLOY_DIR_=
IMAGE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_name =3D d.getVar(&quot;IMAGE_LINK_N=
AME&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_name =3D d.getVar(&quot;CVE_CHECK_MAN=
IFEST&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_tmp_file =3D d.getVar(&quot;CVE_CHECK_TMP_=
FILE&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfile(cve_tmp_file, manifest_name)<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if manifest_name and os.path.exists(manifest_n=
ame):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_link =3D os.path.join(d=
eploy_dir, &quot;%s.cve&quot; % link_name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If we already have another man=
ifest, update symlinks<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.<wbr>r=
ealpath(manifest_link)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(manifest=
_link)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(<wbr=
>manifest_name), manifest_link)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Image CVE report =
stored in: %s&quot; % manifest_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_link =3D os.path.join(deploy_dir, &qu=
ot;%s.cve&quot; % link_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If we already have another manifest, update =
symlinks<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.<wbr>realpath(manife=
st_link)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(manifest_link)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(<wbr>manifest_name=
), manifest_link)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Image CVE report stored in: %s&=
quot; % manifest_name)<br>
+<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_<wbr>FILES&quot;) !=3D &quo=
t;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(d.getVar(&#39;CVE_<wbr>CHECK_D=
IR&#39;), True)<br>
=C2=A0}<br>
<br>
-ROOTFS_POSTPROCESS_COMMAND_<wbr>prepend =3D &quot;${@&#39;cve_check_write_=
rootfs_<wbr>manifest; &#39; if d.getVar(&#39;CVE_CHECK_CREATE_<wbr>MANIFEST=
&#39;) =3D=3D &#39;1&#39; else &#39;&#39;}&quot;<br>
-do_rootfs[recrdeptask] +=3D &quot;${@&#39;do_cve_check&#39; if d.getVar(&#=
39;CVE_CHECK_CREATE_<wbr>MANIFEST&#39;) =3D=3D &#39;1&#39; else &#39;&#39;}=
&quot;<br>
+do_cve_check_write_manifest[<wbr>vardepsexclude] =3D &quot;BB_TASKDEPDATA&=
quot;<br>
+do_cve_check_write_manifest[<wbr>recrdeptask] =3D &quot;do_cve_checkall do=
_cve_check&quot;<br>
+do_cve_check_write_manifest[<wbr>dirs] =3D &quot;${DEPLOY_DIR_IMAGE}&quot;=
<br>
+do_cve_check_write_manifest[<wbr>nostamp] =3D &quot;1&quot;<br>
<br>
=C2=A0def get_patches_cves(d):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -264,13 +311,9 @@ def cve_write_data(d, patched, unpatched, cve_data):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Writing file %s with CVE in=
formation&quot; % cve_file)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(write_string)<br>
<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_<wbr>FILES&quot;) =3D=3D &q=
uot;1&quot;:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_<wbr>FILES&quot;) =3D=3D &q=
uot;1&quot; or d.getVar(&quot;CVE_CHECK_CREATE_<wbr>MANIFEST&quot;) =3D=3D =
&quot;1&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_dir =3D d.getVar(&quot;CVE_CHECK_DIR&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(cve_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deploy_file =3D os.path.join(cve_dir, d.g=
etVar(&quot;PN&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(deploy_file, &quot;w&quot;) as =
f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(write_string)<br>
-<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_CREATE_<wbr>MANIFEST&quot;) =3D=
=3D &quot;1&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(d.getVar(&quot;CVE_CHECK_TMP_<wbr>FI=
LE&quot;), &quot;a&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s&quot; % write_s=
tring)<br>
diff --git a/meta/recipes-devtools/cve-<wbr>check-tool/<a href=3D"http://cv=
e-check-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_=
5.6.<wbr>4.bb</a> b/meta/recipes-devtools/cve-<wbr>check-tool/<a href=3D"ht=
tp://cve-check-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-chec=
k-tool_5.6.<wbr>4.bb</a><br>
index 4829b11..55fe690 100644<br>
--- a/meta/recipes-devtools/cve-<wbr>check-tool/<a href=3D"http://cve-check=
-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.<wb=
r>4.bb</a><br>
+++ b/meta/recipes-devtools/cve-<wbr>check-tool/<a href=3D"http://cve-check=
-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.<wb=
r>4.bb</a><br>
@@ -36,20 +36,17 @@ do_populate_cve_db() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# In case we don&#39;t inherit cve-check class, use def=
ault values defined in the class.<br>
=C2=A0 =C2=A0 =C2=A0cve_dir=3D&quot;${CVE_CHECK_DB_DIR}&quot;<br>
-=C2=A0 =C2=A0 cve_file=3D&quot;${CVE_CHECK_TMP_<wbr>FILE}&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0[ -z &quot;${cve_dir}&quot; ] &amp;&amp; cve_dir=3D&quo=
t;${DL_DIR}/CVE_CHECK&quot;<br>
-=C2=A0 =C2=A0 [ -z &quot;${cve_file}&quot; ] &amp;&amp; cve_file=3D&quot;$=
{TMPDIR}/cve_check&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bbdebug 2 &quot;Updating cve-check-tool database locate=
d in $cve_dir&quot;<br>
=C2=A0 =C2=A0 =C2=A0# --cacert works around curl-native not finding the CA =
bundle<br>
-=C2=A0 =C2=A0 if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-<wbr=
>certificates.crt -d &quot;$cve_dir&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE database was updated on %s UT=
C\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%F %T&#39;)&quot; &gt; &quot;=
$cve_file&quot;<br>
-=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 if ! cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-<w=
br>certificates.crt -d &quot;$cve_dir&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Error in executing cve-check=
-update&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${@&#39;1&#39; if bb.data.inhe=
rits_class(&#39;cve-<wbr>check&#39;, d) else &#39;0&#39;}&quot; -ne 0 ] ; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Failed to upda=
te cve-check-tool database, CVEs won&#39;t be checked&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clean up leftovers of a unsuccessful updatin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $cve_dir/*<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c12292e76c63b055508f1cd--
