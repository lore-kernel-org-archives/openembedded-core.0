Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02BACCF9F8
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 10:07:06 +0000 (UTC)
Subject: Re: Distro wide LTO broken?
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Firefox 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 06 Nov 2025 02:07:04 -0800
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com> <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com> <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com> <CAMKF1sqwuC=AGzEa7W+EtfZM4fKvdXv-BP7YYhvhX5RD68owJw@mail.gmail.com> <CAD_4BXi_7XRk9KGvwvfoea6_uZQ2bgtpqqP51ht1JU4nC6D1-Q@mail.gmail.com> <CAMKF1srtMC5ATe8Cm81aUFwZ5B+uazzx6RPvOggodB_BK1gfHQ@mail.gmail.com>
In-Reply-To: <CAMKF1srtMC5ATe8Cm81aUFwZ5B+uazzx6RPvOggodB_BK1gfHQ@mail.gmail.com>
Message-ID: <192740.1762423624433535076@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="vvlm44fmfLKaSXVtPmxv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 10:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225967

--vvlm44fmfLKaSXVtPmxv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 11:55 PM, Khem Raj wrote:

>=20
> On Tue, Sep 30, 2025 at 12:50=E2=80=AFAM William Kennington
> <william@wkennington.com> wrote:
>=20
>>=20
>> On Mon, Sep 29, 2025 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>=20
>>>=20
>>> On Mon, Sep 29, 2025 at 5:19=E2=80=AFPM William Kennington
>>> <william@wkennington.com> wrote:
>>>=20
>>>>=20
>>>> On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com>=
 wrote:
