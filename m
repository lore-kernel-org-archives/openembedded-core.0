Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EA8C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 21:18:56 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.33738.1736975928670407057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 13:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lsq5ZX2i;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-385deda28b3so214895f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736975927; x=1737580727; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vYZTfElf6u3Uh1StonJ8HyOOgc7VE8qyfizl7HqHvJM=;
        b=Lsq5ZX2iffmddxjn6w4/nU+zIiWWuvYlvSnljx0vOfwoS1jOK04KBQ8njqnk8OWixV
         XgidVFaOeNsvWKnoW5LN6DIdd47PeN+hRrXO9AI3RNAPyY0A4apZcGsjRPZ2xQ1SH61K
         eLJewCsIU67e1bLeCKPRM5zABm2GdReypZjuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975927; x=1737580727;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYZTfElf6u3Uh1StonJ8HyOOgc7VE8qyfizl7HqHvJM=;
        b=ByxjtzonHCLPc2OwLSZN/PdetQfJH36yXR1NL2VcoryzZ98nmx5p2tS4EH5uw0wufI
         t9z0NrLWvNhqnaoa18+8cxThQa6bvKp0uyufnDq3Asee2w4qrHuouSrfVYkNhklHGdc2
         ajm9A2stJDbUAh0+kOoKeper9nUZ1rEy2N2ZBqxFQxaegTHWmqHnpIh2be+Yms9GR7X0
         syB4vPtOWmxu6uFu+uHtK53vgZai8MDA+Q73PP5+bcyaFc7NccJ5CC3v4Pe+e7mxQnAR
         rwqBo9sl7FLTce3Zx0VrkuRk+gThGU6nUAVLjCWEu36SYg41cc+89nZtXOOrSJkL4M1x
         TFTw==
X-Gm-Message-State: AOJu0YzzdW50qx2Y3G4mJhblaL2bCg8cn/5ihBzibz7ZuMBVa5Y+LyPQ
	OX0QYpnSGI5DeV4fa4QVK/H2jqAvwNhhOAnEP+SFwPiGpAEpQuxQ1nDBhCq565tg1Dc7uok/1tx
	sM2eBLQ==
X-Gm-Gg: ASbGnctwPDRrBSqJxoQD1xWhQKQXiVb7q+TVxVKfrk+tyyI5AI6w5UqKmLshHRLuhix
	Q0QxchdyxnmxOWFwtfV7T8bA+5lJl+U9KblDZj0QlRgDxVmJVZr+UaX8Z+jLk3/YxsHkEJFqKZS
	HiSkG7YZ6aIg0GpsGHWXk5YeYB6il9ySZa5B+1qwrqT3bh2kGmEavnEf1e/XUT8GJLfJwrt8AaT
	dkxqoqN/60+W/NxtbTWxp6tTu+xdu1s0ci/nTX1fQJw5dboJA0hLFrISZ31hhV8QBrSUbdEb5rj
	3DeMGd+Gs2rhAKWEcNwvWxnFP8amS2k9ny1oIEg3c80AsC2DmFGf/0hOAK1j9mZBhZD4Qq787fU
	NLTYIa2i1zPhO8VOiyA==
X-Google-Smtp-Source: AGHT+IFy1gg7A97iXHYGKqzstG+t4QIE7wPp+4sRrezxZJ/SLCK7do8enE/Emjm2NMWVosUi72Dj8w==
X-Received: by 2002:a05:6000:4013:b0:385:df4e:366f with SMTP id ffacd0b85a97d-38a873318cemr30642406f8f.38.1736975926600;
        Wed, 15 Jan 2025 13:18:46 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:bdfc:82d7:e163:62a9? (2a01cb000deef000bdfc82d7e16362a9.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:bdfc:82d7:e163:62a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm18973196f8f.19.2025.01.15.13.18.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:18:46 -0800 (PST)
Message-ID: <21196336-ff3a-4881-9138-2d19740da777@smile.fr>
Date: Wed, 15 Jan 2025 22:18:46 +0100
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 21:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209929

Oops forgot something

Le 15/01/2025 à 20:39, Christos Gavros via lists.openembedded.org a écrit :
> Users reported issues caused by missing the right libstdc++-version-dev.
> A new function 'check_c_toolchain' added in sanity.bbclass to test linking libstdc++
> Fixes [YOCTO #<15712>]
> 
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
   ^^^^
I forgot to tell you that you have whitespaces here

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
and here ----------------------------------------^

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


