Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBEDCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:47:30 +0000 (UTC)
Subject: Re: [PATCH 1/8] erofs-utils: Make reproducible for different BUILD_ARCH
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.222.212)
X-Originating-Platform: Windows Chrome 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 04:47:25 -0700
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
Message-ID: <1008103.1790596045910735679@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ZUMHktzn0fd6A5P9xFpj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246758

--ZUMHktzn0fd6A5P9xFpj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I might be missing something, but I think the aarch64 case can still leak.
In configure.ac, right after the cached sysconf check there's:

AS_CASE([$build_cpu], [aarch64*], ... erofs_cv_max_block_size=3D16384 ...)

so on an aarch64 worker building qemux86-64 the cached 4096 still gets bump=
ed to 16384.
When I tried the v1.9.4 configure with --build=3Daarch64-linux --host=3Dx86=
_64-linux, config.h ended up with 16384.

Passing MAX_BLOCK_SIZE=3D${BLOCKSIZE} instead seems to skip that whole bloc=
k.
The next 119 run should show it, as long as reproducibleA picks up erofs-ut=
ils from x86_64 sstate.

Thanks,
Sunil

--ZUMHktzn0fd6A5P9xFpj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I might be missing something, but I think the aarch64 case can still l=
eak. <br />In configure.ac, right after the cached sysconf check there's:<b=
r /><br />&nbsp; AS_CASE([$build_cpu], [aarch64*], ... erofs_cv_max_block_s=
ize=3D16384 ...)<br /><br />so on an aarch64 worker building qemux86-64 the=
 cached 4096 still gets bumped to 16384. <br />When I tried the v1.9.4 conf=
igure with --build=3Daarch64-linux --host=3Dx86_64-linux, config.h ended up=
 with 16384.<br /><br />Passing MAX_BLOCK_SIZE=3D${BLOCKSIZE} instead seems=
 to skip that whole block. <br />The next 119 run should show it, as long a=
s reproducibleA picks up erofs-utils from x86_64 sstate.<br /><br />Thanks,=
<br />Sunil</div>

--ZUMHktzn0fd6A5P9xFpj--

