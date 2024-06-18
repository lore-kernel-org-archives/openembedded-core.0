Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A6CC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:22:44 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.89413.1718724154439419502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 08:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxE1x4PO;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cc671f170so743172e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718724152; x=1719328952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/0o3d+6FwpSb2HrhiNWbESlA+qB4PEigX9pK7WHSX8=;
        b=LxE1x4PO8dwAf76yRwFN9eloAVrjePVhlht5aXGxvJ83rwNovL4wrjDW8smNokVz5u
         BNamXF8JxZihzk69hAmaPSv/K6tPaAZu5BIokL1H4G2A6DB9b/sd7/fn/2yrgkpmECrd
         2YrRmAZywDcxtpZItvdjwzE2C5ncLeTJl74299p8T3OvO5L4gECgWezzb3vwIKbNJSah
         YBq1F1rfmJn55qWF7IWhAokimVLF+eqkVwuoCU5sbvsiNvGXyJ9i2+05x0ilcvvQOqVB
         ki6jmtQ3783WLvDqowXonqvm+KsVJ3REC3+Eve0hpB+xuYc+SQRBTy8cy20dJq3C0l7u
         Yemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718724152; x=1719328952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/0o3d+6FwpSb2HrhiNWbESlA+qB4PEigX9pK7WHSX8=;
        b=t1S3THDuHkAwfgayi5ESfpkHfv2oAtEfmIgN+4XkG9sydvGGdbNjqYYadgJ82EQSgy
         C7K6r/3aaoU163h68p2+QAvags4mrsaxq6cswFhjJJnlw4TEQeiTuFb+ELrkHPg/OWXW
         xoSLOw8FsQQLZCrco+ASR6/wElSAmEzDCBExzVB1zKo4hnmrmrLrsiZMT/MO5E/OgDMf
         J4S3CLdmcmgR9r5vUFudo3KYWsEFXyt4gUpU8v2txX9BHIU7fKgt6J9ZgZVUaY4JHZLT
         mMq52AUrnicit2kxDqR/E1VcJf1qQ6W2nqXgINnkef5uKKtHSAeSALtOJUdAsypYQSfE
         jxfw==
X-Gm-Message-State: AOJu0YwOT1+LXuuaDHV+/F55yy9eszm3gdBWk9z7MevxmyYEAfEHeHI1
	nirNR0TZT6XrK6oh7eiOO9BcHN3GXNtal5q4vpPwNEc4Eb7AXtLEdfVg7YYoDu7EuAnCtfr40WK
	4S+ZA2doU4EfJ7Npt47wKt1slK+k=
X-Google-Smtp-Source: AGHT+IFL8aB4WAEmNA9bAJQkec7ioiYNiFB2ZC3fXEP/fdeK1w1C/u8zBfAmD9ydE/wRnW7jXl+FGKuLYXJdBp1Zprw=
X-Received: by 2002:ac2:4c4a:0:b0:52b:c14e:3b5a with SMTP id
 2adb3069b0e04-52cc4afada3mr884466e87.31.1718724152210; Tue, 18 Jun 2024
 08:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240610214456.2757397-6-JPEWhacker@gmail.com> <CAApg2=Q+wfucou_Bu7wR8rMYricHmGFK0=4xihO5HNNonSxJfw@mail.gmail.com>
In-Reply-To: <CAApg2=Q+wfucou_Bu7wR8rMYricHmGFK0=4xihO5HNNonSxJfw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 18 Jun 2024 09:22:19 -0600
Message-ID: <CAJdd5GYO0bOO2bu--80vOoVNSEwaw0aTR7NWWW2SFRTkiPM2SQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 5/6] classes/create-spdx-3.0: Add class
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200876

On Tue, Jun 18, 2024 at 8:48=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com> wrote:
>
> Hello,
> This is my first round of the review, before applying the code.
>
> On Mon, Jun 10, 2024 at 11:45=E2=80=AFPM Joshua Watt via lists.openembedd=
ed.org <JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
>
> | +SPDX_PROFILES ?=3D "core build software simpleLicensing security"
>
> I would like to discuss this choice by default. People who do security wo=
n't need the 'build' profile (and this likely adds
> much data). On the other hand, people who do licensing won't need the 'se=
curity' profile.
>
> It would be really nice to generate a basic SPDX without doing the build.=
..

