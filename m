Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.8034.1614689169173091070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 04:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ETqwbEct;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b18so13237932wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iormyX4zm7a57mDX8dkVgSmXFWOGL5s2yOrsf6kxCtE=;
        b=ETqwbEctyHI3QTxzmJHh8nKd+hJsOnuxQNwueJ694OMTzitSzgaikpQKLUWSOFyf2F
         L5z2OrVVFuCdUhSXoIhpiVUAziRaEo8+rKEWGSnv4Mf4y92FoW5yI/yDDS935rKrXQu7
         GqRg37V05aXK6L+QC/SEe4VeRGwN7quY76v+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iormyX4zm7a57mDX8dkVgSmXFWOGL5s2yOrsf6kxCtE=;
        b=fpommFxM/s2riVsEaly3Z8rhuDB6hu8qlfQemREn8pC6irbjwrPQ+3Wu/lQJA4EcDn
         zy3zn0bhSjHin2HGh3AsBPM9KpT8++XIfX24c9/M/pyzfAOduYyOgP3bat1YCY2Qet86
         VGLPMW0JnQEr+bM9sU4TrGdsAiY9TA+rbL5AErlAtJ7ie1qRJeuj2sxGWBiGt9RMYUOB
         w0oaljXRgNsq24Z+wzEq/kcEOLnea120SpaiWmZeVL+lfX8OWlmlDlj6DUqJcxYbyO+T
         /JH6uMZnG342OWi6aCgq6I3Ad0jYBTYPN+LmUEH5C9892X7p9bGXrGJsPCiospCc+5uB
         xQeg==
X-Gm-Message-State: AOAM532wU3/JT72+DY0FP+9izLboWWgcTb+4dDjHkgKPnhHfGEHzAffR
	asT9DsiuxbU1BLmYH9jmH19Qng==
X-Google-Smtp-Source: ABdhPJxEx6RIZh6/wbY5FyfSXsI9gKFg7i6bIRA+Zm4NtXzgH6KqrvNykzDvzulkE/g3bTPb2FUvCw==
X-Received: by 2002:adf:9148:: with SMTP id j66mr13637825wrj.124.1614689167494;
        Tue, 02 Mar 2021 04:46:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53? ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
        by smtp.gmail.com with ESMTPSA id v188sm2919413wme.1.2021.03.02.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:46:07 -0800 (PST)
Message-ID: <62bb511ffd743e0204b6935e51cb9a72bd08a69d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module enabled build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>, Khem Raj
 <raj.khem@gmail.com>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Mar 2021 12:46:03 +0000
In-Reply-To: <5baa9e0336304fa281deaf975e3f1191@intel.com>
References: <20210224041320.3968776-1-raj.khem@gmail.com>
	 <20210224041320.3968776-3-raj.khem@gmail.com>
	 <5baa9e0336304fa281deaf975e3f1191@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-03-02 at 09:49 +0000, Naveen Saini wrote:
> This is now failing when you are behind a proxy because it's trying to fetch those modules during do_compile().
> https://github.com/golang/example/commit/bcf50bfd7dcd8020c90965747d857ae42802e0c5
> 
> Error log:
> 
> > ERROR: Execution of '~/build/tmp/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/run.do_compile.26031' failed with exit code 1:
> > go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod": dial tcp 216.58.196.49:443: i/o timeout
> > go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod": dial tcp 216.58.196.49:443: i/o timeout

Also,

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1876/steps/14/logs/stdio



2021-03-02 05:12:19,144 - oe-selftest - INFO - ======================================================================
2021-03-02 05:12:19,144 - oe-selftest - INFO - FAIL: gotoolchain.oeGoToolchainSelfTest.test_go_dep_build (subunit.RemotedTestCase)
2021-03-02 05:12:19,144 - oe-selftest - INFO - ----------------------------------------------------------------------
2021-03-02 05:12:19,145 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", line 68, in test_go_dep_build
    retv = self.run_sdk_go_command('build', proj, name)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", line 54, in run_sdk_go_command
    return runCmd(cmd).status
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 210, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'cd /tmp/SDKQAvg7566re/go/src/github.com/direnv/direnv; . /tmp/SDKQAvg7566re/environment-setup-core2-64-poky-linux; export GOPATH=/tmp/SDKQAvg7566re/go; ${CROSS_COMPILE}go build' returned non-zero exit status 1:
go: github.com/BurntSushi/toml@v0.3.1: Get "https://proxy.golang.org/github.com/%21burnt%21sushi/toml/@v/v0.3.1.mod": net/http: TLS handshake timeout


Cheers,

Richard

