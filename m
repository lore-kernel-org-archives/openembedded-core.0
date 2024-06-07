Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C454C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 16:22:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.46455.1717777324163308338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 09:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hZUdxsLz;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4a5344ec7so18061435ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717777323; x=1718382123; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uw6wKRaC9vGBGG8ZCjXimaFK96Y12ArnMylAywL77dI=;
        b=hZUdxsLzRkZ+oJO6NPT+T7YD1pmNp/Sg81Pn+uVLTqkc18OBBsI2e2g+6g7jTqSc5T
         27RXRNTxj8cJqKsdZAEdAgN4B7BtiHQTytQ0VotYy19nhNyJXvsXucwdp2vVoEa3uNnK
         eUQCNN9iwDg/AW9DXq+8tlwNhWE8QxT5jcHPzn64ptRoxMeOLKCL91TGkgns7Tld3A7D
         kMZPMDA//GIJ66EBf6vZcFY/CycR02m5RVcMaG2WITIQCPux7GcDnLf9U0FpsQ1CGBV2
         aEc5rgLh30TwID58dUe+oSG0p8rEhlmBPdx2boXaRH43oxBZsWk53mtq1p8HKbonvFfC
         2bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717777323; x=1718382123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw6wKRaC9vGBGG8ZCjXimaFK96Y12ArnMylAywL77dI=;
        b=SazXAZCrmDV+nNZDRp2lcRP5mmmA4GcyQP2Hd8mp4EarRZPVg2o+aeV6mX0epaZ4w8
         2Jcav9qinHUFAVWB+JufI9FHxRWKoM9RvyfXw/piWhscgKr96kCvQo6jU5mXd0IzWgyL
         xJ0msCJp2vlS/9x1UOisGgDo2B1N1Mjr1dL94lsqXKR7wjoKXF7Gx8nr+9HjMgJEDoHx
         gEDCUSQJFvikPGLSDEZraAWSfRhrhp03XGZrLuBcLuPUPY2+Mue+Nx9cZIqIeP9smwO0
         eGDsVLVXSHAehS2UC0kd8MfeWAlGuWX3chLCoh9v8k5bLwbUr1Yudpck6pXkNl4EcnR8
         +1Fg==
X-Gm-Message-State: AOJu0Yw6I/rdMuKqxrZSRmnUuM9HQIpb3hpCOPjOZ0VArB6LFqt7W3d7
	hJ54iSzi+xunXcgWv5h2NDr+lB8QLaCZNTBOWmgSJtPqXlRZKQR1+UugCc0wfvuwBYrU2sfibxH
	xUrec25e/pBKqaTzIDrCxaeqSYPXj1Q==
X-Google-Smtp-Source: AGHT+IEsTEOSxiDXR+xDUbxtbflAiRHFf4OXoI8lzzD+PY6F0yc2KBi/+gbsmKSh5wrhKQCxInVwzcJOBK2rrWJUfyM=
X-Received: by 2002:a17:902:ec84:b0:1f4:af80:7a3a with SMTP id
 d9443c01a7336-1f6d019ef7amr45441715ad.25.1717777322415; Fri, 07 Jun 2024
 09:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
In-Reply-To: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 7 Jun 2024 18:21:50 +0200
Message-ID: <CAApg2=S9u89BWEEYLXY=f464v6yWPwQJLRMhBa26w5_5eR3_5w@mail.gmail.com>
Subject: Re: RFC: CVE check standalone (introducing yocto-vex-check)
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000001b22c6061a4f33a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 16:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200446

--0000000000001b22c6061a4f33a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 4:06=E2=80=AFPM Marta Rybczynska <rybczynska@gmail.=
com>
wrote:

> Hello,
> We have been working on the standalone version of the cve-check that can
> run over an SBOM (SPDX+VEX-like information) since April. This is the
> moment for the RFC. This way we can verify use cases, discuss what is
> needed to add and do testing early! (and the curious people can start
> running it too)
>
> The tooling consists of a patchset over OE-core:
> https://lists.openembedded.org/g/openembedded-core/message/200074
> https://lists.openembedded.org/g/openembedded-core/message/200075
> and a modification heeded for the CVE backend (the Kernel CNA uses "linux=
"
> and not "linux_kernel")
> https://lists.openembedded.org/g/openembedded-core/message/200076
>
> The standalone tool RFC is here:
> https://gitlab.com/syslinbit/public/yocto-vex-check This repo will
> migrate to the YP infra, likely in a form of multiple ones (we also have
> autobuilder changes, and will likely split binary data to a separate
> repository).
>
> The yocto-vex-check supports two databases today: NVD and CVE.
>
> How to use the tool (from the README)
>
> This tool allows to check SBOMs for vulnerabilities. You can take
> SBOM/VEX of a Yocto Project build and generate a fresh vulnerability
> status. It uses the SPDX archive as the list of packages to check, with t=
he
> additional information from the VEX class.
>
> WARNING: this tool is under active development, file formats and options
> do change regularly.
> Functionalities:
>  - reads YP SPDX 2.2 files and YP cve-check JSON files
>  - converts SPDX/cve-check JSON to VEX (close to OpenVEX)
>  - performs a check for vulnerabilities taking the VEX and using the
> specified database
>  - uses output of the "vex" class of OpenEmbedded-core
>
>  How to use:
>  1. Download the database to use:
>  - for NVD, use cve-update-nvd2-native.py
>  - for the CVE database, get the CVEv5 git repository: either the upsteam
> one at https://github.com/CVEProject/cvelistV5 or the one with OE-related
> fixes at https://github.com/mrybczyn/cvelistV5-overrides (recommended)
>
> 2. Enable the vex class in your YP-based distribution build by adding to
> your local.conf:
> INHERIT +=3D "vex"
>
> 3. Build your image as usual and note the location of the CVE JSON file
> (in the output of the build)
>
> 4. (Recommended for production builds) archive the CVE JSON file and the
> SPDX archive
>
>  5. Use the tool as described below at any moment to generate a fresh
> vulnerability status
>
>  6. (Optional) You can convert the output to text or CSV format using
> scripts/cve-report.py
>
> Descrition of tools:
>
> The high-level wrapper performs the whole process of a given database. Th=
e
> usage is as follows:
>
>  ./wrap-yocto-vex-check.py -i <cve-check-JSON-file> -o <output_dir> -t
> <temporary_dir> -b <build directory like tmp-glibc> -db <database path>
> -db-type <database type>
>
> where:
> -i <cve-check-JSON-file> is the CVE JSON file as given in the output of
> the build
> -o <output_dir> is the output directory for the updated CVE file
> -t <temporary_dir> is a temporary directory used during the scan
> -b <build directory like tmp-glibc> is the build directory that contains
> the SPDX archive
> -db <database path> is the path to the database file (NVD) or downloaded
> git repository (CVE)
> -db-type <database type> is the database type: NVD or CVE
>
>  Lower-level tools:
>
> - cve-update-nvd2-native.py - allows to download the NVD database
> - yocto-vex-check.py - step-by-step conversions; imports SPDX archive,
> allows to convert SPDX+CVE JSON to VEX, runs the vulnerability check on t=
he
> given database
>
>  Limitations:
> - today the SPDX generation in YP works for images and SDK, not for the
> world build
> - the MITRE (CVE) database contains a number of difficult-to-parse
> entries; especially before 2024.
>
> We know there are some bugs (one related to the linux_kernel), the fix is
> in progress.
>
> Questions/comments/use-cases welcome!
>
> Our questions for further steps:
> 1. We started with the assumption of SPDX as the package list to scan and
> the CVE JSON data as the supplementary data needed for the scan. However,
> SPDX archive isn't generated for world builds. We can 1) add the only
> remaining information to the VEX (CVE-JSON) which is the CPE list and all=
ow
> to use the VEX file as source and 2) add the remaining archives to SPDX.
>
> At the end we will likely want both, also because SPDX2.2 requires the
> complete build, and that is long in case of world.
>
> 2. The tool currently supports either one backend (CVE, NVD), or the
> other. Results are different. We can merge results by post-processing or
> add a list of databases to use. In both cases, there is a difficulty to
> decide on priority of conflicting scan results.
>
> 3. We'd like to have unit tests using binary data (static NVD database,
> specially choosen CVE entries etc). It makes sense to keep them in a
> separate repository because of the size.
>
> 4. It turned out to be complicated to find locate variables needed to
> pass to the tool directly from bitbake. CVE check and SPDX are running at
> different phases, and there would be a need for changes in task ordering
> and possibly some inheritance. This is complicated and bug prone, so the
> question is: what about using the tool separately from the build? We can
> generate configuration files as the list of options increases
>
> What do you think?
>


