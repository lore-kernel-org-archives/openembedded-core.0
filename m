Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C50C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 21:07:56 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.33438.1736975267204393537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 13:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sstj6xp6;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-385eed29d17so148268f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 13:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736975265; x=1737580065; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rE5UwvxM8xdOi7IbmS4zNgLS8hMXPoibPVfK2SXfxGM=;
        b=Sstj6xp6+8ri3aavAU+l0gntDylJhUTet9Ich5iKuljtfdmFZnIOYpUG4j8tqWfRup
         nkZpikuiPG1XKnzVd6d+QhqVtF0FYZ8b6ms8EIoUwoIjpCY6k7YSgc+4KF2TjJzXO1cU
         YSq+MHi/xta356fXePkq3NfbGSx6O+czVuwXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975265; x=1737580065;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE5UwvxM8xdOi7IbmS4zNgLS8hMXPoibPVfK2SXfxGM=;
        b=LxpGWAKTbLfNvNkiRkJeE+AExExo7uvrgGblaNcDkHd9SUiYc/ano5bIiiA5qUxoEt
         qAOm6D4bAsCJuOkiSHQOxJ/bhgU/6kYHjD1vOKwW46pD8pIZHRtBArkfhch/cpBfuB3g
         rNYlJAoXhYaJTy4JVNJa7+pO2QGItns0qNCMYWRr6aN6kyqoa9ExzzCETSIIDIaA2gPT
         8YjlX963NFuogtdua2EHy+f3mguAHoe2fuYoyX18UwVFXcpV9DMOAqUyHZQD9Vn5B6nS
         9vk9nJT+RcAT+XRaY1doU56CsJxBd7aML8lISxbR09qNcdBN5MifuV667al9LNHFCGYO
         ZUdA==
X-Gm-Message-State: AOJu0Yx3Sx4dskYobQMe3DA8Dr/OAOGl3oFyrS8owHeFBtk5NrhqB6gG
	I+N5IsXXyASADDl52b+V2y9UllerQerwti9Qxw+PRPkJSagSeGc91O+INbTBTl40FXWyOZgFKoh
	88ZJA7Q==
X-Gm-Gg: ASbGncskzNJ9wozXfZIQc4ngStYsnmdWyC1wK6UyZtXQnz2F284f2GsRajwhN37WbMX
	21RqgoC0/Cp+gQfFWRIU33f5k0fXuUzzBa07v5REIkOIV+8GB5KcTTJl90DSVOlVjq4fJFuXssl
	/RNE+5l6186TqnpN815iarrj6UZmd55xuGhd7IaHIyrfPu+mtSwcCxIonNfZMPKM8qP8DOFxkQK
	WfkxJRoFef7PKSif8NWVN5htPCL5OnQTa+TVnbteoQja0C4TU+ddFPnAbLL//D+CYe+pHFAAwkS
	JxVHQvcjbA9d8ZWDsnfi2w1eSvATp8XW+inJurL6G8373fB0P0UAZgVjVQLAnHdetGPNrR/jqHY
	oyJ/w4+YyiDgYxbWLlw==
X-Google-Smtp-Source: AGHT+IHUvWrCMtf5wS2XGMKlMaX1WBLi6TtgBSGi7QmenaTjS52TND8JGHsY8rEOUNCH4mXt0O8wdw==
X-Received: by 2002:a05:6000:1849:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38a8733df9emr30364640f8f.45.1736975264862;
        Wed, 15 Jan 2025 13:07:44 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:bdfc:82d7:e163:62a9? (2a01cb000deef000bdfc82d7e16362a9.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:bdfc:82d7:e163:62a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6179sm35650745e9.22.2025.01.15.13.07.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:07:44 -0800 (PST)
Message-ID: <69dd2cc8-0ec0-475a-a526-5b68325b4ddd@smile.fr>
Date: Wed, 15 Jan 2025 22:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] sanity: test for c toolchain
To: openembedded-core@lists.openembedded.org
References: <20250115193917.8133-1-gavrosc.ref@yahoo.com>
 <20250115193917.8133-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20250115193917.8133-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 21:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209928

Hi Christos,

This look like a solid v2 :)

Le 15/01/2025 à 20:39, Christos Gavros via lists.openembedded.org a écrit :
> Users reported issues caused by missing the right libstdc++-version-dev.
> A new function 'check_c_toolchain' added in sanity.bbclass to test linking libstdc++
> Fixes [YOCTO #<15712>]
Proper way to tag this bugzilla ticket is "Fixes [YOCTO #15712]"

See
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#implement-and-commit-changes
(or any of the previous commits including this tag.

Now, I notice that the patchtest message is a bit misleading.

With the tag fixed, you can add my reviewed-by tag:
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * use shortlog
> * drop the meta-oe prefix
> * fix format for bug reference
> * change function description including libstdc++
> * use BUILD_CC instead of specific compiler
> * lines in comments are removed
> * patch message less than 200 char
> * bb.fatal is removed
> * follow pattern of other functions in class
> * use docstring instead of # in functions description
> * make the print out message more clear
> * fix comment style where the function is called
> * change "hello world" from C++ to C program
> * use gcc instead of g++
> ---
>  meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index 7b8a497d5a..3a5a1f5d66 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -780,6 +780,43 @@ def sanity_check_locale(d):
>      except locale.Error:
>          raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
>  
> +def check_c_toolchain(d):
> +    """
> +    it checks if the c compiling and linking to libstdc++ works properly in the native system
> +    """
> +    import os
> +    import subprocess
> +    from tempfile import NamedTemporaryFile
> +    
> +    try:
> +        with NamedTemporaryFile(delete=False, suffix=".c") as c_file:
> +            c_code = """
> +            #include <stdio.h>
> +            int main() {
> +                printf(\"Hello, World!\\n\");
> +                return 0;
> +            }
> +            """
> +            c_file.write(c_code.encode('utf-8'))
> +            c_file_name = c_file.name
> +
> +        build_cc = d.getVar('BUILD_CC').strip()
> +        output_binary = c_file_name + ".out"
> +        compile_command = [build_cc, c_file_name, '-o', output_binary,'-lstdc++']
> +        result = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +
> +        if result.returncode == 0:
> +            return None
> +        else:
> +            return f"C toolchain check failed to link against libstdc++. Please ensure libstdc++ and headers are installed. Error:\n{result.stderr.decode()}"
> +    except Exception as e:
> +        return f"An unexpected issue occurred during the C toolchain check: {str(e)}"
> +    finally:
> +        if c_file_name and os.path.exists(c_file_name):
> +            os.remove(c_file_name)
> +        if output_binary and os.path.exists(output_binary):
> +            os.remove(output_binary)
> +
>  def check_sanity_everybuild(status, d):
>      import os, stat
>      # Sanity tests which test the users environment so need to run at each build (or are so cheap
> @@ -976,6 +1013,9 @@ def check_sanity_everybuild(status, d):
>          if '/dash' not in real_sh and '/bash' not in real_sh:
>              status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
>  
> +    # Check if linking with lstdc++ is failing 
> +    status.addresult(check_c_toolchain(d))
> +
>  def check_sanity(sanity_data):
>      class SanityStatus(object):
>          def __init__(self):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209924): https://lists.openembedded.org/g/openembedded-core/message/209924
> Mute This Topic: https://lists.openembedded.org/mt/110634330/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert


