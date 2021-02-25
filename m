Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
 by mx.groups.io with SMTP id smtpd.web10.4816.1614212943811232482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: electromag.com.au, ip: 203.30.46.145, mailfrom: preid@electromag.com.au)
Received: (qmail 4243 invoked by uid 5089); 25 Feb 2021 00:28:51 -0000
Received: by simscan 1.2.0 ppid: 4211, pid: 4212, t: 0.0753s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Return-Path: <preid@electromag.com.au>
Received: from unknown (HELO ?192.168.0.22?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 25 Feb 2021 00:28:51 -0000
From: "Phil Reid" <preid@electromag.com.au>
Subject: Pseudo Abort errors
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Message-ID: <6b813e24-a48e-5b92-fd26-4f1bd31a8bbd@electromag.com.au>
Date: Thu, 25 Feb 2021 08:28:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit

G'day,

Not really sure where to look for this. But started to get random build failures
with the pseudo client.

Failures are contained to populate_sdk

Not always the same file reported in the log and removing tmp-glibc before the build solves the problem.

I've also tried a psudeo_git.bbappend with:
SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"

Which looks to be a pending commit on the list.
Unfortunately it didn't help.

Here's what I think are the relevant parts of the log are below.

"rm -rf tmp-glibc" and a rebuild resolves the problem.


Any thoughts?



-------------------------------------------
One failure:

abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

relevant pseudo.log:
path mismatch [1 link]: ino 2045493 db 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sstate-build-populate_sdk/x86_64-deploy-emit-image-int-populate-sdk' 
req 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sdk/image/usr/local/emit-x86_64/sysroots/cortexa9t2hf-neon-emit-linux-gnueabi/usr/include/php/main/php_output.h'.
path mismatch [1 link]: ino 2045493 db 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sstate-build-populate_sdk/x86_64-deploy-emit-image-int-populate-sdk' 
req 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sdk/image/usr/local/emit-x86_64/sysroots/cortexa9t2hf-neon-emit-linux-gnueabi/usr/include/php/main/php_output.h'.



find tmp-glibc/ -iname php_output.h -exec ls -la {} \;
-rw-r--r--. 4 cb cb 9642 Feb 22 10:55 
tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/emit-dsmain-rel/0.0+svnr52354_52332-r0/recipe-sysroot-native/usr/include/php/main/php_output.h
-rw-r--r--. 4 cb cb 9642 Feb 22 10:55 
tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/emit-dsmain-int/0.0+svnr52354_52332-r0/recipe-sysroot-native/usr/include/php/main/php_output.h
-rw-r--r--. 4 cb cb 9642 Feb 22 10:55 
tmp-glibc/work/x86_64-linux/php-native/7.4.9-r0/sysroot-destdir/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/x86_64-linux/php-native/7.4.9-r0/recipe-sysroot-native/usr/include/php/main/php_output.h
-rw-r--r--. 1 cb cb 0 Feb 24 02:12 
tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sdk/image/usr/local/emit-x86_64/sysroots/cortexa9t2hf-neon-emit-linux-gnueabi/usr/include/php/main/php_output.h
-rw-r--r--. 2 cb cb 9642 Feb 22 10:59 tmp-glibc/work/cortexa9hf-neon-emit-linux-gnueabi/php/7.4.9-r0/sysroot-destdir/usr/include/php/main/php_output.h
-rw-r--r--. 4 cb cb 9642 Feb 22 10:55 tmp-glibc/sysroots-components/x86_64/php-native/usr/include/php/main/php_output.h
-rw-r--r--. 2 cb cb 9642 Feb 22 10:59 tmp-glibc/sysroots-components/cortexa9hf-neon/php/usr/include/php/main/php_output.h

-------------------------------------------
And another one:

abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

relevant pseudo.log:
path mismatch [1 link]: ino 539813155 db 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sstate-build-populate_sdk/x86_64-deploy-emit-image-int-populate-sdk' 
req 
'/home/cb/build/workspace/soc-image-v2020.04/tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sdk/image/usr/local/emit-x86_64/sysroots/cortexa9t2hf-neon-emit-linux-gnueabi/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp'.
d


find tmp-glibc/ -iname recursive_lw_mutex.hpp -exec ls -la {} \;
-rw-r--r--. 4 cb cb 2100 Feb 24 09:59 
tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/emit-dsmain-rel/0.0+svnr52371_52332-r0/recipe-sysroot/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp
-rw-r--r--. 4 cb cb 2100 Feb 24 09:59 
tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/boost/1.72.0-r0/sysroot-destdir/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp
-rw-r--r--. 4 cb cb 2100 Feb 24 09:59 
tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/emit-dsmain-int/0.0+svnr52371_52332-r0/recipe-sysroot/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp
-rw-r--r--. 1 cb cb 0 Feb 25 02:13 
tmp-glibc/work/cyclone5-emit-linux-gnueabi/emit-image-int/1.0-r0/sdk/image/usr/local/emit-x86_64/sysroots/cortexa9t2hf-neon-emit-linux-gnueabi/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp
-rw-r--r--. 4 cb cb 2100 Feb 24 09:59 tmp-glibc/sysroots-components/cortexa9t2hf-neon/boost/usr/include/boost/flyweight/detail/recursive_lw_mutex.hpp









-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