Hello all,
I will summarize the discussion during the last weekly call (unfortunatelly
nobody took notes!):
Richard would prefer to avoid adding new tasks and ideally keep the needed
data in a place where anyone can take it. He was thinking about sstate.

I've been thinking about it for the last few days and here is what my
results are:
1. The additional tasks are there to generate the data fast. We could do
that in do_fetch, but do_fetch causes downloads of everything. On a world
build, this is long. We can decide to drop the use-case of supporting a
fact check for world. I think that would be a pity, I have been using this
configuration quite a lot for checking complete layers. Waiting for a
"world" download of a 20-layer setup is time-consuming... Especially in a
CI that just does this check and has no other need for a shared DL_DIR.

Do, I would rather suggest adding a new, generic task run before do_fetch.
SPDX can start grabbing information at this stage too.

2. For a check of a given build configuration, we need a package list and
have it exported so that it can be used later. Obviously we can't use "all
that is in sstate", because it will contain different builds too.

3. How do we store the data in longer-term? Sstate is useful, but in my
experience I have never considered is as something that should be kept as a
part of a release. Instead, I have it on build machines, and prune/remove
if something looks fishy (I have had multiple issues with sharing sstate
between releases, so gave up)... Not sure how others handle it. From my
perspective, we need to export the data at the release time so that it can
be reused safely later. On the other hand, getting data from sstate
requires re-calculating hashes to make sure you get the right archive, and
that requires information from the build.

To re-generate data easily after-build, we would need to export it at the
build end. Pre-calculated data can be useful for various purposes, but we
need an export to a place to store the data (ideally a single file per
build).

What customers start requiring now is: upload the SBOM and VEX for
composition analysis, usually to their properitary platform.

What do you think?

Regards,
Marta

--0000000000001b22c6061a4f33a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 31, 2024 at 4:06=E2=80=AF=
PM Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div>We have been working on t=
he standalone version of the cve-check that can run over an SBOM (SPDX+VEX-=
like information) since April. This is the moment for the RFC. This way we =
can verify use cases, discuss what is needed to add and do testing early! (=
and the curious people can start running it too)</div><div><br></div><div>T=
he tooling consists of a patchset over OE-core:</div><div><a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/200074" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/200074</a></=
div><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/200075" target=3D"_blank">https://lists.openembedded.org/g/openembedded=
-core/message/200075</a></div><div>and a modification heeded for the CVE ba=
ckend (the Kernel CNA uses &quot;linux&quot; and not &quot;linux_kernel&quo=
t;) <br></div><div><a href=3D"https://lists.openembedded.org/g/openembedded=
-core/message/200076" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/200076</a></div><div><br></div><div>The standalone =
tool RFC is here: <a href=3D"https://gitlab.com/syslinbit/public/yocto-vex-=
check" target=3D"_blank">https://gitlab.com/syslinbit/public/yocto-vex-chec=
k</a> This repo will migrate to the YP infra, likely in a form of multiple =
ones (we also have autobuilder changes, and will likely split binary data t=
o a separate repository).</div><div><br></div><div>The yocto-vex-check supp=
orts two databases today: NVD and CVE.</div><div><br></div><div>How to use =
the tool (from the README)<br></div><div><br></div><div>This tool <span sty=
le=3D"background:none">allows to check</span> SBOMs for vulnerabilities. Yo=
u can take SBOM/VEX of a
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
: either the <span style=3D"background:none">upsteam</span> one at <a href=
=3D"https://github.com/CVEProject/cvelistV5" target=3D"_blank">https://gith=
ub.com/CVEProject/cvelistV5</a>
  or the one with OE-related fixes at <a href=3D"https://github.com/mrybczy=
