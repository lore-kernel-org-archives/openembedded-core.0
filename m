Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.102.1588000198769169282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 08:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fLDhXon+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id k1so21012202wrx.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wkNvNoylqFSv0Z8B5T2jl2Z6h91x5IdIBSjOedfr1hg=;
        b=fLDhXon+EaiLAiAcr5NzL1eQe1ls9bwVYlkfOH5z4vvbsDgbG6J+qXJdDif/wVyza9
         lL3H/ZZNSYQkLCMDQYY3kortfeLejx2VwPVFTRdVmW87EgNlBLPZLEzdpFykfF7hlBy/
         l37lj/fMaK+BGFwVYI7bb6WTsjHEgDq+BqlxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wkNvNoylqFSv0Z8B5T2jl2Z6h91x5IdIBSjOedfr1hg=;
        b=QoILwHH4GsvpIDT4UZ/jbjAdqhEvqXYGFqFNzhLpRgRzx9zKW1kl+3rax1rwPwm6Jb
         7ojpMWeTBbMCi/aCGnSFe7C2VstTQodO5xlQo9UtZWiko5YbQqexzlc6GcQBkQnGxyWa
         Djwk4uwUz7h3CfHT9lCQnQPU2gtycyAwwjFEQKB75zho9lxqFw8qldAcFyZGNjzfIJEl
         nE6FuO8mPw7I66KrQz1xblZA5r49GdsUhH3XqEetJ3ZwAomse//JyyqcxObPgVxu2T8t
         3UnyO/VAR5sW5+TTiihw8Q7nYIZo/SS6HxqfbYixmyhzXSe3hOycF4CnjT+T/+v9yjt0
         +msA==
X-Gm-Message-State: AGi0PuZw62L3NH8ZdOCj7/eszhNLV3sAhHkys+PY+PYoCAIt6zMWnSIr
	BaGuJxSnyxymm1QHc2KXi8uO0g==
X-Google-Smtp-Source: APiQypI6ZzK+1E5bA52Tu/QghCojF6m5ly/fvOIvwyBJ8wqIhIpSYOvcUrINjLb70DYkreL+hGULjQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr27723307wrs.391.1588000197229;
        Mon, 27 Apr 2020 08:09:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u7sm17534213wmg.41.2020.04.27.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 08:09:56 -0700 (PDT)
Message-ID: <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rahul Kumar <rahulk@mvista.com>, openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2020 16:09:55 +0100
In-Reply-To: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-24 at 00:09 +0530, Rahul Kumar wrote:
> Source: git://sourceware.org/git/bzip2-tests.git
> Type: Enhancement
> Description:
> bzip2 now has a test suite available at
> git://sourceware.org/git/bzip2-tests.git.
> 
> This is a collection of "interesting" .bz2 files that can be used to
> test bzip2 works correctly. They come from different projects.
> 
> Some files are deliberately bad, and are use to see how bzip2 handles
> corrupt files. They are explicitly not intended to decompress
> correctly,
> but to catch errors in bzip2 trying to deal with deliberately bad
> data.
> All such files have a name ending in .bz2.bad.
> 
> All non-bad files end in bz2. And should come with a .md5 file for
> the original input file. The .md5 file is used to check that bzip2
> could correctly decompress the file. The original (non-compressed)
> files are deliberately not checked in.
> 
> It will by default test with the command 'bzip2', running under
> valgrind (if installed on the system).
> 
> For each .bz2 file found it is decompressed, recompressed and
> decompressed again. Once with the default bzip2 settings and
> once in --small (-s) mode.
> 
> For each .bz2.bad file decompression is tried twice also. In
> default mode and small mode. The bzip2 binary is expected to
> return either 1 or 2 as exit status. Any other exit code is
> interpreted as failure.

I did try running this on the autobuilder. There are a few issues.

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample contained in package bzip2-ptest requires /usr/bin/perl, but no providers found in RDEPENDS_bzip2-ptest? [file-rdeps]
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

also, the new license (GPLv3) causes problems:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814

Cheers,

Richard



