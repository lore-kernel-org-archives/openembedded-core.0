Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B17B60144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:41:03 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so2181704qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+w+fq0Q/f/4LFfS8Kdn0sSzGkDIhlg9d30SG2qIl72E=;
	b=HH7wRnnE2HQsqF4NEcl4JKSWaNj0sO1fk09N8Wip+aBmJzICBHZmuKV3CSM4MQcYyO
	eHqiLnUUD+Ixt/taS0OS5cZf4RSrYszlY6PuDFqPBqMtr5gn60GAgmow+J/Gvn+tRlam
	i/83mXPPTOHOJJpNXNc9lsU5Q2FpVZZwWu7PCMLGDj+9tem3e1sm8yuiThLwE/hEvZt6
	/ronGL+qnhgsfNEk6priFiwzaXHQcmXIAq6CV/clmwhx7Bw1B0yBUxEnw5pDF8njr8sw
	XkdXy5QnpJr5G7+RbMQipT7UvMhq75KyNL5mjg+H9DznPB/vsueDAgDdrDPUUq/ZwXxS
	J5MA==
X-Gm-Message-State: ALoCoQnRT7XvpJOM/T5atI55dBgXogskUIMA+qvhTDL5+6t+0CtifebKXLrofQcLkG2RmWjIQuLj
X-Received: by 10.224.103.194 with SMTP id l2mr2904442qao.93.1411504864573;
	Tue, 23 Sep 2014 13:41:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 13:40:44 -0700 (PDT)
In-Reply-To: <1411504641.4189.2.camel@ted>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
	<1411504641.4189.2.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 21:40:44 +0100
Message-ID: <CAJTo0LZCcE0PysOXErBHaoyOU=izE88MkS5tLNB1q1ZGuijiiw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Tue, 23 Sep 2014 20:41:08 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 21:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I think there are a few issues here. Firstly, this postinst can run at
> build time which means there is a dependency on texinfo-native. I guess
> if this fails, it will just run on target so its probably "harmless" but
> not deterministic. Secondly, anything installing an info directory
> really needs to update the dir files with its own postinst. For optimal
> handling at rootfs time, that will need trigger/intercept support.
>
> So this probably can merge as it improves things however we need some
> enhacement bugs opening related to this, we may want to force the
> postinst to run on target for now so things are deterministic too.

There's a texinfo.bbclass which all recipes installing info files are
probably inheriting anyway, so moving the postinst there should solve
the race on the directory.  That class says that texinfo-native is
assume-provided but you'll want to check that usual configurations
ship install-info alongside makeinfo on the distributions we support.

Ross

