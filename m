Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D17C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 14:06:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.13290.1717164402239448919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 07:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErF3GrCO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70249c5fb36so538854b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164401; x=1717769201; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3c6R4nRyv7AGPFK9sOcOBQIk7elbaaKDO83wmvKKUIY=;
        b=ErF3GrCO0xsAW+/vdVd5XaIVSKfMlnrSSUJClh30I5v0C6eKRxTipaQwyb6QxIX60/
         PHAn6V5ijQLrkLz69k/YyTY+RufXLvjzsDtYCcP/c3Us12FMvz5vopZf/U213IQ3C9Ga
         v42X5g1ZMOhvKk3al/yKP2cbw5/SHATSaBENQEBhPo1euLr0whqB8pL9veY62z6H3Yai
         edlRgACqEKsWoy5VjisV8y8ML0CAR2qIJ+/PGKfpQz7QlJbQyjnsdzabSjD7K/4jG1b1
         AfXsd1p9VyWPEHlzbpaI3Xr2fihXHSjM5YXe/P1xtrBrQdLXS+hxP38Yk7sD5ereNPkO
         vGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164401; x=1717769201;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3c6R4nRyv7AGPFK9sOcOBQIk7elbaaKDO83wmvKKUIY=;
        b=gK90jQ6J2je5HXhvypg/BmsQ50YI4wEc4K3DkZmiXakNyZlIECPzw6QhTT3xpACENo
         eZHpOPvWrrXcrcIe0nZAO1baBpzxosHAQnren1eianqIGnXR2m6Fdau+MBmwl+vx99/d
         ZJWf9s1mCfv2jPIS6FzSIV1v85Rm03a7VYPx4tBRpdvag4EAAfjiLNm71ED70J8DCkI7
         OR4yKs4dplah2Al1ecTfSzV+cbpQ3axshkqLYjr1x1MWTVXzdfDNSoEf4TZwAessvSK0
         LrKi9oFVZlRA4asSvW9r/O6+Ci7p5JA2lvZsBGnj7e+lgK3JGs6/GQj+9Re1sYlrR135
         5A4A==
X-Gm-Message-State: AOJu0YwaitPVS7SPLrgWTUym4hTV38AB+Xj8VFGZhha1zvt3OvJuspfv
	D3mA14dt+848oSkFYr1m8+FeD2tI/Dv+z5oAl9dxivYdk3KF78fQfCjPjf2P/cpR8VAma6mGLpm
	XtZy+cyCZvzNQElvB/Lghkx0C2Atc2H5t
X-Google-Smtp-Source: AGHT+IF2ue9BCncKGcy/NnAHT0BOW7eQCSV5CrAM0XoaomsgVVFapcDjPXiAQ5SGZ++051nxxUHYyKSlcaEm3j9UmuU=
X-Received: by 2002:a17:90a:cf15:b0:2bd:9032:5934 with SMTP id
 98e67ed59e1d1-2c1dc5da107mr1653624a91.49.1717164400659; Fri, 31 May 2024
 07:06:40 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 31 May 2024 16:06:28 +0200
Message-ID: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
Subject: RFC: CVE check standalone (introducing yocto-vex-check)
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000001f54ed0619c07ee3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 14:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200079

--0000000000001f54ed0619c07ee3
Content-Type: text/plain; charset="UTF-8"

Hello,
We have been working on the standalone version of the cve-check that can
run over an SBOM (SPDX+VEX-like information) since April. This is the
moment for the RFC. This way we can verify use cases, discuss what is
needed to add and do testing early! (and the curious people can start
running it too)

The tooling consists of a patchset over OE-core:
https://lists.openembedded.org/g/openembedded-core/message/200074
https://lists.openembedded.org/g/openembedded-core/message/200075
and a modification heeded for the CVE backend (the Kernel CNA uses "linux"
and not "linux_kernel")
https://lists.openembedded.org/g/openembedded-core/message/200076