>>>>=20
>>>>>=20
>>>>> On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
>>>>> lists.openembedded.org
>>>>> <william=3Dwkennington.com@lists.openembedded.org> wrote:
>>>>>=20
>>>>>>=20
>>>>>> If I add the following to my distro, the build breaks for the openss=
l
>>>>>> and other core packages due to having build path impurities in the
>>>>>> static libraries created.
>>>>>>=20
>>>>>> ```
>>>>>> require conf/distro/include/lto.inc
>>>>>> DISTRO_FEATURES +=3D "lto"
>>>>>> ```
>>>>>>=20
>>>>>> The errors I get are all like
>>>>>> ```
>>>>>> ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
>>>>>> /usr/lib/libssl.a in package openssl-staticdev contains reference to
>>>>>> TMPDIR [buildpaths]
>>>>>> ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
>>>>>> /usr/lib/libcrypto.a in package openssl-staticdev contains reference
>>>>>> to TMPDIR [buildpaths]
>>>>>> ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, f=
ailing
>>>>>> task.
>>>>>> ERROR: Logfile of failure stored in:
>>>>>> /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-lin=
ux/openssl/3.5.2/temp/log.do_package_qa.118335
>>>>>>=20
>>>>>> ERROR: Task
>>>>>> (/srv/yocto/poky/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:=
do_package_qa)
>>>>>>=20
>>>>>> failed with exit code '1'
>>>>>> ```
>>>>>>=20
>>>>>> Probably there is just some kind of flag missing in the LTO build
>>>>>> options to filter out the build directory, as -ffile-prefix-map and
>>>>>> whatnot are already present in the builds. I haven't yet figured out
>>>>>> exactly what is contributing to this impurity.
>>>>>=20
>>>>> Inspect the .a files ( maybe using strings or binary viewing tools
>>>>> like xxd ), with LTO they are flat objects with additional informatio=
n
>>>>> for
>>>>> LTO to work and I think it will give more information.
>>>>=20
>>>> Yeah, I believe it's just a single remapping we are missing somewhere
>>>> that is allowing the extra string to be added into the binary. It's
>>>> been a while since I've worked on this kind of impurity stripping, so
>>>> it will probably take a bit to get used to the tooling again.
>>>> Hopefully I find the root cause and we can strip it out
>>>>=20
>>>> An example invocation looks like the following. All other object files
>>>> I looked at share the same impurity which ends up in the static
>>>> library later
>>>> ```
>>>> aarch64-oe-linux-gcc -mcpu=3Dcortex-a76.cortex-a55+crypto
>>>> -mbranch-protection=3Dstandard -fstack-protector-strong -O2
>>>> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secu=
rity
>>>> --sysroot=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-cry=
pto-oe-linux/openssl/3.5.2/recipe-sysroot
>>>>=20
>>>> -I. -Iinclude -Iapps/include -I../sources/openssl-3.5.2
>>>> -I../sources/openssl-3.5.2/include
>>>> -I../sources/openssl-3.5.2/apps/include -fPIC -pthread
>>>> -Wa,--noexecstack -O2 -g -flto -ffat-lto-objects -fuse-linker-plugin
>>>> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-corte=
xa55-crypto-oe-linux/openssl/3.5.2/s
>>>>=20
>>>> ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2
>>>> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-corte=
xa55-
>>>> crypto-oe-linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2
>>>> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-corte=
xa55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot=3D
>>>>=20
>>>> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-corte=
xa55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot-native=3D
>>>>=20
>>>> -pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC
>>>> -DOPENSSLDIR=3D"\"/usr/lib/ssl-3\""
>>>> -DENGINESDIR=3D"\"/usr/lib/engines-3\""
>>>> -DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL
>>>> -DNDEBUG -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o
>>>> apps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l
>>>> ib/app_x509.c
>>>> ```
>>>> and the partial strings dump with the impurity looks like
>>>> ```
>>>> vtmp
>>>> unsigned int
>>>> /usr/src/debug/openssl/3.5.2
>>>> ../sources/openssl-3.5.2/apps/lib/app_x509.c
>>>> /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux=
/openssl/3.5.2/build
>>>>=20
>>>> include/openssl
>>>> /usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0/include
>>>> ../sources/openssl-3.5.2/include/openssl
>>>> /usr/include
>>>> ../sources/openssl-3.5.2/apps/lib
>>>> ../sources/openssl-3.5.2/apps/include
>>>> app_x509.c
>>>> ```
>>>=20
>>> If you already know its coming from app_x509.c, then you have
>>> narrowed it down a step. Next, would be
>>=20
>> To be fair, it's basically every invocation of `gcc ... -c` that
>> produces it. I just picked an arbitrary file that was easy to find
>> that happens to carry the issue.
>>=20
>>=20
>>> to build just this file with -dD -E option and inspect if it contains
>>> any live string containing
>>> "/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux=
/openssl/3.5.2/build"
>>>=20
>>> if it does not find it. then perhaps build the assembly output with
>>> -fverbose-asm -S
>>> option and look for this string in the generated asm file.
>>=20
>> I ran this, and didn't see anything containing the path. I think it's
>> just a bug with the handling of `-ffile-prefix-map` because it looks
>> like the PWD being used is exactly listed
>>=20
>> Tried the latest snapshot of gcc 15 too just to see if they fixed
>> anything. Nothing in the git log looks relevant and it doesn't fix the
>> issue.
>>=20
>> Did some more digging and found out that if i remove
>> `-ffat-lto-objects` I don't have the issue anymore.
>> Seems like maybe this is related to
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805
>=20
> yeah seems to be the problem you are seeing as well. For tests try passin=
g
>=20
>=20
> LDFLAGS +=3D "${DEBUG_PREFIX_MAP}"
>=20
> and see if it helps.
>=20
>>=20
>>=20
>>>=20
>>>=20
>>>>=20
>>>>>=20
>>>>>=20
>>>>>> Prior to rebasing on the latest master, LTO was working fine globall=
y.
>>>>>=20
>>>>> what is the delta we are talking about here ?
>>>>=20
>>>> Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`
>>>> from early 2024. Doing any kind of bisection is probably pointless so
>>>> I just need to figure out this new impurity (or maybe just the check
>>>> got added since then)
>>>=20
>>> Yeah that will take too long to bisect so leave that aside.
>>>=20
>>>=20
>>>>=20
>>>>=20
>>>>>=20
>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>>=20
>>>>=20
>>>>=20
>>>=20
>>>=20
>>=20
>>=20
>=20
>=20

I'm wondering if `-ffat-lto-objects` is strictly necessary for LTO.

--vvlm44fmfLKaSXVtPmxv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Sep 30, 2025 at 11:55 PM, Khem Raj wrote:</div>
<div>
<blockquote>On Tue, Sep 30, 2025 at 12:50=E2=80=AFAM William Kennington<br =
/>&lt;william@wkennington.com&gt; wrote:<br />
<blockquote><br />On Mon, Sep 29, 2025 at 7:58=E2=80=AFPM Khem Raj &lt;raj.=
khem@gmail.com&gt; wrote:<br />
<blockquote><br />On Mon, Sep 29, 2025 at 5:19=E2=80=AFPM William Kenningto=
n<br />&lt;william@wkennington.com&gt; wrote:<br />
<blockquote><br />On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj &lt;raj=
.khem@gmail.com&gt; wrote:<br />
<blockquote><br />On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kenningto=
n via<br />lists.openembedded.org<br />&lt;william=3Dwkennington.com@lists.=
openembedded.org&gt; wrote:<br />
<blockquote><br />If I add the following to my distro, the build breaks for=
 the openssl<br />and other core packages due to having build path impuriti=
es in the<br />static libraries created.<br /><br />```<br />require conf/d=
istro/include/lto.inc<br />DISTRO_FEATURES +=3D "lto"<br />```<br /><br />T=
he errors I get are all like<br />```<br />ERROR: openssl-3.5.2-r0 do_packa=
ge_qa: QA Issue: File<br />/usr/lib/libssl.a in package openssl-staticdev c=
ontains reference to<br />TMPDIR [buildpaths]<br />ERROR: openssl-3.5.2-r0 =
do_package_qa: QA Issue: File<br />/usr/lib/libcrypto.a in package openssl-=
staticdev contains reference<br />to TMPDIR [buildpaths]<br />ERROR: openss=
l-3.5.2-r0 do_package_qa: Fatal QA errors were found, failing task.<br />ER=
ROR: Logfile of failure stored in:<br />/home/builder/yocto/build/tmp/work/=
cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/temp/log.do_package_qa.11=
8335<br />ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/op=
enssl_3.5.2.bb:do_package_qa)<br />failed with exit code '1'<br />```<br />=
<br />Probably there is just some kind of flag missing in the LTO build<br =
/>options to filter out the build directory, as -ffile-prefix-map and<br />=
whatnot are already present in the builds. I haven't yet figured out<br />e=
xactly what is contributing to this impurity.</blockquote>
Inspect the .a files ( maybe using strings or binary viewing tools<br />lik=
e xxd ), with LTO they are flat objects with additional information<br />fo=
r<br />LTO to work and I think it will give more information.</blockquote>
Yeah, I believe it's just a single remapping we are missing somewhere<br />=
that is allowing the extra string to be added into the binary. It's<br />be=
en a while since I've worked on this kind of impurity stripping, so<br />it=
 will probably take a bit to get used to the tooling again.<br />Hopefully =
I find the root cause and we can strip it out<br /><br />An example invocat=
ion looks like the following. All other object files<br />I looked at share=
 the same impurity which ends up in the static<br />library later<br />```<=