n/cvelistV5-overrides" target=3D"_blank">https://github.com/mrybczyn/cvelis=
tV5-overrides</a> (recommended)=C2=A0</div><div><br></div><div>2. Enable th=
e vex class in your YP-based distribution build by adding to your local.con=
f:=C2=A0</div><div>INHERIT +=3D &quot;vex&quot;</div><div><br></div><div>3.=
 Build your image as usual and note the location of the CVE JSON file (in t=
he output
   of the build)=C2=A0</div><div><br></div><div>4. (Recommended for product=
ion builds) archive the CVE JSON file and the SPDX archive</div><div><br></=
div><div>=C2=A05. Use the tool as described below at any moment to generate=
 a fresh vulnerability status</div><div><br></div><div>=C2=A06. (Optional) =
You can convert the output to text or CSV format using scripts/cve-report.p=
y=C2=A0</div><div><br></div><div><span style=3D"background:none">Descrition=
</span> of tools:=C2=A0</div><div><br></div><div>The high-level wrapper per=
forms the whole process of a given database. The usage is as follows:</div>=
<div><br></div><div>=C2=A0./wrap-yocto-vex-check.py -i &lt;cve-check-JSON-f=
ile&gt; -o &lt;output_dir&gt; -t &lt;temporary_dir&gt; -b &lt;build directo=
ry like tmp-glibc&gt; -db &lt;database path&gt; -db-type &lt;database type&=
gt;=C2=A0</div><div><br></div><div>where:=C2=A0</div><div>-i &lt;cve-check-=
JSON-file&gt; is the CVE JSON file as given in the output of the build</div=
><div>-o &lt;output_dir&gt; is the output directory for the updated CVE fil=
e=C2=A0</div><div>-t &lt;temporary_dir&gt; is a temporary directory used du=
ring the scan</div><div>-b &lt;build directory like tmp-glibc&gt; is the bu=
ild directory that contains the SPDX archive</div><div>-db &lt;database pat=
h&gt; is the path to the database file (NVD) or downloaded git repository (=
CVE)=C2=A0</div><div>-db-type &lt;database type&gt; is the database type: N=
VD or CVE</div><div><br></div><div>=C2=A0Lower-level tools:=C2=A0</div><div=
><br></div><div>- cve-update-nvd2-native.py - allows to download the NVD da=
tabase=C2=A0</div><div>- yocto-vex-check.py - step-by-step conversions; imp=
orts SPDX archive, allows to convert SPDX+CVE JSON
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
EX (CVE-JSON) which is the CPE list and <span style=3D"background:none">all=
ow to use</span> the VEX file as source and 2) add the remaining archives t=
o SPDX.</div><div><br></div><div>At the end we will likely want both, also =
because SPDX2.2 requires the complete build, and that is long in case of wo=
rld.</div><div><br></div><div>2. The tool currently supports either one bac=
kend (CVE, NVD), or the other. Results are different. We can merge results =
by post-processing or add a list of databases to use. In both cases, there =
is a difficulty to decide <span style=3D"background:none">on priority</span=
> of conflicting scan results.=C2=A0=C2=A0 <br></div><div><br></div><div>3.=
 We&#39;d like to have unit tests using binary data (static NVD database, s=
