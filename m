Return-Path: <will.newton@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 14A1071984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 16:36:09 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id e9so4826644iod.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lwj5SAkQ3H9XUHsQ+b7/FLx7AduL3wpzzyEMK9S09S4=;
	b=DGaObi7J4/uo6ycdzWXFCiW21KEFIO2KHsZVYp37gvUMpPmGHAzRfdONMHBADEhdDY
	3Vfxj8VyX9YFPJXX9k5qGlLIdmxtX6nRxNvf1SVQ23v2Kgmfg5vSMHpKDRpXrmfA2If0
	W5TAa+0m2NcZ3z7tlVVjxH5Ir9JAn2hoI6w5KG4L1yOaKROhGyeYFwpzepGhWVXt6GSB
	j9+OurrHdLzUN64cW4TvZLUWBsaMVkG/YYs7hwcYrBr/tZqAs5Ms3QP9z0A2tFNoFxtQ
	2q476+U8Pc1Y5VZQzhvUxRL+4Wbcapr899avuo5UjpRnj+Tcxn2mWAv+cG0TXN4h9+Nk
	olHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lwj5SAkQ3H9XUHsQ+b7/FLx7AduL3wpzzyEMK9S09S4=;
	b=rRJ6V+9YynEA+8IjsASm1OGIGwuNZOJRZGIUvAvkC48wMlDJNtJLQRN6VCyVY00+Ku
	H+lbYzWIn4XmM64Upvqz1YEhmF+a/Hy28dqFfc/2LwcWHckcPpcYs4cuVQKIGkeGmWTy
	yq36SKyTvdHHAm7WiGoMBa7u1akdfAbuGz5WOFqCfLPcbuTC04wkd1Yn2VBW4Q0hJ6jk
	xljbt2S2asummyFo2gTUtTHhvFhNUW31YkPiMVFG3Z/+ppcR/qNMO21eb+C3Zl2vtY1Q
	gdUbVWhXJRRgh5R1TnKpIbAGVMKCNHbLAaeVtBBTJNwA5ItSEbGJxe7PZWoJLfwvi6n2
	XM1w==
X-Gm-Message-State: AHPjjUj9rfzgRRMt1e6wIUpU40wlSnKGg6wIp79ov1eBXvWf7f2DaoPh
	x1YJocQbatZzOxBkW0Vmh/1kOghUWtT4JoEa7p0=
X-Google-Smtp-Source: AOwi7QDhARiA3d3qr4kynMq5OhlqRH7aS+KFc9cCfDOIPfhUAzvYqz11oNraR+vHWyfQGo+K95nDW/dnQMLHRHktw0A=
X-Received: by 10.107.159.141 with SMTP id i135mr12085009ioe.300.1506443770524;
	Tue, 26 Sep 2017 09:36:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.181.161 with HTTP; Tue, 26 Sep 2017 09:36:09 -0700 (PDT)
In-Reply-To: <20170918134356.16124-1-willn@resin.io>
References: <20170918134356.16124-1-willn@resin.io>
From: Will Newton <will.newton@gmail.com>
Date: Tue, 26 Sep 2017 19:36:09 +0300
Message-ID: <CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [pyro][PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Tue, 26 Sep 2017 16:36:10 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Is this change ok for the stable branch?

On Mon, Sep 18, 2017 at 4:43 PM, Will Newton <will.newton@gmail.com> wrote:
> From: Will Newton <will.newton@gmail.com>
>
> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>
> (From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3b9c50a336d)
>
> Signed-off-by: Will Newton <willn@resin.io>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec787..12df88f8c4 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7' in f:
> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.13.5
>

