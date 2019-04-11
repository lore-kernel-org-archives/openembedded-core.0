Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 916F77D781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:11:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o25so8294272wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BIqzEJ0a9O2RYo6yUBno51ad3ovHtCxcF7hepvjyURQ=;
	b=MgDshCoJqkSZ2dS6xz93xJSnYOIZdHEsPiRfztUsY144APrQjJpjEMcdw49bhiAtPF
	uCXs0rnP0Tg8oWaxmBiekKotGMMulE4dYsA6Jg/e7PGans12rLy+FNZxqgTo6nVFbLlV
	zJULgILFcgXGvAKjCe/6ARHjyRicxwJnJPi48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BIqzEJ0a9O2RYo6yUBno51ad3ovHtCxcF7hepvjyURQ=;
	b=FFCMJtGVbm/OWcKRIlN/Zq57ONXk1Odcm4elj3NoMDlqsxTQemLe00xOQ/ESXdzudV
	MoAFPpqEWmnnAHaDJptF058AvTOmRo/pasobwLRduu/sH1aqv2yo9qVxu4iy4Jio58Ym
	UAoQAaGBzx9wiaD9bkKGNE+xeS10emuVWyWnwmm5WWnAOKnQWqiuXt7qJ05KKRa+ZFFK
	U2R/ADrN7P5bP9ZF9YS/oaSaEGQrI6Tw6c9RaH7dq59PxePeufssaZ1PhJq+c0UZtQFw
	qyOz3tDhV5aOcxLxRzKz0LajGPB4y/gpMnVvzCgx4Q/rIDEUZvRn5mOLbrvjKFRTCivK
	mguQ==
X-Gm-Message-State: APjAAAWxIFdkCmmWRFeMgZSog9cdogBaJXZUg+yzihmS3l2TgTJ8/HPV
	9bksR2B6nHJ4QY/5gmle0bBf5A==
X-Google-Smtp-Source: APXvYqyl76EsAskl7U9LL43OWuFRb5RWLbBWGRCgd8IyfegOv680QdYvMZ1epdYscMdKgeDfSgX+MA==
X-Received: by 2002:a1c:e185:: with SMTP id y127mr7323506wmg.76.1555013519305; 
	Thu, 11 Apr 2019 13:11:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t76sm9430826wmt.8.2019.04.11.13.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 13:11:58 -0700 (PDT)
Message-ID: <a9b15f00daefad23c17a4f8199f9da7d361b1f51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mariano Lopez <just.another.mariano@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 21:11:56 +0100
In-Reply-To: <102ba655188d6b90411171468c0c354602e3e549.1554787765.git.just.another.mariano@gmail.com>
References: <cover.1554787765.git.just.another.mariano@gmail.com>
	<102ba655188d6b90411171468c0c354602e3e549.1554787765.git.just.another.mariano@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/4] ptest.bbclass: Add feature to populate a binary directory
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
X-List-Received-Date: Thu, 11 Apr 2019 20:11:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-09 at 00:44 -0500, Mariano Lopez wrote:
> This adds the functionality to create a binary directory within
> PTEST_PATH directory. This directory will be populated with
> symlinks pointing to the binaries installed by the package and
> then renamed by update-alternatives. This way the ptest only needs
> to source this binary directory in order to use the expected
> binaries.
> 
> To enable this feature just add PTEST_BINDIR = "1" to the recipe.
> 
> [YOCTO #12597]
> [YOCTO #13238]
> 
> Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
> ---
>  meta/classes/ptest.bbclass | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 97865c9338..e87a9659cb 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -65,6 +65,38 @@ do_install_ptest_base() {
>      done
>  }
>  
> +PTEST_BINDIR_PKGD_PATH = "${PKGD}${PTEST_PATH}/bin"
> +
> +# This function needs to run after apply_update_alternative_renames
> because the
> +# aforementioned function will update the ALTERNATIVE_LINK_NAME
> flag. Append is
> +# used here to make this function to run as late as possible.
> +PACKAGE_PREPROCESS_FUNCS_append = "${@bb.utils.contains('PTEST_BINDI
> R', '1', \
> +                                    bb.utils.contains('PTEST_ENABLED
> ', '1', ' ptest_update_alternatives', '', d), '', d)}"
> +
> +python ptest_update_alternatives() {
> +    """
> +    This function will generate the symlinks in the
> PTEST_BINDIR_PKGD_PATH
> +    to match the renamed binaries by update-alternatives.
> +    """
> +
> +    if not bb.data.inherits_class('update-alternatives', d) \
> +           or not update_alternatives_enabled(d):
> +        return
> +
> +    bb.note("Generating symlinks for ptest")
> +    bin_paths = { os.environ["bindir"], os.environ["base_bindir"],

I'm going to merge this but is there a good reason you're using
os.environ[] here? If not we should merge a small fixup to use
d.getVar() since ultimately we don't really want these things in the
environment if we can help it.

Cheers,

Richard