pecially <span style=3D"background:none">choosen</span> CVE entries etc). I=
t makes sense to keep them in a separate repository because of the size.</d=
iv><div><br></div><div>4. It turned out to be complicated <span style=3D"ba=
ckground:none">to find locate</span> variables needed to pass to the tool d=
irectly from bitbake. CVE check and SPDX are running at different phases, a=
nd there would be a need for changes in task ordering and possibly some inh=
eritance. This is complicated and bug prone, so the question is: what about=
 using the tool separately from the build? We can generate configuration fi=
les as the list of options increases</div><div><br></div><div>What do you t=
hink?</div></div></blockquote><div><br></div><div><br></div><div>Hello all,=
</div><div>I will summarize the discussion during the last weekly call (<sp=
an class=3D"ng" style=3D"background:none!important">unfortunatelly</span> n=
obody took notes!):</div><div>Richard would prefer to avoid adding new task=
s and ideally keep the needed data in a place where anyone can take it. He =
was thinking about <span class=3D"ng" style=3D"background:none!important">s=
state</span>.</div><div><br></div><div>I&#39;ve been thinking about it for =
the last few days and here is what my results are:</div><div>1. The additio=
nal tasks are there to generate the data fast. We could do that in do_fetch=
, but do_fetch causes downloads of everything. On a world build, this is lo=
ng. We can decide to drop the use-case of supporting a fact check <span cla=
ss=3D"ng" style=3D"background:none!important">for world</span>. I think tha=
t would be a pity, I have been using this configuration quite a lot for che=
cking complete layers. Waiting for a &quot;world&quot; download of a 20-lay=
er setup is time-consuming... Especially in a CI that just does this check =
and has no other need for a shared DL_DIR.</div><div><br></div><div>Do, I w=
ould rather suggest adding a new, generic task run before do_fetch. SPDX ca=
n start grabbing information at this stage too.</div><div><br></div><div>2.=
 For a check of a given build configuration, we need a package list and hav=
e it exported so that it can be used later. Obviously we can&#39;t use &quo=
t;all that is in <span class=3D"ng" style=3D"background:none!important">sst=
ate</span>&quot;, because it will contain different builds too.</div><div><=
br></div><div>3. How do we store the data <span class=3D"ng" style=3D"backg=
round:none!important">in longer-term</span>? <span class=3D"ng" style=3D"ba=
ckground:none!important">Sstate</span> is useful, but in my experience I ha=
ve never considered <span class=3D"ng" style=3D"background:none!important">=
is as</span> something that should be kept as a part of a release. Instead,=
 I have it on build machines, and prune/remove if something looks fishy (I =
have had multiple issues with sharing <span class=3D"ng" style=3D"backgroun=
d:none!important">sstate</span> between releases, so gave up)... Not sure h=
ow others handle it. From my perspective, we need to export the data at the=
 release time so that it can be reused safely later. On the other hand, get=
ting data from <span class=3D"ng" style=3D"background:none!important">sstat=
e</span> requires re-calculating hashes to make sure you get the right arch=
ive, and that requires information from the build.</div><div><br></div><div=
>To re-generate data easily after-build, we would need to export it at the =
build end. Pre-calculated data can be useful for various purposes, but we n=
eed an export to a place to store the data (ideally a single file per build=
).<br></div><div><br></div><div>What customers start requiring now is: uplo=
ad the SBOM and VEX for composition analysis, usually to their <span class=
=3D"ng" style=3D"background:none!important">properitary</span> platform.</d=
iv><div><br></div><div>What do you think?</div><div><br></div><div>Regards,=
</div><div>Marta<br></div></div></div>

--0000000000001b22c6061a4f33a3--

