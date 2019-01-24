Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5337C309
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:43:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m22so4824457wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PLxyKssugNZ9Bamktx9TumtYGTs7dl/RHcZLkQIcU78=;
	b=PsnMa6EHlfsxXu/rnYfx2To38BI9MU/Kp8eb5vqz36Vl4AjB2Ph2nHej00UgDHg360
	0TpChk61VXpg5etUFYyAZZ8IHYfI8Mq6FMR8gDhRIlpe1GwpUDaVf6h2id+OwV2mwDHj
	mOTcXvCJFDvey+zvIYoIJZwPZibcYi7GFaA/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PLxyKssugNZ9Bamktx9TumtYGTs7dl/RHcZLkQIcU78=;
	b=CgqH25UpkJbGDB6OCKB+6ROR/UMC0YTvFT9Sp4U+o67n5T+6BhWhCRNMHzXyiIxBNW
	nglv05YC502nEb0UB+0vI4W3uZGXKhZSe8K6Elusc0XV0v7PMWbVvHZplfVjk3MDyedq
	kRRzwnG+gaNi8inuhwYs9p2bSFCXYlJSVRkFuioAA/umV/qaRumxFRwbJYJCA3V1EpCg
	0EO5fFw8WbBraJabHXCjH8aC+jmUIvYECdjemfueCoZQiPMeJOVj+7RLjOX2Zm8DXNWC
	PNISiY5lC22/RvGIuqscIwA6ZyKGmotsHkVliBA4gh0OhVRRQWEVYuuB2Hx0w8a6y/SS
	9f+Q==
X-Gm-Message-State: AJcUukfdCx5aIwYPyMF1ZeuXRXLbbrP7UiU41PUw+L+c14265TuMvOeW
	9nQWIac5P3XayiPEVvJTY4ircg==
X-Google-Smtp-Source: ALg8bN4Iwt+KPjowway64oD+a/j//ANgfMPsu9v4kWQsn7zLWcXPcX8SOhgwH1sJsxVRIEHdeEe3kA==
X-Received: by 2002:a1c:414:: with SMTP id 20mr4460955wme.67.1548369791137;
	Thu, 24 Jan 2019 14:43:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w18sm39257945wmi.12.2019.01.24.14.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 14:43:10 -0800 (PST)
Message-ID: <a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 22:43:09 +0000
In-Reply-To: <20190123161744.45763-4-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Thu, 24 Jan 2019 22:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-23 at 17:17 +0100, Alexander Kanavin wrote:
> The few cases where they failed should be now all fixed. The only allowed
> exception is when building mingw32 SDKs, as there is currently no support for running
> postinst_intercepts through wine.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oe/package_manager.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 1087144d47f..f26f597d03d 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -439,6 +439,11 @@ class PackageManager(object, metaclass=ABCMeta):
>                  self._postpone_to_first_boot(script_full)
>                  continue
>  
> +            if populate_sdk == 'host' and self.d.getVar('SDK_OS') == 'mingw32':
> +                bb.warn("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
> +                                % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
> +                continue
> +
>              bb.note("> Executing %s intercept ..." % script)
>  
>              try:
> @@ -447,7 +452,7 @@ class PackageManager(object, metaclass=ABCMeta):
>              except subprocess.CalledProcessError as e:
>                  bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
>                  if populate_sdk == 'host':
> -                    bb.warn("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
> +                    bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
>                  elif populate_sdk == 'target':
>                      if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
>                          bb.warn("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"

I'm ok with this but could we change the bb.warn to something less
important like a note?

The reason I say this is that I'd like to get the autobuilder to the
point where its warning free. This warning is the only reason meta-
mingw shows warnings now. Either we fix them or if we can't, they
probably aren't warnings.

What should we do here?

(also cc'd Joshua)

Cheers,

Richard


