Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15A1260800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 19:50:47 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id q11-v6so16011627oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PN+S6lemzfKAC/i1XX1N4GFrsMTlvNgFxdi25TaHn1o=;
	b=E8TVelFcPsIRY6zcJ5KQvqAelrVQOU1sm8Mmmz/7kWMQW5ytivfOqENMOc6yu2r7wF
	xWYm96TkfIUMB3c4bW7qPl/8LZt1cWCvdS/SBS7M23DNJQU8VNhNHKGSZaUXVWVP+Dbi
	VJcJb98CNvBIfNs8WEzZh/B3Bfo6Q5+CYx3E3s89jZuzxvrXp2XZz9/UthyBs3MERmtT
	DIYAc9hGj6kt1Qe0sZpCvoH3Yc1vrtGAITiMiWfroUNaU5wWs/bn8O22O1pdsF6IgkeV
	I4y0IBuwmAGTUTlx/8RuxDpmmtjCYJAS9gbbfmO7fhK39LqOfsGTO2M2Y8QteJliBXVG
	TePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PN+S6lemzfKAC/i1XX1N4GFrsMTlvNgFxdi25TaHn1o=;
	b=kdOVSGXEfTaGf9EAKDdbQAKkyUEPWUalpXs2l038m1kWj09WLfdS0pZyUM4IoriOJG
	BoV4HFdkr9a+Qbg71nezS7yJ/EX/OTTDPBQ5s5jfR5XXFzoMNsrowIE7R3ksKUe/0vW9
	/0LsuMCG+7V3xpTUeUcLpOP4cEt0cK/JAzALGxpnbKi9ST2T/DkZVl0PqWEbIcXBgK98
	xYSk5/4XrhdG+P+A/O6tU/Hijf22TMzh6pe18CmN813yS1x5I7t3h91WXPUprTqrcc2N
	hAejVNISgTfk0qtSBzVhmgiArB97BDhSf4/RAU512o/NqQynPpVzvsGGO5x+N3/3yONI
	AlhA==
X-Gm-Message-State: AOUpUlGIPdL1Yql7mOSOQKUxDoFenH7eV/iETfJufMfh9L4hsH6e4J+/
	RSUytu+XXUFltGmVHJqXBHVMv8nzKhi8nHui8CKmMw==
X-Google-Smtp-Source: AAOMgpd8LzWjwNSzDK2IDdjZeZSG1oMzdkGqvNbDUMRpfqPwiewcjv58arFmA550qlduJO7qlpi8APTl1fVJQBMzlEs=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr5081401oib.115.1532548249093; 
	Wed, 25 Jul 2018 12:50:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 12:50:28
	-0700 (PDT)
In-Reply-To: <20180725183529.4478-1-JPEWhacker@gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 20:50:28 +0100
Message-ID: <CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 19:50:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 25 July 2018 at 19:35, Joshua Watt <jpewhacker@gmail.com> wrote:
> -    cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
> -    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
> +    try:
> +        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
> +    except subprocess.CalledProcessError:
> +        # Is this really non-fatal?
> +        pass
> +
> +    try:
> +        subprocess.check_call(['kconf_check', '--report', '-o',
> +                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
> +    except subprocess.CalledProcessError:
> +        # Is this really non-fatal?
> +        pass

CCing Bruce for his feedback.  Either one or both of these calls can
fail without it being fatal which should be documented, or it
shouldn't be catching the exceptions.

Ross

