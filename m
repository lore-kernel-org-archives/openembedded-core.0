Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDE2109C059
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 19:17:32 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31129.1774466249400601688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 12:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FVqDECgC;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64d5a7926cfso234476d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774466248; cv=none;
        d=google.com; s=arc-20240605;
        b=fq7GKo3/rrM12CzOgdJzcVa7VGLkJycSsoWmpAVloLmQHpw9Iknj7mxOEMgeeLNR10
         40umqMGDPK+Y1kmwKB7B/0YOC+xEeUkb3BJSZxDju15h21fUipSx1+YEFdtJG6RigNQ1
         dwUekV9dfWz9DoU8LkbJvMqyFSZq3meIQundwAT3hsXgbEvUvYZgkZUT1C0LpADaPBa/
         xhswcVr6auxwuTec0h2UPnF1Zzq39GJepG0ip9POvv/3ZG7GWgYStpVN+4t6Y8kv+B53
         Qxm/6GWivbqouNli+MTIAmchMUQNWc4xDs5yb2M46A5+Pd9a4yimliNZIlvtLiFIfidG
         EJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLDW8zlxfyzzMbTxxex0Lu6xV1JEb5NPF4vSsP1LIUM=;
        fh=3y+xQcHeFd0FImJ9AX33yVbvWSQiwPr/Lco14hP9gC8=;
        b=dCYIUBjjnJiyn5vbPAQBhn49lDoh3AyIvB5mbHWtHw8jTPtXRqPDfUYy59qGabZFDy
         P9ygWA0NhLmKZB3vCbbccxFhGoXxn6ii7ubQNAyjnXoXg+MzVTqay94SC1/tF8TWwaV3
         AZExdmjkxGfcvzJpqV01tE+QOmTdVi2BUzGRcA7Kq4hTj17uLdNr4IaF3Aaj+2uCqQf+
         U3kuWIJDDU3LsPDzEvQWBgFQq9Es4aaP5EdyV6adnoUh3T6OYVs48h0hlIeEO1bw5hcZ
         qftpRS7rLdQFZnM3R5SBCFewbAQ+C86Eu8+M2CvZgkvocux2PEJCZVyDpM6dpuM16jE8
         tIhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466248; x=1775071048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLDW8zlxfyzzMbTxxex0Lu6xV1JEb5NPF4vSsP1LIUM=;
        b=FVqDECgC15TyFgOMIetyBj4snEhZM6E1+tDtV/jkkeHfl/K6+ztc9TnDbpatol5lgN
         Iuh59ZLC85Xp8+xwpslpEsxRjiqK9z6Nn7EkisomCbV7MQcU0/SlQnl3smOBu0TurMHe
         ib/+AE/hTktnTRUNFDQwOI+LPUmgB83cxNLeqAsMciI8tTnbk3NM7crchi0+v618FLe9
         4x5UIkPMJciNlWLQpcB9nvFMBzDeODWj0TmMsE/AoBD44Jn1EHGXTxKYg6K5sHBABXxu
         EMi94Pu+j3la14cAwycU4wxPXcHqohkDuIo8r4tfE/VwMzNNw3NDPhNtVdMtY9h6N/3h
         kR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466248; x=1775071048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLDW8zlxfyzzMbTxxex0Lu6xV1JEb5NPF4vSsP1LIUM=;
        b=lj8v/EUTjpu/TO2/KMkzeJctHDM0mOxNwxkqslFmRlMCd4bFzUI2XHmxnf6LfHXRxy
         F3osw4I1XdBc+e3DHOQlIEvyM9veerKaSMcqzvqUsMe84MaKnS9ve87RvRjHESnbQFU5
         4i6tjZuqZR5d4cf0Kpsi3MySuQWHvqtZXlg7OeCijS3SoDuUs2vo6xEWJn1B5mNRTs9j
         6ZrlBPCdgV7XM+4JXma3X9yWNRTKZg8SoioocfLoyus6+I0+hhtS1D5goJMFpdIhIBEe
         W05nbjn3oqTK/td2Cus1S9UyEe/nKU8yUyZQKYLdWRmLV9zzmKJSc1Iid8Fc6mQ1GMUY
         X7dw==
X-Gm-Message-State: AOJu0Yy1yXMqjwKXabH0Fpva0mNsHOLltGl1JRkSuJCGz/nTj720E1HB
	DQ5Q+lQ9MBF0F+OlGhzEoL+mIblO6nVrS40+3/NkavhtgtA0+RuE40O0YkRpbw3LuAFlqgTFO/F
	JfQnMnxWNYT/+MpSwLCd1j8MdRB/QTss=
X-Gm-Gg: ATEYQzz4Zo/Tt60lttwr6fXfFVlG8HhJwwbvbgGvdP6Jc4ntDmjwkEeiiqZbl/aQAsE
	pQHykq7IdrwIfIBh3wpkm22fakmef/7wKsbobF+yyAJD22Ih+0/czn4mbF4dRVYu5crq1ZZE6Ow
	q0lwOtehwQ4+Nr2UwlaNuJ8bbk++76Fi9wJQs9N2CshUMofK/bnjF5/oEkQOfZhG/5Ges/EkzMW
	0Fa0lN0EwHxZuHe8xx1TqyED1DB5PicmnQYpZCSLvBZgi04NoxLcg+xJ6+SidprMuwzkmDwxYKc
	8yK4jno4D497yDOs8icGaA==
X-Received: by 2002:a05:690e:1442:b0:649:c375:974c with SMTP id
 956f58d0204a3-64ee60a785amr4550897d50.28.1774466243673; Wed, 25 Mar 2026
 12:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260325171631.1048346-1-JPEWhacker@gmail.com> <PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 25 Mar 2026 13:17:11 -0600
X-Gm-Features: AQROBzCFQXrTSV0eZhntlLatNWqHIiK52wOhYZbXJfu5M_Hc8Jne9rXhML5NI5s
Message-ID: <CAJdd5GaXG1FebnnwQSYKfNcm+=YhN65VZEZ7LeiNrygjDx=u4Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233934

On Wed, Mar 25, 2026 at 11:39=E2=80=AFAM Daniel Turull
<daniel.turull@ericsson.com> wrote:
>
> Hi,
> Should I send my conversion script to oe-core as alternative or we keep i=
t outside?

I would still like to look at it more closely. Maybe leave it in
contrib for now, since that will make it a little easier for me to
look at.

>
> Best regards,
>
> Daniel
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Joshua Watt via lists.openembedded.org <JPEWh=
acker=3Dgmail.com@lists.openembedded.org>
> Sent: Wednesday, March 25, 2026 6:16 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [OE-core][PATCH] Remove SPDX 2.2 support
>
> Removes SPDX 2.2 support in favor of SPDX 3 support being the only
> option. The SPDX 3 data is far superior to SPDX 2.2 and thus more useful
> for SBoM uses cases.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 990 ---------------------------
>  meta/lib/oe/sbom.py                  | 120 ----
>  meta/lib/oe/spdx.py                  | 357 ----------
>  meta/lib/oeqa/selftest/cases/spdx.py |  63 +-
>  4 files changed, 1 insertion(+), 1529 deletions(-)
>  delete mode 100644 meta/classes/create-spdx-2.2.bbclass
>  delete mode 100644 meta/lib/oe/sbom.py
>  delete mode 100644 meta/lib/oe/spdx.py
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> deleted file mode 100644
> index 1c43156559..0000000000
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ /dev/null
> @@ -1,990 +0,0 @@
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -
> -inherit spdx-common
> -
> -SPDX_VERSION =3D "2.2"
> -
> -SPDX_ORG ??=3D "OpenEmbedded ()"
> -SPDX_SUPPLIER ??=3D "Organization: ${SPDX_ORG}"
> -SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field for SPDX packages=
 created from \
> -    this recipe. For SPDX documents create using this class during the b=
uild, this \
> -    is the contact information for the person or organization who is doi=
ng the \
> -    build."
> -
> -SPDX_ARCHIVE_SOURCES ??=3D "0"
> -SPDX_ARCHIVE_PACKAGED ??=3D "0"
> -
> -def get_namespace(d, name):
> -    import uuid
> -    namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUI=
D_NAMESPACE"))
> -    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), name, str(uu=
id.uuid5(namespace_uuid, name)))
> -
> -SPDX_PACKAGE_VERSION ??=3D "${PV}"
> -SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, versionInfo in =
recipe, package and image"
> -
> -def create_annotation(d, comment):
> -    from datetime import datetime, timezone
> -
> -    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
> -    annotation =3D oe.spdx.SPDXAnnotation()
> -    annotation.annotationDate =3D creation_time
> -    annotation.annotationType =3D "OTHER"
> -    annotation.annotator =3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME=
"), d.getVar("SPDX_TOOL_VERSION"))
> -    annotation.comment =3D comment
> -    return annotation
> -
> -def recipe_spdx_is_native(d, recipe):
> -    return any(a.annotationType =3D=3D "OTHER" and
> -      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), =
d.getVar("SPDX_TOOL_VERSION")) and
> -      a.comment =3D=3D "isNative" for a in recipe.annotations)
> -
> -def get_json_indent(d):
> -    if d.getVar("SPDX_PRETTY") =3D=3D "1":
> -        return 2
> -    return None
> -
> -
> -def convert_license_to_spdx(lic, license_data, document, d, existing=3D{=
}):
> -    from pathlib import Path
> -    import oe.spdx
> -
> -    extracted =3D {}
> -
> -    def add_extracted_license(ident, name):
> -        nonlocal document
> -
> -        if name in extracted:
> -            return
> -
> -        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
> -        extracted_info.name =3D name
> -        extracted_info.licenseId =3D ident
> -        extracted_info.extractedText =3D None
> -
> -        if name =3D=3D "PD":
> -            # Special-case this.
> -            extracted_info.extractedText =3D "Software released to the p=
ublic domain"
> -        else:
> -            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PA=
TH
> -            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVa=
r('LICENSE_PATH') or '').split():
> -                try:
> -                    with (Path(directory) / name).open(errors=3D"replace=
") as f:
> -                        extracted_info.extractedText =3D f.read()
> -                        break
> -                except FileNotFoundError:
> -                    pass
> -            if extracted_info.extractedText is None:
> -                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must b=
e set
> -                entry =3D d.getVarFlag('NO_GENERIC_LICENSE', name).split=
(';')
> -                filename =3D entry[0]
> -                params =3D {i.split('=3D')[0]: i.split('=3D')[1] for i i=
n entry[1:] if '=3D' in i}
> -                beginline =3D int(params.get('beginline', 1))
> -                endline =3D params.get('endline', None)
> -                if endline:
> -                    endline =3D int(endline)
> -                if filename:
> -                    filename =3D d.expand("${S}/" + filename)
> -                    with open(filename, errors=3D"replace") as f:
> -                        extracted_info.extractedText =3D "".join(line fo=
r idx, line in enumerate(f, 1) if beginline <=3D idx and idx <=3D (endline =
or idx))
> -                else:
> -                    bb.fatal("Cannot find any text for license %s" % nam=
e)
> -
> -        extracted[name] =3D extracted_info
> -        document.hasExtractedLicensingInfos.append(extracted_info)
> -
> -    def convert(l):
> -        if l =3D=3D "(" or l =3D=3D ")":
> -            return l
> -
> -        if l =3D=3D "&":
> -            return "AND"
> -
> -        if l =3D=3D "|":
> -            return "OR"
> -
> -        if l =3D=3D "CLOSED":
> -            return "NONE"
> -
> -        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
> -        if spdx_license in license_data["licenses"]:
> -            return spdx_license
> -
> -        try:
> -            spdx_license =3D existing[l]
> -        except KeyError:
> -            spdx_license =3D "LicenseRef-" + l
> -            add_extracted_license(spdx_license, l)
> -
> -        return spdx_license
> -
> -    lic_split =3D lic.replace("(", " ( ").replace(")", " ) ").replace("|=
", " | ").replace("&", " & ").split()
> -
> -    return ' '.join(convert(l) for l in lic_split)
> -
> -def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *=
, archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
> -    from pathlib import Path
> -    import oe.spdx
> -    import oe.spdx_common
> -    import hashlib
> -
> -    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> -    if source_date_epoch:
> -        source_date_epoch =3D int(source_date_epoch)
> -
> -    sha1s =3D []
> -    spdx_files =3D []
> -
> -    file_counter =3D 1
> -
> -    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES")=
 =3D=3D "1"
> -    if check_compiled_sources:
> -        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(=
d)
> -        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
> -    for subdir, dirs, files in os.walk(topdir):
> -        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> -        if subdir =3D=3D str(topdir):
> -            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_di=
rs]
> -
> -        for file in files:
> -            filepath =3D Path(subdir) / file
> -            filename =3D str(filepath.relative_to(topdir))
> -
> -            if not filepath.is_symlink() and filepath.is_file():
> -                # Check if file is compiled
> -                if check_compiled_sources:
> -                     if not oe.spdx_common.is_compiled_source(filename, =
compiled_sources, types):
> -                          continue
> -                spdx_file =3D oe.spdx.SPDXFile()
> -                spdx_file.SPDXID =3D get_spdxid(file_counter)
> -                for t in get_types(filepath):
> -                    spdx_file.fileTypes.append(t)
> -                spdx_file.fileName =3D filename
> -
> -                if archive is not None:
> -                    with filepath.open("rb") as f:
> -                        info =3D archive.gettarinfo(fileobj=3Df)
> -                        info.name =3D filename
> -                        info.uid =3D 0
> -                        info.gid =3D 0
> -                        info.uname =3D "root"
> -                        info.gname =3D "root"
> -
> -                        if source_date_epoch is not None and info.mtime =
> source_date_epoch:
> -                            info.mtime =3D source_date_epoch
> -
> -                        archive.addfile(info, f)
> -
> -                sha1 =3D bb.utils.sha1_file(filepath)
> -                sha1s.append(sha1)
> -                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> -                        algorithm=3D"SHA1",
> -                        checksumValue=3Dsha1,
> -                    ))
> -                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> -                        algorithm=3D"SHA256",
> -                        checksumValue=3Dbb.utils.sha256_file(filepath),
> -                    ))
> -
> -                if "SOURCE" in spdx_file.fileTypes:
> -                    extracted_lics =3D oe.spdx_common.extract_licenses(f=
ilepath)
> -                    if extracted_lics:
> -                        spdx_file.licenseInfoInFiles =3D extracted_lics
> -
> -                doc.files.append(spdx_file)
> -                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
> -                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> -
> -                spdx_files.append(spdx_file)
> -
> -                file_counter +=3D 1
> -
> -    sha1s.sort()
> -    verifier =3D hashlib.sha1()
> -    for v in sha1s:
> -        verifier.update(v.encode("utf-8"))
> -    spdx_pkg.packageVerificationCode.packageVerificationCodeValue =3D ve=
rifier.hexdigest()
> -
> -    return spdx_files
> -
> -
> -def add_package_sources_from_debug(d, package_doc, spdx_package, package=
, package_files, sources):
> -    from pathlib import Path
> -    import hashlib
> -    import oe.packagedata
> -    import oe.spdx
> -
> -    debug_search_paths =3D [
> -        Path(d.getVar('PKGD')),
> -        Path(d.getVar('STAGING_DIR_TARGET')),
> -        Path(d.getVar('STAGING_DIR_NATIVE')),
> -        Path(d.getVar('STAGING_KERNEL_DIR')),
> -    ]
> -
> -    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
> -
> -    if pkg_data is None:
> -        return
> -
> -    for file_path, file_data in pkg_data["files_info"].items():
> -        if not "debugsrc" in file_data:
> -            continue
> -
> -        for pkg_file in package_files:
> -            if file_path.lstrip("/") =3D=3D pkg_file.fileName.lstrip("/"=
):
> -                break
> -        else:
> -            bb.fatal("No package file found for %s in %s; SPDX found: %s=
" % (str(file_path), package,
> -                " ".join(p.fileName for p in package_files)))
> -            continue
> -
> -        for debugsrc in file_data["debugsrc"]:
> -            ref_id =3D "NOASSERTION"
> -            for search in debug_search_paths:
> -                if debugsrc.startswith("/usr/src/kernel"):
> -                    debugsrc_path =3D search / debugsrc.replace('/usr/sr=
c/kernel/', '')
> -                else:
> -                    debugsrc_path =3D search / debugsrc.lstrip("/")
> -                # We can only hash files below, skip directories, links,=
 etc.
> -                if not os.path.isfile(debugsrc_path):
> -                    continue
> -
> -                file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
> -
> -                if file_sha256 in sources:
> -                    source_file =3D sources[file_sha256]
> -
> -                    doc_ref =3D package_doc.find_external_document_ref(s=
ource_file.doc.documentNamespace)
> -                    if doc_ref is None:
> -                        doc_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -                        doc_ref.externalDocumentId =3D "DocumentRef-depe=
ndency-" + source_file.doc.name
> -                        doc_ref.spdxDocument =3D source_file.doc.documen=
tNamespace
> -                        doc_ref.checksum.algorithm =3D "SHA1"
> -                        doc_ref.checksum.checksumValue =3D source_file.d=
oc_sha1
> -                        package_doc.externalDocumentRefs.append(doc_ref)
> -
> -                    ref_id =3D "%s:%s" % (doc_ref.externalDocumentId, so=
urce_file.file.SPDXID)
> -                else:
> -                    bb.debug(1, "Debug source %s with SHA256 %s not foun=
d in any dependency" % (str(debugsrc_path), file_sha256))
> -                break
> -            else:
> -                bb.debug(1, "Debug source %s not found" % debugsrc)
> -
> -            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref=
_id, comment=3Ddebugsrc)
> -
> -add_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
> -
> -def collect_dep_recipes(d, doc, spdx_recipe, direct_deps):
> -    import json
> -    from pathlib import Path
> -    import oe.sbom
> -    import oe.spdx
> -    import oe.spdx_common
> -
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> -    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
> -    package_archs.reverse()
> -
> -    dep_recipes =3D []
> -
> -    for dep in direct_deps:
> -        # If this dependency is not calculated in the taskhash skip it.
> -        # Otherwise, it can result in broken links since this task won't
> -        # rebuild and see the new SPDX ID if the dependency changes
> -        if not dep.in_taskhash:
> -            continue
> -
> -        dep_recipe_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, =
package_archs, "recipe-" + dep.pn, dep.hashfn)
> -        if not dep_recipe_path:
> -            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (de=
p.pn, dep.hashfn))
> -
> -        spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_path=
)
> -
> -        for pkg in spdx_dep_doc.packages:
> -            if pkg.name =3D=3D dep.pn:
> -                spdx_dep_recipe =3D pkg
> -                break
> -        else:
> -            continue
> -
> -        dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1=
, spdx_dep_recipe))
> -
> -        dep_recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -        dep_recipe_ref.externalDocumentId =3D "DocumentRef-dependency-" =
+ spdx_dep_doc.name
> -        dep_recipe_ref.spdxDocument =3D spdx_dep_doc.documentNamespace
> -        dep_recipe_ref.checksum.algorithm =3D "SHA1"
> -        dep_recipe_ref.checksum.checksumValue =3D spdx_dep_sha1
> -
> -        doc.externalDocumentRefs.append(dep_recipe_ref)
> -
> -        doc.add_relationship(
> -            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recip=
e.SPDXID),
> -            "BUILD_DEPENDENCY_OF",
> -            spdx_recipe
> -        )
> -
> -    return dep_recipes
> -
> -collect_dep_recipes[vardepsexclude] =3D "SPDX_MULTILIB_SSTATE_ARCHS"
> -
> -def collect_dep_sources(d, dep_recipes):
> -    import oe.sbom
> -
> -    sources =3D {}
> -    for dep in dep_recipes:
> -        # Don't collect sources from native recipes as they
> -        # match non-native sources also.
> -        if recipe_spdx_is_native(d, dep.recipe):
> -            continue
> -        recipe_files =3D set(dep.recipe.hasFiles)
> -
> -        for spdx_file in dep.doc.files:
> -            if spdx_file.SPDXID not in recipe_files:
> -                continue
> -
> -            if "SOURCE" in spdx_file.fileTypes:
> -                for checksum in spdx_file.checksums:
> -                    if checksum.algorithm =3D=3D "SHA256":
> -                        sources[checksum.checksumValue] =3D oe.sbom.DepS=
ource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
> -                        break
> -
> -    return sources
> -
> -def add_download_packages(d, doc, recipe):
> -    import os.path
> -    from bb.fetch2 import decodeurl, CHECKSUM_LIST
> -    import bb.process
> -    import oe.spdx
> -    import oe.sbom
> -
> -    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
> -        f =3D bb.fetch2.FetchData(src_uri, d)
> -
> -        package =3D oe.spdx.SPDXPackage()
> -        package.name =3D "%s-source-%d" % (d.getVar("PN"), download_idx =
+ 1)
> -        package.SPDXID =3D oe.sbom.get_download_spdxid(d, download_idx +=
 1)
> -
> -        if f.type =3D=3D "file":
> -            continue
> -
> -        if f.method.supports_checksum(f):
> -            for checksum_id in CHECKSUM_LIST:
> -                if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWE=
D_CHECKSUMS:
> -                    continue
> -
> -                expected_checksum =3D getattr(f, "%s_expected" % checksu=
m_id)
> -                if expected_checksum is None:
> -                    continue
> -
> -                c =3D oe.spdx.SPDXChecksum()
> -                c.algorithm =3D checksum_id.upper()
> -                c.checksumValue =3D expected_checksum
> -                package.checksums.append(c)
> -
> -        package.downloadLocation =3D oe.spdx_common.fetch_data_to_uri(f,=
 f.name)
> -        doc.packages.append(package)
> -        doc.add_relationship(doc, "DESCRIBES", package)
> -        # In the future, we might be able to do more fancy dependencies,
> -        # but this should be sufficient for now
> -        doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
> -
> -def get_license_list_version(license_data, d):
> -    # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.M=
ICRO"),
> -    # but SPDX 2 only uses "MAJOR.MINOR".
> -    return ".".join(license_data["licenseListVersion"].split(".")[:2])
> -
> -
> -# This task is added for compatibility with tasks shared with SPDX 3, bu=
t
> -# doesn't do anything
> -do_create_recipe_spdx() {
> -    :
> -}
> -do_create_recipe_spdx[noexec] =3D "1"
> -addtask do_create_recipe_spdx
> -
> -
> -python do_create_spdx() {
> -    from datetime import datetime, timezone
> -    import oe.sbom
> -    import oe.spdx
> -    import oe.spdx_common
> -    import uuid
> -    from pathlib import Path
> -    from contextlib import contextmanager
> -    import oe.cve_check
> -
> -    license_data =3D oe.spdx_common.load_spdx_license_data(d)
> -
> -    @contextmanager
> -    def optional_tarfile(name, guard, mode=3D"w"):
> -        import tarfile
> -        import bb.compress.zstd
> -
> -        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> -
> -        if guard:
> -            name.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
> -            with bb.compress.zstd.open(name, mode=3Dmode + "b", num_thre=
ads=3Dnum_threads) as f:
> -                with tarfile.open(fileobj=3Df, mode=3Dmode + "|") as tf:
> -                    yield tf
> -        else:
> -            yield None
> -
> -
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> -    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
> -    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> -    archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
> -    archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
> -    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> -
> -    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
> -
> -    doc =3D oe.spdx.SPDXDocument()
> -
> -    doc.name =3D "recipe-" + d.getVar("PN")
> -    doc.documentNamespace =3D get_namespace(d, doc.name)
> -    doc.creationInfo.created =3D creation_time
> -    doc.creationInfo.comment =3D "This document was created by analyzing=
 recipe files during the build."
> -    doc.creationInfo.licenseListVersion =3D get_license_list_version(lic=
ense_data, d)
> -    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
> -    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
> -    doc.creationInfo.creators.append("Person: N/A ()")
> -
> -    recipe =3D oe.spdx.SPDXPackage()
> -    recipe.name =3D d.getVar("PN")
> -    recipe.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION")
> -    recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)
> -    recipe.supplier =3D d.getVar("SPDX_SUPPLIER")
> -    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
> -        recipe.annotations.append(create_annotation(d, "isNative"))
> -
> -    homepage =3D d.getVar("HOMEPAGE")
> -    if homepage:
> -        recipe.homepage =3D homepage
> -
> -    license =3D d.getVar("LICENSE")
> -    if license:
> -        recipe.licenseDeclared =3D convert_license_to_spdx(license, lice=
nse_data, doc, d)
> -
> -    summary =3D d.getVar("SUMMARY")
> -    if summary:
> -        recipe.summary =3D summary
> -
> -    description =3D d.getVar("DESCRIPTION")
> -    if description:
> -        recipe.description =3D description
> -
> -    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
> -        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
> -            recipe.annotations.append(create_annotation(d, var + "=3D" +=
 d.getVar(var)))
> -
> -    # Some CVEs may be patched during the build process without incremen=
ting the version number,
> -    # so querying for CVEs based on the CPE id can lead to false positiv=
es. To account for this,
> -    # save the CVEs fixed by patches to source information field in the =
SPDX.
> -    patched_cves =3D oe.cve_check.get_patched_cves(d)
> -    patched_cves =3D list(patched_cves)
> -
> -    ignored_cves =3D d.getVar("CVE_CHECK_IGNORE")
> -    if ignored_cves:
> -        patched_cves.extend(ignored_cves.split())
> -
> -    patched_cves =3D ' '.join(patched_cves)
> -    if patched_cves:
> -        recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
> -
> -    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
> -    if cpe_ids:
> -        for cpe_id in cpe_ids:
> -            cpe =3D oe.spdx.SPDXExternalReference()
> -            cpe.referenceCategory =3D "SECURITY"
> -            cpe.referenceType =3D "cpe23Type"
> -            cpe.referenceLocator =3D cpe_id
> -            recipe.externalRefs.append(cpe)
> -
> -    doc.packages.append(recipe)
> -    doc.add_relationship(doc, "DESCRIBES", recipe)
> -
> -    add_download_packages(d, doc, recipe)
> -
> -    if oe.spdx_common.process_sources(d) and include_sources:
> -        recipe_archive =3D deploy_dir_spdx / "recipes" / (doc.name + ".t=
ar.zst")
> -        with optional_tarfile(recipe_archive, archive_sources) as archiv=
e:
> -            oe.spdx_common.get_patched_src(d)
> -
> -            add_package_files(
> -                d,
> -                doc,
> -                recipe,
> -                spdx_workdir,
> -                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.get=
Var("PN"), file_counter),
> -                lambda filepath: ["SOURCE"],
> -                ignore_dirs=3D[".git"],
> -                ignore_top_level_dirs=3D["temp"],
> -                archive=3Darchive,
> -            )
> -
> -            if archive is not None:
> -                recipe.packageFileName =3D str(recipe_archive.name)
> -
> -    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
> -    dep_recipes =3D collect_dep_recipes(d, doc, recipe, direct_deps)
> -
> -    doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=
=3Dget_json_indent(d))
> -    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
> -
> -    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.nam=
e
> -    recipe_ref.spdxDocument =3D doc.documentNamespace
> -    recipe_ref.checksum.algorithm =3D "SHA1"
> -    recipe_ref.checksum.checksumValue =3D doc_sha1
> -
> -    sources =3D collect_dep_sources(d, dep_recipes)
> -    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":"=
 + license.licenseId for license in doc.hasExtractedLicensingInfos}
> -
> -    if not recipe_spdx_is_native(d, recipe):
> -        bb.build.exec_func("read_subpackage_metadata", d)
> -
> -        pkgdest =3D Path(d.getVar("PKGDEST"))
> -        for package in d.getVar("PACKAGES").split():
> -            if not oe.packagedata.packaged(package, d):
> -                continue
> -
> -            package_doc =3D oe.spdx.SPDXDocument()
> -            pkg_name =3D d.getVar("PKG:%s" % package) or package
> -            package_doc.name =3D pkg_name
> -            package_doc.documentNamespace =3D get_namespace(d, package_d=
oc.name)
> -            package_doc.creationInfo.created =3D creation_time
> -            package_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing packages created during the build."
> -            package_doc.creationInfo.licenseListVersion =3D get_license_=
list_version(license_data, d)
> -            package_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
> -            package_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
> -            package_doc.creationInfo.creators.append("Person: N/A ()")
> -            package_doc.externalDocumentRefs.append(recipe_ref)
> -
> -            package_license =3D d.getVar("LICENSE:%s" % package) or d.ge=
tVar("LICENSE")
> -
> -            spdx_package =3D oe.spdx.SPDXPackage()
> -
> -            spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
> -            spdx_package.name =3D pkg_name
> -            spdx_package.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION"=
)
> -            spdx_package.licenseDeclared =3D convert_license_to_spdx(pac=
kage_license, license_data, package_doc, d, found_licenses)
> -            spdx_package.supplier =3D d.getVar("SPDX_SUPPLIER")
> -
> -            package_doc.packages.append(spdx_package)
> -
> -            package_doc.add_relationship(spdx_package, "GENERATED_FROM",=
 "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
> -            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_=
package)
> -
> -            package_archive =3D deploy_dir_spdx / "packages" / (package_=
doc.name + ".tar.zst")
> -            with optional_tarfile(package_archive, archive_packaged) as =
archive:
> -                package_files =3D add_package_files(
> -                    d,
> -                    package_doc,
> -                    spdx_package,
> -                    pkgdest / package,
> -                    lambda file_counter: oe.sbom.get_packaged_file_spdxi=
d(pkg_name, file_counter),
> -                    lambda filepath: ["BINARY"],
> -                    ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
> -                    archive=3Darchive,
> -                )
> -
> -                if archive is not None:
> -                    spdx_package.packageFileName =3D str(package_archive=
.name)
> -
> -            add_package_sources_from_debug(d, package_doc, spdx_package,=
 package, package_files, sources)
> -
> -            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", inde=
nt=3Dget_json_indent(d))
> -}
> -do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
> -# NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
> -addtask do_create_spdx after do_create_recipe_spdx do_package do_package=
data do_unpack do_patch before do_populate_sdk do_build do_rm_work
> -
> -SSTATETASKS +=3D "do_create_spdx"
> -do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
> -do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> -
> -python do_create_spdx_setscene () {
> -    sstate_setscene(d)
> -}
> -addtask do_create_spdx_setscene
> -
> -do_create_spdx[deptask] +=3D "do_create_spdx"
> -do_create_spdx[dirs] =3D "${SPDXWORK}"
> -do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> -do_create_spdx[depends] +=3D " \
> -    ${PATCHDEPENDENCY} \
> -    ${@create_spdx_source_deps(d)} \
> -"
> -
> -python do_create_runtime_spdx() {
> -    from datetime import datetime, timezone
> -    import oe.sbom
> -    import oe.spdx
> -    import oe.spdx_common
> -    import oe.packagedata
> -    from pathlib import Path
> -
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> -    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> -    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class("cross", d)
> -
> -    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
> -
> -    license_data =3D oe.spdx_common.load_spdx_license_data(d)
> -
> -    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
> -
> -    providers =3D oe.spdx_common.collect_package_providers(d, direct_dep=
s)
> -    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> -    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
> -    package_archs.reverse()
> -
> -    if not is_native:
> -        bb.build.exec_func("read_subpackage_metadata", d)
> -
> -        dep_package_cache =3D {}
> -
> -        pkgdest =3D Path(d.getVar("PKGDEST"))
> -        for package in d.getVar("PACKAGES").split():
> -            localdata =3D bb.data.createCopy(d)
> -            pkg_name =3D d.getVar("PKG:%s" % package) or package
> -            localdata.setVar("PKG", pkg_name)
> -            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) +=
 ":" + package)
> -
> -            if not oe.packagedata.packaged(package, localdata):
> -                continue
> -
> -            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, pkg_arch, "packages")
> -
> -            package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_=
path)
> -
> -            for p in package_doc.packages:
> -                if p.name =3D=3D pkg_name:
> -                    spdx_package =3D p
> -                    break
> -            else:
> -                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg=
_spdx_path))
> -
> -            runtime_doc =3D oe.spdx.SPDXDocument()
> -            runtime_doc.name =3D "runtime-" + pkg_name
> -            runtime_doc.documentNamespace =3D get_namespace(localdata, r=
untime_doc.name)
> -            runtime_doc.creationInfo.created =3D creation_time
> -            runtime_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing package runtime dependencies."
> -            runtime_doc.creationInfo.licenseListVersion =3D get_license_=
list_version(license_data, d)
> -            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
> -            runtime_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
> -            runtime_doc.creationInfo.creators.append("Person: N/A ()")
> -
> -            package_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -            package_ref.externalDocumentId =3D "DocumentRef-package-" + =
package
> -            package_ref.spdxDocument =3D package_doc.documentNamespace
> -            package_ref.checksum.algorithm =3D "SHA1"
> -            package_ref.checksum.checksumValue =3D package_doc_sha1
> -
> -            runtime_doc.externalDocumentRefs.append(package_ref)
> -
> -            runtime_doc.add_relationship(
> -                runtime_doc.SPDXID,
> -                "AMENDS",
> -                "%s:%s" % (package_ref.externalDocumentId, package_doc.S=
PDXID)
> -            )
> -
> -            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
> -            seen_deps =3D set()
> -            for dep, _ in deps.items():
> -                if dep in seen_deps:
> -                    continue
> -
> -                if dep not in providers:
> -                    continue
> -
> -                (dep, dep_hashfn) =3D providers[dep]
> -
> -                if not oe.packagedata.packaged(dep, localdata):
> -                    continue
> -
> -                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep=
, d)
> -                dep_pkg =3D dep_pkg_data["PKG"]
> -
> -                if dep in dep_package_cache:
> -                    (dep_spdx_package, dep_package_ref) =3D dep_package_=
cache[dep]
> -                else:
> -                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_s=
pdx, package_archs, dep_pkg, dep_hashfn)
> -                    if not dep_path:
> -                        bb.fatal("No SPDX file found for package %s, %s"=
 % (dep_pkg, dep_hashfn))
> -
> -                    spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep=
_path)
> -
> -                    for pkg in spdx_dep_doc.packages:
> -                        if pkg.name =3D=3D dep_pkg:
> -                            dep_spdx_package =3D pkg
> -                            break
> -                    else:
> -                        bb.fatal("Package '%s' not found in %s" % (dep_p=
kg, dep_path))
> -
> -                    dep_package_ref =3D oe.spdx.SPDXExternalDocumentRef(=
)
> -                    dep_package_ref.externalDocumentId =3D "DocumentRef-=
runtime-dependency-" + spdx_dep_doc.name
> -                    dep_package_ref.spdxDocument =3D spdx_dep_doc.docume=
ntNamespace
> -                    dep_package_ref.checksum.algorithm =3D "SHA1"
> -                    dep_package_ref.checksum.checksumValue =3D spdx_dep_=
sha1
> -
> -                    dep_package_cache[dep] =3D (dep_spdx_package, dep_pa=
ckage_ref)
> -
> -                runtime_doc.externalDocumentRefs.append(dep_package_ref)
> -
> -                runtime_doc.add_relationship(
> -                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_s=
pdx_package.SPDXID),
> -                    "RUNTIME_DEPENDENCY_OF",
> -                    "%s:%s" % (package_ref.externalDocumentId, spdx_pack=
age.SPDXID)
> -                )
> -                seen_deps.add(dep)
> -
> -            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_=
deploy, indent=3Dget_json_indent(d))
> -}
> -
> -do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SPDX_MULTILIB_SST=
ATE_ARCHS"
> -
> -addtask do_create_runtime_spdx after do_create_spdx before do_build do_r=
m_work
> -SSTATETASKS +=3D "do_create_runtime_spdx"
> -do_create_runtime_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
> -do_create_runtime_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> -
> -python do_create_runtime_spdx_setscene () {
> -    sstate_setscene(d)
> -}
> -addtask do_create_runtime_spdx_setscene
> -
> -do_create_runtime_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
> -do_create_runtime_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
> -do_create_runtime_spdx[deptask] =3D "do_create_spdx"
> -do_create_runtime_spdx[rdeptask] =3D "do_create_spdx"
> -
> -do_rootfs[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx"
> -do_rootfs[cleandirs] +=3D "${SPDXIMAGEWORK}"
> -
> -ROOTFS_POSTUNINSTALL_COMMAND =3D+ "image_combine_spdx"
> -
> -do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx=
"
> -do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
> -POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_c=
ombine_spdx"
> -POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_combine_spdx"
> -
> -python image_combine_spdx() {
> -    import os
> -    import oe.sbom
> -    from pathlib import Path
> -    from oe.rootfs import image_list_installed_packages
> -
> -    image_name =3D d.getVar("IMAGE_NAME")
> -    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> -    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
> -    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
> -    packages =3D image_list_installed_packages(d)
> -
> -    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path=
(d.getVar("SPDXIMAGEWORK")))
> -
> -    def make_image_link(target_path, suffix):
> -        if image_link_name:
> -            link =3D imgdeploydir / (image_link_name + suffix)
> -            if link !=3D target_path:
> -                link.symlink_to(os.path.relpath(target_path, link.parent=
))
> -
> -    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
> -    make_image_link(spdx_tar_path, ".spdx.tar.zst")
> -}
> -
> -python sdk_host_combine_spdx() {
> -    sdk_combine_spdx(d, "host")
> -}
> -
> -python sdk_target_combine_spdx() {
> -    sdk_combine_spdx(d, "target")
> -}
> -
> -def sdk_combine_spdx(d, sdk_type):
> -    import oe.sbom
> -    from pathlib import Path
> -    from oe.sdk import sdk_list_installed_packages
> -
> -    sdk_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
> -    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
> -    sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)
> -    sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "tar=
get")
> -    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, P=
ath(d.getVar('SPDXSDKWORK')))
> -
> -def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packag=
es, spdx_workdir):
> -    import os
> -    import oe.spdx
> -    import oe.sbom
> -    import oe.spdx_common
> -    import io
> -    import json
> -    from datetime import timezone, datetime
> -    from pathlib import Path
> -    import tarfile
> -    import bb.compress.zstd
> -
> -    license_data =3D oe.spdx_common.load_spdx_license_data(d)
> -
> -    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
> -
> -    providers =3D oe.spdx_common.collect_package_providers(d, direct_dep=
s)
> -    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
> -    package_archs.reverse()
> -
> -    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
> -    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> -    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> -
> -    doc =3D oe.spdx.SPDXDocument()
> -    doc.name =3D rootfs_name
> -    doc.documentNamespace =3D get_namespace(d, doc.name)
> -    doc.creationInfo.created =3D creation_time
> -    doc.creationInfo.comment =3D "This document was created by analyzing=
 the source of the Yocto recipe during the build."
> -    doc.creationInfo.licenseListVersion =3D get_license_list_version(lic=
ense_data, d)
> -    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
> -    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
> -    doc.creationInfo.creators.append("Person: N/A ()")
> -
> -    image =3D oe.spdx.SPDXPackage()
> -    image.name =3D d.getVar("PN")
> -    image.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION")
> -    image.SPDXID =3D rootfs_spdxid
> -    image.supplier =3D d.getVar("SPDX_SUPPLIER")
> -
> -    doc.packages.append(image)
> -
> -    if packages:
> -        for name in sorted(packages.keys()):
> -            if name not in providers:
> -                bb.note("Unable to find SPDX provider for '%s'" % name)
> -                continue
> -
> -            pkg_name, pkg_hashfn =3D providers[name]
> -
> -            pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, pkg_name, pkg_hashfn)
> -            if not pkg_spdx_path:
> -                bb.fatal("No SPDX file found for package %s, %s" % (pkg_=
name, pkg_hashfn))
> -
> -            pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
> -
> -            for p in pkg_doc.packages:
> -                if p.name =3D=3D name:
> -                    pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -                    pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pk=
g_doc.name
> -                    pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
> -                    pkg_ref.checksum.algorithm =3D "SHA1"
> -                    pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
> -
> -                    doc.externalDocumentRefs.append(pkg_ref)
> -                    doc.add_relationship(image, "CONTAINS", "%s:%s" % (p=
kg_ref.externalDocumentId, p.SPDXID))
> -                    break
> -            else:
> -                bb.fatal("Unable to find package with name '%s' in SPDX =
file %s" % (name, pkg_spdx_path))
> -
> -            runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_=
spdx, package_archs, "runtime-" + name, pkg_hashfn)
> -            if not runtime_spdx_path:
> -                bb.fatal("No runtime SPDX document found for %s, %s" % (=
name, pkg_hashfn))
> -
> -            runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_s=
pdx_path)
> -
> -            runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -            runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtim=
e_doc.name
> -            runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
> -            runtime_ref.checksum.algorithm =3D "SHA1"
> -            runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
> -
> -            # "OTHER" isn't ideal here, but I can't find a relationship =
that makes sense
> -            doc.externalDocumentRefs.append(runtime_ref)
> -            doc.add_relationship(
> -                image,
> -                "OTHER",
> -                "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.S=
PDXID),
> -                comment=3D"Runtime dependencies for %s" % name
> -            )
> -    bb.utils.mkdirhier(spdx_workdir)
> -    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
> -
> -    with image_spdx_path.open("wb") as f:
> -        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_indent(d))
> -
> -    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> -
> -    visited_docs =3D set()
> -
> -    index =3D {"documents": []}
> -
> -    spdx_tar_path =3D rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
> -    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=3Dnum_thr=
eads) as f:
> -        with tarfile.open(fileobj=3Df, mode=3D"w|") as tar:
> -            def collect_spdx_document(path):
> -                nonlocal tar
> -                nonlocal deploy_dir_spdx
> -                nonlocal source_date_epoch
> -                nonlocal index
> -
> -                if path in visited_docs:
> -                    return
> -
> -                visited_docs.add(path)
> -
> -                with path.open("rb") as f:
> -                    doc, sha1 =3D oe.sbom.read_doc(f)
> -                    f.seek(0)
> -
> -                    if doc.documentNamespace in visited_docs:
> -                        return
> -
> -                    bb.note("Adding SPDX document %s" % path)
> -                    visited_docs.add(doc.documentNamespace)
> -                    info =3D tar.gettarinfo(fileobj=3Df)
> -
> -                    info.name =3D doc.name + ".spdx.json"
> -                    info.uid =3D 0
> -                    info.gid =3D 0
> -                    info.uname =3D "root"
> -                    info.gname =3D "root"
> -
> -                    if source_date_epoch is not None and info.mtime > in=
t(source_date_epoch):
> -                        info.mtime =3D int(source_date_epoch)
> -
> -                    tar.addfile(info, f)
> -
> -                    index["documents"].append({
> -                        "filename": info.name,
> -                        "documentNamespace": doc.documentNamespace,
> -                        "sha1": sha1,
> -                    })
> -
> -                for ref in doc.externalDocumentRefs:
> -                    ref_path =3D oe.sbom.doc_find_by_namespace(deploy_di=
r_spdx, package_archs, ref.spdxDocument)
> -                    if not ref_path:
> -                        bb.fatal("Cannot find any SPDX file for document=
 %s" % ref.spdxDocument)
> -                    collect_spdx_document(ref_path)
> -
> -            collect_spdx_document(image_spdx_path)
> -
> -            index["documents"].sort(key=3Dlambda x: x["filename"])
> -
> -            index_str =3D io.BytesIO(json.dumps(
> -                index,
> -                sort_keys=3DTrue,
> -                indent=3Dget_json_indent(d),
> -            ).encode("utf-8"))
> -
> -            info =3D tarfile.TarInfo()
> -            info.name =3D "index.json"
> -            info.size =3D len(index_str.getvalue())
> -            info.uid =3D 0
> -            info.gid =3D 0
> -            info.uname =3D "root"
> -            info.gname =3D "root"
> -
> -            tar.addfile(info, fileobj=3Dindex_str)
> -
> -combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SPDX_MULTILIB_SSTAT=
E_ARCHS"
> diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
> deleted file mode 100644
> index fd4b6895d8..0000000000
> --- a/meta/lib/oe/sbom.py
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -
> -import collections
> -
> -DepRecipe =3D collections.namedtuple("DepRecipe", ("doc", "doc_sha1", "r=
ecipe"))
> -DepSource =3D collections.namedtuple("DepSource", ("doc", "doc_sha1", "r=
ecipe", "file"))
> -
> -
> -def get_recipe_spdxid(d):
> -    return "SPDXRef-%s-%s" % ("Recipe", d.getVar("PN"))
> -
> -
> -def get_download_spdxid(d, idx):
> -    return "SPDXRef-Download-%s-%d" % (d.getVar("PN"), idx)
> -
> -
> -def get_package_spdxid(pkg):
> -    return "SPDXRef-Package-%s" % pkg
> -
> -
> -def get_source_file_spdxid(d, idx):
> -    return "SPDXRef-SourceFile-%s-%d" % (d.getVar("PN"), idx)
> -
> -
> -def get_packaged_file_spdxid(pkg, idx):
> -    return "SPDXRef-PackagedFile-%s-%d" % (pkg, idx)
> -
> -
> -def get_image_spdxid(img):
> -    return "SPDXRef-Image-%s" % img
> -
> -
> -def get_sdk_spdxid(sdk):
> -    return "SPDXRef-SDK-%s" % sdk
> -
> -
> -def _doc_path_by_namespace(spdx_deploy, arch, doc_namespace):
> -    return spdx_deploy / "by-namespace" / arch / doc_namespace.replace("=
/", "_")
> -
> -
> -def doc_find_by_namespace(spdx_deploy, search_arches, doc_namespace):
> -    for pkgarch in search_arches:
> -        p =3D _doc_path_by_namespace(spdx_deploy, pkgarch, doc_namespace=
)
> -        if os.path.exists(p):
> -            return p
> -    return None
> -
> -
> -def _doc_path_by_hashfn(spdx_deploy, arch, doc_name, hashfn):
> -    return (
> -        spdx_deploy / "by-hash" / arch / hashfn.split()[1] / (doc_name +=
 ".spdx.json")
> -    )
> -
> -
> -def doc_find_by_hashfn(spdx_deploy, search_arches, doc_name, hashfn):
> -    for pkgarch in search_arches:
> -        p =3D _doc_path_by_hashfn(spdx_deploy, pkgarch, doc_name, hashfn=
)
> -        if os.path.exists(p):
> -            return p
> -    return None
> -
> -
> -def doc_path(spdx_deploy, doc_name, arch, subdir):
> -    return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
> -
> -
> -def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNo=
ne):
> -    from pathlib import Path
> -
> -    if spdx_deploy is None:
> -        spdx_deploy =3D Path(d.getVar("SPDXDEPLOY"))
> -
> -    dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
> -    dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> -    with dest.open("wb") as f:
> -        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DTrue, indent=3Dinde=
nt)
> -
> -    l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNam=
espace)
> -    l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> -    l.symlink_to(os.path.relpath(dest, l.parent))
> -
> -    l =3D _doc_path_by_hashfn(
> -        spdx_deploy, arch, spdx_doc.name, d.getVar("BB_HASHFILENAME")
> -    )
> -    l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> -    l.symlink_to(os.path.relpath(dest, l.parent))
> -
> -    return doc_sha1
> -
> -
> -def read_doc(fn):
> -    import hashlib
> -    import oe.spdx
> -    import io
> -    import contextlib
> -
> -    @contextlib.contextmanager
> -    def get_file():
> -        if isinstance(fn, io.IOBase):
> -            yield fn
> -        else:
> -            with fn.open("rb") as f:
> -                yield f
> -
> -    with get_file() as f:
> -        sha1 =3D hashlib.sha1()
> -        while True:
> -            chunk =3D f.read(4096)
> -            if not chunk:
> -                break
> -            sha1.update(chunk)
> -
> -        f.seek(0)
> -        doc =3D oe.spdx.SPDXDocument.from_json(f)
> -
> -    return (doc, sha1.hexdigest())
> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
> deleted file mode 100644
> index 7aaf2af5ed..0000000000
> --- a/meta/lib/oe/spdx.py
> +++ /dev/null
> @@ -1,357 +0,0 @@
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -
> -#
> -# This library is intended to capture the JSON SPDX specification in a t=
ype
> -# safe manner. It is not intended to encode any particular OE specific
> -# behaviors, see the sbom.py for that.
> -#
> -# The documented SPDX spec document doesn't cover the JSON syntax for
> -# particular configuration, which can make it hard to determine what the=
 JSON
> -# syntax should be. I've found it is actually much simpler to read the o=
fficial
> -# SPDX JSON schema which can be found here: https://eur02.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fspdx%2Fspdx-spec&data=
=3D05%7C02%7Cdaniel.turull%40ericsson.com%7Cb55ec66fdc694391aa7208de8a92485=
2%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639100558059258824%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D%2BVln%2FHYRh1ohkoxiJ=
BVPujrZaQqIW99UUvXjgAqAR8I%3D&reserved=3D0
> -# in schemas/spdx-schema.json
> -#
> -
> -import hashlib
> -import itertools
> -import json
> -
> -SPDX_VERSION =3D "2.2"
> -
> -
> -#
> -# The following are the support classes that are used to implement SPDX =
object
> -#
> -
> -class _Property(object):
> -    """
> -    A generic SPDX object property. The different types will derive from=
 this
> -    class
> -    """
> -
> -    def __init__(self, *, default=3DNone):
> -        self.default =3D default
> -
> -    def setdefault(self, dest, name):
> -        if self.default is not None:
> -            dest.setdefault(name, self.default)
> -
> -
> -class _String(_Property):
> -    """
> -    A scalar string property for an SPDX object
> -    """
> -
> -    def __init__(self, **kwargs):
> -        super().__init__(**kwargs)
> -
> -    def set_property(self, attrs, name):
> -        def get_helper(obj):
> -            return obj._spdx[name]
> -
> -        def set_helper(obj, value):
> -            obj._spdx[name] =3D value
> -
> -        def del_helper(obj):
> -            del obj._spdx[name]
> -
> -        attrs[name] =3D property(get_helper, set_helper, del_helper)
> -
> -    def init(self, source):
> -        return source
> -
> -
> -class _Object(_Property):
> -    """
> -    A scalar SPDX object property of a SPDX object
> -    """
> -
> -    def __init__(self, cls, **kwargs):
> -        super().__init__(**kwargs)
> -        self.cls =3D cls
> -
> -    def set_property(self, attrs, name):
> -        def get_helper(obj):
> -            if not name in obj._spdx:
> -                obj._spdx[name] =3D self.cls()
> -            return obj._spdx[name]
> -
> -        def set_helper(obj, value):
> -            obj._spdx[name] =3D value
> -
> -        def del_helper(obj):
> -            del obj._spdx[name]
> -
> -        attrs[name] =3D property(get_helper, set_helper)
> -
> -    def init(self, source):
> -        return self.cls(**source)
> -
> -
> -class _ListProperty(_Property):
> -    """
> -    A list of SPDX properties
> -    """
> -
> -    def __init__(self, prop, **kwargs):
> -        super().__init__(**kwargs)
> -        self.prop =3D prop
> -
> -    def set_property(self, attrs, name):
> -        def get_helper(obj):
> -            if not name in obj._spdx:
> -                obj._spdx[name] =3D []
> -            return obj._spdx[name]
> -
> -        def set_helper(obj, value):
> -            obj._spdx[name] =3D list(value)
> -
> -        def del_helper(obj):
> -            del obj._spdx[name]
> -
> -        attrs[name] =3D property(get_helper, set_helper, del_helper)
> -
> -    def init(self, source):
> -        return [self.prop.init(o) for o in source]
> -
> -
> -class _StringList(_ListProperty):
> -    """
> -    A list of strings as a property for an SPDX object
> -    """
> -
> -    def __init__(self, **kwargs):
> -        super().__init__(_String(), **kwargs)
> -
> -
> -class _ObjectList(_ListProperty):
> -    """
> -    A list of SPDX objects as a property for an SPDX object
> -    """
> -
> -    def __init__(self, cls, **kwargs):
> -        super().__init__(_Object(cls), **kwargs)
> -
> -
> -class MetaSPDXObject(type):
> -    """
> -    A metaclass that allows properties (anything derived from a _Propert=
y
> -    class) to be defined for a SPDX object
> -    """
> -    def __new__(mcls, name, bases, attrs):
> -        attrs["_properties"] =3D {}
> -
> -        for key in attrs.keys():
> -            if isinstance(attrs[key], _Property):
> -                prop =3D attrs[key]
> -                attrs["_properties"][key] =3D prop
> -                prop.set_property(attrs, key)
> -
> -        return super().__new__(mcls, name, bases, attrs)
> -
> -
> -class SPDXObject(metaclass=3DMetaSPDXObject):
> -    """
> -    The base SPDX object; all SPDX spec classes must derive from this cl=
ass
> -    """
> -    def __init__(self, **d):
> -        self._spdx =3D {}
> -
> -        for name, prop in self._properties.items():
> -            prop.setdefault(self._spdx, name)
> -            if name in d:
> -                self._spdx[name] =3D prop.init(d[name])
> -
> -    def serializer(self):
> -        return self._spdx
> -
> -    def __setattr__(self, name, value):
> -        if name in self._properties or name =3D=3D "_spdx":
> -            super().__setattr__(name, value)
> -            return
> -        raise KeyError("%r is not a valid SPDX property" % name)
> -
> -#
> -# These are the SPDX objects implemented from the spec. The *only* prope=
rties
> -# that can be added to these objects are ones directly specified in the =
SPDX
> -# spec, however you may add helper functions to make operations easier.
> -#
> -# Defaults should *only* be specified if the SPDX spec says there is a c=
ertain
> -# required value for a field (e.g. dataLicense), or if the field is mand=
atory
> -# and has some sane "this field is unknown" (e.g. "NOASSERTION")
> -#
> -
> -class SPDXAnnotation(SPDXObject):
> -    annotationDate =3D _String()
> -    annotationType =3D _String()
> -    annotator =3D _String()
> -    comment =3D _String()
> -
> -class SPDXChecksum(SPDXObject):
> -    algorithm =3D _String()
> -    checksumValue =3D _String()
> -
> -
> -class SPDXRelationship(SPDXObject):
> -    spdxElementId =3D _String()
> -    relatedSpdxElement =3D _String()
> -    relationshipType =3D _String()
> -    comment =3D _String()
> -    annotations =3D _ObjectList(SPDXAnnotation)
> -
> -
> -class SPDXExternalReference(SPDXObject):
> -    referenceCategory =3D _String()
> -    referenceType =3D _String()
> -    referenceLocator =3D _String()
> -
> -
> -class SPDXPackageVerificationCode(SPDXObject):
> -    packageVerificationCodeValue =3D _String()
> -    packageVerificationCodeExcludedFiles =3D _StringList()
> -
> -
> -class SPDXPackage(SPDXObject):
> -    ALLOWED_CHECKSUMS =3D [
> -        "SHA1",
> -        "SHA224",
> -        "SHA256",
> -        "SHA384",
> -        "SHA512",
> -        "MD2",
> -        "MD4",
> -        "MD5",
> -        "MD6",
> -    ]
> -
> -    name =3D _String()
> -    SPDXID =3D _String()
> -    versionInfo =3D _String()
> -    downloadLocation =3D _String(default=3D"NOASSERTION")
> -    supplier =3D _String(default=3D"NOASSERTION")
> -    homepage =3D _String()
> -    licenseConcluded =3D _String(default=3D"NOASSERTION")
> -    licenseDeclared =3D _String(default=3D"NOASSERTION")
> -    summary =3D _String()
> -    description =3D _String()
> -    sourceInfo =3D _String()
> -    copyrightText =3D _String(default=3D"NOASSERTION")
> -    licenseInfoFromFiles =3D _StringList(default=3D["NOASSERTION"])
> -    externalRefs =3D _ObjectList(SPDXExternalReference)
> -    packageVerificationCode =3D _Object(SPDXPackageVerificationCode)
> -    hasFiles =3D _StringList()
> -    packageFileName =3D _String()
> -    annotations =3D _ObjectList(SPDXAnnotation)
> -    checksums =3D _ObjectList(SPDXChecksum)
> -
> -
> -class SPDXFile(SPDXObject):
> -    SPDXID =3D _String()
> -    fileName =3D _String()
> -    licenseConcluded =3D _String(default=3D"NOASSERTION")
> -    copyrightText =3D _String(default=3D"NOASSERTION")
> -    licenseInfoInFiles =3D _StringList(default=3D["NOASSERTION"])
> -    checksums =3D _ObjectList(SPDXChecksum)
> -    fileTypes =3D _StringList()
> -
> -
> -class SPDXCreationInfo(SPDXObject):
> -    created =3D _String()
> -    licenseListVersion =3D _String()
> -    comment =3D _String()
> -    creators =3D _StringList()
> -
> -
> -class SPDXExternalDocumentRef(SPDXObject):
> -    externalDocumentId =3D _String()
> -    spdxDocument =3D _String()
> -    checksum =3D _Object(SPDXChecksum)
> -
> -
> -class SPDXExtractedLicensingInfo(SPDXObject):
> -    name =3D _String()
> -    comment =3D _String()
> -    licenseId =3D _String()
> -    extractedText =3D _String()
> -
> -
> -class SPDXDocument(SPDXObject):
> -    spdxVersion =3D _String(default=3D"SPDX-" + SPDX_VERSION)
> -    dataLicense =3D _String(default=3D"CC0-1.0")
> -    SPDXID =3D _String(default=3D"SPDXRef-DOCUMENT")
> -    name =3D _String()
> -    documentNamespace =3D _String()
> -    creationInfo =3D _Object(SPDXCreationInfo)
> -    packages =3D _ObjectList(SPDXPackage)
> -    files =3D _ObjectList(SPDXFile)
> -    relationships =3D _ObjectList(SPDXRelationship)
> -    externalDocumentRefs =3D _ObjectList(SPDXExternalDocumentRef)
> -    hasExtractedLicensingInfos =3D _ObjectList(SPDXExtractedLicensingInf=
o)
> -
> -    def __init__(self, **d):
> -        super().__init__(**d)
> -
> -    def to_json(self, f, *, sort_keys=3DFalse, indent=3DNone, separators=
=3DNone):
> -        class Encoder(json.JSONEncoder):
> -            def default(self, o):
> -                if isinstance(o, SPDXObject):
> -                    return o.serializer()
> -
> -                return super().default(o)
> -
> -        sha1 =3D hashlib.sha1()
> -        for chunk in Encoder(
> -            sort_keys=3Dsort_keys,
> -            indent=3Dindent,
> -            separators=3Dseparators,
> -        ).iterencode(self):
> -            chunk =3D chunk.encode("utf-8")
> -            f.write(chunk)
> -            sha1.update(chunk)
> -
> -        return sha1.hexdigest()
> -
> -    @classmethod
> -    def from_json(cls, f):
> -        return cls(**json.load(f))
> -
> -    def add_relationship(self, _from, relationship, _to, *, comment=3DNo=
ne, annotation=3DNone):
> -        if isinstance(_from, SPDXObject):
> -            from_spdxid =3D _from.SPDXID
> -        else:
> -            from_spdxid =3D _from
> -
> -        if isinstance(_to, SPDXObject):
> -            to_spdxid =3D _to.SPDXID
> -        else:
> -            to_spdxid =3D _to
> -
> -        r =3D SPDXRelationship(
> -            spdxElementId=3Dfrom_spdxid,
> -            relatedSpdxElement=3Dto_spdxid,
> -            relationshipType=3Drelationship,
> -        )
> -
> -        if comment is not None:
> -            r.comment =3D comment
> -
> -        if annotation is not None:
> -            r.annotations.append(annotation)
> -
> -        self.relationships.append(r)
> -
> -    def find_by_spdxid(self, spdxid):
> -        for o in itertools.chain(self.packages, self.files):
> -            if o.SPDXID =3D=3D spdxid:
> -                return o
> -        return None
> -
> -    def find_external_document_ref(self, namespace):
> -        for r in self.externalDocumentRefs:
> -            if r.spdxDocument =3D=3D namespace:
> -                return r
> -        return None
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 83e4890d44..c563fd1011 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -4,74 +4,13 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -import json
> -import os
>  import textwrap
>  import hashlib
> -from pathlib import Path
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
> +from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
>  import oe.spdx30
>
>
> -class SPDX22Check(OESelftestTestCase):
> -    @classmethod
> -    def setUpClass(cls):
> -        super().setUpClass()
> -        bitbake("python3-spdx-tools-native")
> -        bitbake("-c addto_recipe_sysroot python3-spdx-tools-native")
> -
> -    def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
> -        config =3D textwrap.dedent(
> -            """\
> -            INHERIT:remove =3D "create-spdx"
> -            INHERIT +=3D "create-spdx-2.2"
> -            """
> -        )
> -        self.write_config(config)
> -
> -        deploy_dir =3D get_bb_var("DEPLOY_DIR")
> -        arch_dir =3D get_bb_var("PACKAGE_ARCH", target_name)
> -        spdx_version =3D get_bb_var("SPDX_VERSION")
> -        # qemux86-64 creates the directory qemux86_64
> -        # arch_dir =3D arch_var.replace("-", "_")
> -
> -        full_file_path =3D os.path.join(
> -            deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, =
spdx_file
> -        )
> -
> -        try:
> -            os.remove(full_file_path)
> -        except FileNotFoundError:
> -            pass
> -
> -        bitbake("%s -c create_spdx" % target_name)
> -
> -        def check_spdx_json(filename):
> -            with open(filename) as f:
> -                report =3D json.load(f)
> -                self.assertNotEqual(report, None)
> -                self.assertNotEqual(report["SPDXID"], None)
> -
> -            python =3D os.path.join(
> -                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"=
),
> -                "nativepython3",
> -            )
> -            validator =3D os.path.join(
> -                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"=
), "pyspdxtools"
> -            )
> -            result =3D runCmd("{} {} -i {}".format(python, validator, fi=
lename))
> -
> -        self.assertExists(full_file_path)
> -        result =3D check_spdx_json(full_file_path)
> -
> -    def test_spdx_base_files(self):
> -        self.check_recipe_spdx("packages", "base-files.spdx.json", "base=
-files")
> -
> -    def test_spdx_tar(self):
> -        self.check_recipe_spdx("packages", "tar.spdx.json", "tar")
> -
> -
>  class SPDX3CheckBase(object):
>      """
>      Base class for checking SPDX 3 based tests
> --
> 2.53.0
>

