Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.15607.1595325296411675133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 02:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Abw6w/ks;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=g9pk=ba=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B9v8X0lf3z3t;
	Tue, 21 Jul 2020 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595325292;
	bh=UlSCbAEFUA6T2yljaixBsSgZ4/rjUXCULbVBN2S0wLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Abw6w/ksk7vhh2yESt7ApAbCg+uXgNhFhfmY76UNsMBvpUgvBqWFiU+PePXUt+Poq
	 2aqT0Je6PfLfkOuo8Kxt2pYwjT8NfTd64zGOa7zvUl/BjsuAoAYQTcKZ8VlDO14/F1
	 LKWZcLiDHqc0yInOyew5n13l9+S9lKY1LwufyWTLMKfKYXgx8vkJtK3KoUVMTRyRSv
	 36v8WR5hlJGiLpTPvZ5Asjt9RPlwV8SHzfXokLHRJmPaqP2JBV/6Ym/p8niX1GPuGI
	 yKRIuyeoG95XtmDN5yewIvkr7qt/OLUxQQ4GeZX0cE4V297Fe9NNeiTqXxadm556S+
	 1DCdIbcGLdF+rfLptwqLIeXIfKbFXPlohP6REnqcL53vcXilD3LfA1nqs1qOHRt9WO
	 EflUrYfCP6d/96K8ZY8vFy9U+V+PCkE1wjHEc+EA/lhhkeYIStSooqxWmek+nAzImp
	 qswOtTjvbXwVy/d63ITWI/okmJjFKWMWm5M0w/WMtqws4yv6K+IyhudyGbLE8uHeMd
	 b1zKqUw4ZnlJdLVbfh12dj+PtNQHk43hXimWCCnaYLtRPczDgFYZpTlaABX6vewyP6
	 9sUJGi2E/bWl9e4LzMMkl/8+yL+WeVsoxAdpUzfthmjbAT4MtDA3H40xPEVKtGarbP
	 H77/lZ8e2NG+3Nfq2PQB4+eI=
Date: Tue, 21 Jul 2020 12:54:50 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: always save cve report
Message-ID: <20200721095450.GA25648@localhost>
References: <20200712223828.584-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200712223828.584-1-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This breaks building the SDK in distributions with INHERIT += "cve-check":

$ bitbake tmp-sdk -c populate_sdk
...
NOTE: Tasks Summary: Attempted 2785 tasks of which 2785 didn't need to be rerun and all succeeded.
ERROR: Execution of event handler 'cve_save_summary_handler' failed
Traceback (most recent call last):
  File "/home/bunk/yoctomaster/yocto-tmp/sources/poky/meta/classes/cve-check.bbclass", line 65, in cve_save_summary_handler(e=<bb.event.BuildCompleted object at 0x7fcf4e4bada0>):

    >    shutil.copyfile(cve_tmp_file, cve_summary_file)

  File "/usr/lib/python3.6/shutil.py", line 120, in copyfile(src='/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/cve_check', dst='/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/log/cve/cve-summary-20200721124814.txt', follow_symlinks=True):
         else:
    >        with open(src, 'rb') as fsrc:
                 with open(dst, 'wb') as fdst:
FileNotFoundError: [Errno 2] No such file or directory: '/home/bunk/yoctomaster/yocto-tmp/build_tmp/tmp/cve_check'


Summary: There was 1 ERROR message shown, returning a non-zero exit code.
$

cu
Adrian
