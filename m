Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7425C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 11:31:27 +0000 (UTC)
Subject: Re: [PATCH V2] archiver: Configurable tarball compression
To: openembedded-core@lists.openembedded.org
From: "Martyn Welch" <martyn.welch@collabora.com>
X-Originating-Location: Crieff, Scotland, GB (86.153.39.205)
X-Originating-Platform: Linux Chrome 95
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Oct 2021 04:31:26 -0700
References: <a06209fe-c772-7a28-bde8-4627fef58296@bootlin.com>
In-Reply-To: <a06209fe-c772-7a28-bde8-4627fef58296@bootlin.com>
Message-ID: <31960.1635334286957262862@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="raLNUh6ovUQ1MGIhy5W0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 11:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157511

--raLNUh6ovUQ1MGIhy5W0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> So, here the claim that zstd (with default options) is almost as good as
> xz in compressed size is not confirmed. However, zstd is a clear winner
> in terms of compression speed, and anyway better than gzip. This is
> worth switching.
>=20

That claim doesn't seem to be confirmed with any of the (admittedly small) =
selection of archives I tried, with zstd compression being approx 21 to 69%=
 less efficient in terms of storage space than xz compression, but still be=
ing the best in terms of compression and decompression speeds.

However, I think neatly highlights why it may make sense to make this confi=
gurable, as which algorithm is "best" is going to depend on whether you're =
optimising for (de)compression speed or size.

Testing results below,

Martyn

---

$ time gzip -k linux-5.14.tar

real 0m26.807s
user 0m26.392s
sys 0m0.368s
$ time xz -k linux-5.14.tar

real 6m42.494s
user 6m40.167s
sys 0m1.757s
$ time zstd -k linux-5.14.tar
linux-5.14.tar=C2=A0 =C2=A0 =C2=A0 =C2=A0: 16.28%=C2=A0 =C2=A0(1126737920 =
=3D> 183398470 bytes, linux-5.14.tar.zst)

real 0m3.531s
user 0m3.631s
sys 0m0.509s
$ ls -la=C2=A0 *
-rw-r--r-- 1 martyn martyn 1126737920 Oct 27 10:54 linux-5.14.tar
-rw-r--r-- 1 martyn martyn=C2=A0 196107916 Oct 27 10:54 linux-5.14.tar.gz
-rw-r--r-- 1 martyn martyn=C2=A0 124724612 Oct 27 10:54 linux-5.14.tar.xz
-rw-r--r-- 1 martyn martyn=C2=A0 183398470 Oct 27 10:54 linux-5.14.tar.zst
$ time gunzip linux-5.14.tar.gz

real 0m5.141s
user 0m4.462s
sys 0m0.613s
$ time xz -d linux-5.14.tar.xz

real 0m8.571s
user 0m7.739s
sys 0m0.820s
$ time zstd -d linux-5.14.tar.zst
linux-5.14.tar.zst=C2=A0 : 1126737920 bytes

real 0m1.906s
user 0m1.185s
sys 0m0.710s

$ time gzip -k coreutils-9.0.tar

real 0m1.685s
user 0m1.669s
sys 0m0.016s
$ time xz -k coreutils-9.0.tar

real 0m14.891s
user 0m14.795s
sys 0m0.060s
$ time zstd -k coreutils-9.0.tar
coreutils-9.0.tar=C2=A0 =C2=A0 : 19.21%=C2=A0 =C2=A0(54394880 =3D> 10447053=
 bytes, coreutils-9.0.tar.zst)

real 0m0.207s
user 0m0.215s
sys 0m0.029s
$ ls -la coreutils-9.0.tar*
-rw-r--r-- 1 martyn martyn 54394880 Oct 27 11:16 coreutils-9.0.tar
-rw-r--r-- 1 martyn martyn 13595007 Oct 27 11:16 coreutils-9.0.tar.gz
-rw-r--r-- 1 martyn martyn=C2=A0 6177372 Oct 27 11:16 coreutils-9.0.tar.xz
-rw-r--r-- 1 martyn martyn 10447053 Oct 27 11:16 coreutils-9.0.tar.zst
$ time gzip -d coreutils-9.0.tar.gz

real 0m0.362s
user 0m0.280s
sys 0m0.048s
$ time xz -d coreutils-9.0.tar.xz

real 0m0.444s
user 0m0.424s
sys 0m0.020s
$ time zstd -d coreutils-9.0.tar.zst
coreutils-9.0.tar.zst: 54394880 bytes

real 0m0.095s
user 0m0.044s
sys 0m0.052s

$ time gzip -k tcp_wrappers_7.6.tar

real 0m0.033s
user 0m0.033s
sys 0m0.000s
$ time xz -k tcp_wrappers_7.6.tar

real 0m0.116s
user 0m0.104s
sys 0m0.012s
$ time zstd -k tcp_wrappers_7.6.tar
tcp_wrappers_7.6.tar : 26.57%=C2=A0 =C2=A0(360448 =3D>=C2=A0 95772 bytes, t=
cp_wrappers_7.6.tar.zst)

real 0m0.006s
user 0m0.003s
sys 0m0.003s
$ ls -la tcp_wrappers_7.6.tar*
-rw-r--r-- 1 martyn martyn 360448 Oct 27 11:15 tcp_wrappers_7.6.tar
-rw-r--r-- 1 martyn martyn=C2=A0 99459 Oct 27 11:15 tcp_wrappers_7.6.tar.gz
-rw-r--r-- 1 martyn martyn=C2=A0 79316 Oct 27 11:15 tcp_wrappers_7.6.tar.xz
-rw-r--r-- 1 martyn martyn=C2=A0 95772 Oct 27 11:15 tcp_wrappers_7.6.tar.zs=
t
$ time gzip -d tcp_wrappers_7.6.tar.gz

real 0m0.008s
user 0m0.004s
sys 0m0.004s
$ time xz -d tcp_wrappers_7.6.tar.xz

real 0m0.019s
user 0m0.015s
sys 0m0.004s
$ time zstd -d tcp_wrappers_7.6.tar.zst
tcp_wrappers_7.6.tar.zst: 360448 bytes

real 0m0.005s
user 0m0.000s
sys 0m0.005s

--raLNUh6ovUQ1MGIhy5W0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote><span style=3D"white-space: pre-wrap;">So, here the claim that =
zstd (with default options) is almost as good as</span><br style=3D"white-s=
pace: pre-wrap;" /><span style=3D"white-space: pre-wrap;">xz in compressed =
size is not confirmed. However, zstd is a clear winner</span><br style=3D"w=
hite-space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">in terms of=
 compression speed, and anyway better than gzip. This is</span><br style=3D=
"white-space: pre-wrap;" /><span style=3D"white-space: pre-wrap;">worth swi=
tching.<br /></span></blockquote>
That claim doesn't seem to be confirmed with any of the (admittedly small) =
selection of archives I tried, with zstd compression being approx 21 to 69%=
 less efficient in terms of storage space than xz compression, but still be=
