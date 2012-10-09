Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TLRnP-0001Lj-Ga
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 06:51:55 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so3156091lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 21:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=9ZgooLV/dICIwUheQKBiGtTljkgBIHgM9uoC6ergVlY=;
	b=shM841JJGNsIL17ini/h6QNWTgYt3Hpghm8rDXvVfyulbZmN5MisAtcwYyslOB5OjB
	xnjgE+GRuS1pfVe8pNdcqVtlo0LC+8Mi+1rnmQ+n9TlwtWpztHZmVQbE8L3pbcklM04w
	Epht1NPLIgKc0WQXk+Q4A81PzYdityf9LwxjZtcpldt4nAplQ1U0YAkGqxOpWb7SvqZ8
	jSc+gFmK2PMSpLTOPfcsjMjOvGmOAZM0AbU2ARFso+YeKLt9PNKSJw/xF+HAPFWWnICM
	typVLgo4imUCIN5oymFxQ+xIeMw3opac2Gk22E3nSvIIWsexQ/utnkzBm/BFVJmJxRG+
	ZrHw==
Received: by 10.152.123.103 with SMTP id lz7mr15326547lab.21.1349757528292;
	Mon, 08 Oct 2012 21:38:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Mon, 8 Oct 2012 21:38:28 -0700 (PDT)
In-Reply-To: <1349713951-30766-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <5058505C.2040602@linaro.org>
	<1349713951-30766-1-git-send-email-marcin.juszkiewicz@linaro.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 8 Oct 2012 21:38:28 -0700
X-Google-Sender-Auth: rYE2_27c8DHczIfuPjnhyYeHYkA
Message-ID: <CABcZANm_-4qSUXByfvn2dejfDq1EsZ-QKYpWDN_S-fK=qh19Ww@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] autotools.bbclass: update gnu-config files always
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 04:51:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 8, 2012 at 9:32 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> When recipe inherits autotools it gets do_configure defined. One of
> things which are done is autoreconf so gnu-config files are updated to
> latest OE version.
>
> But some recipes use own do_configure due to hard edited configure
> scripts or other reasons. We can edit those recipes one by one or can
> trick them and provide update gnu-config files without using
> autoreconf.
>
> There are still some recipes left but that's usually due to other
> directories than ${S} being used for configure scripts.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/classes/autotools.bbclass |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index e4e034b..7effd48 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -99,6 +99,10 @@ autotools_preconfigure() {
>                         mkdir ${B}
>                 fi
>         fi
> +
> +       # not all recipes which use autotools use it's do_configure
> +       install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> +       install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>  }


This won't obey the autoconf macro which redirects such files into a
subdirectory, right? It shouldn't always go to ${S}, afaik. Quite a
few projects will use t his macro to move all those files into a
subdir like 'config' to clean up the root of the source tree. To
really do this properly, I think you'd have to:
1) descend into autoconf subdirs, so subdir configure runs also use
the updated gnu config files
2) extract the config subdir from autoconf and install them there, for
each of those dirs
-- 
Christopher Larson


