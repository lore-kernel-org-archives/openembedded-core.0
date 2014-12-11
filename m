Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A8160723FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 19:43:51 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so5495788iec.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9bg+GpxohQFTagEAFPj1N5HVbUWkV9JVWKNg/rWgSdE=;
	b=CsTLidrgcT66/D4OPTpj0vsku1pE3p4zYoqrCgBdvdCTAsFcuVCxuy3+OxH09mQFkf
	MYc4UW/qKJExGh4pixL+WSTnO4/D8E5MDiGhmyQMeaMypQ6C9A0A+xsNbO+f2msxHm3g
	R5M+1+QnM40MTDXGKB8oT3TaXmrXPXfpAQ+4vWBC07TmSz47K4QosKNGeenCqciOLYs9
	vlVz8PgLnm06U1lWgLvIl7KMNyxL2W/s1x/KoZC00hHRgEJwUGIhTNOUhdF2RPHgBp01
	3eCbFRDJUrZbZFbXb661b2cog+csScbnDW7qwA9v8YcAm2RKb8kzFxaVo0rP13y8j9AE
	V0rg==
X-Gm-Message-State: ALoCoQk7NMoOHqGycfOv8/9XwhTeL3QUgxBWuhwNTlTHWqPQrzBRX8HHhR3H6t82EMzUBgYqwlvB
X-Received: by 10.107.4.204 with SMTP id 195mr7710860ioe.48.1418327032306;
	Thu, 11 Dec 2014 11:43:52 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id l2sm989869ioe.34.2014.12.11.11.43.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 11:43:51 -0800 (PST)
Message-ID: <5489F3EC.1090206@linaro.org>
Date: Thu, 11 Dec 2014 14:43:40 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
	<5489E2A9.3060709@linaro.org>
	<2731996.o7KRurrPZW@peggleto-mobl5.ger.corp.intel.com>
	<5489EDA6.1000709@linaro.org>
In-Reply-To: <5489EDA6.1000709@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 19:43:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

bisecting (manually) leads to this commit being safe:

ea50ec527483eb3a094588858baebd5fb23f71c6 devtool: rename deploy/undeploy
to deploy-target/undeploy-target

and this one introducing the problem:

770f203f73f358ce3c6c5ac12fe2775b812bdc6b devtool: fool bitbake into
thinking it's outputting to a terminal



On 12/11/14 14:16, Trevor Woerner wrote:
> Oops! (this worked before the "git pull")
>
>     $ devtool add xannounce ~/devel/yocto/build/workflow/xannounce/
>     NOTE: Creating workspace layer in
>     /home/trevor/devel/yocto/build/workflow/build/workspace
>     NOTE: Recipe
>     /home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannounce/xannounce.bb
>     has been automatically created; further editing may be required to
>     make it fully functional
>     Traceback (most recent call last):
>       File
>     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
>     line 274, in <module>
>         ret = main()
>       File
>     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
>     line 267, in main
>         ret = args.func(args, config, basepath, workspace)
>       File
>     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool/standard.py",
>     line 68, in add
>         _add_md5(config, args.recipename, recipefile)
>       File
>     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool/standard.py",
>     line 218, in _add_md5
>         md5 = bb.utils.md5_file(filename)
>       File
>     "/home/trevor/devel/yocto/build/workflow/meta-poky/bitbake/lib/bb/utils.py",
>     line 463, in md5_file
>         with open(filename, "rb") as f:
>     IOError: [Errno 2] No such file or directory:
>     '/home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannounce/xannounce.bb'
>
> Sure enough...
>
>     $ devtool-workflow> tree workspace/
>     workspace/
>     |-- appends
>     |-- conf
>     |   `-- layer.conf
>     `-- recipes
>         `-- xannounce
>
>     4 directories, 1 file
>
>
> whereas before it was:
>
>     $ tree workspace/
>     workspace/
>     |-- appends
>     |   `-- xannounce.bbappend
>     |-- conf
>     |   `-- layer.conf
>     `-- recipes
>         `-- xannounce
>             `-- xannounce.bb
>
>     4 directories, 3 files
>
> For some reason my recipe and bbappends are not getting created :-(