br />aarch64-oe-linux-gcc -mcpu=3Dcortex-a76.cortex-a55+crypto<br />-mbranc=
h-protection=3Dstandard -fstack-protector-strong -O2<br />-D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security<br />--sysroot=3D=
/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/open=
ssl/3.5.2/recipe-sysroot<br />-I. -Iinclude -Iapps/include -I../sources/ope=
nssl-3.5.2<br />-I../sources/openssl-3.5.2/include<br />-I../sources/openss=
l-3.5.2/apps/include -fPIC -pthread<br />-Wa,--noexecstack -O2 -g -flto -ff=
at-lto-objects -fuse-linker-plugin<br />-ffile-prefix-map=3D/home/builder/y=
octo/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/s<br =
/>ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2<br />-ffile-prefix-ma=
p=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-<br />crypto-oe-=
linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2<br />-ffile-prefix=
-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-lin=
ux/openssl/3.5.2/recipe-sysroot=3D<br />-ffile-prefix-map=3D/home/builder/y=
octo/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/recip=
e-sysroot-native=3D<br />-pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC<br />-D=
OPENSSLDIR=3D"\"/usr/lib/ssl-3\""<br />-DENGINESDIR=3D"\"/usr/lib/engines-3=
\""<br />-DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPEN=
SSL<br />-DNDEBUG -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o<br />a=
pps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l<br />ib/app_=
x509.c<br />```<br />and the partial strings dump with the impurity looks l=
ike<br />```<br />vtmp<br />unsigned int<br />/usr/src/debug/openssl/3.5.2<=
br />../sources/openssl-3.5.2/apps/lib/app_x509.c<br />/home/builder/yocto/=
build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/build<br /=
>include/openssl<br />/usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0=
/include<br />../sources/openssl-3.5.2/include/openssl<br />/usr/include<br=
 />../sources/openssl-3.5.2/apps/lib<br />../sources/openssl-3.5.2/apps/inc=
