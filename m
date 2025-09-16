Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20ABCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:10:05 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.19538.1758028202200559826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 06:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=r4VgCiTI;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f74c6d316so5425131e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758028200; x=1758633000; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJw4H6CPpcUeXTCAVZNsiO0ne/81eNsgnO1aM0EyeU4=;
        b=r4VgCiTII5mivDchQgTFqXQNBZNXTW5aN9+M+F4No3tyCnNYK+LyK9SCkvx7Gpv8QE
         JRyW9ftYI+Dl/+ulw0YKgYLo1u0Ko8Yi3OdlgAfQyHexpI/PxUfHxMgfLueZMNLsw6qp
         R57K9qPuIHaFi6Yvtbo/JUoRK2MXD5AmLJP9T4G0IOTbMJ8lbO88GNBet6XzYYKgZL3A
         Y5B8rshO6bA+u1GhwkIrsDgxz6ost0f/7H/YxmWHsAOS95YY0yxV+wd+LpMCMDd7tXXZ
         td36OHqEPey/LNkJnU5ChpEVA3FCJg5BvtYXqgErr/YvOwgW4QCsIHsUamTt/TqnlpI0
         Pg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028200; x=1758633000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJw4H6CPpcUeXTCAVZNsiO0ne/81eNsgnO1aM0EyeU4=;
        b=CMNpx4VufPwz71xxv4xzttq14tTxtkmzpvYQSEWhW25tSrNwYfDvQDiAGgggjS8cJn
         HtfLL0BbSglzIoIdCzT+kHXct90TWIwBsGHpwOnqLywtDtN7iNNqVZZ0PnqXTA9OgTEh
         fZGsHQkhoYVyAw6TRPXhO6FrAhq3rdYPFr/eIH5CjOcl1KBzOtT4gDAY8AFTLuoXqgpx
         g+h5cT8eWH+1RzZxO+/JOnRwdIS8vBC15jn9+CzuOpeEHCZbFVv9WjAxw5ApsTWbrq2W
         OcDlTRJDw+6DmOtVUBWff31wEg5fKz5MePZj0+0pfMUG5wYwI3Q0qtwb3lro2yBnmHKa
         DK+w==
X-Gm-Message-State: AOJu0Yxn0oxboIjWAAuW7Dqn8WMcCCZBQoFMXS6HrxoE9/q5yJrunBzD
	Ce6F2/8BwexsH4lvShB+r7Z25dI55dXmuD+7vUCclXB+3cTcmRxEKLJFmBPR74WNH9A=
X-Gm-Gg: ASbGncv/SygoaJFXlK5FbKk2erdsJDO1IwmuuktHkZzMtDAB+FIxx4F1fPOw41hX2a8
	mv/1vqbb+EZNR4dQHH4DmcJUqT4tuyhtwMNa0vNiibEhN+2EjCO3VfgCDxWeYatlV/JFByzBPlf
	rEJ2U8P9+djGG3HcQSR7vmEmFsARYs7RKJWrz6UQScgpx4cNJVBU7S85wxfWbGH8gslI6gbCicB
	fgbTRvzB7mCy0YQF1ptINplVudr9335qE1Qda3itRLJCroRnMR2IR7yK7weE3SG/xwrqYs/DuMv
	tP/W2toQegASLMGHBI/4oJlYstFAOhQHHIjZwqouXcLbozzd0wlkl2OOwcyXsH+VmkixsG8dv+n
	PU6pGgaZzJdqYNVuwwrExBKYc1DwA6Q6TEMT5i5x2Ffcgo93KM0jV6aw=
X-Google-Smtp-Source: AGHT+IF1Noma1OsCabR2+hhgI4QsJx6VAVVEBocCH55fbnZEYuTAs54guZc3MeUD7A+EjAf8xpaa9A==
X-Received: by 2002:a05:6512:60e:20b0:55f:3b94:2119 with SMTP id 2adb3069b0e04-5704e34ed17mr4873338e87.45.1758028200216;
        Tue, 16 Sep 2025 06:10:00 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-573c8330eb9sm2001527e87.60.2025.09.16.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:09:59 -0700 (PDT)
Date: Tue, 16 Sep 2025 16:09:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: barne.carstensen@danfoss.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
Message-ID: <aMlhphz68u8txu5r@nuoska>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916122517.1965-1-barne.carstensen@danfoss.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 13:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223550

Hi,

This is not for master branch and subject line should be
something like "[branch name][PATCH] testexport.bbclass: always capture ignore files"

On Tue, Sep 16, 2025 at 12:25:22PM +0000, Barne Carstensen via lists.openembedded.org wrote:
> Copy all the parselogs-ignores file so that they are always packed into the testexport.tar.gz (even when testsuite parselog is not selected)
> 
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

Master branch is quite different. There the tests and their data
files are now copied from all enabled layers, not just core.
So I would rather port those fixes to relevant branches to avoid
duplicating maitenance.

Cheers,

-Mikko

>      # Copy test data
>      image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223546): https://lists.openembedded.org/g/openembedded-core/message/223546
> Mute This Topic: https://lists.openembedded.org/mt/115271587/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


