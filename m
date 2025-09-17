Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4795CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:47:01 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.18897.1758102419184673778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 02:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bFENKeBY;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57735c59c47so660651e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758102417; x=1758707217; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+1K51ZU5LAh47gs0brrhFw9TfBEMSk3IVhTdsd848A=;
        b=bFENKeBYRFndTLbs/ME9Uo2QeuIVBKk4Yjg4roLjO57owrQFnRaKsuvcaPJh4tcpJH
         aXOUSF4gGOLTHVZW3RwNaCd7WZ9V1aHrgk3KPNB7529Yu+xZWFGV/mcDInfr9rcYgetD
         1NpZbJVPHQGqtBNBovYn68vjjcILRnZtqjqLV0I3u8nJcMk6mGHg0cZ0+VkP96u1JmfN
         MXB7n0lV47THvE/MGiaYsZd564+/XWjYynKZ+1lmcweTw1WcpThNtoVehNVY6/nQCz0y
         HnqfBRArg9Xc+eP9hIdzjqKxt3VCMVZhQJcNxyw0zJHTaHuZBBmsua/kuxoanEG2+2I8
         8jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758102417; x=1758707217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+1K51ZU5LAh47gs0brrhFw9TfBEMSk3IVhTdsd848A=;
        b=I8IOwyNd4z9LBjRDWRFRdvNwx0vo2Vl3F1iaP2IDcQcHMXLO4+2jbvHxJ0iGZpuYho
         G51Wm+28GWefbJ0X9phfmM++JLAzE7zUL9ME4kSIVwM3TdEeuqAPLVJ0pbRa5awAA/Bf
         u86Iw4IaGJNGt7/oyzE6d7kiY68tUPGF7sdWZfbkCIIymXK1beS7WmPIp/DW3FxUlDV8
         y/GzmMJhFxnPV1V/OTB6ZkYMohr/Mr5oFjfxDzVjJznUIvELsLSZzn+2B0aKIL/r3WCS
         Ek06AyaXIJDyyRRPnG47/fVXXM992O86NAPlWl/TXnHtDWo4Tv6Iwj1+1+/8nHx0gRjh
         SVHA==
X-Gm-Message-State: AOJu0YydEVHlCW6qZyarh3Wh1+ELVDZTxSSqfpTxDgzeWJbICRFo5EhB
	1QLEnXMOZPE/u+ryHFTavxpaqKtOOKkFqbhidAPIdwPrnJR8b/jyOTliV7n42J6avwQ=
X-Gm-Gg: ASbGncvDO/y6Yh3S4JTgfVaf8BRGQbS2zTomPpnD55mugDWmrnJWqsXHXZ2ax4roqRK
	zjHo9J/F5IxYUDTE7rbcpUiSTN4u+216o008KhfOOp31ej2a2mlbfwGqvNg77tBzkr2e4tkoKbx
	dA5qIrC9nAEBH6BZeeqh79iGkYlji154ACpYfPOrz55OG+ym+JqYcU9+45ofUQtjldAVR9GdbT5
	6yioiCa9IfSJTrjXpYeNtP9ExeNgj7kYoUFNRn+TEB3ybTtSjj5ZwOpH7wRkviq6oxIW+fEgW4V
	DvuPYK5gvORUpiDEkAHlo/77Jiu1NGCZg73TWwRpNMYvi3RrT+SnxeSqwl7dOQWTTmzCILyvD6c
	vSk+uKia7Eu1ewgr7wpa8LzilSgW8a77aHJjbBbU2CTLj7vT7PQVdYj0HQ0EFoQy0jg==
X-Google-Smtp-Source: AGHT+IEiVf5BocePx7D/8d60rUKFRBKFKzcmG9aE+uc2bVaEYVG4uCHOxNTLHlIcPPJcvcLlSbXhGw==
X-Received: by 2002:a05:6512:1319:b0:55f:4485:9620 with SMTP id 2adb3069b0e04-5779ac2a34amr504075e87.51.1758102416950;
        Wed, 17 Sep 2025 02:46:56 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6041sm5155016e87.10.2025.09.17.02.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:46:56 -0700 (PDT)
Date: Wed, 17 Sep 2025 12:46:54 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: barne.carstensen@danfoss.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
Message-ID: <aMqDjoK4oj_m0-04@nuoska>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916122517.1965-1-barne.carstensen@danfoss.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223589

Hi,

On Tue, Sep 16, 2025 at 12:25:22PM +0000, Barne Carstensen via lists.openembedded.org wrote:
> Copy all the parselogs-ignores file so that they are always packed into the testexport.tar.gz (even when testsuite parselog is not selected)

This hints to the old behavior of testexport which was taking into account
TEST_SUITES variable. This is no longer the case in poky master branch.
All tests and related files like parselogs ignore lists are copied
as is to testexport tar ball, and from all enabled layers.

> Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
> CC: randy.macleod@windriver.com
> ---
>  meta/classes-recipe/testexport.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
> index 843d777e3b..2f473a8811 100644
> --- a/meta/classes-recipe/testexport.bbclass
> +++ b/meta/classes-recipe/testexport.bbclass
> @@ -79,6 +79,7 @@ def testexport_main(d):
>  def copy_needed_files(d, tc):
>      import shutil
>      import oe.path
> +    import glob
>  
>      from oeqa.utils.package_manager import _get_json_file
>      from oeqa.core.utils.test import getSuiteCasesFiles
> @@ -120,6 +121,11 @@ def copy_needed_files(d, tc):
>                      oe.path.copytree(src, dst)
>                  else:
>                      shutil.copy2(src, dst)
> +    
> +    # Copy all parselogs-ignores files
> +    parselogs_ignores = glob.glob(os.path.join(corebase_path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-*.txt'))
> +    for f in parselogs_ignores:
> +         shutil.copy2(f, cases_path)

This does not seem right. The lines just above should copy
the path "lib/oeqa/runtime" from all enabled layers with
oe.path.copytree(). Thus it should not be necessary to copy
parselogs files separately using a glob.

Can you try again with master branch without your patch?

If the issue still is there and parselogs files are missing
from testexport tar ball, is the layer in question not enabled
for building in BBLAYERS?

Cheers,

-Mikko

