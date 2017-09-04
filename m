Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id C8C4F6059F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 20:11:09 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id t3so3696102pgt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lCcveHgEAM1eFIF5Ac3F8MwmQqHFpDZXcatLdEFHRgE=;
	b=OcfdZFXcmB+dnyHcPi1Wmyg1KQ3DDU6gx5ANeoLSFsg6kv5ZHciuLjLzQruc9z0sHE
	pkx37rEFU1wVmCFVhQjhqGjcUtfqdEJ+8xmsR5YKI7i8ViuKBF1MeSSVipTxQevnEbJj
	P0yjdF0NnSI/EOhukKVa6z9vF5DUwd3Hj5e6tRMGB11VSkw1KKqYmeVvdf2GaOeRkj5+
	gLebfk4/4yBpm+9BKou6cnQC0HxTxSItsuAlC2CKnP3p3LcQLagdy34SmlHU77QzOp7f
	/8xrc9xnE73Qm+k6xu4yzJsRN+9Yn4deX4YPSMvkciS0S1I+o8lMncvl4cxBmCa622/E
	hVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lCcveHgEAM1eFIF5Ac3F8MwmQqHFpDZXcatLdEFHRgE=;
	b=aL0ixUlR/T3fRXuayNe5pfUnaaQO8tgvJ+6AyJNiIEuyZ+LK81sodrfJfCiQmujG6o
	KdopHj4lXiNEz9jiIkssgk9f518phalb0pM3zXL3nG/C/6mIaAcRvwFXnEcFoy9nvNt3
	wVQDrbxtJ2vLrxGTi9udGeZc2VFXl0SwoThBRBxgN1YbHm85/bG3kfPy50DTe8Ut5NHK
	Mit7TaU/9k2aH6JaHdObcFeVm++nxRiW5tZPjbpeKmnNTc9qrpmw+ozvoi75T4PzryVR
	NhaD03sUKbRRcVCXzLhFQQf8w6l84fSJVqRCNTWJZita9VC+0QyQSyLsofoXZVvEo1Pl
	q2gw==
X-Gm-Message-State: AHPjjUiJ2uzg9U7dJR93XDZsX+BkFxzMmahywJSjwC28ZvDC8szoHLGq
	syUZCCM6s6AeHIj69Tr6NWQCBHltWQ==
X-Google-Smtp-Source: ADKCNb4RzjJMcLNji5e56ti0qlirYVQdV4PdS1NsopueneXez26C2mwcUBDLh3APBwFAzS51RNvSZaLqK+jcUuDq5eQ=
X-Received: by 10.98.76.69 with SMTP id z66mr1450446pfa.151.1504555870933;
	Mon, 04 Sep 2017 13:11:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 4 Sep 2017 13:10:40 -0700 (PDT)
In-Reply-To: <20170904051224.37668-2-jose.alarcon@ge.com>
References: <20170904051224.37668-1-jose.alarcon@ge.com>
	<20170904051224.37668-2-jose.alarcon@ge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2017 13:10:40 -0700
Message-ID: <CAMKF1srd9CWxX7gxAUfNxjw6kkk_bcLoVr6UZqGeD8v7FWaTQQ@mail.gmail.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Mon, 04 Sep 2017 20:11:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 3, 2017 at 10:12 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
> The do_rootfs log contains a number of unsatisfied package
> recommendations. At the moment those are only visible when
> reviewing the rootfs log.
>
> This patch adds an extra check to surface any unsatisfied
> recommendation  as WARNINGS to the build output.
>

I think a note is more appropriate here.

> Enable this check with:
> ROOTFS_POSTPROCESS_COMMAND += "rootfs_log_check_recommends;"
>
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index fb36bad..f6d31a0 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -307,3 +307,15 @@ python write_image_test_data() {
>             os.remove(testdata_link)
>          os.symlink(os.path.basename(testdata), testdata_link)
>  }
> +
> +# Check for unsatisfied recommendations (RRECOMMENDS)
> +python rootfs_log_check_recommends() {
> +    log_path = d.expand("${T}/log.do_rootfs")
> +    with open(log_path, 'r') as log:
> +        for line in log:
> +            if 'log_check' in line:
> +                continue
> +
> +            if 'unsatisfied recommendation for' in line:
> +                bb.warn('[log_check] %s: %s' % (d.getVar('PN', True), line))
> +}
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

