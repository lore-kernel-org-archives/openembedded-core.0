Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 772497F363
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:34:22 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id v17so1558904iol.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 00:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=82XdOem7Xg2CYHGWS/98rJsRm+PVcVMdB21JVp8YTXQ=;
	b=zOaXkhEdR03TDf9bSSOgXqLcq4Y/FfLB3ytRuOeYtLquCiNcehCHkwo/Y8gSstUpRR
	SKTeAIzahtaiCL2ITAm6l7hYO3g7IRrrANZoLSCGcLQ9g9PzuBRKj4erTlCLFU5t5/bE
	3RBF3b6spmofTjKoT6sowJRBao7DGPsjBb3FqgQREagn7aiMiGD6O13Kym0kPQ3AGTyn
	PclrSy5bNvBUddlEOcMyfs6CZQop3LHrrSKZhXURQOxIk4WqaeleJKU+K5uDD7D0+R6u
	Y6lNwM54Ia3Br/mz77EIXYxQEI4lBIDMlGKXOPJUp5D5PCMcBeiAUK/T9t9xurcAg/72
	3pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=82XdOem7Xg2CYHGWS/98rJsRm+PVcVMdB21JVp8YTXQ=;
	b=WV762N+orzzTM0fBcn4x7iWV3M0cAX/YSlPLBegNXWmbX6cicDn4yeZbOFJeTgDKu8
	rRAU6b4u1XKUmYeyDPW+ejnV9z7f+mCnogCZdZ3vvjRFnwmW8NLpuAOLpmrC9yvbaQjV
	T1zJG7xozi9MHjJRBawsOb8Rg51nZADOzMwKABrOH6SxgI4VRAdq5WcRILdzpQ8OMu8S
	EWp23LyCkUK36+aM7JeJeyJ6ERo13DBtsLI69Nn71uUkpPis3C7oNVRbLOThhf+4q7+m
	SUc8miHceBsm2qtGI2mL5U1snzInQST9EO5qgNVCgNnMMfBboej5ZJWNtE9TAFd6afPn
	rcPA==
X-Gm-Message-State: APjAAAUyQPY18TZeMOwp4GR0Et0/O6RsMTMdc/pan5SlHt1zN0sHWbx3
	cf2oJAc2ciWlkv19+pS4CmbwggVRkQWf0lR/laK3p86m9og=
X-Google-Smtp-Source: APXvYqwljI4OwjZ7f7Ph0JXrDE93GEm1bIvYP1B92NaGcXWVWcu843UainLrLKSFSglylQTPlpE3jT0c6bRBuqmNUkw=
X-Received: by 2002:a6b:18c1:: with SMTP id 184mr2267658ioy.40.1573634063293; 
	Wed, 13 Nov 2019 00:34:23 -0800 (PST)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Nov 2019 09:34:12 +0100
Message-ID: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: pthreads should rdepend on libgcc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 08:34:22 -0000
Content-Type: text/plain; charset="UTF-8"

This isn't a patch as I'm not sure how to fix the right way it but it
seems to my that every program that calls pthread_exit() indirectly
rdepends on libgcc_s.so.1 being installed in the system (at least when
using glibc).

This is because the implementation of __pthread_exit() in glibc calls
pthread_cancel() which leads to pthread_cancel_init() being called in
which said shared object is being loaded with dlopen(). When this
fails, the program aborts with the following error message:

    libgcc_s.so.1 must be installed for pthread_cancel to work
    Aborted

A quick way of reproducing it is building a core-image-minimal (which
by default doesn't contain libgcc) with the core python3 package and
running the simple python HTTP server:

    python3 -m http.server 8000

Fetching any file will result in the above crash of the python process
when the thread serving the file exits.

I'm not sure if the same issue is present in musl - the implementation
of __pthread_exit() there is different.

Please advise on how to best approach this.

Thanks in advance,
Bartosz Golaszewski

