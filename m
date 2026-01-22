Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212E7D46977
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 12:58:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36739.1769086716168147731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 04:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DNd5Ziu8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16E634E421BC;
	Thu, 22 Jan 2026 12:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1163606B6;
	Thu, 22 Jan 2026 12:58:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 759F2119B817C;
	Thu, 22 Jan 2026 13:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769086713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=woRKNZQBld8GrBaPyiHFBljUUx2g/jXIbeWIrTqfqn4=;
	b=DNd5Ziu8PDgrtnVeUrN+OwTwfFOubZ07p8dZFteYQsiLbvTRhcIY1MJGLmhdu1IbIm77+G
	JwQIu1A0s9S2V5vV+Rx9y5CTBOX90d0Mqkox4akLWme08FowvaPybw07LmFfvKSLmi+Nf1
	NSAAKdEEp354jEzzOn2WJ3/TsKIQtDwajaLbeGd5DnIvjhBiJdK5/+pPbv8K9ddw3XnuLs
	VY+RryAD/sCl4/pRzWxVdlWhoglgMKwsJMDyTysmDSU0cI80tdGoseL64o9ed/A7/p1J/V
	ZtZlom7ZJWjY8Thim/ntNZQ1OK/7PN/NwqOmywtbIZ7lWHDpJTDAldi/O9Kz8Q==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 ValentinBoudevin <valentin.boudevin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: daniel.turull@ericsson.com, jerome.oufella@savoirfairelinux.com,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v4 1/1] improve_kernel_cve_report: Add a bbclass support
Date: Thu, 22 Jan 2026 13:58:30 +0100
Message-ID: <3399952.44csPzL39Z@brobin-bootlin>
In-Reply-To: <20260119184051.2878026-2-valentin.boudevin@gmail.com>
References: 
 <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260119184051.2878026-1-valentin.boudevin@gmail.com>
 <20260119184051.2878026-2-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 12:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229842

Hello,

Sorry to provide these remarks in the v4 version.

On Monday, January 19, 2026 at 7:40=E2=80=AFPM, ValentinBoudevin wrote:
> Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
> ---
>  .../improve_kernel_cve_report-base.bbclass    | 149 ++++++++++++++++++
>  ...improve_kernel_cve_report-spdx-2.2.bbclass |   4 +
>  .../improve_kernel_cve_report-spdx.bbclass    |   4 +
>  3 files changed, 157 insertions(+)
>  create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
>  create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbcla=
ss
>  create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass
>=20
> diff --git a/meta/classes/improve_kernel_cve_report-base.bbclass b/meta/c=
lasses/improve_kernel_cve_report-base.bbclass
> new file mode 100644
> index 0000000000..9d3be08203
> --- /dev/null
> +++ b/meta/classes/improve_kernel_cve_report-base.bbclass
> @@ -0,0 +1,149 @@

Maybe add documentation on how to use this bbclass?

