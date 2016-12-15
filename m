Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 265C177293
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 11:38:12 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c47so53564156qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xEQ2QrFVjOJSkK4VClPyTdJlbvkcaLXCckg1E4sZGIY=;
	b=IKjb9M6eezXYNZPmWy1CS6UnK9NbrDm3KFuLpsbX+BTJ6WyZajiSsLZqld0h4vXeEG
	u4U787A7kWo92/nPGO2AXu7cG7//XJpCSM/Mu7twEMei4MZUcBkq4RynXpAVl/Z72oip
	iQb0x41HF4rxA0IYneZiTwTjSYn4P8kWDAFDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xEQ2QrFVjOJSkK4VClPyTdJlbvkcaLXCckg1E4sZGIY=;
	b=A7DgyzxwqK3zu/IeZJtPrjxEiZ1B0uNu+GFRcYZKLz5C+fmLx+WqFQ7rlb3bi8mbfC
	GvqpBXo3Iy8S2rbPFD1+nzSg32X0Q8GuGytPckcLXhiljk2E9LTliN/05AJEwPMDu9+5
	AbNpsLG5zDEA1CmEmKUbDUkTOJqFfs+BiZYF7fnX1Mz/V1hQgDey9xOQ7CF5wCO5jyNR
	Hx/KloOmk9ZjAtFdGIHlihstcb15r7ufARAfQBfHiLgnT/hYPO3sFXif3aqD6KOk4k81
	YNZxSRZAtixJ7/huYin4kzXHCNxfQwSn97vJuFsh9Li80e000by5nr9UR9HWp1Qctmb0
	9FbQ==
X-Gm-Message-State: AIkVDXJi+L+5xqxQ58IOfvy+/TVmhTZvO9lc4yqCze+eaLDyLqoRgZlQBVgCeKKNHglgDgwYPxoJFNkGsD2bohUq
X-Received: by 10.200.50.97 with SMTP id y30mr652921qta.203.1481801894236;
	Thu, 15 Dec 2016 03:38:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.19.72 with HTTP; Thu, 15 Dec 2016 03:37:53 -0800 (PST)
In-Reply-To: <1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
	<1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 15 Dec 2016 12:37:53 +0100
Message-ID: <CAP71Wjw940K97MyZF4-gVziJve3FEhNVJG4R-_A=rm4QXLzV4Q@mail.gmail.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
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
X-List-Received-Date: Thu, 15 Dec 2016 11:38:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 4, 2016 at 7:46 AM, Yuqing Zhu <carol.zhu@nxp.com> wrote:
> ++
> ++#if GST_GL_HAVE_OPENGL
> ++  if (USING_OPENGL (context)) {
> ++    gl->MatrixMode (GL_PROJECTION);
> ++    gl->LoadIdentity ();
> ++  }
> ++#endif
> +

yes, I know , a bit late in the game.. but this patch breaks when -bad
is built with 'opengl' support in PACKAGECONFIG. In the original
upstream commit at [1] the .h file defines the USING_OPENGL macro, but
that piece of code was not backported properly in OE and it leaves
USING_OPENGL as an undefined symbol..

This is now a morty issue.. i will try to cook up a patch for it later today.

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=0cfb0890ce9a20f096a0a9c9f23b656f436794c6

