Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D04C25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 09:36:41 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 May 2024 02:36:34 -0700
References: <CANNYZj-uDz_gCpvkb5F9R6NkkQVGn768=mHXyvZJPHfKyZ-t2g@mail.gmail.com>
In-Reply-To: <CANNYZj-uDz_gCpvkb5F9R6NkkQVGn768=mHXyvZJPHfKyZ-t2g@mail.gmail.com>
Message-ID: <22166.1715765794274311096@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="p8TM0rV07Oeo5blRp3hS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 09:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199272

--p8TM0rV07Oeo5blRp3hS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I did some investigation on this topic,

- why is it not a hard error?

That is because find command in `buildhistory_list_pkg_files` is tested ins=
ide the loop for, hiding this issue and for loop is always returning 0 even=
 if `find` fails.

>=20
> .....
> buildhistory_list_pkg_files() {
> # Create individual files-in-package for each recipe's package
> pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
>=20
> for pkgdir in pkgdirlist; do
> .....
>=20

- why is it unable to find anything in packages-split/, if it executes afte=
r populate_packages which places things there?

As far as i could understand, there is some concurrency issue between packa=
ge.bbclass and buildhistory.bbclass. Taking in consideration that `buildhis=
tory_list_pkg_files` is triggered by checking if `BB_CURRENTTASK` is `packa=
ge` and at the same time `PACKAGESPLITFUNCS` is triggered on `do_package`, =
this leads to the issue with missing files since buildhistory bbclass might=
 be looking into something that wasnt yet created. In my findings, `buildhi=
story_list_pkg_files` should be called in the end of `do_package` execution=
 where `packages-split` directory is created and populated.

Is there any clear reason why we cant move `buildhistory_list_pkg_files` to=
 `packagedata` task since its the next task to be executed?

Any suggestion or any idea how can i, from buildhistory.bbclass, determine =
if `PACKAGESPLITFUNCS` was already executed?

Thank you

--p8TM0rV07Oeo5blRp3hS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br /><br />I did some investigation on this topic,<br /><span styl=
e=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica=
 Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #=
ffffff; text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
<br />- why is it not a hard error?<br /></span><br style=3D"box-sizing: bo=
rder-box; overflow-wrap: break-word !important; color: #333333; font-family=
: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation=
 Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI=
 Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: pre-wrap; background-color: #ffffff; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
" />That is because find command in `buildhistory_list_pkg_files` is tested=
 inside the loop for, hiding this issue and for loop is always returning 0 =
even if `find` fails.<br /><br /><br />
<blockquote>
<div>.....</div>
<div>buildhistory_list_pkg_files() {</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span># Create individual files-in-package for each recipe's package</sp=
an></div>
<div>&nbsp;pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)</div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>for pkgdir in pkgdirlist; do</span></div>
<div>.....</div>
</blockquote>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);"></span=
><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto,=
 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Appl=
e Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fo=
nt-size: 16px; font-style: normal; font-variant-ligatures: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; te=
xt-align: start; text-indent: 0px; text-transform: none; widows: 2; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgrou=
nd-color: #ffffff; text-decoration-thickness: initial; text-decoration-styl=
e: initial; text-decoration-color: initial; display: inline !important; flo=
at: none;">- why is it unable to find anything in packages-split/, if it ex=
ecutes <span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', R=
oboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif,=
 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoj=
i'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; ba=
ckground-color: #ffffff; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial; display: inline !importan=
t; float: none;">after populate_packages which places things there?<br /><b=
r /></span></span></div>
As far as i could understand, there is some concurrency issue between packa=
ge.bbclass and buildhistory.bbclass. Taking in consideration that `buildhis=
tory_list_pkg_files` is triggered by checking if `BB_CURRENTTASK` is `packa=
ge` and at the same time `PACKAGESPLITFUNCS` is triggered on `do_package`, =
this leads to the issue with missing files since buildhistory bbclass might=
 be looking into something that wasnt yet created. In my findings, `buildhi=
story_list_pkg_files` should be called in the end of `do_package` execution=
 where `packages-split` directory is created and populated.<br /><br />Is t=
here any clear reason why we cant move `buildhistory_list_pkg_files` to `pa=
ckagedata` task since its the next task to be executed?<br /><br />Any sugg=
estion or any idea how can i, from buildhistory.bbclass, determine if `PACK=
AGESPLITFUNCS` was already executed?<br /><br />Thank you

--p8TM0rV07Oeo5blRp3hS--

