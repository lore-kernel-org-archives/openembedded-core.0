Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9766AC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:49:09 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.31712.1736808544083643898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 14:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LXGNSqxb;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-436345cc17bso35046995e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736808542; x=1737413342; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q+hZJsDjCDGEhtV4O+LdLQCT5o+Blw4xCMYR3F9k1w4=;
        b=LXGNSqxb1VQeDCmO44+5KlivMadkCxe/L3n6/tDEz1PBmtMLAZyqxG3fqnUEq99E0V
         Z7w6qEorCkcc+2PqWrWP0tS4ZrBdLemrKXQGgyXiGeMKeDaChhNb5q0b4SL5ZFSF0yzO
         uvjwZJY/igxrhZ3aIoqpdMH7eBjxLRNmXNO7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736808542; x=1737413342;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+hZJsDjCDGEhtV4O+LdLQCT5o+Blw4xCMYR3F9k1w4=;
        b=DseCQw5GpCXOHomih1fzpI/XK9m1t/ToRjEXnsJZrbY6HUN46Rk5UdsVCyFTFBEaxa
         SuWWq5SQ/143zfER7OpNiGWqyOZ5gISMpleUWdHVSDdQaM6YoTQwx4AU4hxE5c7UQiL6
         GMFS4S5VxDoOMmud03tBAazj15SRLXFnYlXdJfmxSSFH8yzRANJ/JVou9VRloqp2X2Xx
         t7+3Mqg39ndlfwCJUv7k539bmQFDrUUSVF5LAZr7ktet9Z4BtLp8Hgwpcn5sHI+kcQWX
         hbve04dMUnVfu7OdSqvedyXHzBvEIW6UKH4uycSQU3etLuXadsayAljxygGy1snYN9rf
         gk4w==
X-Gm-Message-State: AOJu0Yy5kHA3h5M3ZETqYhpB40JhPsByo9mY7jVieU95+gkZweA4Qk4p
	yJdz1pYWe1FbDSFjBTAxs/I3XV+KL1LCamelQXM1zaVVxNN8VwNFiXun6adns+wgMZvWgJgAYgQ
	U4mkEvA==
X-Gm-Gg: ASbGncsAp6ipxTBFKPxohBHiSZDDi+VrRsJsJlTuUvpXiVx0JBloSVuaLlje3AyVptw
	OG1bTskpZF9hczdJZ7nAKYdZaeswgHhpT+UHOLDyvyaRgkhoqT1MdiUoMCaK3hVeF594RcVMMC7
	eklRe5VJTpgNCZvGzJWgWQ5d2sgJ3DZ2sBNwjy2Oc1oSIP/uAb1UPzERDpZR3267DL1+1YAG43U
	iPaTrVJ8xsWIzSUMpr9l9qHARCQ2yD/4Y95GkE1QA/k3cI5yqHl89KHtUfJuYtdf1Uhy2ZiwXSN
	qZexVXz1nAsUF7pJ
X-Google-Smtp-Source: AGHT+IFxzAGGAW75+t8sptgSQcISTnVJSR2gXTsRYRTQtLgpEqXXU0CacgfVudtzuGSEP77Nl98XVw==
X-Received: by 2002:a05:600c:3143:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-436e26b9d45mr227629815e9.18.1736808541822;
        Mon, 13 Jan 2025 14:49:01 -0800 (PST)
Received: from [192.168.0.27] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc895esm154664645e9.13.2025.01.13.14.49.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:49:01 -0800 (PST)
Message-ID: <2cd31e17-b72a-4535-8454-c8568e362ec4@smile.fr>
Date: Mon, 13 Jan 2025 23:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH] Sanity test for cpp toolchain
To: openembedded-core@lists.openembedded.org
References: <20250113204447.14948-1-gavrosc.ref@yahoo.com>
 <20250113204447.14948-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20250113204447.14948-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 22:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209766

Hello Christos!

I agree with Randy, this is a good start :)

Le 13/01/2025 à 21:44, Christos Gavros via lists.openembedded.org a écrit :
> Some users have reported issues which were caused because they were missing the right libstdc++-version-dev in their system.
> A new function with the name 'check_cpp_toolchain'  was added in sanity.bbclass in order to verify that the host system can compile and link successfully a 'hello world' c++ code.
> In case the test fails , the build will abort
> Fixes [YOCTO #bug-15712]

Patch messages are usually wrapped at 75 characters
Like in
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
but we did not document this rule...

(This is loosely enforced by patchtest that starts complaining at 200
character lines)

> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>  meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index 7b8a497d5a..ca7f8117d6 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -780,6 +780,44 @@ def sanity_check_locale(d):
>      except locale.Error:
>          raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
>  
> +def check_cpp_toolchain():
> +    # it checks if the c++ compiling and linking works properly in the native system
> +    import os
> +    import subprocess
> +    from tempfile import NamedTemporaryFile
> +
> +    try:
> +        with NamedTemporaryFile(delete=False, suffix=".cpp") as cpp_file:
> +            cpp_code = """
> +            #include <iostream>
> +            int main() {
> +                std::cout << "Hello, World!" << std::endl;
> +                return 0;
> +            }
> +            """
> +            cpp_file.write(cpp_code.encode('utf-8'))
> +            cpp_file_name = cpp_file.name
> +
> +        output_binary = cpp_file_name + ".out"
> +        compile_command = ['g++', '-std=c++17', cpp_file_name, '-o', output_binary]
> +        result = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +
> +        if result.returncode == 0:
> +            #os.remove(cpp_file_name)  
> +            #os.remove(output_binary)
> +            return False
> +        else:
> +            bb.fatal(f"C++ toolchain check failed during compilation or linking. Error:\n{result.stderr.decode()}")

If I understood correctly bb.fatal() here will prevent other sanity
checks to run. The idea is to do as much of those checks as possible.

You can reuse the pattern seen in other checks:
the function either return an error message as a string or None. And
then, calling the function like this:
  status.addresult(check_cpp_toolchain())

> +            return True
> +    except Exception as e:
> +        bb.fatal(f"An unexpected issue occured during the C++ toolchain check {str(e)}")

s/occured/occurred/

> +        return True
> +    finally:
> +        if cpp_file_name and os.path.exists(cpp_file_name):
> +            os.remove(cpp_file_name)
> +        if output_binary and os.path.exists(output_binary):
> +            os.remove(output_binary)
> +
>  def check_sanity_everybuild(status, d):
>      import os, stat
>      # Sanity tests which test the users environment so need to run at each build (or are so cheap
> @@ -975,6 +1013,8 @@ def check_sanity_everybuild(status, d):
>          # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
>          if '/dash' not in real_sh and '/bash' not in real_sh:
>              status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
> +    
> +    check_cpp_toolchain()

See above comment about calling status.addresult()

>  
>  def check_sanity(sanity_data):
>      class SanityStatus(object):

If you need help implementing the recommended changes, don't hesitate to
ask here or on IRC :)

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert


