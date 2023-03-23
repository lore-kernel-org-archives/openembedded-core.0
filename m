Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8C9C761AF
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 20:53:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.85385.1679604783803033388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 13:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cJz6ggKw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id j24so13030755wrd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679604782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8MXA25b/3+mz6HYNpUuEkfUZkZkvlGGnxN423rz8saE=;
        b=cJz6ggKwvEvqS5K6ujBt9QnlYFHmRYKEiYCJ6Wv3RckOb0MAGpEM6H7JlAH2ugSk5T
         6WNAjr0c4Jsp5A7tfsH6SzZ1dWddJOX6TLpXd2kMzcPvbOyqWZ2ATxw88eGaVqyMknRC
         v1FTdgAa4LQ/h5z8JrVzR6f2TF59YvM0YUpro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679604782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MXA25b/3+mz6HYNpUuEkfUZkZkvlGGnxN423rz8saE=;
        b=ZEeRCZ9BK/kAJqi4PHwBVw+9gNu2kux5C3dOTPna9xFE1dJj2ZSBkoPst61tksuyvi
         WJan8J0buS/xIiZcqvC2ZfRL8Y2F/ll+u6/yHiL8eZG7rNraJeJ8ct0udb/BQojAhTa6
         7ct78VF49+Yy54cqmxQZ+pqHGWXKvzlx9jwGWO0OBrC5BR6dToRwwQ3BiVWusL055ozv
         JUpKUih2z0I8Ojztrc/UGsqdFrsvRJDjRtiy/pP0Kh0TDEYE6wwe6BmMxyFo2nuDLrFg
         uHbE81mgLCdqAyx9vdwt4VE+3PLTfKCKZLTKGhbEEiDr2O00hdUpP/46qPPfm9aUplqw
         KNXA==
X-Gm-Message-State: AAQBX9e8h69xVrdnqbT+hEPnKuntednW/jASV0Vy2WgL0wrgGWwCw5S1
	VTCMs/Z8I0NP3nXXQlhC3uNn/Q==
X-Google-Smtp-Source: AKy350Y9ixVufwDADcUoWW3s8hTR8v/8Pxh3NgDidIlqNxYSIwBV4s8aaUvOiHnaZBLzLsyUQeD5yQ==
X-Received: by 2002:a5d:63d2:0:b0:2ce:ae4c:c429 with SMTP id c18-20020a5d63d2000000b002ceae4cc429mr422647wrw.4.1679604781895;
        Thu, 23 Mar 2023 13:53:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b274:32b5:9a06:2db7? ([2001:8b0:aba:5f3c:b274:32b5:9a06:2db7])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d484c000000b002c59f18674asm16990258wrs.22.2023.03.23.13.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:53:01 -0700 (PDT)
Message-ID: <31483fa4335cb16625e35198568928210a9b1f4a.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell][PATCH 1/5] classes/create-spdx: Backport
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ernst =?ISO-8859-1?Q?Sj=F6strand?= <ernstp@gmail.com>, Joshua Watt
	 <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2023 20:52:58 +0000
In-Reply-To: <CAD=4a=W7zN93AGLbZ5Sicvbt5PZOL2ADrAn6QVvkhu4AiibR0w@mail.gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
	 <20230322204558.1386634-2-JPEWhacker@gmail.com>
	 <CAD=4a=W7zN93AGLbZ5Sicvbt5PZOL2ADrAn6QVvkhu4AiibR0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 20:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178993

On Thu, 2023-03-23 at 14:42 +0100, Ernst Sj=C3=B6strand wrote:
> Den ons 22 mars 2023 kl 21:46 skrev Joshua Watt <JPEWhacker@gmail.com>:
> >=20
> > Backports the create-spdx classes from the latest versions on master.
> > This backport is a simple copy with no modifications, as its too
> > complex to cherry-pick all the corresponding changes. This will give an
> > appropriate base commit for subsequent changes and if necessary
> > additional backport cherry-picks from master in the future.
> >=20
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/create-spdx-2.2.bbclass | 1069 +++++
> >  meta/classes/create-spdx.bbclass     |    8 +
> >  meta/files/spdx-licenses.json        | 5937 ++++++++++++++++++++++++++
> >  meta/lib/oe/sbom.py                  |   84 +
> >  meta/lib/oe/spdx.py                  |  357 ++
> >  5 files changed, 7455 insertions(+)
> >  create mode 100644 meta/classes/create-spdx-2.2.bbclass
> >  create mode 100644 meta/classes/create-spdx.bbclass
> >  create mode 100644 meta/files/spdx-licenses.json
> >  create mode 100644 meta/lib/oe/sbom.py
> >  create mode 100644 meta/lib/oe/spdx.py
> >=20
> > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create=
-spdx-2.2.bbclass
> > new file mode 100644
> > index 0000000000..13d13fe1fc
> > --- /dev/null
> > +++ b/meta/classes/create-spdx-2.2.bbclass
> > @@ -0,0 +1,1069 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +
> > +DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${MACHINE}"
> > +
> > +# The product name that the CVE database uses.  Defaults to BPN, but m=
ay need to
> > +# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibt=
iff).
> > +CVE_PRODUCT ??=3D "${BPN}"
> > +CVE_VERSION ??=3D "${PV}"
> > +
> > +SPDXDIR ??=3D "${WORKDIR}/spdx"
> > +SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > +SPDXWORK =3D "${SPDXDIR}/work"
> > +SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > +SPDXSDKWORK =3D "${SPDXDIR}/sdk-work"
> > +
> > +SPDX_TOOL_NAME ??=3D "oe-spdx-creator"
> > +SPDX_TOOL_VERSION ??=3D "1.0"
> > +
> > +SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
> > +
> > +SPDX_INCLUDE_SOURCES ??=3D "0"
> > +SPDX_ARCHIVE_SOURCES ??=3D "0"
> > +SPDX_ARCHIVE_PACKAGED ??=3D "0"
> > +
> > +SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
> > +SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdoc"
> > +SPDX_PRETTY ??=3D "0"
> > +
> > +SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> > +
> > +SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
> > +
> > +SPDX_ORG ??=3D "OpenEmbedded ()"
> > +SPDX_SUPPLIER ??=3D "Organization: ${SPDX_ORG}"
> > +SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field for SPDX packag=
es created from \
> > +    this recipe. For SPDX documents create using this class during the=
 build, this \
