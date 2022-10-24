Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0294BECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:10:21 +0000 (UTC)
Subject: rust: conflicts between Yocto and CC-RS compiler parameters
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Mac Firefox 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Oct 2022 10:10:19 -0700
Message-ID: <Byab.1666631419068358312.NzkU@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pM3jSviEISvmkeHNhAzH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 17:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172113

--pM3jSviEISvmkeHNhAzH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

After this change (using RUST_HOST_SYS instead of HOST_SYS): https://github=
.com/yoctoproject/poky/commit/5c45b73c8fa445b5192bb9fac1bc80b038b44c0d buil=
ds of parsec-service recipe for qemuarm machine started to fail:
cc1: error: switch '-mcpu=3Dcortex-a15' conflicts with switch '-march=3Darm=
v7-a+fp' [-Werror]
Full log can be seen here:
https://gitlab.com/akuster/meta-security/-/jobs/3204450989#L2086

This is the cargo build command before the change:
cargo build -v --target arm-poky-linux-gnueabi =20
and this is after:
cargo build -v --target armv7-poky-linux-gnueabihf

The problem is that some Rust crates build dependency C libraries using "cc=
-rs" crate.
This crate adds some compiler parameters depending on target =E2=80=9Carch=
=E2=80=9D and for =E2=80=9Carmv7" these parameters conflicts with compiler =
parameter defined by Yocto via TUNE_CCARGS:
https://github.com/rust-lang/cc-rs/blob/53fb72c87e5769a299f1886ead831901b9c=
775d6/src/lib.rs#L1700 We noticed it with qemuarm, but there might be other=
 conflicts as well. (If -Werror is used then builds would fail, otherwise i=
t would be just a warning which is easy to miss)

To fix the issue in our recipe we can define =E2=80=9CCRATE_CC_NO_DEFAULTS=
=E2=80=9D env variable which disables adding compiler flags in "cc-rs":
https://github.com/rust-lang/cc-rs#external-configuration-via-environment-v=
ariables
So, my questions is: shouldn=E2=80=99t =E2=80=9CCRATE_CC_NO_DEFAULTS=E2=80=
=9D be defined in the Rust bbclass instead of expecting that owners of all =
Rust apps recipes would be aware about this issue for some machines and wou=
ld add workarounds in their recipes?
I've tried to add "CRATE_CC_NO_DEFAULTS" into rust-target-config.bbclass , =
but it breaks building rust-native. Looks like we don=E2=80=99t define all =
the required parameters for native builds and rely (maybe not even intentio=
nally) on parameters defined by cc-rs crate. Therefore to do it properly th=
ere should be some logic around defining of "CRATE_CC_NO_DEFAULTS" in rust-=
target-config.bbclass. I would be happy to hear ideas or recommendations.

Cheers,
Anton

--pM3jSviEISvmkeHNhAzH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">Hi all,</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp;</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp;After this change (using RUST_HOST_SYS instead of HOST_SYS):<sp=
an>&nbsp;</span><a class=3D"c-link" style=3D"box-sizing: inherit; color: rg=
ba(var(--sk_highlight,18,100,163),1); text-decoration: none;" tabindex=3D"-=
1" href=3D"https://github.com/yoctoproject/poky/commit/5c45b73c8fa445b5192b=
b9fac1bc80b038b44c0d" target=3D"_blank" rel=3D"noopener noreferrer" data-st=
ringify-link=3D"https://github.com/yoctoproject/poky/commit/5c45b73c8fa445b=
5192bb9fac1bc80b038b44c0d" data-sk=3D"tooltip_parent" data-remove-tab-index=
=3D"true">https://github.com/yoctoproject/poky/commit/5c45b73c8fa445b5192bb=
9fac1bc80b038b44c0d</a>&nbsp; builds of parsec-service recipe for qemuarm m=
achine started to fail:</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">
<pre class=3D"c-mrkdwn__pre" style=3D"box-sizing: inherit; margin: 4px 0px;=
 padding: 8px; --saf-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overf=
low-wrap: break-word; font-size: 12px; font-variant-ligatures: none; line-h=
eight: 1.50001; tab-size: 4; white-space: pre-wrap; word-break: normal; fon=
t-family: Monaco, Menlo, Consolas, 'Courier New', monospace !important; bac=
kground: rgba(var(--sk_foreground_min,29,28,29),0.04); border: 1px solid va=
r(--saf-0); border-radius: 4px; counter-reset: list-0 0 list-1 0 list-2 0 l=
ist-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: #1d1c=
1d; font-style: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" data-stringify-type=3D"pre">cc1: error: switch '-=
mcpu=3Dcortex-a15' conflicts with switch '-march=3Darmv7-a+fp' [-Werror]</p=
re>
</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">Full log can be seen here:</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">https://gitlab.com/akuster/meta-security/-/jobs/3204450989#L2086</div=
>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;"><br style=3D"box-sizing: inherit;" />&nbsp;&nbsp;This is the cargo bu=
ild command before the change:</div>
<pre class=3D"c-mrkdwn__pre" style=3D"box-sizing: inherit; margin: 4px 0px;=
 padding: 8px; --saf-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overf=
low-wrap: break-word; font-size: 12px; font-variant-ligatures: none; line-h=
eight: 1.50001; tab-size: 4; white-space: pre-wrap; word-break: normal; fon=
t-family: Monaco, Menlo, Consolas, 'Courier New', monospace !important; bac=
kground: rgba(var(--sk_foreground_min,29,28,29),0.04); border: 1px solid va=
r(--saf-0); border-radius: 4px; counter-reset: list-0 0 list-1 0 list-2 0 l=
ist-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: #1d1c=
1d; font-style: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" data-stringify-type=3D"pre">cargo build -v --targ=
et arm-poky-linux-gnueabi  </pre>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp;&nbsp;and this is after:</div>
<pre class=3D"c-mrkdwn__pre" style=3D"box-sizing: inherit; margin: 4px 0px;=
 padding: 8px; --saf-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overf=
low-wrap: break-word; font-size: 12px; font-variant-ligatures: none; line-h=
eight: 1.50001; tab-size: 4; white-space: pre-wrap; word-break: normal; fon=
t-family: Monaco, Menlo, Consolas, 'Courier New', monospace !important; bac=
kground: rgba(var(--sk_foreground_min,29,28,29),0.04); border: 1px solid va=
r(--saf-0); border-radius: 4px; counter-reset: list-0 0 list-1 0 list-2 0 l=
ist-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: #1d1c=
1d; font-style: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" data-stringify-type=3D"pre">cargo build -v --targ=
et armv7-poky-linux-gnueabihf</pre>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;"><span aria-label=3D"" class=3D"c-mrkdwn__br" data-stringify-type=3D"p=
aragraph-break" style=3D"box-sizing: inherit; display: block; height: 8px;"=
></span>&nbsp;&nbsp;</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp; The problem is that some Rust crates build dependency C librar=
ies using "cc-rs" crate.<br />This crate adds some compiler parameters depe=
nding on target &ldquo;arch&rdquo; and for &ldquo;armv7" these parameters c=
onflicts with compiler parameter defined by Yocto via TUNE_CCARGS:<br /><a =
class=3D"c-link" style=3D"box-sizing: inherit; color: rgba(var(--sk_highlig=
ht,18,100,163),1); text-decoration: none;" tabindex=3D"-1" href=3D"https://=
github.com/rust-lang/cc-rs/blob/53fb72c87e5769a299f1886ead831901b9c775d6/sr=
c/lib.rs#L1700" target=3D"_blank" rel=3D"noopener noreferrer" data-stringif=
y-link=3D"https://github.com/rust-lang/cc-rs/blob/53fb72c87e5769a299f1886ea=
d831901b9c775d6/src/lib.rs#L1700" data-sk=3D"tooltip_parent" data-remove-ta=
b-index=3D"true">https://github.com/rust-lang/cc-rs/blob/53fb72c87e5769a299=
f1886ead831901b9c775d6/src/lib.rs#L1700</a><span aria-label=3D"" class=3D"c=
-mrkdwn__br" data-stringify-type=3D"paragraph-break" style=3D"box-sizing: i=
nherit; display: block; height: 8px;"></span>We noticed it with qemuarm, bu=
t there might be other conflicts as well. (If<span>&nbsp;</span><code class=
=3D"c-mrkdwn__code" style=3D"box-sizing: inherit; background-color: rgba(va=
r(--sk_foreground_min,29,28,29),0.04); border: 1px solid var(--saf-0); bord=
er-radius: 3px; color: rgba(var(--sk_raspberry_red,224,30,90),1); padding: =
2px 3px 1px; --saf-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overflo=
w-wrap: break-word; font-size: 12px; font-variant-ligatures: none; line-hei=
ght: 1.50001; tab-size: 4; white-space: pre-wrap; word-break: normal; font-=
family: Monaco, Menlo, Consolas, 'Courier New', monospace !important;" data=
-stringify-type=3D"code">-Werror</code><span>&nbsp;</span>is used then buil=
ds would fail, otherwise it would be just a warning which is easy to miss)<=
br /><span aria-label=3D"" class=3D"c-mrkdwn__br" data-stringify-type=3D"pa=
ragraph-break" style=3D"box-sizing: inherit; display: block; height: 8px;">=
</span></div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;"><br />&nbsp;&nbsp;To fix the issue in our recipe we can define &ldquo=
;CRATE_CC_NO_DEFAULTS&rdquo; env variable which disables adding compiler fl=
ags in "cc-rs":<span>&nbsp;</span></div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;"><a class=3D"c-link" style=3D"box-sizing: inherit; color: rgba(var(--s=
k_highlight,18,100,163),1); text-decoration: none;" tabindex=3D"-1" href=3D=
"https://github.com/rust-lang/cc-rs#external-configuration-via-environment-=
variables" target=3D"_blank" rel=3D"noopener noreferrer" data-stringify-lin=
k=3D"https://github.com/rust-lang/cc-rs#external-configuration-via-environm=
ent-variables" data-sk=3D"tooltip_parent" data-remove-tab-index=3D"true">ht=
tps://github.com/rust-lang/cc-rs#external-configuration-via-environment-var=
iables</a><span aria-label=3D"" class=3D"c-mrkdwn__br" data-stringify-type=
=3D"paragraph-break" style=3D"box-sizing: inherit; display: block; height: =
8px;"></span><br />&nbsp; So, my questions is: shouldn&rsquo;t &ldquo;CRATE=
_CC_NO_DEFAULTS&rdquo; be defined in the Rust bbclass instead of expecting =
that owners of all Rust apps recipes would be aware about this issue for so=
me machines and would add workarounds in their recipes?</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp;&nbsp; I've tried to add "CRATE_CC_NO_DEFAULTS" into <code clas=
s=3D"c-mrkdwn__code" style=3D"box-sizing: inherit; background-color: rgba(v=
ar(--sk_foreground_min,29,28,29),0.04); border: 1px solid var(--saf-0); bor=
der-radius: 3px; color: rgba(var(--sk_raspberry_red,224,30,90),1); padding:=
 2px 3px 1px; --saf-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overfl=
ow-wrap: break-word; font-size: 12px; font-variant-ligatures: none; line-he=
ight: 1.50001; tab-size: 4; white-space: pre-wrap; word-break: normal; font=
-family: Monaco, Menlo, Consolas, 'Courier New', monospace !important; font=
-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style: initial; text-decoration=
-color: initial;" data-stringify-type=3D"code">rust-target-config.bbclass</=
code>, but it <span style=3D"color: #1d1c1d; font-family: Slack-Lato, Slack=
-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; fon=
t-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent:=
 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; background-color: #f8f8f8; text-decorat=
ion-thickness: initial; text-decoration-style: initial; text-decoration-col=
or: initial; display: inline !important; float: none;">breaks building rust=
-native. Looks like we don&rsquo;t define all the required parameters for n=
ative builds and rely (maybe not even intentionally) on parameters defined =
by cc-rs crate. Therefore to do it properly there should be some logic arou=
nd defining of </span>"CRATE_CC_NO_DEFAULTS" in <code class=3D"c-mrkdwn__co=
de" style=3D"box-sizing: inherit; background-color: rgba(var(--sk_foregroun=
d_min,29,28,29),0.04); border: 1px solid var(--saf-0); border-radius: 3px; =
color: rgba(var(--sk_raspberry_red,224,30,90),1); padding: 2px 3px 1px; --s=
af-0: rgba(var(--sk_foreground_low,29,28,29),0.13); overflow-wrap: break-wo=
rd; font-size: 12px; font-variant-ligatures: none; line-height: 1.50001; ta=
b-size: 4; white-space: pre-wrap; word-break: normal; font-family: Monaco, =
Menlo, Consolas, 'Courier New', monospace !important; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial;"=
 data-stringify-type=3D"code">rust-target-config.bbclass</code>. I would be=
 happy to hear ideas or recommendations.</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">&nbsp;</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">Cheers,</div>
<div class=3D"p-rich_text_section" style=3D"box-sizing: inherit; counter-re=
set: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 =
0 list-8 0 list-9 0; color: #1d1c1d; font-family: Slack-Lato, Slack-Fractio=
ns, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; te=
xt-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: #f8f8f8; text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: init=
ial;">Anton</div>

--pM3jSviEISvmkeHNhAzH--