I think we should look at that later just to keep the scope
reasonable; This is purposely trying to stick close to what SPDX 2.2
gives us.

>
>>
>> +
>> +SPDX_HASH_ALGORITHMS ?=3D "sha256 sha1"
>
>
> Any reason to still use sha1? It is obsolete. We could use sha3 instead i=
f we want to have multiple ones.

I've dropped this in the latest version, in favor of only using sha256
to make my life easier :)

>
>
>>
>>
>> +
>> +
>> +python do_create_spdx() {
>> +    import oe.sbom30
>> +    import oe.spdx30
>> +    from pathlib import Path
>> +    from contextlib import contextmanager
>> +    import oe.cve_check
>> +    from datetime import datetime
>> +
>> +
>> +    def set_var_field(var, obj, name, package=3DNone):
>> +        val =3D None
>> +        if package:
>> +            val =3D d.getVar("%s:%s" % (var, package))
>> +
>> +        if not val:
>> +            val =3D d.getVar(var)
>> +
>> +        if val:
>> +            setattr(obj, name, val)
>> +
>> +    deploydir =3D Path(d.getVar("SPDXDEPLOY"))
>> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
>> +    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
>> +    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
>> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
>> +    is_native =3D bb.data.inherits_class("native", d) or bb.data.inheri=
ts_class("cross", d)
>> +
>> +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
>> +
>> +    build =3D build_objset.new_sub_build("recipe", "recipe")
>> +    build_objset.doc.rootElement.append(build)
>> +
>> +    build_objset.set_is_native(is_native)
>> +
>> +    for var in (d.getVar('SPDX_CUSTOM_ANNOTATION_VARS') or "").split():
>> +        new_annotation(
>> +            d,
>> +            build_objset,
>> +            build,
>> +            "%s=3D%s" % (var, d.getVar(var)),
>> +            oe.spdx30.AnnotationType.other
>> +        )
>> +
>> +    build_inputs =3D set()
>> +
>> +    # Add CVEs
>> +    cve_by_status =3D {}
>> +    cve_by_status["Patched"] =3D {cve: build_objset.new_cve_vuln(cve) f=
or cve in oe.cve_check.get_patched_cves(d)}
>> +
>> +    for cve in (d.getVarFlags("CVE_STATUS") or {}):
>> +        status, _, _ =3D oe.cve_check.decode_cve_status(d, cve)
>> +        # Already added above
>> +        if status =3D=3D "Patched":
>> +            continue
>> +
>> +        cve_by_status.setdefault(status, {})[cve] =3D build_objset.new_=
cve_vuln(cve)
>> +
>> +    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.get=
Var("CVE_VERSION"))
>
>
> This will be adding only those from patches and everything with CVE_STATU=
S. In some cases (extra-exclusions) vulnerabilities
> that have no real link with the given package. Also, the list isn't compl=
ete, does not contain most of the unpatched ones.
>
>> +do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
>> +# NOTE: depending on do_unpack is a hack that is necessary to get it's =
dependencies for archive the source
>> +addtask do_create_spdx after do_populate_sysroot do_package do_packaged=
ata do_unpack do_collect_spdx_deps do_package_write_ipk do_pacakge_write_de=
b do_package_write_rpm before do_populate_sdk do_build do_rm_work
>> +
>
>
> This is really late... I fear that if we get that in, it will be too hard=
 to make the generation mode modulable and output
> certain profiles at a different place than the whole build. With the same=
 problem for the world build as we have today
> with 2.2.

Yep, but I think we need to focus on that after the initial
implementation. It's a solvable problem, but it's going to to be
tricky so it will take time, and I'd rather get SPDX 3 support out
early.


