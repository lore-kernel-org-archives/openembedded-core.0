Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E967FCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:41:27 +0000 (UTC)
Subject: Re: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
To: openembedded-core@lists.openembedded.org
From: kavinaya@qti.qualcomm.com
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.43)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 01:41:23 -0700
References: <bbe0c5a1368b36754e800576d8f93d1ca406ab86.camel@siemens.com>
In-Reply-To: <bbe0c5a1368b36754e800576d8f93d1ca406ab86.camel@siemens.com>
Message-ID: <19647.1758530483327855783@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sa9pfqG887tpA5iuW0S6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223813

--sa9pfqG887tpA5iuW0S6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 05:10 PM, Adrian Freihofer wrote:

>=20
> Hi Kavinaya
>=20
> Thank you for the patch. LGTM.
>=20
> But, there is a but. While I acknowledge the concept of 'improved
> flexibility for advanced use cases,' it's vital to consider a common
> pitfall. Many existing BSPs have unfortunately led to user frustration.
> This is predominantly due to vendors integrating considerable amounts
> of downstream code that, despite intentions, often proves incompatible
> with future Yocto updates.
>=20
> The direct consequence is that users face significant hurdles in
> updating their products, leading to either stagnation or high costs
> associated with fixing or circumventing these incompatibilities.
>=20
> This problem not only impacts users directly but also casts a shadow on
> the Yocto Project, which can be perceived as culpable. In reality, such
> extensions often bypass upstream maintainers entirely, lacking the
> critical upstream test coverage necessary for long-term stability.
>=20
> My recommendation, therefore, is to proactively prevent such
> frustration by officially supporting these 'advanced' use cases and
> ensuring they have dedicated test coverage. This approach is preferable
> to merely contributing API extensions that might enable all sorts of
> potentially unexpected and untested downstream implementations.
>=20
> Kind regards,
> Adrian

Hi Adrian,

This change proposes an enhancement to the kernel-FIT image generation proc=
ess within OpenEmbedded=E2=80=94specifically, the ability to optionally pro=
vide a manual.its file in place of the dynamically generated version from k=
ernel-fit-image.bbclass.

This request is motivated by practical challenges encountered in supporting=
 multiple SoC and board variants using a unified DTS file. The current dyna=
mic generation mechanism does not accommodate the level of specificity requ=
ired for our deployment scenarios. Below are the key reasons for this propo=
sal:

*1. Variant-Specific Compatibility Strings*
Our DTS files support multiple board variants, but the compatible string fo=
rmat required by our UEFI implementation is more granular than what dynamic=
 generation allows. The format we rely on is:
compatible =3D "qcom,<SoC>[-<soc_version>][-<foundry_id>]-<board>[/<subtype=
>][-<pmic>][-<board_version>]"
This structure enables precise identification of the appropriate DTB for ea=
ch board variant, which is critical for correct boot behavior.

*2. Overlay DTBO Integration*
As demonstrated in the upstream kernel Makefile for QCOM platforms (link), =
overlays are used to generate composite DTBs:

qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-rb3g=
en2-vision-mezzanine.dtbo =20
qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-=
rb3gen2-industrial-mezzanine.dtbo

In both cases, the base DTB remains the same, but the overlays differ. With=
out manual.its file support, we cannot assign unique compatible strings to =
these variants, which limits UEFI=E2=80=99s ability to distinguish between =
them.

*3. Scalability and Maintainability*
As the number of supported variants grows, maintaining compatibility and co=
nfiguration logic solely through dynamic generation becomes increasingly co=
mplex and error-prone. Manual.its files offer a scalable and maintainable a=
lternative.

Therefore, we suggest introducing a conditional override mechanism in kerne=
l-fit-image.bbclass that allows developers to supply a manual.its file when=
 needed. This approach preserves existing behavior while enabling advanced =
use cases.

We understand the importance of maintaining upstream compatibility and mini=
mizing user frustration. To that end, we propose this enhancement as an *op=
t-in mechanism* , with the intention of collaborating on upstream test cove=
rage and documentation to ensure long-term stability. We believe this strik=
es a balance between flexibility for advanced use cases and the robustness =
expected from the Yocto Project.

Thanks,

Kavinaya

--sa9pfqG887tpA5iuW0S6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Sep 21, 2025 at 05:10 PM, Adrian Freihofer wrote:</div>
<div>
<blockquote>Hi Kavinaya<br /><br />Thank you for the patch. LGTM.<br /><br =
/>But, there is a but. While I acknowledge the concept of 'improved<br />fl=
exibility for advanced use cases,' it's vital to consider a common<br />pit=
fall. Many existing BSPs have unfortunately led to user frustration.<br />T=
his is predominantly due to vendors integrating considerable amounts<br />o=
f downstream code that, despite intentions, often proves incompatible<br />=
with future Yocto updates.<br /><br />The direct consequence is that users =
face significant hurdles in<br />updating their products, leading to either=
 stagnation or high costs<br />associated with fixing or circumventing thes=
e incompatibilities.<br /><br />This problem not only impacts users directl=
y but also casts a shadow on<br />the Yocto Project, which can be perceived=
 as culpable. In reality, such<br />extensions often bypass upstream mainta=
iners entirely, lacking the<br />critical upstream test coverage necessary =
for long-term stability.<br /><br />My recommendation, therefore, is to pro=
actively prevent such<br />frustration by officially supporting these 'adva=
nced' use cases and<br />ensuring they have dedicated test coverage. This a=
pproach is preferable<br />to merely contributing API extensions that might=
 enable all sorts of<br />potentially unexpected and untested downstream im=
plementations.<br /><br />Kind regards,<br />Adrian</blockquote>
</div>
<div>Hi Adrian,</div>
<div>&nbsp;</div>
<div>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">This change propose=
s an enhancement to the kernel-FIT image generation process within OpenEmbe=
dded&mdash;specifically, the ability to optionally provide a manual<span>&n=
bsp;</span><code style=3D"font-family: source-code-pro, Menlo, Monaco, Cons=
olas, 'Courier New', monospace;">.its</code><span>&nbsp;</span>file in plac=
e of the dynamically generated version from<span>&nbsp;</span><code style=
=3D"font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New', m=
onospace;">kernel-fit-image.bbclass</code>.</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">This request is mot=
ivated by practical challenges encountered in supporting multiple SoC and b=
oard variants using a unified DTS file. The current dynamic generation mech=
anism does not accommodate the level of specificity required for our deploy=
ment scenarios. Below are the key reasons for this proposal:</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;"><strong style=3D"fo=
nt-weight: 600;">1. Variant-Specific Compatibility Strings</strong><br />Ou=
r DTS files support multiple board variants, but the compatible string form=
at required by our UEFI implementation is more granular than what dynamic g=
eneration allows. The format we rely on is:<br /><code style=3D"font-family=
: source-code-pro, Menlo, Monaco, Consolas, 'Courier New', monospace;">comp=
atible =3D "qcom,&lt;SoC&gt;[-&lt;soc_version&gt;][-&lt;foundry_id&gt;]-&lt=
;board&gt;[/&lt;subtype&gt;][-&lt;pmic&gt;][-&lt;board_version&gt;]"</code>=
<br />This structure enables precise identification of the appropriate DTB =
for each board variant, which is critical for correct boot behavior.</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;"><strong style=3D"fo=
nt-weight: 600;">2. Overlay DTBO Integration</strong><br />As demonstrated =
in the upstream kernel Makefile for QCOM platforms (link), overlays are use=
d to generate composite DTBs:</p>
<pre style=3D"border-radius: 4px; padding: 23px 24px; margin: 17px 0px 23px=
; font-size: 15px; overflow-x: hidden; white-space: pre-wrap; overflow-wrap=
: break-word; color: #424242; font-style: normal; font-variant-ligatures: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wid=
ows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color=
: #fafafa; text-decoration-thickness: initial; text-decoration-style: initi=
al; text-decoration-color: initial; border: 1px solid #d1d1d1;"><code style=
=3D"font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New', m=
onospace;">qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb q=
cs6490-rb3gen2-vision-mezzanine.dtbo =20
qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-=
rb3gen2-industrial-mezzanine.dtbo
</code></pre>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">In both cases, the =
base DTB remains the same, but the overlays differ. Without manual<span>&nb=
sp;</span><code style=3D"font-family: source-code-pro, Menlo, Monaco, Conso=
las, 'Courier New', monospace;">.its</code><span>&nbsp;</span>file support,=
 we cannot assign unique compatible strings to these variants, which limits=
 UEFI&rsquo;s ability to distinguish between them.</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;"><strong style=3D"fo=
nt-weight: 600;">3. Scalability and Maintainability</strong><br />As the nu=
mber of supported variants grows, maintaining compatibility and configurati=
on logic solely through dynamic generation becomes increasingly complex and=
 error-prone. Manual<span>&nbsp;</span><code style=3D"font-family: source-c=
ode-pro, Menlo, Monaco, Consolas, 'Courier New', monospace;">.its</code><sp=
an>&nbsp;</span>files offer a scalable and maintainable alternative.</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">Therefore, we sugge=
st introducing a conditional override mechanism in<span>&nbsp;</span><code =
style=3D"font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier Ne=
w', monospace;">kernel-fit-image.bbclass</code><span>&nbsp;</span>that allo=
ws developers to supply a manual<span>&nbsp;</span><code style=3D"font-fami=
ly: source-code-pro, Menlo, Monaco, Consolas, 'Courier New', monospace;">.i=
ts</code><span>&nbsp;</span>file when needed. This approach preserves exist=
ing behavior while enabling advanced use cases.</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">We understand the i=
mportance of maintaining upstream compatibility and minimizing user frustra=
tion. To that end, we propose this enhancement as an<span>&nbsp;</span><str=
ong style=3D"font-weight: 600;">opt-in mechanism</strong>, with the intenti=
on of collaborating on upstream test coverage and documentation to ensure l=
ong-term stability. We believe this strikes a balance between flexibility f=
or advanced use cases and the robustness expected from the Yocto Project.&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">Thanks,</p>
<p style=3D"display: block; font-weight: 400; margin: 8px 0px 4px; overflow=
-wrap: break-word; color: #424242; font-family: 'Segoe Sans', 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #fafafa; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">Kavinaya</p>
</div>

--sa9pfqG887tpA5iuW0S6--

