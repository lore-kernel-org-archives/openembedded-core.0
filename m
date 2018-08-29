Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1C459607DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:16:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7TEGbEX024432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Aug 2018 15:16:38 +0100
Message-ID: <66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 15:16:36 +0100
In-Reply-To: <20180828221954.3214-1-schnitzeltony@gmail.com>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 14:16:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-08-29 at 00:19 +0200, Andreas Müller wrote:
> The patch should increase performance for libsdl2 on GLES2 too.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141
> +++++++++++++++++++++
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
>  2 files changed, 142 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-
> Get-sin-cos-out-of-vertex-shader.patch
> 
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-
> sin-cos-out-of-vertex-shader.patch b/meta/recipes-
> graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-
> shader.patch
> new file mode 100644
> index 0000000000..621b7ea1a0
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-
> out-of-vertex-shader.patch
> @@ -0,0 +1,141 @@
> +From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17 00:00:00
> 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Fri, 24 Aug 2018 23:10:25 +0200
> +Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The only place angle is activated and causes effect is RenderCopyEx.
> All other
> +methods which use vertex shader, leave angle disabled and cause
> useless sin/cos
> +calculation in shader.
> +
> +To get around shader's interface is changed to a vector that
> contains results
> +of sin and cos. To behave properly when disabled, cos value is set
> with offset
> +-1.0 making 0.0 default when deactivated.
> +
> +As nice side effect it simplifies GLES2_UpdateVertexBuffer: All
> attributes are
> +vectors now.
> +
> +Additional background:
> +
> +* On RaspberryPi it gives a performace win for operations. Tested
> with
> +  [1] numbers go down for 5-10% (not easy to estimate due to huge
> variation).
> +* SDL_RenderCopyEx was tested with [2]
> +* It works around left rotated display caused by low accuracy sin
> implemetation
> +  in RaspberryPi/VC4 [3]
> +
> +Upstream-Status: Submitted [4]

If I'm reading the logs correctly, this was actually merged upstream so
the status would become Accepted or Backport?

> +[1] https://github.com/schnitzeltony/sdl2box
> +[2] https://github.com/schnitzeltony/sdl2rendercopyex
> +[3] https://github.com/anholt/mesa/issues/110
> +[4] https://hg.libsdl.org/SDL/rev/e5a666405750

Cheers,

Richard