>
>> +def spdxid_hash(*items):
>> +    h =3D hashlib.md5()
>> +    for i in items:
>> +        if isinstance(i, oe.spdx30.Element):
>> +            h.update(i._id.encode("utf-8"))
>> +        else:
>> +            h.update(i.encode("utf-8"))
>> +    return h.hexdigest()
>> +
>
>
> Can we avoid MD5?

It's not cryptographic, so it should not matter. I don't want the hash
strings to be _terribly_ long, so unless you have some other short
hashing algorithm, I'd rather stick with this.

>>
>> +    def new_cve_vuln(self, cve):
>> +        v =3D oe.spdx30.security_Vulnerability()
>> +        v._id =3D self.new_spdxid("vulnerability", cve)
>> +        v.creationInfo =3D self.doc.creationInfo
>> +
>> +        v.externalIdentifier.append(
>> +            oe.spdx30.ExternalIdentifier(
>> +                externalIdentifierType=3Doe.spdx30.ExternalIdentifierTy=
pe.cve,
>> +                identifier=3Dcve,
>> +                identifierLocator=3D[
>> +                    f"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D=
{cve}",
>> +                    f"https://www.cve.org/CVERecord?id=3D{cve}",
>> +                ],
>
>
> Better to link to the JSON format https://cveawg.mitre.org/api/cve/{cve}

Will do, thanks. Should that be a third entry, or the only entry, or.... ?

>
>>
>> +            )
>> +        )
>> +        return self.add(v)
>> +
>> +    def new_vex_patched_relationship(self, from_, to):
>> +        self.add(
>> +            oe.spdx30.security_VexFixedVulnAssessmentRelationship(
>> +                _id=3Dself.new_spdxid("vex-fixed", spdxid_hash(from_, *=
to)),
>> +                creationInfo=3Dself.doc.creationInfo,
>> +                from_=3Dfrom_,
>> +                relationshipType=3Doe.spdx30.RelationshipType.fixedIn,
>> +                to=3Dto,
>> +                security_vexVersion=3DVEX_VERSION,
>> +            )
>> +        )
>
>
> For machine-readable entries, this should be linking to a proof of a fix,=
 for example in
> a relationship to the fix file.

Yes, I think we can do that, but we need cve_check.py to be able to
give us the file names (or hashes?) so we can correlate them.... I'll
log a bug to do that later.

>
>>
>> +
>> +    def new_vex_unpatched_relationship(self, from_, to):
>> +        self.add(
>> +            oe.spdx30.security_VexAffectedVulnAssessmentRelationship(
>> +                _id=3Dself.new_spdxid("vex-affected", spdxid_hash(from_=
, *to)),
>> +                creationInfo=3Dself.doc.creationInfo,
>> +                from_=3Dfrom_,
>> +                relationshipType=3Doe.spdx30.RelationshipType.affects,
>> +                to=3Dto,
>> +                security_vexVersion=3DVEX_VERSION,
>> +            )
>> +        )
>> +
>> +    def new_vex_ignored_relationship(self, from_, to, *, impact_stateme=
nt):
>> +        self.add(
>> +            oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship=
(
>> +                _id=3Dself.new_spdxid(
>> +                    "vex-not-affected", spdxid_hash(impact_statement, f=
rom_, *to)
>> +                ),
>> +                creationInfo=3Dself.doc.creationInfo,
>> +                from_=3Dfrom_,
>> +                relationshipType=3Doe.spdx30.RelationshipType.doesNotAf=
fect,
>> +                to=3Dto,
>> +                security_vexVersion=3DVEX_VERSION,
>> +                security_impactStatement=3Dimpact_statement,
>> +            )
>> +        )
>
>
> Missing conversion of 'Ignored' to 'justificationType' which is necessary=
 to allow machine processing of VEX statements. With 'impactStatement' only=
, which is freeform text, this is human readable only.

Ya, I think I can add that based on the not-applicable-platform or
not-applicable-config

>
> That's it in the first pass. There will be more when I can have a look in=
 the output.
>
> Regards,
> Marta

