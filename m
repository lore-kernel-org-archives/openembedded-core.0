Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.5427.1630253922231862507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 09:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WrGYUoH7;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id mq3so7851163pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Aug 2021 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=jvOo6WQ4tPABaTqAimRAX6CS5Q95amHugz6YkC4JETI=;
        b=WrGYUoH7iV5Jyg/hg+u6Q1/dmSBNrXptkQXv2lkW5d7pJ46TMQu9WEgZ0C8Y9qO/7c
         gOb1rw+jyPXsxGjt4ffxc9COIL+w5/qJ/LkaPmuzl4KfGZj3WcY2fwqvicY0nQjVGNIZ
         sJqteUpbg1dvmEK+Z/P3uVanZyxqVmXapMmQbx17sd5nXcWFYME2E5yKR3pnMyhVo2RE
         IVeFdpBeQKSAycybfwwWLParb4mKGsT0xEJbcOW7DLzqyaHoPzJ2eoMphNFDe6rkmZ7K
         5UkRitetpqRX1SfCJ4Og+uomj56GfmL3iNhKQtXFD6UhPJ5DoC6wZE9TshyiQW6Bjlec
         uSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jvOo6WQ4tPABaTqAimRAX6CS5Q95amHugz6YkC4JETI=;
        b=H29zLpeYL6KXoAqQtS3dstYBam6sVA3c3KB1HNcrr+ebQga/Pl8FzZCC5sI5NtoetP
         QZimAajARFelZnyUJFAgpe0sHyyXMYksBgz0x9iKmgJ9vKVP3Bb/rlJHMKsmqAoxDOre
         PjikOfvD7QH+U6BpQMMcfKifeQezd1HgFU3JuyTsjCceeoGXmfL5Bim1H+y9X0hRvIGD
         Z+jSeh3Mp9OTjCI6r5bxkYcZBQOcJoHir1N73RhV7W9FmQRTHW3w/cDy9iQd/0CAixAB
         0KVdnHb2fKdhzL/2R8p58Si5iSvP4ewSYBba8SrmUfSZcxlHPFFYmrVHALZ6k0/J3/B0
         dA8w==
X-Gm-Message-State: AOAM533QFjP6hH8hOwCPNTtjHNGRLtlwUktdS+dRT7FC+6XKH6psLxoM
	fwp4//77utfCzcI/E/Qg2gw=
X-Google-Smtp-Source: ABdhPJyM/2p9tq/X+UCuAH9JZokFVisDgYcKS7DXcDwUuZrN50BN2fRJGOWcpzXdEX8HMkuYiXZmNQ==
X-Received: by 2002:a17:90a:4894:: with SMTP id b20mr22628559pjh.13.1630253921461;
        Sun, 29 Aug 2021 09:18:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:f5c4:30bc:bcdc:7d1f? ([2601:646:9200:a0f0:f5c4:30bc:bcdc:7d1f])
        by smtp.gmail.com with ESMTPSA id t15sm13559612pgk.13.2021.08.29.09.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 09:18:41 -0700 (PDT)
Message-ID: <6624b30c-ff7c-8772-9363-2ef19ce97996@gmail.com>
Date: Sun, 29 Aug 2021 09:18:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [OE-core] [PATCH] glibc: fix create thread failed in unprivileged process
To: hongxu <hongxu.jia@windriver.com>,
 openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
References: <20210829135235.43999-1-hongxu.jia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210829135235.43999-1-hongxu.jia@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/21 6:52 AM, hongxu wrote:
> Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
> and clone3] applied, start a unprivileged container (docker run without
> --privileged), it creates a thread failed in container.
> 
> In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> 
> As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> 
> [1] https://man7.org/linux/man-pages/man2/clone3.2.html
> 
> So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> fix the issue.
> 

I think this is application issue so perhaps should be fixed in 
container runtime and not in glibc so fixing glibc here sounds to be 
wrong approach. You probably should disable clone3 wrapper completely or 
via tunables when launching the container runtime maybe.


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...d-failed-in-unprivileged-process-BZ-.patch | 79 +++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.34.bb         |  1 +
>   2 files changed, 80 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> new file mode 100644
> index 0000000000..3283dd7ad8
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> @@ -0,0 +1,79 @@
> +From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sun, 29 Aug 2021 20:49:16 +0800
> +Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
> +
> +Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
> +applied, start a unprivileged container (docker run without --privileged),
> +it creates a thread failed in container.
> +
> +In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> +__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> +
> +As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> +CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> +was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> +
> +[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> +
> +So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> +fix the issue. Here are the test steps:
> +
> +1) Prepare test code
> +cat > conftest.c <<ENDOF
> + #include <pthread.h>
> + #include <stdio.h>
> +
> +int check_me = 0;
> +void* func(void* data) {check_me = 42; printf("start thread: check_me %d\n", check_me); return &check_me;}
> +int main()
> +{
> +  pthread_t t;
> +  void *ret;
> +  pthread_create (&t, 0, func, 0);
> +  pthread_join (t, &ret);
> +  printf("check_me %d, p %p\n", check_me, &ret);
> +  return (check_me != 42 || ret != &check_me);
> +}
> +
> +ENDOF
> +
> +2) Compile
> +gcc -o conftest -pthread conftest.c
> +
> +3) Start a container with glibc 2.34 installed
> +[skip details]
> +docker run -it <container-image-name> bash
> +
> +4) Run conftest without this patch
> +$ ./conftest
> +check_me 0, p 0x7ffd91ccd400
> +
> +5) Run conftest with this patch
> +$ ./conftest
> +start thread: check_me 42
> +check_me 42, p 0x7ffe253c6f20
> +
> +Upstream-Status: Submitted [libc-alpha@sourceware.org]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
> +index 979f7880be..97101994e8 100644
> +--- a/sysdeps/unix/sysv/linux/clone-internal.c
> ++++ b/sysdeps/unix/sysv/linux/clone-internal.c
> +@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
> +   /* Try clone3 first.  */
> +   int saved_errno = errno;
> +   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
> +-  if (ret != -1 || errno != ENOSYS)
> ++  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
> +     return ret;
> +
> +   /* NB: Restore errno since errno may be checked against non-zero
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> index eafc0216ff..6dc315c349 100644
> --- a/meta/recipes-core/glibc/glibc_2.34.bb
> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> @@ -57,6 +57,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>              file://0001-CVE-2021-38604.patch \
>              file://0002-CVE-2021-38604.patch \
> +           file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>              "
>   S = "${WORKDIR}/git"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
> 
> 
> 
> 
> 
