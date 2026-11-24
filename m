Subject: Re: [wrynose][PATCH 3/3] expat: fix CVE-2026-118370
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 09:17:25 -0800
References: <20261105091719.1622520-1-dkelaiya@cisco.com> <20261105091719.1622520-3-dkelaiya@cisco.com> <DN2K9NVN0739.1ZT0ITGNS0QQG@smile.fr> <26a1abae-94e5-4a17-ae9b-127a4ad0b924@bootlin.com> <DN2M45VC2WEV.2SB302BX0OSBO@smile.fr>
In-Reply-To: <DN2M45VC2WEV.2SB302BX0OSBO@smile.fr>
Message-ID: <1226682.1795540645373229347@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1j9vSYXMsXeHrnJhmJeb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251051

--1j9vSYXMsXeHrnJhmJeb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Joao,

Thanks for the clarification. I've sent a v2 with the _p3 patch dropped:

https://lists.openembedded.org/g/openembedded-core/message/251050

Regards,
Darsh

On Mon, Nov 23, 2026 at 06:38 PM, Yoann Congal wrote:

>=20
> On Mon Nov 23, 2026 at 1:48 PM CET, Joao Marcos Costa wrote:
>=20
>> Hello, all
>>=20
>> On 11/23/26 12:41 PM, Yoann Congal wrote:
>>=20
>>> On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E
>>> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>>>=20
>>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>>=20
>>>> Backport the upstream prefix and attribute-index fixes [1,2]
>>>> identified by the release announcement [3]. Use size_t for storeAtts
>>>> bookkeeping and reject values that cannot be represented by the
>>>> existing public int attribute-count interfaces.
>>>>=20
>>>> Include the related tokenizer-count correction [4] so XmlGetAttributes
>>>> and getAtts do not overflow a signed count or narrow the available
>>>> attribute capacity before the storeAtts checks. This closes the same
>>>> large-attribute data path; it corrects a pre-existing issue rather tha=
n
>>>> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
>>>> PTRCALL annotations on the tokenizer callback and implementation.
>>>>=20
>>>> Validated with the full native unit suite, inline undefined-behavior
>>>> traps and an arithmetic boundary model. A multi-gigabyte attribute
>>>> payload and BitBake were not run.
>>>>=20
>>>> [1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86b=
c91d6ddb048481c04c
>>>>=20
>>>> [2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860=
f39501c7979f6750ae
>>>>=20
>>>> [3] https://www.openwall.com/lists/oss-security/2026/11/02/6
>>>> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2=
f46280d5982f50f2cf
>>>>=20
>>>>=20
>>>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>>>=20
>>>=20
>>=20
>> (...)
>>=20
>> While I'm not familiar with expat's sources, I get the point of
>> backporting this extra commit to make sure that getAtts and setAtts will
>> "agree" upon using the same size_t type.
>>=20
>> I don't see, however, any clear statements (e.g., from libexpat
>> maintainers, NVD, Debian's security tracker, Debian's bug tracker) that
>> this 3rd patch is directly related to PR#1450 or to CVE-2026-118370.
>>=20
>>=20
>>>=20
>>> Hello,
>>>=20
>>> If I'm not mistaken, this _p3 never was submitted for master &
>>> blacksail. Specifically, it was not part of Jo=C3=A3o's patch:
>>> https://patchwork.yoctoproject.org/project/oe-core/patch/20261118103042=
.1825679-2-joaomarcos.costa@bootlin.com/
>>>=20
>>> Note that I've taken this patch in my review branch.
>>>=20
>>> Please submit this _p3 for master/blacksail so I can take this one here=
.
>>>=20
>>> Jo=C3=A3o (CC'd), do we need this for blacksail?
>>>=20
>>> Thanks,
>>=20
>> @Yoan: as per my comment above, I'm not sure p3 is actually mandatory,
>> and the PR#1463 [1] introducing doesn't mention this CVE or PR#1450 in
>> any way. There's only a 'enhancement' tag (whatever that means), as
>> opposed to 'bug' and 'security' at PR#1450.
>>=20
>> To summarize my POV: not mandatory, but nice to have.
>>=20
>> That said, will we apply this same reasoning for all the other CVE fix
>> backports, or stick with the directly-related patches only?
>>=20
>> Please let me know in case that wasn't clear (or helpful!) enough.
>>=20
>> [1] https://github.com/libexpat/libexpat/pull/1463
>=20
> I don't think we want (or can) chase down every related fix like this.
> So, let's generaly stick to what is referenced by our trusted CVE info
> sources.
> That said, if we happen to stumble on a fix, I'm not against backporting
> it but the justification bar will be higher (like every non-CVE bugfix).
>=20
> In this case, I don't think :
>=20
>> Include the related tokenizer-count correction [4] so XmlGetAttributes
>> and getAtts do not overflow a signed count or narrow the available
>> attribute capacity before the storeAtts checks. This closes the same
>> large-attribute data path; it corrects a pre-existing issue rather than
>> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
>> PTRCALL annotations on the tokenizer callback and implementation.
>>=20
>> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f4=
6280d5982f50f2cf
>>=20
>=20
> ... is enough for that. For exemple, what kind of input triggers the
> issue? Why/how does the patch fixes it? Without CVE data to help, I
> have to rely on this info to judge a patch.
>=20
> One quick way to unlock this patch would be to resubmit it without this
> _p3 and , then, add this p3 separately if needed.
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--1j9vSYXMsXeHrnJhmJeb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann, Joao,<br /><br />Thanks for the clarification. I've sent a v=
2 with the _p3 patch dropped:<br /><br /><a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/251050" target=3D"_blank" rel=3D"noopen=
er">https://lists.openembedded.org/g/openembedded-core/message/251050</a>&n=
bsp;<br /><br />Regards,<br />Darsh<br /><br /></div>
<div>On Mon, Nov 23, 2026 at 06:38 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Mon Nov 23, 2026 at 1:48 PM CET, Joao Marcos Costa wrote:<br=
 />
<blockquote>Hello, all<br /><br />On 11/23/26 12:41 PM, Yoann Congal wrote:=
<br />
<blockquote>On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort the upstream prefix and attribute-index fixes [1,2]<br />identified by =
the release announcement [3]. Use size_t for storeAtts<br />bookkeeping and=
 reject values that cannot be represented by the<br />existing public int a=
ttribute-count interfaces.<br /><br />Include the related tokenizer-count c=
orrection [4] so XmlGetAttributes<br />and getAtts do not overflow a signed=
 count or narrow the available<br />attribute capacity before the storeAtts=
 checks. This closes the same<br />large-attribute data path; it corrects a=
 pre-existing issue rather than<br />a regression introduced by the first t=
wo fixes. Preserve Expat 2.8.3's<br />PTRCALL annotations on the tokenizer =
callback and implementation.<br /><br />Validated with the full native unit=
 suite, inline undefined-behavior<br />traps and an arithmetic boundary mod=
el. A multi-gigabyte attribute<br />payload and BitBake were not run.<br />=
<br />[1] <a href=3D"https://github.com/libexpat/libexpat/commit/621cb2c78b=
253ee023a86bc91d6ddb048481c04c" target=3D"_blank" rel=3D"noopener">https://=
github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc91d6ddb048481c04=
c</a><br />[2] <a href=3D"https://github.com/libexpat/libexpat/commit/1bac5=
3c4fc460a03cd9860f39501c7979f6750ae" target=3D"_blank" rel=3D"noopener">htt=
ps://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f39501c7979f=
6750ae</a><br />[3] <a href=3D"https://www.openwall.com/lists/oss-security/=
2026/11/02/6" target=3D"_blank" rel=3D"noopener">https://www.openwall.com/l=
ists/oss-security/2026/11/02/6</a><br />[4] <a href=3D"https://github.com/l=
ibexpat/libexpat/commit/c67cbc6185d1b494f521f2f46280d5982f50f2cf" target=3D=
"_blank" rel=3D"noopener">https://github.com/libexpat/libexpat/commit/c67cb=
c6185d1b494f521f2f46280d5982f50f2cf</a><br /><br />Signed-off-by: Darsh Kel=
aiya &lt;dkelaiya@cisco.com&gt;</blockquote>
</blockquote>
(...)<br /><br />While I'm not familiar with expat's sources, I get the poi=
nt of <br />backporting this extra commit to make sure that getAtts and set=
Atts will <br />"agree" upon using the same size_t type.<br /><br />I don't=
 see, however, any clear statements (e.g., from libexpat <br />maintainers,=
 NVD, Debian's security tracker, Debian's bug tracker) that <br />this 3rd =
patch is directly related to PR#1450 or to CVE-2026-118370.<br /><br />
<blockquote><br />Hello,<br /><br />If I'm not mistaken, this _p3 never was=
 submitted for master &amp;<br />blacksail. Specifically, it was not part o=
f Jo&atilde;o's patch:<br /><a href=3D"https://patchwork.yoctoproject.org/p=
roject/oe-core/patch/20261118103042.1825679-2-joaomarcos.costa@bootlin.com/=
" target=3D"_blank" rel=3D"noopener">https://patchwork.yoctoproject.org/pro=
ject/oe-core/patch/20261118103042.1825679-2-joaomarcos.costa@bootlin.com/</=
a><br />Note that I've taken this patch in my review branch.<br /><br />Ple=
ase submit this _p3 for master/blacksail so I can take this one here.<br />=
<br />Jo&atilde;o (CC'd), do we need this for blacksail?<br /><br />Thanks,=
</blockquote>
@Yoan: as per my comment above, I'm not sure p3 is actually mandatory, <br =
/>and the PR#1463 [1] introducing doesn't mention this CVE or PR#1450 in <b=
r />any way. There's only a 'enhancement' tag (whatever that means), as <br=
 />opposed to 'bug' and 'security' at PR#1450.<br /><br />To summarize my P=
OV: not mandatory, but nice to have.<br /><br />That said, will we apply th=
is same reasoning for all the other CVE fix <br />backports, or stick with =
the directly-related patches only?<br /><br />Please let me know in case th=
at wasn't clear (or helpful!) enough.<br /><br />[1] <a href=3D"https://git=
hub.com/libexpat/libexpat/pull/1463" target=3D"_blank" rel=3D"noopener">htt=
ps://github.com/libexpat/libexpat/pull/1463</a></blockquote>
I don't think we want (or can) chase down every related fix like this.<br /=
>So, let's generaly stick to what is referenced by our trusted CVE info<br =
/>sources.<br />That said, if we happen to stumble on a fix, I'm not agains=
t backporting<br />it but the justification bar will be higher (like every =
non-CVE bugfix).<br /><br />In this case, I don't think :<br />
<blockquote>Include the related tokenizer-count correction [4] so XmlGetAtt=
ributes<br />and getAtts do not overflow a signed count or narrow the avail=
able<br />attribute capacity before the storeAtts checks. This closes the s=
ame<br />large-attribute data path; it corrects a pre-existing issue rather=
 than<br />a regression introduced by the first two fixes. Preserve Expat 2=
.8.3's<br />PTRCALL annotations on the tokenizer callback and implementatio=
n.<br /><br />[4] <a href=3D"https://github.com/libexpat/libexpat/commit/c6=
7cbc6185d1b494f521f2f46280d5982f50f2cf" target=3D"_blank" rel=3D"noopener">=
https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f46280d59=
82f50f2cf</a></blockquote>
... is enough for that. For exemple, what kind of input triggers the<br />i=
ssue? Why/how does the patch fixes it? Without CVE data to help, I<br />hav=
e to rely on this info to judge a patch.<br /><br />One quick way to unlock=
 this patch would be to resubmit it without this<br />_p3 and , then, add t=
his p3 separately if needed.<br /><br />Regards,<br />-- <br />Yoann Congal=
<br />Smile ECS</blockquote>
</div>

--1j9vSYXMsXeHrnJhmJeb--
