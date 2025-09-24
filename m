Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5FCCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:46:16 +0000 (UTC)
Subject: Re: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
To: openembedded-core@lists.openembedded.org
From: kavinaya@qti.qualcomm.com
X-Originating-Location: Mumbai, Maharashtra, IN (163.116.195.115)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 02:46:03 -0700
References: <809c00d00ea6231c966cecd56a8dfca39f68a02c.camel@siemens.com>
In-Reply-To: <809c00d00ea6231c966cecd56a8dfca39f68a02c.camel@siemens.com>
Message-ID: <29002.1758707163729683981@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 09:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223957

On Tue, Sep 23, 2025 at 02:28 AM, Adrian Freihofer wrote:

>
> First, two simple findings from today's review meeting:
> * Squash Commits: Please consolidate the two patches into a single
> commit for better clarity and history.
> * Namespace Adherence: The new variable CUSTOM_ITS_FILE should align
> with our existing naming conventions. Please rename it to
> FIT_CUSTOM_ITS_FILE.

Sure. I will consolidate the two patches into a single patch and rename CUS=
TOM_ITS_FILE to FIT_CUSTOM_ITS_FILE.
>=20
> Now, I have a more fundamental question about the current
> implementation, which suggests we might need to explore a different
> approach for this functionality. My concern stems from how the
> do_compile() function handles the ITS file generation:
>=20
> do_compile () {
> root_node =3D 700 lines of Python code prepare the its data
> structure ready to be written into a file.
>=20
> # Then just ignore all this and use another (hard-coded?) its file
> custom_its_file =3D d.getVar('CUSTOM_ITS_FILE')
> if custom_its_file:
> custom_its_file =3D os.path.join(kernel_deploydir,
> custom_its_file)
> bb.note(f"Using custom ITS file: {custom_its_file}")
> shutil.copyfile(custom_its_file, itsfile)
> else:
> root_node.write_its_file(itsfile)
>=20
> # Assemble the FIT image
> root_node.run_mkimage_assemble(itsfile, fitname)
>=20
> # Sign the FIT image if required
> root_node.run_mkimage_sign(fitimage)
> }
>=20
> As I understand it, the current logic (depending on FIT_* variable
> configurations) appears to execute a significant portion of the
> existing ITS data preparation code=E2=80=94potentially up to 700 lines=E2=
=80=94only to
> then overwrite the generated output with a custom, possibly hard-coded,
> ITS file. This pattern seems to bypass the intended use of the existing
> generation logic.
>
The existing logic is retained because it performs essential preparation st=
eps beyond ITS generation, such as copying DTBs and other components into t=
he FIT image assembly directory. These steps are required for successful im=
age assembly even when a custom ITS file is used.

Thanks,
Kavinaya