> +# Settings for the vulns git repository configuration
> +IMPROVE_KERNEL_CVE_SRC_URI ?=3D "git://git.kernel.org/pub/scm/linux/secu=
rity/vulns.git;branch=3Dmaster;protocol=3Dhttps"
> +IMPROVE_KERNEL_CVE_SRCREV ?=3D "${@bb.fetch2.get_autorev(d)}"
> +IMPROVE_KERNEL_CVE_NETWORK ?=3D "1"
> +IMPROVE_KERNEL_CVE_WORKDIR ?=3D "${WORKDIR}/vulns"
> +IMPROVE_KERNEL_CVE_DESTSUFFIX ?=3D "git"
> +IMPROVE_KERNEL_CVE_UNPACK_DIR ?=3D "${IMPROVE_KERNEL_CVE_WORKDIR}/${IMPR=
OVE_KERNEL_CVE_DESTSUFFIX}"
> +
> +# Settings for SPDX support
> +IMPROVE_KERNEL_PREFERRED_PROVIDER ?=3D ""
> +IMPROVE_KERNEL_SPDX_FILE ?=3D ""
> +
> +python __anonymous() {
> +    srcrev =3D d.getVar("IMPROVE_KERNEL_CVE_SRCREV", True) or ""
> +    network =3D d.getVar("IMPROVE_KERNEL_CVE_NETWORK", True) or "0"
> +    # Check the IMPROVE_KERNEL_SPDX_FILE variable was set
> +    if not d.getVar("IMPROVE_KERNEL_SPDX_FILE"):
> +        bb.fatal("improve_kernel_cve: IMPROVE_KERNEL_SPDX_FILE is not se=
t. Need to inherit improve_kernel_cve_report-spdx-2.2 or improve_kernel_cve=
_report-spdx")
> +        return
> +    # Check if networking is enabled to set SRC_URI
> +    if network =3D=3D "0":
> +        d.appendVar("SRC_URI", " ${IMPROVE_KERNEL_CVE_SRC_URI};name=3Dim=
prove-kernel-cve;destsuffix=3D${IMPROVE_KERNEL_CVE_DESTSUFFIX}")
> +    # Check offline mode with AUTOREV-like SRCREV
> +    if network =3D=3D "0" and srcrev.strip() in ("${AUTOREV}", "AUTOINC"=
, "INVALID"):
> +        bb.fatal("improve_kernel_cve: Offline mode but SRCREV is set to =
AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or use a fix=
ed SRCREV.")
> +    d.setVar("SRCREV_improve-kernel-cve", d.getVar("IMPROVE_KERNEL_CVE_S=
RCREV"))
> +    # Check which SPDX class is inherited
> +    inherits =3D (d.getVar("INHERIT") or "")

You really should use instead: bb.data.inherits_class("create-spdx-2.2", d)
This remark applies to various places.

> +    if "create-spdx-2.2" in inherits:
> +        bb.build.addtask("do_scout_extra_kernel_vulns", "do_build", "do_=
rootfs", d)
> +    elif "create-spdx" in inherits:
> +        bb.build.addtask('do_scout_extra_kernel_vulns', 'do_build', 'do_=
create_image_sbom_spdx', d)
> +}
> +
> +python do_clean:append() {
> +    import os, glob
> +    deploy_dir =3D d.expand('${DEPLOY_DIR_IMAGE}')
> +    for f in glob.glob(os.path.join(deploy_dir, '*scouted.json')):
> +        bb.note("Removing " + f)
> +        os.remove(f)
> +}
> +
> +python do_clone_kernel_cve() {
> +    import subprocess
> +    import shutil, os
> +    # Check if the system is using SPDX 3.0
> +    inherit_var =3D d.getVar("INHERIT")

Same here.

> +    preferred_provider =3D d.getVar("IMPROVE_KERNEL_PREFERRED_PROVIDER")
> +    if preferred_provider not in inherit_var:
> +        bb.warn(f"improve_kernel_cve: Requires the class {preferred_prov=
ider} enable in INHERIT variable.")
> +        return
> +    network_allowed =3D d.getVar("IMPROVE_KERNEL_CVE_NETWORK") =3D=3D "1"
> +    workdir =3D d.getVar("IMPROVE_KERNEL_CVE_WORKDIR")
> +    unpack_dir =3D d.getVar("IMPROVE_KERNEL_CVE_UNPACK_DIR")
> +    # Remove existing unpacked directory if any
> +    if os.path.exists(workdir):
> +        shutil.rmtree(workdir)
> +    # Prepare fetcher
> +    src_uri_list =3D (d.getVar('SRC_URI') or "").split()
> +    cve_uris =3D []
> +    for uri in src_uri_list:
> +        if "name=3Dimprove-kernel-cve" in uri:
> +            cve_uris.append(uri)
> +    if not cve_uris:
> +        bb.note("No CVE exclusions SRC_URI found, skipping fetch")
> +        return
> +    fetcher =3D bb.fetch2.Fetch(cve_uris, d)
> +    # Clone only if network is allowed
> +    if network_allowed:
> +        fetcher.download()
> +    else:
> +        # Offline mode without network access
> +        bb.note("IMPROVE_KERNEL_CVE_NETWORK=3D0: Skipping online fetch. =
Checking local downloads in DL_DIR...")
> +        have_sources =3D False
> +        dl_dir =3D d.getVar("DL_DIR")
> +        srcrev =3D d.getVar("SRCREV_improve-kernel-cve")
> +        bb.note(f"Checking for sources for SRCREV: {srcrev}")
> +        # Check SRCREV is NOT set to AUTOREV
> +        if srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
> +            bb.fatal("improve-kernel-cve: Offline mode but SRCREV is set=
 to AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or use a=
 fixed SRCREV.")
> +            return
> +        # Loop through the fetcher's expanded URL data
> +        for ud in fetcher.expanded_urldata():
> +            ud.setup_localpath(d)
> +            # Check mirror tarballs first
> +            for mirror_fname in ud.mirrortarballs:
> +                mirror_path =3D os.path.join(dl_dir, mirror_fname)
> +                if os.path.exists(mirror_path):
> +                    bb.note(f"Found mirror tarball: {mirror_path}")
> +                    have_sources =3D True
> +                    break
> +            # If no mirror, check original download path
> +            if not have_sources and ud.localpath and os.path.exists(ud.l=
ocalpath):
> +                bb.note(f"Found local download: {ud.localpath}")
> +                have_sources =3D True
> +            if not have_sources:
> +                bb.fatal("improve-kernel-cve: Offline mode but required =
source is missing.\n"f"SRC_URI =3D {ud.url}")
> +                return
> +    # Unpack into the standard work directory
> +    fetcher.unpack(unpack_dir)
> +    # Remove the folder ${PN} set by unpack
> +    subdirs =3D [d for d in os.listdir(unpack_dir) if os.path.isdir(os.p=
ath.join(unpack_dir, d))]
> +    if len(subdirs) =3D=3D 1:
> +        srcdir =3D os.path.join(unpack_dir, subdirs[0])
> +        for f in os.listdir(srcdir):
> +            shutil.move(os.path.join(srcdir, f), unpack_dir)
> +        shutil.rmtree(srcdir)
> +}

I am not sure I understand this task. Since the=20
git.kernel.org/pub/scm/linux/security/vulns.git is put in SRC_URI it really
should already be downloaded for you. Why are you managing the download
manually here?

> +do_clone_kernel_cve[network] =3D "${IMPROVE_KERNEL_CVE_NETWORK}"
> +do_clone_kernel_cve[nostamp] =3D "1"
> +do_clone_kernel_cve[doc] =3D "Clone the latest kernel vulnerabilities fr=
om https://git.kernel.org/pub/scm/linux/security/vulns.git"
> +addtask clone_kernel_cve after do_fetch before do_scout_extra_kernel_vul=
ns
> +
> +do_scout_extra_kernel_vulns() {
> +    new_cve_report_file=3D"${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.jso=
n"
> +    improve_kernel_cve_script=3D"${COREBASE}/scripts/contrib/improve_ker=
nel_cve_report.py"
> +
> +    # Check that IMPROVE_KERNEL_SPDX_FILE is set and the file exists
> +    if [ -z "${IMPROVE_KERNEL_SPDX_FILE}" ] || [ ! -f "${IMPROVE_KERNEL_=
SPDX_FILE}" ]; then
> +        bbwarn "improve_kernel_cve: IMPROVE_KERNEL_SPDX_FILE is empty or=
 file not found: ${IMPROVE_KERNEL_SPDX_FILE}"
> +        return 0
> +    fi
> +    if [ ! -f "${CVE_CHECK_MANIFEST_JSON}" ]; then
> +        bbwarn "improve_kernel_cve: CVE_CHECK file not found: ${CVE_CHEC=
K_MANIFEST_JSON}. Skipping extra kernel vulnerabilities scouting."
> +        return 0
> +    fi
> +    if [ ! -f "${improve_kernel_cve_script}" ]; then
> +        bbwarn "improve_kernel_cve: improve_kernel_cve_report.py not fou=
nd in ${COREBASE}."
> +        return 0
> +    fi
> +    if [ ! -d "${IMPROVE_KERNEL_CVE_WORKDIR}" ]; then
> +        bbwarn "improve_kernel_cve: Vulnerabilities data not found in ${=
IMPROVE_KERNEL_CVE_WORKDIR}."
> +        return 0
> +    fi
> +
> +    #Run the improve_kernel_cve_report.py script
> +    bbplain "improve_kernel_cve: Using SPDX file for extra kernel vulner=
abilities scouting: ${IMPROVE_KERNEL_SPDX_FILE}"
> +    python3 "${improve_kernel_cve_script}" \
> +        --spdx "${IMPROVE_KERNEL_SPDX_FILE}" \
> +        --old-cve-report "${CVE_CHECK_MANIFEST_JSON}" \
> +        --new-cve-report "${new_cve_report_file}" \
> +        --datadir "${IMPROVE_KERNEL_CVE_WORKDIR}"
> +    bbplain "Improve CVE report with extra kernel cves: ${new_cve_report=
_file}"
> +
> +    #Create a symlink as every other JSON file in tmp/deploy/images
> +    ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.scouted.json ${DEPLOY_DIR_I=
MAGE}/${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.scouted.=
json
> +}
> +do_scout_extra_kernel_vulns[nostamp] =3D "1"

Technically, this task only needs to be executed when the SPDX has changed =
or
when the vulns.git reference has changed.

> +do_scout_extra_kernel_vulns[doc] =3D "Scout extra kernel vulnerabilities=
 and create a new enhanced version of the cve_check file in the deploy dire=
ctory"
> \ No newline at end of file
> diff --git a/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass b/me=
ta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
> new file mode 100644
> index 0000000000..45b483134d
> --- /dev/null
> +++ b/meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
> @@ -0,0 +1,4 @@
> +IMPROVE_KERNEL_PREFERRED_PROVIDER =3D "create-spdx-2.2"
> +IMPROVE_KERNEL_SPDX_FILE =3D "${DEPLOY_DIR}/spdx/2.2/${@d.getVar('MACHIN=
E').replace('-', '_')}/recipes/recipe-${PREFERRED_PROVIDER_virtual/kernel}.=
spdx.json"
> +
> +inherit improve_kernel_cve_report-base
> \ No newline at end of file
> diff --git a/meta/classes/improve_kernel_cve_report-spdx.bbclass b/meta/c=
lasses/improve_kernel_cve_report-spdx.bbclass
> new file mode 100644
> index 0000000000..3849f66aaf
> --- /dev/null
> +++ b/meta/classes/improve_kernel_cve_report-spdx.bbclass
> @@ -0,0 +1,4 @@
> +IMPROVE_KERNEL_PREFERRED_PROVIDER =3D "create-spdx"

You really want to specify here "create-spdx-3.0".
Also, maybe name the bbclass with a -3.0 suffix.


> +IMPROVE_KERNEL_SPDX_FILE =3D "${SPDXIMAGEDEPLOYDIR}/${IMAGE_LINK_NAME}.s=
pdx.json"
> +
> +inherit improve_kernel_cve_report-base

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




