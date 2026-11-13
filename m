Subject: Re: [PATCH v3] rust: add rust-analyzer to the SDK behind a PACKAGECONFIG
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.222.193)
X-Originating-Platform: Windows Chrome 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 22:19:59 -0800
References: <20261006111230.1478039-1-benhur.tessele@est.tech> <20261111154442.241009-1-benhur.tessele@est.tech>
In-Reply-To: <20261111154442.241009-1-benhur.tessele@est.tech>
Message-ID: <743327.1794550799903849632@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qan5PcBL5RxOgevRqenp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250140

--qan5PcBL5RxOgevRqenp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Benhur,

Thanks for v3. Tested on master with PACKAGECONFIG rust-analyzer enabled;
it works for me in a clean environment.

One issue I noticed, not from your patch but from the existing cargo
wrapper: on a host with rustup installed, rust-analyzer from the SDK
prefers the rustup cargo proxy (~/.cargo/bin/cargo) and sets
RUSTUP_TOOLCHAIN to the SDK sysroot.

The nativesdk cargo wrapper then exports LD_LIBRARY_PATH with the SDK
lib dirs, and the host-side rustc proxy that cargo runs for "rustc -vV"
gets the SDK's glibc 2.44 under the host loader:

rustc: symbol lookup error: .../lib/libc.so.6: undefined symbol:
__pointer_chk_guard, version GLIBC_PRIVATE

cargo metadata exits 101 and rust-analyzer falls back to a degraded mode.
Seen on Ubuntu 22.04 and 24.04 hosts; with an empty HOME (no rustup) it
works. So this is a pre-existing wrapper issue, your patch just makes it
reachable from rust-analyzer. I will report it separately.

Could you share your test setup, host distro/glibc and whether rustup
was present?

Thanks,
Sunil Dora

--qan5PcBL5RxOgevRqenp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Benhur,<br /><br />Thanks for v3. Tested on master with PACKAGECONF=
IG rust-analyzer enabled;<br />it works for me in a clean environment.<br /=
><br />One issue I noticed, not from your patch but from the existing cargo=
<br />wrapper: on a host with rustup installed, rust-analyzer from the SDK<=
br />prefers the rustup cargo proxy (~/.cargo/bin/cargo) and sets<br />RUST=
UP_TOOLCHAIN to the SDK sysroot.<br /><br />The nativesdk cargo wrapper the=
n exports LD_LIBRARY_PATH with the SDK<br />lib dirs, and the host-side rus=
tc proxy that cargo runs for "rustc -vV"<br />gets the SDK's glibc 2.44 und=
er the host loader:<br /><br /><span style=3D"background-color: #fbeeb8;">&=
nbsp; &nbsp; &nbsp; rustc: symbol lookup error: .../lib/libc.so.6: undefine=
d symbol:</span><br /><span style=3D"background-color: #fbeeb8;">&nbsp; &nb=
sp; &nbsp; __pointer_chk_guard, version GLIBC_PRIVATE</span><br /><br />car=
go metadata exits 101 and rust-analyzer falls back to a degraded mode.<br /=
>Seen on Ubuntu 22.04 and 24.04 hosts; with an empty HOME (no rustup) it<br=
 />works. So this is a pre-existing wrapper issue, your patch just makes it=
<br />reachable from rust-analyzer. I will report it separately.<br /><br /=
>Could you share your test setup, host distro/glibc and whether rustup<br /=
>was present?<br /><br />Thanks,<br />Sunil Dora</div>

--qan5PcBL5RxOgevRqenp--