> > +    is the contact information for the person or organization who is d=
oing the \
> > +    build."
> > +
> > +def extract_licenses(filename):
> > +    import re
> > +
> > +    lic_regex =3D re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d=
.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
> > +
> > +    try:
> > +        with open(filename, 'rb') as f:
> > +            size =3D min(15000, os.stat(filename).st_size)
> > +            txt =3D f.read(size)
> > +            licenses =3D re.findall(lic_regex, txt)
> > +            if licenses:
> > +                ascii_licenses =3D [lic.decode('ascii') for lic in lic=
enses]
> > +                return ascii_licenses
> > +    except Exception as e:
> > +        bb.warn(f"Exception reading {filename}: {e}")
> > +    return None
> > +
> > +def get_doc_namespace(d, doc):
> > +    import uuid
> > +    namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_U=
UID_NAMESPACE"))
> > +    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, =
str(uuid.uuid5(namespace_uuid, doc.name)))
> > +
> > +def create_annotation(d, comment):
> > +    from datetime import datetime, timezone
> > +
> > +    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-=
%dT%H:%M:%SZ")
> > +    annotation =3D oe.spdx.SPDXAnnotation()
> > +    annotation.annotationDate =3D creation_time
> > +    annotation.annotationType =3D "OTHER"
> > +    annotation.annotator =3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NA=
ME"), d.getVar("SPDX_TOOL_VERSION"))
> > +    annotation.comment =3D comment
> > +    return annotation
> > +
> > +def recipe_spdx_is_native(d, recipe):
> > +    return any(a.annotationType =3D=3D "OTHER" and
> > +      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME")=
, d.getVar("SPDX_TOOL_VERSION")) and
> > +      a.comment =3D=3D "isNative" for a in recipe.annotations)
> > +
> > +def is_work_shared_spdx(d):
> > +    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.=
getVar('WORKDIR'))
> > +
> > +def get_json_indent(d):
> > +    if d.getVar("SPDX_PRETTY") =3D=3D "1":
> > +        return 2
> > +    return None
> > +
> > +python() {
> > +    import json
> > +    if d.getVar("SPDX_LICENSE_DATA"):
> > +        return
> > +
> > +    with open(d.getVar("SPDX_LICENSES"), "r") as f:
> > +        data =3D json.load(f)
> > +        # Transform the license array to a dictionary
> > +        data["licenses"] =3D {l["licenseId"]: l for l in data["license=
s"]}
> > +        d.setVar("SPDX_LICENSE_DATA", data)
> > +}
> > +
> > +def convert_license_to_spdx(lic, document, d, existing=3D{}):
> > +    from pathlib import Path
> > +    import oe.spdx
> > +
> > +    license_data =3D d.getVar("SPDX_LICENSE_DATA")
> > +    extracted =3D {}
> > +
> > +    def add_extracted_license(ident, name):
> > +        nonlocal document
> > +
> > +        if name in extracted:
> > +            return
> > +
> > +        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
> > +        extracted_info.name =3D name
> > +        extracted_info.licenseId =3D ident
> > +        extracted_info.extractedText =3D None
> > +
> > +        if name =3D=3D "PD":
> > +            # Special-case this.
> > +            extracted_info.extractedText =3D "Software released to the=
 public domain"
> > +        else:
> > +            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_=
PATH
> > +            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.get=
Var('LICENSE_PATH') or '').split():
> > +                try:
> > +                    with (Path(directory) / name).open(errors=3D"repla=
ce") as f:
> > +                        extracted_info.extractedText =3D f.read()
> > +                        break
> > +                except FileNotFoundError:
> > +                    pass
> > +            if extracted_info.extractedText is None:
> > +                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must=
 be set
> > +                filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
> > +                if filename:
> > +                    filename =3D d.expand("${S}/" + filename)
> > +                    with open(filename, errors=3D"replace") as f:
> > +                        extracted_info.extractedText =3D f.read()
> > +                else:
> > +                    bb.error("Cannot find any text for license %s" % n=
ame)
> > +
> > +        extracted[name] =3D extracted_info
> > +        document.hasExtractedLicensingInfos.append(extracted_info)
> > +
> > +    def convert(l):
> > +        if l =3D=3D "(" or l =3D=3D ")":
> > +            return l
> > +
> > +        if l =3D=3D "&":
> > +            return "AND"
> > +
> > +        if l =3D=3D "|":
> > +            return "OR"
> > +
> > +        if l =3D=3D "CLOSED":
> > +            return "NONE"
> > +
> > +        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
> > +        if spdx_license in license_data["licenses"]:
> > +            return spdx_license
> > +
> > +        try:
> > +            spdx_license =3D existing[l]
> > +        except KeyError:
> > +            spdx_license =3D "LicenseRef-" + l
> > +            add_extracted_license(spdx_license, l)
> > +
> > +        return spdx_license
> > +
> > +    lic_split =3D lic.replace("(", " ( ").replace(")", " ) ").split()
> > +
> > +    return ' '.join(convert(l) for l in lic_split)
> > +
> > +def process_sources(d):
> > +    pn =3D d.getVar('PN')
> > +    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
> > +    if pn in assume_provided:
> > +        for p in d.getVar("PROVIDES").split():
> > +            if p !=3D pn:
> > +                pn =3D p
> > +                break
> > +
> > +    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been d=
eleted,
> > +    # so avoid archiving source here.
> > +    if pn.startswith('glibc-locale'):
> > +        return False
> > +    if d.getVar('PN') =3D=3D "libtool-cross":
> > +        return False
> > +    if d.getVar('PN') =3D=3D "libgcc-initial":
> > +        return False
> > +    if d.getVar('PN') =3D=3D "shadow-sysroot":
> > +        return False
> > +
> > +    # We just archive gcc-source for all the gcc related recipes
> > +    if d.getVar('BPN') in ['gcc', 'libgcc']:
> > +        bb.debug(1, 'spdx: There is bug in scan of %s is, do nothing' =
% pn)
> > +        return False
> > +
> > +    return True
> > +
> > +
> > +def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types,=
 *, archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
> > +    from pathlib import Path
> > +    import oe.spdx
> > +    import hashlib
> > +
> > +    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> > +    if source_date_epoch:
> > +        source_date_epoch =3D int(source_date_epoch)
> > +
> > +    sha1s =3D []
> > +    spdx_files =3D []
> > +
> > +    file_counter =3D 1
> > +    for subdir, dirs, files in os.walk(topdir):
> > +        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> > +        if subdir =3D=3D str(topdir):
> > +            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_=
dirs]
> > +
> > +        for file in files:
> > +            filepath =3D Path(subdir) / file
> > +            filename =3D str(filepath.relative_to(topdir))
> > +
> > +            if not filepath.is_symlink() and filepath.is_file():
> > +                spdx_file =3D oe.spdx.SPDXFile()
> > +                spdx_file.SPDXID =3D get_spdxid(file_counter)
> > +                for t in get_types(filepath):
> > +                    spdx_file.fileTypes.append(t)
> > +                spdx_file.fileName =3D filename
> > +
> > +                if archive is not None:
> > +                    with filepath.open("rb") as f:
> > +                        info =3D archive.gettarinfo(fileobj=3Df)
> > +                        info.name =3D filename
> > +                        info.uid =3D 0
> > +                        info.gid =3D 0
> > +                        info.uname =3D "root"
> > +                        info.gname =3D "root"
> > +
> > +                        if source_date_epoch is not None and info.mtim=
e > source_date_epoch:
> > +                            info.mtime =3D source_date_epoch
> > +
> > +                        archive.addfile(info, f)
> > +
> > +                sha1 =3D bb.utils.sha1_file(filepath)
> > +                sha1s.append(sha1)
> > +                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> > +                        algorithm=3D"SHA1",
> > +                        checksumValue=3Dsha1,
> > +                    ))
> > +                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> > +                        algorithm=3D"SHA256",
> > +                        checksumValue=3Dbb.utils.sha256_file(filepath)=
,
> > +                    ))
> > +
> > +                if "SOURCE" in spdx_file.fileTypes:
> > +                    extracted_lics =3D extract_licenses(filepath)
> > +                    if extracted_lics:
> > +                        spdx_file.licenseInfoInFiles =3D extracted_lic=
s
> > +
> > +                doc.files.append(spdx_file)
> > +                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
> > +                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> > +
> > +                spdx_files.append(spdx_file)
> > +
> > +                file_counter +=3D 1
> > +
> > +    sha1s.sort()
> > +    verifier =3D hashlib.sha1()
> > +    for v in sha1s:
> > +        verifier.update(v.encode("utf-8"))
> > +    spdx_pkg.packageVerificationCode.packageVerificationCodeValue =3D =
verifier.hexdigest()
> > +
> > +    return spdx_files
> > +
> > +
> > +def add_package_sources_from_debug(d, package_doc, spdx_package, packa=
ge, package_files, sources):
> > +    from pathlib import Path
> > +    import hashlib
> > +    import oe.packagedata
> > +    import oe.spdx
> > +
> > +    debug_search_paths =3D [
> > +        Path(d.getVar('PKGD')),
> > +        Path(d.getVar('STAGING_DIR_TARGET')),
> > +        Path(d.getVar('STAGING_DIR_NATIVE')),
> > +        Path(d.getVar('STAGING_KERNEL_DIR')),
> > +    ]
> > +
> > +    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
> > +
> > +    if pkg_data is None:
> > +        return
> > +
> > +    for file_path, file_data in pkg_data["files_info"].items():
> > +        if not "debugsrc" in file_data:
> > +            continue
> > +
> > +        for pkg_file in package_files:
> > +            if file_path.lstrip("/") =3D=3D pkg_file.fileName.lstrip("=
/"):
> > +                break
> > +        else:
> > +            bb.fatal("No package file found for %s" % str(file_path))
> > +            continue
> > +
> > +        for debugsrc in file_data["debugsrc"]:
> > +            ref_id =3D "NOASSERTION"
> > +            for search in debug_search_paths:
> > +                if debugsrc.startswith("/usr/src/kernel"):
> > +                    debugsrc_path =3D search / debugsrc.replace('/usr/=
src/kernel/', '')
> > +                else:
> > +                    debugsrc_path =3D search / debugsrc.lstrip("/")
> > +                if not debugsrc_path.exists():
> > +                    continue
> > +
> > +                file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
> > +
> > +                if file_sha256 in sources:
> > +                    source_file =3D sources[file_sha256]
> > +
> > +                    doc_ref =3D package_doc.find_external_document_ref=
(source_file.doc.documentNamespace)
> > +                    if doc_ref is None:
> > +                        doc_ref =3D oe.spdx.SPDXExternalDocumentRef()
> > +                        doc_ref.externalDocumentId =3D "DocumentRef-de=
pendency-" + source_file.doc.name
> > +                        doc_ref.spdxDocument =3D source_file.doc.docum=
entNamespace
> > +                        doc_ref.checksum.algorithm =3D "SHA1"
> > +                        doc_ref.checksum.checksumValue =3D source_file=
.doc_sha1
> > +                        package_doc.externalDocumentRefs.append(doc_re=
f)
> > +
> > +                    ref_id =3D "%s:%s" % (doc_ref.externalDocumentId, =
source_file.file.SPDXID)
> > +                else:
> > +                    bb.debug(1, "Debug source %s with SHA256 %s not fo=
und in any dependency" % (str(debugsrc_path), file_sha256))
> > +                break
> > +            else:
> > +                bb.debug(1, "Debug source %s not found" % debugsrc)
> > +
> > +            package_doc.add_relationship(pkg_file, "GENERATED_FROM", r=
ef_id, comment=3Ddebugsrc)
> > +
> > +def collect_dep_recipes(d, doc, spdx_recipe):
> > +    from pathlib import Path
> > +    import oe.sbom
> > +    import oe.spdx
> > +
> > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > +
> > +    dep_recipes =3D []
> > +    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
> > +    deps =3D sorted(set(
> > +        dep[0] for dep in taskdepdata.values() if
> > +            dep[1] =3D=3D "do_create_spdx" and dep[0] !=3D d.getVar("P=
N")
> > +    ))
> > +    for dep_pn in deps:
> > +        dep_recipe_path =3D deploy_dir_spdx / "recipes" / ("recipe-%s.=
spdx.json" % dep_pn)
> > +
> > +        spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_pa=
th)
> > +
> > +        for pkg in spdx_dep_doc.packages:
> > +            if pkg.name =3D=3D dep_pn:
> > +                spdx_dep_recipe =3D pkg
> > +                break
> > +        else:
> > +            continue
> > +
> > +        dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sh=
a1, spdx_dep_recipe))
> > +
> > +        dep_recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> > +        dep_recipe_ref.externalDocumentId =3D "DocumentRef-dependency-=
" + spdx_dep_doc.name
> > +        dep_recipe_ref.spdxDocument =3D spdx_dep_doc.documentNamespace
> > +        dep_recipe_ref.checksum.algorithm =3D "SHA1"
> > +        dep_recipe_ref.checksum.checksumValue =3D spdx_dep_sha1
> > +
> > +        doc.externalDocumentRefs.append(dep_recipe_ref)
> > +
> > +        doc.add_relationship(
> > +            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_rec=
ipe.SPDXID),
> > +            "BUILD_DEPENDENCY_OF",
> > +            spdx_recipe
> > +        )
> > +
> > +    return dep_recipes
> > +
> > +collect_dep_recipes[vardepsexclude] +=3D "BB_TASKDEPDATA"
> > +collect_dep_recipes[vardeps] +=3D "DEPENDS"
> > +
> > +def collect_dep_sources(d, dep_recipes):
> > +    import oe.sbom
> > +
> > +    sources =3D {}
> > +    for dep in dep_recipes:
> > +        # Don't collect sources from native recipes as they
> > +        # match non-native sources also.
> > +        if recipe_spdx_is_native(d, dep.recipe):
> > +            continue
> > +        recipe_files =3D set(dep.recipe.hasFiles)
> > +
> > +        for spdx_file in dep.doc.files:
> > +            if spdx_file.SPDXID not in recipe_files:
> > +                continue
> > +
> > +            if "SOURCE" in spdx_file.fileTypes:
> > +                for checksum in spdx_file.checksums:
> > +                    if checksum.algorithm =3D=3D "SHA256":
> > +                        sources[checksum.checksumValue] =3D oe.sbom.De=
pSource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
> > +                        break
> > +
> > +    return sources
> > +
> > +def add_download_packages(d, doc, recipe):
> > +    import os.path
> > +    from bb.fetch2 import decodeurl, CHECKSUM_LIST
> > +    import bb.process
> > +    import oe.spdx
> > +    import oe.sbom
> > +
> > +    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()=
):
> > +        f =3D bb.fetch2.FetchData(src_uri, d)
> > +
> > +        for name in f.names:
> > +            package =3D oe.spdx.SPDXPackage()
> > +            package.name =3D "%s-source-%d" % (d.getVar("PN"), downloa=
d_idx + 1)
> > +            package.SPDXID =3D oe.sbom.get_download_spdxid(d, download=
_idx + 1)
> > +
> > +            if f.type =3D=3D "file":
> > +                continue
> > +
> > +            uri =3D f.type
> > +            proto =3D getattr(f, "proto", None)
> > +            if proto is not None:
> > +                uri =3D uri + "+" + proto
> > +            uri =3D uri + "://" + f.host + f.path
> > +
> > +            if f.method.supports_srcrev():
> > +                uri =3D uri + "@" + f.revisions[name]
> > +
> > +            if f.method.supports_checksum(f):
> > +                for checksum_id in CHECKSUM_LIST:
> > +                    if checksum_id.upper() not in oe.spdx.SPDXPackage.=
ALLOWED_CHECKSUMS:
> > +                        continue
> > +
> > +                    expected_checksum =3D getattr(f, "%s_expected" % c=
hecksum_id)
> > +                    if expected_checksum is None:
> > +                        continue
> > +
> > +                    c =3D oe.spdx.SPDXChecksum()
> > +                    c.algorithm =3D checksum_id.upper()
> > +                    c.checksumValue =3D expected_checksum
> > +                    package.checksums.append(c)
> > +
> > +            package.downloadLocation =3D uri
> > +            doc.packages.append(package)
> > +            doc.add_relationship(doc, "DESCRIBES", package)
> > +            # In the future, we might be able to do more fancy depende=
ncies,
> > +            # but this should be sufficient for now
> > +            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recip=
e)
> > +
> > +python do_create_spdx() {
> > +    from datetime import datetime, timezone
> > +    import oe.sbom
> > +    import oe.spdx
> > +    import uuid
> > +    from pathlib import Path
> > +    from contextlib import contextmanager
> > +    import oe.cve_check
> > +
> > +    @contextmanager
> > +    def optional_tarfile(name, guard, mode=3D"w"):
> > +        import tarfile
> > +        import bb.compress.zstd
> > +
> > +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> > +
> > +        if guard:
> > +            name.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
> > +            with bb.compress.zstd.open(name, mode=3Dmode + "b", num_th=
reads=3Dnum_threads) as f:
> > +                with tarfile.open(fileobj=3Df, mode=3Dmode + "|") as t=
f:
> > +                    yield tf
> > +        else:
> > +            yield None
> > +
> > +
> > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > +    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
> > +    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> > +    archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
> > +    archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
> > +
> > +    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-=
%dT%H:%M:%SZ")
> > +
> > +    doc =3D oe.spdx.SPDXDocument()
> > +
> > +    doc.name =3D "recipe-" + d.getVar("PN")
> > +    doc.documentNamespace =3D get_doc_namespace(d, doc)
> > +    doc.creationInfo.created =3D creation_time
> > +    doc.creationInfo.comment =3D "This document was created by analyzi=
ng recipe files during the build."
> > +    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DAT=
A")["licenseListVersion"]
> > +    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-s=
pdx.bbclass")
> > +    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SP=
DX_ORG"))
> > +    doc.creationInfo.creators.append("Person: N/A ()")
> > +
> > +    recipe =3D oe.spdx.SPDXPackage()
> > +    recipe.name =3D d.getVar("PN")
> > +    recipe.versionInfo =3D d.getVar("PV")
> > +    recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)
> > +    recipe.supplier =3D d.getVar("SPDX_SUPPLIER")
> > +    if bb.data.inherits_class("native", d) or bb.data.inherits_class("=
cross", d):
> > +        recipe.annotations.append(create_annotation(d, "isNative"))
> > +
> > +    homepage =3D d.getVar("HOMEPAGE")
> > +    if homepage:
> > +        recipe.homepage =3D homepage
> > +
> > +    license =3D d.getVar("LICENSE")
> > +    if license:
> > +        recipe.licenseDeclared =3D convert_license_to_spdx(license, do=
c, d)
> > +
> > +    summary =3D d.getVar("SUMMARY")
> > +    if summary:
> > +        recipe.summary =3D summary
> > +
> > +    description =3D d.getVar("DESCRIPTION")
> > +    if description:
> > +        recipe.description =3D description
> > +
> > +    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
> > +        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
> > +            recipe.annotations.append(create_annotation(d, var + "=3D"=
 + d.getVar(var)))
> > +
> > +    # Some CVEs may be patched during the build process without increm=
enting the version number,
> > +    # so querying for CVEs based on the CPE id can lead to false posit=
ives. To account for this,
> > +    # save the CVEs fixed by patches to source information field in th=
e SPDX.
> > +    patched_cves =3D oe.cve_check.get_patched_cves(d)
> > +    patched_cves =3D list(patched_cves)
> > +    patched_cves =3D ' '.join(patched_cves)
> > +    if patched_cves:
> > +        recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
> > +
> > +    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.ge=
tVar("CVE_VERSION"))
> > +    if cpe_ids:
> > +        for cpe_id in cpe_ids:
> > +            cpe =3D oe.spdx.SPDXExternalReference()
> > +            cpe.referenceCategory =3D "SECURITY"
> > +            cpe.referenceType =3D "http://spdx.org/rdf/references/cpe2=
3Type"
> > +            cpe.referenceLocator =3D cpe_id
> > +            recipe.externalRefs.append(cpe)
> > +
> > +    doc.packages.append(recipe)
> > +    doc.add_relationship(doc, "DESCRIBES", recipe)
> > +
> > +    add_download_packages(d, doc, recipe)
> > +
> > +    if process_sources(d) and include_sources:
> > +        recipe_archive =3D deploy_dir_spdx / "recipes" / (doc.name + "=
.tar.zst")
> > +        with optional_tarfile(recipe_archive, archive_sources) as arch=
ive:
> > +            spdx_get_src(d)
> > +
> > +            add_package_files(
> > +                d,
> > +                doc,
> > +                recipe,
> > +                spdx_workdir,
> > +                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.g=
etVar("PN"), file_counter),
> > +                lambda filepath: ["SOURCE"],
> > +                ignore_dirs=3D[".git"],
> > +                ignore_top_level_dirs=3D["temp"],
> > +                archive=3Darchive,
> > +            )
> > +
> > +            if archive is not None:
> > +                recipe.packageFileName =3D str(recipe_archive.name)
> > +
> > +    dep_recipes =3D collect_dep_recipes(d, doc, recipe)
> > +
> > +    doc_sha1 =3D oe.sbom.write_doc(d, doc, "recipes", indent=3Dget_jso=
n_indent(d))
> > +    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
> > +
> > +    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> > +    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.n=
ame
> > +    recipe_ref.spdxDocument =3D doc.documentNamespace
> > +    recipe_ref.checksum.algorithm =3D "SHA1"
> > +    recipe_ref.checksum.checksumValue =3D doc_sha1
> > +
> > +    sources =3D collect_dep_sources(d, dep_recipes)
> > +    found_licenses =3D {license.name:recipe_ref.externalDocumentId + "=
:" + license.licenseId for license in doc.hasExtractedLicensingInfos}
> > +
> > +    if not recipe_spdx_is_native(d, recipe):
> > +        bb.build.exec_func("read_subpackage_metadata", d)
> > +
> > +        pkgdest =3D Path(d.getVar("PKGDEST"))
> > +        for package in d.getVar("PACKAGES").split():
> > +            if not oe.packagedata.packaged(package, d):
> > +                continue
> > +
> > +            package_doc =3D oe.spdx.SPDXDocument()
> > +            pkg_name =3D d.getVar("PKG:%s" % package) or package
> > +            package_doc.name =3D pkg_name
> > +            package_doc.documentNamespace =3D get_doc_namespace(d, pac=
kage_doc)
> > +            package_doc.creationInfo.created =3D creation_time
> > +            package_doc.creationInfo.comment =3D "This document was cr=
eated by analyzing packages created during the build."
> > +            package_doc.creationInfo.licenseListVersion =3D d.getVar("=
SPDX_LICENSE_DATA")["licenseListVersion"]
> > +            package_doc.creationInfo.creators.append("Tool: OpenEmbedd=
ed Core create-spdx.bbclass")
> > +            package_doc.creationInfo.creators.append("Organization: %s=
" % d.getVar("SPDX_ORG"))
> > +            package_doc.creationInfo.creators.append("Person: N/A ()")
> > +            package_doc.externalDocumentRefs.append(recipe_ref)
> > +
> > +            package_license =3D d.getVar("LICENSE:%s" % package) or d.=
getVar("LICENSE")
> > +
> > +            spdx_package =3D oe.spdx.SPDXPackage()
> > +
> > +            spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_nam=
e)
> > +            spdx_package.name =3D pkg_name
> > +            spdx_package.versionInfo =3D d.getVar("PV")
> > +            spdx_package.licenseDeclared =3D convert_license_to_spdx(p=
ackage_license, package_doc, d, found_licenses)
> > +            spdx_package.supplier =3D d.getVar("SPDX_SUPPLIER")
> > +
> > +            package_doc.packages.append(spdx_package)
> > +
> > +            package_doc.add_relationship(spdx_package, "GENERATED_FROM=
", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
> > +            package_doc.add_relationship(package_doc, "DESCRIBES", spd=
x_package)
> > +
> > +            package_archive =3D deploy_dir_spdx / "packages" / (packag=
e_doc.name + ".tar.zst")
> > +            with optional_tarfile(package_archive, archive_packaged) a=
s archive:
> > +                package_files =3D add_package_files(
> > +                    d,
> > +                    package_doc,
> > +                    spdx_package,
> > +                    pkgdest / package,
> > +                    lambda file_counter: oe.sbom.get_packaged_file_spd=
xid(pkg_name, file_counter),
> > +                    lambda filepath: ["BINARY"],
> > +                    ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
> > +                    archive=3Darchive,
> > +                )
> > +
> > +                if archive is not None:
> > +                    spdx_package.packageFileName =3D str(package_archi=
ve.name)
> > +
> > +            add_package_sources_from_debug(d, package_doc, spdx_packag=
e, package, package_files, sources)
> > +
> > +            oe.sbom.write_doc(d, package_doc, "packages", indent=3Dget=
_json_indent(d))
> > +}
> > +# NOTE: depending on do_unpack is a hack that is necessary to get it's=
 dependencies for archive the source
> > +addtask do_create_spdx after do_package do_packagedata do_unpack befor=
e do_populate_sdk do_build do_rm_work
> > +
> > +SSTATETASKS +=3D "do_create_spdx"
> > +do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
> > +do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > +
> > +python do_create_spdx_setscene () {
> > +    sstate_setscene(d)
> > +}
> > +addtask do_create_spdx_setscene
> > +
> > +do_create_spdx[dirs] =3D "${SPDXWORK}"
> > +do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> > +do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
> > +do_create_spdx[deptask] =3D "do_create_spdx"
> > +
> > +def collect_package_providers(d):
> > +    from pathlib import Path
> > +    import oe.sbom
> > +    import oe.spdx
> > +    import json
> > +
> > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > +
> > +    providers =3D {}
> > +
> > +    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
> > +    deps =3D sorted(set(
> > +        dep[0] for dep in taskdepdata.values() if dep[0] !=3D d.getVar=
("PN")
> > +    ))
> > +    deps.append(d.getVar("PN"))
> > +
> > +    for dep_pn in deps:
> > +        recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, d)
> > +
> > +        for pkg in recipe_data.get("PACKAGES", "").split():
> > +
> > +            pkg_data =3D oe.packagedata.read_subpkgdata_dict(pkg, d)
> > +            rprovides =3D set(n for n, _ in bb.utils.explode_dep_versi=
ons2(pkg_data.get("RPROVIDES", "")).items())
> > +            rprovides.add(pkg)
> > +
> > +            for r in rprovides:
> > +                providers[r] =3D pkg
> > +
> > +    return providers
> > +
> > +collect_package_providers[vardepsexclude] +=3D "BB_TASKDEPDATA"
> > +
> > +python do_create_runtime_spdx() {
> > +    from datetime import datetime, timezone
> > +    import oe.sbom
> > +    import oe.spdx
> > +    import oe.packagedata
> > +    from pathlib import Path
> > +
> > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > +    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> > +    is_native =3D bb.data.inherits_class("native", d) or bb.data.inher=
its_class("cross", d)
> > +
> > +    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-=
%dT%H:%M:%SZ")
> > +
> > +    providers =3D collect_package_providers(d)
> > +
> > +    if not is_native:
> > +        bb.build.exec_func("read_subpackage_metadata", d)
> > +
> > +        dep_package_cache =3D {}
> > +
> > +        pkgdest =3D Path(d.getVar("PKGDEST"))
> > +        for package in d.getVar("PACKAGES").split():
> > +            localdata =3D bb.data.createCopy(d)
> > +            pkg_name =3D d.getVar("PKG:%s" % package) or package
> > +            localdata.setVar("PKG", pkg_name)
> > +            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False)=
 + ":" + package)
> > +
> > +            if not oe.packagedata.packaged(package, localdata):
> > +                continue
> > +
> > +            pkg_spdx_path =3D deploy_dir_spdx / "packages" / (pkg_name=
 + ".spdx.json")
> > +
> > +            package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spd=
x_path)
> > +
> > +            for p in package_doc.packages:
> > +                if p.name =3D=3D pkg_name:
> > +                    spdx_package =3D p
> > +                    break
> > +            else:
> > +                bb.fatal("Package '%s' not found in %s" % (pkg_name, p=
kg_spdx_path))
> > +
> > +            runtime_doc =3D oe.spdx.SPDXDocument()
> > +            runtime_doc.name =3D "runtime-" + pkg_name
> > +            runtime_doc.documentNamespace =3D get_doc_namespace(locald=
ata, runtime_doc)
> > +            runtime_doc.creationInfo.created =3D creation_time
> > +            runtime_doc.creationInfo.comment =3D "This document was cr=
eated by analyzing package runtime dependencies."
> > +            runtime_doc.creationInfo.licenseListVersion =3D d.getVar("=
SPDX_LICENSE_DATA")["licenseListVersion"]
> > +            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedd=
ed Core create-spdx.bbclass")
> > +            runtime_doc.creationInfo.creators.append("Organization: %s=
" % d.getVar("SPDX_ORG"))
> > +            runtime_doc.creationInfo.creators.append("Person: N/A ()")
> > +
> > +            package_ref =3D oe.spdx.SPDXExternalDocumentRef()
> > +            package_ref.externalDocumentId =3D "DocumentRef-package-" =
+ package
> > +            package_ref.spdxDocument =3D package_doc.documentNamespace
> > +            package_ref.checksum.algorithm =3D "SHA1"
> > +            package_ref.checksum.checksumValue =3D package_doc_sha1
> > +
> > +            runtime_doc.externalDocumentRefs.append(package_ref)
> > +
> > +            runtime_doc.add_relationship(
> > +                runtime_doc.SPDXID,
> > +                "AMENDS",
> > +                "%s:%s" % (package_ref.externalDocumentId, package_doc=
.SPDXID)
> > +            )
> > +
> > +            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RDEPENDS") or "")
> > +            seen_deps =3D set()
> > +            for dep, _ in deps.items():
> > +                if dep in seen_deps:
> > +                    continue
> > +
> > +                if dep not in providers:
> > +                    continue
> > +
> > +                dep =3D providers[dep]
> > +
> > +                if not oe.packagedata.packaged(dep, localdata):
> > +                    continue
> > +
> > +                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(d=
ep, d)
> > +                dep_pkg =3D dep_pkg_data["PKG"]
> > +
> > +                if dep in dep_package_cache:
> > +                    (dep_spdx_package, dep_package_ref) =3D dep_packag=
e_cache[dep]
> > +                else:
> > +                    dep_path =3D deploy_dir_spdx / "packages" / ("%s.s=
pdx.json" % dep_pkg)
> > +
> > +                    spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(d=
ep_path)
> > +
> > +                    for pkg in spdx_dep_doc.packages:
> > +                        if pkg.name =3D=3D dep_pkg:
> > +                            dep_spdx_package =3D pkg
> > +                            break
> > +                    else:
> > +                        bb.fatal("Package '%s' not found in %s" % (dep=
_pkg, dep_path))
> > +
> > +                    dep_package_ref =3D oe.spdx.SPDXExternalDocumentRe=
f()
> > +                    dep_package_ref.externalDocumentId =3D "DocumentRe=
f-runtime-dependency-" + spdx_dep_doc.name
> > +                    dep_package_ref.spdxDocument =3D spdx_dep_doc.docu=
mentNamespace
> > +                    dep_package_ref.checksum.algorithm =3D "SHA1"
> > +                    dep_package_ref.checksum.checksumValue =3D spdx_de=
p_sha1
> > +
> > +                    dep_package_cache[dep] =3D (dep_spdx_package, dep_=
package_ref)
> > +
> > +                runtime_doc.externalDocumentRefs.append(dep_package_re=
f)
> > +
> > +                runtime_doc.add_relationship(
> > +                    "%s:%s" % (dep_package_ref.externalDocumentId, dep=
_spdx_package.SPDXID),
> > +                    "RUNTIME_DEPENDENCY_OF",
> > +                    "%s:%s" % (package_ref.externalDocumentId, spdx_pa=
ckage.SPDXID)
> > +                )
> > +                seen_deps.add(dep)
> > +
> > +            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy, =
indent=3Dget_json_indent(d))
> > +}
> > +
> > +addtask do_create_runtime_spdx after do_create_spdx before do_build do=
_rm_work
> > +SSTATETASKS +=3D "do_create_runtime_spdx"
> > +do_create_runtime_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > +do_create_runtime_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > +
> > +python do_create_runtime_spdx_setscene () {
> > +    sstate_setscene(d)
> > +}
> > +addtask do_create_runtime_spdx_setscene
> > +
> > +do_create_runtime_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > +do_create_runtime_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > +do_create_runtime_spdx[rdeptask] =3D "do_create_spdx"
> > +
> > +def spdx_get_src(d):
> > +    """
> > +    save patched source of the recipe in SPDX_WORKDIR.
> > +    """
> > +    import shutil
> > +    spdx_workdir =3D d.getVar('SPDXWORK')
> > +    spdx_sysroot_native =3D d.getVar('STAGING_DIR_NATIVE')
> > +    pn =3D d.getVar('PN')
> > +
> > +    workdir =3D d.getVar("WORKDIR")
> > +
> > +    try:
> > +        # The kernel class functions require it to be on work-shared, =
so we dont change WORKDIR
> > +        if not is_work_shared_spdx(d):
> > +            # Change the WORKDIR to make do_unpack do_patch run in ano=
ther dir.
> > +            d.setVar('WORKDIR', spdx_workdir)
> > +            # Restore the original path to recipe's native sysroot (it=
's relative to WORKDIR).
> > +            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
> > +
> > +            # The changed 'WORKDIR' also caused 'B' changed, create di=
r 'B' for the
> > +            # possibly requiring of the following tasks (such as some =
recipes's
> > +            # do_patch required 'B' existed).
> > +            bb.utils.mkdirhier(d.getVar('B'))
> > +
> > +            bb.build.exec_func('do_unpack', d)
> > +        # Copy source of kernel to spdx_workdir
> > +        if is_work_shared_spdx(d):
> > +            share_src =3D d.getVar('WORKDIR')
> > +            d.setVar('WORKDIR', spdx_workdir)
> > +            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
> > +            src_dir =3D spdx_workdir + "/" + d.getVar('PN')+ "-" + d.g=
etVar('PV') + "-" + d.getVar('PR')
> > +            bb.utils.mkdirhier(src_dir)
> > +            if bb.data.inherits_class('kernel',d):
> > +                share_src =3D d.getVar('STAGING_KERNEL_DIR')
> > +            cmd_copy_share =3D "cp -rf " + share_src + "/* " + src_dir=
 + "/"
> > +            cmd_copy_shared_res =3D os.popen(cmd_copy_share).read()
> > +            bb.note("cmd_copy_shared_result =3D " + cmd_copy_shared_re=
s)
> > +
> > +            git_path =3D src_dir + "/.git"
> > +            if os.path.exists(git_path):
> > +                shutils.rmtree(git_path)
> > +
> > +        # Make sure gcc and kernel sources are patched only once
> > +        if not (d.getVar('SRC_URI') =3D=3D "" or is_work_shared_spdx(d=
)):
> > +            bb.build.exec_func('do_patch', d)
> > +
> > +        # Some userland has no source.
> > +        if not os.path.exists( spdx_workdir ):
> > +            bb.utils.mkdirhier(spdx_workdir)
> > +    finally:
> > +        d.setVar("WORKDIR", workdir)
> > +
> > +do_rootfs[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx"
> > +do_rootfs[cleandirs] +=3D "${SPDXIMAGEWORK}"
> > +
> > +ROOTFS_POSTUNINSTALL_COMMAND =3D+ "image_combine_spdx ; "
> > +
> > +do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_runtime_sp=
dx"
> > +do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
> > +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host=
_combine_spdx; "
> > +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_ta=
rget_combine_spdx; "
> > +
> > +python image_combine_spdx() {
> > +    import os
> > +    import oe.sbom
> > +    from pathlib import Path
> > +    from oe.rootfs import image_list_installed_packages
> > +
> > +    image_name =3D d.getVar("IMAGE_NAME")
> > +    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> > +    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
> > +    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
> > +    packages =3D image_list_installed_packages(d)
> > +
> > +    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Pa=
th(d.getVar("SPDXIMAGEWORK")))
> > +
> > +    def make_image_link(target_path, suffix):
> > +        if image_link_name:
> > +            link =3D imgdeploydir / (image_link_name + suffix)
> > +            if link !=3D target_path:
> > +                link.symlink_to(os.path.relpath(target_path, link.pare=
nt))
> > +
> > +    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
> > +    make_image_link(spdx_tar_path, ".spdx.tar.zst")
>=20
> The image link should be called tar.gz also. Probably best to make a
> gzip-from-the-start version for Dunfell,
> or perhaps squash everything?

This is a bit of an unusual situation where we're taking a different
path to master. I think this does make sense as it shows the delta with
master more clearly and that could be useful in the future so I suspect
that it does make sense as it is here, albeit a little unusual.

Cheers,

Richard