lude<br />app_x509.c<br />```</blockquote>
If you already know its coming from app_x509.c, then you have<br />narrowed=
 it down a step. Next, would be</blockquote>
To be fair, it's basically every invocation of `gcc ... -c` that<br />produ=
ces it. I just picked an arbitrary file that was easy to find<br />that hap=
pens to carry the issue.<br /><br />
<blockquote>to build just this file with -dD -E option and inspect if it co=
ntains<br />any live string containing<br />"/home/builder/yocto/build/tmp/=
work/cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/build"<br />if it do=
es not find it. then perhaps build the assembly output with<br />-fverbose-=
asm -S<br />option and look for this string in the generated asm file.</blo=
ckquote>
I ran this, and didn't see anything containing the path. I think it's<br />=
just a bug with the handling of `-ffile-prefix-map` because it looks<br />l=
ike the PWD being used is exactly listed<br /><br />Tried the latest snapsh=
ot of gcc 15 too just to see if they fixed<br />anything. Nothing in the gi=
t log looks relevant and it doesn't fix the<br />issue.<br /><br />Did some=
 more digging and found out that if i remove<br />`-ffat-lto-objects` I don=
't have the issue anymore.<br />Seems like maybe this is related to<br /><a=
 href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805" target=3D"_=
blank" rel=3D"noopener">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D1098=
05</a></blockquote>
yeah seems to be the problem you are seeing as well. For tests try passing<=
br /><br />LDFLAGS +=3D "${DEBUG_PREFIX_MAP}"<br /><br />and see if it help=
s.<br />
<blockquote><br />
<blockquote><br />
<blockquote>
<blockquote><br />
<blockquote>Prior to rebasing on the latest master, LTO was working fine gl=
obally.</blockquote>
what is the delta we are talking about here ?</blockquote>
Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`<br />fro=
m early 2024. Doing any kind of bisection is probably pointless so<br />I j=
ust need to figure out this new impurity (or maybe just the check<br />got =
added since then)</blockquote>
Yeah that will take too long to bisect so leave that aside.<br /><br />
<blockquote><br />
<blockquote><br />
<blockquote><br /><br /></blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>I'm wondering if `-ffat-lto-objects` is strictly necessary for LTO.</d=
iv>

--vvlm44fmfLKaSXVtPmxv--

