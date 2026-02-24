Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FBAF4BB7F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:08:06 +0000 (UTC)
Subject: Re: [PATCH V3] gdb: Upgrade 16.3 -> 17.1
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.216.76)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Feb 2026 11:07:59 -0800
References: <20260223115033.18066-1-sunilkumar.dora@windriver.com> <DGN3FKTFTU3F.11M037GAZMI07@bootlin.com>
In-Reply-To: <DGN3FKTFTU3F.11M037GAZMI07@bootlin.com>
Message-ID: <115433.1771960079432840727@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OsJMKX7qqikYGkb4YtMQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 19:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231902

--OsJMKX7qqikYGkb4YtMQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 03:14 PM, Mathieu Dubois-Briand wrote:

>=20
> Hi Sunil,
>=20
> Thanks for the new version.
>=20
> It looks like we still have a musl issue, but specifically while
> building for qemuarm64 machine:
>=20
> ERROR: gdb-17.1-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tmp/work/cortexa5=
7-poky-linux-musl/gdb/17.1/temp/run.do_compile.2065169'
> failed with exit code 1
> ...
> | In file included from
> ../../sources/gdb-17.1/gdbserver/linux-aarch64-low.cc:42:
> | ../../sources/gdb-17.1/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8:
> error: redefinition of 'struct user_gcs'
> | 35 | struct user_gcs
> | | ^~~~~~~~
> | In file included from
> ../../sources/gdb-17.1/gdbserver/linux-aarch64-low.cc:35:
> |
> /srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tmp/work/cortexa57=
-poky-linux-musl/gdb/17.1/recipe-sysroot/usr/include/asm/ptrace.h:329:8:
> note: previous definition of 'struct user_gcs'
> | 329 | struct user_gcs {
> | | ^~~~~~~~
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1970
>=20
> Can you have a look at it?

Hi Mathieu,

Thanks for the report.

I=E2=80=99ve checked the failure. It=E2=80=99s another musl-specific issue =
with the new AArch64 GCS support in GDB 17.1.
struct user_gcs is now provided by musl via <asm/ptrace.h> , while GDB stil=
l has its own fallback definition
in aarch64-gcs-linux.h , which causes the duplicate definition error.

GDB has guards around the fallback definition, but they don=E2=80=99t work =
correctly with musl=E2=80=99s header layout.
This does not happen with glibc due to different header inclusion behavior.

I=E2=80=99m working on a fix and will send an updated patch shortly.

Thanks,
Sunil

>=20
>=20
> Thanks,
> Mathieu

--OsJMKX7qqikYGkb4YtMQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Feb 24, 2026 at 03:14 PM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>Hi Sunil,<br /><br />Thanks for the new version.<br /><br />It =
looks like we still have a musl issue, but specifically while<br />building=
 for qemuarm64 machine:<br /><br />ERROR: gdb-17.1-r0 do_compile: Execution=
 of '/srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tmp/work/cortex=
a57-poky-linux-musl/gdb/17.1/temp/run.do_compile.2065169' failed with exit =
code 1<br />...<br />| In file included from ../../sources/gdb-17.1/gdbserv=
er/linux-aarch64-low.cc:42:<br />| ../../sources/gdb-17.1/gdbserver/../gdb/=
arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'<br =
/>| 35 | struct user_gcs<br />| | ^~~~~~~~<br />| In file included from ../=
../sources/gdb-17.1/gdbserver/linux-aarch64-low.cc:35:<br />| /srv/pokybuil=
d/yocto-worker/musl-qemuarm64/build/build/tmp/work/cortexa57-poky-linux-mus=
l/gdb/17.1/recipe-sysroot/usr/include/asm/ptrace.h:329:8: note: previous de=
finition of 'struct user_gcs'<br />| 329 | struct user_gcs {<br />| | ^~~~~=
~~~<br /><br /><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/b=
uilders/111/builds/1970" target=3D"_blank" rel=3D"noopener">https://autobui=
lder.yoctoproject.org/valkyrie/#/builders/111/builds/1970</a><br /><br />Ca=
n you have a look at it?</blockquote>
<div class=3D"flex flex-col text-sm pb-25">
<article class=3D"text-token-text-primary w-full focus:outline-none [--shad=
ow-height:45px] has-data-writing-block:pointer-events-none has-data-writing=
-block:-mt-(--shadow-height) has-data-writing-block:pt-(--shadow-height) [&=
amp;:has([data-writing-block])&gt;*]:pointer-events-auto scroll-mt-[calc(va=
r(--header-height)+min(200px,max(70px,20svh)))]" dir=3D"auto" tabindex=3D"-=
1" data-turn-id=3D"request-WEB:a89728b6-5e86-46ed-bac7-e90ff8a404fd-7" data=
-testid=3D"conversation-turn-16" data-scroll-anchor=3D"true" data-turn=3D"a=
ssistant">
<div class=3D"text-base my-auto mx-auto pb-10 [--thread-content-margin:--sp=
acing(4)] @w-sm/main:[--thread-content-margin:--spacing(6)] @w-lg/main:[--t=
hread-content-margin:--spacing(16)] px-(--thread-content-margin)">
<div class=3D"[--thread-content-max-width:40rem] @w-lg/main:[--thread-conte=
nt-max-width:48rem] mx-auto max-w-(--thread-content-max-width) flex-1 group=
/turn-messages focus-visible:outline-hidden relative flex w-full min-w-0 fl=
ex-col agent-turn" tabindex=3D"-1">
<div class=3D"flex max-w-full flex-col grow">
<div class=3D"min-h-8 text-message relative flex w-full flex-col items-end =
gap-2 text-start break-words whitespace-normal [.text-message+&amp;]:mt-1" =
dir=3D"auto" data-message-author-role=3D"assistant" data-message-id=3D"7347=
8a2b-cb08-46e2-ad41-1a59a2e762b1" data-message-model-slug=3D"gpt-5-2">
<div class=3D"flex w-full flex-col gap-1 empty:hidden first:pt-[1px]">
<div class=3D"markdown prose dark:prose-invert w-full wrap-break-word light=
 markdown-new-styling">
<div>Hi Mathieu,<br /><br /></div>
<div>Thanks for the report.<br /><br /></div>
<div>I&rsquo;ve checked the failure. It&rsquo;s another musl-specific issue=
 with the new AArch64 GCS support in GDB 17.1.</div>
<div><em>struct user_gcs</em> is now provided by musl via <em>&lt;asm/ptrac=
e.h&gt;</em>, while GDB still has its own fallback definition<br />in <em>a=
arch64-gcs-linux.h</em>, which causes the duplicate definition error.<br />=
<br /></div>
<div>GDB has guards around the fallback definition, but they don&rsquo;t wo=
rk correctly with musl&rsquo;s header layout.<br />This does not happen wit=
h glibc due to different header inclusion behavior.<br /><br /></div>
<div>I&rsquo;m working on a fix and will send an updated patch shortly.</di=
v>
<div>&nbsp;</div>
<div>Thanks,<br />Sunil</div>
</div>
</div>
</div>
</div>
</div>
</div>
</article>
</div>
<blockquote><br />Thanks,<br />Mathieu</blockquote>
</div>

--OsJMKX7qqikYGkb4YtMQ--

