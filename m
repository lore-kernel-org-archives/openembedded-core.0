Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.2809.1587631974591776418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QaiTg62u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id b11so5858303wrs.6
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wNyE8PDfJAyc939DJd9pJddXqZE/rj4d/KI18K4qkIc=;
        b=QaiTg62uTb1C48IqoBR/mEYm0cvNcrFGILU0r4INDE8nriTtctVKz+mfQWGrfRZq5t
         /o4G2ruF6pPevRhCDL0CypQ9g++x+QH+xeNJZqhmuUSS+fQWlJJna3Kfofhbfm9tDik5
         zSmn5fxZEux5N9HBWruCLa8e3ADd/5kzUUglI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wNyE8PDfJAyc939DJd9pJddXqZE/rj4d/KI18K4qkIc=;
        b=I8XmiKbyqKOSmFOMTNt9K9efzBUWiNkhEsm6Cdzl1XN/Bccj4yyq2ScQdCmwLm2BU8
         BD6jPpQPUhqLA0g7XxToK/ItUKT6OLBwV8uf2voz9+5d5yk+gwg7WVFd1GEMNKsoKp7M
         jMr2uwvjT/yjbipVEyWZn0msF44tKiuiyEmiAoa5cb4C8Ojhyw0/tDXXKs6hee0Qx694
         raoW7IT96BOl6v4F5YfnOCDlQqaCAofYnAu8GBEtRW7mocddXSAjfpPcpiTfe88Lfu1M
         ht3FbtDHpdWlM6uX6O+axuwZ8ISu51JSiOngfj+Jdfy05OS7nUloaybKmqobWrzUuSg9
         jdDA==
X-Gm-Message-State: AGi0PuatRnBpKWV5GY2FpJhfIOGZwsmhDltu5yyl98UEqnaOmY+42GN1
	CCKuG0x1kkzoRplx2DIhcVORMQ==
X-Google-Smtp-Source: APiQypLmmnGHgZsR0o7NYPrfoGKLN7GlPwrDINSxEUf/+5lUiASQ2uXDP6aZlpzPs+XiE9GCqCDQbQ==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr3984739wrn.38.1587631973235;
        Thu, 23 Apr 2020 01:52:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f8sm2736205wrm.14.2020.04.23.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 01:52:52 -0700 (PDT)
Message-ID: <38bd6d9fd2144ed8f5bd90da57c6dbd686d3c684.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Cc: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Date: Thu, 23 Apr 2020 09:52:51 +0100
In-Reply-To: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-01 at 13:37 +0800, Yeoh Ee Peng wrote:
> Add new testcase to check IMAGE_GEN_DEBUGFS. Test makes
> sure that debug filesystem is created accordingly. Test also check
> for debug symbols for some packages as suggested by Ross Burton.
> 
> [YOCTO #10906]
> 
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 33 +++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> index 5c519ac..9ad5c17 100644
> --- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> @@ -262,3 +262,36 @@ PNBLACKLIST[busybox] = "Don't build this"
>          self.write_config(config)
>  
>          bitbake("--graphviz core-image-sato")
> +
> +    def test_image_gen_debugfs(self):
> +        """
> +        Summary:     Check debugfs generation
> +        Expected:    1. core-image-minimal can be build with IMAGE_GEN_DEBUGFS variable set
> +                     2. debug filesystem is created when variable set
> +                     3. debug symbols available
> +        Product:     oe-core
> +        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> +                     Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> +        """
> +        import glob
> +        image_name = 'core-image-minimal'
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +
> +        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
> +        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
> +        features += 'MACHINE = "genericx86-64"\n'
> +        self.write_config(features)
> +
> +        bitbake(image_name)
> +        dbg_tar_file = os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.bz2")
> +        debug_files = glob.glob(dbg_tar_file)
> +        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated')
> +        result = runCmd('cd %s; tar xvf %s' % (deploy_dir_image, dbg_tar_file))
> +        self.assertEqual(result.status, 0, msg='Failed to extract %s: %s' % (dbg_tar_file, result.output))
> +        result = runCmd('find %s -name %s' % (deploy_dir_image, "udevadm"))
> +        self.assertTrue("udevadm" in result.output, msg='Failed to find udevadm: %s' % result.output)
> +        dbg_symbols_targets = result.output.splitlines()
> +        self.assertTrue(dbg_symbols_targets, msg='Failed to split udevadm: %s' % dbg_symbols_targets)
> +        for t in dbg_symbols_targets:
> +            result = runCmd('objdump --syms %s | grep debug' % t)
> +            self.assertTrue("debug" in result.output, msg='Failed to find debug symbol: %s' % result.output)

The test failed on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/858
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/855
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/861
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/849

Cheers,

Richard


