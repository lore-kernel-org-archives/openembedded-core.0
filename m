Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 12F957F2BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 12:45:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so6846003wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 04:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+CNFYbGBMwg8j0QKJIugYw+2fhIuVFI/v+UxD4021jk=;
	b=EUWApKjbV15fyotyPBrpl9fU56CONJpRICpNpmG2ZpUAjDnxUNC8zGNbG93J3jxLbZ
	plaAeS8fqKEG6DnHA3FG8TXANj5Xseq01RTnE8kByTvHy8olgKeQu8l9hnRb0DibLpFS
	Nr9OeazJd66sDgb5bilJ2yCfsekgUww/ZtEJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+CNFYbGBMwg8j0QKJIugYw+2fhIuVFI/v+UxD4021jk=;
	b=VQdHJz2vpZIGqnxAoaWnjZUs3uZmQgcal9sx9xC6SZhmD7YAlvYhmHBPjIwd53xhPT
	1WNH2JcnZ+BhfWP7MTI2BnUTj2W57Gs7JFoBhB8MAG/aZdY/+jMUyln91sNuowdmEqoI
	W6JsNQCJbSQ1KSI/xiMRmXZXzfFMTPePqvBwYzbgdVloI4XXaC1JiB5VHCqBeZu4VjD9
	ml3DewVsq2SDiE+2H/Gso3hb59pAXw2OD+0M/Uiv1Nd7NgOrcwLdbL7kNd04PQaZLjo+
	uK0UAzfyIodDSGqcPU+X2CAyk63RyScY0vR5ryqnyKLRF6M2OuGTS69Nr6BmFqStLe+D
	NUTw==
X-Gm-Message-State: APjAAAUwyboywCOMEVCblNq6ec1wg/ursgxFASm76YxTn9kgbLVl3ej8
	jZkrW9Ea/3ocv3Z/MbY6I/VxKg==
X-Google-Smtp-Source: APXvYqw7b73j+4nq3RQFdCmjODU7YtiNbE4KFv231hbmI394oYaYmtCZy6BEvZmXOd8V2D2Cc7s97Q==
X-Received: by 2002:a05:600c:2049:: with SMTP id
	p9mr21332050wmg.84.1575463529660; 
	Wed, 04 Dec 2019 04:45:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y139sm6953830wmd.24.2019.12.04.04.45.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 04:45:28 -0800 (PST)
Message-ID: <2f489e8bd1afbd416205524fc447f45c144f719c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 04 Dec 2019 12:45:27 +0000
In-Reply-To: <20191202182613.3380457-1-raj.khem@gmail.com>
References: <20191202182613.3380457-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] go: Reset unneeded GOARCH variables for native recipe
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
X-List-Received-Date: Wed, 04 Dec 2019 12:45:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-12-02 at 10:26 -0800, Khem Raj wrote:
> These variables depend on TUNE_FEATURES variable and that creeps into
> dependencies for native as well as a result, which means go-native
> gets
> recompiled everytime machine/arch is changed.
> 
> Fixes sstate differences found e.g.
> 
> basehash changed from
> 600fb6be571fa4853232a7fed78945ee19b324e54b1b94cff93ef472b6290103 to
> 994de861190a56064d3e186d9c411152127e230bf2f77b17e59b2c5932a41249
> List of dependencies for variable TUNE_FEATURES changed from
> '{'TUNE_FEATURES_tune-core2-32', 'DEFAULTTUNE'}' to
> '{'TUNE_FEATURES_tune-armv7vethf-neon', 'DEFAULTTUNE'}'
> changed items: {'TUNE_FEATURES_tune-core2-32', 'TUNE_FEATURES_tune-
> armv7vethf-neon'}
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-common.inc | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-
> devtools/go/go-common.inc
> index f18d928c70..8e4dd137a0 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -37,6 +37,30 @@ export GO386 ?= "${TARGET_GO386}"
>  export GOMIPS ?= "${TARGET_GOMIPS}"
>  export GOROOT_FINAL ?= "${libdir}/go"
> 
> +GOARM[export] = "1"
> +GOARM_class-native = ""
> +GOARM_class-native[export] = "0"

Can we at least do:

GOEXPORTVARS = "1"
GOEXPORTVARS_class-native = "0"

GO386[export] = "${GOEXPORTVARS}"

to clean this up a bit please? :)

Cheers,

Richard


