Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.9494.1622615525019214219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 23:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pecXir6c;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id u24so1508442edy.11;
        Tue, 01 Jun 2021 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=JMkOOeOoy4CuxN2fjwRuzI8VekuOxj1uEuaRO7FQr18=;
        b=pecXir6c6vt21yJX+HgiLJMYspsoK/aNOhpkS1JBet5wdOiGho0ABtyZlAecYFg+pB
         QE3Kd4UglRxLoo33W2GQaEYBtNBAomSEz+N5poTo9neRr+ruiSv82B56Khlbm2wUs19h
         40A5VY5enqIKTzkXVHzNOZdvr8f13kPMLzxg+XtVnxKCbRMExfpw0DjT34xySGYdThrs
         OsiqEmt0BBv9OzuiRYGUC3f0ilh33ITYs11nRVf3qajL6hPu9rDLpoEVVctUG6HP0ZI8
         +3JI186YrG8RE2Oshux3qC5o8W+9itDV2zOcqalLWF8w8qCdLoxS6Nh9Nzihi2i8vnR5
         REnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=JMkOOeOoy4CuxN2fjwRuzI8VekuOxj1uEuaRO7FQr18=;
        b=cLOsLrp8OC16sQ3zU/3veis5kkMxygvaAgk9ocneF8IpFb7fVWqkViufmni3zGIj55
         XFPkSbxil01pKfScOOupp0N3cXmGGo/ZMFCwmXMjgMPNNoNAh/hztGYfPZ9WItmt/0Lu
         DwyHpeIJ3b/9FS25Xlb2cGsNu4pv3PuohTsql0TWh50abfksS/+nVDY8wDX7BS4UTZr7
         2kStizXB/mZ9+vk/SrMVxMcYX8GBHUSE3ZnUDBUHkz84cxcrh5f1nKZn35hj6ilyUeqP
         H34u4wFWHz0Dic//2U0tkmivJGBmTl1v57KTqu32xcQ/TcpSBvhaPSVi2uEsgEzGkiss
         LgjA==
X-Gm-Message-State: AOAM531utsqhBea6BFrhnyPN/CiL1qbnCuWt/fS4YazVCHQiq0V2nyaf
	LfdNu/E6KpykzOuI2S5H0E5J/DjQQTSEA6XG
X-Google-Smtp-Source: ABdhPJwGw0ZkVdX5MmZtytLeOJ1kgWy4nJEv+2xNxocwARrBuBflvyEZjnsn7azRFng1/l2wFFKf4A==
X-Received: by 2002:aa7:c983:: with SMTP id c3mr14930733edt.58.1622615523418;
        Tue, 01 Jun 2021 23:32:03 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id v21sm670669edt.48.2021.06.01.23.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 23:32:02 -0700 (PDT)
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Subject: Fedora 34, shadow-native/icedtea7-native, umask problems ?
Message-ID: <a5983cc8-81e4-9947-d1c1-45791de79806@gmail.com>
Date: Wed, 2 Jun 2021 08:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I'm using Fedora 34 and OE-Core/Bitbake/layers from git master as of 
today, with reproducible builds. Sometimes when rebuilding my image I 
see sudden changes in file permissions (jumping back and forth) in the 
buildhistory output for two native recipes:

shadow-native: (OE-Core)
> -drwxr-xr-x -          -                  40 ./var/spool/mail
> +drwxrwxr-x -          -                  40 ./var/spool/mail

icedtea7-native: (meta-java)
> -drwxrwxr-x -          -                 120 ./usr/lib/jvm/icedtea7-native
> -drwxrwxr-x -          -                 800 ./usr/lib/jvm/icedtea7-native/bin
> --rwxrwxr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/apt
> --rwxrwxr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/extcheck
> --rwxrwxr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/idlj
...
> +drwxr-xr-x -          -                 120 ./usr/lib/jvm/icedtea7-native
> +drwxr-xr-x -          -                 800 ./usr/lib/jvm/icedtea7-native/bin
> +-rwxr-xr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/apt
> +-rwxr-xr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/extcheck
> +-rwxr-xr-x -          -               15016 ./usr/lib/jvm/icedtea7-native/bin/idlj
...

Before I start debugging them, does anyone have an obvious fix or hint 
for any of these ?

Regards,
Jacob