The standalone tool RFC is here:
https://gitlab.com/syslinbit/public/yocto-vex-check This repo will migrate
to the YP infra, likely in a form of multiple ones (we also have
autobuilder changes, and will likely split binary data to a separate
repository).

The yocto-vex-check supports two databases today: NVD and CVE.

How to use the tool (from the README)

This tool allows to check SBOMs for vulnerabilities. You can take SBOM/VEX
of a Yocto Project build and generate a fresh vulnerability status. It uses
the SPDX archive as the list of packages to check, with the additional
information from the VEX class.

WARNING: this tool is under active development, file formats and options do
change regularly.
Functionalities:
 - reads YP SPDX 2.2 files and YP cve-check JSON files
 - converts SPDX/cve-check JSON to VEX (close to OpenVEX)
 - performs a check for vulnerabilities taking the VEX and using the
specified database
 - uses output of the "vex" class of OpenEmbedded-core

 How to use:
 1. Download the database to use:
 - for NVD, use cve-update-nvd2-native.py
 - for the CVE database, get the CVEv5 git repository: either the upsteam
one at https://github.com/CVEProject/cvelistV5 or the one with OE-related
fixes at https://github.com/mrybczyn/cvelistV5-overrides (recommended)

2. Enable the vex class in your YP-based distribution build by adding to
your local.conf:
INHERIT += "vex"

3. Build your image as usual and note the location of the CVE JSON file (in
the output of the build)

4. (Recommended for production builds) archive the CVE JSON file and the
SPDX archive

 5. Use the tool as described below at any moment to generate a fresh
vulnerability status

 6. (Optional) You can convert the output to text or CSV format using
scripts/cve-report.py

Descrition of tools:

The high-level wrapper performs the whole process of a given database. The
usage is as follows:

 ./wrap-yocto-vex-check.py -i <cve-check-JSON-file> -o <output_dir> -t
<temporary_dir> -b <build directory like tmp-glibc> -db <database path>
-db-type <database type>

where:
-i <cve-check-JSON-file> is the CVE JSON file as given in the output of the
build
-o <output_dir> is the output directory for the updated CVE file
-t <temporary_dir> is a temporary directory used during the scan
-b <build directory like tmp-glibc> is the build directory that contains
the SPDX archive
-db <database path> is the path to the database file (NVD) or downloaded
git repository (CVE)
-db-type <database type> is the database type: NVD or CVE

 Lower-level tools:

- cve-update-nvd2-native.py - allows to download the NVD database
- yocto-vex-check.py - step-by-step conversions; imports SPDX archive,
allows to convert SPDX+CVE JSON to VEX, runs the vulnerability check on the
given database

 Limitations:
- today the SPDX generation in YP works for images and SDK, not for the
world build
- the MITRE (CVE) database contains a number of difficult-to-parse entries;
especially before 2024.

We know there are some bugs (one related to the linux_kernel), the fix is
in progress.

Questions/comments/use-cases welcome!

Our questions for further steps:
1. We started with the assumption of SPDX as the package list to scan and
the CVE JSON data as the supplementary data needed for the scan. However,
SPDX archive isn't generated for world builds. We can 1) add the only
remaining information to the VEX (CVE-JSON) which is the CPE list and allow
to use the VEX file as source and 2) add the remaining archives to SPDX.

At the end we will likely want both, also because SPDX2.2 requires the
complete build, and that is long in case of world.

2. The tool currently supports either one backend (CVE, NVD), or the other.
Results are different. We can merge results by post-processing or add a
list of databases to use. In both cases, there is a difficulty to decide on
priority of conflicting scan results.

3. We'd like to have unit tests using binary data (static NVD database,
specially choosen CVE entries etc). It makes sense to keep them in a
separate repository because of the size.

4. It turned out to be complicated to find locate variables needed to pass
to the tool directly from bitbake. CVE check and SPDX are running at
different phases, and there would be a need for changes in task ordering
and possibly some inheritance. This is complicated and bug prone, so the
question is: what about using the tool separately from the build? We can
generate configuration files as the list of options increases

What do you think?

Regards,
Marta and Samantha

--0000000000001f54ed0619c07ee3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>We have been working on the standalo=
ne version of the cve-check that can run over an SBOM (SPDX+VEX-like inform=
ation) since April. This is the moment for the RFC. This way we can verify =
use cases, discuss what is needed to add and do testing early! (and the cur=
ious people can start running it too)</div><div><br></div><div>The tooling =
consists of a patchset over OE-core:</div><div><a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/200074">https://lists.openembedde=
d.org/g/openembedded-core/message/200074</a></div><div><a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/message/200075">https://lists.ope=
nembedded.org/g/openembedded-core/message/200075</a></div><div>and a modifi=
cation heeded for the CVE backend (the Kernel CNA uses &quot;linux&quot; an=
d not &quot;linux_kernel&quot;) <br></div><div><a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/200076">https://lists.openembedde=
d.org/g/openembedded-core/message/200076</a></div><div><br></div><div>The s=
tandalone tool RFC is here: <a href=3D"https://gitlab.com/syslinbit/public/=
yocto-vex-check">https://gitlab.com/syslinbit/public/yocto-vex-check</a> Th=
is repo will migrate to the YP infra, likely in a form of multiple ones (we=
 also have autobuilder changes, and will likely split binary data to a sepa=
rate repository).</div><div><br></div><div>The yocto-vex-check supports two=
 databases today: NVD and CVE.</div><div><br></div><div>How to use the tool=
 (from the README)<br></div><div><br></div><div>This tool <span class=3D"ng=
" style=3D"background:none!important">allows to check</span> SBOMs for vuln=
erabilities. You can take SBOM/VEX of a
Yocto Project build and generate a fresh vulnerability status.

It uses the SPDX archive as the list of packages to check, with the additio=
nal
information from the VEX class.</div><div><br></div><div>WARNING: this tool=
 is under active development, file formats and options do
change regularly.=C2=A0</div><div>Functionalities:</div><div>=C2=A0- reads =
YP SPDX 2.2 files and YP cve-check JSON files=C2=A0</div><div>=C2=A0- conve=
rts SPDX/cve-check JSON to VEX (close to OpenVEX)</div><div>=C2=A0- perform=
s a check for vulnerabilities taking the VEX and using the specified databa=
se</div><div>=C2=A0- uses output of the &quot;vex&quot; class of OpenEmbedd=
ed-core</div><div><br></div><div>=C2=A0How to use:</div><div>=C2=A01. Downl=
oad the database to use:</div><div>=C2=A0- for NVD, use cve-update-nvd2-nat=
ive.py</div><div>=C2=A0- for the CVE database, get the CVEv5 git repository=
: either the <span class=3D"ng" style=3D"background:none!important">upsteam=
</span> one at <a href=3D"https://github.com/CVEProject/cvelistV5">https://=
github.com/CVEProject/cvelistV5</a>
  or the one with OE-related fixes at <a href=3D"https://github.com/mrybczy=
n/cvelistV5-overrides">https://github.com/mrybczyn/cvelistV5-overrides</a> =
(recommended)=C2=A0</div><div><br></div><div>2. Enable the vex class in you=
r YP-based distribution build by adding to your local.conf:=C2=A0</div><div=
>INHERIT +=3D &quot;vex&quot;</div><div><br></div><div>3. Build your image =
as usual and note the location of the CVE JSON file (in the output
   of the build)=C2=A0</div><div><br></div><div>4. (Recommended for product=
ion builds) archive the CVE JSON file and the SPDX archive</div><div><br></=
div><div>=C2=A05. Use the tool as described below at any moment to generate=
 a fresh vulnerability status</div><div><br></div><div>=C2=A06. (Optional) =
You can convert the output to text or CSV format using scripts/cve-report.p=
y=C2=A0</div><div><br></div><div><span class=3D"ng" style=3D"background:non=
e!important">Descrition</span> of tools:=C2=A0</div><div><br></div><div>The=
 high-level wrapper performs the whole process of a given database. The usa=
ge is as follows:</div><div><br></div><div>=C2=A0./wrap-yocto-vex-check.py =
-i &lt;cve-check-JSON-file&gt; -o &lt;output_dir&gt; -t &lt;temporary_dir&g=
t; -b &lt;build directory like tmp-glibc&gt; -db &lt;database path&gt; -db-=
type &lt;database type&gt;=C2=A0</div><div><br></div><div>where:=C2=A0</div=
><div>-i &lt;cve-check-JSON-file&gt; is the CVE JSON file as given in the o=
utput of the build</div><div>-o &lt;output_dir&gt; is the output directory =
for the updated CVE file=C2=A0</div><div>-t &lt;temporary_dir&gt; is a temp=
orary directory used during the scan</div><div>-b &lt;build directory like =
tmp-glibc&gt; is the build directory that contains the SPDX archive</div><d=
iv>-db &lt;database path&gt; is the path to the database file (NVD) or down=
loaded git repository (CVE)=C2=A0</div><div>-db-type &lt;database type&gt; =
is the database type: NVD or CVE</div><div><br></div><div>=C2=A0Lower-level=
 tools:=C2=A0</div><div><br></div><div>- cve-update-nvd2-native.py - allows=
 to download the NVD database=C2=A0</div><div>- yocto-vex-check.py - step-b=
y-step conversions; imports SPDX archive, allows to convert SPDX+CVE JSON
  to VEX, runs the vulnerability check on the given database</div><div><br>=
</div><div>=C2=A0Limitations:=C2=A0</div><div>- today the SPDX generation i=
n YP works for images and SDK, not for the world build=C2=A0</div><div>- th=
e MITRE (CVE) database contains a number of difficult-to-parse entries; esp=
ecially before 2024. <br></div><div><br></div><div>We know there are some b=
ugs (one related to the linux_kernel), the fix is in progress.<br></div><di=
v><br></div><div>Questions/comments/use-cases welcome!</div><div><br></div>=
<div>Our questions for further steps:</div><div>1. We started with the assu=
mption of SPDX as the package list to scan and the CVE JSON data as the sup=
plementary data needed for the scan. However, SPDX archive isn&#39;t genera=
ted for world builds. We can 1) add the only remaining information to the V=
EX (CVE-JSON) which is the CPE list and <span class=3D"ng" style=3D"backgro=
und:none!important">allow to use</span> the VEX file as source and 2) add t=
he remaining archives to SPDX.</div><div><br></div><div>At the end we will =
likely want both, also because SPDX2.2 requires the complete build, and tha=
t is long in case of world.</div><div><br></div><div>2. The tool currently =
supports either one backend (CVE, NVD), or the other. Results are different=
. We can merge results by post-processing or add a list of databases to use=
. In both cases, there is a difficulty to decide <span class=3D"ng" style=
=3D"background:none!important">on priority</span> of conflicting scan resul=
ts.=C2=A0=C2=A0 <br></div><div><br></div><div>3. We&#39;d like to have unit=
 tests using binary data (static NVD database, specially <span class=3D"ng"=
 style=3D"background:none!important">choosen</span> CVE entries etc). It ma=
kes sense to keep them in a separate repository because of the size.</div><=
div><br></div><div>4. It turned out to be complicated <span class=3D"ng" st=
yle=3D"background:none!important">to find locate</span> variables needed to=
 pass to the tool directly from bitbake. CVE check and SPDX are running at =
different phases, and there would be a need for changes in task ordering an=
d possibly some inheritance. This is complicated and bug prone, so the ques=
tion is: what about using the tool separately from the build? We can genera=
te configuration files as the list of options increases</div><div><br></div=
><div>What do you think?</div><div><br></div><div>Regards,</div><div>Marta =
and Samantha<br></div><div><br></div></div>

--0000000000001f54ed0619c07ee3--

