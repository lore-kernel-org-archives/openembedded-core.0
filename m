Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBFE07F30D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 18:42:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r3so2175058wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 11:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Srw9Ep4nlcOGICShVArAFRG7C1sBihdJhST21xdlvi8=;
	b=Oa5TfU3oIZYJPRAO7yigFGGDDdWKPNag0mlrUi1w1rnhMCjL+qjjA4uSQ9dj8quSGP
	BtddMOlG+715T3ecdGqkIMDdYBCrhwqYbzz+mWZsAXUxMsP9wG7we1JJR69AdJQj1E2W
	DP25lfydX+rjtEf4m30fuMGKP+0oI+gIVwl/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Srw9Ep4nlcOGICShVArAFRG7C1sBihdJhST21xdlvi8=;
	b=bHkV4/fITx9+4Lv9VUxLHhuHETjBviq+aNsw5fsd56iamefMa6cZdOCcJ1ANvESfzY
	TUDOwNryYkH4Tt+NtOA9+GbC+AQBL6m7n6s0sFLU00aLj/BfVkgreQ8nVY7sytm01J1g
	ov4vo41vJTtncuB4d/Oq0Y+617yX3dc7O9Bxls8WcF4yhkk8n5H5EV4L4xYzKBJS/mGo
	uSFg5csMiRRBC4iN1ItBzx3xxcU1PlLUQamVeFVdXTNUIQKhHmqZgEhGBZzTu/YadNX/
	TtWSg3iV9eJadPFiTyoC4FIduovDOyu2MkOmqwrGS4DfS4UWVODXhox28Hm7S+Oo6PKc
	wN+g==
X-Gm-Message-State: APjAAAUWv9nw5Ab79y5BKkekUbilqSpFeziqiX2JbxjixJuP1BZF+bBC
	F9f6NWfHDh1kgL7QOdyiLEcSzA==
X-Google-Smtp-Source: APXvYqwSLbjlusXPkcMskfiKQFnPyBwXtzt8j+1vJOll1lZwPykZIlfISFwwQzobxFgsKnQPbGUnaQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr8255619wrr.194.1565289758513; 
	Thu, 08 Aug 2019 11:42:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r123sm3815192wme.7.2019.08.08.11.42.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 11:42:37 -0700 (PDT)
Message-ID: <572463162f995f87c9bd0d48db6541a34c8dd2a8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Aug 2019 19:42:36 +0100
In-Reply-To: <20190808125509.120784-1-jason.wessel@windriver.com>
References: <20190808125509.120784-1-jason.wessel@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] image_types_wic.bbclass: Copy the .wks and .env files to deploy image dir
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
X-List-Received-Date: Thu, 08 Aug 2019 18:42:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 05:55 -0700, Jason Wessel wrote:
> When using a .wks.in file, the only place that the generated .wks file
> exists in the tmp/work area.  A copy should be left behind in the
> deploy directory so that you can easily run the wic tool to
> re-generate or modify a new image without running bitbake.  Custom
> .wks.in files can reference any number of bitbake variables, so it is
> important to save the result.
> 
> below is an example of using the generated .wks file in the deploy
> area.  The full name of my generated .wks file was
> core-image-minimal-ostree-uboot-ab.wks, but since you usually only
> have a single .wks file per image you can use a wild card like:
> 
>   cd tmp*/deploy/images/*
>   wic create --vars . -e core-image-minimal -s -m core-image-minimal-*.wks
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/image_types_wic.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 519aeb1b04..ce94138b3c 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -77,6 +77,11 @@ python do_write_wks_template () {
>      wks_file = d.getVar('WKS_FULL_PATH')
>      with open(wks_file, 'w') as f:
>          f.write(template_body)
> +    f.close()
> +    # Copy the finalized wks file to the deploy directory for later use
> +    depdir = d.getVar('DEPLOY_DIR_IMAGE')
> +    basename = d.getVar('IMAGE_BASENAME')
> +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
>  }

Nothing should be writing to DEPLOY_DIR_IMAGE directly as it means its
not being managed by sstate and won't restore in a build from sstate.
There is an intermediate directory it should be written to and the
sstate code will put it into DEPLOY_DIR_IMAGE. For image classes it
might be IMGDEPLOYDIR but you'd have to check this task/code runs
between do_image and do_image_complete.

>  python () {
> @@ -127,6 +132,10 @@ python do_rootfs_wicenv () {
>              value = d.getVar(var)
>              if value:
>                  envf.write('%s="%s"\n' % (var, value.strip()))
> +    envf.close()
> +    # Copy to deploy directory for later use with stand alone wic
> +    depdir = d.getVar('DEPLOY_DIR_IMAGE')
> +    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
>  }

Same here.

Cheers,

Richard