ing the best in terms of compression and decompression speeds.<br /><br />H=
owever, I think neatly highlights why it may make sense to make this config=
urable, as which algorithm is "best" is going to depend on whether you're o=
ptimising for (de)compression speed or size.<br /><br />Testing results bel=
ow,<br /><br />Martyn<br /><br />---<br /><br />
<div>$ time gzip -k linux-5.14.tar&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m26.807s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m26.392s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.368s</div>
<div>$ time xz -k linux-5.14.tar&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>6m42.494s</div>
<div>user<span style=3D"white-space: pre;"> </span>6m40.167s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m1.757s</div>
<div>$ time zstd -k linux-5.14.tar&nbsp;</div>
<div>linux-5.14.tar&nbsp; &nbsp; &nbsp; &nbsp;: 16.28%&nbsp; &nbsp;(1126737=
920 =3D&gt; 183398470 bytes, linux-5.14.tar.zst)&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m3.531s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m3.631s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.509s</div>
<div>$ ls -la&nbsp; *</div>
<div>-rw-r--r-- 1 martyn martyn 1126737920 Oct 27 10:54 linux-5.14.tar</div=
>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 196107916 Oct 27 10:54 linux-5.14.tar=
.gz</div>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 124724612 Oct 27 10:54 linux-5.14.tar=
.xz</div>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 183398470 Oct 27 10:54 linux-5.14.tar=
.zst</div>
<div>$ time gunzip linux-5.14.tar.gz&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m5.141s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m4.462s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.613s</div>
<div>$ time xz -d linux-5.14.tar.xz&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m8.571s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m7.739s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.820s</div>
<div>$ time zstd -d linux-5.14.tar.zst&nbsp;</div>
<div>linux-5.14.tar.zst&nbsp; : 1126737920 bytes&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m1.906s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m1.185s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.710s</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>$ time gzip -k coreutils-9.0.tar</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m1.685s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m1.669s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.016s</div>
<div>$ time xz -k coreutils-9.0.tar</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m14.891s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m14.795s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.060s</div>
<div>$ time zstd -k coreutils-9.0.tar</div>
<div>coreutils-9.0.tar&nbsp; &nbsp; : 19.21%&nbsp; &nbsp;(54394880 =3D&gt; =
10447053 bytes, coreutils-9.0.tar.zst)&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.207s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.215s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.029s</div>
<div>$ ls -la coreutils-9.0.tar*</div>
<div>-rw-r--r-- 1 martyn martyn 54394880 Oct 27 11:16 coreutils-9.0.tar</di=
v>
<div>-rw-r--r-- 1 martyn martyn 13595007 Oct 27 11:16 coreutils-9.0.tar.gz<=
/div>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 6177372 Oct 27 11:16 coreutils-9.0.ta=
r.xz</div>
<div>-rw-r--r-- 1 martyn martyn 10447053 Oct 27 11:16 coreutils-9.0.tar.zst=
</div>
<div>$ time gzip -d coreutils-9.0.tar.gz&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.362s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.280s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.048s</div>
<div>$ time xz -d coreutils-9.0.tar.xz</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.444s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.424s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.020s</div>
<div>$ time zstd -d coreutils-9.0.tar.zst</div>
<div>coreutils-9.0.tar.zst: 54394880 bytes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.095s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.044s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.052s</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>$ time gzip -k tcp_wrappers_7.6.tar</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.033s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.033s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.000s</div>
<div>$ time xz -k tcp_wrappers_7.6.tar</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.116s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.104s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.012s</div>
<div>$ time zstd -k tcp_wrappers_7.6.tar</div>
<div>tcp_wrappers_7.6.tar : 26.57%&nbsp; &nbsp;(360448 =3D&gt;&nbsp; 95772 =
bytes, tcp_wrappers_7.6.tar.zst)&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.006s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.003s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.003s</div>
<div>$ ls -la tcp_wrappers_7.6.tar*</div>
<div>-rw-r--r-- 1 martyn martyn 360448 Oct 27 11:15 tcp_wrappers_7.6.tar</d=
iv>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 99459 Oct 27 11:15 tcp_wrappers_7.6.t=
ar.gz</div>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 79316 Oct 27 11:15 tcp_wrappers_7.6.t=
ar.xz</div>
<div>-rw-r--r-- 1 martyn martyn&nbsp; 95772 Oct 27 11:15 tcp_wrappers_7.6.t=
ar.zst</div>
<div>$ time gzip -d tcp_wrappers_7.6.tar.gz&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.008s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.004s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.004s</div>
<div>$ time xz -d tcp_wrappers_7.6.tar.xz</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.019s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.015s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.004s</div>
<div>$ time zstd -d tcp_wrappers_7.6.tar.zst</div>
<div>tcp_wrappers_7.6.tar.zst: 360448 bytes&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>real<span style=3D"white-space: pre;"> </span>0m0.005s</div>
<div>user<span style=3D"white-space: pre;"> </span>0m0.000s</div>
<div>sys<span style=3D"white-space: pre;"> </span>0m0.005s</div>

--raLNUh6ovUQ1MGIhy5W0--

